<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="Student.logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        </style>
</head>
<body style="background-color:white; height: 188px; width: 1051px;" >
    <form id="form1" runat="server">
        <div style="align-content:center" >
               <br />
                <table align="center";style="align-items:center;width:100%;color:white;">
                    <tr align="center" style="align-items:center;height:70px;" >
                        <td align="center" style="align-content:center;font-size:xx-large" class="auto-style1">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            Library Management System
                        </td>
                   </tr>
                </table>
                <table class="auto-style1">
                    <tr align="center">
                        <td>
                    <asp:Label ID="lblmsg" runat="server" Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
                        </td>
                    </tr>
                    <tr align="center">
                        <td>  
                            <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" />
                        </td>
                    </tr>
                </table>
             </div>
        </form>
</body>
</html>
