# snafe

[![Package Version](https://img.shields.io/hexpm/v/snafe)](https://hex.pm/packages/snafe)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/snafe/)

OpenAPI clients for Swedish National Agency for Education (Skolverket) Open API.
Current clients are:
 - `units` for School units (skolenheter) and Organizers (huvudmän) information.
 - `statistics` for statistics like national test outcome, quota for students per teacher, certified teachers and planned education events.

Note that the statistics part is not yet implemented due to problems of generating code from the specification.

To use in your project, add to your dependencies section in gleam.toml:
```sh
snafe = { git = "https://github.com/karlsson/snafe", ref="main" }
```
```gleam
import gleam/httpc
import gleam/option.{None}
import gleam/result
import snafe/units
import snafe/units/operations

/// An example of the project in use
pub fn main() -> Nil {
  let request =
    units.base_request("")
    |> operations.get_school_unit_request("68326694", None)
  use response <- result.try(units.handle_errors(httpc.send_bits(request)))
  echo units.handle_errors(operations.get_school_unit_response(response))
}
```

Further documentation can be found at <https://hexdocs.pm/snafe> in the future.

## Development

```sh
git clone https://github.com/karlsson/snafe.git
cd snafe
gleam run -m snafe/gen_units # Generate units schema and operations.
gleam run -m snafe/gen_statistics # Generate statistics schema and operations. 
```
Both operations will download the OpenAPI specifications from Skolverket's site and store them in the priv directory.
The APIs are documented at Skolverket's [site](https://www.skolverket.se/om-oss/oppna-data).