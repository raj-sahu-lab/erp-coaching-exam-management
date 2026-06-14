Imports System.Data.SqlClient
Partial Class admin_exam_reg_del
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim a_nm As String

    Protected Sub search_exam_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles search_exam.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles search_exam.Click
        a_nm = Session.Item("a_uname")
        Try
            If a_nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try
        If a_mobile_search.Text = "" Then
            'MessageBox.Show("Enter data to find !!", "NOT FOUND", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Enter Data To Find');menubar=yes;", True)

        Else
            cmd.CommandText = "select Mobile from ScholarshipReg where Mobile = @mobile"
            cmd.Parameters.AddWithValue("@mobile", a_mobile_search.Text)
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                dr.Close()
                cmd.Parameters.Clear()
                cmd.CommandText = "select mobile, StudentName, Gender, ExamDate, Degree, College, YearSem, branch, CourseTarget, Landline, Email, totalattempts, correct, wrong from ScholarshipReg where Mobile = @mobile"
                cmd.Parameters.AddWithValue("@mobile", a_mobile_search.Text)
                dr = cmd.ExecuteReader()

                If dr.Read() And dr("StudentName").Equals(DBNull.Value) Then
                    student_name.Text = ""
                Else
                    student_name.Text = dr("StudentName")
                End If

                If dr("Mobile").Equals(DBNull.Value) Then
                    mobile.Text = ""
                Else
                    mobile.Text = dr("Mobile")
                End If

                If dr("Gender").Equals(DBNull.Value) Then
                    rb_female.Checked = False
                    rb_male.Checked = False
                Else
                    If dr("Gender").Equals("Male") Then
                        rb_male.Checked = True
                    ElseIf dr("Gender").Equals("Female") Then
                        rb_female.Checked = True
                    End If
                End If

                If dr("ExamDate").Equals(DBNull.Value) Then
                    exam_date.Text = ""
                Else
                    Dim d As Date
                    d = dr("ExamDate")
                    exam_date.Text = d.ToString("yyyy'/'MM'/'dd")
                End If
                If dr("Degree").Equals(DBNull.Value) Then
                    dd_degree.ClearSelection()
                Else
                    dd_degree.SelectedIndex = dd_degree.Items.IndexOf(dd_degree.Items.FindByText(dr("Degree")))
                End If
                If dr("College").Equals(DBNull.Value) Then
                    student_name.Text = ""
                Else
                    dd_college.SelectedIndex = dd_college.Items.IndexOf(dd_college.Items.FindByText(dr("College")))
                End If
                If dr("YearSem").Equals(DBNull.Value) Then
                    student_name.Text = ""
                Else
                    dd_year.SelectedIndex = dd_year.Items.IndexOf(dd_year.Items.FindByText(dr("YearSem")))
                End If
                If dr("branch").Equals(DBNull.Value) Then
                    student_name.Text = ""
                Else
                    dd_branch.SelectedIndex = dd_branch.Items.IndexOf(dd_branch.Items.FindByText(dr("branch")))
                End If
                If dr("CourseTarget").Equals(DBNull.Value) Then
                    student_name.Text = ""
                Else
                    dd_course.SelectedIndex = dd_course.Items.IndexOf(dd_course.Items.FindByText(dr("CourseTarget")))
                End If
                If dr("Landline").Equals(DBNull.Value) Then
                    landline.Text = ""
                Else
                    landline.Text = dr("Landline")
                End If
                If dr("Email").Equals(DBNull.Value) Then
                    email.Text = ""
                Else
                    email.Text = dr("Email")
                End If
                If dr("totalattempts").Equals(DBNull.Value) Then
                    attempts.Text = ""
                Else
                    attempts.Text = dr("totalattempts")
                End If
                If dr("correct").Equals(DBNull.Value) Then
                    correct.Text = ""
                Else
                    correct.Text = dr("correct")
                End If
                If dr("wrong").Equals(DBNull.Value) Then
                    wrong.Text = ""
                Else
                    wrong.Text = dr("wrong")
                End If
            Else
                'MessageBox.Show("Data not found !!", "NOT FOUND", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data was not found');menubar=yes;", True)
            End If
        End If
    End Sub

    Protected Sub reset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles reset.Click
        mobile.Text = ""
        student_name.Text = ""
        rb_male.Checked = False
        rb_female.Checked = False
        exam_date.Text = ""
        dd_degree.ClearSelection()
        dd_college.ClearSelection()
        dd_year.ClearSelection()
        dd_branch.ClearSelection()
        dd_course.ClearSelection()
        landline.Text = ""
        email.Text = ""
        attempts.Text = ""
        correct.Text = ""
        wrong.Text = ""
    End Sub

    Protected Sub delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete.Click
        a_nm = Session.Item("a_uname")
        Try
            If a_nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try

        If mobile.Text = "" Then
            'MessageBox.Show("Search Data To Delete !!", "NO DATA", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Search data to delete');menubar=yes;", True)
        End If
        cmd.Parameters.Clear()
        cmd.CommandText = "DELETE FROM ScholarshipReg WHERE mobile = @mobile"
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Data Not Deleted ", " NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Not Deleted. Please Re-Login And Try Again!! ');menubar=yes;", True)
            Exit Sub
        End Try
        mobile.Text = ""
        student_name.Text = ""
        rb_male.Checked = False
        rb_female.Checked = False
        exam_date.Text = ""
        dd_degree.ClearSelection()
        dd_college.ClearSelection()
        dd_year.ClearSelection()
        dd_branch.ClearSelection()
        dd_course.ClearSelection()
        landline.Text = ""
        email.Text = ""
        attempts.Text = ""
        correct.Text = ""
        wrong.Text = ""

        'MessageBox.Show("Data Deleted ", " DATA DELETED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Deleted.');menubar=yes;", True)
    End Sub
End Class
