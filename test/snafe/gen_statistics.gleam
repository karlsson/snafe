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

/// 
pub fn main() {
  let assert Ok(json_str) = get_json()
  let assert Ok(Nil) = simplifile.write(planned_education_file_path(), json_str)

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
import snafe

fn spec_path() {
  "/planned-educations/v3/api-docs/--v3-active"
}

fn get_json() -> Result(String, Nil) {
  let request =
    request.new()
    |> request.set_host(snafe.api_host())
    |> append_path(spec_path())
    |> request.prepend_header("accept", "application/json")
    |> request.set_body(<<>>)
    |> request.set_method(http.Get)
  case httpc.send_bits(request) {
    Ok(response.Response(200, body:, ..)) -> bit_array.to_string(body)
    _ -> Error(Nil)
  }
}

fn append_path(request, path) {
  request.set_path(request, request.path <> path)
}
