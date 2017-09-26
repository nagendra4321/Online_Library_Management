<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Student.register" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 46%;
        }
        .auto-style2 {
        width: 287px;
    }
        .auto-style5 {
            width: 369px;
        }
        .auto-style10 {
            width: 287px;
            height: 34px;
        }
        .auto-style11 {
            height: 34px;
            width: 369px;
        }
        .auto-style12 {
            width: 287px;
            height: 126px;
        }
        .auto-style13 {
            width: 369px;
            height: 126px;
        }
        .auto-style16 {
            width: 287px;
            height: 35px;
        }
        .auto-style17 {
            width: 369px;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
<table align="center";class="auto-style1" style="width: 714px; height: auto; margin-right: 1px;">
            <tr>
                <td class="auto-style16">Student Id</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtsid" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsid" ErrorMessage="Enter Vaild Student ID" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Student Name</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" ErrorMessage="Enter a Student Name" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">New Password</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtnewpass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Confirm New Password</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtconnewpass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpass" ControlToValidate="txtconnewpass" ErrorMessage="Passwords does not matches" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Branch Id</td>
                <td class="auto-style17">
                    <asp:DropDownList ID="ddlbranch" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlbranch" ErrorMessage="Select Branch" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Semester</td>
                <td class="auto-style17">
                    <asp:DropDownList ID="ddlsemster" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1">1-1</asp:ListItem>
                        <asp:ListItem Value="2">1-2</asp:ListItem>
                        <asp:ListItem Value="3">2-1</asp:ListItem>
                        <asp:ListItem Value="4">2-2</asp:ListItem>
                        <asp:ListItem Value="5">3-1</asp:ListItem>
                        <asp:ListItem Value="6">3-2</asp:ListItem>
                        <asp:ListItem Value="7">4-1</asp:ListItem>
                        <asp:ListItem Value="8">4-2</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlsemster" ErrorMessage="Select Semester" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Security Question</td>
                <td class="auto-style17">
                    <asp:DropDownList ID="ddlquestion" runat="server" OnSelectedIndexChanged="ddlquestion_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlquestion" ErrorMessage="Select Security Question" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Security Answer</td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtsecans" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsecans" ErrorMessage="Submit Answer" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Gender</td>
                <td class="auto-style17">
                    <asp:DropDownList ID="ddlgender" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlgender" ErrorMessage="Select Gender" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Email</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter Valid Email id" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Phone Number</td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtphonenumber" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphonenumber" ErrorMessage="Enter Valid phone number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">DOB</td>
                <td class="auto-style17">
                   
                
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                    <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
                   
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtdob" ErrorMessage="Select your DOB" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                   
                
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Photo</td>
                <td class="auto-style17">
                    <asp:FileUpload ID="fupphoto" runat="server" OnLoad="fupphoto_Load" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="fupphoto" ErrorMessage="Selcet your Photo" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Image ID="phtimage" runat="server" />
                </td>
                <td class="auto-style13">
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
</asp:Content>
