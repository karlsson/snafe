//// Get data from the School Unit Registry
//// Information about School Units, Organizers (Huvudmän)

import gleam/http/request
import midas/task as t
import snafe/runner
import snafe/units/operations
import snafe/units/utils

/// Create the basic request url and accept header
fn base_request(_token) {
  request.new()
  |> request.set_host(runner.api_host())
  |> utils.append_path("/skolenhetsregistret")
  |> request.prepend_header("accept", "application/json")
  |> request.set_body(<<>>)
}

fn handle_errors(response) {
  runner.handle_errors(response)
}

// GENERATED -------------

pub fn get_school_unit(token, school_unit_code, search_date search_date) {
  let request = base_request(token)
  let request = operations.get_school_unit_request(
    request,
    school_unit_code,
    search_date,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_school_unit_response(response)))
  t.Done(data)
}

pub fn get_school_units(
  token,
  organization_number organization_number,
  school_type school_type,
  status status,
  municipality_code municipality_code,
  school_unit_type school_unit_type,
  meta_modified_after meta_modified_after,
) {
  let request = base_request(token)
  let request = operations.get_school_units_request(
    request,
    organization_number,
    school_type,
    status,
    municipality_code,
    school_unit_type,
    meta_modified_after,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_school_units_response(response)),
  )
  t.Done(data)
}

pub fn get_organizer(token, organization_number, search_date search_date) {
  let request = base_request(token)
  let request = operations.get_organizer_request(
    request,
    organization_number,
    search_date,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_organizer_response(response)))
  t.Done(data)
}

pub fn get_organizers(
  token,
  organizer_type organizer_type,
  meta_modified_after meta_modified_after,
) {
  let request = base_request(token)
  let request = operations.get_organizers_request(
    request,
    organizer_type,
    meta_modified_after,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_organizers_response(response)))
  t.Done(data)
}

pub fn get_education_provider(
  token,
  education_provider_code,
  search_date search_date,
) {
  let request = base_request(token)
  let request = operations.get_education_provider_request(
    request,
    education_provider_code,
    search_date,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_education_provider_response(response)),
  )
  t.Done(data)
}

pub fn get_education_providers(
  token,
  grading_rights grading_rights,
  meta_modified_after meta_modified_after,
) {
  let request = base_request(token)
  let request = operations.get_education_providers_request(
    request,
    grading_rights,
    meta_modified_after,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_education_providers_response(response)),
  )
  t.Done(data)
}

pub fn get_contract(
  token,
  organization_number,
  education_provider_code,
  search_date search_date,
) {
  let request = base_request(token)
  let request = operations.get_contract_request(
    request,
    organization_number,
    education_provider_code,
    search_date,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_contract_response(response)))
  t.Done(data)
}

pub fn get_contracts(
  token,
  organizer_organization_number organizer_organization_number,
  education_provider_organization_number education_provider_organization_number,
  meta_modified_after meta_modified_after,
) {
  let request = base_request(token)
  let request = operations.get_contracts_request(
    request,
    organizer_organization_number,
    education_provider_organization_number,
    meta_modified_after,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_contracts_response(response)))
  t.Done(data)
}

pub fn get_api_info(token) {
  let request = base_request(token)
  let request = operations.get_api_info_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_api_info_response(response)))
  t.Done(data)
}
