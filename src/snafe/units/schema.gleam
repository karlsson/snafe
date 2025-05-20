import gleam/dynamic
import gleam/dynamic/decode
import gleam/json
import gleam/option.{type Option, None}
import snafe/units/utils

pub type OrganizerIncluded {
  OrganizerIncluded(
    attributes: Option(OrganizerIncludedAttributes),
    links: Option(Link),
    organization_number: Option(String),
    type_: Option(String),
  )
}

pub type SchoolUnitInfoResponseData {
  SchoolUnitInfoResponseData(
    attributes: Option(SchoolUnitInfo),
    school_unit_code: Option(String),
    type_: Option(String),
  )
}

pub type OrganizerResponseData {
  OrganizerResponseData(
    attributes: Option(List(Organizer)),
    type_: Option(String),
  )
}

pub type OrgSchoolUnitRelation {
  OrgSchoolUnitRelation(
    data: Option(List(OrgSchoolUnitData)),
    links: Option(LinkWithRelatedLinks),
  )
}

pub type OrganizerIncludedAttributes {
  OrganizerIncludedAttributes(
    display_name: Option(String),
    organizer_type: Option(CodeOrganizerType),
  )
}

pub type SchoolUnitRelation {
  SchoolUnitRelation(
    data: Option(List(OrgSchoolUnitData)),
    links: Option(SchoolUnitLinks),
  )
}

pub type LinkWithRelatedLinks {
  LinkWithRelatedLinks(
    href: Option(String),
    method_: Option(String),
    rel: Option(String),
    related: Option(List(Link)),
  )
}

pub type SchoolUnitInfo {
  SchoolUnitInfo(
    addresses: Option(List(SchoolUnitAddress)),
    display_name: Option(String),
    email: Option(String),
    end_date: Option(String),
    head_master: Option(String),
    hospital_school: Option(Bool),
    municipality_code: Option(String),
    orientation_type: Option(CodeOrientationType),
    phone_number: Option(String),
    reports_personell: Option(CodeReportType),
    reports_students: Option(CodeReportType),
    school_name: Option(String),
    school_type_properties: Option(SchoolTypeProperties),
    school_types: Option(List(CodeSchoolType)),
    school_unit_type: Option(CodeSchoolUnitType),
    special_support_school: Option(Bool),
    startdate: Option(String),
    status: Option(CodeSchoolUnitStatus),
    url: Option(String),
  )
}

pub type EducationProviderAddress {
  EducationProviderAddress(
    care_of_address: Option(String),
    locality: Option(String),
    postal_code: Option(String),
    street_address: Option(String),
    type_: Option(AddressTypeEnum),
  )
}

pub type Vux {
  Vux(school_type_parts: Option(List(CodeSchoolTypePartVux)))
}

pub type EmailInfo {
  EmailInfo(email: Option(String), provider_type: Option(CodeProviderType))
}

pub type SchoolUnitResponse {
  SchoolUnitResponse(
    data: Option(SchoolUnitResponseData),
    meta: Option(MetaExtracted),
  )
}

pub type ContractInfoResponseData {
  ContractInfoResponseData(
    attributes: Option(ContractInfo),
    education_provider_code: Option(String),
    organization_number: Option(String),
    relationships: Option(ContractInfoResponseDataRelationships),
    type_: Option(String),
  )
}

pub type SchoolUnitLinks {
  SchoolUnitLinks(related: Option(List(Nil)))
}

pub type EducationProviderInfoResponseData {
  EducationProviderInfoResponseData(
    attributes: Option(EducationProviderInfo),
    education_provider_code: Option(String),
    relationships: Option(EducationProviderInfoResponseDataRelationships),
    type_: Option(String),
  )
}

pub type CompanyForm {
  CompanyForm(code: Option(String), display_name: Option(String))
}

pub type ContractInfo {
  ContractInfo(
    education_provider_name: Option(String),
    education_provider_organization_number: Option(String),
    folk_highschool_name: Option(String),
    organizer_name: Option(String),
    school_type_parts: Option(List(SchoolTypePartInfo)),
    status: Option(String),
  )
}

pub type SchoolUnitInfoResponse {
  SchoolUnitInfoResponse(
    data: Option(SchoolUnitInfoResponseData),
    included: Option(OrganizerIncluded),
    links: Option(Link),
    meta: Option(Meta),
  )
}

pub type SchoolUnit {
  SchoolUnit(
    name: Option(String),
    school_unit_code: Option(String),
    status: Option(CodeSchoolUnitStatus),
  )
}

pub type EducationProviderInfo {
  EducationProviderInfo(
    address: Option(EducationProviderAddress),
    company_form: Option(CompanyForm),
    display_name: Option(String),
    email: Option(List(EmailInfo)),
    folk_highschool_name: Option(String),
    grading_rights: Option(Bool),
    grading_rights_from: Option(String),
    grading_rights_to: Option(String),
    phone_number: Option(List(PhoneInfo)),
    school_type_parts: Option(List(CodeSchoolTypePartVux)),
  )
}

pub type Organizer {
  Organizer(
    display_name: Option(String),
    organization_number: Option(String),
    organizer_type: Option(CodeOrganizerType),
  )
}

pub type Sam {
  Sam(grades: Option(List(String)))
}

pub type Link {
  Link(href: Option(String), method_: Option(String), rel: Option(String))
}

pub type GeoCoordinates {
  GeoCoordinates(
    coordinate_swe_ref_e: Option(String),
    coordinate_swe_ref_n: Option(String),
    latitude: Option(String),
    longitude: Option(String),
  )
}

pub type OrganizerInfoResponseData {
  OrganizerInfoResponseData(
    attributes: Option(OrganizerInfo),
    organization_number: Option(String),
    relationships: Option(OrganizerInfoResponseDataRelationships),
    type_: Option(String),
  )
}

pub type SchoolUnitAddress {
  SchoolUnitAddress(
    care_of_address: Option(String),
    continent: Option(String),
    country: Option(String),
    geo_coordinates: Option(GeoCoordinates),
    locality: Option(String),
    postal_code: Option(String),
    street_address: Option(String),
    type_: Option(AddressTypeEnum),
  )
}

pub type Sp {
  Sp(grades: Option(List(String)))
}

pub type Meta {
  Meta(
    created: Option(String),
    extract_date: Option(String),
    modified: Option(String),
  )
}

pub type ContractInfoResponse {
  ContractInfoResponse(
    data: Option(ContractInfoResponseData),
    links: Option(Link),
    meta: Option(Meta),
  )
}

pub type OrgSchoolUnitData {
  OrgSchoolUnitData(school_unit_code: Option(String), type_: Option(String))
}

pub type OrganizerInfoResponse {
  OrganizerInfoResponse(
    data: Option(OrganizerInfoResponseData),
    links: Option(Link),
    meta: Option(Meta),
  )
}

pub type MetaExtracted {
  MetaExtracted(extract_date: Option(String))
}

pub type SchoolTypeProperties {
  SchoolTypeProperties(
    gr: Option(Gr),
    gran: Option(Gran),
    gy: Option(Gy),
    gyan: Option(Gyan),
    sam: Option(Sam),
    sp: Option(Sp),
    vux: Option(Vux),
  )
}

pub type WrappedLink {
  WrappedLink(links: Option(RelatedLink))
}

pub type Gran {
  Gran(grades: Option(List(String)))
}

pub type OrgContractData {
  OrgContractData(
    education_provider_code: Option(String),
    organization_number: Option(String),
    type_: Option(String),
  )
}

pub type EducationProviderResponse {
  EducationProviderResponse(
    data: Option(EducationProviderResponseData),
    meta: Option(MetaExtracted),
  )
}

pub type Gyan {
  Gyan(programmes: Option(List(String)))
}

pub type EducationProviderInfoResponse {
  EducationProviderInfoResponse(
    data: Option(EducationProviderInfoResponseData),
    links: Option(Link),
    meta: Option(Meta),
  )
}

