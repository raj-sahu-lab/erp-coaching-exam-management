Imports System.Data.SqlClient
Partial Class Enquiry_list
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim nm As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sSQL As String
        If Page.IsPostBack Then
            sSQL = ViewState("MySQL")
            SqlDataSource_enquiry.SelectCommand = sSQL
        End If
    End Sub
    Protected Sub search_grid_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles search_grid.Click
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
        SqlDataSource_enquiry.SelectParameters.Clear()
        If dd_selection.Text = "" Then
            'MessageBox.Show("Select search criteria !!", "SELECT SEARCH CLAUSE", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Select search criteria');menubar=yes;", True)
            dd_selection.Focus()
            Exit Sub
        End If
        If startdate.Text = "" Then
            'MessageBox.Show("Enter start date!!", "ENTER DATE", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Enter start date');menubar=yes;", True)
            startdate.Focus()
            Exit Sub
        End If
        If enddate.Text = "" Then
            'MessageBox.Show("Enter end date!!", "ENTER DATE", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Enter end date');menubar=yes;", True)
            enddate.Focus()
            Exit Sub
        End If
        Try
            If dd_selection.Text = "Enquiry" Then
                Dim sSQL As String
                sSQL = "SELECT * FROM [enquiry_details] WHERE (([enq] >= @enq00) AND ([enq] <= @enq0))"
                SqlDataSource_enquiry.SelectParameters.Add("enq00", dbType:=Data.DbType.Date, value:=startdate.Text)
                SqlDataSource_enquiry.SelectParameters("enq00").DefaultValue = startdate.Text
                SqlDataSource_enquiry.SelectParameters.Add("enq0", dbType:=Data.DbType.Date, value:=enddate.Text)
                SqlDataSource_enquiry.SelectParameters("enq0").DefaultValue = enddate.Text

                SqlDataSource_enquiry.SelectCommand = sSQL
                ViewState("MySQL") = sSQL


                startdate.Text = ""
                enddate.Text = ""
            End If

            If dd_selection.Text = "Registered" Then
                Dim sSQL As String
                sSQL = "SELECT * FROM [enquiry_details] WHERE (([status_enq] = @status_enq1) AND ([enq] >= @enq3) AND ([enq] <= @enq4))"
                SqlDataSource_enquiry.SelectParameters.Add("enq3", dbType:=Data.DbType.Date, value:=startdate.Text)
                SqlDataSource_enquiry.SelectParameters("enq3").DefaultValue = startdate.Text
                SqlDataSource_enquiry.SelectParameters.Add("enq4", dbType:=Data.DbType.Date, value:=enddate.Text)
                SqlDataSource_enquiry.SelectParameters("enq4").DefaultValue = enddate.Text
                SqlDataSource_enquiry.SelectParameters.Add("status_enq1", dbType:=Data.DbType.String, value:="Registered")
                SqlDataSource_enquiry.SelectParameters("status_enq1").DefaultValue = "Registered"

                SqlDataSource_enquiry.SelectCommand = sSQL
                ViewState("MySQL") = sSQL


                startdate.Text = ""
                enddate.Text = ""
            End If

            If dd_selection.Text = "Not Registered" Then
                Dim sSQL As String
                sSQL = "SELECT * FROM [enquiry_details] WHERE (([status_enq] = @status_enq2) AND ([enq] >= @enq5) AND ([enq] <= @enq6))"
                SqlDataSource_enquiry.SelectParameters.Add("enq5", dbType:=Data.DbType.Date, value:=startdate.Text)
                SqlDataSource_enquiry.SelectParameters("enq5").DefaultValue = startdate.Text
                SqlDataSource_enquiry.SelectParameters.Add("enq6", dbType:=Data.DbType.Date, value:=enddate.Text)
                SqlDataSource_enquiry.SelectParameters("enq6").DefaultValue = enddate.Text
                SqlDataSource_enquiry.SelectParameters.Add("status_enq2", dbType:=Data.DbType.String, value:="Not Registered")
                SqlDataSource_enquiry.SelectParameters("status_enq2").DefaultValue = "Not Registered"

                SqlDataSource_enquiry.SelectCommand = sSQL
                ViewState("MySQL") = sSQL

                startdate.Text = ""
                enddate.Text = ""
            End If

        Catch ex As Exception
            'MessageBox.Show("An Error Occurred!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('An error occured');menubar=yes;", True)
        End Try
    End Sub

End Class