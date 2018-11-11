Imports System.Data.OleDb
Partial Class Index
    Inherits System.Web.UI.Page
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection

    Protected Sub buttonLogin_Click(sender As Object, e As EventArgs) Handles buttonLogin.Click
        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = "C:\Users\justi\Google Drive\Uni Stuff\Year 2 - Semester 1\CSI2441 - Applications Development\Assignment 2\Assignment 2\App_Data\SportsManagementDatabase.accdb"
        connString = provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()

        Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM [Login] WHERE [UserEmail] = '" & txtUsername.Text & "' AND [UserPassword] = '" & txtPassword.Text & "'", myConnection)
        Dim myReader As OleDbDataReader = cmd.ExecuteReader

        Dim userFound As Boolean = False

        While myReader.Read
            userFound = True
        End While
        myReader.Close()

        Dim cmd2 As OleDbCommand = New OleDbCommand("SELECT * FROM [Login] WHERE [UserEmail] = '" & txtUsername.Text & "' AND [UserPassword] = '" & txtPassword.Text & "'", myConnection)
        Dim myReader2 As OleDbDataReader = cmd2.ExecuteReader

        Dim adminFound As Boolean = False

        While myReader2.Read
            adminFound = True
        End While
        myReader2.Close()

        Dim cmd3 As OleDbCommand = New OleDbCommand("SELECT * FROM [Login] WHERE [UserEmail] = '" & txtUsername.Text & "' AND [UserPassword] = '" & txtPassword.Text & "'", myConnection)
        Dim myReader3 As OleDbDataReader = cmd3.ExecuteReader

        Dim eventFound As Boolean = False

        While myReader3.Read
            eventFound = True
        End While
        myReader3.Close()


        If userFound = True Then
            If adminFound = True Then
                Response.Redirect("Games.aspx")
            ElseIf eventFound = True Then
                Response.Redirect("Events.aspx")
            End If
        Else
            MsgBox("Username or password not recognized", MsgBoxStyle.OkOnly, "Unable to Login")
        End If
    End Sub
End Class
