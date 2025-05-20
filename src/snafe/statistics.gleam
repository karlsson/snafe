import gleam/http/request
import midas/task as t
import snafe/runner
import snafe/statistics/operations
import snafe/statistics/utils

fn base_request(_token) {
  request.new()
  |> request.set_host(runner.api_host())
  |> utils.append_path("/planned-educations/")
  |> request.prepend_header(
    "accept",
    "application/vnd.skolverket.plannededucations.api.v3.hal+json",
  )
  |> request.set_body(<<>>)
}

fn handle_errors(response) {
  runner.handle_errors(response)
}

// GENERATED -------------

pub fn get_national_compulsory_average(token) {
  let request = base_request(token)
  let request = operations.get_national_compulsory_average_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_national_compulsory_average_response(response)),
  )
  t.Done(data)
}

pub fn get_pupils_compulsory_school_unit_surveys_by_school_unit_code(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_pupils_compulsory_school_unit_surveys_by_school_unit_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_pupils_compulsory_school_unit_surveys_by_school_unit_code_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_compulsory_school_unit_for_disabled_statistics_by_code(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_compulsory_school_unit_for_disabled_statistics_by_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_compulsory_school_unit_for_disabled_statistics_by_code_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_all_school_units_compact(
  token,
  type_of_schooling type_of_schooling,
  latitude latitude,
  longitude longitude,
  distance distance,
  coordinate_system_type coordinate_system_type,
  sort sort,
  page page,
  size size,
) {
  let request = base_request(token)
  let request =
    operations.get_all_school_units_compact_request(
      request,
      type_of_schooling,
      latitude,
      longitude,
      distance,
      coordinate_system_type,
      sort,
      page,
      size,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_all_school_units_compact_response(response)),
  )
  t.Done(data)
}

pub fn get_all_study_paths_compact_per_unit(
  token,
  school_unit_code,
  type_of_schooling type_of_schooling,
  sort sort,
  page page,
  size size,
) {
  let request = base_request(token)
  let request =
    operations.get_all_study_paths_compact_per_unit_request(
      request,
      school_unit_code,
      type_of_schooling,
      sort,
      page,
      size,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_all_study_paths_compact_per_unit_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_apiinfo(token) {
  let request = base_request(token)
  let request = operations.get_apiinfo_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_apiinfo_response(response)))
  t.Done(data)
}

pub fn get_salsa_statistics_for_compulsory_school_unit_by_id(
  token,
  school_unit_id,
) {
  let request = base_request(token)
  let request =
    operations.get_salsa_statistics_for_compulsory_school_unit_by_id_request(
      request,
      school_unit_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_salsa_statistics_for_compulsory_school_unit_by_id_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_custodians_pre_school_class_surveys_by_school_unit_code_1(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_custodians_pre_school_class_surveys_by_school_unit_code_1_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_custodians_pre_school_class_surveys_by_school_unit_code_1_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_national_secondary_for_disabled_average(token) {
  let request = base_request(token)
  let request =
    operations.get_national_secondary_for_disabled_average_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_national_secondary_for_disabled_average_response(response),
    ),
  )
  t.Done(data)
}

pub fn get_school_unit_stats_by_code(token, school_unit_code) {
  let request = base_request(token)
  let request =
    operations.get_school_unit_stats_by_code_request(request, school_unit_code)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_school_unit_stats_by_code_response(response)),
  )
  t.Done(data)
}

pub fn get_document_by_school_unit_code_and_type_of_schooling(
  token,
  school_unit_code,
  type_of_schooling,
) {
  let request = base_request(token)
  let request =
    operations.get_document_by_school_unit_code_and_type_of_schooling_request(
      request,
      school_unit_code,
      type_of_schooling,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_document_by_school_unit_code_and_type_of_schooling_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_national_average_for_program(token, program_code) {
  let request = base_request(token)
  let request =
    operations.get_national_average_for_program_request(request, program_code)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_national_average_for_program_response(response)),
  )
  t.Done(data)
}

