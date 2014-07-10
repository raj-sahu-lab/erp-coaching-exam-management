Imports System.Data.SqlClient
Imports System.Data
Partial Class chead_fee_details
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
            SqlDataSource_fee.SelectCommand = sSQL
        End If
    End Sub
    Protected Sub search_grid_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles search_grid.Click
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
        SqlDataSource_fee.SelectParameters.Clear()
        If dd_selection.SelectedValue = "" Then
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
            If dd_selection.Text = "Admissions" Then
                Dim sSQL As String = "SELECT enquiry_details.student_name,enquiry_details.course_enq,fee_collect.type_fee,fee_collect.rem_fee,  (isnull(fee_collect.token_amt,0) + isnull(fee_collect.paid_lumpsum,0) + isnull(fee_collect.paid1,0) + isnull(fee_collect.paid2,0)) AS 'TotalFee', fee_collect.mobileno_fee , fee_followup.f_1 ,fee_followup.date_f_1,fee_followup.councellor_f1,fee_followup.f_2 ,fee_followup.date_f_2,fee_followup.councellor_f2,fee_followup.f_3 ,fee_followup.date_f_3,fee_followup.councellor_f3,fee_collect.remark,fee_collect.defaulter FROM enquiry_details INNER JOIN fee_collect ON enquiry_details.mobile = fee_collect.mobileno_fee LEFT OUTER JOIN fee_followup ON fee_collect.mobileno_fee = fee_followup.mobileno_followup WHERE((fee_collect.token_date >= @enq19) AND (fee_collect.token_date <= @enq20)) OR ((fee_collect.pay_date_lumpsum >= @enq19) AND (fee_collect.pay_date_lumpsum <= @enq20)) OR ((fee_collect.pay_date1 >= @enq19) AND (fee_collect.pay_date1 <= @enq20))"
                SqlDataSource_fee.SelectParameters.Add("enq19", dbType:=Data.DbType.Date, value:=startdate.Text)
                SqlDataSource_fee.SelectParameters("enq19").DefaultValue = startdate.Text
                SqlDataSource_fee.SelectParameters.Add("enq20", dbType:=Data.DbType.Date, value:=enddate.Text)
                SqlDataSource_fee.SelectParameters("enq20").DefaultValue = enddate.Text

                SqlDataSource_fee.SelectCommand = sSQL
                ViewState("MySQL") = sSQL

                startdate.Text = ""
                enddate.Text = ""
            End If

            If dd_selection.Text = "Pending Fees" Then
                Dim sSQL As String = "SELECT enquiry_details.student_name,enquiry_details.course_enq,fee_collect.type_fee,fee_collect.rem_fee, (isnull(fee_collect.token_amt,0) + isnull(fee_collect.paid_lumpsum,0) + isnull(fee_collect.paid1,0) + isnull(fee_collect.paid2,0)) AS 'TotalFee', fee_collect.mobileno_fee , fee_followup.f_1 ,fee_followup.date_f_1,fee_followup.councellor_f1,fee_followup.f_2 ,fee_followup.date_f_2,fee_followup.councellor_f2,fee_followup.f_3 ,fee_followup.date_f_3,fee_followup.councellor_f3,fee_collect.remark,fee_collect.defaulter FROM enquiry_details INNER JOIN fee_collect ON enquiry_details.mobile = fee_collect.mobileno_fee LEFT OUTER JOIN fee_followup ON fee_collect.mobileno_fee = fee_followup.mobileno_followup WHERE((((fee_collect.token_date >= @enq21) AND (fee_collect.token_date <= @enq22)) OR ((fee_collect.pay_date_lumpsum >= @enq21) AND (fee_collect.pay_date_lumpsum <= @enq22)) OR ((fee_collect.pay_date1 >= @enq21) AND (fee_collect.pay_date1 <= @enq22))) AND (fee_collect.rem_fee > '0.0000'))"
                SqlDataSource_fee.SelectParameters.Add("enq21", dbType:=Data.DbType.Date, value:=startdate.Text)
                SqlDataSource_fee.SelectParameters("enq21").DefaultValue = startdate.Text
                SqlDataSource_fee.SelectParameters.Add("enq22", dbType:=Data.DbType.Date, value:=enddate.Text)
                SqlDataSource_fee.SelectParameters("enq22").DefaultValue = enddate.Text

                SqlDataSource_fee.SelectCommand = sSQL
                ViewState("MySQL") = sSQL

                startdate.Text = ""
                enddate.Text = ""
            End If
        Catch ex As Exception
            'MessageBox.Show("An Error Occurred!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('An error occured');menubar=yes;", True)
        End Try
    End Sub

    Dim total As Integer = 0
    Dim TotalFee As Integer = 0
    Protected Sub CoolGridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CoolGridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            total += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "rem_fee"))

        ElseIf (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(3).Text = "Total Fee Remaining"
            e.Row.Font.Bold = True

            e.Row.Cells(4).Text = total.ToString()
            e.Row.Cells(4).Font.Bold = True
        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            TotalFee += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "TotalFee"))

        ElseIf (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(5).Text = TotalFee.ToString()
            e.Row.Cells(5).Font.Bold = True
        End If

        For Each row As GridViewRow In CoolGridView2.Rows
            Dim cbox1 As CheckBox = DirectCast(row.Cells(0).FindControl("defaulter"), CheckBox)
            If cbox1.Checked Then
                row.BackColor = System.Drawing.ColorTranslator.FromHtml("#D00")
            End If
        Next
    End Sub

    Protected Sub defaulter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles defaulter.Click
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
            Dim cBox As CheckBox = DirectCast(CoolGridView2.Rows(i).FindControl("defaulter"), CheckBox)
            If Not (cBox.Checked) Then
                cmd.CommandText = "UPDATE fee_collect SET defaulter = 'False' WHERE mobileno_fee = '" & theid & "'"
                cmd.ExecuteNonQuery()
                Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Updated,Student Removed From Defaulter List');menubar=yes;", True)
            Else
                cmd.CommandText = "UPDATE fee_collect SET defaulter = 'True' WHERE mobileno_fee = '" & theid & "'"
                cmd.ExecuteNonQuery()
                Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Updated, Student Added To Defaulter List');menubar=yes;", True)
            End If
        Next
    End Sub
End Class
