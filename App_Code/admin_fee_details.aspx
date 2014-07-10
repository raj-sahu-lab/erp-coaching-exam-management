<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="admin_fee_details.aspx.vb" Inherits="admin_fee_details" %>

<%@ Register assembly="IdeaSparx.CoolControls.Web" namespace="IdeaSparx.CoolControls.Web" tagprefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc2" %>


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
                    <asp:Panel ID="Panel1" runat="server" BackColor="#3F2B91" Height="59px">
                        <table>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Label1" runat="server" Text="Search By" ForeColor="White"></asp:Label>
                                </td>
                                <td align="center">
                                    &nbsp;&nbsp&nbsp;&nbsp<asp:DropDownList ID="dd_selection" runat="server" 
                                        ForeColor="Black">
                                        <%--<asp:ListItem>Admissions</asp:ListItem>
                                        <asp:ListItem>Partial Payment</asp:ListItem>
                                        <asp:ListItem>Lumpsum Payment</asp:ListItem>--%>
                                        <asp:ListItem>Pending Fees</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td align="center">
                                    &nbsp;&nbsp&nbsp;&nbsp<asp:TextBox ID="startdate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="startdate_CalendarExtender" runat="server" 
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="startdate">
                                    </asp:CalendarExtender>
                                </td>
                                <td align="center">
                                    &nbsp;&nbsp&nbsp;&nbsp<asp:Label ID="Label2" runat="server" Text="To" 
                                        ForeColor="White"></asp:Label>
                                </td>
                                <td align="center">
                                    &nbsp;&nbsp&nbsp;&nbsp<asp:TextBox ID="enddate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" 
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="enddate">
                                    </asp:CalendarExtender>
                                </td>
                                <td align="center">
                                     &nbsp;&nbsp&nbsp;&nbsp<asp:Button ID="search_grid" runat="server" 
                                     Text="Search" />
                                </td>
                                <td align="center" style="margin-left: 40px">
                                    &nbsp;&nbsp&nbsp;&nbsp<asp:Button ID="defaulter" runat="server" 
                                    Text="Update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                
                                </td>
                                <td>
                                
                                </td>
                                <td>
                                
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_startdate" 
                                        runat="server" ControlToValidate="startdate" ErrorMessage="Enter Valid Date" 
                                        ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                        Width="108px"></asp:RegularExpressionValidator>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="startdate" ErrorMessage="*"></asp:RequiredFieldValidator>
                                
                                </td>                            
                                 <td>
                                
                                </td>                           
                                <td>
                                
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_d2" 
                                        runat="server" ControlToValidate="enddate" ErrorMessage="Enter Valid Date" 
                                        ValidationExpression="(19|20|21)\d\d[\/-](0[1-9]|1[012])[\/-](0[1-9]|[12][0-9]|3[01])" 
                                        Width="108px"></asp:RegularExpressionValidator>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="enddate" ErrorMessage="*"></asp:RequiredFieldValidator>
                                
                                </td>                            
                                <td>
                                
                                </td>   
                                <td>
                                
                                </td>                          
                            </tr>
                        </table>  
                        <cc1:CoolGridView ID="CoolGridView2" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                            CellPadding="3" CellSpacing="1" DataKeyNames="mobileno_fee" 
                            DataSourceID="SqlDataSource_fee" Height="737px" Width="760px" 
                            AllowSorting="True" EnableModelValidation="True">
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
                                </asp:TemplateField>
                                <asp:BoundField DataField="student_name" HeaderText="Student Name" 
                                    SortExpression="student_name" />
                                <asp:BoundField DataField="course_enq" HeaderText="Course" 
                                    SortExpression="course_enq" />
                                <asp:BoundField DataField="type_fee" HeaderText="Type Fee" 
                                    SortExpression="type_fee" />
                                <asp:BoundField DataField="rem_fee" HeaderText="Remaining Fee" 
                                    SortExpression="rem_fee" />
                                <asp:BoundField DataField="mobileno_fee" HeaderText="Mobile" ReadOnly="True" 
                                    SortExpression="mobileno_fee" />
                                <asp:BoundField DataField="f_1" HeaderText="Follow Up 1" SortExpression="f_1" />
                                <asp:BoundField DataField="date_f_1" HeaderText="Date 1" 
                                    SortExpression="date_f_1" />
                                <asp:BoundField DataField="councellor_f1" HeaderText="Counsellor 1" 
                                    SortExpression="councellor_f1" />
                                <asp:BoundField DataField="f_2" HeaderText="Follow Up 2" SortExpression="f_2" />
                                <asp:BoundField DataField="date_f_2" HeaderText="Date 2" 
                                    SortExpression="date_f_2" />
                                <asp:BoundField DataField="councellor_f2" HeaderText="Counsellor 2" 
                                    SortExpression="councellor_f2" />
                                <asp:BoundField DataField="f_3" HeaderText="Follow Up 3" SortExpression="f_3" />
                                <asp:BoundField DataField="date_f_3" HeaderText="Date 3" 
                                    SortExpression="date_f_3" />
                                <asp:BoundField DataField="councellor_f3" HeaderText="Counsellor 3" 
                                    SortExpression="councellor_f3" />
                                <asp:BoundField DataField="remark" HeaderText="Remark" 
                                    SortExpression="remark" />
                                <asp:TemplateField HeaderText="Defaulter">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="defaulter" runat="server" Text="defaulter" Checked='<%# Eval("defaulter")%>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <BoundaryStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        </cc1:CoolGridView>
                        <asp:SqlDataSource ID="SqlDataSource_fee" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:pt_enquiry %>"></asp:SqlDataSource>
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


