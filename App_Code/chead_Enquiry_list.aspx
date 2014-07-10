<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false"
    CodeFile="chead_Enquiry_list.aspx.vb" Inherits="chead_Enquiry_list" %>

<%@ Register Assembly="IdeaSparx.CoolControls.Web" Namespace="IdeaSparx.CoolControls.Web"
    TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
    <a href="home.aspx">
        <img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" style="margin: 0px 0px 0px 240px" /></a><br />
    <br />
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
        <%--   <ul>
                    <li><a href="chead_master_set.aspx">Master</a></li>
                    <li><a href="chead_user.aspx">Users</a></li>
                    <li class="active">List</li>
                    <li><a href="chead_followup.aspx">Follow up</a></li>
                    <li><a href="chead_update.aspx">Update Data</a></li>
                    <li><a href="chead_home.aspx">Home</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" /></a>--%>
        <p style="padding-top: 60px; text-align: center">
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
        <asp:Panel ID="Panel2" runat="server" BackColor="#3F2B91" Height="59px">
            <table>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text="Search By" ForeColor="White"></asp:Label>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:DropDownList ID="dd_selection" runat="server" ForeColor="Black">
                            <asp:ListItem>Enquiry</asp:ListItem>
                            <asp:ListItem>Registered</asp:ListItem>
                            <asp:ListItem>Not Registered</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:TextBox ID="startdate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="startdate_CalendarExtender" runat="server" Enabled="True"
                            Format="yyyy/MM/dd" TargetControlID="startdate">
                        </asp:CalendarExtender>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:Label ID="Label2" runat="server" Text="To" ForeColor="White"></asp:Label>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:TextBox ID="enddate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" Enabled="True"
                            Format="yyyy/MM/dd" TargetControlID="enddate">
                        </asp:CalendarExtender>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:Button ID="search_grid" runat="server" Text="Search" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_startdate" runat="server"
                            ControlToValidate="startdate" ErrorMessage="Enter Valid Date" ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])"
                            Width="108px"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="startdate" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_d2" runat="server"
                            ControlToValidate="enddate" ErrorMessage="Enter Valid Date" ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])"
                            Width="108px"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="enddate" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Height="737px">
            <cc1:CoolGridView ID="CoolGridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
                CellSpacing="1" DataKeyNames="mobile" DataSourceID="SqlDataSource_enquiry" Height="737px"
                Width="760px">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Serial No" InsertVisible="False">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="student_name" HeaderText="Student Name" SortExpression="student_name" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                    <asp:BoundField DataField="enq" HeaderText="Enquiry Date" DataFormatString="{0:yyyy/MM/dd}"
                        SortExpression="enq" />
                    <asp:BoundField DataField="course_enq" HeaderText="Course" SortExpression="course_enq" />
                    <asp:BoundField DataField="mobile" HeaderText="Mobile No" ReadOnly="True" SortExpression="mobile" />
                    <asp:BoundField DataField="status_enq" HeaderText="Status" SortExpression="status_enq" />
                    <asp:BoundField DataField="councellor_name" HeaderText="Enq Councellor" SortExpression="councellor_name" />
                    <asp:BoundField DataField="f_1" HeaderText="Follow Up 1" SortExpression="f_1" />
                    <asp:BoundField DataField="date_f_1" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date 1"
                        SortExpression="date_f_1" />
                    <asp:BoundField DataField="councellor_f1" HeaderText="counsellor 1" SortExpression="councellor_f1" />
                    <asp:BoundField DataField="f_2" HeaderText="Follow Up 2" SortExpression="f_2" />
                    <asp:BoundField DataField="date_f_2" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date 2"
                        SortExpression="date_f_2" />
                    <asp:BoundField DataField="councellor_f2" HeaderText="counsellor 2" SortExpression="councellor_f2" />
                    <asp:BoundField DataField="f_3" HeaderText="Follow Up 3" SortExpression="f_3" />
                    <asp:BoundField DataField="date_f_3" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date 3"
                        SortExpression="date_f_3" />
                    <asp:BoundField DataField="councellor_f3" HeaderText="counsellor 3" SortExpression="councellor_f3" />
                    <asp:BoundField DataField="f_4" HeaderText="Follow Up 4" SortExpression="f_4" />
                    <asp:BoundField DataField="date_f_4" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date 4"
                        SortExpression="date_f_4" />
                    <asp:BoundField DataField="councellor_f4" HeaderText="counsellor 4" SortExpression="councellor_f4" />
                    <asp:BoundField DataField="f_5" HeaderText="Follow Up 5" SortExpression="f_5" />
                    <asp:BoundField DataField="date_f_5" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date 5"
                        SortExpression="date_f_5" />
                    <asp:BoundField DataField="councellor_f5" HeaderText="counsellor 5" SortExpression="councellor_f5" />
                    <asp:BoundField DataField="f_6" HeaderText="Follow Up 6" SortExpression="f_6" />
                    <asp:BoundField DataField="date_f_6" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date 6"
                        SortExpression="date_f_6" />
                    <asp:BoundField DataField="councellor_f6" HeaderText="counsellor 6" SortExpression="councellor_f6" />
                </Columns>
                <BoundaryStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            </cc1:CoolGridView>
            <asp:SqlDataSource ID="SqlDataSource_enquiry" runat="server" ConnectionString="<%$ ConnectionStrings:pt_enquiry %>">
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
    <div id="footerPanel">
        <div id="footerbodyPanel">
            <ul>
                <li><a href="default.aspx">Login</a>| </li>
                <li><a href="logout.aspx">Logout</a>| </li>
                <li><a href="http://www.[CompanyName].com/Raipur-innauguration.asp">Pt Raipur</a>|
                </li>
                <li><a href="http://www.[CompanyName].com/default.aspx">Pt Website</a>| </li>
            </ul>
            <p class="copyright">
                ©[Company Name] all right reaserved</p>
            <ul class="templateworld">
                <li>Design By:</li>
                <li><a href="http://www.sicservices.co.in" target="_blank">S.I.C. services</a></li>
            </ul>
            <div id="footerhtmlPanel">
                <a href="http://www.[CompanyName].com" target="_blank">Owner</a></div>
            <div id="footercssPanel">
                <a href="http://www.godaddy.com" target="_blank">Host</a></div>
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
        </div>
    </div>
</asp:Content>
