<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RealEstate.Pages.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 434px;        
        }
        .tbList {
            border: 1px solid red;
        }
        /*.trList {
            height: 100px;
        }
        .tdList {
            width: 300px;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Literal ID="ltrHome" runat="server"></asp:Literal>
</asp:Content>
