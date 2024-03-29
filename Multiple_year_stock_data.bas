Attribute VB_Name = "Module1"
Sub hw1()

'----------------Easy and Moderate ----------------

  
  Dim total, open_price, close_price, pc As Double
  Dim Summary_Row, ws_count, w, count, hard_count As Integer
  Dim ticker As String
  Dim n As Double
 
  
  ws_count = ActiveWorkbook.Worksheets.count
  
  For w = 1 To ws_count
  Sheets(w).Activate
  
  n = Cells(Rows.count, 1).End(xlUp).Row
  total = 0
  Summary_Row = 2
  Range("I1:L1") = Array("Ticker", "Yearly Change", "Percent Change", "Total Stock Volume")


  For i = 2 To n
    If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
        ticker = Cells(i, 1)
        total = total + Cells(i, 7)
        close_price = Cells(i, 6)
        open_price = Cells(i - count, 3)
        
        Range("I" & Summary_Row) = ticker
        Range("L" & Summary_Row) = total
        Range("J" & Summary_Row) = close_price - open_price
        
        If Range("J" & Summary_Row) > 0 Then
            Range("J" & Summary_Row).Interior.ColorIndex = 4
        ElseIf Range("J" & Summary_Row) < 0 Then
            Range("J" & Summary_Row).Interior.ColorIndex = 3
        
        End If
        
        
        If open_price = 0 Then
            Range("K" & Summary_Row) = 0 & "%"
        Else
            Range("K" & Summary_Row) = ((close_price - open_price) / open_price * 100) & "%"

        End If
        Summary_Row = Summary_Row + 1
        total = 0
        count = 0

    Else
        count = count + 1
        total = total + Cells(i, 7).Value

    

    End If

  Next i
  
  
'----------------Hard  ----------------
  Range("P1") = "Ticker"
  Range("Q1") = "Value"
  hard_count = Cells(Rows.count, 10).End(xlUp).Row
  Range("I1:K" & hard_count).Copy Range("T1:V" & hard_count)
  Range("T1:V" & hard_count).Sort key1:=Range("V1"), order1:=xlAscending, Header:=xlYes
  Range("P2") = Range("T" & hard_count)
  Range("Q2") = (Range("V" & hard_count) * 100) & "%"
  Range("P3") = Range("T2")
  Range("Q3") = (Range("V2") * 100) & "%"
  
  Range("I:I").Copy Range("W:W")
  Range("L:L").Copy Range("X:X")
  Range("W1:X" & hard_count).Sort key1:=Range("X1"), order1:=xlAscending, Header:=xlYes
  Range("P4") = Range("W" & hard_count)
  Range("Q4") = Range("X" & hard_count)
  
  Range("O2:O4") = Application.WorksheetFunction.Transpose(Array("Greatest % Increase", "Greatest % Decrease", "Greatest Total Volume"))
  
  Range("T:X").Delete
  
  
  
  
  
  
Next w
  

End Sub






