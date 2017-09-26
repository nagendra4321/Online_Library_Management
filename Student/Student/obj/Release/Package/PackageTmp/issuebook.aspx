

<%@ Page Title="" Language="C#" MasterPageFile="~/library.Master" AutoEventWireup="true" CodeBehind="issuebook.aspx.cs" Inherits="Student.issuebook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    
    <style type="text/css">
        .auto-style1 {
            width: 30%;
        }
        .auto-style2 {
            width: 177px;
        }
        .auto-style3 {
            width: 300px;
        }
        .auto-style4 {
            width: 177px;
            height: 24px;
        }
        .auto-style5 {
            width: 300px;
            height: 24px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style4">Student Id</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtsid" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsid" ErrorMessage="Enter Student ID" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Book Id</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtbid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style2">
                     <table align="center"; class="auto-style1">
            <tr>
                <td class="auto-style2">Category</td>
                <td>
                    <asp:DropDownList ID="ddlcategory" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlcategory" ErrorMessage="Select category" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
                </td>
                
            </tr>
            <tr>
                <td colspan="2" class="auto-style2">
                     <asp:GridView ID="grdissuebooks" runat="server" AutoGenerateColumns="False">
                        <Columns>
                         <asp:TemplateField HeaderText="Issue">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkIsIssued" runat="server" />
                            </ItemTemplate>
                         </asp:TemplateField>
                            
                           
                             <asp:BoundField HeaderText="Book Name" DataField="bname" />
                            <asp:BoundField HeaderText="Author" DataField="Author" />
                            <asp:BoundField HeaderText="Edition" DataField="Edition" />

                            
                            
                            <asp:TemplateField>
                                 <ItemTemplate>
                                     <asp:HiddenField ID="hdnBookId" runat="server" Value='<%# Eval("Bid") %>'/> 
                     
                                 </ItemTemplate>
                            </asp:TemplateField>
                            
                       
                       </Columns>
                       
                    </asp:GridView>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnissue" runat="server" Text="Issue" OnClick="btnissue_Click" />

   
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="#CC0000"></asp:Label>

   
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
        </table>
  
    

</asp:Content>
