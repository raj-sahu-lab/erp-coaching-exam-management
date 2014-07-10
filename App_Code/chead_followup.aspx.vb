Imports System.Data.SqlClient

Partial Class chead_followup
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
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
            End If
        Catch NullReferenceException As Exception
            Response.Redirect("session_exp.aspx")
        End Try

        cmd.CommandText = "select * from enquiry_details where mobile='" & mobile_search.Text & "' "
        dr = cmd.ExecuteReader()
        If Not dr.Read Then
            'MessageBox.Show("Data not found", "NOT FOUND", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data was not found');menubar=yes;", True)
        Else
            student_name.Text = dr(0)
            dd_course.SelectedIndex = dd_course.Items.IndexOf(dd_course.Items.FindByText(dr(7)))
            If dr(14) Is DBNull.Value Then
                f1.Text = ""
            Else
                f1.Text = dr(14)
            End If

            If dr(15) Is DBNull.Value Then
                date_f1.Text = ""
            Else
                Dim d As Date
                d = dr(15)
                date_f1.Text = d.ToString("yyyy'/'MM'/'dd")
            End If

            If dr(16) Is DBNull.Value Then
                DD_c1.ClearSelection()
            Else
                DD_c1.SelectedIndex = DD_c1.Items.IndexOf(DD_c1.Items.FindByText(dr(16)))
            End If

            If dr(17) Is DBNull.Value Then
                f2.Text = ""
            Else
                f2.Text = dr(17)
            End If

            If dr(18) Is DBNull.Value Then
                date_f2.Text = ""
            Else
                Dim d As Date
                d = dr(18)
                date_f2.Text = d.ToString("yyyy'/'MM'/'dd")
            End If

            If dr(19) Is DBNull.Value Then
                DD_c2.ClearSelection()
            Else
                DD_c2.SelectedIndex = DD_c2.Items.IndexOf(DD_c2.Items.FindByText(dr(19)))
            End If

            If dr(20) Is DBNull.Value Then
                f3.Text = ""
            Else
                f3.Text = dr(20)
            End If

            If dr(21) Is DBNull.Value Then
                date_f3.Text = ""
            Else
                Dim d As Date
                d = dr(21)
                date_f3.Text = d.ToString("yyyy'/'MM'/'dd")
            End If

            If dr(22) Is DBNull.Value Then
                DD_c3.ClearSelection()
            Else
                DD_c3.SelectedIndex = DD_c3.Items.IndexOf(DD_c3.Items.FindByText(dr(22)))
            End If

            If dr(23) Is DBNull.Value Then
                f4.Text = ""
            Else
                f4.Text = dr(23)
            End If

            If dr(24) Is DBNull.Value Then
                date_f4.Text = ""
            Else
                Dim d As Date
                d = dr(24)
                date_f4.Text = d.ToString("yyyy'/'MM'/'dd")
            End If

            If dr(25) Is DBNull.Value Then
                DD_c4.ClearSelection()
            Else
                DD_c4.SelectedIndex = DD_c4.Items.IndexOf(DD_c4.Items.FindByText(dr(25)))
            End If

            If dr(26) Is DBNull.Value Then
                f5.Text = ""
            Else
                f5.Text = dr(26)
            End If

            If dr(27) Is DBNull.Value Then
                date_f5.Text = ""
            Else
                Dim d As Date
                d = dr(27)
                date_f5.Text = d.ToString("yyyy'/'MM'/'dd")
            End If

            If dr(28) Is DBNull.Value Then
                DD_c5.ClearSelection()
            Else
                DD_c5.SelectedIndex = DD_c5.Items.IndexOf(DD_c5.Items.FindByText(dr(28)))
            End If

            If dr(29) Is DBNull.Value Then
                f6.Text = ""
            Else
                f6.Text = dr(29)
            End If

            If dr(30) Is DBNull.Value Then
                date_f6.Text = ""
            Else
                Dim d As Date
                d = dr(30)
                date_f6.Text = d.ToString("yyyy'/'MM'/'dd")
            End If

            If dr(31) Is DBNull.Value Then
                DD_c6.ClearSelection()
            Else
                DD_c6.SelectedIndex = DD_c6.Items.IndexOf(DD_c6.Items.FindByText(dr(31)))
            End If
        End If
        dr.Close()
    End Sub
    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        chead_nm = Session.Item("a_uname")
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

        cmd.Parameters.AddWithValue("@date_f_1", date_f1.Text)
        cmd.Parameters.AddWithValue("@date_f_2", date_f2.Text)
        cmd.Parameters.AddWithValue("@date_f_3", date_f3.Text)
        cmd.Parameters.AddWithValue("@date_f_4", date_f4.Text)
        cmd.Parameters.AddWithValue("@date_f_5", date_f5.Text)
        cmd.Parameters.AddWithValue("@date_f_6", date_f6.Text)

        cmd.CommandText = "update enquiry_details set f_1 = '" & f1.Text & "', date_f_1 = @date_f_1, councellor_f1 = '" & DD_c1.SelectedItem.Text & "' , f_2 = '" & f2.Text & "', date_f_2 =  @date_f_2, councellor_f2 = '" & DD_c2.SelectedItem.Text & "', f_3 = '" & f3.Text & "', date_f_3 =  @date_f_3, councellor_f3 = '" & DD_c3.SelectedItem.Text & "', f_4 = '" & f4.Text & "', date_f_4 =  @date_f_4, councellor_f4 = '" & DD_c4.SelectedItem.Text & "', f_5 = '" & f5.Text & "', date_f_5 = @date_f_5, councellor_f5 =  '" & DD_c5.SelectedItem.Text & "', f_6 =  '" & f6.Text & "', date_f_6 = @date_f_6 , councellor_f6 = '" & DD_c6.SelectedItem.Text & "' where mobile= '" & mobile_search.Text & "'"
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Data Not Updated ", "NOT UPDATED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Not Updated');menubar=yes;", True)
            Exit Sub
        End Try

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
        f4.Text = ""
        date_f4.Text = ""
        DD_c4.ClearSelection()
        f5.Text = ""
        date_f5.Text = ""
        DD_c5.ClearSelection()
        f6.Text = ""
        date_f6.Text = ""
        DD_c6.ClearSelection()

        'MessageBox.Show("Data Updated ", " DATA UPDATED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Updated.');menubar=yes;", True)

    End Sub

    Protected Sub delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete.Click
        chead_nm = Session.Item("a_uname")
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

        cmd.CommandText = "delete from enquiry_details where mobile='" & mobile_search.Text & "'"
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            'MessageBox.Show("Data Not Deleted ", " NOT DELETED", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Not Deleted. Please Re-Login And Try Again!! ');menubar=yes;", True)
            Exit Sub
        End Try
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
        f4.Text = ""
        date_f4.Text = ""
        DD_c4.ClearSelection()
        f5.Text = ""
        date_f5.Text = ""
        DD_c5.ClearSelection()
        f6.Text = ""
        date_f6.Text = ""
        DD_c6.ClearSelection()

        'MessageBox.Show("Data Deleted ", " DATA DELETED", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Data Deleted.');menubar=yes;", True)

    End Sub

    Protected Sub close_enq_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles close_enq.Click
        chead_nm = Session.Item("a_uname")
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

        If mobile_search.Text = "" Then
            'MessageBox.Show("Search Data To Close Enquiy ", "SEARCH DATA FIRST", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Search Data To Close Enquiry');menubar=yes;", True)
        Else
            cmd.CommandText = "update enquiry_details set status_enq = 'Closed' where mobile = '" & mobile_search.Text & "'"
            cmd.ExecuteNonQuery()

            'MessageBox.Show("Enquiry Closed ", "CLOSED", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "ALERT", "alert('Enquiry Closed');menubar=yes;", True)

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
            f4.Text = ""
            date_f4.Text = ""
            DD_c4.ClearSelection()
            f5.Text = ""
            date_f5.Text = ""
            DD_c5.ClearSelection()
            f6.Text = ""
            date_f6.Text = ""
            DD_c6.ClearSelection()
        End If
    End Sub
End Class