<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Student.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 580px;
            height: 83px;
        }
        .auto-style2 {
        width: 313px;
    }
        .auto-style3 {
            width: 313px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <table align="center"; class="auto-style1">
            <tr>
                <td class="auto-style2">Category</td>
                <td>
                    <asp:DropDownList ID="ddlcategory" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlcategory" ErrorMessage="Select Category" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Author Name</td>
                <td>
                    <asp:TextBox ID="txtauthorname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Book Name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtbookname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" Text="Search" />

   
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="#CC0000"></asp:Label>

   
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
         <br />
         <asp:GridView align="center" ID="grdbooks" runat="server" AutoGenerateColumns="False">
             <Columns>
                 <asp:BoundField HeaderText="Book name" DataField="Bname" />
                 <asp:BoundField HeaderText="Category" DataField="catname" />
                 <asp:BoundField HeaderText="Author" DataField="Author" />
                 <asp:BoundField HeaderText="Edition" DataField="Edition" />
                 <asp:BoundField HeaderText="Books available" DataField="Noofbooksavailable" />

             </Columns>
         </asp:GridView>
         </asp:Content>
