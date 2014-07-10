Imports System.Data.SqlClient
Partial Class admin_fee_followup
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
    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
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

        cmd.CommandText = "select mobile from enquiry_details where mobile = '" & mobile_search.Text & "'"
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            dr.Close()
            cmd.CommandText = "select mobileno_fee, rem_fee from fee_collect where mobileno_fee = '" & mobile_search.Text & "'"
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                dr.Close()
                cmd.CommandText = "if exists (select mobileno_followup from fee_followup where mobileno_followup = '" & mobile_search.Text & "')" & _
                " SELECT enquiry_details.student_name,enquiry_details.course_enq,fee_collect.rem_fee,fee_collect.remark,fee_followup.* FROM enquiry_details INNER JOIN" & _
                " fee_collect ON enquiry_details.mobile = fee_collect.mobileno_fee INNER JOIN fee_followup ON fee_collect.mobileno_fee = fee_followup.mobileno_followup" & _
                " WHERE enquiry_details.mobile = '" & mobile_search.Text & "' else insert into fee_followup (mobileno_followup) values ('" & mobile_search.Text & "')"
                cmd.ExecuteNonQuery()
                dr = cmd.ExecuteReader()
                If dr.Read() And dr("student_name").Equals(DBNull.Value) Then
                    student_name.Text = ""
                Else
                    student_name.Text = dr("student_name")
                End If
                If dr("course_enq").Equals(DBNull.Value) Then
                    dd_course.ClearSelection()
                Else
                    dd_course.SelectedIndex = dd_course.Items.IndexOf(dd_course.Items.FindByText(dr("course_enq")))
                End If

                If dr("rem_fee").Equals(DBNull.Value) Then
                    rem_fee.Text = ""
                Else
                    rem_fee.Text = dr("rem_fee")
                End If

                If dr("remark").Equals(DBNull.Value) Then
                    remark.Text = ""
                Else
                    remark.Text = dr("remark")
                End If

                If dr("f_1").Equals(DBNull.Value) Then
                    f1.Text = ""
                Else
                    f1.Text = dr("f_1")
                End If

                If dr("date_f_1").Equals(DBNull.Value) Then
                    date_f1.Text = ""
                Else
                    Dim d As Date
                    d = dr("date_f_1")
                    date_f1.Text = d.ToString("yyyy'/'MM'/'dd")
                End If

                If dr("councellor_f1").Equals(DBNull.Value) Then
                    DD_c1.ClearSelection()
                Else
                    DD_c1.SelectedIndex = DD_c1.Items.IndexOf(DD_c1.Items.FindByText(dr("councellor_f1")))
                End If

                If dr("f_2").Equals(DBNull.Value) Then
                    f2.Text = ""
                Else
                    f2.Text = dr("f_2")
                End If

                If dr("date_f_2").Equals(DBNull.Value) Then
                    date_f2.Text = ""
                Else
                    Dim d As Date
                    d = dr("date_f_2")
                    date_f2.Text = d.ToString("yyyy'/'MM'/'dd")
                End If

                If dr("councellor_f2").Equals(DBNull.Value) Then
                    DD_c2.ClearSelection()
                Else
                    DD_c2.SelectedIndex = DD_c2.Items.IndexOf(DD_c2.Items.FindByText(dr("councellor_f2")))
                End If

                If dr("f_3").Equals(DBNull.Value) Then
                    f3.Text = ""
                Else
                    f3.Text = dr("f_3")
                End If

                If dr("date_f_3").Equals(DBNull.Value) Then
                    date_f3.Text = ""
                Else
                    Dim d As Date
                    d = dr("date_f_3")
                    date_f3.Text = d.ToString("yyyy'/'MM'/'dd")
                End If

                If dr("councellor_f3").Equals(DBNull.Value) Then
                    DD_c3.ClearSelection()
                Else
                    DD_c3.SelectedIndex = DD_c3.Items.IndexOf(DD_c3.Items.FindByText(dr("councellor_f3")))
                End If
            Else
                'MessageBox.Show("Student Not Registered !!", "NOT REGISTERED", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Student Not Registered');menubar=yes;", True)
            End If
        Else
            'MessageBox.Show("Data not found !!", "NOT FOUND", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data was not found');menubar=yes;", True)
        End If
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
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

        cmd.Parameters.AddWithValue("@date_f_1", date_f1.Text)
        cmd.Parameters.AddWithValue("@date_f_2", date_f2.Text)
        cmd.Parameters.AddWithValue("@date_f_3", date_f3.Text)

        cmd.CommandText = "update fee_followup set f_1 = '" & f1.Text & "', date_f_1 = @date_f_1, councellor_f1 = '" & DD_c1.SelectedItem.Text & "' , f_2 = '" & f2.Text & "', date_f_2 =  @date_f_2, councellor_f2 = '" & DD_c2.SelectedItem.Text & "', f_3 = '" & f3.Text & "', date_f_3 =  @date_f_3, councellor_f3 = '" & DD_c3.SelectedItem.Text & "' where mobileno_followup= '" & mobile_search.Text & "'"
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Data Not Updated. Please Re-Login And Try Again!! ", " NOT UPDATED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Not Updated. Please Re-Login And Try Again!! ');menubar=yes;", True)
            Exit Sub
        End Try
        mobile_search.Text = ""
        student_name.Text = ""
        rem_fee.Text = ""
        remark.Text = ""
        dd_course.ClearSelection()
        f1.Text = ""
        date_f1.Text = ""
        DD_c1.ClearSelection()
        f2.Text = ""
        date_f2.Text = ""
        DD_c2.ClearSelection()
        f3.Text = ""
        date_f3.Text = ""
        DD_c3.ClearSelection()
        'MessageBox.Show("Data Updated ", " DATA UPDATED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Updated.');menubar=yes;", True)

    End Sub

    Protected Sub delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete.Click
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

        cmd.CommandText = "delete from table fee_followup where mobile = '" & mobile_search.Text & "'"
        cmd.ExecuteNonQuery()

        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Deleted.');menubar=yes;", True)
        mobile_search.Text = ""
        student_name.Text = ""
        dd_course.ClearSelection()
        f1.Text = ""
        date_f1.Text = ""
        DD_c1.ClearSelection()
        f2.Text = ""
        date_f2.Text = ""
        DD_c2.ClearSelection()
        f3.Text = ""
        date_f3.Text = ""
        DD_c3.ClearSelection()
    End Sub
End Class
