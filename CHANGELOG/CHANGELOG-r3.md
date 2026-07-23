# Changelog CustomerInsights

<!-- TOC:START -->
## Table of Contents
- [r3.1](#r31)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r3.1

## Release Notes

This release candidate contains the definition and documentation of
* customer-insights 0.3.0-rc.1

The API definition(s) are based on
* Commonalities 0.8.0
* Identity and Consent Management 0.5.0

## customer-insights 0.3.0-rc.1

**customer-insights 0.3.0-rc.1 is a release-candidate version of this API.**

Changes documented below are compared to version 0.2.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r3.1/code/API_definitions/customer-insights.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r3.1/code/API_definitions/customer-insights.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/CustomerInsights/blob/r3.1/code/API_definitions/customer-insights.yaml)

### Breaking changes

* idDocument Management Error Scenarios by @PedroDiez in https://github.com/camaraproject/CustomerInsights/pull/65. Two exceptions are removed:
  * `422 - CUSTOMER_INSIGHTS.ID_DOCUMENT_REQUIRED`
  * `422 - CUSTOMER_INSIGHTS.INVALID_IDENTIFIERS`
  * Their scope is covered by existing `422 - SERVICE_NOT_APPLICABLE` exception

### Added

* N/A

### Changed

* Apply CAMARA Commonalities OWASP recommendations by @PedroDiez in https://github.com/camaraproject/CustomerInsights/pull/67. Detailed updates:
  * `x-correlator`, `phoneNumber` and `ErrorInfo` are aligned with Commonalities definitions
  * `idDocument` is set to have a maxLength of 30 characters
* idDocument Management Error Scenarios by @PedroDiez in https://github.com/camaraproject/CustomerInsights/pull/65. Scenarios below indicated are now covered by `422 - SERVICE_NOT_APPLICABLE` exception:
  * idDocument is required by API Provider and is not provided. Former exception: `422 - CUSTOMER_INSIGHTS.ID_DOCUMENT_REQUIRED`
  * idDocument (required) and phoneNumber provided do not point the same susbcription: Former exception: `422 - CUSTOMER_INSIGHTS.INVALID_IDENTIFIERS`
  * Involved tests are also updated
* Update API specification to local CAMARA_common.yaml references by @PedroDiez in https://github.com/camaraproject/CustomerInsights/pull/75
* Testing alignment with Commonalities Spring26 artifacts by @PedroDiez in https://github.com/camaraproject/CustomerInsights/pull/83

### Fixed

* N/A

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/CustomerInsights/compare/r2.2...r3.1