pub fn get_school_unit_surveys_by_code_1(token, school_unit_code) {
  let request = base_request(token)
  let request =
    operations.get_school_unit_surveys_by_code_1_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_school_unit_surveys_by_code_1_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_pupils_secondary_school_unit_surveys_by_school_unit_code(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_pupils_secondary_school_unit_surveys_by_school_unit_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_pupils_secondary_school_unit_surveys_by_school_unit_code_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_by_school_unit_code(token, school_unit_code) {
  let request = base_request(token)
  let request =
    operations.get_by_school_unit_code_request(request, school_unit_code)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_by_school_unit_code_response(response)),
  )
  t.Done(data)
}

pub fn get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn list_distance_studies(token) {
  let request = base_request(token)
  let request = operations.list_distance_studies_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_distance_studies_response(response)),
  )
  t.Done(data)
}

pub fn get_by_id(token, school_unit_code) {
  let request = base_request(token)
  let request = operations.get_by_id_request(request, school_unit_code)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_by_id_response(response)))
  t.Done(data)
}

pub fn get_all_1(
  token,
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
  let request = base_request(token)
  let request =
    operations.get_all_1_request(
      request,
      town,
      execution_condition,
      geographical_area_code,
      search_term,
      instruction_languages,
      direction_ids,
      type_of_school,
      pace_of_study,
      semester_start_from,
      county,
      municipality,
      distance,
      recommended_prior_knowledge,
      sort,
      page,
      size,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_all_1_response(response)))
  t.Done(data)
}

pub fn get_document_by_school_unit_code(token, school_unit_code) {
  let request = base_request(token)
  let request =
    operations.get_document_by_school_unit_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_document_by_school_unit_code_response(response)),
  )
  t.Done(data)
}

pub fn get_by_study_path_code_and_school_unit_code(
  token,
  school_unit_code,
  study_path_code,
) {
  let request = base_request(token)
  let request =
    operations.get_by_study_path_code_and_school_unit_code_request(
      request,
      school_unit_code,
      study_path_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_by_study_path_code_and_school_unit_code_response(response),
    ),
  )
  t.Done(data)
}

pub fn get_all(
  token,
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
  let request = base_request(token)
  let request =
    operations.get_all_request(
      request,
      name,
      type_of_schooling,
      principal_organizer_type,
      geographical_area_code,
      school_years,
      latitude,
      longitude,
      distance,
      coordinate_system_type,
      sort,
      page,
      size,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_all_response(response)))
  t.Done(data)
}

pub fn get_national_compulsory_for_disabled_average(token) {
  let request = base_request(token)
  let request =
    operations.get_national_compulsory_for_disabled_average_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_national_compulsory_for_disabled_average_response(response),
    ),
  )
  t.Done(data)
}

pub fn get_school_unit_surveys_by_code(token, school_unit_code) {
  let request = base_request(token)
  let request =
    operations.get_school_unit_surveys_by_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_school_unit_surveys_by_code_response(response)),
  )
  t.Done(data)
}

pub fn get_custodians_compulsory_school_unit_surveys_by_school_unit_code_1(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_custodians_compulsory_school_unit_surveys_by_school_unit_code_1_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_custodians_compulsory_school_unit_surveys_by_school_unit_code_1_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_all_study_paths_compact(
  token,
  type_of_schooling type_of_schooling,
  latitude latitude,
  longitude longitude,
  distance distance,
  coordinate_system_type coordinate_system_type,
  sort sort,
  page page,
  size size,
) {
  let request = base_request(token)
  let request =
    operations.get_all_study_paths_compact_request(
      request,
      type_of_schooling,
      latitude,
      longitude,
      distance,
      coordinate_system_type,
      sort,
      page,
      size,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_all_study_paths_compact_response(response)),
  )
  t.Done(data)
}

pub fn list_vux_type_of_schooling(token) {
  let request = base_request(token)
  let request = operations.list_vux_type_of_schooling_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_vux_type_of_schooling_response(response)),
  )
  t.Done(data)
}

