<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false"
    CodeFile="test_detail.aspx.vb" Inherits="test_detail" %>

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
    %><%
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
                    <li class="active">New Enquiry</li>
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" 
                    alt="Logo PT" border="0" /></a>--%>
        <p style="padding-top: 40px; text-align: center">
            <%
                Try
                    nm = Session.Item("uname").ToString
                    Response.Write("<h3><center>Welcome<b> " & nm & " </b></center></h3>")
                    Session.Add("uname", nm)
            %>            <%
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
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text="Search By" ForeColor="White"></asp:Label>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp<asp:DropDownList ID="dd_selection_date" runat="server" DataSourceID="SqlDataSource_test"
                            DataTextField="Date" DataValueField="Examid">
                        </asp:DropDownList>
                    </td>
                    <td align="center">
                        &nbsp;&nbsp&nbsp;&nbsp
                    </td>
                    <td align="center">
                        &nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="search_grid" runat="server" Text="Search" />
                    </td>
                    <td align="center">
                        &nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="enq_create" runat="server" 
                            Text="Create Enq" />
                    </td>
                </tr>
            </table>
            <cc1:CoolGridView ID="CoolGridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                DataSourceID="SqlDataSource_students_test" Height="737px" Width="760px" AllowSorting="True"
                EnableModelValidation="True" DataKeyNames="Mobile">
                <Columns>
                    <asp:TemplateField HeaderText="Serial No" InsertVisible="False">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" ReadOnly="True" SortExpression="Mobile" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" SortExpression="ExamDate"
                        DataFormatString="{0:yyyy/MM/dd}" />
                    <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                    <asp:BoundField DataField="College" HeaderText="College" SortExpression="college" />
                    <asp:BoundField DataField="Yearsem" HeaderText="Year-Sem" SortExpression="Yearsem" />
                    <asp:BoundField DataField="branch" HeaderText="Branch" SortExpression="branch" />
                    <asp:BoundField DataField="CourseTarget" HeaderText="Course Target" SortExpression="CourseTarget" />
                    <asp:BoundField DataField="Waiver" HeaderText="Waiver" SortExpression="Waiver" />
                    <asp:TemplateField HeaderText="Create Enq">
                        <ItemTemplate>
                            <asp:CheckBox ID="enquiry" runat="server" Text="Create Enquiry" Checked='<%# Eval("EnquiryCreated").ToString().Equals("Enquiry Exists") %>' Enabled='<%# Eval("EnquiryCreated").ToString().Equals("Enquiry Not Exists")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <BoundaryStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            </cc1:CoolGridView>
            <asp:SqlDataSource ID="SqlDataSource_students_test" runat="server" ConnectionString="<%$ ConnectionStrings:pt_enquiry %>">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_test" runat="server" ConnectionString="<%$ ConnectionStrings:pt_enquiry %>"
                SelectCommand="SELECT convert(varchar,[ExamDate],111) As Date, [Examid] FROM [ExamMaster]">
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
