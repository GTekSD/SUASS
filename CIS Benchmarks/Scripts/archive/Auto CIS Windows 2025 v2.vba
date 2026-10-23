Option Explicit

' ==========================================================================================
'                               GTekSD CIS AUTOMATION FRAMEWORK
' ==========================================================================================
'
' Copyright © 2026 GTekSD, Suhas Dhole. All Rights Reserved.
'
' Author      : Suhas Dhole
' Organization: GTekSD
' Product     : CIS Windows Compliance Automation Framework
' Version     : Enterprise Edition
'
' CONFIDENTIAL AND PROPRIETARY
'
' This source code and all associated components, including but not limited to
' scripts, logic, workflows, templates, reports, methodologies, documentation,
' and intellectual property, are proprietary assets of GTekSD and Suhas Dhole.
'
' Unauthorized access, disclosure, copying, redistribution, modification,
' reverse engineering, decompilation, publication, commercial exploitation,
' reselling, sublicensing, or transmission of this source code, in whole or
' in part, is strictly prohibited without prior written authorization.
'
' This software is intended solely for authorized internal business use.
'
' Any individual or organization found using, reproducing, distributing,
' modifying, or claiming ownership of this code without explicit permission
' may be subject to legal action under applicable copyright, intellectual
' property, trade secret, and information security laws.
'
' Removal or modification of this copyright notice does not waive ownership
' rights and does not grant any license to use this software.
'
' GTekSD and Suhas Dhole expressly reserve all rights, title, ownership,
' and interest in this software and all derivative works.
'
' © 2026 GTekSD, Suhas Dhole
' ALL RIGHTS RESERVED.
'
' ==========================================================================================

