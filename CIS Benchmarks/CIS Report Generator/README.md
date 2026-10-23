# GTekSD Tenable CIS Report Generator

![Platform](https://img.shields.io/badge/platform-Microsoft%20Excel-217346)
![Language](https://img.shields.io/badge/language-VBA-blue)
![Version](https://img.shields.io/badge/version-4.0-informational)
![Status](https://img.shields.io/badge/status-active-brightgreen)

An Excel VBA macro that turns a raw **Tenable CIS compliance scan export** into a clean, audit-ready, multi-host compliance report, with OS-specific status overrides for **RHEL 8, RHEL 9, RHEL 10 and Windows Server 2025**.

> Part of the [SUASS](https://github.com/GTekSD/SUASS) collection by **GTekSD**.

---

## Table of Contents

- [Why use this tool](#why-use-this-tool)
- [Features](#features)
- [Supported operating systems](#supported-operating-systems)
- [Requirements](#requirements)
- [Input format](#input-format)
- [Installation](#installation)
- [How to use](#how-to-use)
- [Output](#output)
- [Status legend](#status-legend)
- [OS-specific overrides](#os-specific-overrides)
- [Customising the override lists](#customising-the-override-lists)
- [Adding a new OS](#adding-a-new-os)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)
- [Roadmap](#roadmap)
- [Security and macro notes](#security-and-macro-notes)
- [Disclaimer](#disclaimer)
- [License and copyright](#license-and-copyright)
- [Developer](#developer)

---

## Why use this tool

A Tenable compliance scan export lists one row per host per check. For a fleet of servers that means thousands of rows, with the control title, description, remediation and actual value all packed into one text column. Turning that into something an auditor or system owner can read takes hours of copy-and-paste.

This macro does it in seconds:

- **One row per control**, one column group per host, so you can compare servers side by side.
- **Description, remediation and actual value** split into their own columns.
- **Consistent statuses** (Compliant, Non-Compliant, Exception, Not Applicable, Manual Review) instead of raw PASSED/FAILED/WARNING.
- **Known exceptions and manual checks are applied automatically**, so every report follows the same rules and nobody has to re-mark them by hand.
- **Repeatable output** that looks the same on every run.

## Features

- Parses the Tenable `Description` field into Control No., Control Name, Description, Remediation Procedure and Actual Value.
- Builds a multi-host matrix. Each host gets three columns: the raw result, the status and the actual value.
- Removes `.audit` rows and other non-control rows.
- Status overrides per OS (see [OS-specific overrides](#os-specific-overrides)).
- Colour-coded statuses, frozen header row, filters, wrapped text and borders.
- Report footer, print header and footer, document properties and an `About_GTekSD` sheet in the output.
- Saves the finished report as a separate `.xlsx` file, with a timestamp so nothing is overwritten.
- Matching is tolerant: it ignores case, level tags such as `(L1)`, and suffixes such as `(Automated)` or `(MS only)`.

## Supported operating systems

| OS | Macro to run | Overrides applied |
|---|---|---|
| Any other OS (generic) | `Generate_Tenable_CIS_Report` | None |
| RHEL 8 | `Generate_Tenable_CIS_Report_RHEL8` | Exception |
| RHEL 9 | `Generate_Tenable_CIS_Report_RHEL9` | Not Applicable, Exception, Manual Review |
| RHEL 10 | `Generate_Tenable_CIS_Report_RHEL10` | Manual Review, Not Applicable |
| Windows Server 2025 | `Generate_Tenable_CIS_Report_WIN2025` | Four Manual Review variants |
| Windows Server 2022 | Planned | |
| Windows Server 2019 | Planned | |

## Requirements

- Windows PC with **Microsoft Excel** (Microsoft 365, 2019 or later recommended).
- Macros enabled in Excel.
- A Tenable compliance scan result exported to CSV or Excel (see [Input format](#input-format)).

The macro uses `Scripting.Dictionary`, which is available on Windows. It is **not supported on Excel for Mac or Excel Online**.

## Input format

Open your Tenable export in Excel. The first row must contain these headers (not case sensitive):

| Header | Purpose |
|---|---|
| `Risk` | Scan result. Only `PASSED`, `FAILED` and `WARNING` rows are processed. |
| `Host` | Host name or IP. One column group is created per unique host. |
| `Description` | The Tenable compliance text that holds the control title, remediation and actual value. |

Other columns are ignored. If any of the three required headers is missing, the macro shows an error and stops.

## Installation

1. Download `GTekSD_Tenable_CIS_Report_v4.bas` from this folder.
2. Open Excel and press **Alt + F11** to open the VBA editor.
3. Choose **File → Import File…** and select the `.bas` file.
4. If you have an older version of this script, remove it first so no routine is declared twice.
5. Run **Debug → Compile VBAProject** to confirm there are no errors.
6. Save your workbook as **Excel Macro-Enabled Workbook (`.xlsm`)**.

> **Important:** reports are saved in the same folder as the workbook that holds the macro. Save that workbook somewhere first (for example `C:\CIS\`). An unsaved workbook has no folder, and a workbook in Excel's personal macro folder would save reports there.

## How to use

1. Open the workbook that contains the macro, and open your Tenable export in Excel (or copy its data into a sheet in the same workbook).
2. Click the sheet that holds the scan data so it is the **active sheet**.
3. Press **Alt + F8**, choose the macro that matches your OS, and click **Run**.
   - RHEL 9 scan: `Generate_Tenable_CIS_Report_RHEL9`
   - Windows Server 2025 scan: `Generate_Tenable_CIS_Report_WIN2025`
4. Wait a few seconds. A message box shows the path of the finished report.
5. Open the generated `.xlsx` file.

Tip: assign a macro to a button on the sheet (**Developer → Insert → Button**) for one-click use.

Run **one OS per export**. If a single export mixes OS versions, split it by OS first, because overrides apply to the whole sheet.

## Output

The report file is named:

```
GTekSD_CIS_Report_<OS>_<yyyymmdd_hhmmss>.xlsx
```

It contains two sheets.

**`Formatted_Report`**

| Control No. | Control Name | Description | Remediation Procedure | *Host A* | Status | Actual Value | *Host B* | Status | Actual Value | ... |
|---|---|---|---|---|---|---|---|---|---|---|

- Sorted by control number.
- Under each host: the raw Tenable result, the final status, and the actual value found.
- Header row is frozen and filterable.

**`About_GTekSD`**: report scope, generation time, user, and copyright notice.

The `Formatted_Report` sheet is also added to your source workbook, and replaced on each run.

## Status legend

| Status | Colour | Meaning |
|---|---|---|
| Compliant | Green | The check passed. |
| Non-Compliant | Red | The check failed or returned a warning. |
| Not Applicable | Grey | The control does not apply to this OS or build. |
| Exception | Amber | A known, accepted deviation. |
| Manual Review required | Light blue | Needs a person to verify; the scan cannot decide. |
| Manual Review required (HKU Controls) | Light purple | Per-user registry (HKU) settings that need manual review. |
| Manual Review required ('wincollect' Controls) | Light teal | User-rights settings checked through the wincollect process. |
| Manual Review required (Workgroup servers) | Light orange | Settings that need manual review on workgroup (non-domain) servers. |

An override **replaces** Compliant or Non-Compliant. The raw Tenable result stays visible in the host column, so nothing is hidden.

## OS-specific overrides

| OS | Not Applicable | Exception | Manual Review (all variants) |
|---|---|---|---|
| RHEL 8 | | 19 | |
| RHEL 9 | 4 | 19 | 16 |
| RHEL 10 | 4 | | 17 |
| Windows Server 2025 | | | 30 (3 standard, 11 HKU, 13 wincollect, 3 workgroup) |

The full lists are in the `LoadOverrides` routine inside the script.

## Customising the override lists

1. Open the VBA editor (**Alt + F11**) and find `LoadOverrides`.
2. Locate the `Case` block for your OS.
3. Add or remove control names in the matching `AddList` call. Use the title text, for example:

```vba
"Ensure AIDE is installed", _
```

Matching ignores case, a leading `(L1)` or `(L2)` tag, and a trailing `(Automated)`, `(Manual)` or `(MS only)`. Keep a comma and the `_` line continuation at the end of every line except the last one in each list.

## Adding a new OS

1. Add an entry macro:

```vba
Sub Generate_Tenable_CIS_Report_WIN2022()
    BuildReport "WIN2022"
End Sub
```

2. Add a matching `Case "WIN2022"` block in `LoadOverrides`, with its lists.
3. If you need a new status, add a constant such as `ST_NEW`, give it a colour in the "Colour status" section, and use it in `AddList`.

## Troubleshooting

| Problem | Cause and fix |
|---|---|
| `Sub or Function not defined` | A routine is missing. Import the whole `.bas` file, remove older copies, and run **Debug → Compile VBAProject**. |
| `Risk, Host or Description column not found` | Row 1 must hold those exact headers. Check for extra title rows above them. |
| Report saved in an unexpected folder | Reports go beside the workbook that holds the macro. Save that workbook in a known folder first. |
| A control was not overridden | Compare its text in the `Control Name` column with the list in `LoadOverrides`. A small wording difference prevents a match. |
| Nothing happens, or macros are blocked | Enable macros: **File → Options → Trust Center → Trust Center Settings → Macro Settings**. If the file came from the internet, right-click it, open **Properties**, and tick **Unblock**. |
| `Integrity check failed` message | The brand constant was edited. Re-download the original script. |
| Slow on very large exports | Close other workbooks, and keep the export to the hosts you need. |

## FAQ

**Does it change my original scan data?**
No. It reads the active sheet and writes to a new `Formatted_Report` sheet and a new `.xlsx` file.

**Does it connect to the internet or send data anywhere?**
No. It runs entirely inside Excel, and it does not make network calls.

**Why are some controls blank for a host?**
That host's scan did not include the control, or the row was filtered out (non-control rows and `.audit` rows are removed).

**Can I use it for CIS benchmarks of other operating systems?**
Yes. The generic `Generate_Tenable_CIS_Report` macro works on any export that follows the same format, with no overrides.

## Roadmap

- [ ] Windows Server 2022
- [ ] Windows Server 2019
- [ ] Summary sheet with compliance percentage per host
- [ ] Optional separate sheet listing only Non-Compliant controls

## Security and macro notes

- Review any macro before running it. This script is plain VBA and contains no network, file-deletion or system calls beyond saving the report next to your workbook.
- Do not enable macros for files from sources you do not trust.
- Scan exports contain host names and configuration details. Handle generated reports according to your organisation's data policy.

## Disclaimer

This tool is provided **as is**, without warranty of any kind. The override lists reflect a specific reporting policy and are not part of the official CIS Benchmarks or of Tenable's output. Check the lists against your own policy before using a report for an audit or sign-off. CIS and Tenable are trademarks of their respective owners; this project is not affiliated with or endorsed by either.

## License and copyright

Copyright (c) 2026 **GTekSD**. All rights reserved.

Copying, redistributing, rebranding or removing the copyright notice without written permission from GTekSD is prohibited. See the `LICENSE` file in the repository, if present, for the full terms.

## Developer

**Сухас Дхолз**
GitHub: [github.com/GTekSD](https://github.com/GTekSD)
Project: [github.com/GTekSD/SUASS](https://github.com/GTekSD/SUASS)

Found a bug or want another OS added? Open an [issue](https://github.com/GTekSD/SUASS/issues) in the repository.
