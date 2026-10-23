Option Explicit

'=====================================================================
'  GTekSD - Tenable CIS Compliance Report Generator
'  Copyright (c) 2026 GTekSD. All rights reserved.
'
'  This macro is the intellectual property of GTekSD.
'  Copying, redistributing, rebranding or removing this notice
'  without written permission from GTekSD is prohibited.
'=====================================================================

Private Const BRAND_NAME As String = "GTekSD"
Private Const BRAND_TOOL As String = "GTekSD Tenable CIS Report Generator"
Private Const BRAND_VER As String = "v4.0"
Private Const BRAND_YEAR As String = "2026"

' Status labels (used for both the override lists and the colouring)
Private Const ST_COMPLIANT As String = "Compliant"
Private Const ST_NONCOMPLIANT As String = "Non-Compliant"
Private Const ST_NA As String = "Not Applicable"
Private Const ST_EXCEPTION As String = "Exception"
Private Const ST_MANUAL As String = "Manual Review required"
Private Const ST_HKU As String = "Manual Review required (HKU Controls)"
Private Const ST_WINCOLLECT As String = "Manual Review required ('wincollect' Controls)"
Private Const ST_WORKGROUP As String = "Manual Review required (Workgroup servers)"


'=====================================================================
' ENTRY POINTS  (run one of these from Alt+F8)
'=====================================================================
Sub Generate_Tenable_CIS_Report()
    BuildReport ""          ' no overrides (other OS versions)
End Sub

Sub Generate_Tenable_CIS_Report_RHEL8()
    BuildReport "RHEL8"
End Sub

Sub Generate_Tenable_CIS_Report_RHEL9()
    BuildReport "RHEL9"
End Sub

Sub Generate_Tenable_CIS_Report_RHEL10()
    BuildReport "RHEL10"
End Sub

Sub Generate_Tenable_CIS_Report_WIN2025()
    BuildReport "WIN2025"
End Sub


'=====================================================================
' BRAND INTEGRITY CHECK
' Compares the brand constant against a value built from character
' codes, so a simple find/replace of the brand name stops the macro.
'=====================================================================
Private Function BrandIntact() As Boolean

    Dim Expected As String

    Expected = Chr(71) & Chr(84) & Chr(101) & Chr(107) & Chr(83) & Chr(68)

    BrandIntact = (BRAND_NAME = Expected)

End Function


