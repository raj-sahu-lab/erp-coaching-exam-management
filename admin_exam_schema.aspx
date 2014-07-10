<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="admin_exam_schema.aspx.vb" Inherits="admin_exam_schema" %>

<%@ Register assembly="IdeaSparx.CoolControls.Web" namespace="IdeaSparx.CoolControls.Web" tagprefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <asp:Panel ID="Panel4" runat="server" BackColor="#3F2B91" Height="30px">
                        <table>
                            <tr>
                                <td align="center" class="style1">
                                    <asp:Label ID="Label1" runat="server" 
                                        Text="Details Of The Exam Conducted On Various Dates" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                        </table>  
                        <cc1:CoolGridView ID="CoolGridView2" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                            CellPadding="3" CellSpacing="1" 
                            DataSourceID="test_schema" Height="737px" Width="760px" 
                            AllowSorting="True" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" DataFormatString="{0:yyyy/MM/dd}"
                                    SortExpression="ExamDate" />
                                <asp:BoundField DataField="NegativeMarks" HeaderText="Negative Marks" 
                                    SortExpression="NegativeMarks" />
                                <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" 
                                    SortExpression="TotalMarks" />
                                <asp:BoundField DataField="PositiveMarks" HeaderText="Positive Marks" 
                                    SortExpression="PositiveMarks" />
                            </Columns>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <BoundaryStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        </cc1:CoolGridView>
                        <asp:SqlDataSource ID="test_schema" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                            
                            
                            SelectCommand="SELECT [ExamDate], [NegativeMarks], [TotalMarks], [PositiveMarks] FROM [ExamMaster]">
                        </asp:SqlDataSource>
                    </asp:Panel>
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

