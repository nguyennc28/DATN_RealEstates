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
            <div class="span3">
                <a href="Default2.aspx" target="" rel="" title="Trang chủ">
                    <img src="Icons/logo_nav.png" style="height: 55px;" /></a>
            </div>
            <div class="span4">
                <img src="../Upload/Banner/A8A-DR_960x90.gif"/>
                <%--<div class="row">
                    <div class="span1">
                    <a href="https://facebook.com" target="" rel="" title="Kết nối với Facebook">
                        <img src="Icons/Fb.png" style="width: 25px; height: 25px;" /></a>
                        <a href="https://plus.google.com/" target="" rel="" title="Kết nối với Google+">
                            <img src="Icons/Gg.png" style="width: 40px; height: 23px;" /></a>
                    </div>
                    <div class="span1">
                        <a href="https://facebook.com" target="" rel="" title="Kết nối với Facebook">
                            <img src="Icons/Fb.png" style="width: 25px; height: 25px;" /></a>
                        <a href="https://plus.google.com/" target="" rel="" title="Kết nối với Google+">
                            <img src="Icons/Gg.png" style="width: 40px; height: 23px;" /></a>
                    </div>
                    <div class="span3">
                        <%--<img src="Icons/Create.png" style="width: 16px; height: 16px;" />
                    <a href=""><span>Đăng tin rao </span></a>
                    <img src="Icons/Help.png" style="width: 16px; height: 16px;" />
                    <a href=""><span>Hỏi đáp </span></a>
                        <img src="Icons/Register.png" style="width: 16px; height: 16px;" />
                        <a href=""><span>Đăng ký </span></a>
                        <img src="Icons/Key.png" style="width: 16px; height: 16px;" />
                        <a href=""><span>Đăng nhập </span></a>

                        <a href="">
                            <img src="Icons/btnThemTinBDS.jpg" height="35px;" /></a>
                    </div>--%>
             </div>
             <div class="span2">
                 <table>
                     <tr>
                         <td>
                             <img src="Icons/Register.png" style="width: 16px; height: 16px;" />
                            <a href="Default2.aspx?mod=Register"><span>Đăng ký </span></a>
                         </td>
                         <td>
                             <img src="Icons/Key.png" style="width: 16px; height: 16px;" />
                            <a href="/Login.aspx"><span><asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label></span></a>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2"><a href="PostNewRE.aspx" title="Đăng bất động sản của bạn">
                                        <img src="Icons/btnThemTinBDS.jpg" height="40px" /></a> 

                         </td>
                     </tr>                 
                 </table>                       
            </div>        
        </div>
    </div>
</div>