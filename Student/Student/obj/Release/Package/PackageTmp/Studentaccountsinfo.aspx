<%@ Page Title="" Language="C#" MasterPageFile="~/library.Master" AutoEventWireup="true" CodeBehind="Studentaccountsinfo.aspx.cs" Inherits="Student.Studentaccountsinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content  ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
        <table align="center" class="auto-style2">
            <tr align="center">
                <td>

   
                    <asp:TextBox ID="txtsid" runat="server"></asp:TextBox>
                    <asp:Button ID="btnsearch" runat="server" Text="search" OnClick="btnsearch_Click" />

   
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr align="center">
                <td>

   
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Medium" ForeColor="#CC0000"></asp:Label>

   
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr align="center">
                <td>

   
                    <asp:Button ID="btnissued" runat="server" OnClick="btnissued_Click" Text="Issued" />

   
        <asp:Button align="center" ID="btnallissued" runat="server" Text="All  Books" OnClick="btnallissued_Click" />

   
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>

   
        <asp:GridView  align="center" ID="GridView1" runat="server" AutoGenerateColumns="False"  Height="125px" Width="422px" DataKeyNames="Issid">
            <Columns>
                <asp:BoundField DataField="Bname" HeaderText="Bname" SortExpression="Bname" />
                <asp:BoundField DataField="Issid" HeaderText="Issid" SortExpression="Issid" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Idate" HeaderText="Idate" SortExpression="Idate" />
            </Columns>
        </asp:GridView>
   
                    <asp:GridView align="center" ID="GridView2" runat="server" AutoGenerateColumns="False"  Height="154px" Width="423px" DataKeyNames="Issid">
                        <Columns>
                            <asp:BoundField DataField="Issid" HeaderText="Issid" SortExpression="Issid" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Bname" HeaderText="Bname" SortExpression="Bname" />
                            <asp:BoundField DataField="Idate" HeaderText="Idate" SortExpression="Idate" />
                            <asp:BoundField DataField="Issued" HeaderText="Issued" SortExpression="Issued" />
                       </Columns>
                    </asp:GridView>
   
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
   
     
   
    
    <p>
        &nbsp;</p>
</asp:Content>

