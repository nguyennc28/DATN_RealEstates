<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home.ascx.cs" Inherits="RealEstate.Modules.Home" %>
<%@ Register Src="~/Modules/SearchBoxMain.ascx" TagPrefix="uc1" TagName="SearchBoxMain" %>
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
    /*ul {
        position: absolute;
        overflow: hidden;
    }

        ul#tabs {
            top: 29px;
            right: 0;
            z-index: 2;
            width: 285px;
            border-right: 1px solid #ccc;
            border-left: 1px solid #ccc;
        }

            ul#tabs li a {
                display: block;
                overflow: hidden;
                height: 67px;
                padding: 5px;
                text-align: justify;
                border-bottom: 1px solid #ccc;
            }

                ul#tabs li a:hover {
                    color: #003399;
                }

                ul#tabs li a.current {
                    color: #003399;
                    font-weight: bold;
                }

        ul#output {
            position: relative;
            left: 0;
            width: 734px;
            height: 297px;
        }

            ul#output li img {
                width: 450px;
                height: 297px;
            }

    .feature-news h1 {
        position: absolute;
        top: 0;
        right: 0;
        z-index: 9;
        width: 285px;
        padding: 6px 0;
        color: #fff;
        text-align: center;
        font-weight: bold;
        text-transform: uppercase;
    }*/
     
</style>
<div class="row">
    <div class="span3">
        <p>Giám đốc điều hành Công ty Savills Việt Nam Nell MacGregor nhận định, thị trường bất động sản (BĐS) hiện đang ở mức đáy nhưng đang trên đà hồi phục, giá cả tương đối hợp lý và ổn định.</p>
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
