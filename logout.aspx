<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="logout.aspx.vb" Inherits="logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
   <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT"border="0" style="margin: 0px 0px 0px 240px" /></a><br /><br /> 
   <nav id="ddmenu">
    <ul>
        <li><a href="#">Home</a></li>
        <li>New Enquiry
                <div class="column">
                    <b>START A NEW ENQUIRY</b>
                    <a href="#">New Enquiry</a>
                    <a href="#">Follow Up</a>
                    <a href="#">Enquiry List</a>
                </div>
        </li>
        <li>Fee Details
                <div class="column">
                    <b>GET FEE DETAILS</b>
                    <div>
                        <a href="#">Fee Collect</a>
                        <a href="#">Fee Follow Up</a>
                        <a href="#">Fee Due</a>
                    </div>
                </div>
        </li>
        <li>Scholorship
                <div class="column">
                    <b>SCHOLORSHIP DETAILS</b>
                    <a href="#">Create Exam</a>
                    <a href="#">Registeration for Exam</a>
                    <a href="#">Scholorship Earned</a>
                </div>
        </li>
        <li><a href="default.aspx">Login</a></li>
    </ul>
</nav>  
            <div id="topPanel">
                <%--<ul>
                    <li><a href="#">List</a></li>
                    <li><a href="#">Follow up</a></li>
                    <li><a href="#">New Enquiry</a></li>
                    <li><a href="#">Home</a></li>
                    <li class="active"><a href="default.aspx">Login</a></li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" 
                    alt="Logo PT" border="0" /></a>--%>

                    <div id="headerPanellog">
	                            <%
	                                Session.Abandon()
                                %>
	                <table style="margin: 50px 0 0 40px; width: 258px; height: 140px;">
	                    <tr align="center">
	                        <td colspan="2">
	                        
	                            Thank you for using PT
                                <br />
                                Enquiry System you are logged out</td>
	                    </tr>
	                    <tr>
	                        <td align="center" >
	                            Please navigate to the login page to<br />
                                login again 
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
                        </div>
                    </div>
        
        
</asp:Content>


