Imports System.Data.SqlClient
Imports System.Math
Partial Class fee_collect_notoken_pay
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
            cmd.CommandText = "select inst1, due_date1, paid1, pay_date1, councellor1, inst2, due_date2, paid2, pay_date2, councellor2 from fee_collect where mobileno_fee = @mob"
            cmd.Parameters.AddWithValue("@mob", mob)
            dr = cmd.ExecuteReader()
            If dr.Read() Then
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
        remfee = Val(coursefee) - (Val(paid1.Text) + Val(paid2.Text))
        remark = Session.Item("remark").ToString()

        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        cmd.Parameters.AddWithValue("@remfee", remfee)
        cmd.Parameters.AddWithValue("@inst1", inst1.Text)
        cmd.Parameters.AddWithValue("@due_date1", due_date1.Text)
        cmd.Parameters.AddWithValue("@paid1", paid1.Text)
        cmd.Parameters.AddWithValue("@pay_date1", pay_date1.Text)
        cmd.Parameters.AddWithValue("@councellor1", dd_councellor1.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@inst2", inst2.Text)
        cmd.Parameters.AddWithValue("@due_date2", due_date2.Text)
        cmd.Parameters.AddWithValue("@paid2", paid2.Text)
        cmd.Parameters.AddWithValue("@pay_date2", pay_date2.Text)
        cmd.Parameters.AddWithValue("@councellor2", dd_councellor2.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@remark", remark)
        cmd.Parameters.AddWithValue("@coursefee", coursefee)

        cmd.CommandText = "if exists (select mobileno_fee from fee_collect where mobileno_fee = @mobile) Update fee_collect set rem_fee = @remfee, inst1 = @inst1, due_date1 = @due_date1, paid1 = @paid1, pay_date1 = @pay_date1, councellor1 = @councellor1, inst2 = @inst2, due_date2 = @due_date2, paid2 = @paid2, pay_date2 = @pay_date2, councellor2 = @councellor2, remark = @remark where mobileno_fee = @mobile" & _
                            " else insert into fee_collect (mobileno_fee,type_fee,course_fee,rem_fee,inst1,due_date1,paid1,pay_date1,councellor1,inst2,due_date2,paid2,pay_date2,councellor2,remark) " & _
                            " values (@mobile,'No Token + Part Payment',@coursefee,@remfee,@inst1,@due_date1,@paid1,@pay_date1,@councellor1,@inst2,@due_date2,@paid2,@pay_date2,@councellor2,@remark)"
        cmd.ExecuteNonQuery()

        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@mobile", mobile.Text)
        cmd.CommandText = "update enquiry_details set status_enq = 'Registered' where mobile = @mobile"
        cmd.ExecuteNonQuery()

        'MessageBox.Show("Fee Accepted,Student Registered", "FEE ACCEPTED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Fee Accepted,Student Registered');menubar=yes;", True)

        mobile.Text = ""
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
