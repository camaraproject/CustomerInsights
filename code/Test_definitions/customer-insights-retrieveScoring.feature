Feature: CAMARA Customer Insights API, v0.1 - Operation retrieveScoring
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  #
  # Testing assets:
  # * A phone number whose scoring can be obtained
  #
  # References to OAS spec schemas refer to schemas specifies in customer-insights.yaml

  Background: Common createPayment setup
    Given the resource "/customer-insights/v0.1/scoring/retrieve"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value
    And the request body is set by default to a request body compliant with the schema

  ##############################
  # Happy path scenarios
  ##############################

  @retrieve_scoring_01_generic_success_scenario
  Scenario: Common validations for any success scenario
    # Valid default request body compliant with the schema
    Given the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/ScoringResponse"

  @retrieve_scoring_02_generic_success_scenario_with_id_document_information
  Scenario: Common validations for any success scenario idDocument information provided
    Given the request body property "$.idDocument" is set to a valid value
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/ScoringResponse"

  @retrieve_scoring_03_generic_success_scenario_with_scoring_type_information
  Scenario: Common validations for any success scenario with scoringType information provided
    Given the request body property "$.scoringType" is set with a valid value
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/ScoringResponse"
    And the response body property "$.scoringType" has the same value as the request body property "$.scoringType"

  @retrieve_scoring_04_generic_phone_number_identification_via_access_token
  # Default 3-legged scenario
  Scenario: Baseline Phone Number identification scenario via access token
    Given the header "Authorization" is set to a valid access token associated to a valid phone number existing in the environment
    And the request body is set to "{}"
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/ScoringResponse"

  @retrieve_scoring_05_generic_phone_number_identification_via_request_body
  # Default 2-legged scenario
  Scenario: Baseline Phone Number identification scenario via request body
    Given the header "Authorization" is set to a valid access token not associated to any phone number
    And the request body property "$.phoneNumber" is set to a valid phone number existing in the environment
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/ScoringResponse"

  ##############################
  # Error scenarios
  ##############################

  # Error 400 scenarios

  @retrieve_scoring_400.01_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_C02.01_phone_number_not_schema_compliant
  Scenario: Phone number value does not comply with the schema
    Given the header "Authorization" is set to a valid access which does not identify a single phone number
    And the request body property "$.phoneNumber" does not comply with the OAS schema at "/components/schemas/PhoneNumber"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  # Error 401 scenarios

  @retrieve_scoring_401.01_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_401.02_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_401.03_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  # Error 403 scenarios

  @retrieve_scoring_403.01_invalid_token_permissions
  Scenario: Inconsistent access token permissions
    # To test this scenario, it will be necessary to obtain a token without the required scope
    Given the request body is set to a valid request body
    And the header "Authorization" is set to an access token without the required scope
    When the HTTP "POST" request is sent
    Then the response status code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  # Error 404 scenarios

  @retrieve_scoring_404.01_not_found
  Scenario: Scoring not found
    # To test this, a 2-legged access token is needed, just because if not it triggers test "@retrieve_scoring_C02.03_unnecessary_phone_number"
    Given the header "Authorization" is set to a valid access token not identifying a phone number
    And the request body property "$.phoneNumber" is set to a valid phone number not existing in the environment
    When the HTTP "POST" request is sent
    Then the response status code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  # Error 422 scenarios

  @retrieve_scoring_422.01_scoring_type_not_supported
  Scenario: Scoring type not supported
    Given the header "Authorization" is set to a valid access token
    And the request body property "$.scoringType" is set to a value not supported in the environment
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "CUSTOMER_INSIGHTS.SCALE_TYPE_NOT_SUPPORTED"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_422.02_identifiers_mismatch
  Scenario: Identifiers mismatch
    Given the header "Authorization" is set to a valid access token
    And the request body property "$.phoneNumber" is set to a valid phone number
    And the request body property "$.idDocument" is set to a valid value not associated to user's phone number
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "CUSTOMER_INSIGHTS.IDENTIFIERS_MISMATCH"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_422.03_id_document_not_supported
  # Scenario that may apply depending on Telco Operator business rules
  Scenario: Id Document not supported
    Given the header "Authorization" is set to a valid access token
    And the request body property "$.idDocument" is set to a valid value but not supported by Telco Operator
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "CUSTOMER_INSIGHTS.ID_DOCUMENT_NOT_SUPPORTED"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_422.04_id_document_required
  # Scenario that may apply depending on Telco Operator business rules
  Scenario: Id Document required
    Given the header "Authorization" is set to a valid access token
    And the request body property "$.idDocument" is missing
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "CUSTOMER_INSIGHTS.ID_DOCUMENT_REQUIRED"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_C02.03_unnecessary_phone_number
  Scenario: Phone number not to be included when it can be deduced from the access token
    Given the header "Authorization" is set to a valid access token identifying a phone number
    And the request body property "$.phoneNumber" is set to a valid phone number
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "UNNECESSARY_IDENTIFIER"
    And the response property "$.message" contains a user friendly text

  @retrieve_scoring_C02.04_missing_phone_number
  Scenario: Phone number not included and cannot be deducted from the access token
    Given the header "Authorization" is set to a valid access token which does not identify a single phone number
    And the request body property "$.phoneNumber" is not included
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "MISSING_IDENTIFIER"
    And the response property "$.message" contains a user friendly text

  # When the service is only offered to certain type of subscriptions, e.g. IoT, , B2C, etc
  # Specifically, for Customer Insights API this will be the case of phone numbers of B2B customers
  @retrieve_scoring_C02.05_phone_number_not_supported
  Scenario: Service not available for the phone number
    Given that the service is not available for all phone numbers commercialized by the operator
    And a valid phone number, identified by the token or provided in the request body, for which the service is not applicable
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "SERVICE_NOT_APPLICABLE"
    And the response property "$.message" contains a user friendly text

  # Error 429 scenarios

  @retrieve_scoring_429.01_Too_Many_Requests
  #To test this scenario environment has to be configured to reject requests reaching the threshold limit settled. N is a value defined by the Telco Operator
  Scenario: Request is rejected due to threshold policy
   Given that the environment is configured with a threshold policy of N transactions per second
   And the request body is set to a valid request body
   And the header "Authorization" is set to a valid access token
   And the threshold of requests has been reached
   When the "POST" request is sent
   Then the response status code is 429
   And the response property "$.status" is 429
   And the response property "$.code" is "TOO_MANY_REQUESTS"
   And the response property "$.message" contains a user friendly text

  ##############################
  ##END
  ##############################