'=====================================================================
' CORE ENGINE
' OSTag = "" / "RHEL8" / "RHEL9" / "RHEL10" / "WIN2025"
' Status column priority:  OS override  >  Compliant / Non-Compliant
' The raw Tenable result (PASSED/FAILED/WARNING) stays in the host column.
'=====================================================================
Private Sub BuildReport(ByVal OSTag As String)

    Dim wsSrc As Worksheet, wsOut As Worksheet
    Dim LastRow As Long, r As Long
    Dim RiskCol As Long, HostCol As Long, DescCol As Long
    Dim Risk As String, Host As String, RawText As String
    Dim ControlNo As String, ControlName As String
    Dim DescText As String, Remediation As String
    Dim ActualValue As String, StatusText As String, NormName As String
    Dim DictHosts As Object, DictControls As Object, DictOverride As Object
    Dim HostKey As Variant, Key As String
    Dim OutRow As Long, OutCol As Long
    Dim c As Long, LastCol As Long

    If Not BrandIntact() Then
        MsgBox "This tool has been modified and cannot run." & vbCrLf & _
               "Please obtain the original from GTekSD.", vbCritical, "Integrity check failed"
        Exit Sub
    End If

    Application.ScreenUpdating = False
    Application.DisplayAlerts = False

    Set DictHosts = CreateObject("Scripting.Dictionary")
    Set DictControls = CreateObject("Scripting.Dictionary")
    Set DictOverride = CreateObject("Scripting.Dictionary")
    DictOverride.CompareMode = vbTextCompare

    LoadOverrides OSTag, DictOverride

    Set wsSrc = ActiveSheet

    On Error Resume Next
    Sheets("Formatted_Report").Delete
    On Error GoTo 0

    Set wsOut = Worksheets.Add
    wsOut.Name = "Formatted_Report"

    LastRow = wsSrc.Cells(wsSrc.Rows.Count, 1).End(xlUp).Row

    '--- Locate columns ---
    LastCol = wsSrc.Cells(1, wsSrc.Columns.Count).End(xlToLeft).Column

    For c = 1 To LastCol
        Select Case LCase(Trim(wsSrc.Cells(1, c).Value))
            Case "risk":        RiskCol = c
            Case "host":        HostCol = c
            Case "description": DescCol = c
        End Select
    Next c

    If RiskCol = 0 Or HostCol = 0 Or DescCol = 0 Then
        MsgBox "Risk, Host or Description column not found.", vbCritical, BRAND_TOOL
        Application.ScreenUpdating = True
        Application.DisplayAlerts = True
        Exit Sub
    End If

    '--- Collect hosts ---
    For r = 2 To LastRow
        Risk = UCase(Trim(wsSrc.Cells(r, RiskCol).Value))
        If Risk = "PASSED" Or Risk = "FAILED" Or Risk = "WARNING" Then
            Host = Trim(wsSrc.Cells(r, HostCol).Value)
            If Not DictHosts.Exists(Host) Then DictHosts.Add Host, 0
        End If
    Next r

    '--- Headers ---
    wsOut.Cells(1, 1) = "Control No."
    wsOut.Cells(1, 2) = "Control Name"
    wsOut.Cells(1, 3) = "Description"
    wsOut.Cells(1, 4) = "Remediation Procedure"

    OutCol = 5
    For Each HostKey In DictHosts.Keys
        wsOut.Cells(1, OutCol) = HostKey
        wsOut.Cells(1, OutCol + 1) = "Status"
        wsOut.Cells(1, OutCol + 2) = "Actual Value"
        DictHosts(HostKey) = OutCol
        OutCol = OutCol + 3
    Next HostKey

    '--- Read data ---
    For r = 2 To LastRow

        Risk = UCase(Trim(wsSrc.Cells(r, RiskCol).Value))
        If Risk <> "PASSED" And Risk <> "FAILED" And Risk <> "WARNING" Then
            GoTo NextRecord
        End If

        Host = Trim(wsSrc.Cells(r, HostCol).Value)
        RawText = wsSrc.Cells(r, DescCol).Value

        ParseDescription RawText, ControlNo, ControlName, _
                         DescText, Remediation, ActualValue

        If ControlNo = "" Then GoTo NextRecord
        If InStr(1, ControlNo, ".audit", vbTextCompare) > 0 Then GoTo NextRecord
        If Not ControlNo Like "[0-9]*" Then GoTo NextRecord

        Key = ControlNo & "|" & ControlName

        If Not DictControls.Exists(Key) Then
            OutRow = wsOut.Cells(wsOut.Rows.Count, 1).End(xlUp).Row + 1
            DictControls.Add Key, OutRow
            wsOut.Cells(OutRow, 1) = ControlNo
            wsOut.Cells(OutRow, 2) = ControlName
            wsOut.Cells(OutRow, 3) = DescText
            wsOut.Cells(OutRow, 4) = Remediation
        Else
            OutRow = DictControls(Key)
        End If

        '--- Status ---
        NormName = NormalizeControlName(ControlName)

        If DictOverride.Exists(NormName) Then
            StatusText = DictOverride(NormName)
        ElseIf Risk = "PASSED" Then
            StatusText = ST_COMPLIANT
        Else
            StatusText = ST_NONCOMPLIANT
        End If

        OutCol = DictHosts(Host)
        wsOut.Cells(OutRow, OutCol) = Risk
        wsOut.Cells(OutRow, OutCol + 1) = StatusText
        wsOut.Cells(OutRow, OutCol + 2) = ActualValue

