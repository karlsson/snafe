import gleam/httpc
import gleam/option.{None}
import gleam/result
import snafe/units
import snafe/units/operations

/// Skolverkets server hosting their open API services.
pub fn api_host() -> String {
  "api.skolverket.se"
}

/// Example of requesting data for a School unit
pub fn main() {
  let request =
    units.base_request("")
    |> operations.get_school_unit_request("68326694", None)
  use response <- result.try(units.handle_errors(httpc.send_bits(request)))
  echo units.handle_errors(operations.get_school_unit_response(response))
}
