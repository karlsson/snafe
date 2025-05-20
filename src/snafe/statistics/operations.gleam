import gleam/bool
import gleam/dynamic/decode
import gleam/float
import gleam/http
import gleam/http/response
import gleam/int
import gleam/json
import gleam/option.{type Option, None}
import gleam/result
import snafe/statistics/schema
import snafe/statistics/utils

pub fn get_national_compulsory_average_request(base) {
  let method = http.Get
  let path = "/v3/statistics/national-values/gr"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_national_compulsory_average_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_pupils_compulsory_school_unit_surveys_by_school_unit_code_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/surveys/pupilsgr"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_pupils_compulsory_school_unit_surveys_by_school_unit_code_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_compulsory_school_unit_for_disabled_statistics_by_code_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/statistics/gran"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_compulsory_school_unit_for_disabled_statistics_by_code_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_all_school_units_compact_request(
  base,
  type_of_schooling type_of_schooling,
  latitude latitude,
  longitude longitude,
  distance distance,
  coordinate_system_type coordinate_system_type,
  sort sort,
  page page,
  size size,
) {
  let method = http.Get
  let path = "/v3/compact-school-units"
  let query = [
    #("type_of_schooling", type_of_schooling),
    #("latitude", latitude),
    #("longitude", longitude),
    #("distance", distance),
    #("coordinate_system_type", coordinate_system_type),
    #("sort", sort),
    #("page", option.map(page, int.to_string)),
    #("size", option.map(size, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_all_school_units_compact_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_all_study_paths_compact_per_unit_request(
  base,
  school_unit_code,
  type_of_schooling type_of_schooling,
  sort sort,
  page page,
  size size,
) {
  let method = http.Get
  let path =
    "/v3/school-units/" <> school_unit_code <> "/compact-education-events"
  let query = [
    #("type_of_schooling", type_of_schooling),
    #("sort", sort),
    #("page", option.map(page, int.to_string)),
    #("size", option.map(size, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_all_study_paths_compact_per_unit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_apiinfo_request(base) {
  let method = http.Get
  let path = "/v3/api-info"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_apiinfo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.api_info_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_salsa_statistics_for_compulsory_school_unit_by_id_request(
  base,
  school_unit_id,
) {
  let method = http.Get
  let path = "/v3/statistics/all-schools/salsa/" <> school_unit_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_salsa_statistics_for_compulsory_school_unit_by_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_custodians_pre_school_class_surveys_by_school_unit_code_1_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path =
    "/v3/school-units/" <> school_unit_code <> "/nestedsurveys/custodiansfsk"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_custodians_pre_school_class_surveys_by_school_unit_code_1_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_national_secondary_for_disabled_average_request(base) {
  let method = http.Get
  let path = "/v3/statistics/national-values/gyan"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_national_secondary_for_disabled_average_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_school_unit_stats_by_code_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/statistics"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_school_unit_stats_by_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_document_by_school_unit_code_and_type_of_schooling_request(
  base,
  school_unit_code,
  type_of_schooling,
) {
  let method = http.Get
  let path =
    "/v3/school-units/"
    <> school_unit_code
    <> "/documents/"
    <> type_of_schooling
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_document_by_school_unit_code_and_type_of_schooling_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_national_average_for_program_request(base, program_code) {
  let method = http.Get
  let path = "/v3/statistics/national-values/gy/" <> program_code
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_national_average_for_program_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_school_unit_surveys_by_code_1_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/nestedsurveys"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_school_unit_surveys_by_code_1_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_pupils_secondary_school_unit_surveys_by_school_unit_code_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/surveys/pupilsgy"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_pupils_secondary_school_unit_surveys_by_school_unit_code_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_by_school_unit_code_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/education-events"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_by_school_unit_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path =
    "/v3/school-units/" <> school_unit_code <> "/surveys/custodiansgran"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_distance_studies_request(base) {
  let method = http.Get
  let path = "/v3/support/distance-studies"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_distance_studies_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_by_id_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_by_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_all_1_request(
  base,
  town town,
  execution_condition execution_condition,
  geographical_area_code geographical_area_code,
  search_term search_term,
  instruction_languages instruction_languages,
  direction_ids direction_ids,
  type_of_school type_of_school,
  pace_of_study pace_of_study,
  semester_start_from semester_start_from,
  county county,
  municipality municipality,
  distance distance,
  recommended_prior_knowledge recommended_prior_knowledge,
  sort sort,
  page page,
  size size,
) {
  let method = http.Get
  let path = "/v3/adult-education-events"
  let query = [
    #("town", town),
    #("execution_condition", execution_condition),
    #("geographical_area_code", geographical_area_code),
    #("search_term", search_term),
    #("instruction_languages", instruction_languages),
    #("direction_ids", direction_ids),
    #("type_of_school", type_of_school),
    #("pace_of_study", pace_of_study),
    #("semester_start_from", semester_start_from),
    #("county", county),
    #("municipality", municipality),
    #("distance", distance),
    #("recommended_prior_knowledge", recommended_prior_knowledge),
    #("sort", sort),
    #("page", option.map(page, int.to_string)),
    #("size", option.map(size, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_all_1_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_document_by_school_unit_code_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/documents"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_document_by_school_unit_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_by_study_path_code_and_school_unit_code_request(
  base,
  school_unit_code,
  study_path_code,
) {
  let method = http.Get
  let path =
    "/v3/school-units/"
    <> school_unit_code
    <> "/education-events/"
    <> study_path_code
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_by_study_path_code_and_school_unit_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_all_request(
  base,
  name name,
  type_of_schooling type_of_schooling,
  principal_organizer_type principal_organizer_type,
  geographical_area_code geographical_area_code,
  school_years school_years,
  latitude latitude,
  longitude longitude,
  distance distance,
  coordinate_system_type coordinate_system_type,
  sort sort,
  page page,
  size size,
) {
  let method = http.Get
  let path = "/v3/school-units"
  let query = [
    #("name", name),
    #("type_of_schooling", type_of_schooling),
    #("principal_organizer_type", principal_organizer_type),
    #("geographical_area_code", geographical_area_code),
    #("school_years", school_years),
    #("latitude", latitude),
    #("longitude", longitude),
    #("distance", distance),
    #("coordinate_system_type", coordinate_system_type),
    #("sort", sort),
    #("page", option.map(page, int.to_string)),
    #("size", option.map(size, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_all_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_national_compulsory_for_disabled_average_request(base) {
  let method = http.Get
  let path = "/v3/statistics/national-values/gran"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_national_compulsory_for_disabled_average_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_school_unit_surveys_by_code_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/surveys"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_school_unit_surveys_by_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_custodians_compulsory_school_unit_surveys_by_school_unit_code_1_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path =
    "/v3/school-units/" <> school_unit_code <> "/nestedsurveys/custodiansgr"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_custodians_compulsory_school_unit_surveys_by_school_unit_code_1_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_all_study_paths_compact_request(
  base,
  type_of_schooling type_of_schooling,
  latitude latitude,
  longitude longitude,
  distance distance,
  coordinate_system_type coordinate_system_type,
  sort sort,
  page page,
  size size,
) {
  let method = http.Get
  let path = "/v3/compact-education-events"
  let query = [
    #("type_of_schooling", type_of_schooling),
    #("latitude", latitude),
    #("longitude", longitude),
    #("distance", distance),
    #("coordinate_system_type", coordinate_system_type),
    #("sort", sort),
    #("page", option.map(page, int.to_string)),
    #("size", option.map(size, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_all_study_paths_compact_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_vux_type_of_schooling_request(base) {
  let method = http.Get
  let path = "/v3/support/adultTypeOfSchooling"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_vux_type_of_schooling_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_compulsory_school_unit_stats_by_code_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/statistics/gr"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_compulsory_school_unit_stats_by_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_pre_school_class_school_unit_statistics_by_id_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/statistics/fsk"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_pre_school_class_school_unit_statistics_by_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_school_units_and_geographical_areas_request(base) {
  let method = http.Get
  let path = "/v3/support/municipality-schoolunit"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_school_units_and_geographical_areas_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_instruction_languages_request(base) {
  let method = http.Get
  let path = "/v3/support/instruction-languages"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_instruction_languages_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_by_id_1_request(base, id) {
  let method = http.Get
  let path = "/v3/adult-education-events/" <> id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_by_id_1_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_principal_organizer_types_request(base) {
  let method = http.Get
  let path = "/v3/support/principal-organizer-types"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_principal_organizer_types_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_school_types_request(base) {
  let method = http.Get
  let path = "/v3/support/school-types"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_school_types_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_custodians_pre_school_class_surveys_by_school_unit_code_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/surveys/custodiansfsk"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_custodians_pre_school_class_surveys_by_school_unit_code_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_students_request(base, data) {
  let method = http.Post
  let path = "/v3/school-unit-secondary"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn get_students_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_distance_to_school_unit_request(
  base,
  school_unit_code,
  latitude latitude,
  longitude longitude,
  coordinate_system_type coordinate_system_type,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/distanceFrom"
  let query = [
    #("latitude", option.Some(latitude)),
    #("longitude", option.Some(longitude)),
    #("coordinate_system_type", coordinate_system_type),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_distance_to_school_unit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_1_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path =
    "/v3/school-units/" <> school_unit_code <> "/nestedsurveys/custodiansgran"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_1_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_areas_request(base) {
  let method = http.Get
  let path = "/v3/adult-education-events/areas"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_areas_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_salsa_statistics_for_all_compulsory_school_units_request(base) {
  let method = http.Get
  let path = "/v3/statistics/all-schools/salsa"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_salsa_statistics_for_all_compulsory_school_units_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_national_pre_school_class_average_request(base) {
  let method = http.Get
  let path = "/v3/statistics/national-values/fsk"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_national_pre_school_class_average_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_all_study_paths_request(
  base,
  name name,
  study_path_code study_path_code,
  principal_organizer_type principal_organizer_type,
  school_orientation school_orientation,
  geographical_area_code geographical_area_code,
  type_of_schooling type_of_schooling,
  latitude latitude,
  longitude longitude,
  distance distance,
  sort sort,
  page page,
  size size,
) {
  let method = http.Get
  let path = "/v3/education-events"
  let query = [
    #("name", name),
    #("study_path_code", study_path_code),
    #("principal_organizer_type", principal_organizer_type),
    #("school_orientation", school_orientation),
    #("geographical_area_code", geographical_area_code),
    #("type_of_schooling", type_of_schooling),
    #("latitude", latitude),
    #("longitude", longitude),
    #("distance", distance),
    #("sort", sort),
    #("page", option.map(page, int.to_string)),
    #("size", option.map(size, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_all_study_paths_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_secondary_school_unit_for_disabled_statistics_by_code_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/statistics/gyan"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_secondary_school_unit_for_disabled_statistics_by_code_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_geographical_areas_request(base) {
  let method = http.Get
  let path = "/v3/support/geographical-areas"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_geographical_areas_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_programs_and_orientations_request(base) {
  let method = http.Get
  let path = "/v3/support/programs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_programs_and_orientations_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_secondary_school_unit_stats_by_code_request(base, school_unit_code) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/statistics/gy"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_secondary_school_unit_stats_by_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_pupils_secondary_school_unit_surveys_by_school_unit_code_1_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path =
    "/v3/school-units/" <> school_unit_code <> "/nestedsurveys/pupilsgy"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_pupils_secondary_school_unit_surveys_by_school_unit_code_1_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn get_custodians_compulsory_school_unit_surveys_by_school_unit_code_request(
  base,
  school_unit_code,
) {
  let method = http.Get
  let path = "/v3/school-units/" <> school_unit_code <> "/surveys/custodiansgr"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_custodians_compulsory_school_unit_surveys_by_school_unit_code_response(
  response,
) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.api_response_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}
