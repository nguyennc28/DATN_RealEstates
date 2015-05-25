<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home.ascx.cs" Inherits="RealEstate.Modules.Home" %>
<%@ Register Src="~/Modules/SearchBoxMain.ascx" TagPrefix="uc1" TagName="SearchBoxMain" %>
<%@ Register Src="~/Modules/SearchLeft.ascx" TagPrefix="uc1" TagName="SearchLeft" %>

<script src="../js/jquery-1.11.2.min.js"></script>
<script src="../js/modules/jquery.featureList-1.0.0.js"></script>
<script type="text/javascript">
    jQuery(function ($) {
        $.featureList(
        $('#tabs li a'),
        $('#output li'), {
            start_item: 0
        }
    );
    });
	</script>
<style type="text/css">
    .tabList {
        width: 100%;
        margin-bottom: 5px;
    }
    .tabHeader {
        -ms-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
        background: #404533;
        width: 30%;
    }

    .tabHeader h4 {
        font-family: tahoma;
        font-size: 13px;
        text-align: center;
        line-height: 25px;
    }

    .tabbody {
        width: 100%;
        border: 1px solid rgb(64,69,51);
        background: #EEEEEE;
    }
    .ListNews {
        width: 100%;
        margin-bottom: 5px;
    }
    .ListNewsHeader {
        -ms-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
        background: #404533;
        width: 101%;
    }
    .ListNewsHeader h4 {
        font-family: tahoma;
        font-size: 13px;
        text-align: center;
        line-height: 25px;
    }
    .ListNewsBody {
        width: 100%;
        border: 1px solid rgb(64,69,51);
        background: #EEEEEE;
    }
    
</style>
<div class="row">
    <div class="span3">
        <uc1:SearchLeft runat="server" id="SearchLeft" />
    </div>
    <div class="span4">
        <ul id="output">
            <li>
                <a href="#" target="_blank">
                    <img src="../Upload/Images/anh1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#" target="_blank">
                    <img src="../Upload/Images/anh2.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#" target="_blank">
                    <img src="../Upload/Images/anh3.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#" target="_blank">
                    <img src="../Upload/Images/anh4.jpg" alt="">
                </a>
            </li>
        </ul>
    </div>
    <div class="span3">
        <div class="feature-news">
            <h1>Tin nổi bật</h1>
            <ul id="tabs">
                <li>
                    <a href="#" target="_blank">Nội dung tin 1</a>
                </li>
                <li>
                    <a href="#" target="_blank">Nội dung tin 2</a>
                </li>
                <li>
                    <a href="#" target="_blank">Nội dung tin 3</a>
                </li>
                <li>
                    <a href="#" target="_blank">Nội dung tin 4</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="row">
    <div class="span7">
        <div class="tabList">
            <div class="tabHeader">
                <h4>Tin rao danh cho bạn</h4>

            </div>
            <div class="tabbody" style="height: 100px; background: #EEEEEE;">
                <p> Khi đó, Messi đã cầm bóng từ giữa sân chếch bên cánh phải, vượt qua 5 cầu thủ đối phương ở phía trước mặt rồi ghi bàn một cách hết sức dễ dàng. Cũng nhờ pha lập công được liệt vào hàng siêu phẩm này, Messi đã được xem là truyền nhân của huyền thoại đồng hương Diego Maradona khi “Cậu bé Vàng” của bóng đá xứ sở Tango từng có pha lập công tương tự vào lưới ĐT Anh tại tứ kết World Cup 1986.</p>
            </div>
        </div>
    </div>
    <div class="span3">
        <div class="ListNews">
            <div class="ListNewsHeader">
                <h4>Thông tin</h4>
            </div>
            <div class="ListNewsBody">
                <ul>
                    <li>
                        <a href="#"> Tin tức 1</a>
                    </li>
                    <li>
                        <a href="#"> Tin tức 1</a>
                    </li>
                    <li>
                        <a href="#"> Tin tức 1</a>
                    </li>
                    <li>
                        <a href="#"> Tin tức 1</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
