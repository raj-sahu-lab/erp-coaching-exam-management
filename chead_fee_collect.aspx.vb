Imports System.Data.SqlClient
Imports System.Math
Partial Class chead_fee_collect
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim gender As String
    Dim chead_nm As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection()
        Dim conString = ConfigurationManager.ConnectionStrings("pt_enquiry")
        con.ConnectionString = conString.ConnectionString
        con.Open()
        cmd = New SqlCommand
        cmd.Connection = con
    End Sub
    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        chead_nm = Session.Item("chead_uname")
        Try
            If chead_nm.Length < 1 Then
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

        student_name.Text = ""
        rb_female.Checked = False
        rb_male.Checked = False
        Mobile.Text = ""
        dd_course.ClearSelection()
        dd_pay_type.ClearSelection()
        dd_status.ClearSelection()
        course_fee.Text = ""
        rem_fee.Text = ""

        cmd.CommandText = "select mobile,status_enq from enquiry_details where mobile = '" & mobile_search.Text & "'"
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            If dr("status_enq").Equals("Registered") Then
                dr.Close()
                cmd.CommandText = "SELECT fee_collect.mobileno_fee, fee_collect.type_fee, fee_collect.course_fee, fee_collect.rem_fee, enquiry_details.student_name, enquiry_details.gender, enquiry_details.course_enq, enquiry_details.status_enq, fee_collect.remark FROM fee_collect INNER JOIN enquiry_details ON fee_collect.mobileno_fee = enquiry_details.mobile LEFT OUTER JOIN fee_followup ON enquiry_details.mobile = fee_followup.mobileno_followup WHERE mobileno_fee = '" & mobile_search.Text & "'"
                dr = cmd.ExecuteReader()
                If (dr.Read() And Not (dr("type_fee") Is DBNull.Value)) Then
                    student_name.Text = dr("student_name")
                    If dr("gender").Equals("Male") Then
                        rb_male.Checked = True
                    ElseIf dr("gender").Equals("Female") Then
                        rb_female.Checked = True
                    End If
                    Mobile.Text = dr("mobileno_fee")
                    dd_course.SelectedIndex = dd_course.Items.IndexOf(dd_course.Items.FindByText(dr("course_enq")))
                    dd_pay_type.SelectedIndex = dd_pay_type.Items.IndexOf(dd_pay_type.Items.FindByText(dr("type_fee")))
                    dd_status.SelectedIndex = dd_status.Items.IndexOf(dd_status.Items.FindByText(dr("status_enq")))
                    If dr("course_fee").Equals(DBNull.Value) Then
                        course_fee.Text = ""
                    Else
                        course_fee.Text = Math.Round(dr("course_fee"))
                    End If
                    If dr("rem_fee").Equals(DBNull.Value) Then
                        rem_fee.Text = ""
                    Else
                        rem_fee.Text = Math.Round(dr("rem_fee"))
                    End If

                    If dr("remark").Equals(DBNull.Value) Then
                        remark.Text = ""
                    Else
                        remark.Text = dr("remark")
                    End If
                    dr.Close()
                End If
            Else
                'MessageBox.Show("Student not registered.Please register student!!", "NOT REGISTERED", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student not registered.Please register student!!');menubar=yes;", True)

                dr.Close()
                dd_pay_type.ClearSelection()
                cmd.CommandText = "SELECT student_name,gender,mobile,course_enq,status_enq FROM enquiry_details WHERE mobile = '" & mobile_search.Text & "'"
                dr = cmd.ExecuteReader()
                dr.Read()
                student_name.Text = dr("student_name")
                If dr("gender").Equals("Male") Then
                    rb_male.Checked = True
                ElseIf dr("gender").Equals("Female") Then
                    rb_female.Checked = True
                End If
                Mobile.Text = dr("mobile")
                dd_course.SelectedIndex = dd_course.Items.IndexOf(dd_course.Items.FindByText(dr("course_enq")))
                dd_status.SelectedIndex = dd_status.Items.IndexOf(dd_status.Items.FindByText(dr("status_enq")))
                dr.Close()
            End If
        Else
            'MessageBox.Show("Student not found. Start a new enquiry ", "NOT FOUND", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data waStudent not found. Start a new enquiry');menubar=yes;", True)
        End If
    End Sub

    Protected Sub make_payment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles make_payment.Click
        chead_nm = Session.Item("chead_uname")
        Try
            If chead_nm.Length < 1 Then
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

        Session.Add("mobile", mobile_search.Text)
        Session.Add("course_fee", course_fee.Text)
        Session.Add("remark", remark.Text)

        If dd_pay_type.SelectedItem.Text = "Token + Part Payment" Then
            Response.Redirect("chead_fee_collect_token_pay.aspx")
        ElseIf dd_pay_type.SelectedItem.Text = "No Token + Part Payment" Then
            Response.Redirect("chead_fee_collect_notoken_pay.aspx")
        ElseIf dd_pay_type.SelectedItem.Text = "Token + Lumpsum Payment" Then
            Response.Redirect("chead_fee_collect_token_lumpsum.aspx")
        ElseIf dd_pay_type.SelectedItem.Text = "No Token + Lumpsum Payment" Then
            Response.Redirect("chead_fee_collect_notoken_lumpsum.aspx")
        End If
        student_name.Text = ""
        rb_female.Checked = False
        rb_male.Checked = False
        Mobile.Text = ""
        dd_course.ClearSelection()
        dd_pay_type.ClearSelection()
        dd_status.ClearSelection()
        course_fee.Text = ""
        rem_fee.Text = ""
        remark.Text = ""
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
                Response.Redirect("session_exp.aspx")
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try

        mobile_search.Text = ""
        student_name.Text = ""
        rb_female.Checked = False
        rb_male.Checked = False
        Mobile.Text = ""
        dd_course.ClearSelection()
        dd_pay_type.ClearSelection()
        dd_status.ClearSelection()
        course_fee.Text = ""
        rem_fee.Text = ""
        remark.Text = ""
    End Sub
End Class
