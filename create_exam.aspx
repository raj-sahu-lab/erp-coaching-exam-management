<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="create_exam.aspx.vb" Inherits="create_exam" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
                <%--<ul>
                    <li><a href="Enquiry_list.aspx">List</a></li>
                    <li><a href="followup.aspx">Follow up</a></li>
                    <li class="active">New Enquiry</li>
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" 
                    alt="Logo PT" border="0" /></a>--%>
            </div>
            
            <div id="bodyPanel">
                <div id="exam"; style="margin-left:130px">
                    <table>
                        <tr>
                            <td align="center" colspan="3">
                                Enter New Student Details
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label14" runat="server" Text="* Exam Date"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="exam_date" runat="server"></asp:TextBox>
                            
                                <asp:CalendarExtender ID="exam_date_CalendarExtender" runat="server" 
                                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="exam_date">
                                </asp:CalendarExtender>
                            
                            </td>
                            <td>
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_date" runat="server" 
                                    ControlToValidate="exam_date" ErrorMessage="Please Fill">Please Fill</asp:RequiredFieldValidator>
                            
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator_date_format" 
                                    runat="server" ControlToValidate="exam_date" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label4" runat="server" Text="* Positive Marks Per Question"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="positive_marks" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_positivemarks" 
                                    runat="server" ControlToValidate="positive_marks" 
                                    ErrorMessage="Enter Number only" 
                                    ValidationExpression="^(?=.*\d)\d*(?:\.\d\d)?$"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label3" runat="server" Text="* Negative Marks Per Question"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="negative_marks" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_negativemarks" 
                                    runat="server" ControlToValidate="negative_marks" 
                                    ErrorMessage="Enter Number only" 
                                    ValidationExpression="^(?=.*\d)\d*(?:\.\d\d)?$"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label5" runat="server" Text="* Total Marks In Exam"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="total_marks" runat="server"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_totalmarks" 
                                    runat="server" ControlToValidate="total_marks" ErrorMessage="Enter Number only" 
                                    ValidationExpression="^(?=.*\d)\d*(?:\.\d\d)?$"></asp:RegularExpressionValidator>
                             </td>
                        </tr>
                        <tr>
                            <td>
                            
                                &nbsp;</td>
                             <td>
                            
                            </td>
                             <td>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                
                                <asp:Button ID="add" runat="server" Text="Add" Width="103px" />
                                
                            </td>
                             <td align="center">
                            
                                 <asp:Button ID="reset" runat="server" Text="Reset" Width="103px" 
                                     CausesValidation="False" />
                            
                            </td>
                             <td>
                            
                                 <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                     Text="Exam Schema" />
                            
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


