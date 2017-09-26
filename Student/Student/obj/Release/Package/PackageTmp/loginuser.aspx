<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginuser.aspx.cs" Inherits="Student.loginuser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center";style="align-items:center;width:100%;color:white;">
                    <tr align="center" style="align-items:center;height:70px;" >
                        <td align="center" style="align-content:center;font-size:xx-large" class="auto-style1">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            Library Management System
                        </td>
                   </tr>
        <tr>
            <td>
                <asp:Login ID="loginstu" runat="server" OnAuthenticate="Login1_Authenticate" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="142px" Width="239px">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
            </td>
        </tr>

                    

                </table>
    </div>
        
    </form>
</body>
</html>
