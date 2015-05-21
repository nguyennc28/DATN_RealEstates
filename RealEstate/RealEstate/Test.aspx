<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="RealEstate.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form action="#">
        <fieldset>
            <legend>Thông tin cá nhân:</legend>
            Họ tên:
            <input type="text" size="30" /><br />
            Email:
            <input type="text" size="30" /><br />
            Ngày sinh:
            <input type="text" size="10" />
        </fieldset>
    </form>
</asp:Content>
