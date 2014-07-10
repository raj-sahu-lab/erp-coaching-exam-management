<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="fee_collect_notoken_lumpsum.aspx.vb" Inherits="fee_collect_notoken_lumpsum" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
                <%
                     Dim nm As String
                     Try
                         nm = Session.Item("uname").ToString
                         Session.Add("uname", nm)
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
        <li><a href="home.aspx">Home</a></li>
        <li>New Enquiry
                <div class="column">
                    <b>START A NEW ENQUIRY</b>
                    <a href="newEnquiry.aspx">New Enquiry</a>
                    <a href="followup.aspx">Follow Up</a>
                    <a href="Enquiry_list.aspx">Enquiry List</a>
                </div>
        </li>
        <li>Fee Details
                <div class="column">
                    <b>GET FEE DETAILS</b>
                    <div>
                        <a href="fee_collect.aspx">Fee Collect</a>
                        <a href="fee_followup.aspx">Fee Follow Up</a>
                        <a href="fee_details.aspx">Fee Due</a>
                    </div>
                </div>
        </li>
        <li>Scholorship
                <div class="column">
                    <b>SCHOLORSHIP DETAILS</b>
                    <a href="create_exam.aspx">Create Exam</a>
                    <a href="exam_reg.aspx">Registeration for Exam</a>
                    <a href="test_detail.aspx">Scholorship Earned</a>
                </div>
        </li>
        <li><a href="logout.aspx">Logout</a></li>
    </ul>
</nav>
   <div id="topPanel2">
<%--                <ul>
                    <li><a href="Enquiry_list.aspx">List</a></li>
                    <li><a href="followup.aspx">Follow up</a></li>
                    <li><a href="newenquiry.aspx">New Enquiry</a></li>
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" /></a>--%>
            
                    <p style="padding-top:40px; text-align:center " >
                     <%
                         Try
                             nm = Session.Item("uname").ToString
                             Response.Write("<h3><center>Welcome<b> " & nm & " </b></center></h3>")
                             Session.Add("uname", nm)
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
                               <b>Only Lumpsum</b>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label9" runat="server" Text="Mobile No"></asp:Label>
                            
                            </td>
                            <td align="left">
                            
                                <asp:TextBox ID="mobile" runat="server" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                &nbsp;</td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label36" runat="server" Text="* Lumpsum Amount"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="lumpsum_amount" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_lumpsumamt" runat="server" 
                                    ControlToValidate="lumpsum_amount" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label27" runat="server" Text="* Due Date"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="due_date_lumpsum" runat="server" Height="22px" Width="75px"></asp:TextBox>
                            
                                <asp:CalendarExtender ID="due_date_lumpsum_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="due_date_lumpsum">
                                </asp:CalendarExtender>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_duedate" 
                                    runat="server" ControlToValidate="due_date_lumpsum" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                                </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label35" runat="server" Text="Amount Paid"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="paid_lumpsum" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_paidlumpsum" runat="server" 
                                    ControlToValidate="paid_lumpsum" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                             </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label8" runat="server" Text="Pay Date"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="pay_date_lumpsum" runat="server" Height="22px" Width="75px"></asp:TextBox>
                            
                                <asp:CalendarExtender ID="pay_date_lumpsum_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="pay_date_lumpsum">
                                </asp:CalendarExtender>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_paydate" 
                                    runat="server" ControlToValidate="pay_date_lumpsum" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                                </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label37" runat="server" Text="Counsellor"></asp:Label>
                            
                            </td>
                            <td>
                                
                                <asp:DropDownList ID="dd_councellor_lumpsum" runat="server" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username" Height="22px" Width="148px">
                                </asp:DropDownList>
                            
                                <asp:SqlDataSource ID="Sql_councellor" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                    SelectCommand="SELECT [username] FROM [user_login]"></asp:SqlDataSource>
                            
                             </td>
                            <td>
                           
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                                &nbsp;&nbsp; 
                            </td>
                            <td>
                                &nbsp;&nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Button ID="pay" runat="server" Text="Pay" 
                                    Width="103px" />
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


