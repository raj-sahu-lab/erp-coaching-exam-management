Imports System.Data.SqlClient
Partial Class newenquiry
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim gender As String
    Dim nm As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con
    End Sub

    Protected Sub add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add.Click
        If (rb_male.Checked) Then
            gender = "Male"
        ElseIf (rb_female.Checked) Then
            gender = "Female"
        End If
        cmd.Parameters.AddWithValue("@Name", student_name.Text)
        cmd.Parameters.AddWithValue("@gender", gender)
        cmd.Parameters.AddWithValue("@date", enq.Text)
        cmd.Parameters.AddWithValue("@college", dd_college.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@degree", dd_degree.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@year", dd_year.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@branch", dd_branch.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@course", dd_course.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@landline", landline.Text)
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        cmd.Parameters.AddWithValue("@altmobile", alternatmobile.Text)
        cmd.Parameters.AddWithValue("@parentnumber", ParentsPhoneNo.Text)
        cmd.Parameters.AddWithValue("@email", email.Text)
        cmd.Parameters.AddWithValue("@mode", dd_mode_enq.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@councellor", dd_councellor.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@status", dd_status.SelectedItem.Text)
        cmd.CommandText = "insert into enquiry_details (student_name, gender, enq, college, degree, year_sem, branch,course_enq, landline, mobile, 	alternatmobile,ParentsPhoneNo, email, mode_enq, councellor_name, status_enq) values (@name, @gender, @date, @college, @degree, @year, @branch, @course, @landline, @mobile,@altmobile,@parentnumber, @email, @mode, @councellor,@status)"

        nm = Session.Item("uname")
        Try
            If nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
            Exit Sub
        End Try

        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Mobile Number Already Exists !! Please Change The No. ", " NOT SAVED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Mobile Number Already Exists !! Please Change The No.');menubar=yes;", True)
            Exit Sub
        End Try
        'MessageBox.Show("Data was saved successfuly ..", "SAVED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Your data has been saved successfully');menubar=yes;", True)

        student_name.Text = ""
        rb_male.Checked = True
        rb_female.Checked = False
        enq.Text = ""
        dd_degree.ClearSelection()
        dd_college.ClearSelection()
        dd_year.ClearSelection()
        dd_branch.ClearSelection()
        dd_course.ClearSelection()
        landline.Text = ""
        mobile.Text = ""
        email.Text = ""
        dd_mode_enq.ClearSelection()
        dd_councellor.ClearSelection()
        dd_status.ClearSelection()
        con.Close()
    End Sub

    Protected Sub reset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles reset.Click
        student_name.Text = ""
        rb_male.Checked = True
        rb_female.Checked = False
        enq.Text = ""
        dd_degree.ClearSelection()
        dd_college.ClearSelection()
        dd_year.ClearSelection()
        dd_branch.ClearSelection()
        dd_course.ClearSelection()
        landline.Text = ""
        mobile.Text = ""
        email.Text = ""
        dd_mode_enq.ClearSelection()
        dd_councellor.ClearSelection()
        dd_status.ClearSelection()
    End Sub

    Protected Sub rb_male_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rb_male.CheckedChanged
        If (rb_male.Checked) Then
            gender = "Male"
        ElseIf (rb_female.Checked) Then
            gender = "Female"
        End If
    End Sub

    Protected Sub rb_female_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rb_female.CheckedChanged
        If (rb_female.Checked) Then
            gender = "Female"
        ElseIf (rb_male.Checked) Then
            gender = "Male"
        End If
    End Sub
End Class
