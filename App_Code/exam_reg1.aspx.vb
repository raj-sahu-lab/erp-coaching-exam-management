Imports System.Data.SqlClient
Partial Class exam_reg
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim nm As String
    Dim strMessage As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con
    End Sub
    Protected Sub add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add.Click
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

        Dim obj As clsScholarshipReg
        obj = New clsScholarshipReg()
        obj.StudentName = student_name.Text
        If rb_male.Checked Then
            obj.Gender = "Male"
        ElseIf rb_female.Checked Then
            obj.Gender = "Female"
        End If
        obj.ExamDate = dd_exam_date.SelectedItem.Text
        obj.Degree = dd_degree.SelectedItem.Text
        obj.College = dd_college.SelectedItem.Text
        obj.YearSem = dd_year.SelectedItem.Text
        obj.branch = dd_branch.SelectedItem.Text
        obj.CourseTarget = dd_course.SelectedItem.Text
        obj.Landline = landline.Text
        obj.Mobile = mobile.Text
        obj.Email = email.Text
        obj.totalattempts = attempts.Text
        obj.correct = correct.Text
        obj.wrong = wrong.Text

        cmd.CommandText = "SELECT mobile from enquiry_details where mobile = @mobile"
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            obj.EnquiryCreated = "Enquiry Exists"
        ElseIf (dr Is DBNull.Value) Or Not (dr.Read()) Then
            obj.EnquiryCreated = "Enquiry Not Exists"
        End If
        dr.Close()

        cmd.Parameters.Clear()
        cmd.CommandText = "SELECT NegativeMarks, PositiveMarks, TotalMarks FROM ExamMaster WHERE ExamDate = CONVERT(datetime, @exam_date, 101)"
        cmd.Parameters.AddWithValue("@exam_date", dd_exam_date.SelectedItem.Text)
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Dim PositiveMarks As Decimal
            Dim NegativeMarks As Decimal
            Dim TotalMarks As Decimal

            PositiveMarks = dr("PositiveMarks")
            NegativeMarks = dr("NegativeMarks")
            TotalMarks = dr("TotalMarks")
            obj.Percentage = Val(Val(correct.Text * PositiveMarks) - Val(wrong.Text * NegativeMarks)) / Val(TotalMarks) * 100
        End If
        dr.Close()

        cmd.Parameters.Clear()
        cmd.CommandText = "SELECT Mobile FROM ScholarshipReg WHERE Mobile = @mobile"
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            'MessageBox.Show("Student Already Has Given A Test !!", "DATA EXISTS", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student Already Has Given A Test !!');menubar=yes;", True)
            dr.Close()
            Exit Sub
        End If

        Dim script As String = "window.alert('" & obj.Update() & "');"

        If script.Equals("window.alert('Record Saved');") Then
            'MessageBox.Show("Student Registered !!", "DATA SAVED", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student Registered');menubar=yes;", True)
        ElseIf script.Equals("window.alert('Record Updated');") Then
            'MessageBox.Show("Student Not Registered !!", "DATA NOT SAVED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student Not Registered !!');menubar=yes;", True)
        End If
    End Sub

    Protected Sub reset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles reset.Click
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

        dd_exam_date.ClearSelection()
        dd_degree.ClearSelection()
        dd_college.ClearSelection()
        dd_year.ClearSelection()
        dd_branch.ClearSelection()
        dd_course.ClearSelection()
        landline.Text = ""
        mobile.Text = ""
        email.Text = ""
        attempts.Text = ""
        correct.Text = ""
        wrong.Text = ""
    End Sub
End Class
