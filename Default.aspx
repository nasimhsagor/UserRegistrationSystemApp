<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserRegistrationSystemApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Insert User</h2>
     <asp:Label ID="Label3" runat="server" Text="Enter Full Name:"></asp:Label>
   <asp:TextBox ID="txtFullName" runat="server" />
    <span id="spanFullName" runat="server" class="validation-message"></span>
    <br />
     <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
   <asp:TextBox ID="txtEmail" runat="server" />
    <span id="spanEmail" runat="server" class="validation-message"></span>
    <br />
     <asp:Label ID="Label5" runat="server" Text="Mobile Number:"></asp:Label>
   <asp:TextBox ID="txtMobileNumber" runat="server" />
    <span id="spanMobileNumber" runat="server" class="validation-message"></span>
    <br />
     <asp:Label ID="Label6" runat="server" Text="Address:"></asp:Label>
   <asp:TextBox ID="txtAddress" runat="server" />
    <span id="spanAddress" runat="server" class="validation-message"></span>
    <br />
    <asp:Label ID="Label1" runat="server" Text="User Name:"></asp:Label>
   <asp:TextBox ID="txtUsername" runat="server" />
    <span id="spanUsername" runat="server" class="validation-message"></span>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
    <span id="spanPassword" runat="server" class="validation-message"></span>
    <br />
    <br />
   <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
   <asp:Label ID="lblMessage" runat="server" Visible="false" />


</asp:Content>
