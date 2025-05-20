//// Generate operations and schema files for School statistics
//// from [JSON OpenAPI spec](https://api.skolverket.se/planned-educations/v3/api-docs/--v3-active) at
//// [skolverket](https://api.skolverket.se/planned-educations/swagger-ui/index.html).

import gleam/io
import oas/generator
import simplifile
import snag

fn planned_education_file_path() {
  "priv/planned_educations_openapi.json"
}

pub fn main() {
  // Get the remote json spec if it is in local store
  let assert Ok(Nil) = case simplifile.is_file(planned_education_file_path()) {
    Ok(False) | Error(_) -> {
      let assert Ok(json_str) = get_json()
      simplifile.write(planned_education_file_path(), json_str)
    }
    Ok(True) -> Ok(Nil)
  }

  case
    generator.build(planned_education_file_path(), ".", "snafe/statistics", [])
  {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}

import gleam/bit_array
import gleam/http
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/result
import gleam/string
import snafe/runner

fn spec_path() {
  "/planned-educations/v3/api-docs/--v3-active"
}

fn get_json() -> Result(String, Nil) {
  let request =
    request.new()
    |> request.set_host(runner.api_host())
    |> append_path(spec_path())
    |> request.prepend_header("accept", "application/json")
    |> request.set_body(<<>>)
    |> request.set_method(http.Get)
  case httpc.send_bits(request) {
    Ok(response.Response(200, body:, ..)) -> {
      bit_array.to_string(body)
      |> result.unwrap("")
      // Current Json spec has some faulty "type" : "String"
      |> string.replace("String", "string")
      |> Ok
    }
    _ -> Error(Nil)
  }
}

fn append_path(request, path) {
  request.set_path(request, request.path <> path)
}