NextRecord:
    Next r

    '--- Sort ---
    Dim LastUsedRow As Long, LastUsedCol As Long
    LastUsedRow = wsOut.Cells(wsOut.Rows.Count, 1).End(xlUp).Row
    LastUsedCol = wsOut.Cells(1, wsOut.Columns.Count).End(xlToLeft).Column

    wsOut.Sort.SortFields.Clear
    wsOut.Sort.SortFields.Add Key:=wsOut.Range("A2:A" & LastUsedRow), _
        SortOn:=xlSortOnValues, Order:=xlAscending

    With wsOut.Sort
        .SetRange wsOut.Range(wsOut.Cells(1, 1), wsOut.Cells(LastUsedRow, LastUsedCol))
        .Header = xlYes
        .Apply
    End With

    '--- Formatting ---
    With wsOut
        .Rows(1).Font.Bold = True
        .Rows(1).Interior.Color = RGB(0, 32, 96)
        .Rows(1).Font.Color = RGB(255, 255, 255)
        .Rows(1).AutoFilter
        .UsedRange.WrapText = True
        .Columns.AutoFit
        .Columns("C:D").ColumnWidth = 60
        .UsedRange.Borders.LineStyle = xlContinuous
    End With

    wsOut.Activate
    ActiveWindow.SplitRow = 1
    ActiveWindow.FreezePanes = True

    '--- Colour status ---
    Dim Cell As Range
    For Each Cell In wsOut.UsedRange
        Select Case CStr(Cell.Value)
            Case ST_COMPLIANT:      Cell.Interior.Color = RGB(0, 176, 80)
            Case ST_NONCOMPLIANT:   Cell.Interior.Color = RGB(255, 0, 0)
            Case ST_NA:             Cell.Interior.Color = RGB(166, 166, 166)
            Case ST_EXCEPTION:      Cell.Interior.Color = RGB(255, 192, 0)
            Case ST_MANUAL:         Cell.Interior.Color = RGB(155, 194, 230)
            Case ST_HKU:            Cell.Interior.Color = RGB(204, 192, 218)
            Case ST_WINCOLLECT:     Cell.Interior.Color = RGB(183, 222, 232)
            Case ST_WORKGROUP:      Cell.Interior.Color = RGB(252, 213, 180)
        End Select
    Next Cell

    '--- Branding footer line on the report sheet ---
    With wsOut.Cells(LastUsedRow + 2, 1)
        .Value = "Generated by " & BRAND_TOOL & " " & BRAND_VER & _
                 "  |  " & Chr(169) & " " & BRAND_YEAR & " " & BRAND_NAME & _
                 "  |  " & Format(Now, "dd-mmm-yyyy hh:nn")
        .WrapText = False
        .Font.Bold = True
        .Font.Italic = True
        .Font.Color = RGB(0, 32, 96)
        .Borders.LineStyle = xlNone
    End With

    '--- Print header / footer branding ---
    On Error Resume Next
    With wsOut.PageSetup
        .Orientation = xlLandscape
        .CenterHeader = "&B" & BRAND_TOOL
        .LeftFooter = Chr(169) & " " & BRAND_YEAR & " " & BRAND_NAME
        .RightFooter = "Page &P of &N"
    End With
    On Error GoTo 0

    '--- Save ---
    Dim SavePath As String, Prefix As String
    If OSTag <> "" Then Prefix = OSTag & "_"

    SavePath = ThisWorkbook.Path & "\" & BRAND_NAME & "_CIS_Report_" & Prefix & _
               Format(Now, "yyyymmdd_hhmmss") & ".xlsx"

    wsOut.Copy

    BrandWorkbook ActiveWorkbook, OSTag

    ActiveWorkbook.SaveAs Filename:=SavePath, FileFormat:=xlOpenXMLWorkbook
    ActiveWorkbook.Close False

    Application.ScreenUpdating = True
    Application.DisplayAlerts = True

    MsgBox "Report Generated Successfully!" & vbCrLf & SavePath & vbCrLf & vbCrLf & _
           BRAND_TOOL & " " & BRAND_VER & vbCrLf & _
           Chr(169) & " " & BRAND_YEAR & " " & BRAND_NAME, _
           vbInformation, BRAND_NAME

End Sub


'=====================================================================
' Adds GTekSD document properties and an About sheet to the output file
'=====================================================================
Private Sub BrandWorkbook(ByVal wb As Workbook, ByVal OSTag As String)

    Dim wsInfo As Worksheet
    Dim ScopeText As String

    On Error Resume Next
    wb.BuiltinDocumentProperties("Author").Value = BRAND_NAME
    wb.BuiltinDocumentProperties("Company").Value = BRAND_NAME
    wb.BuiltinDocumentProperties("Title").Value = BRAND_TOOL & " Output"
    wb.BuiltinDocumentProperties("Comments").Value = _
        "Generated by " & BRAND_TOOL & " " & BRAND_VER & ". " & _
        Chr(169) & " " & BRAND_YEAR & " " & BRAND_NAME & ". All rights reserved."
    On Error GoTo 0

    If OSTag = "" Then
        ScopeText = "Generic (no OS overrides)"
    Else
        ScopeText = OSTag
    End If

    Set wsInfo = wb.Worksheets.Add(After:=wb.Sheets(wb.Sheets.Count))
    wsInfo.Name = "About_" & BRAND_NAME

    With wsInfo
        .Range("A1").Value = BRAND_NAME
        .Range("A1").Font.Size = 24
        .Range("A1").Font.Bold = True
        .Range("A1").Font.Color = RGB(0, 32, 96)

        .Range("A2").Value = BRAND_TOOL & " " & BRAND_VER
        .Range("A2").Font.Size = 12
        .Range("A2").Font.Bold = True

        .Range("A4").Value = "Report scope"
        .Range("B4").Value = ScopeText
        .Range("A5").Value = "Generated on"
        .Range("B5").Value = Format(Now, "dd-mmm-yyyy hh:nn:ss")
        .Range("A6").Value = "Generated by user"
        .Range("B6").Value = Environ("USERNAME")
        .Range("A4:A6").Font.Bold = True

        .Range("A8").Value = Chr(169) & " " & BRAND_YEAR & " " & BRAND_NAME & ". All rights reserved."
        .Range("A9").Value = "This report was produced by a proprietary " & BRAND_NAME & " tool."
        .Range("A10").Value = "Unauthorised copying, redistribution or rebranding of the tool is prohibited."

        .Columns("A").ColumnWidth = 24
        .Columns("B").ColumnWidth = 40
    End With

    wb.Worksheets(1).Activate

