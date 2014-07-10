<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="admin_home.aspx.vb" Inherits="admin_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
           
            <div id="topPanel">
               <%-- <ul>
                    <li><a href="admin_master_set.aspx">Master</a></li>
                    <li><a href="admin_user.aspx">Users</a></li>
                    <li><a href="admin_followup.aspx">Follow up</a></li>
                    <li><a href="admin_update.aspx">Update Data</a></li>
                    <li class="active">Home</li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT" border="0" /></a>--%>
                    
                    <p style="padding-top:60px; text-align:center " >
                     <%
                         Dim a_nm As String
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
                    
                    <div id="headerPanel1">
	                    <h2>Update enquiry</h2>
	                    <p>Update details of new enquiry </p>
	                    <a href="admin_update.aspx">&nbsp;</a>
	                </div>
	                
                    <div id="headerPanel2">
	                    <h2>follow
                        up</h2>
	                    <p>Update follow up details &amp; Correct Faulty data </p>
                        <a href="admin_followup.aspx">&nbsp;</a>
                    </div>
                    
                    <div id="headerPanel3">
	                    <h2>manage<br />
                        user</h2>
	                    <p>Update &amp; change existing data of counsellor </p>
	                    <a href="admin_user.aspx">&nbsp;</a>
	                </div>
	                
	                <div id="headerPanel4">
	                <h2>Fee<br />
                        Collect</h2>
	                    <p>Details of the collected fee</p>
	                    <a href="admin_fee_collect.aspx">&nbsp;</a>
	                </div>
	                
	                <div id="headerPanel5">
	                <h2>Fee<br />
                        Follow Up</h2>
	                    <p>Enter fee follow up details</p>
	                    <a href="admin_fee_followup.aspx">&nbsp;</a>
	                </div>
	                
	                <div id="headerPanel6">
	                <h2>Fee<br />
                        Details</h2>
	                    <p>Details of the fee to be paid</p>
	                    <a href="admin_fee_details.aspx">&nbsp;</a>
	                </div>
                    
                     <div id="headerPanel7">
	                <h2>Create<br />
                        Exam</h2>
	                    <p>Details of the new test</p>
	                    <a href="admin_create_exam.aspx">&nbsp;</a>
	                </div>
 
                    <div id="headerPanel8">
	                <h2>Delete<br />
                        Student</h2>
	                    <p>Delete Registerd students</p>
	                    <a href="admin_exam_reg_del.aspx">&nbsp;</a>
	                </div>
                    
                    <div id="headerPanel9">
	                <h2>Test<br />
                        Reports</h2>
	                    <p>Report of scholarship test</p>
	                    <a href="">&nbsp;</a>
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
                        </div>
                    </div>
        
</asp:Content>


