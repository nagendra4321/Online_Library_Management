

<%@ Page Title="" Language="C#" MasterPageFile="~/library.Master" AutoEventWireup="true" CodeBehind="returnbook.aspx.cs" Inherits="Student.returnbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width:30%;
        }
        .auto-style2 {
            width:177px;
        }
        .auto-style3 {
            width: 300px;
        }
        .auto-style4 {
            width: 386px;
            height: 36px;
        }
        .auto-style5 {
            width: 399px;
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style4">Student Id</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtrsid" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtrsid" ErrorMessage="Enter Student ID" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Book Id</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtrbid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:GridView ID="grdreturnbooks" runat="server" AutoGenerateColumns="False">
                        <Columns>
                         <asp:TemplateField HeaderText="Is Present">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkIsReturn" runat="server" />
                            </ItemTemplate>
                         </asp:TemplateField>
                            
                            <asp:BoundField HeaderText="Student Name" DataField="Name" />
                             <asp:BoundField HeaderText="Book Name" DataField="bname" />
                            <asp:BoundField HeaderText="Issue Date" DataField="Idate" />
                            <asp:TemplateField>
                                 <ItemTemplate>
                       <asp:HiddenField ID="hdnStudentId" runat="server" Value='<%# Eval("sid") %>'/>    
                       <asp:HiddenField ID="hdnBookId" runat="server" Value='<%# Eval("bid") %>'/>       
                                     <asp:HiddenField ID="hdnIssueId" runat="server" Value='<%# Eval("issid") %>'/>     
                                                                               
                   </ItemTemplate>
                            </asp:TemplateField>
                            
                       
                       </Columns>
                       
                    </asp:GridView>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnreturn" runat="server" Text="Return" OnClick="btnreturn_Click" />
                    <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" Text="Search" />

   
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="#CC0000"></asp:Label>

   
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
    
    
    <p>
        &nbsp;</p>
</asp:Content>
