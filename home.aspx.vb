
Partial Class home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim nm As String
        nm = Session.Item("uname")

        Try
            If nm.Length < 1 Then
                'Session.Abandon()
                ' FormsAuthentication.SignOut()

                '  Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
                '  Response.Cache.SetCacheability(HttpCacheability.NoCache)
                'Response.Cache.SetNoStore()
                'Response.Redirect("session_exp.aspx")
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