Sub CIS_Windows_2025_GTekSD_Automation()

    Dim wbScan As Workbook
    Dim wsScan As Worksheet
    Dim wsTemplate As Worksheet
    Dim wsOut As Worksheet

    Dim dictHosts As Object
    Dim dictFail1 As Object
    Dim dictVal1 As Object

    Dim lastRow As Long
    Dim i As Long
    Dim rowOut As Long
    Dim colOut As Long

    Dim controlNo As String
    Dim host As String
    Dim risk As String
    Dim key As String
    Dim val1 As String

    Dim hostKey As Variant
    Dim basePath As String

    ' =========================
    ' OPEN FILE
    ' =========================
    basePath = ThisWorkbook.Path & "\"

    Set wbScan = Workbooks.Open(basePath & "scan.csv")
    Set wsScan = wbScan.Sheets(1)

    ' =========================
    ' CREATE DICTIONARIES
    ' =========================
    Set dictHosts = CreateObject("Scripting.Dictionary")
    Set dictFail1 = CreateObject("Scripting.Dictionary")
    Set dictVal1 = CreateObject("Scripting.Dictionary")

    ' =========================
    ' READ CSV
    ' =========================
    lastRow = wsScan.Cells(wsScan.Rows.Count, "J").End(xlUp).Row

    For i = 2 To lastRow

        controlNo = CleanControl(wsScan.Cells(i, "J").Value)
        host = Trim(wsScan.Cells(i, "E").Value)
        risk = UCase(Trim(wsScan.Cells(i, "D").Value))

        key = controlNo & "|" & host

        dictHosts(host) = True
        dictVal1(key) = ExtractValue(wsScan.Cells(i, "J").Value)

        If risk = "FAILED" Or risk = "WARNING" Then
            dictFail1(key) = True
        End If

    Next i

    ' =========================
    ' PROCESS TEMPLATE SHEETS
    ' =========================
    For Each wsTemplate In Workbooks("Temp.xlsx").Worksheets

        If wsTemplate.Cells(2, 1).Value = "" Then GoTo NextSheet

        Application.DisplayAlerts = False

        On Error Resume Next
        Worksheets("CIS_" & Left(wsTemplate.Name, 25)).Delete
        On Error GoTo 0

        Application.DisplayAlerts = True

        Set wsOut = Workbooks("Temp.xlsx").Sheets.Add

        wsOut.Name = "CIS_" & Left(wsTemplate.Name, 25)

        ' ==================================================
        ' GTekSD COPYRIGHT BANNER
        ' ==================================================
        wsOut.Range("A1").Value = _
        "© 2026 GTekSD | Suhas Dhole | All Rights Reserved | Confidential & Proprietary"

        With wsOut.Range("A1")
            .Font.Bold = True
            .Font.Size = 11
            .Font.Color = RGB(255, 255, 255)
            .Interior.Color = RGB(31, 78, 121)
        End With

        wsOut.Range("A1:E1").Merge

        ' ==================================================
        ' HEADER
        ' ==================================================
        wsTemplate.Rows(1).Copy
        wsOut.Rows(2).PasteSpecial Paste:=xlPasteFormats

        wsOut.Cells(2, 1).Resize(1, 5).Value = _
        Array("Control No", "Control Name", "Description", "Impact", "Remediation")

        ' ==================================================
        ' HOST COLUMNS
        ' ==================================================
        colOut = 6

        For Each hostKey In dictHosts.Keys

            wsOut.Cells(2, colOut).Value = hostKey
            wsOut.Cells(2, colOut + 1).Value = "Actual Value"

            wsTemplate.Cells(1, 1).Copy

            wsOut.Cells(2, colOut).PasteSpecial xlPasteFormats
            wsOut.Cells(2, colOut + 1).PasteSpecial xlPasteFormats

            wsOut.Columns(colOut).Resize(, 2).Group

            colOut = colOut + 2

        Next hostKey

        Application.CutCopyMode = False

        ' ==================================================
        ' DATA FILLING
        ' ==================================================
        lastRow = wsTemplate.Cells(wsTemplate.Rows.Count, "A").End(xlUp).Row
        rowOut = 3

        For i = 2 To lastRow

            controlNo = Trim(wsTemplate.Cells(i, 1).Value)

            wsOut.Cells(rowOut, 1).Resize(1, 5).Value = _
            wsTemplate.Cells(i, 1).Resize(1, 5).Value

            colOut = 6

            For Each hostKey In dictHosts.Keys

                key = controlNo & "|" & hostKey

                val1 = ""

                If dictVal1.Exists(key) Then
                    val1 = dictVal1(key)
                End If

                ' ======================================
                ' COMPLIANCE STATUS
                ' ======================================
                If dictFail1.Exists(key) Then

                    wsOut.Cells(rowOut, colOut).Value = "Non-Compliant"

                    wsOut.Cells(rowOut, colOut).Interior.Color = RGB(255, 0, 0)

                    wsOut.Cells(rowOut, colOut).Font.Color = RGB(255, 255, 255)

                Else

                    wsOut.Cells(rowOut, colOut).Value = "Compliant"

                    wsOut.Cells(rowOut, colOut).Interior.Color = RGB(0, 176, 80)

                    wsOut.Cells(rowOut, colOut).Font.Color = RGB(255, 255, 255)

                End If

                ' ======================================
                ' ACTUAL VALUE
                ' ======================================
                wsOut.Cells(rowOut, colOut + 1).Value = val1

                colOut = colOut + 2

            Next hostKey

            rowOut = rowOut + 1

        Next i

        ' ==================================================
        ' FINAL FORMATTING
        ' ==================================================
        wsOut.Cells.WrapText = True

        wsOut.UsedRange.Borders.LineStyle = xlContinuous

        wsOut.Rows.AutoFit

        wsOut.Columns.AutoFit

NextSheet:
    Next wsTemplate

    wbScan.Close False

    MsgBox _
        "Boom!!! Windows CIS with Actual Value Completed Successfully ;)" & vbCrLf & vbCrLf & _
        "GTekSD CIS Automation Framework" & vbCrLf & _
        "Copyright © 2026 GTekSD, Suhas Dhole" & vbCrLf & _
        "All Rights Reserved" & vbCrLf & vbCrLf & _
        "Confidential & Proprietary Software", _
        vbInformation, _
        "GTekSD Enterprise Automation"

End Sub


' ==========================================================================================
' HELPER FUNCTIONS
' ==========================================================================================

Function ExtractValue(txt As String) As String

    Dim pos As Long

    txt = Replace(txt, vbCr, "")
    txt = Replace(txt, vbLf, "")

    pos = InStr(1, txt, "Actual Value:", vbTextCompare)

    If pos > 0 Then
        ExtractValue = Trim(Mid(txt, pos + 13))
        Exit Function
    End If

    pos = InStr(1, txt, "Error:", vbTextCompare)

    If pos > 0 Then
        ExtractValue = Trim(Mid(txt, pos + 6))
        Exit Function
    End If

    ExtractValue = ""

End Function


Function CleanControl(txt As String) As String

    txt = Replace(txt, """", "")

    CleanControl = Trim(Split(txt, " ")(0))

End Function

