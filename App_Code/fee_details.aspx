<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false"
    CodeFile="fee_details.aspx.vb" Inherits="fee_details" %>

<%@ Register Assembly="IdeaSparx.CoolControls.Web" Namespace="IdeaSparx.CoolControls.Web"
    TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
    <a href="home.aspx">
        <img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" style="margin: 0px 0px 0px 240px" /></a><br />
    <br />
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
        <%-- <ul>
                    <li><a href="Enquiry_list.aspx">List</a></li>
                    <li><a href="followup.aspx">Follow up</a></li>
                    <li><a href="newenquiry.aspx">New Enquiry</a></li>
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" /></a>
        --%>
        <p style="padding-top: 40px; text-align: center">
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
        <asp:Panel ID="Panel1" runat="server" BackColor="#3F2B91" Height="59px">
            <table>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text="Search By" ForeColor="White"></asp:Label>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:DropDownList ID="dd_selection" runat="server" ForeColor="Black">
                            <%-- <asp:ListItem>Admissions</asp:ListItem>
                                        <asp:ListItem>Partial Payment</asp:ListItem>
                                        <asp:ListItem>Lumpsum Payment</asp:ListItem>--%>
                            <asp:ListItem>Pending Fees</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:TextBox ID="startdate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="startdate_CalendarExtender" runat="server" Enabled="True"
                            Format="yyyy/MM/dd" TargetControlID="startdate">
                        </asp:CalendarExtender>
                        <asp:FilteredTextBoxExtender ID="startdate_FilteredTextBoxExtender" runat="server"
                            Enabled="True" TargetControlID="startdate" ValidChars="/1234567890">
                        </asp:FilteredTextBoxExtender>
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
            <cc1:CoolGridView ID="CoolGridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                DataKeyNames="mobileno_fee" DataSourceID="SqlDataSource_fee" Height="737px" Width="760px"
                AllowSorting="True" ShowFooter="True" EnableModelValidation="True">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="Serial No" InsertVisible="False">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="padding: 0 0 5px 0">
                                <asp:Label ID="Label3" Text="Page Total" runat="server" /></div>
                            <div>
                                <asp:Label ID="Label4" Text="Grand Total" runat="server" /></div>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="student_name" HeaderText="Student Name" SortExpression="student_name" />
                    <asp:BoundField DataField="course_enq" HeaderText="Course" SortExpression="course_enq" />
                    <asp:BoundField DataField="type_fee" HeaderText="Type Fee" SortExpression="type_fee" />
                    <asp:BoundField DataField="rem_fee" HeaderText="Remaining Fee" SortExpression="rem_fee" />
                    <asp:BoundField DataField="mobileno_fee" HeaderText="Mobile" ReadOnly="True" SortExpression="mobileno_fee" />
                    <asp:BoundField DataField="f_1" HeaderText="Follow Up 1" SortExpression="f_1" />
                    <asp:BoundField DataField="date_f_1" HeaderText="Date 1" SortExpression="date_f_1" />
                    <asp:BoundField DataField="due_date1" HeaderText="Due Date 1" SortExpression="due_date1" />
                    
                    <asp:BoundField DataField="councellor_f1" HeaderText="Counsellor 1" SortExpression="councellor_f1" />
                    <asp:BoundField DataField="f_2" HeaderText="Follow Up 2" SortExpression="f_2" />
                    <asp:BoundField DataField="date_f_2" HeaderText="Date 2" SortExpression="date_f_2" />
                      <asp:BoundField DataField="due_date2" HeaderText="Due Date 2" SortExpression="due_date2" />
                   
                    <asp:BoundField DataField="councellor_f2" HeaderText="Counsellor 2" SortExpression="councellor_f2" />
                    <asp:BoundField DataField="f_3" HeaderText="Follow Up 3" SortExpression="f_3" />
                    <asp:BoundField DataField="date_f_3" HeaderText="Date 3" SortExpression="date_f_3" />
                    <asp:BoundField DataField="councellor_f3" HeaderText="Counsellor 3" SortExpression="councellor_f3" />
                    <asp:BoundField DataField="remark" HeaderText="Remark" SortExpression="remark" />
                    <asp:TemplateField HeaderText="Defaulter">
                        <ItemTemplate>
                            <asp:CheckBox ID="defaulter" runat="server" Text="defaulter" Enabled="false" Checked='<%# Eval("defaulter")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <BoundaryStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            </cc1:CoolGridView>
            <asp:SqlDataSource ID="SqlDataSource_fee" runat="server" ConnectionString="<%$ ConnectionStrings:pt_enquiry %>">
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
