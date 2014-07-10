<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="chead_fee_collect_token_pay.aspx.vb" Inherits="chead_fee_collect_token_pay" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
                <%
                    Dim chead_nm As String
                    Try
                        chead_nm = Session.Item("chead_uname").ToString
                        Session.Add("chead_uname", chead_nm)
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
        <li><a href="chead_home.aspx">Home</a></li>
        <li>Update Enquiry
                <div class="column">
                    <b>UPDATE ENQUIRY</b>
                    <a href="chead_update.aspx">Update Enquiry</a>
                    <a href="chead_followup.aspx">Follow Up</a>
                    <a href="chead_Enquiry_list.aspx">Enquiry List</a>
                </div>
        </li>
        <li>Fee Details
                <div class="column">
                    <b>GET FEE DETAILS</b>
                    <div>
                        <a href="chead_fee_collect.aspx">Fee Collect</a>
                        <a href="chead_fee_followup.aspx">Fee Follow Up</a>
                        <a href="chead_fee_details.aspx">Fee Due</a>
                    </div>
                </div>
        </li>
        <li>Scholorship
                <div class="column">
                    <b>SCHOLORSHIP DETAILS</b>
                    <a href="chead_create_exam.aspx">Create Exam</a>
                    <a href="chead_exam_reg.aspx">Registeration for Exam</a>
                    <a href="chead_test_details.aspx">Scholorship Earned</a>
                </div>
        </li>
        <li><a href="chead_user.aspx">User Manage</a></li>
        <li><a href="chead_master_set.aspx">Master Entry</a></li>
        <li><a href="logout.aspx">Logout</a></li>
    </ul>
</nav> 
            <div id="topPanel2">
                <%--<ul>
                    <li><a href="chead_master_set.aspx">Master</a></li>
                    <li><a href="chead_user.aspx">Users</a></li>
                    <li><a href="chead_Enquiry_list.aspx">List</a></li>
                    <li><a href="chead_followup.aspx">Follow up</a></li>
                    <li><a href="chead_update.aspx">Update Data</a></li>
                    <li><a href="chead_home.aspx">Home</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" /></a>--%>
            
                     <p style="padding-top:60px; text-align:center " >
                     <%
                         Try
                             chead_nm = Session.Item("chead_uname").ToString
                             Response.Write("<h3><center>Welcome<b> " & chead_nm & " </b></center></h3>")
                             Session.Add("chead_uname", chead_nm)
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
                               <b>Token And Installments</b>
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
                            
                                <asp:Label ID="Label15" runat="server" Text="* Token Amount"></asp:Label>
                            
                            </td>
                            <td align="left">
                            
                                <asp:TextBox ID="token_amount" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_tokenamt" runat="server" 
                                    ControlToValidate="token_amount" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label1" runat="server" Text="* Token Date"></asp:Label>
                            
                            </td>
                            <td align="left">
                            
                                <asp:TextBox ID="token_date" runat="server" Width="75px"></asp:TextBox>
                            
                                <asp:CalendarExtender ID="token_date_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="token_date">
                                </asp:CalendarExtender>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_tokendate" 
                                    runat="server" ControlToValidate="token_date" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                                </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label2" runat="server" Text="Token counsellor"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:DropDownList ID="dd_token_councellor" runat="server" Height="22px" Width="148px" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username">
                                </asp:DropDownList>
                            
                                <asp:SqlDataSource ID="Sql_councellor" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                    SelectCommand="SELECT [username] FROM [user_login]"></asp:SqlDataSource>
                            
                            </td>
                            <td>
                            
                                &nbsp;</td>
                        </tr>
                         <tr>
                            <td align="left" class="style1">
                            
                                &nbsp;
                            </td>
                            <td>
                            
                                &nbsp;
                            
                            </td>
                            <td>
                            
                                <br />
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label36" runat="server" Text="* Installlment 1"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="inst1" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_inst1" runat="server" 
                                    ControlToValidate="inst1" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label27" runat="server" Text="* Due Date 1"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="due_date1" runat="server" Height="22px" Width="75px"></asp:TextBox>
                            
                                <asp:CalendarExtender ID="due_date1_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="due_date1">
                                </asp:CalendarExtender>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_dd1" 
                                    runat="server" ControlToValidate="due_date1" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                                </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label35" runat="server" Text="Amount Paid 1"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="paid1" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_paid1" runat="server" 
                                    ControlToValidate="paid1" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                             </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label8" runat="server" Text="Pay Date 1"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="pay_date1" runat="server" Height="22px" Width="75px"></asp:TextBox>
                            
                                <asp:CalendarExtender ID="pay_date1_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="pay_date1">
                                </asp:CalendarExtender>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_paydate1" 
                                    runat="server" ControlToValidate="pay_date1" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                                </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label37" runat="server" Text="counsellor 1"></asp:Label>
                            
                            </td>
                            <td>
                                
                                <asp:DropDownList ID="dd_councellor1" runat="server" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username" Height="22px" Width="148px">
                                </asp:DropDownList>
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
                            <td>
                                <asp:Label ID="Label38" runat="server" Text="* Installment 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="inst2" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_inst2" runat="server" 
                                    ControlToValidate="inst2" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label39" runat="server" Text="* Due Date 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="due_date2" runat="server" Height="22px" Width="75px"></asp:TextBox>
                                <asp:CalendarExtender ID="due_date2_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="due_date2">
                                </asp:CalendarExtender>
                            </td>
                            <td class="style2">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_dd2" 
                                    runat="server" ControlToValidate="due_date2" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label40" runat="server" Text="Amount Paid 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="paid2" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_paid2" runat="server" 
                                    ControlToValidate="paid2" ErrorMessage="Enter Valid Amt." 
                                    ValidationExpression="^[0-9]\d+$" EnableViewState="False"></asp:RegularExpressionValidator>
                             </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label41" runat="server" Text="Pay Date 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="pay_date2" runat="server" Height="22px" Width="75px"></asp:TextBox>
                                <asp:CalendarExtender ID="pay_date2_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="pay_date2">
                                </asp:CalendarExtender>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_paydate2" 
                                    runat="server" ControlToValidate="pay_date2" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label42" runat="server" Text="counsellor 2"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="dd_councellor2" runat="server" 
                                    DataSourceID="Sql_councellor" DataTextField="username" 
                                    DataValueField="username" Height="22px" Width="148px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
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
        
</asp:Content>


