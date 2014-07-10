<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="chead_update.aspx.vb" Inherits="chead_update" %>

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
<%--                <ul>
                    <li><a href="chead_master_set.aspx">Master</a></li>
                    <li><a href="chead_user.aspx">Users</a></li>
                    <li><a href="chead_Enquiry_list.aspx">List</a></li>
                    <li><a href="chead_followup.aspx">Follow up</a></li>
                    <li class="active">Update Data</li>
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
	                  <div id="testimonial"; style="margin-left:130px">
	                    <table>
                            <tr>
                                <td align="center" colspan="3">
                                Update Student Details
                                </td>
                            </tr>
                            <tr>
                            <td>
                            
                                <asp:Label ID="Label14" runat="server" Text="Mobile No"></asp:Label>
                            
                            </td>
                            
                            <td>
                            
                                <asp:TextBox ID="mobile_search" runat="server"></asp:TextBox>
                            
                            </td>
                            
                            <td>
                            
                                <asp:Button ID="Search" runat="server" Text="Search" CausesValidation="False" />
                            
                            </td>
                        </tr>                      
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label1" runat="server" Text="* Student Name"></asp:Label>
                            
                                </td>
                                <td align="left">
                            
                                    <asp:TextBox ID="student_name" runat="server"></asp:TextBox>
                            
                                </td>
                                <td>
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_st_name" runat="server" 
                                    ControlToValidate="student_name" ErrorMessage="Please Fill" Width="74px">Please Fill</asp:RequiredFieldValidator>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:RadioButton ID="Rb_male" runat="server" GroupName="g1" Text="Male" />
                                    <asp:RadioButton ID="Rb_female" runat="server" GroupName="g1" Text="Female" />
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                            <td align="left">
                            
                                <asp:Label ID="Label15" runat="server" Text="* Date"></asp:Label>
                            
                            </td>
                            <td>
                            
                                <asp:TextBox ID="enq" runat="server"></asp:TextBox>
                            
                                <asp:CalendarExtender ID="enq_CalendarExtender" runat="server" Enabled="True" 
                                    Format="yyyy/MM/dd" TargetControlID="enq">
                                </asp:CalendarExtender>
                            </td>
                            <td>
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_date" runat="server" 
                                    ControlToValidate="enq" ErrorMessage="Please Fill">Please Fill</asp:RequiredFieldValidator>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_date_format" 
                                    runat="server" ControlToValidate="enq" ErrorMessage="Enter Valid Date" 
                                    ValidationExpression="(19|20|21)\d\d[\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[01])" 
                                    Width="108px"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label4" runat="server" Text="Degree"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_degree" runat="server" DataSourceID="degree_master" 
                                        DataTextField="degree_name" DataValueField="degree_id" Height="22px" 
                                        Width="148px">
                                    </asp:DropDownList>
                            
                                    <asp:SqlDataSource ID="degree_master" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        
                                        
                                        SelectCommand="SELECT [degree_id], [degree_name] FROM [m_degree] ORDER BY [degree_name]">
                                    </asp:SqlDataSource>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label3" runat="server" Text="College"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_college" runat="server" DataSourceID="college_master" 
                                        DataTextField="college_name" DataValueField="college_id" Height="22px" 
                                        Width="148px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="college_master" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        
                                        
                                        SelectCommand="SELECT [college_id], [college_name] FROM [m_college] ORDER BY [college_name]">
                                    </asp:SqlDataSource>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label5" runat="server" Text="Year/Sem"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_year_sem" runat="server" Height="22px" Width="148px">
                                        <asp:ListItem>1st</asp:ListItem>
                                        <asp:ListItem>2nd</asp:ListItem>
                                        <asp:ListItem>3rd</asp:ListItem>
                                        <asp:ListItem>4th</asp:ListItem>
                                        <asp:ListItem>5th</asp:ListItem>
                                        <asp:ListItem>Completed</asp:ListItem>
                                    </asp:DropDownList>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label6" runat="server" Text="Branch"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_branch" runat="server" DataSourceID="branch_master" 
                                        DataTextField="branch_name" DataValueField="branch_id" Height="22px" 
                                        Width="148px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="branch_master" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                        
                                        
                                        SelectCommand="SELECT [branch_name], [branch_id] FROM [m_branch] ORDER BY [branch_name]">
                                    </asp:SqlDataSource>
                            
                                </td>
                                <td align="left">
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label7" runat="server" Text="Course Enquired"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_course" runat="server" Height="22px" Width="148px" 
                                        DataSourceID="sql_pt_enquiry" DataTextField="course_name" 
                                        DataValueField="course_id">
                                    </asp:DropDownList>
                            
                                <asp:SqlDataSource ID="sql_pt_enquiry" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:pt_enquiry %>" 
                                    SelectCommand="SELECT [course_id], [course_name] FROM [course_details]">
                                </asp:SqlDataSource>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label8" runat="server" Text="Landline No"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="landline" runat="server"></asp:TextBox>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label9" runat="server" Text="* Mobile No"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="mobile" runat="server"></asp:TextBox>
                            
                                </td>
                                <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" 
                                    runat="server" ControlToValidate="mobile" ErrorMessage="Enter Valid No." 
                                    ValidationExpression="^[0-9]{10}$" Width="98px">Enter Valid No.</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_mobile" runat="server" 
                                    ControlToValidate="mobile" ErrorMessage="Please Fill" Width="70px">Please fill</asp:RequiredFieldValidator>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label10" runat="server" Text="E-mail Id"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                            
                                </td>
                                <td>
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mail" 
                                    runat="server" ControlToValidate="email" ErrorMessage="Enter Valid Id" 
                                    ValidationExpression="^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}$">Enter Valid Id</asp:RegularExpressionValidator>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label11" runat="server" Text="Mode of Enquiry"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_mode" runat="server" Height="22px" Width="148px">
                                        <asp:ListItem>Walkin</asp:ListItem>
                                        <asp:ListItem>Telephonic</asp:ListItem>
                                        <asp:ListItem>E-Mail</asp:ListItem>
                                        <asp:ListItem>Website</asp:ListItem>
                                        <asp:ListItem>Test</asp:ListItem>
                                    </asp:DropDownList>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                            
                                    <asp:Label ID="Label12" runat="server" Text="counsellor Name"></asp:Label>
                            
                                </td>
                                <td>
                            
                                    <asp:DropDownList ID="dd_councellor" runat="server" Height="22px" Width="148px">
                                        <asp:ListItem>Anoop</asp:ListItem>
                                        <asp:ListItem>Shyam</asp:ListItem>
                                        <asp:ListItem>Sakshi</asp:ListItem>
                                        <asp:ListItem>Suman</asp:ListItem>
                                        <asp:ListItem>Prantik</asp:ListItem>
                                        <asp:ListItem>Hemant</asp:ListItem>
                                        <asp:ListItem>Manendra</asp:ListItem>
                                        <asp:ListItem>Test Counsellor</asp:ListItem>
                                   </asp:DropDownList>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                
                                    <asp:Label ID="Label13" runat="server" Text="Status"></asp:Label>
                                
                                </td>
                                <td>
                            
                                    <asp:TextBox ID="status" runat="server" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                            
                                </td>
                                <td>
                            
                                </td>
                                <td>
                            
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                
                                    <asp:Button ID="Update" runat="server" Text="Update" Width="94px" />
                                
                                </td>
                                <td align="center">
                            
                                    <asp:Button ID="Delete" runat="server" Text="Delete" Width="94px" />
                            
                                </td>
                                <td>
                            
                                    &nbsp;</td>
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
                            
                          <div id="footerhtmlPanel"><a href="http://www.[CompanyName].com" target="_blank">Owner</a></div>
                          <div id="footercssPanel"><a href="http://www.godaddy.com" target="_blank">Host</a></div>

                                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                </asp:ToolkitScriptManager>

                        </div>
                    </div>
</asp:Content>


