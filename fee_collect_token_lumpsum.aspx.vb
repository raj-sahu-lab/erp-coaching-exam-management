Imports System.Data.SqlClient
Imports System.Math
Partial Class fee_collect_token_lumpsum
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim nm As String

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
            cmd.CommandText = "select token_amt, token_date, token_councellor, lumpsum_amount, due_date_lumpsum, paid_lumpsum, pay_date_lumpsum, councellor_lumpsum from fee_collect where mobileno_fee = @mob"
            cmd.Parameters.AddWithValue("@mob", mob)
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
                If dr("lumpsum_amount") Is DBNull.Value Then
                    lumpsum_amount.Text = ""
                Else
                    lumpsum_amount.Text = Math.Round(dr("lumpsum_amount"))
                End If
                If dr("due_date_lumpsum") Is DBNull.Value Then
                    due_date_lumpsum.Text = ""
                Else
                    Dim d As Date
                    d = dr("due_date_lumpsum")
                    due_date_lumpsum.Text = d.ToString("yyyy/MM/dd")
                End If
                If dr("paid_lumpsum") Is DBNull.Value Then
                    paid_lumpsum.Text = ""
                Else
                    paid_lumpsum.Text = Math.Round(dr("paid_lumpsum"))
                End If
                If dr("pay_date_lumpsum") Is DBNull.Value Then
                    pay_date_lumpsum.Text = ""
                Else
                    Dim d As Date
                    d = dr("pay_date_lumpsum")
                    pay_date_lumpsum.Text = d.ToString("yyyy/MM/dd")
                End If
                If dr("councellor_lumpsum") Is DBNull.Value Then
                    dd_councellor_lumpsum.ClearSelection()
                Else
                    dd_councellor_lumpsum.SelectedIndex = dd_councellor_lumpsum.Items.IndexOf(dd_councellor_lumpsum.Items.FindByText(dr("councellor_lumpsum")))
                End If
            End If
            dr.Close()
        End If
    End Sub

    Protected Sub pay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles pay.Click
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

        Dim coursefee As Integer
        Dim remfee As Integer
        Dim remark As String

        coursefee = Session.Item("course_fee").ToString()
        remfee = Val(coursefee) - (Val(token_amount.Text) + Val(paid_lumpsum.Text))
        remark = Session.Item("remark").ToString()

        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        cmd.Parameters.AddWithValue("@token_amt", token_amount.Text)
        cmd.Parameters.AddWithValue("@token_date", token_date.Text)
        cmd.Parameters.AddWithValue("@token_councellor", dd_token_councellor.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@remfee", remfee)
        cmd.Parameters.AddWithValue("@lumpsum_amount", lumpsum_amount.Text)
        cmd.Parameters.AddWithValue("@due_date_lumpsum", due_date_lumpsum.Text)
        cmd.Parameters.AddWithValue("@paid_lumpsum", paid_lumpsum.Text)
        cmd.Parameters.AddWithValue("@pay_date_lumpsum", pay_date_lumpsum.Text)
        cmd.Parameters.AddWithValue("@councellor_lumpsum", dd_councellor_lumpsum.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@remark", remark)
        cmd.Parameters.AddWithValue("@coursefee", coursefee)

        cmd.CommandText = "if exists (select mobileno_fee from fee_collect where mobileno_fee = @mobile) Update fee_collect set token_amt = @token_amt, token_date = @token_date, token_councellor = @token_councellor, rem_fee = @remfee, lumpsum_amount = @lumpsum_amount, due_date_lumpsum = @due_date_lumpsum, paid_lumpsum = @paid_lumpsum, pay_date_lumpsum = @pay_date_lumpsum, councellor_lumpsum = @councellor_lumpsum, remark = @remark where mobileno_fee = @mobile" & _
                            " else insert into fee_collect (mobileno_fee,type_fee,course_fee,token_amt,token_date,token_councellor,rem_fee,lumpsum_amount,due_date_lumpsum,paid_lumpsum,pay_date_lumpsum,councellor_lumpsum,remark) " & _
                            " values (@mobile,'Token + Lumpsum Payment',@coursefee,@token_amt,@token_date,@token_councellor,@remfee,@lumpsum_amount,@due_date_lumpsum,@paid_lumpsum,@pay_date_lumpsum,@councellor_lumpsum,@remark)"
        cmd.ExecuteNonQuery()

        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        cmd.CommandText = "update enquiry_details set status_enq = 'Registered' where mobile = @mobile"
        cmd.ExecuteNonQuery()

        'MessageBox.Show("Fee Accepted,Student Registered", "FEE ACCEPTED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Fee Accepted,Student Registered');menubar=yes;window.location.href = 'followup.aspx';", True)

        mobile.Text = ""
        token_amount.Text = ""
        token_date.Text = ""
        dd_token_councellor.ClearSelection()
        lumpsum_amount.Text = ""
        due_date_lumpsum.Text = ""
        paid_lumpsum.Text = ""
        pay_date_lumpsum.Text = ""
        dd_councellor_lumpsum.ClearSelection()
    End Sub
End Class