End Sub


'=====================================================================
' OVERRIDE LISTS PER OS
' To add Windows Server 2022 / 2019 later, copy the WIN2025 block,
' rename the Case tag, add an entry-point macro, and edit the lists.
'=====================================================================
Private Sub LoadOverrides(ByVal OSTag As String, ByRef Dict As Object)

    Select Case OSTag

        '-------------------------------------------------------------
        Case "WIN2025"
        '-------------------------------------------------------------
            AddList Dict, ST_MANUAL, Array( _
                "Ensure 'Always prompt for password upon connection' is set to 'Enabled'", _
                "Configure 'Interactive logon: Message text for users attempting to log on'", _
                "Configure 'Interactive logon: Message title for users attempting to log on'")

            AddList Dict, ST_HKU, Array( _
                "Ensure 'Turn off toast notifications on the lock screen' is set to 'Enabled'", _
                "Ensure 'Turn off Help Experience Improvement Program' is set to 'Enabled'", _
                "Ensure 'Prevent users from sharing files within their profile.' is set to 'Enabled'", _
                "Ensure 'Prevent Codec Download' is set to 'Enabled'", _
                "Ensure 'Do not preserve zone information in file attachments' is set to 'Disabled'", _
                "Ensure 'Notify antivirus programs when opening attachments' is set to 'Enabled'", _
                "Ensure 'Configure Windows spotlight on lock screen' is set to 'Disabled'", _
                "Ensure 'Do not suggest third-party content in Windows spotlight' is set to 'Enabled'", _
                "Ensure 'Do not use diagnostic data for tailored experiences' is set to 'Enabled'", _
                "Ensure 'Turn off all Windows spotlight features' is set to 'Enabled'", _
                "Ensure 'Turn off Spotlight collection on Desktop' is set to 'Enabled'")

            AddList Dict, ST_WINCOLLECT, Array( _
                "Ensure 'Access Credential Manager as a trusted caller' is set to 'No One'", _
                "Ensure 'Change the system time' is set to 'Administrators, LOCAL SERVICE'", _
                "Ensure 'Create a token object' is set to 'No One'", _
                "Ensure 'Create global objects' is set to 'Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE'", _
                "Ensure 'Debug programs' is set to 'Administrators'", _
                "Ensure 'Generate security audits' is set to 'LOCAL SERVICE, NETWORK SERVICE, RESTRICTED SERVICES\PrintSpoolerService'", _
                "Ensure 'Impersonate a client after authentication' is set to 'Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE, RESTRICTED SERVICES\PrintSpoolerService' (MS only)", _
                "Ensure 'Manage auditing and security log' is set to 'Administrators' (MS only)", _
                "Ensure 'Modify firmware environment values' is set to 'Administrators'", _
                "Ensure 'Profile system performance' is set to 'Administrators, NT SERVICE\WdiServiceHost'", _
                "Ensure 'Replace a process level token' is set to 'LOCAL SERVICE, NETWORK SERVICE'", _
                "Ensure 'Shut down the system' is set to 'Administrators'", _
                "Ensure 'Take ownership of files or other objects' is set to 'Administrators'")

            AddList Dict, ST_WORKGROUP, Array( _
                "Ensure 'Apply UAC restrictions to local accounts on network logons' is set to 'Enabled' (MS only)", _
                "Ensure 'Deny access to this computer from the network' to include 'Guests, Local account and member of Administrators group' (MS only)", _
                "Ensure 'Deny log on through Remote Desktop Services' is set to 'Guests, Local account' (MS only)")

        '-------------------------------------------------------------
        Case "RHEL9"
        '-------------------------------------------------------------
            AddList Dict, ST_NA, Array( _
                "Ensure systemd-journal-upload authentication is configured", _
                "Ensure systemd-journal-remote is installed", _
                "Ensure systemd-journal-upload is enabled and active", _
                "Ensure journald ForwardToSyslog is disabled")

            AddList Dict, ST_EXCEPTION, Array( _
                "Ensure the SELinux mode is enforcing", _
                "Ensure SELinux is installed", _
                "Ensure SELinux is not disabled in bootloader configuration", _
                "Ensure SELinux policy is configured", _
                "Ensure the SELinux mode is not disabled", _
                "Ensure a single firewall configuration utility is in use", _
                "Ensure nftables base chains exist", _
                "Ensure nftables established connections are configured", _
                "Ensure nftables default deny firewall policy", _
                "Ensure nftables loopback traffic is configured", _
                "Ensure sudo authentication timeout is configured correctly", _
                "Ensure IPv6 status is identified", _
                "Ensure firewalld drops unnecessary services and ports", _
                "Ensure users must provide password for escalation", _
                "Ensure ipv6 router advertisements are not accepted", _
                "Ensure firewalld loopback traffic is configured", _
                "Ensure AIDE is installed", _
                "Ensure filesystem integrity is regularly checked", _
                "Ensure cryptographic mechanisms are used to protect the integrity of audit tools")

            AddList Dict, ST_MANUAL, Array( _
                "Ensure repo_gpgcheck is globally activated", _
                "Ensure unused filesystems kernel modules are not available", _
                "Ensure GPG keys are configured", _
                "Ensure package manager repositories are configured", _
                "Ensure only approved services are listening on a network interface", _
                "Ensure journald log file access is configured", _
                "Ensure journald log file rotation is configured", _
                "Ensure rsyslog logrotate is configured", _
                "Ensure SUID and SGID files are reviewed", _
                "Ensure updates, patches, and additional security software are installed", _
                "Ensure local login warning banner is configured properly", _
                "Ensure remote login warning banner is configured properly", _
                "Ensure chrony is configured", _
                "Ensure sshd PermitRootLogin is disabled", _
                "Ensure sshd Banner is configured", _
                "Ensure rsyslog logging is configured")

        '-------------------------------------------------------------
        Case "RHEL8"
        '-------------------------------------------------------------
            AddList Dict, ST_EXCEPTION, Array( _
                "Ensure SELinux is installed", _
                "Ensure SELinux is not disabled in bootloader configuration", _
                "Ensure SELinux policy is configured", _
                "Ensure the SELinux mode is not disabled", _
                "Ensure IPv6 status is identified", _
                "Ensure firewalld.service is configured", _
                "Ensure firewalld active zone target is configured", _
                "Ensure firewalld loopback traffic is configured", _
                "Ensure firewalld loopback source address traffic is configured", _
                "Ensure firewalld services and ports are configured", _
                "Ensure AIDE is installed", _
                "Ensure filesystem integrity is regularly checked", _
                "Ensure cryptographic mechanisms are used to protect the integrity of audit tools", _
                "Ensure systemd-journal-remote is installed", _
                "Ensure systemd-journal-remote authentication is configured", _
                "Ensure systemd-journal-upload is enabled and active", _
                "Ensure systemd-journal-remote service is not in use", _
                "Ensure the SELinux mode is enforcing", _
                "Ensure users must provide password for escalation")

        '-------------------------------------------------------------
        Case "RHEL10"
        '-------------------------------------------------------------
            AddList Dict, ST_MANUAL, Array( _
                "Ensure unused filesystems kernel modules are not available", _
                "Ensure GPG keys are configured", _
                "Ensure gpgcheck is configured", _
                "Ensure package manager repositories are configured", _
                "Ensure updates, patches, and additional security software are installed", _
                "Ensure only approved services are listening on a network interface", _
                "Ensure IPv6 status is identified", _
                "Ensure firewalld active zone target is configured", _
                "Ensure firewalld services and ports are configured", _
                "Ensure journald log file access is configured", _
                "Ensure journald log file rotation is configured", _
                "Ensure rsyslog logrotate is configured", _
                "Ensure SUID and SGID files are reviewed", _
                "Ensure repo_gpgcheck is globally activated", _
                "Ensure no unconfined services exist", _
                "Ensure audit log storage size is configured", _
                "Ensure audit tools owner is configured")

            AddList Dict, ST_NA, Array( _
                "Ensure journald ForwardToSyslog is disabled", _
                "Ensure systemd-journal-remote is installed", _
                "Ensure systemd-journal-upload authentication is configured", _
                "Ensure systemd-journal-upload is enabled and active")

    End Select