pub type ContractResponse {
  ContractResponse(
    data: Option(ContractResponseData),
    meta: Option(MetaExtracted),
  )
}

pub type EducationProviderResponseData {
  EducationProviderResponseData(
    attributes: Option(List(EducationProvider)),
    type_: Option(String),
  )
}

pub type OrganizerResponse {
  OrganizerResponse(
    data: Option(OrganizerResponseData),
    meta: Option(MetaExtracted),
  )
}

pub type OrgContractRelation {
  OrgContractRelation(
    data: Option(List(OrgContractData)),
    links: Option(LinkWithRelatedLinks),
  )
}

pub type Municipality {
  Municipality(display_name: Option(String), municipality_code: Option(String))
}

pub type SchoolTypePartInfo {
  SchoolTypePartInfo(
    school_type_part: Option(CodeSchoolTypePartVux),
    valid_from: Option(String),
    valid_to: Option(String),
  )
}

pub type ApiInfoResponse {
  ApiInfoResponse(
    api_documentation: Option(String),
    api_name: Option(String),
    api_publisher: Option(String),
    api_released: Option(String),
    api_status: Option(String),
    api_version: Option(String),
  )
}

pub type OrganizerInfo {
  OrganizerInfo(
    address: Option(OrganizationAddress),
    company_form: Option(CompanyForm),
    company_status: Option(CodeCompanyStatus),
    display_name: Option(String),
    email: Option(List(EmailInfo)),
    high_school_association_id: Option(String),
    is_international: Option(Bool),
    legal_entity_status: Option(CodeLegalEntityStatus),
    municipalities: Option(List(Municipality)),
    organizer_type: Option(CodeOrganizerType),
    phone_number: Option(List(PhoneInfo)),
    regions: Option(List(Region)),
    school_types: Option(List(CodeSchoolType)),
    url: Option(String),
  )
}

pub type OrganizerInfoResponseDataRelationships {
  OrganizerInfoResponseDataRelationships(
    contract: Option(OrgContractRelation),
    schoolunit: Option(OrgSchoolUnitRelation),
  )
}

pub type EducationProviderInfoResponseDataRelationships {
  EducationProviderInfoResponseDataRelationships(
    contract: Option(OrgContractRelation),
  )
}

pub type EducationProvider {
  EducationProvider(
    display_name: Option(String),
    education_provider_code: Option(String),
    folk_highschool_name: Option(String),
    grading_right: Option(Bool),
    organization_number: Option(String),
  )
}

pub type Gy {
  Gy(csn_code: Option(String), programmes: Option(List(String)))
}

pub type Gr {
  Gr(grades: Option(List(String)))
}

pub type OrganizationAddress {
  OrganizationAddress(
    care_of_address: Option(String),
    continent: Option(String),
    country: Option(String),
    geo_coordinates: Option(GeoCoordinates),
    locality: Option(String),
    postal_code: Option(String),
    street_address: Option(String),
    type_: Option(AddressTypeEnum),
  )
}

pub type Errors {
  Errors(
    detail: Option(String),
    status: Option(String),
    title: Option(String),
    type_: Option(String),
  )
}

pub type ContractResponseData {
  ContractResponseData(
    attributes: Option(List(Contract)),
    type_: Option(String),
  )
}

pub type Contract {
  Contract(
    education_provider_code: Option(String),
    education_provider_name: Option(String),
    education_provider_organization_number: Option(String),
    folk_highschool_name: Option(String),
    organizer_name: Option(String),
    organizer_organization_number: Option(String),
    status: Option(String),
  )
}

pub type PhoneInfo {
  PhoneInfo(phone: Option(String), provider_type: Option(CodeProviderType))
}

pub type Region {
  Region(display_name: Option(String), region_code: Option(String))
}

pub type SchoolUnitResponseData {
  SchoolUnitResponseData(
    attributes: Option(List(SchoolUnit)),
    type_: Option(String),
  )
}

pub type RelatedLink {
  RelatedLink(related: Option(Link))
}

pub type ContractInfoResponseDataRelationships {
  ContractInfoResponseDataRelationships(
    education_provider: Option(WrappedLink),
    organizer: Option(WrappedLink),
    school_unit: Option(SchoolUnitRelation),
  )
}

pub type CodeProviderType =
  String

pub type CodeCompanyStatus =
  String

pub type CodeSchoolUnitType =
  String

pub type CodeOrientationType =
  String

pub type CodeSchoolUnitStatus =
  String

pub type CodeOrganizerType =
  String

pub type CodeLegalEntityStatus =
  String

pub type CodeReportType =
  String

pub type CodeSchoolTypePartVux =
  String

pub type CodeSchoolType =
  String

pub type AddressTypeEnum =
  String

pub fn contract_info_response_data_relationships_decoder() {
  use education_provider <- decode.optional_field(
    "educationProvider",
    None,
    decode.optional(wrapped_link_decoder()),
  )
  use organizer <- decode.optional_field(
    "organizer",
    None,
    decode.optional(wrapped_link_decoder()),
  )
  use school_unit <- decode.optional_field(
    "schoolUnit",
    None,
    decode.optional(school_unit_relation_decoder()),
  )
  decode.success(ContractInfoResponseDataRelationships(
    education_provider: education_provider,
    organizer: organizer,
    school_unit: school_unit,
  ))
}

pub fn contract_info_response_data_relationships_encode(
  data: ContractInfoResponseDataRelationships,
) {
  json.object([
    #(
      "educationProvider",
      json.nullable(data.education_provider, wrapped_link_encode),
    ),
    #("organizer", json.nullable(data.organizer, wrapped_link_encode)),
    #(
      "schoolUnit",
      json.nullable(data.school_unit, school_unit_relation_encode),
    ),
  ])
}

pub fn related_link_decoder() {
  use related <- decode.optional_field(
    "related",
    None,
    decode.optional(link_decoder()),
  )
  decode.success(RelatedLink(related: related))
}

pub fn related_link_encode(data: RelatedLink) {
  json.object([#("related", json.nullable(data.related, link_encode))])
}

pub fn school_unit_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(school_unit_decoder())),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(SchoolUnitResponseData(attributes: attributes, type_: type_))
}

pub fn school_unit_response_data_encode(data: SchoolUnitResponseData) {
  json.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, school_unit_encode)),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn region_decoder() {
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use region_code <- decode.optional_field(
    "regionCode",
    None,
    decode.optional(decode.string),
  )
  decode.success(Region(display_name: display_name, region_code: region_code))
}

pub fn region_encode(data: Region) {
  json.object([
    #("displayName", json.nullable(data.display_name, json.string)),
    #("regionCode", json.nullable(data.region_code, json.string)),
  ])
}

pub fn phone_info_decoder() {
  use phone <- decode.optional_field(
    "phone",
    None,
    decode.optional(decode.string),
  )
  use provider_type <- decode.optional_field(
    "providerType",
    None,
    decode.optional(code_provider_type_decoder()),
  )
  decode.success(PhoneInfo(phone: phone, provider_type: provider_type))
}

pub fn phone_info_encode(data: PhoneInfo) {
  json.object([
    #("phone", json.nullable(data.phone, json.string)),
    #(
      "providerType",
      json.nullable(data.provider_type, code_provider_type_encode),
    ),
  ])
}

