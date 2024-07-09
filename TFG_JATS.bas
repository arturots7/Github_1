Attribute VB_Name = "M—dulo1"
Sub Generar_Resolucion()
Attribute Generar_Resolucion.VB_ProcData.VB_Invoke_Func = " \n14"
'Macro que genera archivo PDF con la Resolucion

'Se crean las variables a utilizar
Dim Hoja, Nombre As String
Dim Tecla As Integer

'Se comprueba que se ha seleccionado el M—dulo solicitado a convalidar y _
en caso contrario se informa al usuario de no poder continuar si no lo selecciona.
If Sheets("Formulario").Cells(16, 3).Value = "" Then
    Tecla = MsgBox("Para poder continuar debe seleccionar en el formulario Datos del alumnado el M—dulo Solicitado.", _
    vbExclamation Or vbOKOnly, "Error")
    Exit Sub
End If


Tecla = MsgBox("Se va a proceder a generar el archivo PDF con la Resoluci—n." & _
Chr(13) & Chr(13) & "ÀDesea continuar?", vbInformation Or vbOKCancel, "Comprobaci—n")

If Tecla = 2 Then
    Exit Sub
End If

'Se asigna a la variable Hoja el valor del resultado de la Resolucion
'ya que dependiendo del resultado se debe generar una Resolucion Estimadoria o Desestimatoria
Hoja = Sheets("Formulario").Cells(21, 3).Value
'Se asigna el nombre con el que se guardarˆ el archivo PDF
Nombre = Sheets("Formulario").Cells(12, 3).Value & "_" _
& Sheets("Formulario").Cells(13, 3).Value & "_" _
& Sheets("Formulario").Cells(11, 3).Value & "_" _
& Sheets("Formulario").Cells(8, 3).Value & "_" _
& Sheets("Formulario").Cells(16, 3).Value

'Se selecciona la Hoja "Estimar" o "Desestimar" dependiedo del resultado de la Resolucion
Sheets(Hoja).Select
'Se exporta la hoja que contiene todos los datos de la Resolucion en formato PDF
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, FileName:= _
        ThisWorkbook.Path & "\" & Nombre & ".pdf" _
        , Quality:=xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas _
        :=False, OpenAfterPublish:=True
        
'Se selecciona la hoja FORMULARIO
 Sheets("FORMULARIO").Select

End Sub
Sub Limpiar_Campos()
Attribute Limpiar_Campos.VB_ProcData.VB_Invoke_Func = " \n14"
'Macro que borra el contenido de las celdas a introducir datos
Dim Tecla As Integer
Tecla = MsgBox("Se va a proceder a borrar los datos seleccionados del formulario Datos del alumnado." & _
Chr(13) & Chr(13) & "ÀDesea continuar?", vbInformation Or vbOKCancel, "Comprobaci—n")

If Tecla = 2 Then
    Exit Sub
End If

'Se selecciona la hoja FORMULARIO
 Sheets("FORMULARIO").Select
 
    'Se borra el contenido de la celda que contiene el nombre del alumnado
    Range("C8").ClearContents
    'Se borra el contenido de las celdas que contienen la informaci„n
    'referente al m„dulo solicitado y aportado
    Range("C16:C17").ClearContents
    'Se selecciona la celda a introducir el nombre del siguiente alumnado
    Range("C8").Select
    
End Sub

Sub Generar_Acuse()
'Macro que genera archivo PDF con el Acuse Recibo

'Se crean las variables a utilizar
Dim Hoja, Nombre As String
Dim Tecla As Integer

'Se comprueba que se ha seleccionado el M—dulo solicitado a convalidar y _
en caso contrario se informa al usuario de no poder continuar si no lo selecciona.
If Sheets("Formulario").Cells(16, 3).Value = "" Then
    Tecla = MsgBox("Para poder continuar debe seleccionar en el formulario Datos del alumnado el M—dulo Solicitado.", _
    vbExclamation Or vbOKOnly, "Error")
    Exit Sub
End If


Tecla = MsgBox("Se va a proceder a generar el archivo PDF con el Acuse Rebio para el alumnado." & _
Chr(13) & Chr(13) & "ÀDesea continuar?", vbInformation Or vbOKCancel, "Comprobaci—n")

If Tecla = 2 Then
    Exit Sub
End If



'Se asigna a la variable Hoja el nombre de la hoja "ACUSE"
Hoja = "ACUSE"
'Se asigna el nombre con el que se guardarˆ el archivo PDF
Nombre = Sheets("Formulario").Cells(12, 3).Value & "_" _
& Sheets("Formulario").Cells(13, 3).Value & "_" _
& Sheets("Formulario").Cells(11, 3).Value & "_" _
& Sheets("Formulario").Cells(8, 3).Value & "_" _
& Sheets("Formulario").Cells(16, 3).Value & "_ACUSE"

'Se selecciona la Hoja "Estimar" o "Desestimar" dependiedo del resultado de la Resolucion
Sheets(Hoja).Select
'Se exporta la hoja que contiene todos los datos de la Resolucion en formato PDF
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, FileName:= _
        ThisWorkbook.Path & "\" & Nombre & ".pdf" _
        , Quality:=xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas _
        :=False, OpenAfterPublish:=True
        
'Se selecciona la hoja FORMULARIO
 Sheets("FORMULARIO").Select

End Sub