End Sub

Private Sub AddList(ByRef Dict As Object, ByVal StatusValue As String, ByVal Items As Variant)

    Dim item As Variant

    For Each item In Items
        Dict(NormalizeControlName(CStr(item))) = StatusValue
    Next item

End Sub


'=====================================================================
' Normalise a control name for matching:
'   - lowercase, trim, straighten curly quotes
'   - strip leading level tags such as "(L1)", "(L2)", "(BL)", "(NG)"
'   - strip trailing "(Automated)", "(Manual)", "(MS only)", "(DC only)"
'   - strip trailing dots / spaces
'=====================================================================
Function NormalizeControlName(ByVal s As String) As String

    Dim p As Long

    s = LCase(Trim(s))

    s = Replace(s, ChrW(8216), "'")
    s = Replace(s, ChrW(8217), "'")
    s = Replace(s, ChrW(8220), Chr(34))
    s = Replace(s, ChrW(8221), Chr(34))

    ' leading "(L1) " style tags
    Do While Left(s, 1) = "("
        p = InStr(s, ")")
        If p > 0 And p <= 6 Then
            s = Trim(Mid(s, p + 1))
        Else
            Exit Do
        End If
    Loop

    ' trailing "(...)" suffix
    If Right(s, 1) = ")" Then
        p = InStrRev(s, "(")
        If p > 1 Then s = Trim(Left(s, p - 1))
    End If

    Do While Len(s) > 0 And (Right(s, 1) = "." Or Right(s, 1) = " ")
        s = Left(s, Len(s) - 1)
    Loop

    NormalizeControlName = s

