<%@ Page Title="" Language="C#" MasterPageFile="~/library.Master" AutoEventWireup="true" CodeBehind="Enterbook.aspx.cs" Inherits="Student.Enterbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">

    .auto-style1 {
        width: 32%;
    }
    .auto-style3 {
        width: 130px;
    }
    .auto-style4 {
        width: 218px;
        height: 42px;
    }
    .auto-style5 {
        height: 42px;
    }
        .auto-style6 {
            width: 218px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
    .auto-style8 {
        width: 218px;
        height: 18px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style8">Book Name</td>
                <td>
                    <asp:TextBox ID="txtbookname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbookname" ErrorMessage="Enter book name" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Category</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddlcategory" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlcategory" ErrorMessage="Select Category" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Author</td>
                <td>
                    <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtauthor" ErrorMessage="Enter Author Name" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Edition</td>
                <td>
                    <asp:TextBox ID="txtedition" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtedition" ErrorMessage="Enter Edition" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Number of books available</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtnoavailable" runat="server" Height="19px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtnoavailable" ErrorMessage="Enter Number Of books available" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr ="center">
                <td  colspan="2" class="auto-style3">
                    <asp:Button ID="btnenter" runat="server" OnClick="btnenter_Click" Text="Enter" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr ="center">
                <td  colspan="2" class="auto-style3">

   
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="#CC0000"></asp:Label>

   
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
   
    

    </asp:Content>