pub fn contract_decoder() {
  use education_provider_code <- decode.optional_field(
    "educationProviderCode",
    None,
    decode.optional(decode.string),
  )
  use education_provider_name <- decode.optional_field(
    "educationProviderName",
    None,
    decode.optional(decode.string),
  )
  use education_provider_organization_number <- decode.optional_field(
    "educationProviderOrganizationNumber",
    None,
    decode.optional(decode.string),
  )
  use folk_highschool_name <- decode.optional_field(
    "folkHighschoolName",
    None,
    decode.optional(decode.string),
  )
  use organizer_name <- decode.optional_field(
    "organizerName",
    None,
    decode.optional(decode.string),
  )
  use organizer_organization_number <- decode.optional_field(
    "organizerOrganizationNumber",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  decode.success(Contract(
    education_provider_code: education_provider_code,
    education_provider_name: education_provider_name,
    education_provider_organization_number: education_provider_organization_number,
    folk_highschool_name: folk_highschool_name,
    organizer_name: organizer_name,
    organizer_organization_number: organizer_organization_number,
    status: status,
  ))
}

pub fn contract_encode(data: Contract) {
  json.object([
    #(
      "educationProviderCode",
      json.nullable(data.education_provider_code, json.string),
    ),
    #(
      "educationProviderName",
      json.nullable(data.education_provider_name, json.string),
    ),
    #(
      "educationProviderOrganizationNumber",
      json.nullable(data.education_provider_organization_number, json.string),
    ),
    #(
      "folkHighschoolName",
      json.nullable(data.folk_highschool_name, json.string),
    ),
    #("organizerName", json.nullable(data.organizer_name, json.string)),
    #(
      "organizerOrganizationNumber",
      json.nullable(data.organizer_organization_number, json.string),
    ),
    #("status", json.nullable(data.status, json.string)),
  ])
}

pub fn contract_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(contract_decoder())),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(ContractResponseData(attributes: attributes, type_: type_))
}

pub fn contract_response_data_encode(data: ContractResponseData) {
  json.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, contract_encode)),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn errors_decoder() {
  use detail <- decode.optional_field(
    "detail",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
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
  decode.success(Errors(
    detail: detail,
    status: status,
    title: title,
    type_: type_,
  ))
}

pub fn errors_encode(data: Errors) {
  json.object([
    #("detail", json.nullable(data.detail, json.string)),
    #("status", json.nullable(data.status, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn organization_address_decoder() {
  use care_of_address <- decode.optional_field(
    "careOfAddress",
    None,
    decode.optional(decode.string),
  )
  use continent <- decode.optional_field(
    "continent",
    None,
    decode.optional(decode.string),
  )
  use country <- decode.optional_field(
    "country",
    None,
    decode.optional(decode.string),
  )
  use geo_coordinates <- decode.optional_field(
    "geoCoordinates",
    None,
    decode.optional(geo_coordinates_decoder()),
  )
  use locality <- decode.optional_field(
    "locality",
    None,
    decode.optional(decode.string),
  )
  use postal_code <- decode.optional_field(
    "postalCode",
    None,
    decode.optional(decode.string),
  )
  use street_address <- decode.optional_field(
    "streetAddress",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(address_type_enum_decoder()),
  )
  decode.success(OrganizationAddress(
    care_of_address: care_of_address,
    continent: continent,
    country: country,
    geo_coordinates: geo_coordinates,
    locality: locality,
    postal_code: postal_code,
    street_address: street_address,
    type_: type_,
  ))
}

pub fn organization_address_encode(data: OrganizationAddress) {
  json.object([
    #("careOfAddress", json.nullable(data.care_of_address, json.string)),
    #("continent", json.nullable(data.continent, json.string)),
    #("country", json.nullable(data.country, json.string)),
    #(
      "geoCoordinates",
      json.nullable(data.geo_coordinates, geo_coordinates_encode),
    ),
    #("locality", json.nullable(data.locality, json.string)),
    #("postalCode", json.nullable(data.postal_code, json.string)),
    #("streetAddress", json.nullable(data.street_address, json.string)),
    #("type", json.nullable(data.type_, address_type_enum_encode)),
  ])
}

pub fn address_type_enum_decoder() {
  decode.string
}

pub fn address_type_enum_encode(data: AddressTypeEnum) {
  json.string(data)
}

pub fn code_school_type_decoder() {
  decode.string
}

pub fn code_school_type_encode(data: CodeSchoolType) {
  json.string(data)
}

pub fn gr_decoder() {
  use grades <- decode.optional_field(
    "grades",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(Gr(grades: grades))
}

pub fn gr_encode(data: Gr) {
  json.object([
    #("grades", json.nullable(data.grades, json.array(_, json.string))),
  ])
}

pub fn gy_decoder() {
  use csn_code <- decode.optional_field(
    "csnCode",
    None,
    decode.optional(decode.string),
  )
  use programmes <- decode.optional_field(
    "programmes",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(Gy(csn_code: csn_code, programmes: programmes))
}

pub fn gy_encode(data: Gy) {
  json.object([
    #("csnCode", json.nullable(data.csn_code, json.string)),
    #("programmes", json.nullable(data.programmes, json.array(_, json.string))),
  ])
}

pub fn code_school_type_part_vux_decoder() {
  decode.string
}

pub fn code_school_type_part_vux_encode(data: CodeSchoolTypePartVux) {
  json.string(data)
}

pub fn education_provider_decoder() {
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use education_provider_code <- decode.optional_field(
    "educationProviderCode",
    None,
    decode.optional(decode.string),
  )
  use folk_highschool_name <- decode.optional_field(
    "folkHighschoolName",
    None,
    decode.optional(decode.string),
  )
  use grading_right <- decode.optional_field(
    "gradingRight",
    None,
    decode.optional(decode.bool),
  )
  use organization_number <- decode.optional_field(
    "organizationNumber",
    None,
    decode.optional(decode.string),
  )
  decode.success(EducationProvider(
    display_name: display_name,
    education_provider_code: education_provider_code,
    folk_highschool_name: folk_highschool_name,
    grading_right: grading_right,
    organization_number: organization_number,
  ))
}

pub fn education_provider_encode(data: EducationProvider) {
  json.object([
    #("displayName", json.nullable(data.display_name, json.string)),
    #(
      "educationProviderCode",
      json.nullable(data.education_provider_code, json.string),
    ),
    #(
      "folkHighschoolName",
      json.nullable(data.folk_highschool_name, json.string),
    ),
    #("gradingRight", json.nullable(data.grading_right, json.bool)),
    #(
      "organizationNumber",
      json.nullable(data.organization_number, json.string),
    ),
  ])
}

pub fn education_provider_info_response_data_relationships_decoder() {
  use contract <- decode.optional_field(
    "contract",
    None,
    decode.optional(org_contract_relation_decoder()),
  )
  decode.success(EducationProviderInfoResponseDataRelationships(
    contract: contract,
  ))
}

pub fn education_provider_info_response_data_relationships_encode(
  data: EducationProviderInfoResponseDataRelationships,
) {
  json.object([
    #("contract", json.nullable(data.contract, org_contract_relation_encode)),
  ])
}

pub fn organizer_info_response_data_relationships_decoder() {
  use contract <- decode.optional_field(
    "contract",
    None,
    decode.optional(org_contract_relation_decoder()),
  )
  use schoolunit <- decode.optional_field(
    "schoolunit",
    None,
    decode.optional(org_school_unit_relation_decoder()),
  )
  decode.success(OrganizerInfoResponseDataRelationships(
    contract: contract,
    schoolunit: schoolunit,
  ))
}

pub fn organizer_info_response_data_relationships_encode(
  data: OrganizerInfoResponseDataRelationships,
) {
  json.object([
    #("contract", json.nullable(data.contract, org_contract_relation_encode)),
    #(
      "schoolunit",
      json.nullable(data.schoolunit, org_school_unit_relation_encode),
    ),
  ])
}

pub fn code_report_type_decoder() {
  decode.string
}

pub fn code_report_type_encode(data: CodeReportType) {
  json.string(data)
}

