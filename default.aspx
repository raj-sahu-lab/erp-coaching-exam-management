<%@ Page Title="" Language="VB" MasterPageFile="~/pt-website.master" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
               <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" alt="Logo PT"border="0" style="margin: 0px 0px 0px 240px" /></a><br /><br /> 
   <div id="ddmenu">
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
</div>   
            <div id="topPanel">
               <%--  <ul>
                    <li><a href="#">List</a></li>
                    <li><a href="#">Follow up</a></li>
                    <li><a href="#">New Enquiry</a></li>
                    <li><a href="#">Home</a></li>
                    <li class="active">Login</li>
                </ul>
                <a href="home.aspx"><img src="images/logo.png" title="[Company Name]" 
                    alt="Logo PT" border="0" /></a>--%>

                    <div id="headerPanellog">
	 
	                <table style="margin: 30px 0 0 40px;">
	                    <tr align="center">
	                        <td colspan="2">
	                        
	                            <asp:Label ID="Label1" runat="server" Text="Counsellor Login"></asp:Label>
	                        
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        
	                            <asp:Label ID="Label2" runat="server" Text="User Name :"></asp:Label>
	                        
	                        </td>
	                        <td>
	                            
	                            <asp:TextBox ID="username" runat="server"></asp:TextBox>
	                            
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        
	                            <asp:Label ID="Label3" runat="server" Text="Password :"></asp:Label>
	                        
	                        </td>
	                        <td>
	                            
	                            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
	                            
	                        </td>
	                    </tr>
	                    <tr>
	                        <td align="left">
	                            <asp:Label ID="Label4" runat="server" Text="User Role :"></asp:Label>
	                        </td>
	                        <td align="left">
	                            <asp:DropDownList ID="dd_role" runat="server" Height="22px" Width="148px">
                                    <asp:ListItem>Center Head</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Counsellor</asp:ListItem>
                                </asp:DropDownList>
	                        </td>	                        
	                    </tr>
	                    <tr>
	                        <td colspan="2" align="center">
	                            <asp:Label ID="info" runat="server"></asp:Label>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td align="center">
	                            
	                            <asp:Button ID="login" runat="server" Text="Login" Width="102px" />
	                            
	                        </td>
	                        
	                        <td align="center">
	                        
	                            <asp:Button ID="cancel" runat="server" Text="Cancel" Width="102px" />
	                        
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




