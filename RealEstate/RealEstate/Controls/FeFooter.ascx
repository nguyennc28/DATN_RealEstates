<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeFooter.ascx.cs" Inherits="RealEstate.Controls.Footer" %>
<link href="../css/Controls/FeFooter.css" rel="stylesheet" />
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
            <h2>Liên kết với các nhà môi giới</h2>
            <hr>
            
        </div>
    </div>
    <div class="span3">
        <div class="is-padded">
            <h2>Liên kết với các doanh nghiệp</h2>
            <hr/>
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



