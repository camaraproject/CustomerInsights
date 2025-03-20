# Changelog CustomerInsights API Family

## Table of Contents

- [r1.3](#r13)
- [r1.2](#r12)
- [r1.1 - rc](#r11---rc)

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

## r1.3

## Release Notes

This public release contains the definition and documentation of
* Customer Insights v0.1.1

The API definition(s) are based on
* Commonalities v0.5.0
* Identity and Consent Management v0.3.0

## Customer Insights v0.1.1

**Customer Insights v0.1.1 is the second public release version of the Customer Insights API.**
- **This version is a Patch Version for the former Public Release:**
  - Fix a typo in an error example 

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r1.3/code/API_definitions/customer-insights.yaml&nocors)
  - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r1.3/code/API_definitions/customer-insights.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/CustomerInsights/blob/r1.3/code/API_definitions/customer-insights.yaml)

### Added
* N/A

### Changed
* N/A

### Fixed
* Typo in error example `GENERIC_422_ID_DOCUMENT_NOT_SUPPORTED` status should read `422` in https://github.com/camaraproject/CustomerInsights/pull/28

### Removed
* N/A

## New Contributors
* N/A


**Full Changelog**: https://github.com/camaraproject/CustomerInsights/compare/r1.2...r1.3


## r1.2

## Release Notes

This public release contains the definition and documentation of
* Customer Insights v0.1.0

The API definition(s) are based on
* Commonalities v0.5.0
* Identity and Consent Management v0.3.0

## Customer Insights v0.1.0

**Customer Insights v0.1.0 is the first public release version of the Customer Insights API.**
- **This version defines a new API:**
  - Initial version covering the following functionality and related endpoints:
    - New endpoint `retrieveScoring`, to retrieve the Scoring information of a user within the operator

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r1.2/code/API_definitions/customer-insights.yaml&nocors)
  - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r1.2/code/API_definitions/customer-insights.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/CustomerInsights/blob/r1.2/code/API_definitions/customer-insights.yaml)

### Added
* Generate User Stories in https://github.com/camaraproject/CustomerInsights/pull/10
* Generate initial API proposal in https://github.com/camaraproject/CustomerInsights/pull/12
* Basic Test cases definition in https://github.com/camaraproject/CustomerInsights/pull/19
* Generate API Readiness Checklist in https://github.com/camaraproject/CustomerInsights/pull/20
* Generate `CHANGELOG.md` in https://github.com/camaraproject/CustomerInsights/pull/21
* Generate Test for 429 Error in https://github.com/camaraproject/CustomerInsights/pull/24

### Changed
* Update API specification version and servers.url in https://github.com/camaraproject/CustomerInsights/pull/24
* Update Test Definitions API version in https://github.com/camaraproject/CustomerInsights/pull/24

### Fixed
* Update `@retrieve_scoring_403.01_invalid_token_permissions` test wording to be more generic in https://github.com/camaraproject/CustomerInsights/pull/24

### Removed
* N/A

## New Contributors
* N/A


**Full Changelog**: https://github.com/camaraproject/CustomerInsights/commits/r1.2


## r1.1 - rc

## Release Notes

This pre-release contains the definition and documentation of
* Customer Insights v0.1.0-rc.1

The API definition(s) are based on
* Commonalities v0.5.0-rc.1
* Identity and Consent Management v0.3.0-rc.1

## Customer Insights v0.1.0-rc.1

**Customer Insights v0.1.0-rc.1 is the first release-candidate version for v0.1.0 of the Customer Insights API.**
- **This version defines a new API:**
  - Initial version covering the following functionality and related endpoints:
    - New endpoint `retrieveScoring`, to retrieve the Scoring information of a user within the operator

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r1.1/code/API_definitions/customer-insights.yaml&nocors)
  - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/CustomerInsights/r1.1/code/API_definitions/customer-insights.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/CustomerInsights/blob/r1.1/code/API_definitions/customer-insights.yaml)

### Added
* Generate User Stories in https://github.com/camaraproject/CustomerInsights/pull/10
* Generate initial API proposal in https://github.com/camaraproject/CustomerInsights/pull/12
* Basic Test cases definition in https://github.com/camaraproject/CustomerInsights/pull/19
* Generate API Readiness Checklist in https://github.com/camaraproject/CustomerInsights/pull/20
* Generate `CHANGELOG.md` in https://github.com/camaraproject/CustomerInsights/pull/21

### Changed
* N/A

### Fixed
* N/A

### Removed
* N/A

## New Contributors
* N/A


**Full Changelog**: https://github.com/camaraproject/CustomerInsights/commits/r1.1
