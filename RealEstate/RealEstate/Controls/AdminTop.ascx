<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminTop.ascx.cs" Inherits="RealEstate.Controls.AdminTop" %>
<%@ Import Namespace="RealEstate.Common" %>
<div class="div"><table class="table" cellspacing="0" cellpadding="0">
<tr class="Admin-navbar">
    <td> <a href="~/Default2.aspx" target="" rel="" title="Đi đến trang chủ"> <img src="/Icons/logo_nav.png" style="height: 40px;"/></a> </td>
    <td colspan="3" class="logo">Trang quản trị</td>
</tr>
<tr class="Admin-nav">
    <td class="left">Xin chào: <strong><%= Session["UserName"]%></strong>&nbsp; <asp:Literal ID="ltrLanguage" runat="server"></asp:Literal> &nbsp; <asp:ImageButton ID="ibtEn" runat="server" ImageUrl="~/App_Themes/Admin/images/flag_en.gif" onclick="ibtEn_Click" ImageAlign="TextTop" /> &nbsp; <asp:ImageButton ID="ibtVi" runat="server" ImageUrl="~/App_Themes/Admin/images/flag_vi.gif" onclick="ibtVi_Click" ImageAlign="TextTop" /> &nbsp; </td>
    <td class="right">
        <asp:LinkButton ID="linkDefault" runat="server" OnClick="linkDefault_Click">Trang chủ</asp:LinkButton><span style="margin: 0 10px">|</span>
        <asp:LinkButton ID="linkLogout" runat="server" OnClick="linkLogout_Click"><span style="margin-right: 20px;">Đăng xuất</span></asp:LinkButton> 
        <%--<asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>--%>
    </td>
</tr>
</table>
</div>


