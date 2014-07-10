<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="admin_user.aspx.vb" Inherits="admin_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <%
                    Dim a_nm As String
                    Try
                        a_nm = Session.Item("a_uname").ToString
                        Session.Add("a_uname", a_nm)
                %>
                
                <%
                Catch ex As Exception
                    Response.Redirect("session_exp.aspx")
                    Response.End()
                End Try
                %>
          <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT"border="0" style="margin: 0px 0px 0px 240px" /></a><br /><br />
   <nav id="ddmenu">
    <ul>
        <li><a href="admin_home.aspx">Home</a></li>
        <li>Update Enquiry
                <div class="column">
                    <b>UPDATE ENQUIRY</b>
                    <a href="admin_update.aspx">Update Enquiry</a>
                    <a href="admin_followup.aspx">Follow Up</a>
                </div>
        </li>
        <li>Fee Details
                <div class="column">
                    <b>GET FEE DETAILS</b>
                    <div>
                        <a href="admin_fee_collect.aspx">Fee Collect</a>
                        <a href="admin_fee_followup.aspx">Fee Follow Up</a>
                        <a href="admin_fee_details.aspx">Fee Due</a>
                    </div>
                </div>
        </li>
        <li>Scholorship
                <div class="column">
                    <b>SCHOLORSHIP DETAILS</b>
                    <a href="admin_create_exam.aspx">Create Exam</a>
                    <a href="admin_exam_reg_del.aspx">Registeration for Exam</a>
                    <a href="admin_test_details.aspx">Scholorship Earned</a>
                </div>
        </li>
        <li><a href="admin_user.aspx">User Manage</a></li>
        <li><a href="admin_master_set.aspx">Master Entry</a></li>
        <li><a href="logout.aspx">Logout</a></li>
    </ul>
</nav>
         
            <div id="topPanel2">
            <%--<ul>
                    <li><a href="admin_master_set.aspx">Master</a></li>
                    <li class="active">Users</li>
                    <li><a href="admin_followup.aspx">Follow up</a></li>
                    <li><a href="admin_update.aspx">Update Data</a></li>
                    <li><a href="admin_home.aspx">Home</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" /></a>--%>
                
                     <p style="padding-top:60px; text-align:center " >
                     <%
                         Try
                             a_nm = Session.Item("a_uname").ToString
                             Response.Write("<h3><center>Welcome<b> " & a_nm & " </b></center></h3>")
                             Session.Add("a_uname", a_nm)
                     %>
                     
                     <%
                     Catch ex As Exception
                         Response.Redirect("session_exp.aspx")
                         Response.End()
                     End Try
        
                     %>   
                    </p>
                </div>
                
                   <div id="bodyPanel">
	                    <div id="user"  style="margin-left:130px; margin-top:100px">
                            <asp:Panel ID="Panel1" runat="server" Height="350px">
                            <table>
                            <tr>
                                <td align="center" colspan="3">
                                Update counsellors
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label3" runat="server" Text="counsellor Name"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="councellor_name" runat="server"></asp:TextBox>
                                </td>
                                <td>
                            
                                    <asp:Button ID="Add" runat="server" Text="Add" Width="55px" />
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="password" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;                          
                                </td>
                            </tr>
                            <tr>
                                <td align="center"; colspan="3">
                                   Delete counsellor 
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    
                                    <asp:Label ID="Label4" runat="server" Text="Select counsellor"></asp:Label>
                                    
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_councellor_del" runat="server" Height="22px" 
                                        Width="148px" DataSourceID="Sql_councellor" DataTextField="username">
                                    </asp:DropDownList>
                            
                                    <asp:SqlDataSource ID="Sql_councellor" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        SelectCommand="SELECT [username] FROM [user_login]"></asp:SqlDataSource>
                            
                                </td>
                                <td>
                            
                                    <asp:Button ID="Delete" runat="server" Text="Delete" Width="55px" />
                            
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;
                                </td>

                            </tr>
                            <tr>
                                <td  align="center"; colspan="3">
                                    Change Password
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label5" runat="server" Text="counsellor Name"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_councellor_pass" runat="server" Height="22px" 
                                        Width="148px" DataSourceID="Sql_councellor" DataTextField="username" 
                                        DataValueField="username">
                                    </asp:DropDownList>
                                </td>
                                <td>
                            
                                    <asp:Button ID="Update" runat="server" Height="26px" Text="Update" 
                                        Width="55px" />
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="password_changed" runat="server"></asp:TextBox>
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;
                                </td>
                            </tr>

                        </table>
                            </asp:Panel> 
	                    </div>
                   </div>
                   <div id="footerPanel">
                        <div id="footerbodyPanel">
                          <ul>
                            <li><a href="default.aspx">Login</a>| </li>
                            <li><a href="logout.aspx">Logout</a>| </li>
                            <li><a href="http://www.[CompanyName].com/Raipur-innauguration.asp">Pt Raipur</a>| </li>
                            <li><a href="http://www.[CompanyName].com/default.aspx">Pt Website</a>| </li>
                          </ul>                            
                          <p class="copyright">©[Company Name] all right reaserved</p>
                          <ul class="templateworld">
  	                        <li>Design By:</li>
	                        <li><a href="http://www.sicservices.co.in" target="_blank">S.I.C. services</a></li>
                          </ul>
                            <div id="footerhtmlPanel"><a href="http://www.[CompanyName].com" target="_blank">
                            Owner</a></div>
                            <div id="footercssPanel"><a href="http://www.godaddy.com" target="_blank">
                             Host</a></div>
                        </div>
                    </div>
        
</asp:Content>