pub fn organizer_info_decoder() {
  use address <- decode.optional_field(
    "address",
    None,
    decode.optional(organization_address_decoder()),
  )
  use company_form <- decode.optional_field(
    "companyForm",
    None,
    decode.optional(company_form_decoder()),
  )
  use company_status <- decode.optional_field(
    "companyStatus",
    None,
    decode.optional(code_company_status_decoder()),
  )
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.list(email_info_decoder())),
  )
  use high_school_association_id <- decode.optional_field(
    "highSchoolAssociationId",
    None,
    decode.optional(decode.string),
  )
  use is_international <- decode.optional_field(
    "isInternational",
    None,
    decode.optional(decode.bool),
  )
  use legal_entity_status <- decode.optional_field(
    "legalEntityStatus",
    None,
    decode.optional(code_legal_entity_status_decoder()),
  )
  use municipalities <- decode.optional_field(
    "municipalities",
    None,
    decode.optional(decode.list(municipality_decoder())),
  )
  use organizer_type <- decode.optional_field(
    "organizerType",
    None,
    decode.optional(code_organizer_type_decoder()),
  )
  use phone_number <- decode.optional_field(
    "phoneNumber",
    None,
    decode.optional(decode.list(phone_info_decoder())),
  )
  use regions <- decode.optional_field(
    "regions",
    None,
    decode.optional(decode.list(region_decoder())),
  )
  use school_types <- decode.optional_field(
    "schoolTypes",
    None,
    decode.optional(decode.list(code_school_type_decoder())),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  decode.success(OrganizerInfo(
    address: address,
    company_form: company_form,
    company_status: company_status,
    display_name: display_name,
    email: email,
    high_school_association_id: high_school_association_id,
    is_international: is_international,
    legal_entity_status: legal_entity_status,
    municipalities: municipalities,
    organizer_type: organizer_type,
    phone_number: phone_number,
    regions: regions,
    school_types: school_types,
    url: url,
  ))
}

pub fn organizer_info_encode(data: OrganizerInfo) {
  json.object([
    #("address", json.nullable(data.address, organization_address_encode)),
    #("companyForm", json.nullable(data.company_form, company_form_encode)),
    #(
      "companyStatus",
      json.nullable(data.company_status, code_company_status_encode),
    ),
    #("displayName", json.nullable(data.display_name, json.string)),
    #("email", json.nullable(data.email, json.array(_, email_info_encode))),
    #(
      "highSchoolAssociationId",
      json.nullable(data.high_school_association_id, json.string),
    ),
    #("isInternational", json.nullable(data.is_international, json.bool)),
    #(
      "legalEntityStatus",
      json.nullable(data.legal_entity_status, code_legal_entity_status_encode),
    ),
    #(
      "municipalities",
      json.nullable(data.municipalities, json.array(_, municipality_encode)),
    ),
    #(
      "organizerType",
      json.nullable(data.organizer_type, code_organizer_type_encode),
    ),
    #(
      "phoneNumber",
      json.nullable(data.phone_number, json.array(_, phone_info_encode)),
    ),
    #("regions", json.nullable(data.regions, json.array(_, region_encode))),
    #(
      "schoolTypes",
      json.nullable(data.school_types, json.array(_, code_school_type_encode)),
    ),
    #("url", json.nullable(data.url, json.string)),
  ])
}

pub fn api_info_response_decoder() {
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
  use api_publisher <- decode.optional_field(
    "apiPublisher",
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
  decode.success(ApiInfoResponse(
    api_documentation: api_documentation,
    api_name: api_name,
    api_publisher: api_publisher,
    api_released: api_released,
    api_status: api_status,
    api_version: api_version,
  ))
}

pub fn api_info_response_encode(data: ApiInfoResponse) {
  json.object([
    #("apiDocumentation", json.nullable(data.api_documentation, json.string)),
    #("apiName", json.nullable(data.api_name, json.string)),
    #("apiPublisher", json.nullable(data.api_publisher, json.string)),
    #("apiReleased", json.nullable(data.api_released, json.string)),
    #("apiStatus", json.nullable(data.api_status, json.string)),
    #("apiVersion", json.nullable(data.api_version, json.string)),
  ])
}

pub fn school_type_part_info_decoder() {
  use school_type_part <- decode.optional_field(
    "schoolTypePart",
    None,
    decode.optional(code_school_type_part_vux_decoder()),
  )
  use valid_from <- decode.optional_field(
    "validFrom",
    None,
    decode.optional(decode.string),
  )
  use valid_to <- decode.optional_field(
    "validTo",
    None,
    decode.optional(decode.string),
  )
  decode.success(SchoolTypePartInfo(
    school_type_part: school_type_part,
    valid_from: valid_from,
    valid_to: valid_to,
  ))
}

pub fn school_type_part_info_encode(data: SchoolTypePartInfo) {
  json.object([
    #(
      "schoolTypePart",
      json.nullable(data.school_type_part, code_school_type_part_vux_encode),
    ),
    #("validFrom", json.nullable(data.valid_from, json.string)),
    #("validTo", json.nullable(data.valid_to, json.string)),
  ])
}

pub fn municipality_decoder() {
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use municipality_code <- decode.optional_field(
    "municipalityCode",
    None,
    decode.optional(decode.string),
  )
  decode.success(Municipality(
    display_name: display_name,
    municipality_code: municipality_code,
  ))
}

pub fn municipality_encode(data: Municipality) {
  json.object([
    #("displayName", json.nullable(data.display_name, json.string)),
    #("municipalityCode", json.nullable(data.municipality_code, json.string)),
  ])
}

pub fn org_contract_relation_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(org_contract_data_decoder())),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(link_with_related_links_decoder()),
  )
  decode.success(OrgContractRelation(data: data, links: links))
}

pub fn org_contract_relation_encode(data: OrgContractRelation) {
  json.object([
    #("data", json.nullable(data.data, json.array(_, org_contract_data_encode))),
    #("links", json.nullable(data.links, link_with_related_links_encode)),
  ])
}

pub fn organizer_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(organizer_response_data_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_extracted_decoder()),
  )
  decode.success(OrganizerResponse(data: data, meta: meta))
}

pub fn organizer_response_encode(data: OrganizerResponse) {
  json.object([
    #("data", json.nullable(data.data, organizer_response_data_encode)),
    #("meta", json.nullable(data.meta, meta_extracted_encode)),
  ])
}

pub fn education_provider_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(education_provider_decoder())),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(EducationProviderResponseData(
    attributes: attributes,
    type_: type_,
  ))
}

pub fn education_provider_response_data_encode(
  data: EducationProviderResponseData,
) {
  json.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, education_provider_encode)),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn contract_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(contract_response_data_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_extracted_decoder()),
  )
  decode.success(ContractResponse(data: data, meta: meta))
}

pub fn contract_response_encode(data: ContractResponse) {
  json.object([
    #("data", json.nullable(data.data, contract_response_data_encode)),
    #("meta", json.nullable(data.meta, meta_extracted_encode)),
  ])
}

pub fn education_provider_info_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(education_provider_info_response_data_decoder()),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(link_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_decoder()),
  )
  decode.success(EducationProviderInfoResponse(
    data: data,
    links: links,
    meta: meta,
  ))
}

pub fn education_provider_info_response_encode(
  data: EducationProviderInfoResponse,
) {
  json.object([
    #(
      "data",
      json.nullable(data.data, education_provider_info_response_data_encode),
    ),
    #("links", json.nullable(data.links, link_encode)),
    #("meta", json.nullable(data.meta, meta_encode)),
  ])
}

pub fn gyan_decoder() {
  use programmes <- decode.optional_field(
    "programmes",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(Gyan(programmes: programmes))
}

pub fn gyan_encode(data: Gyan) {
  json.object([
    #("programmes", json.nullable(data.programmes, json.array(_, json.string))),
  ])
}

pub fn education_provider_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(education_provider_response_data_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_extracted_decoder()),
  )
  decode.success(EducationProviderResponse(data: data, meta: meta))
}

