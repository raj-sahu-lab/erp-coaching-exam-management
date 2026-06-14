Imports System.Data.SqlClient
Partial Class Admin_update
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim gender As String
    Dim a_nm As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con
    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        a_nm = Session.Item("a_uname")
        Try
            If a_nm.Length < 1 Then
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

        cmd.CommandText = "select * from enquiry_details where mobile = @mobile"
        cmd.Parameters.AddWithValue("@mobile", mobile_search.Text)
        dr = cmd.ExecuteReader()
        If Not dr.Read Then
            'MessageBox.Show("Data not found", "NOT FOUND", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data was not found');menubar=yes;", True)
        Else
            student_name.Text = dr(0)
            If dr(1).Equals("Male") Then
                Rb_male.Checked = True
            ElseIf dr(1).Equals("Female") Then
                Rb_female.Checked = True
            End If
            Dim d As Date
            d = dr(2)
            enq.Text = d.ToString("yyyy'/'MM'/'dd")
            dd_college.SelectedIndex = dd_college.Items.IndexOf(dd_college.Items.FindByText(dr(3)))
            dd_degree.SelectedIndex = dd_degree.Items.IndexOf(dd_degree.Items.FindByText(dr(4)))
            dd_year_sem.SelectedIndex = dd_year_sem.Items.IndexOf(dd_year_sem.Items.FindByText(dr(5)))
            dd_branch.SelectedIndex = dd_branch.Items.IndexOf(dd_branch.Items.FindByText(dr(6)))
            dd_course.SelectedIndex = dd_course.Items.IndexOf(dd_course.Items.FindByText(dr(7)))
            landline.Text = dr(8)
            mobile.Text = dr(9)
            email.Text = dr(10)
            dd_mode.SelectedIndex = dd_mode.Items.IndexOf(dd_mode.Items.FindByText(dr(11)))
            dd_councellor.SelectedIndex = dd_councellor.Items.IndexOf(dd_councellor.Items.FindByText(dr(12)))
            status.Text = dr(13)
        End If
    End Sub

    Protected Sub Update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Update.Click
        a_nm = Session.Item("a_uname")
        Try
            If a_nm.Length < 1 Then
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
        Try
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@date", enq.Text)
            cmd.Parameters.AddWithValue("@student_name", student_name.Text)
            cmd.Parameters.AddWithValue("@college", dd_college.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@degree", dd_degree.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@year_sem", dd_year_sem.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@branch", dd_branch.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@course_enq", dd_course.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@landline", landline.Text)
            cmd.Parameters.AddWithValue("@mobile_new", mobile.Text)
            cmd.Parameters.AddWithValue("@email", email.Text)
            cmd.Parameters.AddWithValue("@mode_enq", dd_mode.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@councellor_name", dd_councellor.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@status_enq", status.Text)
            cmd.Parameters.AddWithValue("@mobile_search", mobile_search.Text)
            cmd.CommandText = "update enquiry_details set student_name = @student_name, gender = gender, enq = @date, college = @college, degree = @degree, year_sem = @year_sem, branch = @branch, course_enq = @course_enq, landline = @landline, mobile = @mobile_new, email = @email, mode_enq = @mode_enq, councellor_name = @councellor_name, status_enq = @status_enq where mobile = @mobile_search"
            cmd.ExecuteNonQuery()
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@mobile_new", mobile.Text)
            cmd.Parameters.AddWithValue("@mobile_search", mobile_search.Text)
            cmd.CommandText = "if exists(select mobileno_followup from fee_followup where mobileno_followup = @mobile_search) update fee_followup set mobileno_followup = @mobile_new where mobileno_followup = @mobile_search"
            cmd.ExecuteNonQuery()
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@mobile_new", mobile.Text)
            cmd.Parameters.AddWithValue("@mobile_search", mobile_search.Text)
            cmd.CommandText = "if exists(select mobileno_fee from fee_collect where mobileno_fee = @mobile_search) update fee_collect set mobileno_fee = @mobile_new where mobileno_fee = @mobile_search"
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Data Not Updated. Either The Mobile No Already Exists Or There Was An Internal Error!! ", " NOT UPDATED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Not Updated. Mobile No Already Exists Or There Was An Internal Error');menubar=yes;", True)
            Exit Sub
        End Try
        student_name.Text = ""
        Rb_male.Checked = True
        Rb_female.Checked = False
        enq.Text = ""
        dd_degree.ClearSelection()
        dd_college.ClearSelection()
        dd_year_sem.ClearSelection()
        dd_branch.ClearSelection()
        dd_course.ClearSelection()
        landline.Text = ""
        mobile.Text = ""
        email.Text = ""
        dd_mode.ClearSelection()
        dd_councellor.ClearSelection()
        status.Text = ""
        'MessageBox.Show("Data Updated ", " DATA UPDATED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Updated');menubar=yes;", True)

    End Sub

    Protected Sub Rb_female_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_female.CheckedChanged
        If (Rb_male.Checked) Then
            gender = "Male"
        ElseIf (Rb_female.Checked) Then
            gender = "Female"
        End If
    End Sub

    Protected Sub Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Delete.Click
        a_nm = Session.Item("a_uname")
        Try
            If a_nm.Length < 1 Then
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
        cmd.CommandText = "delete from enquiry_details where mobile = @mobile"
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Data Not Deleted. Please Re-Login And Try Again!! ", " NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Not Deleted. Please Re-Login And Try Again!! ');menubar=yes;", True)
            Exit Sub
        End Try
        student_name.Text = ""
        Rb_male.Checked = True
        Rb_female.Checked = False
        enq.Text = ""
        dd_degree.ClearSelection()
        dd_college.ClearSelection()
        dd_year_sem.ClearSelection()
        dd_branch.ClearSelection()
        dd_course.ClearSelection()
        landline.Text = ""
        mobile.Text = ""
        email.Text = ""
        dd_mode.ClearSelection()
        dd_councellor.ClearSelection()
        status.Text = ""
        'MessageBox.Show("Data Deleted ", " DATA DELETED", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Deleted');menubar=yes;", True)

    End Sub

    Protected Sub Rb_male_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_male.CheckedChanged
        If (Rb_female.Checked) Then
            gender = "Female"
        ElseIf (Rb_male.Checked) Then
            gender = "Male"
        End If
    End Sub
End Class
