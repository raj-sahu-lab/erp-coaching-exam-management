<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="chead_master_set.aspx.vb" Inherits="chead_master_set" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
                <%--   <ul>
                    <li class="active">Master</li>
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
	                    <div id="master"  style="margin-left:130px; margin-top:100px">
                            <asp:Panel ID="Panel1" runat="server" Height="544px">
                            <table>
                            <tr>
                                <td align="center" colspan="3">
                                    Update Colleges
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label3" runat="server" Text="College Name"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_college" runat="server" Height="22px" Width="148px" 
                                        DataSourceID="college_master" DataTextField="college_name" 
                                        DataValueField="college_id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="college_master" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        SelectCommand="SELECT [college_id], [college_name] FROM [m_college] ORDER BY [college_name]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                            
                                    <asp:Button ID="delete_college" runat="server" Text="Delete" Height="26px" 
                                        Width="55px" />
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label7" runat="server" Text="Add College"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="college_name" runat="server"></asp:TextBox>
                                </td>
                                <td align="left">
                                    <asp:Button ID="add_college" runat="server" Text="Add" Width="55px" 
                                        Height="26px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;                          
                                </td>
                            </tr>
                            <tr>
                                <td align="center"; colspan="3">
                                    Update Degree 
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    
                                    <asp:Label ID="Label4" runat="server" Text="Degree Name"></asp:Label>
                                    
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_degree" runat="server" Height="22px" 
                                        Width="148px" DataSourceID="degree_master" DataTextField="degree_name" 
                                        DataValueField="degree_id">
                                    </asp:DropDownList>
                            
                                    <asp:SqlDataSource ID="degree_master" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        SelectCommand="SELECT [degree_id], [degree_name] FROM [m_degree] ORDER BY [degree_name]">
                                    </asp:SqlDataSource>
                            
                                </td>
                                <td>
                            
                                    <asp:Button ID="delete_degree" runat="server" Text="Delete" Width="55px" 
                                        Height="26px" />
                            
                                </td>
                            </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label8" runat="server" Text="Add Degree"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="degree_name" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="add_degree" runat="server" Height="26px" Text="Add" 
                                            Width="55px" />
                                    </td>
                                </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;
                                </td>

                            </tr>
                            <tr>
                                <td  align="center"; colspan="3">
                                    Update Branch
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label5" runat="server" Text="Branch Name"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_branch" runat="server" Height="22px" 
                                        Width="148px" DataSourceID="branch_master" DataTextField="branch_name" 
                                        DataValueField="branch_id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="branch_master" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        SelectCommand="SELECT [branch_name], [branch_id] FROM [m_branch] ORDER BY [branch_name]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                            
                                    <asp:Button ID="delete_branch" runat="server" Text="Delete" Height="26px" 
                                        Width="55px" />
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label6" runat="server" Text="Add Branch"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="branch_name" runat="server"></asp:TextBox>
                                </td>
                                <td>
                            
                                    <asp:Button ID="add_branch" runat="server" Height="26px" Text="Add" 
                                        Width="55px" />
                            
                                </td>
                            </tr>
                                                        <tr>
                                <td  align="center"; colspan="3">
                                    Edit&nbsp;Courses
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label1" runat="server" Text="Course Name"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_course" runat="server" Height="22px" 
                                        Width="148px" DataSourceID="sql_pt_enquiry" DataTextField="course_name" 
                                        DataValueField="course_id" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sql_pt_enquiry" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        SelectCommand="SELECT [course_id], [course_name] FROM [course_details]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                            
                                    <asp:Button ID="delete_course" runat="server" Text="Delete" />
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label2" runat="server" Text="Add Course"></asp:Label>
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="course_name" runat="server"></asp:TextBox>
                                </td>
                                <td>
                            
                                    <asp:Button ID="add_course" runat="server" Height="26px" Text="Add" 
                                        Width="55px" />
                            
                                </td>
                            </tr>
                        </table>
                            </asp:Panel> 
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
                        </div>
                    </div>
        
</asp:Content>