pub fn get_compulsory_school_unit_stats_by_code(token, school_unit_code) {
  let request = base_request(token)
  let request =
    operations.get_compulsory_school_unit_stats_by_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_compulsory_school_unit_stats_by_code_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_pre_school_class_school_unit_statistics_by_id(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_pre_school_class_school_unit_statistics_by_id_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_pre_school_class_school_unit_statistics_by_id_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_school_units_and_geographical_areas(token) {
  let request = base_request(token)
  let request =
    operations.get_school_units_and_geographical_areas_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_school_units_and_geographical_areas_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn list_instruction_languages(token) {
  let request = base_request(token)
  let request = operations.list_instruction_languages_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_instruction_languages_response(response)),
  )
  t.Done(data)
}

pub fn get_by_id_1(token, id) {
  let request = base_request(token)
  let request = operations.get_by_id_1_request(request, id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_by_id_1_response(response)))
  t.Done(data)
}

pub fn list_principal_organizer_types(token) {
  let request = base_request(token)
  let request = operations.list_principal_organizer_types_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_principal_organizer_types_response(response)),
  )
  t.Done(data)
}

pub fn list_school_types(token) {
  let request = base_request(token)
  let request = operations.list_school_types_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_school_types_response(response)),
  )
  t.Done(data)
}

pub fn get_custodians_pre_school_class_surveys_by_school_unit_code(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_custodians_pre_school_class_surveys_by_school_unit_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_custodians_pre_school_class_surveys_by_school_unit_code_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_students(token, data) {
  let request = base_request(token)
  let request = operations.get_students_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_students_response(response)))
  t.Done(data)
}

pub fn get_distance_to_school_unit(
  token,
  school_unit_code,
  latitude latitude,
  longitude longitude,
  coordinate_system_type coordinate_system_type,
) {
  let request = base_request(token)
  let request =
    operations.get_distance_to_school_unit_request(
      request,
      school_unit_code,
      latitude,
      longitude,
      coordinate_system_type,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_distance_to_school_unit_response(response)),
  )
  t.Done(data)
}

pub fn get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_1(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_1_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_custodians_compulsory_school_for_disabled_unit_surveys_by_school_unit_code_1_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_areas(token) {
  let request = base_request(token)
  let request = operations.get_areas_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_areas_response(response)))
  t.Done(data)
}

pub fn get_salsa_statistics_for_all_compulsory_school_units(token) {
  let request = base_request(token)
  let request =
    operations.get_salsa_statistics_for_all_compulsory_school_units_request(
      request,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_salsa_statistics_for_all_compulsory_school_units_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_national_pre_school_class_average(token) {
  let request = base_request(token)
  let request =
    operations.get_national_pre_school_class_average_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_national_pre_school_class_average_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_all_study_paths(
  token,
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
  let request = base_request(token)
  let request =
    operations.get_all_study_paths_request(
      request,
      name,
      study_path_code,
      principal_organizer_type,
      school_orientation,
      geographical_area_code,
      type_of_schooling,
      latitude,
      longitude,
      distance,
      sort,
      page,
      size,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_all_study_paths_response(response)),
  )
  t.Done(data)
}

pub fn get_secondary_school_unit_for_disabled_statistics_by_code(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_secondary_school_unit_for_disabled_statistics_by_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_secondary_school_unit_for_disabled_statistics_by_code_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn list_geographical_areas(token) {
  let request = base_request(token)
  let request = operations.list_geographical_areas_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_geographical_areas_response(response)),
  )
  t.Done(data)
}

pub fn list_programs_and_orientations(token) {
  let request = base_request(token)
  let request = operations.list_programs_and_orientations_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_programs_and_orientations_response(response)),
  )
  t.Done(data)
}

pub fn get_secondary_school_unit_stats_by_code(token, school_unit_code) {
  let request = base_request(token)
  let request =
    operations.get_secondary_school_unit_stats_by_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_secondary_school_unit_stats_by_code_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_pupils_secondary_school_unit_surveys_by_school_unit_code_1(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_pupils_secondary_school_unit_surveys_by_school_unit_code_1_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_pupils_secondary_school_unit_surveys_by_school_unit_code_1_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn get_custodians_compulsory_school_unit_surveys_by_school_unit_code(
  token,
  school_unit_code,
) {
  let request = base_request(token)
  let request =
    operations.get_custodians_compulsory_school_unit_surveys_by_school_unit_code_request(
      request,
      school_unit_code,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.get_custodians_compulsory_school_unit_surveys_by_school_unit_code_response(
        response,
      ),
    ),
  )
  t.Done(data)
}
