Imports System.Data.SqlClient
Partial Class chead_exam_reg
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim chead_nm As String
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
        chead_nm = Session.Item("chead_uname")
        Try
            If chead_nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try

        Dim obj1 As clsScholarshipReg
        obj1 = New clsScholarshipReg()
        obj1.StudentName = student_name.Text
        If rb_male.Checked Then
            obj1.Gender = "Male"
        ElseIf rb_female.Checked Then
            obj1.Gender = "Female"
        End If
        obj1.ExamDate = dd_exam_date.SelectedItem.Text
        obj1.Degree = dd_degree.SelectedItem.Text
        obj1.College = dd_college.SelectedItem.Text
        obj1.YearSem = dd_year.SelectedItem.Text
        obj1.branch = dd_branch.SelectedItem.Text
        obj1.CourseTarget = dd_course.SelectedItem.Text
        obj1.Landline = landline.Text
        obj1.Mobile = mobile.Text
        obj1.Email = email.Text
        obj1.totalattempts = attempts.Text
        obj1.correct = correct.Text
        obj1.wrong = wrong.Text

        cmd.CommandText = "SELECT mobile from enquiry_details where mobile = @mobile"
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            obj1.EnquiryCreated = "Enquiry Exists"
        Else
            obj1.EnquiryCreated = "Enquiry Not Exists"
        End If
        dr.Close()

        cmd.Parameters.Clear()
        cmd.CommandText = "SELECT NegativeMarks, PositiveMarks, TotalMarks FROM ExamMaster WHERE ExamDate = @exam_date"
        cmd.Parameters.AddWithValue("@exam_date", dd_exam_date.SelectedItem.Text)
        dr = cmd.ExecuteReader()
        If dr.Read Then
            Dim PositiveMarks As Decimal
            Dim NegativeMarks As Decimal
            Dim TotalMarks As Decimal

            PositiveMarks = dr("PositiveMarks")
            NegativeMarks = dr("NegativeMarks")
            TotalMarks = dr("TotalMarks")
            obj1.Percentage = Val(Val(correct.Text * PositiveMarks) - Val(wrong.Text * NegativeMarks)) / Val(TotalMarks) * 100
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

        Dim script As String = "window.alert('" & obj1.Update() & "');"

        If script.Equals("window.alert('Record Saved');") Then
            'MessageBox.Show("Student Registered !!", "DATA SAVED", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student Registered !!');menubar=yes;", True)
        ElseIf script.Equals("window.alert('Record Updated');") Then
            'MessageBox.Show("Student Not Registered !!", "DATA NOT SAVED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student Not Registered !!');menubar=yes;", True)
        End If
    End Sub

    Protected Sub reset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles reset.Click
        chead_nm = Session.Item("chead_uname")
        Try
            If chead_nm.Length < 1 Then
                Session.Abandon()
                FormsAuthentication.SignOut()
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Cache.SetNoStore()
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
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