pub fn education_provider_response_encode(data: EducationProviderResponse) {
  json.object([
    #("data", json.nullable(data.data, education_provider_response_data_encode)),
    #("meta", json.nullable(data.meta, meta_extracted_encode)),
  ])
}

pub fn code_legal_entity_status_decoder() {
  decode.string
}

pub fn code_legal_entity_status_encode(data: CodeLegalEntityStatus) {
  json.string(data)
}

pub fn code_organizer_type_decoder() {
  decode.string
}

pub fn code_organizer_type_encode(data: CodeOrganizerType) {
  json.string(data)
}

pub fn org_contract_data_decoder() {
  use education_provider_code <- decode.optional_field(
    "educationProviderCode",
    None,
    decode.optional(decode.string),
  )
  use organization_number <- decode.optional_field(
    "organizationNumber",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(OrgContractData(
    education_provider_code: education_provider_code,
    organization_number: organization_number,
    type_: type_,
  ))
}

pub fn org_contract_data_encode(data: OrgContractData) {
  json.object([
    #(
      "educationProviderCode",
      json.nullable(data.education_provider_code, json.string),
    ),
    #(
      "organizationNumber",
      json.nullable(data.organization_number, json.string),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn gran_decoder() {
  use grades <- decode.optional_field(
    "grades",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(Gran(grades: grades))
}

pub fn gran_encode(data: Gran) {
  json.object([
    #("grades", json.nullable(data.grades, json.array(_, json.string))),
  ])
}

pub fn wrapped_link_decoder() {
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(related_link_decoder()),
  )
  decode.success(WrappedLink(links: links))
}

pub fn wrapped_link_encode(data: WrappedLink) {
  json.object([#("links", json.nullable(data.links, related_link_encode))])
}

pub fn school_type_properties_decoder() {
  use gr <- decode.optional_field("gr", None, decode.optional(gr_decoder()))
  use gran <- decode.optional_field(
    "gran",
    None,
    decode.optional(gran_decoder()),
  )
  use gy <- decode.optional_field("gy", None, decode.optional(gy_decoder()))
  use gyan <- decode.optional_field(
    "gyan",
    None,
    decode.optional(gyan_decoder()),
  )
  use sam <- decode.optional_field("sam", None, decode.optional(sam_decoder()))
  use sp <- decode.optional_field("sp", None, decode.optional(sp_decoder()))
  use vux <- decode.optional_field("vux", None, decode.optional(vux_decoder()))
  decode.success(SchoolTypeProperties(
    gr: gr,
    gran: gran,
    gy: gy,
    gyan: gyan,
    sam: sam,
    sp: sp,
    vux: vux,
  ))
}

pub fn school_type_properties_encode(data: SchoolTypeProperties) {
  json.object([
    #("gr", json.nullable(data.gr, gr_encode)),
    #("gran", json.nullable(data.gran, gran_encode)),
    #("gy", json.nullable(data.gy, gy_encode)),
    #("gyan", json.nullable(data.gyan, gyan_encode)),
    #("sam", json.nullable(data.sam, sam_encode)),
    #("sp", json.nullable(data.sp, sp_encode)),
    #("vux", json.nullable(data.vux, vux_encode)),
  ])
}

pub fn meta_extracted_decoder() {
  use extract_date <- decode.optional_field(
    "extractDate",
    None,
    decode.optional(decode.string),
  )
  decode.success(MetaExtracted(extract_date: extract_date))
}

pub fn meta_extracted_encode(data: MetaExtracted) {
  json.object([#("extractDate", json.nullable(data.extract_date, json.string))])
}

pub fn organizer_info_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(organizer_info_response_data_decoder()),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(link_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_decoder()),
  )
  decode.success(OrganizerInfoResponse(data: data, links: links, meta: meta))
}

pub fn organizer_info_response_encode(data: OrganizerInfoResponse) {
  json.object([
    #("data", json.nullable(data.data, organizer_info_response_data_encode)),
    #("links", json.nullable(data.links, link_encode)),
    #("meta", json.nullable(data.meta, meta_encode)),
  ])
}

pub fn org_school_unit_data_decoder() {
  use school_unit_code <- decode.optional_field(
    "schoolUnitCode",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(OrgSchoolUnitData(
    school_unit_code: school_unit_code,
    type_: type_,
  ))
}

pub fn org_school_unit_data_encode(data: OrgSchoolUnitData) {
  json.object([
    #("schoolUnitCode", json.nullable(data.school_unit_code, json.string)),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn code_school_unit_status_decoder() {
  decode.string
}

pub fn code_school_unit_status_encode(data: CodeSchoolUnitStatus) {
  json.string(data)
}

pub fn contract_info_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(contract_info_response_data_decoder()),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(link_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_decoder()),
  )
  decode.success(ContractInfoResponse(data: data, links: links, meta: meta))
}

pub fn contract_info_response_encode(data: ContractInfoResponse) {
  json.object([
    #("data", json.nullable(data.data, contract_info_response_data_encode)),
    #("links", json.nullable(data.links, link_encode)),
    #("meta", json.nullable(data.meta, meta_encode)),
  ])
}

pub fn code_orientation_type_decoder() {
  decode.string
}

pub fn code_orientation_type_encode(data: CodeOrientationType) {
  json.string(data)
}

pub fn meta_decoder() {
  use created <- decode.optional_field(
    "created",
    None,
    decode.optional(decode.string),
  )
  use extract_date <- decode.optional_field(
    "extractDate",
    None,
    decode.optional(decode.string),
  )
  use modified <- decode.optional_field(
    "modified",
    None,
    decode.optional(decode.string),
  )
  decode.success(Meta(
    created: created,
    extract_date: extract_date,
    modified: modified,
  ))
}

pub fn meta_encode(data: Meta) {
  json.object([
    #("created", json.nullable(data.created, json.string)),
    #("extractDate", json.nullable(data.extract_date, json.string)),
    #("modified", json.nullable(data.modified, json.string)),
  ])
}

pub fn sp_decoder() {
  use grades <- decode.optional_field(
    "grades",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(Sp(grades: grades))
}

pub fn sp_encode(data: Sp) {
  json.object([
    #("grades", json.nullable(data.grades, json.array(_, json.string))),
  ])
}

pub fn school_unit_address_decoder() {
  use care_of_address <- decode.optional_field(
    "careOfAddress",
    None,
    decode.optional(decode.string),
  )
  use continent <- decode.optional_field(
    "continent",
    None,
    decode.optional(decode.string),
  )
  use country <- decode.optional_field(
    "country",
    None,
    decode.optional(decode.string),
  )
  use geo_coordinates <- decode.optional_field(
    "geoCoordinates",
    None,
    decode.optional(geo_coordinates_decoder()),
  )
  use locality <- decode.optional_field(
    "locality",
    None,
    decode.optional(decode.string),
  )
  use postal_code <- decode.optional_field(
    "postalCode",
    None,
    decode.optional(decode.string),
  )
  use street_address <- decode.optional_field(
    "streetAddress",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(address_type_enum_decoder()),
  )
  decode.success(SchoolUnitAddress(
    care_of_address: care_of_address,
    continent: continent,
    country: country,
    geo_coordinates: geo_coordinates,
    locality: locality,
    postal_code: postal_code,
    street_address: street_address,
    type_: type_,
  ))
}

pub fn school_unit_address_encode(data: SchoolUnitAddress) {
  json.object([
    #("careOfAddress", json.nullable(data.care_of_address, json.string)),
    #("continent", json.nullable(data.continent, json.string)),
    #("country", json.nullable(data.country, json.string)),
    #(
      "geoCoordinates",
      json.nullable(data.geo_coordinates, geo_coordinates_encode),
    ),
    #("locality", json.nullable(data.locality, json.string)),
    #("postalCode", json.nullable(data.postal_code, json.string)),
    #("streetAddress", json.nullable(data.street_address, json.string)),
    #("type", json.nullable(data.type_, address_type_enum_encode)),
  ])
}

pub fn organizer_info_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(organizer_info_decoder()),
  )
  use organization_number <- decode.optional_field(
    "organizationNumber",
    None,
    decode.optional(decode.string),
  )
  use relationships <- decode.optional_field(
    "relationships",
    None,
    decode.optional(organizer_info_response_data_relationships_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(OrganizerInfoResponseData(
    attributes: attributes,
    organization_number: organization_number,
    relationships: relationships,
    type_: type_,
  ))
}

pub fn organizer_info_response_data_encode(data: OrganizerInfoResponseData) {
  json.object([
    #("attributes", json.nullable(data.attributes, organizer_info_encode)),
    #(
      "organizationNumber",
      json.nullable(data.organization_number, json.string),
    ),
    #(
      "relationships",
      json.nullable(
        data.relationships,
        organizer_info_response_data_relationships_encode,
      ),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn geo_coordinates_decoder() {
  use coordinate_swe_ref_e <- decode.optional_field(
    "coordinateSweRefE",
    None,
    decode.optional(decode.string),
  )
  use coordinate_swe_ref_n <- decode.optional_field(
    "coordinateSweRefN",
    None,
    decode.optional(decode.string),
  )
  use latitude <- decode.optional_field(
    "latitude",
    None,
    decode.optional(decode.string),
  )
  use longitude <- decode.optional_field(
    "longitude",
    None,
    decode.optional(decode.string),
  )
  decode.success(GeoCoordinates(
    coordinate_swe_ref_e: coordinate_swe_ref_e,
    coordinate_swe_ref_n: coordinate_swe_ref_n,
    latitude: latitude,
    longitude: longitude,
  ))
}

pub fn geo_coordinates_encode(data: GeoCoordinates) {
  json.object([
    #(
      "coordinateSweRefE",
      json.nullable(data.coordinate_swe_ref_e, json.string),
    ),
    #(
      "coordinateSweRefN",
      json.nullable(data.coordinate_swe_ref_n, json.string),
    ),
    #("latitude", json.nullable(data.latitude, json.string)),
    #("longitude", json.nullable(data.longitude, json.string)),
  ])
}

pub fn link_decoder() {
  use href <- decode.optional_field(
    "href",
    None,
    decode.optional(decode.string),
  )
  use method_ <- decode.optional_field(
    "method",
    None,
    decode.optional(decode.string),
  )
  use rel <- decode.optional_field("rel", None, decode.optional(decode.string))
  decode.success(Link(href: href, method_: method_, rel: rel))
}

pub fn link_encode(data: Link) {
  json.object([
    #("href", json.nullable(data.href, json.string)),
    #("method", json.nullable(data.method_, json.string)),
    #("rel", json.nullable(data.rel, json.string)),
  ])
}

pub fn sam_decoder() {
  use grades <- decode.optional_field(
    "grades",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(Sam(grades: grades))
}

pub fn sam_encode(data: Sam) {
  json.object([
    #("grades", json.nullable(data.grades, json.array(_, json.string))),
  ])
}

pub fn code_school_unit_type_decoder() {
  decode.string
}

pub fn code_school_unit_type_encode(data: CodeSchoolUnitType) {
  json.string(data)
}

pub fn organizer_decoder() {
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use organization_number <- decode.optional_field(
    "organizationNumber",
    None,
    decode.optional(decode.string),
  )
  use organizer_type <- decode.optional_field(
    "organizerType",
    None,
    decode.optional(code_organizer_type_decoder()),
  )
  decode.success(Organizer(
    display_name: display_name,
    organization_number: organization_number,
    organizer_type: organizer_type,
  ))
}

pub fn organizer_encode(data: Organizer) {
  json.object([
    #("displayName", json.nullable(data.display_name, json.string)),
    #(
      "organizationNumber",
      json.nullable(data.organization_number, json.string),
    ),
    #(
      "organizerType",
      json.nullable(data.organizer_type, code_organizer_type_encode),
    ),
  ])
}

pub fn education_provider_info_decoder() {
  use address <- decode.optional_field(
    "address",
    None,
    decode.optional(education_provider_address_decoder()),
  )
  use company_form <- decode.optional_field(
    "companyForm",
    None,
    decode.optional(company_form_decoder()),
  )
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.list(email_info_decoder())),
  )
  use folk_highschool_name <- decode.optional_field(
    "folkHighschoolName",
    None,
    decode.optional(decode.string),
  )
  use grading_rights <- decode.optional_field(
    "gradingRights",
    None,
    decode.optional(decode.bool),
  )
  use grading_rights_from <- decode.optional_field(
    "gradingRightsFrom",
    None,
    decode.optional(decode.string),
  )
  use grading_rights_to <- decode.optional_field(
    "gradingRightsTo",
    None,
    decode.optional(decode.string),
  )
  use phone_number <- decode.optional_field(
    "phoneNumber",
    None,
    decode.optional(decode.list(phone_info_decoder())),
  )
  use school_type_parts <- decode.optional_field(
    "schoolTypeParts",
    None,
    decode.optional(decode.list(code_school_type_part_vux_decoder())),
  )
  decode.success(EducationProviderInfo(
    address: address,
    company_form: company_form,
    display_name: display_name,
    email: email,
    folk_highschool_name: folk_highschool_name,
    grading_rights: grading_rights,
    grading_rights_from: grading_rights_from,
    grading_rights_to: grading_rights_to,
    phone_number: phone_number,
    school_type_parts: school_type_parts,
  ))
}

pub fn education_provider_info_encode(data: EducationProviderInfo) {
  json.object([
    #("address", json.nullable(data.address, education_provider_address_encode)),
    #("companyForm", json.nullable(data.company_form, company_form_encode)),
    #("displayName", json.nullable(data.display_name, json.string)),
    #("email", json.nullable(data.email, json.array(_, email_info_encode))),
    #(
      "folkHighschoolName",
      json.nullable(data.folk_highschool_name, json.string),
    ),
    #("gradingRights", json.nullable(data.grading_rights, json.bool)),
    #("gradingRightsFrom", json.nullable(data.grading_rights_from, json.string)),
    #("gradingRightsTo", json.nullable(data.grading_rights_to, json.string)),
    #(
      "phoneNumber",
      json.nullable(data.phone_number, json.array(_, phone_info_encode)),
    ),
    #(
      "schoolTypeParts",
      json.nullable(data.school_type_parts, json.array(
        _,
        code_school_type_part_vux_encode,
      )),
    ),
  ])
}

