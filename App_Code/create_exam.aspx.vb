
Partial Class create_exam
    Inherits System.Web.UI.Page
    Dim nm As String
    Protected Sub add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add.Click
        nm = Session.Item("uname")
        Try
            If nm.Length < 1 Then
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

        Dim obj As clsExamMaster
        obj = New clsExamMaster()
        obj.Examid = ""
        obj.ExamDate = exam_date.Text
        obj.TotalMarks = total_marks.Text
        obj.PositiveMarks = positive_marks.Text
        obj.NegativeMarks = negative_marks.Text
        obj.Update()

        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Exam Created');menubar=yes;", True)
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
                Response.Redirect("session_exp.aspx")
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
        Response.Redirect("exam_schema.aspx")
    End Sub
End Class
