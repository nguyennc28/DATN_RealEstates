<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeNavbar.ascx.cs" Inherits="RealEstate.Controls.FeNavbar" %>
<style type="text/css">
    .navbar-inner {
        margin: 5px 0 5px 0;
        height: 30px;
    }

    .row {
        margin-top: 0px;
    }
</style>
<div class="navbar-inner">
    <div class="container">
        <div class="row">
            <div class="span2">
                <a href="Default2.aspx" target="" rel="" title="Trang chủ">
                    <img src="Icons/logo_nav.png" style="height: 55px;" /></a>
            </div>
            <div class="span5">
                <img src="../Upload/Banner/banner_top_batdongsan.gif" width="70%"/>                
             </div>
            <div class="span2">
                <p>
                    <asp:LinkButton ID="linkLogin" runat="server" OnClick="linkLogin_Click"><img src="Icons/Key.png" style="width: 16px; height: 16px;" /><span style="margin-left: 3px; font-size: 13px;">Đăng nhập</span></asp:LinkButton>
                    <asp:LinkButton ID="linkXinChao" runat="server" OnClick="linkXinChao_Click">
                        <img src="/Icons/avatar-default.png" alt="Chỉnh sửa thông tin cá nhân" style="width: 16px; height: 16px;" /><span style="margin-left: 3px; font-size: 13px;"><asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label></span></asp:LinkButton>
                    <asp:LinkButton ID="linkDangKy" runat="server" OnClick="linkDangKy_Click"><img src="Icons/Register.png" style="width: 16px; height: 16px;" /><span style="margin-left: 3px; font-size: 13px;">Đăng ký</span></asp:LinkButton>
                    <asp:LinkButton ID="LinkDangXuat" runat="server" OnClick="LinkDangXuat_Click"><img src="Icons/Key.png" style="width: 16px; height: 16px;" /><span style="margin-left: 3px; font-size: 13px;">Đăng xuất</span></asp:LinkButton>

                </p>
                 <p style="margin-top: 5px;">
                     <a href="/PostNewRealEstate.aspx" title="Đăng bất động sản của bạn">
                                        <img src="Icons/btnThemTinBDS.jpg"/></a>
                 </p>
                 

                 <%--<table>
                     <tr>
                         <td>
                             
                             <asp:LinkButton ID="linkLogin" runat="server" OnClick="linkLogin_Click"><img src="Icons/Key.png" style="width: 16px; height: 16px;" />Đăng nhập</asp:LinkButton>
                             <asp:LinkButton ID="linkXinChao" runat="server" OnClick="linkXinChao_Click"><img src="/Icons/avatar-default.png" alt="Chỉnh sửa thông tin cá nhân" style="width: 25px; height: 25px;"/><span><asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label></span></asp:LinkButton>

                         </td>
                         <td>                             
                             <asp:LinkButton ID="linkDangKy" runat="server" OnClick="linkDangKy_Click"><img src="Icons/Register.png" style="width: 16px; height: 16px;" />Đăng ký</asp:LinkButton>
                             <asp:LinkButton ID="LinkDangXuat" runat="server" OnClick="LinkDangXuat_Click"><img src="Icons/Key.png" style="width: 16px; height: 16px;" />Đăng xuất</asp:LinkButton>
                         </td>                         
                     </tr>
                     <tr>
                         <td colspan="2"><a href="PostNewRE.aspx" title="Đăng bất động sản của bạn">
                                        <img src="Icons/btnThemTinBDS.jpg" height="40px" /></a> 
                         </td>
                     </tr>                 
                 </table>   --%>                    
            </div>        
        </div>
    </div>
</div>