pub fn school_unit_decoder() {
  use name <- decode.optional_field(
    "name",
    None,
    decode.optional(decode.string),
  )
  use school_unit_code <- decode.optional_field(
    "schoolUnitCode",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(code_school_unit_status_decoder()),
  )
  decode.success(SchoolUnit(
    name: name,
    school_unit_code: school_unit_code,
    status: status,
  ))
}

pub fn school_unit_encode(data: SchoolUnit) {
  json.object([
    #("name", json.nullable(data.name, json.string)),
    #("schoolUnitCode", json.nullable(data.school_unit_code, json.string)),
    #("status", json.nullable(data.status, code_school_unit_status_encode)),
  ])
}

pub fn school_unit_info_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(school_unit_info_response_data_decoder()),
  )
  use included <- decode.optional_field(
    "included",
    None,
    decode.optional(organizer_included_decoder()),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(link_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_decoder()),
  )
  decode.success(SchoolUnitInfoResponse(
    data: data,
    included: included,
    links: links,
    meta: meta,
  ))
}

pub fn school_unit_info_response_encode(data: SchoolUnitInfoResponse) {
  json.object([
    #("data", json.nullable(data.data, school_unit_info_response_data_encode)),
    #("included", json.nullable(data.included, organizer_included_encode)),
    #("links", json.nullable(data.links, link_encode)),
    #("meta", json.nullable(data.meta, meta_encode)),
  ])
}

