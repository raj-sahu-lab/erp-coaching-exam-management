<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
 
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
                    <a href="exam_reg.aspx" >Registration for Exam</a>
                    <a href="test_detail.aspx">Scholorship Earned</a>
                </div>
        </li>
        <li><a href="logout.aspx">Logout</a></li>
    </ul>
</nav>
            <div id="topPanel">
              <%--  <ul>
                    <li><a href="Enquiry_list.aspx">List</a></li>
                    <li><a href="followup.aspx">Follow up</a></li>
                    <li><a href="newenquiry.aspx">New Enquiry</a></li>
                    <li class="active">Home</li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>--%>      
        
                    <p style="padding-top:40px; text-align:center " >
                     <%
                         Dim nm As String
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
                                
                    <div id="headerPanel1">
                    
	                <h2>New enquiry</h2>
	                    <p>Add details of new enquiry </p>
	                    <a href="newenquiry.aspx">&nbsp;</a>
	                </div>
	                
                    <div id="headerPanel2">
	                <h2>Follow<br />
                        up</h2>
	                    <p>Enter follow up details </p>
                        <a href="followup.aspx">&nbsp;</a>
                    </div>
                    
                    <div id="headerPanel3">
	                <h2>Enquiry<br />
                        list</h2>
	                    <p>List of open enquiries</p>
	                    <a href="Enquiry_list.aspx">&nbsp;</a>
	                </div>
	                
	                <div id="headerPanel4">
	                <h2>Fee<br />
                        Collect</h2>
	                    <p>Details of the collected fee</p>
	                    <a href="fee_collect.aspx">&nbsp;</a>
	                </div>
	                
	                <div id="headerPanel5">
	                <h2>Fee<br />
                        Follow Up</h2>
	                    <p>Enter fee follow up details</p>
	                    <a href="fee_followup.aspx">&nbsp;</a>
	                </div>
	                
	                <div id="headerPanel6">
	                <h2>Fee<br />
                        Details</h2>
	                    <p>Details of the fee to be paid</p>
	                    <a href="fee_details.aspx">&nbsp;</a>
	                </div>
                     
                    <div id="headerPanel7">
	                <h2>Create<br />
                        Exam</h2>
	                    <p>Details of the new test</p>
	                    <a href="create_exam.aspx">&nbsp;</a>
	                </div>
 
                    <div id="headerPanel8">
	                <h2>Register For<br />
                        Test</h2>
	                    <p>Register students for test</p>
	                    <a href="exam_reg.aspx">&nbsp;</a>
	                </div>
                    
                    <div id="headerPanel9">
	                <h2>Test<br />
                        Reports</h2>
	                    <p>Report of scholarship test</p>
	                    <a href="test_detail.aspx">&nbsp;</a>
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




