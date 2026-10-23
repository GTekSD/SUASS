# Changelog

All notable changes to the **GTekSD Tenable CIS Report Generator** are listed here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions are numbered `MAJOR.MINOR`.

## [Unreleased]

### Planned
- Windows Server 2022 overrides and macro (`Generate_Tenable_CIS_Report_WIN2022`).
- Windows Server 2019 overrides and macro (`Generate_Tenable_CIS_Report_WIN2019`).
- Summary sheet with compliance percentage per host.
- Optional sheet listing only Non-Compliant controls.

## [4.0] - 2026-10-23

### Added
- Windows Server 2025 support with the macro `Generate_Tenable_CIS_Report_WIN2025`.
- Four new "Manual Review required" status variants for Windows:
  - `Manual Review required`
  - `Manual Review required (HKU Controls)`
  - `Manual Review required ('wincollect' Controls)`
  - `Manual Review required (Workgroup servers)`
- A distinct cell colour for each manual review variant.
- Status labels are now constants at the top of the module, so a label can be renamed in one place.

### Changed
- Control name matching now ignores leading level tags such as `(L1)` and `(L2)`, and trailing suffixes such as `(MS only)`.
- Curly quotes in control names are converted to straight quotes before matching.

## [3.0] - 2026-10-22

### Added
- GTekSD branding:
  - copyright header in the code;
  - footer line on the report sheet;
  - print header and footer;
  - document properties (Author, Company, Title, Comments);
  - an `About_GTekSD` sheet in every report.
- Brand integrity check: the macro stops if the brand constant has been edited.
- Report files are now named `GTekSD_CIS_Report_<OS>_<timestamp>.xlsx`.

## [2.0] - YYYY-MM-DD

### Added
- RHEL 8 support (`Generate_Tenable_CIS_Report_RHEL8`) with 19 "Exception" controls.
- RHEL 10 support (`Generate_Tenable_CIS_Report_RHEL10`) with 17 "Manual Review required" and 4 "Not Applicable" controls.
- RHEL 9: 16 controls marked "Manual Review required", in addition to the existing overrides.
- New status colour for "Manual Review required".

### Changed
- All macros now share one engine (`BuildReport`) driven by a per-OS override list, replacing the duplicated RHEL 9 code and its `_R9` helper copies.
- `ScreenUpdating` and `DisplayAlerts` are reset if the required columns are missing.
- `NormalizeControlName` no longer fails on empty text.

## [1.1] - YYYY-MM-DD

### Added
- RHEL 9 macro (`Generate_Tenable_CIS_Report_RHEL9`) with status overrides:
  - 4 controls marked "Not Applicable";
  - 19 controls marked "Exception".
- Case-insensitive control name matching that ignores trailing `(Automated)` and `(Manual)` suffixes.
- Grey and amber colours for the new statuses.

### Fixed
- `Sub or Function not defined` error when the RHEL 9 macro could not see the parsing helpers.

## [1.0] - YYYY-MM-DD

### Added
- First release: `Generate_Tenable_CIS_Report`.
- Parses the Tenable `Description` field into Control No., Control Name, Description, Remediation Procedure and Actual Value.
- Multi-host report with Status and Actual Value columns for each host.
- Compliant and Non-Compliant statuses with green and red colouring.
- Removes `.audit` rows, sorts by control number, and saves the result as a timestamped `.xlsx` file.