End Function


'=====================================================================
' HELPERS
'=====================================================================
Function ExtractBetween(TextValue As String, _
                        StartTag As String, _
                        EndTag As String) As String

    Dim p1 As Long
    Dim p2 As Long

    p1 = InStr(1, TextValue, StartTag, vbTextCompare)
    If p1 = 0 Then Exit Function

    p1 = p1 + Len(StartTag)

    If EndTag <> "" Then
        p2 = InStr(p1, TextValue, EndTag, vbTextCompare)
        If p2 > 0 Then
            ExtractBetween = Mid(TextValue, p1, p2 - p1)
        Else
            ExtractBetween = Mid(TextValue, p1)
        End If
    Else
        ExtractBetween = Mid(TextValue, p1)
    End If

End Function

Sub ParseDescription(ByVal RawText As String, _
                     ByRef ControlNo As String, _
                     ByRef ControlName As String, _
                     ByRef DescText As String, _
                     ByRef Remediation As String, _
                     ByRef ActualValue As String)

    Dim q1 As Long
    Dim q2 As Long
    Dim Title As String
    Dim tmp As String
    Dim p As Long

    ControlNo = ""
    ControlName = ""
    DescText = ""
    Remediation = ""
    ActualValue = ""

    q1 = InStr(RawText, Chr(34))
    q2 = InStr(q1 + 1, RawText, Chr(34))

    If q1 > 0 And q2 > q1 Then
        Title = Mid(RawText, q1 + 1, q2 - q1 - 1)
        p = InStr(Title, " ")
        If p > 0 Then
            ControlNo = Left(Title, p - 1)
            ControlName = Mid(Title, p + 1)
        Else
            ControlNo = Title
        End If
    End If

    tmp = Mid(RawText, InStr(RawText, "]") + 1)

    If InStr(tmp, "Solution:") > 0 Then
        DescText = Trim(Left(tmp, InStr(tmp, "Solution:") - 1))
    End If

    Remediation = Trim(ExtractBetween(RawText, "Solution:", "Actual Value:"))

    If Remediation = "" Then
        Remediation = Trim(ExtractBetween(RawText, "Solution:", "Error:"))
    End If

    ActualValue = Trim(ExtractBetween(RawText, "Actual Value:", "Error:"))

    If ActualValue = "" Then
        If InStr(RawText, "Error:") > 0 Then
            ActualValue = "Error: " & Trim(ExtractBetween(RawText, "Error:", ""))
        End If
    End If

End Sub
