
Partial Class admin_home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim a_nm As String
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
    End Sub
End Class
