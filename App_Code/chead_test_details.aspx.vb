Imports System.Data.SqlClient
Imports System.Data
Partial Class chead_test_details
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim chead_nm As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con

        Dim sSQL As String
        If Page.IsPostBack Then
            sSQL = ViewState("MySQL")
            SqlDataSource_students_test.SelectCommand = sSQL
        End If
    End Sub
    Protected Sub search_test_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles search_grid.Click
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
        SqlDataSource_students_test.SelectParameters.Clear()

        Try
            Dim sSQL As String = "SELECT [Mobile], [StudentName], [ExamDate], [Gender], [Degree], [College], [Yearsem], [branch], [CourseTarget], [totalattempts], [correct], [wrong], [Percentage], [Waiver], [EnquiryCreated] From [ScholarshipReg] WHERE ([ExamDate] = @enq83)"
            SqlDataSource_students_test.SelectParameters.Add("enq83", dbType:=Data.DbType.Date, value:=dd_selection_date.SelectedItem.Text)
            SqlDataSource_students_test.SelectParameters("enq83").DefaultValue = dd_selection_date.SelectedItem.Text

            SqlDataSource_students_test.SelectCommand = sSQL
            ViewState("MySQL") = sSQL

        Catch ex As Exception
            'MessageBox.Show("An Error Occurred!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('An error occured');menubar=yes;", True)
        End Try
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        Dim obj As clsScholarshipReg
        obj = New clsScholarshipReg()

        For i As Integer = 0 To CoolGridView2.Rows.Count - 1
            Dim theid As String = CoolGridView2.DataKeys(i)(0).ToString()
            Dim tBox As TextBox = DirectCast(CoolGridView2.Rows(i).FindControl("waiver_update"), TextBox)
            If tBox.Text.Equals("") Then
                Continue For
            Else
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@waiver", tBox.Text)
                cmd.Parameters.AddWithValue("@mobile", theid)
                cmd.CommandText = "UPDATE ScholarshipReg SET Waiver = @waiver WHERE Mobile = @mobile"
                cmd.ExecuteNonQuery()
                Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Updated');menubar=yes;", True)
            End If
        Next
    End Sub

    Protected Sub enq_create_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles enq_create.Click
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

        For i As Integer = 0 To CoolGridView2.Rows.Count - 1
            Dim theid As String = CoolGridView2.DataKeys(i)(0).ToString()
            Dim cBox As CheckBox = DirectCast(CoolGridView2.Rows(i).FindControl("enquiry"), CheckBox)
            If (cBox.Checked) And (cBox.Enabled = True) Then
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@mobile", theid)
                cmd.CommandText = "insert into enquiry_details(student_name, gender, enq, college, degree, year_sem, branch,course_enq,landline, mobile, email, mode_enq, councellor_name, status_enq) select StudentName,Gender,ExamDate,College,Degree,YearSem,branch,CourseTarget,Landline,Mobile,Email,'Test','Test Counsellor','Not Registered' from ScholarshipReg where Mobile = @mobile"
                Try
                    cmd.ExecuteNonQuery()
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@mobile", theid)
                    cmd.CommandText = "UPDATE ScholarshipReg SET EnquiryCreated = 'Enquiry Exists' WHERE Mobile = @mobile"
                    cmd.ExecuteNonQuery()
                    Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student Enquiry Created');menubar=yes;", True)
                Catch ex As Exception
                    If ex.[GetType]().Equals(GetType(SqlException)) Then
                        If ex.Message.Contains("PRIMARY KEY") Then
                            cmd.Parameters.Clear()
                            cmd.Parameters.AddWithValue("@mobile", theid)
                            cmd.CommandText = "UPDATE ScholarshipReg SET EnquiryCreated = 'Enquiry Exists' WHERE Mobile = @mobile"
                            cmd.ExecuteNonQuery()
                        End If
                    End If
                    'MessageBox.Show("Mobile Number Already Exists !! Please Change The No. ", " NOT SAVED", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Enquiry Already Exists');menubar=yes;", True)
                End Try
            End If
        Next
    End Sub
End Class
