<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="admin_fee_collect.aspx.vb" Inherits="admin_fee_collect" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
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
                    <a href="admin_exam_reg_del.aspx">Registration for Exam</a>
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
                    <li><a href="admin_user.aspx">Users</a></li>
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
                         <div id="fee"; style="margin-left:130px">
                    <table>
                        <tr>
                            <td align="center" colspan="3">
                               <b>Fee Details</b>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label15" runat="server" Text="Mobile No"></asp:Label>
                            
                            </td>
                            <td align="left" class="style3">
                            
                                <asp:TextBox ID="mobile_search" runat="server"></asp:TextBox>
                            
                            </td>
                            <td class="style2">
                            
                                <asp:Button ID="Search" runat="server" Text="Search" CausesValidation="False" />
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label1" runat="server" Text="Student Name"></asp:Label>
                            
                            </td>
                            <td align="left" class="style3">
                            
                                <asp:TextBox ID="student_name" runat="server"></asp:TextBox>
                            
                            </td>
                            <td class="style2">
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_st_name" runat="server" 
                                    ControlToValidate="student_name" ErrorMessage="Please Fill" Width="74px">Please Fill</asp:RequiredFieldValidator>
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                            
                            </td>
                            <td class="style3">
                            
                                <asp:RadioButton ID="rb_male" runat="server" GroupName="g1" Text="Male" 
                                    Checked="True" />
                                <asp:RadioButton ID="rb_female" runat="server" GroupName="g1" Text="Female" />
                            
                            </td>
                            <td class="style2">
                            
                                &nbsp;</td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label9" runat="server" Text="Mobile No"></asp:Label>
                            
                            </td>
                            <td class="style3">
                            
                                <asp:TextBox ID="mobile" runat="server" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
                            
                            </td>
                            <td class="style2">
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_mobile" runat="server" 
                                    ControlToValidate="mobile" ErrorMessage="Please Fill" Width="70px">Please fill</asp:RequiredFieldValidator>
                            
                                <br />
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" 
                                    runat="server" ControlToValidate="mobile" ErrorMessage="Enter Valid No." 
                                    ValidationExpression="^[0-9]{10}$" Width="98px">Enter Valid No.</asp:RegularExpressionValidator>
                                <br />
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label7" runat="server" Text="Course"></asp:Label>
                            
                            </td>
                            <td class="style3">
                            
                                <asp:DropDownList ID="dd_course" runat="server" Height="22px" Width="148px" 
                                    DataSourceID="sql_pt_enquiry" DataTextField="course_name" 
                                    DataValueField="course_id">
                                
                                </asp:DropDownList>
                            
                                <asp:SqlDataSource ID="sql_pt_enquiry" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                    SelectCommand="SELECT [course_id], [course_name] FROM [course_details]">
                                </asp:SqlDataSource>
                            
                            </td>
                            <td class="style2">
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label27" runat="server" Text="* Type"></asp:Label>
                            
                            </td>
                            <td class="style3">
                            
                                <asp:DropDownList ID="dd_pay_type" runat="server" Height="22px" Width="148px" 
                                    AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Token + Part Payment</asp:ListItem>
                                    <asp:ListItem>No Token + Part Payment</asp:ListItem>
                                    <asp:ListItem>Token + Lumpsum Payment</asp:ListItem>
                                    <asp:ListItem>No Token + Lumpsum Payment</asp:ListItem>
                                </asp:DropDownList>
                            
                            </td>
                            <td class="style2">
                            
                                &nbsp;</td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label35" runat="server" Text="Status"></asp:Label>
                            
                            </td>
                            <td class="style3">
                            
                                <asp:DropDownList ID="dd_status" runat="server" Width="148px">
                                    <asp:ListItem>Not Registered</asp:ListItem>
                                    <asp:ListItem>Registered</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                </asp:DropDownList>
                            
                            </td>
                            <td class="style2">
                            
                                &nbsp;</td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label8" runat="server" Text="* Course Fee"></asp:Label>
                            
                            </td>
                            <td class="style3">
                            
                                <asp:TextBox ID="course_fee" runat="server"></asp:TextBox>
                            
                            </td>
                            <td class="style2">
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_coursefee" 
                                    runat="server" ControlToValidate="course_fee" ErrorMessage="Please Fill"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator_coursefee" runat="server" 
                                    ControlToValidate="course_fee" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                             </td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                <asp:Label ID="Label23" runat="server" Text="Remaining Fee"></asp:Label>
                            
                            </td>
                            <td class="style3">
                                
                                <asp:TextBox ID="rem_fee" runat="server" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
                            
                            </td>
                            <td class="style2">
                           
                            </td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                                &nbsp; 
                            </td>
                            <td class="style3">
                                &nbsp;
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:Label ID="Label11" runat="server" Text="Remark"></asp:Label>
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="remark" runat="server" TextMode="MultiLine" Width="146px"></asp:TextBox>
                            </td>
                            <td class="style2">
                                &nbsp;    
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                &nbsp;
                            </td>
                            <td class="style3">
                                &nbsp;
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style1">
                                <asp:Button ID="make_payment" runat="server" Text="Make Payment" 
                                    Width="103px" />
                            </td>
                             <td align="center" class="style3">
                                <asp:Button ID="reset" runat="server" Text="Reset" Width="103px" CausesValidation="False" />           
                            </td>
                             <td class="style2">
                            
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


