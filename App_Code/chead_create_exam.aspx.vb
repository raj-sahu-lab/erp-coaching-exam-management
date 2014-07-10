Imports System.Data.SqlClient
Partial Class chead_create_exam
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim chead_nm As String
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

        Dim obj2 As clsExamMaster
        obj2 = New clsExamMaster()
        obj2.Examid = ""
        obj2.ExamDate = exam_date.Text
        obj2.TotalMarks = total_marks.Text
        obj2.PositiveMarks = positive_marks.Text
        obj2.NegativeMarks = negative_marks.Text
        obj2.Update()

        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Exam Created');menubar=yes;", True)
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

        exam_date.Text = ""
        total_marks.Text = ""
        positive_marks.Text = ""
        negative_marks.Text = ""
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("chead_exam_schema.aspx")
    End Sub
End Class
