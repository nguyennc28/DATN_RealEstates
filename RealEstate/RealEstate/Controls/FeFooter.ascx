<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeFooter.ascx.cs" Inherits="RealEstate.Controls.Footer" %>
<link href="../css/Controls/FeFooter.css" rel="stylesheet" />
<style type="text/css">
    .connectwithme {
        color: blue;
        font-size: 14px;
        font-weight: bold;
    }
</style>
<div class="row">
    <div class="span3">
        <div class="is-padded">
            <nav>
                <h2>Liên kết website:</h2>
                <hr/>
                <% if (listLinks == null)
                   {%>
                       <p>Dữ liệu đang được cập nhật!</p>
                   <%} %>
                <%
                   else
                   {%>
                <% foreach (var lstLinks in listLinks)
                   {%>
                       <ul><li><img src="../Icons/icon_adv.png" /><a href="<%=lstLinks.Link1 %>"> <%=lstLinks.Name %></a></li></ul>
                   <%} %>                      
                   <%} %>                
            </nav>
        </div>
    </div>
    <div class="span3">
        <div class="is-padded">
            <h2>Giới thiệu về chúng tôi</h2>
            <hr>
            <p> http://batdongsanvn.vn là website đăng tin, trao đổi thông tin mua bán các sản phẩm về bất động sản. Chúng tôi hi vọng mang đến cho bạn sự tiện lợi nhất đinh khi muốn tìm ngôi nhà của ban!</p>
        </div>
    </div>
    <div class="span3">
        <div class="is-padded">
            <h2>Hãy kết nối với chúng tôi qua:</h2>
            <hr/>
            <p><span class="connectwithme">Facebook</span><a href="https://facebook.com" target="" rel="" title="Kết nối với Facebook">
                        <img src="Icons/Fb.png" style="width: 25px; height: 25px;" /></a></p>
            <p><span class="connectwithme">Google+</span><a href="https://plus.google.com/" target="" rel="" title="Kết nối với Google+">
                            <img src="Icons/Gg.png" style="width: 40px; height: 23px;" /></a></p>
        </div>
    </div>
</div>
<div id="footer-bottom">
    <div class="row">
        <div class="span10">
            <a href="Default2.aspx">Trang chủ</a> | 
            <a href="">Giới thiệu</a> | 
            <a href="">Điều khoản thỏa thuận</a> | 
            <a href="">Hướng dẫn sử dụng</a> | 
            <a href="">Hướng dẫn đăng tin</a> | 
            <a href="">Góp ý</a> | 
            <a href="">Hỗ trợ</a> | 
            <a href="">Liên hệ</a> 
        </div>
    </div>

    <div class="row">
        <div class="span10">
            @ Coppyright Ngô Văn Nguyện
            <br />
            Email liên hệ: ngocongnguyen2805.vn@gmail.com
            <br />
            Hotline: 09.888.679.10
        </div>
    </div>
</div>



