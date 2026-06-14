Imports System.Data.SqlClient
Partial Class index
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.open()
        cmd = New SqlCommand
        cmd.Connection = con
    End Sub

    Protected Sub login_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles login.Click
        If dd_role.SelectedItem.Text = "Counsellor" Then
            cmd.CommandText = "select * from user_login where username=@username and password=@password"
            cmd.Parameters.AddWithValue("@username", username.Text)
            cmd.Parameters.AddWithValue("@password", password.Text)
            dr = cmd.ExecuteReader()
            If Not dr.Read Then
                username.Text = ""
                password.Text = ""
                info.Text = "Invalid login Info!!!!!"
            Else
                Session.Add("uname", dr("username"))
                Response.Redirect("home.aspx")
            End If

        ElseIf dd_role.SelectedItem.Text = "Admin" Then
            cmd.CommandText = "select * from admin_login where username=@username and password=@password"
            cmd.Parameters.AddWithValue("@username", username.Text)
            cmd.Parameters.AddWithValue("@password", password.Text)
            dr = cmd.ExecuteReader()
            If Not dr.Read Then
                username.Text = ""
                password.Text = ""
                info.Text = "Invalid login Info!!!!!"
            Else
                Session.Add("a_uname", dr("username"))
                Response.Redirect("admin_home.aspx")
            End If

        ElseIf dd_role.SelectedItem.Text = "Center Head" Then
            cmd.CommandText = "select * from center_head_login where username=@username and password=@password"
            cmd.Parameters.AddWithValue("@username", username.Text)
            cmd.Parameters.AddWithValue("@password", password.Text)
            dr = cmd.ExecuteReader()
            If Not dr.Read Then
                username.Text = ""
                password.Text = ""
                info.Text = "Invalid login Info!!!!!"
            Else
                Session.Add("chead_uname", dr("username"))
                Response.Redirect("chead_home.aspx")
            End If
            dr.Close()
        End If
    End Sub

    Protected Sub cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cancel.Click
        username.Text = ""
        password.Text = ""
        info.Text = ""
    End Sub
End Class