pub fn contract_info_decoder() {
  use education_provider_name <- decode.optional_field(
    "educationProviderName",
    None,
    decode.optional(decode.string),
  )
  use education_provider_organization_number <- decode.optional_field(
    "educationProviderOrganizationNumber",
    None,
    decode.optional(decode.string),
  )
  use folk_highschool_name <- decode.optional_field(
    "folkHighschoolName",
    None,
    decode.optional(decode.string),
  )
  use organizer_name <- decode.optional_field(
    "organizerName",
    None,
    decode.optional(decode.string),
  )
  use school_type_parts <- decode.optional_field(
    "schoolTypeParts",
    None,
    decode.optional(decode.list(school_type_part_info_decoder())),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  decode.success(ContractInfo(
    education_provider_name: education_provider_name,
    education_provider_organization_number: education_provider_organization_number,
    folk_highschool_name: folk_highschool_name,
    organizer_name: organizer_name,
    school_type_parts: school_type_parts,
    status: status,
  ))
}

pub fn contract_info_encode(data: ContractInfo) {
  json.object([
    #(
      "educationProviderName",
      json.nullable(data.education_provider_name, json.string),
    ),
    #(
      "educationProviderOrganizationNumber",
      json.nullable(data.education_provider_organization_number, json.string),
    ),
    #(
      "folkHighschoolName",
      json.nullable(data.folk_highschool_name, json.string),
    ),
    #("organizerName", json.nullable(data.organizer_name, json.string)),
    #(
      "schoolTypeParts",
      json.nullable(data.school_type_parts, json.array(
        _,
        school_type_part_info_encode,
      )),
    ),
    #("status", json.nullable(data.status, json.string)),
  ])
}

pub fn company_form_decoder() {
  use code <- decode.optional_field(
    "code",
    None,
    decode.optional(decode.string),
  )
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  decode.success(CompanyForm(code: code, display_name: display_name))
}

pub fn company_form_encode(data: CompanyForm) {
  json.object([
    #("code", json.nullable(data.code, json.string)),
    #("displayName", json.nullable(data.display_name, json.string)),
  ])
}

pub fn education_provider_info_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(education_provider_info_decoder()),
  )
  use education_provider_code <- decode.optional_field(
    "educationProviderCode",
    None,
    decode.optional(decode.string),
  )
  use relationships <- decode.optional_field(
    "relationships",
    None,
    decode.optional(
      education_provider_info_response_data_relationships_decoder(),
    ),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(EducationProviderInfoResponseData(
    attributes: attributes,
    education_provider_code: education_provider_code,
    relationships: relationships,
    type_: type_,
  ))
}

pub fn education_provider_info_response_data_encode(
  data: EducationProviderInfoResponseData,
) {
  json.object([
    #(
      "attributes",
      json.nullable(data.attributes, education_provider_info_encode),
    ),
    #(
      "educationProviderCode",
      json.nullable(data.education_provider_code, json.string),
    ),
    #(
      "relationships",
      json.nullable(
        data.relationships,
        education_provider_info_response_data_relationships_encode,
      ),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn school_unit_links_decoder() {
  use related <- decode.optional_field(
    "related",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  decode.success(SchoolUnitLinks(related: related))
}

pub fn school_unit_links_encode(data: SchoolUnitLinks) {
  json.object([
    #(
      "related",
      json.nullable(
        data.related,
        json.array(_, fn(_) { panic as "object in array" }),
      ),
    ),
  ])
}

pub fn contract_info_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(contract_info_decoder()),
  )
  use education_provider_code <- decode.optional_field(
    "educationProviderCode",
    None,
    decode.optional(decode.string),
  )
  use organization_number <- decode.optional_field(
    "organizationNumber",
    None,
    decode.optional(decode.string),
  )
  use relationships <- decode.optional_field(
    "relationships",
    None,
    decode.optional(contract_info_response_data_relationships_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(ContractInfoResponseData(
    attributes: attributes,
    education_provider_code: education_provider_code,
    organization_number: organization_number,
    relationships: relationships,
    type_: type_,
  ))
}

pub fn contract_info_response_data_encode(data: ContractInfoResponseData) {
  json.object([
    #("attributes", json.nullable(data.attributes, contract_info_encode)),
    #(
      "educationProviderCode",
      json.nullable(data.education_provider_code, json.string),
    ),
    #(
      "organizationNumber",
      json.nullable(data.organization_number, json.string),
    ),
    #(
      "relationships",
      json.nullable(
        data.relationships,
        contract_info_response_data_relationships_encode,
      ),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn school_unit_response_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(school_unit_response_data_decoder()),
  )
  use meta <- decode.optional_field(
    "meta",
    None,
    decode.optional(meta_extracted_decoder()),
  )
  decode.success(SchoolUnitResponse(data: data, meta: meta))
}

pub fn school_unit_response_encode(data: SchoolUnitResponse) {
  json.object([
    #("data", json.nullable(data.data, school_unit_response_data_encode)),
    #("meta", json.nullable(data.meta, meta_extracted_encode)),
  ])
}

pub fn email_info_decoder() {
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use provider_type <- decode.optional_field(
    "providerType",
    None,
    decode.optional(code_provider_type_decoder()),
  )
  decode.success(EmailInfo(email: email, provider_type: provider_type))
}

pub fn email_info_encode(data: EmailInfo) {
  json.object([
    #("email", json.nullable(data.email, json.string)),
    #(
      "providerType",
      json.nullable(data.provider_type, code_provider_type_encode),
    ),
  ])
}

pub fn vux_decoder() {
  use school_type_parts <- decode.optional_field(
    "schoolTypeParts",
    None,
    decode.optional(decode.list(code_school_type_part_vux_decoder())),
  )
  decode.success(Vux(school_type_parts: school_type_parts))
}

pub fn vux_encode(data: Vux) {
  json.object([
    #(
      "schoolTypeParts",
      json.nullable(data.school_type_parts, json.array(
        _,
        code_school_type_part_vux_encode,
      )),
    ),
  ])
}

pub fn education_provider_address_decoder() {
  use care_of_address <- decode.optional_field(
    "careOfAddress",
    None,
    decode.optional(decode.string),
  )
  use locality <- decode.optional_field(
    "locality",
    None,
    decode.optional(decode.string),
  )
  use postal_code <- decode.optional_field(
    "postalCode",
    None,
    decode.optional(decode.string),
  )
  use street_address <- decode.optional_field(
    "streetAddress",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(address_type_enum_decoder()),
  )
  decode.success(EducationProviderAddress(
    care_of_address: care_of_address,
    locality: locality,
    postal_code: postal_code,
    street_address: street_address,
    type_: type_,
  ))
}

pub fn education_provider_address_encode(data: EducationProviderAddress) {
  json.object([
    #("careOfAddress", json.nullable(data.care_of_address, json.string)),
    #("locality", json.nullable(data.locality, json.string)),
    #("postalCode", json.nullable(data.postal_code, json.string)),
    #("streetAddress", json.nullable(data.street_address, json.string)),
    #("type", json.nullable(data.type_, address_type_enum_encode)),
  ])
}

