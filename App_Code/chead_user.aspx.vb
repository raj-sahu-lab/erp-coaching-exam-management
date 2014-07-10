Imports System.Data.SqlClient
Partial Class chead_user
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim chead_nm As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con
    End Sub

    Protected Sub Add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Add.Click
        chead_nm = Session.Item("chead_uname")
        Try
            If chead_nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
                Response.Redirect("session_exp.aspx")
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try

        cmd.CommandText = "insert into user_login values('" & councellor_name.Text & "', '" & password.Text & "')"
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("User Not Created, Login And Try Again!!", "USER NOT CREATED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('User Not Created');menubar=yes;", True)
        End Try
        Page.DataBind()  ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("New User Is Created", "USER CREATED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('A New user Has Been Created');menubar=yes;", True)

    End Sub

    Protected Sub Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Delete.Click
        chead_nm = Session.Item("chead_uname")
        Try
            If chead_nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
                Response.Redirect("session_exp.aspx")
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try

        cmd.CommandText = "delete from user_login where username = '" & dd_councellor_del.SelectedItem.Text & "'"
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("User Could Not Be Deleted, Login And Try Again!!", "NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('User Could Not Be Deleted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("User Deleted", "USER DELETED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('User Deleted');menubar=yes;", True)
    End Sub

    Protected Sub Update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Update.Click
        chead_nm = Session.Item("chead_uname")
        Try
            If chead_nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
                Response.Redirect("session_exp.aspx")
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try

        cmd.CommandText = "update user_login set password = '" & password_changed.Text & "' where username = '" & dd_councellor_pass.SelectedItem.Text & "'"
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Password Not changed", "PASSWORD NOT CHANGED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Password Not changed , Login And Try Again');menubar=yes;", True)
        End Try
        'MessageBox.Show("Password is changed", "PASSWORD CHANGED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Password Changed Successfully');menubar=yes;", True)
    End Sub
End Class
