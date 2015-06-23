<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="AdminLeft.ascx.cs" Inherits="RealEstate.Controls.AdminLeft" %>

<table class="table" cellspacing="0" cellpadding="0">
    <tr>
        <td class="left">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
        <td>Quản lý </td>
        <td class="image">
            <img alt="" id="imgdiv1" src="/App_Themes/admin/images/closed.png" width="16" height="16" onclick="toggleXPMenu('div1');" /></td>
        <td class="right">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
    </tr>
</table>
<asp:Panel ID="div1" CssClass="content" ClientIDMode="Static" runat="server">
    <ul>
        <%--<li>
            <img alt="" src="/App_Themes/admin/images/icon_system.jpg" /><asp:LinkButton
                ID="lbtConfig" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Cấu hình</asp:LinkButton></li>
        <li>--%>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_user.jpg" /><asp:LinkButton
                ID="lbtUserManager" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Người dùng</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_user.jpg" /><asp:LinkButton
                ID="LinkButton2" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Nhà môi giới</asp:LinkButton></li>
        <%--<li>
            <img alt="" src="/App_Themes/admin/images/icon_page.jpg" />
            <asp:LinkButton
                ID="lbtPage" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Danh mục trang</asp:LinkButton></li>--%>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_page.jpg" />
            <asp:LinkButton
                ID="LinkButton1" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Menu</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_adv.jpg" /><asp:LinkButton
                ID="lbtLinksManager" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Liên kết</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_adv.jpg" /><asp:LinkButton
                ID="lbtTestUploadFile" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Upload Iamge</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" />
            <a href="Default.aspx?mod=DistrictManager">Quản lý quận huyện </a>
        </li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" />
            <a href="Default.aspx?mod=DistrictManager">Quản lý Tỉnh(Thành phố) </a>
        </li>
    </ul>
</asp:Panel>
<table class="table" cellspacing="0" cellpadding="0">
    <tr>
        <td class="left">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
        <td>Tin tức </td>
        <td class="image">
            <img alt="" id="imgdiv10" src="/App_Themes/admin/images/closed.png" width="16" height="16" onclick="toggleXPMenu('div10');" /></td>
        <td class="right">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
    </tr>
</table>

<asp:Panel ID="div10" CssClass="content" ClientIDMode="Static" runat="server">
    <ul>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" /><asp:LinkButton
                ID="lbtGroupNews" runat="server" OnClick="LinkButton_Click">Nhóm tin</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_pro.jpg" /><asp:LinkButton
                ID="lbtNews" runat="server" OnClick="LinkButton_Click">Danh sách tin</asp:LinkButton></li>
    </ul>
</asp:Panel>
<table class="table" cellspacing="0" cellpadding="0">
    <tr>
        <td class="left">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
        <td>Bất động sản</td>
        <td class="image">
            <img alt="" id="imgdiv9" src="/App_Themes/admin/images/closed.png" width="16" height="16" onclick="toggleXPMenu('div9');" /></td>
        <td class="right">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
    </tr>
</table>
<asp:Panel ID="div9" CssClass="content" ClientIDMode="Static" runat="server">
    <ul>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" /><asp:LinkButton
                ID="lbtHomesManager" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Quản lý Nhà</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" /><asp:LinkButton
                ID="LinkButton3" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Quản lý căn hộ</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" /><asp:LinkButton
                ID="LinkButton4" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Quản lý nhà trọ</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" /><asp:LinkButton
                ID="LinkButton5" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Quản lý đất</asp:LinkButton></li>
        <%--<li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" />
            <a href="Default.aspx?mod=HomeManager">Quản lý Nhà </a>
        </li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" />
            <a href="Default.aspx?mod=ApartmentManager">Quản căn hộ</a>
        </li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" />
            <a href="Default.aspx?mod=UserManager">Người dùng </a>
        </li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" />
            <a href="Default.aspx?mod=DistrictManager">Quản lý quận huyện </a>
        </li>--%>
    </ul>

</asp:Panel>
<table class="table" cellspacing="0" cellpadding="0">
    <tr>
        <td class="left">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
        <td>Hỗ trợ trực tuyến</td>
        <td class="image">
            <img alt="" id="imgdiv8" src="/App_Themes/admin/images/closed.png" width="16" height="16" onclick="toggleXPMenu('div8');" /></td>
        <td class="right">
            <img alt="" src="/App_Themes/admin/images/blank.gif" /></td>
    </tr>
</table>
<asp:Panel ID="div8" CssClass="content" ClientIDMode="Static" runat="server">
    <ul>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_gpro.jpg" /><asp:LinkButton
                ID="lbtGroupSupport" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Nhóm hỗ trợ</asp:LinkButton></li>
        <li>
            <img alt="" src="/App_Themes/admin/images/icon_pro.jpg" /><asp:LinkButton
                ID="lbtSupport" CausesValidation="false" runat="server" OnClick="LinkButton_Click">Nhân viên hỗ trợ</asp:LinkButton></li>
    </ul>
</asp:Panel>
