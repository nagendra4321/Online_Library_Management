<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="accountinfo.aspx.cs" Inherits="Student.accountinfo" %>
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

   
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="#CC0000"></asp:Label>

   
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

   
        <asp:GridView  align="center" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="125px" Width="422px" DataKeyNames="Issid">
            <Columns>
                <asp:BoundField DataField="Bname" HeaderText="Bname" SortExpression="Bname" />
                <asp:BoundField DataField="Issid" HeaderText="Issid" SortExpression="Issid" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Idate" HeaderText="Idate" SortExpression="Idate" />
            </Columns>
        </asp:GridView>
   
                    <asp:GridView align="center" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="154px" Width="423px" DataKeyNames="Issid">
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
   
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:libraryConnectionString %>" SelectCommand="SELECT tblbooks.Bname, tblissuedbooks.Issid, tblissuedbooks.Idate FROM tblbooks INNER JOIN tblissuedbooks ON tblbooks.Bid = tblissuedbooks.Bid WHERE (tblissuedbooks.Issued = 1) AND (tblissuedbooks.Sid = @sid)">
            <SelectParameters>
                <asp:SessionParameter Name="Sid" SessionField="UserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
   
    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:libraryConnectionString %>" SelectCommand="SELECT tblissuedbooks.Issid, tblbooks.Bname, tblissuedbooks.Idate, tblissuedbooks.Issued FROM tblbooks INNER JOIN tblissuedbooks ON tblbooks.Bid = tblissuedbooks.Bid WHERE (tblissuedbooks.Sid = @sid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Sid" SessionField="UserName" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
   
    
    <p>
        &nbsp;</p>
</asp:Content>


