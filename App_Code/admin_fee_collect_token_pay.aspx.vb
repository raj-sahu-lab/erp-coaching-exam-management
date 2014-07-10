Imports System.Data.SqlClient
Imports System.Math
Partial Class admin_fee_collect_token_pay
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim a_nm As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con

        If (Not Page.IsPostBack) Then
            Dim mob As String
            mob = Session.Item("mobile").ToString()
            mobile.Text = mob
            cmd.CommandText = "select token_amt, token_date, token_councellor, inst1, due_date1, paid1, pay_date1, councellor1, inst2, due_date2, paid2, pay_date2, councellor2 from fee_collect where mobileno_fee = " & mob & ""
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                If dr("token_amt") Is DBNull.Value Then
                    token_amount.Text = ""
                Else
                    token_amount.Text = Math.Round(dr("token_amt"))
                End If
                If dr("token_date") Is DBNull.Value Then
                    token_date.Text = ""
                Else
                    Dim d As Date
                    d = dr("token_date")
                    token_date.Text = d.ToString("yyyy/MM/dd")
                End If
                If dr("token_councellor") Is DBNull.Value Then
                    dd_token_councellor.ClearSelection()
                Else
                    dd_token_councellor.SelectedIndex = dd_token_councellor.Items.IndexOf(dd_token_councellor.Items.FindByText(dr("token_councellor")))
                End If
                If dr("inst1") Is DBNull.Value Then
                    inst1.Text = ""
                Else
                    inst1.Text = Math.Round(dr("inst1"))
                End If
                If dr("due_date1") Is DBNull.Value Then
                    due_date1.Text = ""
                Else
                    Dim d As Date
                    d = dr("due_date1")
                    due_date1.Text = d.ToString("yyyy/MM/dd")
                End If
                If dr("paid1") Is DBNull.Value Then
                    paid1.Text = ""
                Else
                    paid1.Text = Math.Round(dr("paid1"))
                End If
                If dr("pay_date1") Is DBNull.Value Then
                    pay_date1.Text = ""
                Else
                    Dim d As Date
                    d = dr("pay_date1")
                    pay_date1.Text = d.ToString("yyyy/MM/dd")
                End If
                If dr("councellor1") Is DBNull.Value Then
                    dd_councellor1.ClearSelection()
                Else
                    dd_councellor1.SelectedIndex = dd_councellor1.Items.IndexOf(dd_councellor1.Items.FindByText(dr("councellor1")))
                End If
                If dr("inst2") Is DBNull.Value Then
                    inst2.Text = ""
                Else
                    inst2.Text = Math.Round(dr("inst2"))
                End If
                If dr("due_date2") Is DBNull.Value Then
                    due_date2.Text = ""
                Else
                    Dim d As Date
                    d = dr("due_date2")
                    due_date2.Text = d.ToString("yyyy/MM/dd")
                End If
                If dr("paid2") Is DBNull.Value Then
                    paid2.Text = ""
                Else
                    paid2.Text = Math.Round(dr("paid2"))
                End If
                If dr("pay_date2") Is DBNull.Value Then
                    pay_date2.Text = ""
                Else
                    Dim d As Date
                    d = dr("pay_date2")
                    pay_date2.Text = d.ToString("yyyy/MM/dd")
                End If
                If dr("councellor2") Is DBNull.Value Then
                    dd_councellor2.ClearSelection()
                Else
                    dd_councellor2.SelectedIndex = dd_councellor2.Items.IndexOf(dd_councellor2.Items.FindByText(dr("councellor2")))
                End If
            End If
            dr.Close()
        End If
    End Sub

    Protected Sub pay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles pay.Click
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

        Dim coursefee As Integer
        Dim remfee As Integer
        Dim remark As String

        coursefee = Session.Item("course_fee").ToString()
        remfee = Val(coursefee) - (Val(token_amount.Text) + Val(paid1.Text) + Val(paid2.Text))
        remark = Session.Item("remark").ToString()

        cmd.Parameters.AddWithValue("@token_date", token_date.Text)
        cmd.Parameters.AddWithValue("@due_date1", due_date1.Text)
        cmd.Parameters.AddWithValue("@pay_date1", pay_date1.Text)
        cmd.Parameters.AddWithValue("@due_date2", due_date2.Text)
        cmd.Parameters.AddWithValue("@pay_date2", pay_date2.Text)

        cmd.CommandText = "if exists (select mobileno_fee from fee_collect where mobileno_fee = '" & mobile.Text & "') Update fee_collect set token_amt = '" & token_amount.Text & "', token_date = @token_date, token_councellor = '" & dd_token_councellor.SelectedItem.Text & "', rem_fee =  '" & remfee & "', inst1 = '" & inst1.Text & "', due_date1 = @due_date1, paid1 = '" & paid1.Text & "', pay_date1 = @pay_date1, councellor1 = '" & dd_councellor1.SelectedItem.Text & "', inst2 = '" & inst2.Text & "', due_date2 = @due_date2, paid2 = '" & paid2.Text & "', pay_date2 = @pay_date2, councellor2 = '" & dd_councellor2.SelectedItem.Text & "', remark = '" & remark & "' where mobileno_fee = '" & mobile.Text & "'" & _
                            " else insert into fee_collect (mobileno_fee,type_fee,course_fee,token_amt,token_date,token_councellor,rem_fee,inst1,due_date1,paid1,pay_date1,councellor1,inst2,due_date2,paid2,pay_date2,councellor2,remark) " & _
                            " values ('" & mobile.Text & "','Token + Part Payment','" & coursefee & "','" & token_amount.Text & "', @token_date, '" & dd_token_councellor.SelectedItem.Text & "','" & remfee & "','" & inst1.Text & "', @due_date1, '" & paid1.Text & "', @pay_date1,'" & dd_councellor1.SelectedItem.Text & "','" & inst2.Text & "', @due_date2, '" & paid2.Text & "', @pay_date2, '" & dd_councellor2.SelectedItem.Text & "', '" & remark & "')"
        cmd.ExecuteNonQuery()

        cmd.CommandText = "update enquiry_details set status_enq = 'Registered' where mobile = '" & mobile.Text & "'"
        cmd.ExecuteNonQuery()

        'MessageBox.Show("Fee Accepted,Student Registered", "FEE ACCEPTED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Fee Accepted,Student Registered');menubar=yes;", True)

        mobile.Text = ""
        token_amount.Text = ""
        token_date.Text = ""
        dd_token_councellor.ClearSelection()
        inst1.Text = ""
        due_date1.Text = ""
        paid1.Text = ""
        pay_date1.Text = ""
        dd_councellor1.ClearSelection()
        inst2.Text = ""
        due_date2.Text = ""
        paid2.Text = ""
        pay_date2.Text = ""
        dd_councellor2.ClearSelection()

    End Sub
End Class
