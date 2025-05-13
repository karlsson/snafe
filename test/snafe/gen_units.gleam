//// Generate operations and schema files for School Units from YAML OpenAPI
//// [spec](https://api.skolverket.se/skolenhetsregistret/skolenhetsregistret_v2_openapi.yaml)
//// at [skolverket](https://api.skolverket.se/skolenhetsregistret/swagger-ui/index.html).

import cymbal.{type Yaml}
import glam/doc.{type Document}
import gleam/bool
import gleam/float
import gleam/int
import gleam/io
import gleam/list
import gleam/string
import oas/generator
import simplifile
import snafe
import snag

fn spec_name() {
  "skolenhetsregistret_v2_openapi"
}

fn json_file_path() {
  "priv/" <> spec_name() <> ".json"
}

/// 
pub fn main() {
  let assert Ok(data) = get_yaml()
  let assert Ok(yaml_decoded) = cymbal.decode(data)
  let glam_json_doc = yaml_to_json_doc(yaml_decoded)

  let json_str = doc.to_string(glam_json_doc, 80)
  let assert Ok(Nil) = simplifile.write(json_file_path(), json_str)

  case generator.build(json_file_path(), ".", "snafe/units", []) {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}

// --- Using gleam/json as alternative
// fn yaml_to_json(y: Yaml) -> Json {
//   case y {
//     cymbal.Block(props) -> json.object(list.map(props, block_to_json))
//     cymbal.Array(ys) -> json.preprocessed_array(list.map(ys, yaml_to_json))
//     cymbal.Bool(y) -> json.bool(y)
//     cymbal.String(y) -> json.string(y)
//     cymbal.Int(y) -> json.int(y)
//     cymbal.Float(y) -> json.float(y)
//     cymbal.Null -> json.null()
//   }
// }

// fn block_to_json(prop) {
//   let #(name, y) = prop
//   #(name, yaml_to_json(y))
// }
import gleam/bit_array
import gleam/http
import gleam/http/request
import gleam/http/response
import gleam/httpc
import snafe/units/utils

fn get_yaml() -> Result(String, Nil) {
  let request =
    request.new()
    |> request.set_host(snafe.api_host())
    |> utils.append_path("/skolenhetsregistret/" <> spec_name() <> ".yaml")
    |> request.prepend_header("accept", "text/plain")
    |> request.set_body(<<>>)
    |> utils.set_method(http.Get)

  case httpc.send_bits(request) {
    Ok(response.Response(200, body:, ..)) -> bit_array.to_string(body)
    _ -> Error(Nil)
  }
}

// ------------------------------------------------
/// These functions are from
/// [glam tutorials](https://github.com/giacomocavalieri/glam/blob/main/tutorials/pretty_printing_JSON.md)
fn yaml_to_json_doc(yaml: Yaml) -> Document {
  case yaml {
    cymbal.String(string) -> doc.from_string("\"" <> string <> "\"")
    cymbal.Int(number) -> doc.from_string(int.to_string(number))
    cymbal.Float(number) -> doc.from_string(float.to_string(number))
    cymbal.Bool(bool) -> bool_to_doc(bool)
    cymbal.Null -> doc.from_string("null")
    cymbal.Array(objects) -> array_to_doc(objects)
    cymbal.Block(fields) -> object_to_doc(fields)
  }
}

fn bool_to_doc(bool: Bool) -> Document {
  bool.to_string(bool)
  |> string.lowercase
  |> doc.from_string
}

fn array_to_doc(objects: List(Yaml)) -> Document {
  list.map(objects, yaml_to_json_doc)
  |> doc.concat_join(with: [comma(), doc.space])
  |> parenthesise("[", "]")
}

fn object_to_doc(fields: List(#(String, Yaml))) -> Document {
  list.map(fields, field_to_doc)
  |> doc.concat_join(with: [comma(), doc.space])
  |> parenthesise("{", "}")
}

fn parenthesise(doc: Document, open: String, close: String) -> Document {
  doc
  |> doc.prepend_docs([doc.from_string(open), doc.space])
  |> doc.nest(by: 2)
  |> doc.append_docs([doc.space, doc.from_string(close)])
  |> doc.group
}

fn field_to_doc(field: #(String, Yaml)) -> Document {
  let #(name, value) = field
  let name_doc = doc.from_string("\"" <> name <> "\"")
  let value_doc = yaml_to_json_doc(value)
  [name_doc, colon(), doc.from_string(" "), value_doc]
  |> doc.concat
}

fn colon() -> Document {
  doc.from_string(":")
}

fn comma() -> Document {
  doc.from_string(",")
}
