Imports System.Data.SqlClient
Partial Class chead_master_set
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

    Protected Sub delete_college_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete_college.Click
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

        cmd.CommandText = "delete from m_college where college_name = @college_name"
        cmd.Parameters.AddWithValue("@college_name", dd_college.SelectedItem.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("College Could Not Be Deleted, Login And Try Again!!", "NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('College Could Not Be Deleted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("College Deleted", "COLLEGE DELETED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('College Deleted');menubar=yes;", True)
    End Sub

    Protected Sub Add_college_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add_college.Click
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

        cmd.Parameters.Clear()
        cmd.CommandText = "insert into m_college (college_name) values (@college_name)"
        cmd.Parameters.AddWithValue("@college_name", college_name.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("College Could Not Be Inserted, Login And Try Again!!", "NOT INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('College Could Not Be Inserted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("College Inserted In Database", "COLLEGE INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('College Inserted');menubar=yes;", True)
        college_name.Text = ""
    End Sub

    Protected Sub delete_degree_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete_degree.Click
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

        cmd.Parameters.Clear()
        cmd.CommandText = "delete from m_degree where degree_name = @degree_name"
        cmd.Parameters.AddWithValue("@degree_name", dd_degree.SelectedItem.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Degree Could Not Be Deleted, Login And Try Again!!", "NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Degree Could Not Be Deleted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("Degree Deleted", "COLLEGE DELETED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Degree Deleted');menubar=yes;", True)

    End Sub

    Protected Sub add_degree_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add_degree.Click
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

        cmd.Parameters.Clear()
        cmd.CommandText = "insert into m_degree (degree_name) values (@degree_name)"
        cmd.Parameters.AddWithValue("@degree_name", degree_name.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Degree Could Not Be Inserted, Login And Try Again!!", "NOT INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Degree Could Not Be Inserted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("Degree Inserted In Database", "DEGREE INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Degree Added');menubar=yes;", True)
        degree_name.Text = ""
    End Sub

    Protected Sub delete_branch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete_branch.Click
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

        cmd.Parameters.Clear()
        cmd.CommandText = "delete from m_branch where branch_name = @branch_name"
        cmd.Parameters.AddWithValue("@branch_name", dd_branch.SelectedItem.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Branch Could Not Be Deleted, Login And Try Again!!", "NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Branch Could Not Be Deleted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("Branch Deleted", "BRANCH DELETED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Branch Deleted');menubar=yes;", True)

    End Sub

    Protected Sub add_branch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add_branch.Click
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

        cmd.Parameters.Clear()
        cmd.CommandText = "insert into m_branch (branch_name) values (@branch_name)"
        cmd.Parameters.AddWithValue("@branch_name", branch_name.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Branch Could Not Be Inserted, Login And Try Again!!", "NOT INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Branch Could Not Be Inserted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("Branch Inserted In Database", "BRANCH INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Degree Added');menubar=yes;", True)
        branch_name.Text = ""
    End Sub

    Protected Sub delete_course_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete_course.Click
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

        cmd.Parameters.Clear()
        cmd.CommandText = "delete from course_details where course_name = @course_name"
        cmd.Parameters.AddWithValue("@course_name", dd_course.SelectedItem.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Branch Could Not Be Deleted, Login And Try Again!!", "NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Course Could Not Be Deleted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("Branch Deleted", "BRANCH DELETED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Course Deleted');menubar=yes;", True)

    End Sub

    Protected Sub add_course_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add_course.Click
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
        cmd.Parameters.Clear()
        cmd.CommandText = "insert into course_details (course_name) values (@course_name)"
        cmd.Parameters.AddWithValue("@course_name", course_name.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Branch Could Not Be Inserted, Login And Try Again!!", "NOT INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Course Could Not Be Inserted, Login And Try Again!!');menubar=yes;", True)
        End Try

        Page.DataBind() ' used to refresh contents of dropdownlist and remove the deleted item
        'MessageBox.Show("Branch Inserted In Database", "BRANCH INSERTED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Course Added');menubar=yes;", True)
        course_name.Text = ""
    End Sub
End Class
