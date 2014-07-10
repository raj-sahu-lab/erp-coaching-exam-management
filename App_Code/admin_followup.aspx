<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="admin_followup.aspx.vb" Inherits="admin_followup" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
               <%-- <ul>
                    <li><a href="admin_master_set.aspx">Master</a></li>
                    <li><a href="admin_user.aspx">Users</a></li>
                    <li class="active">Follow up</li>
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
             <div id="search"; style="margin-left:130px">
                   
                    <table>
                        <tr>
                            <td align="center" colspan="3">
                                Update Follow-Up Details
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label1" runat="server" Text="Mobile No"></asp:Label>
                            
                            </td>
                            <td align="left">
                            
                                <asp:TextBox ID="mobile_search" runat="server" Width="178px"></asp:TextBox>
                            
                            </td>
                            <td class="style1">
                            
                                <asp:Button ID="Search" runat="server" Text="Search" />
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label3" runat="server" Text="Student Name"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="student_name" runat="server" Width="178px"></asp:TextBox>
                            
                            </td>
                            <td class="style1">
                            
                                &nbsp;
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label4" runat="server" Text="Course"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="dd_course" runat="server" Height="22px" Width="185px" 
                                    DataSourceID="sql_pt_enquiry" AutoPostBack="True" 
                                    DataTextField="course_name" DataValueField="course_id">
                                </asp:DropDownList>
                            
                                <asp:SqlDataSource ID="sql_pt_enquiry" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                    
                                    SelectCommand="SELECT [course_id], [course_name] FROM [course_details]">
                                </asp:SqlDataSource>
                            
                            </td>
                            <td class="style1">
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label5" runat="server" Text="Follow Up 1"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="f1" runat="server" Height="65px" TextMode="MultiLine"></asp:TextBox>
                            
                            </td>
                            <td class="style1">
                            
                                <asp:TextBox ID="date_f1" runat="server" Width="75px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="date_f1_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="date_f1" 
                                    WatermarkText="Select date">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="date_f1_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="date_f1" Format="yyyy/MM/dd">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_d1" 
                                    runat="server" ControlToValidate="date_f1" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                             </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label2" runat="server" Text="Counsellor - 1"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="DD_c1" runat="server" Height="22px" Width="185px" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username">
                                </asp:DropDownList>
                            
                                <asp:SqlDataSource ID="Sql_councellor" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                    SelectCommand="SELECT [username] FROM [user_login]"></asp:SqlDataSource>
                            
                            </td>
                            <td class="style1">
                            
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                &nbsp;
                            
                            </td>
                            <td>
                            
                                &nbsp;
                                
                            </td>
                            <td class="style1">
                            
                                &nbsp;
                                
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label6" runat="server" Text="Follow Up 2"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="f2" runat="server" Height="65px" TextMode="MultiLine"></asp:TextBox>
                            
                            </td>
                            <td align="left" class="style1">
                            
                                <asp:TextBox ID="date_f2" runat="server" Width="75px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="date_f2_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="date_f2" 
                                    WatermarkText="Select date">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="date_f2_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="date_f2" Format="yyyy/MM/dd">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_d2" 
                                    runat="server" ControlToValidate="date_f2" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label11" runat="server" Text="Counsellor - 2"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="DD_c2" runat="server" Height="22px" Width="185px" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username">
                                </asp:DropDownList>
                            
                            </td>
                            <td class="style1">
                            
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                &nbsp;
                                
                            </td>
                            <td>
                            
                                &nbsp;
                                
                            </td>
                            <td class="style1">
                            
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label7" runat="server" Text="Follow Up 3"></asp:Label>
                                
                            </td>
                            <td>
                            
                                <asp:TextBox ID="f3" runat="server" Height="65px" TextMode="MultiLine"></asp:TextBox>
                            
                            </td>
                            <td class="style1">
                            
                                <asp:TextBox ID="date_f3" runat="server" Width="75px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="date_f3_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="date_f3" 
                                    WatermarkText="Select date">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="date_f3_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="date_f3" Format="yyyy/MM/dd">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_d3" 
                                    runat="server" ControlToValidate="date_f3" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label12" runat="server" Text="Counsellor - 3"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="DD_c3" runat="server" Height="22px" Width="185px" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username">
                                </asp:DropDownList>
                            
                            </td>
                            <td class="style1">
                            
                                &nbsp;</td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                &nbsp;
                            
                            </td>
                            <td>
                            
                                &nbsp;
                                
                            </td>
                            <td class="style1">
                            
                                &nbsp;
                                
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label8" runat="server" Text="Follow Up 4"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="f4" runat="server" Height="65px" TextMode="MultiLine"></asp:TextBox>
                                
                            </td>
                            <td class="style1">
                            
                                <asp:TextBox ID="date_f4" runat="server" Width="75px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="date_f4_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="date_f4" 
                                    WatermarkText="Select date">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="date_f4_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="date_f4" Format="yyyy/MM/dd">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_d4" 
                                    runat="server" ControlToValidate="date_f2" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label13" runat="server" Text="Counsellor - 4"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="DD_c4" runat="server" Height="22px" Width="185px" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username">
                                </asp:DropDownList>
                            
                            </td>
                            <td class="style1">
                            
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                &nbsp;
                                
                            </td>
                            <td>
                            
                                &nbsp;
                                
                            </td>
                            <td class="style1">
                            
                                &nbsp;
                                
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label9" runat="server" Text="Follow Up 5"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="f5" runat="server" Height="65px" TextMode="MultiLine"></asp:TextBox>
                            
                            </td>
                            <td class="style1">
                            
                                <asp:TextBox ID="date_f5" runat="server" Width="75px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="date_f5_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="date_f5" 
                                    WatermarkText="Select date">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="date_f5_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="date_f5" Format="yyyy/MM/dd">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_d5" 
                                    runat="server" ControlToValidate="date_f5" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label14" runat="server" Text="Counsellor - 5"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="DD_c5" runat="server" Height="22px" Width="185px" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username">
                                </asp:DropDownList>
                            
                            </td>
                            <td class="style1">
                            
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                &nbsp;
                                
                            </td>
                            <td>
                            
                                &nbsp;
                                
                            </td>
                            <td class="style1">
                            
                                &nbsp;
                                
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label10" runat="server" Text="Follow Up 6"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="f6" runat="server" Height="65px" TextMode="MultiLine"></asp:TextBox>
                            
                            </td>
                            <td class="style1">
                            
                                <asp:TextBox ID="date_f6" runat="server" Width="75px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="date_f6_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="date_f6" 
                                    WatermarkText="Select date">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="date_f6_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="date_f6" Format="yyyy/MM/dd">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_d6" 
                                    runat="server" ControlToValidate="date_f6" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label15" runat="server" Text="counsellor - 6"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="DD_c6" runat="server" Height="22px" Width="185px" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username">
                                </asp:DropDownList>
                            
                            </td>
                            <td class="style1">
                            
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                            
                                &nbsp;
                               
                             </td>
                             <td>
                            
                                 &nbsp;
                                 
                             </td>
                             <td class="style1">
                            
                                 &nbsp;
                                 
                             </td>
                        </tr>
                        <tr>
                            <td align="center">
                                
                                <asp:Button ID="update" runat="server" Text="Update" Width="103px" />
                                
                            </td>
                             <td align="center">
                            
                                 <asp:Button ID="delete" runat="server" Text="Delete" Width="103px" />
                            
                            </td>
                             <td class="style1">
                            
                                 <asp:Button ID="close_enq" runat="server" Text="Close Enq" />
                            
                            </td>
                        </tr>
                        
                    </table>
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
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
                        </div>
                    </div>
        
</asp:Content>


