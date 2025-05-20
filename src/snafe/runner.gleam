//// Utility functions for running midas tasks

import gleam/http/response.{type Response}
import gleam/httpc
import gleam/string
import midas/task as t
import snag

/// Skolverkets server hosting their open API services.
pub fn api_host() -> String {
  "api.skolverket.se"
}

pub fn handle_errors(response) {
  case response {
    Ok(response1) -> Ok(response1)
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode")
      |> Error
  }
}

/// Will return t.Done upon success
pub fn run(task: t.Effect(a)) -> t.Effect(a) {
  case task {
    t.Fetch(request, resume) ->
      resume(map_http_response(httpc.send_bits(request)))
    a ->
      t.Abort(
        snag.new(string.inspect(a))
        |> snag.layer("This effect is not handled in this environment"),
      )
  }
}

fn map_http_response(
  response: Result(Response(BitArray), httpc.HttpError),
) -> Result(Response(BitArray), t.FetchError) {
  case response {
    Ok(response) -> Ok(response)
    Error(httpc.InvalidUtf8Response) -> Error(t.UnableToReadBody)
    Error(httpc.FailedToConnect(..)) ->
      Error(t.NetworkError("Failed to connect"))
  }
}