pub fn school_unit_info_decoder() {
  use addresses <- decode.optional_field(
    "addresses",
    None,
    decode.optional(decode.list(school_unit_address_decoder())),
  )
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use end_date <- decode.optional_field(
    "endDate",
    None,
    decode.optional(decode.string),
  )
  use head_master <- decode.optional_field(
    "headMaster",
    None,
    decode.optional(decode.string),
  )
  use hospital_school <- decode.optional_field(
    "hospitalSchool",
    None,
    decode.optional(decode.bool),
  )
  use municipality_code <- decode.optional_field(
    "municipalityCode",
    None,
    decode.optional(decode.string),
  )
  use orientation_type <- decode.optional_field(
    "orientationType",
    None,
    decode.optional(code_orientation_type_decoder()),
  )
  use phone_number <- decode.optional_field(
    "phoneNumber",
    None,
    decode.optional(decode.string),
  )
  use reports_personell <- decode.optional_field(
    "reportsPersonell",
    None,
    decode.optional(code_report_type_decoder()),
  )
  use reports_students <- decode.optional_field(
    "reportsStudents",
    None,
    decode.optional(code_report_type_decoder()),
  )
  use school_name <- decode.optional_field(
    "schoolName",
    None,
    decode.optional(decode.string),
  )
  use school_type_properties <- decode.optional_field(
    "schoolTypeProperties",
    None,
    decode.optional(school_type_properties_decoder()),
  )
  use school_types <- decode.optional_field(
    "schoolTypes",
    None,
    decode.optional(decode.list(code_school_type_decoder())),
  )
  use school_unit_type <- decode.optional_field(
    "schoolUnitType",
    None,
    decode.optional(code_school_unit_type_decoder()),
  )
  use special_support_school <- decode.optional_field(
    "specialSupportSchool",
    None,
    decode.optional(decode.bool),
  )
  use startdate <- decode.optional_field(
    "startdate",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(code_school_unit_status_decoder()),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  decode.success(SchoolUnitInfo(
    addresses: addresses,
    display_name: display_name,
    email: email,
    end_date: end_date,
    head_master: head_master,
    hospital_school: hospital_school,
    municipality_code: municipality_code,
    orientation_type: orientation_type,
    phone_number: phone_number,
    reports_personell: reports_personell,
    reports_students: reports_students,
    school_name: school_name,
    school_type_properties: school_type_properties,
    school_types: school_types,
    school_unit_type: school_unit_type,
    special_support_school: special_support_school,
    startdate: startdate,
    status: status,
    url: url,
  ))
}

pub fn school_unit_info_encode(data: SchoolUnitInfo) {
  json.object([
    #(
      "addresses",
      json.nullable(data.addresses, json.array(_, school_unit_address_encode)),
    ),
    #("displayName", json.nullable(data.display_name, json.string)),
    #("email", json.nullable(data.email, json.string)),
    #("endDate", json.nullable(data.end_date, json.string)),
    #("headMaster", json.nullable(data.head_master, json.string)),
    #("hospitalSchool", json.nullable(data.hospital_school, json.bool)),
    #("municipalityCode", json.nullable(data.municipality_code, json.string)),
    #(
      "orientationType",
      json.nullable(data.orientation_type, code_orientation_type_encode),
    ),
    #("phoneNumber", json.nullable(data.phone_number, json.string)),
    #(
      "reportsPersonell",
      json.nullable(data.reports_personell, code_report_type_encode),
    ),
    #(
      "reportsStudents",
      json.nullable(data.reports_students, code_report_type_encode),
    ),
    #("schoolName", json.nullable(data.school_name, json.string)),
    #(
      "schoolTypeProperties",
      json.nullable(data.school_type_properties, school_type_properties_encode),
    ),
    #(
      "schoolTypes",
      json.nullable(data.school_types, json.array(_, code_school_type_encode)),
    ),
    #(
      "schoolUnitType",
      json.nullable(data.school_unit_type, code_school_unit_type_encode),
    ),
    #(
      "specialSupportSchool",
      json.nullable(data.special_support_school, json.bool),
    ),
    #("startdate", json.nullable(data.startdate, json.string)),
    #("status", json.nullable(data.status, code_school_unit_status_encode)),
    #("url", json.nullable(data.url, json.string)),
  ])
}

pub fn code_company_status_decoder() {
  decode.string
}

pub fn code_company_status_encode(data: CodeCompanyStatus) {
  json.string(data)
}

pub fn link_with_related_links_decoder() {
  use href <- decode.optional_field(
    "href",
    None,
    decode.optional(decode.string),
  )
  use method_ <- decode.optional_field(
    "method",
    None,
    decode.optional(decode.string),
  )
  use rel <- decode.optional_field("rel", None, decode.optional(decode.string))
  use related <- decode.optional_field(
    "related",
    None,
    decode.optional(decode.list(link_decoder())),
  )
  decode.success(LinkWithRelatedLinks(
    href: href,
    method_: method_,
    rel: rel,
    related: related,
  ))
}

pub fn link_with_related_links_encode(data: LinkWithRelatedLinks) {
  json.object([
    #("href", json.nullable(data.href, json.string)),
    #("method", json.nullable(data.method_, json.string)),
    #("rel", json.nullable(data.rel, json.string)),
    #("related", json.nullable(data.related, json.array(_, link_encode))),
  ])
}

pub fn code_provider_type_decoder() {
  decode.string
}

pub fn code_provider_type_encode(data: CodeProviderType) {
  json.string(data)
}

pub fn school_unit_relation_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(org_school_unit_data_decoder())),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(school_unit_links_decoder()),
  )
  decode.success(SchoolUnitRelation(data: data, links: links))
}

pub fn school_unit_relation_encode(data: SchoolUnitRelation) {
  json.object([
    #(
      "data",
      json.nullable(data.data, json.array(_, org_school_unit_data_encode)),
    ),
    #("links", json.nullable(data.links, school_unit_links_encode)),
  ])
}

pub fn organizer_included_attributes_decoder() {
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use organizer_type <- decode.optional_field(
    "organizerType",
    None,
    decode.optional(code_organizer_type_decoder()),
  )
  decode.success(OrganizerIncludedAttributes(
    display_name: display_name,
    organizer_type: organizer_type,
  ))
}

pub fn organizer_included_attributes_encode(data: OrganizerIncludedAttributes) {
  json.object([
    #("displayName", json.nullable(data.display_name, json.string)),
    #(
      "organizerType",
      json.nullable(data.organizer_type, code_organizer_type_encode),
    ),
  ])
}

pub fn org_school_unit_relation_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(org_school_unit_data_decoder())),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(link_with_related_links_decoder()),
  )
  decode.success(OrgSchoolUnitRelation(data: data, links: links))
}

pub fn org_school_unit_relation_encode(data: OrgSchoolUnitRelation) {
  json.object([
    #(
      "data",
      json.nullable(data.data, json.array(_, org_school_unit_data_encode)),
    ),
    #("links", json.nullable(data.links, link_with_related_links_encode)),
  ])
}

pub fn organizer_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(organizer_decoder())),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(OrganizerResponseData(attributes: attributes, type_: type_))
}

pub fn organizer_response_data_encode(data: OrganizerResponseData) {
  json.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, organizer_encode)),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn school_unit_info_response_data_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(school_unit_info_decoder()),
  )
  use school_unit_code <- decode.optional_field(
    "schoolUnitCode",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(SchoolUnitInfoResponseData(
    attributes: attributes,
    school_unit_code: school_unit_code,
    type_: type_,
  ))
}

pub fn school_unit_info_response_data_encode(data: SchoolUnitInfoResponseData) {
  json.object([
    #("attributes", json.nullable(data.attributes, school_unit_info_encode)),
    #("schoolUnitCode", json.nullable(data.school_unit_code, json.string)),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn organizer_included_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(organizer_included_attributes_decoder()),
  )
  use links <- decode.optional_field(
    "links",
    None,
    decode.optional(link_decoder()),
  )
  use organization_number <- decode.optional_field(
    "organizationNumber",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(OrganizerIncluded(
    attributes: attributes,
    links: links,
    organization_number: organization_number,
    type_: type_,
  ))
}

pub fn organizer_included_encode(data: OrganizerIncluded) {
  json.object([
    #(
      "attributes",
      json.nullable(data.attributes, organizer_included_attributes_encode),
    ),
    #("links", json.nullable(data.links, link_encode)),
    #(
      "organizationNumber",
      json.nullable(data.organization_number, json.string),
    ),
    #("type", json.nullable(data.type_, json.string)),
  ])
}
