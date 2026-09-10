# GTekSD CIS Windows Compliance Automation Framework

**Author:** Suhas Dhole
**Organization:** GTekSD
**Version:** Enterprise Edition
**License:** Proprietary — All Rights Reserved (see [License](#license))

A VBA macro for Microsoft Excel that automates the generation of **CIS (Center for Internet Security) Windows compliance reports**. It ingests a raw compliance scan CSV, cross-references it against a control template workbook, and produces a fully formatted, color-coded, multi-host compliance report — one output sheet per template sheet.

---

## What It Does

Given:
- A **scan results file** (`scan.csv`) containing per-host, per-control compliance data
- A **template workbook** (`Temp.xlsx`) containing one sheet per CIS benchmark category, each listing controls (Control No, Control Name, Description, Impact, Remediation)

The macro will:
1. Parse `scan.csv` and build lookup tables of hosts, actual values, and pass/fail status per control.
2. For each sheet in `Temp.xlsx`, generate a new output sheet (`CIS_<TemplateSheetName>`) containing:
   - A copyright/confidentiality banner row
   - Standard control columns (Control No, Control Name, Description, Impact, Remediation)
   - One pair of columns **per host** (`Compliant/Non-Compliant` status + `Actual Value`), grouped/collapsible
   - Color-coded compliance cells: 🟩 green = Compliant, 🟥 red = Non-Compliant
3. Auto-fit rows/columns, apply borders and word-wrap for a print/share-ready report.
4. Display a completion message box when finished.

---

## Repository Structure

```
.
├── CIS_Windows_2025_GTekSD_Automation.bas   # The VBA module (source in this repo)
├── Temp.xlsx                                # Control template workbook (you provide/maintain)
├── scan.csv                                 # Raw compliance scan export (you provide, per run)
└── README.md
```

> **Note:** `Temp.xlsx` and `scan.csv` are runtime inputs and are typically *not* committed to the repo if they contain sensitive host/scan data. Consider adding them to `.gitignore` and instead committing a sanitized sample/template.

---

## Prerequisites

- Microsoft Excel (Windows), with **macros enabled**
- `Temp.xlsx` must be **open in the same Excel session** as the macro is run (the macro references it by workbook name: `Workbooks("Temp.xlsx")`)
- `scan.csv` must be located in the **same folder as the workbook running the macro** (`ThisWorkbook.Path`)
- The scan CSV must have, at minimum:
  - Column **D**: Risk/Status (`FAILED`, `WARNING`, or other)
  - Column **E**: Hostname
  - Column **J**: Control number + result text (e.g., `"1.1.1 ... Actual Value: ..."` or `"... Error: ..."`)
- Each template sheet in `Temp.xlsx` must have data starting in row 2, with columns A–E populated as `Control No, Control Name, Description, Impact, Remediation`

---

## How to Run in Microsoft Excel

### Step 1 — Prepare your files
Place the following in the **same folder**:
- The workbook you'll run the macro from (this is `ThisWorkbook`)
- `scan.csv` (your compliance scan export)

Also have `Temp.xlsx` (the control template) **open** in Excel before running the macro.

### Step 2 — Enable macros
1. Open Excel.
2. Go to **File → Options → Trust Center → Trust Center Settings → Macro Settings**.
3. Select **"Enable all macros"** (or **"Disable with notification"** and click *Enable Content* when prompted later).
4. Also enable **"Trust access to the VBA project object model"** under **Developer Macro Settings** if you plan to import/run modules programmatically.

### Step 3 — Import the macro
1. Open the workbook you want to run the macro from.
2. Press **Alt + F11** to open the VBA Editor (VBE).
3. In the VBE, go to **File → Import File…**
4. Select `CIS_Windows_2025_GTekSD_Automation.bas` and import it as a new module.
5. Close the VBA Editor (**Alt + Q** or **Alt + F11** again).

### Step 4 — Save as a macro-enabled workbook
- Save the workbook using **File → Save As**, and choose file type **Excel Macro-Enabled Workbook (\*.xlsm)** — a `.xlsx` file cannot store macros.

### Step 5 — Run the macro
1. Make sure `Temp.xlsx` is already open.
2. Ensure `scan.csv` is present in the same folder as your `.xlsm` workbook.
3. Press **Alt + F8** to open the Macro dialog.
4. Select **`CIS_Windows_2025_GTekSD_Automation`**.
5. Click **Run**.
6. Wait for the confirmation message box:
   > *"Boom!!! Windows CIS with Actual Value Completed Successfully ;)"*

### Step 6 — Review the output
- New sheets named `CIS_<TemplateSheetName>` will appear in `Temp.xlsx`, one per original template sheet, with per-host compliance data filled in and color-coded.
- Save `Temp.xlsx` to preserve the generated report.

---

## Troubleshooting

| Issue | Likely Cause |
|---|---|
| `Run-time error 9: Subscript out of range` on `Workbooks("Temp.xlsx")` | `Temp.xlsx` isn't open, or was opened with a different filename/version suffix (e.g. `Temp1.xlsx`) |
| `scan.csv` not found | The CSV isn't in the same folder as the workbook running the macro |
| Blank "Actual Value" columns | Column J in `scan.csv` doesn't contain the literal text `Actual Value:` or `Error:` |
| No host columns generated | Column E (hostname) in `scan.csv` is empty for all rows |
| Macro button/option missing | Macros are disabled, or the file was saved as `.xlsx` instead of `.xlsm` |

---

## License

```
Copyright © 2026 GTekSD, Suhas Dhole. All Rights Reserved.

CONFIDENTIAL AND PROPRIETARY

This source code and all associated components are proprietary assets of
GTekSD and Suhas Dhole. Unauthorized access, disclosure, copying,
redistribution, modification, reverse engineering, decompilation,
publication, commercial exploitation, reselling, sublicensing, or
transmission of this source code, in whole or in part, is strictly
prohibited without prior written authorization.

This software is intended solely for authorized internal business use.
```

If publishing this repository publicly on GitHub, ensure your intended license terms are reflected accurately — a public repo with an "All Rights Reserved" proprietary notice typically means visitors may view but **not reuse, copy, or redistribute** the code without your explicit permission. Consider adding a formal `LICENSE` file matching the terms above for clarity.

---

## Contributing

This is proprietary internal tooling. External contributions are not accepted unless explicitly authorized by GTekSD / Suhas Dhole.
