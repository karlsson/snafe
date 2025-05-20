import gleam/bool
import gleam/result
import gleam/dynamic/decode
import gleam/json
import gleam/float
import gleam/int
import gleam/http/response
import gleam/http
import snafe/units/schema
import snafe/units/utils
import gleam/option.{type Option, None}

pub fn get_school_unit_request(base, school_unit_code, search_date search_date) {
  let method = http.Get
  let path = "/v2/school-units/" <> school_unit_code
  let query = [#("search_date", search_date)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_school_unit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.school_unit_info_response_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_school_units_request(
  base,
  organization_number organization_number,
  school_type school_type,
  status status,
  municipality_code municipality_code,
  school_unit_type school_unit_type,
  meta_modified_after meta_modified_after,
) {
  let method = http.Get
  let path = "/v2/school-units"
  let query = [
    #(
      "organization_number",
      option.map(
        organization_number,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "school_type",
      option.map(
        school_type,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "status",
      option.map(status, fn(_) { panic as "query parameter is not supported" }),
    ),
    #(
      "municipality_code",
      option.map(
        municipality_code,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "school_unit_type",
      option.map(
        school_unit_type,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #("meta_modified_after", meta_modified_after)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_school_units_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.school_unit_response_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_organizer_request(base, organization_number, search_date search_date) {
  let method = http.Get
  let path = "/v2/organizers/" <> organization_number
  let query = [#("search_date", search_date)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_organizer_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.organizer_info_response_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_organizers_request(
  base,
  organizer_type organizer_type,
  meta_modified_after meta_modified_after,
) {
  let method = http.Get
  let path = "/v2/organizers"
  let query = [
    #(
      "organizer_type",
      option.map(
        organizer_type,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #("meta_modified_after", meta_modified_after)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_organizers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.organizer_response_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_education_provider_request(
  base,
  education_provider_code,
  search_date search_date,
) {
  let method = http.Get
  let path = "/v2/education-providers/" <> education_provider_code
  let query = [#("search_date", search_date)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_education_provider_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.education_provider_info_response_decoder(),
    ) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_education_providers_request(
  base,
  grading_rights grading_rights,
  meta_modified_after meta_modified_after,
) {
  let method = http.Get
  let path = "/v2/education-providers"
  let query = [
    #("grading_rights", option.map(grading_rights, bool.to_string)),
    #("meta_modified_after", meta_modified_after)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_education_providers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.education_provider_response_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_contract_request(
  base,
  organization_number,
  education_provider_code,
  search_date search_date,
) {
  let method = http.Get
  let path = "/v2/contracts/" <> organization_number <> "/" <> education_provider_code
  let query = [#("search_date", search_date)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_contract_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.contract_info_response_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_contracts_request(
  base,
  organizer_organization_number organizer_organization_number,
  education_provider_organization_number education_provider_organization_number,
  meta_modified_after meta_modified_after,
) {
  let method = http.Get
  let path = "/v2/contracts"
  let query = [
    #("organizer_organization_number", organizer_organization_number),
    #(
      "education_provider_organization_number",
      education_provider_organization_number,
    ),
    #("meta_modified_after", meta_modified_after)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_contracts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.contract_response_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_api_info_request(base) {
  let method = http.Get
  let path = "/v2/api-info"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_api_info_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.api_info_response_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.errors_decoder()) |> result.map(Error)
  }
}
