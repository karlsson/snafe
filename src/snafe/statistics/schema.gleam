import gleam/dynamic
import gleam/dynamic/decode
import gleam/json
import gleam/option.{type Option, None}
import snafe/statistics/utils

pub type ApiInfo {
  ApiInfo(
    api_documentation: Option(String),
    api_name: Option(String),
    api_released: Option(String),
    api_status: Option(String),
    api_version: Option(String),
    links: Option(List(Link)),
  )
}

pub type ApiResponse {
  ApiResponse(
    body: Option(Nil),
    links: Option(List(Link)),
    message: Option(String),
    status: Option(String),
  )
}

pub type Link {
  Link(
    deprecation: Option(String),
    href: Option(String),
    hreflang: Option(String),
    media: Option(String),
    name: Option(String),
    profile: Option(String),
    rel: Option(String),
    title: Option(String),
    type_: Option(String),
  )
}

pub type SchoolUnitProgram {
  SchoolUnitProgram(
    school_unit_code: Option(String),
    study_path_code: Option(String),
    type_of_schooling: Option(String),
  )
}

pub fn school_unit_program_decoder() {
  use school_unit_code <- decode.optional_field(
    "schoolUnitCode",
    None,
    decode.optional(decode.string),
  )
  use study_path_code <- decode.optional_field(
    "studyPathCode",
    None,
    decode.optional(decode.string),
  )
  use type_of_schooling <- decode.optional_field(
    "typeOfSchooling",
    None,
    decode.optional(decode.string),
  )
  decode.success(SchoolUnitProgram(
    school_unit_code: school_unit_code,
    study_path_code: study_path_code,
    type_of_schooling: type_of_schooling,
  ))
}

pub fn school_unit_program_encode(data: SchoolUnitProgram) {
  json.object([
    #("schoolUnitCode", json.nullable(data.school_unit_code, json.string)),
    #("studyPathCode", json.nullable(data.study_path_code, json.string)),
    #("typeOfSchooling", json.nullable(data.type_of_schooling, json.string)),
  ])
}

pub fn link_decoder() {
  use deprecation <- decode.optional_field(
    "deprecation",
    None,
    decode.optional(decode.string),
  )
  use href <- decode.optional_field(
    "href",
    None,
    decode.optional(decode.string),
  )
  use hreflang <- decode.optional_field(
    "hreflang",
    None,
    decode.optional(decode.string),
  )
  use media <- decode.optional_field(
    "media",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field(
    "name",
    None,
    decode.optional(decode.string),
  )
  use profile <- decode.optional_field(
    "profile",
    None,
    decode.optional(decode.string),
  )
  use rel <- decode.optional_field("rel", None, decode.optional(decode.string))
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(Link(
    deprecation: deprecation,
    href: href,
    hreflang: hreflang,
    media: media,
    name: name,
    profile: profile,
    rel: rel,
    title: title,
    type_: type_,
  ))
}

pub fn link_encode(data: Link) {
  json.object([
    #("deprecation", json.nullable(data.deprecation, json.string)),
    #("href", json.nullable(data.href, json.string)),
    #("hreflang", json.nullable(data.hreflang, json.string)),
    #("media", json.nullable(data.media, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("profile", json.nullable(data.profile, json.string)),
    #("rel", json.nullable(data.rel, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn api_response_decoder() {
  use body <- decode.optional_field(
    "body",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(decode.list(link_decoder())),
  )
  use message <- decode.optional_field(
    "message",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  decode.success(ApiResponse(
    body: body,
    links: links,
    message: message,
    status: status,
  ))
}

pub fn api_response_encode(data: ApiResponse) {
  json.object([
    #(
      "body",
      json.nullable(data.body, fn(_) { panic as "Literal object inside field" }),
    ),
    #("links", json.nullable(data.links, json.array(_, link_encode))),
    #("message", json.nullable(data.message, json.string)),
    #("status", json.nullable(data.status, json.string)),
  ])
}

pub fn api_info_decoder() {
  use api_documentation <- decode.optional_field(
    "apiDocumentation",
    None,
    decode.optional(decode.string),
  )
  use api_name <- decode.optional_field(
    "apiName",
    None,
    decode.optional(decode.string),
  )
  use api_released <- decode.optional_field(
    "apiReleased",
    None,
    decode.optional(decode.string),
  )
  use api_status <- decode.optional_field(
    "apiStatus",
    None,
    decode.optional(decode.string),
  )
  use api_version <- decode.optional_field(
    "apiVersion",
    None,
    decode.optional(decode.string),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(decode.list(link_decoder())),
  )
  decode.success(ApiInfo(
    api_documentation: api_documentation,
    api_name: api_name,
    api_released: api_released,
    api_status: api_status,
    api_version: api_version,
    links: links,
  ))
}

pub fn api_info_encode(data: ApiInfo) {
  json.object([
    #("apiDocumentation", json.nullable(data.api_documentation, json.string)),
    #("apiName", json.nullable(data.api_name, json.string)),
    #("apiReleased", json.nullable(data.api_released, json.string)),
    #("apiStatus", json.nullable(data.api_status, json.string)),
    #("apiVersion", json.nullable(data.api_version, json.string)),
    #("links", json.nullable(data.links, json.array(_, link_encode))),
  ])
}
