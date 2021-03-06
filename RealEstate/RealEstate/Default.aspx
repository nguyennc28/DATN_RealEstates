﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RealEstate.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
    <script type="text/javascript">
        $(function () {

            if (localStorage.getItem('active')) {
                $('.tabbed').find('#' + localStorage.getItem('active')).addClass('Active');
                $('.tabbed').find('a[href=' + localStorage.getItem('active') + ']').parent().addClass('Active');

            }
            else {
                $('.tabbed').find('.tabcontent:first').addClass('Active');
                $('.tabbed').find('.tabnav li:first').addClass('Active');
            }
            $('.tabbed').find('.tabnav li').each(function () {
                $(this).click(function () {
                    ntab = $(this).find('> a').attr('href');
                    localStorage.setItem('active', ntab);
                    $(this).parents('.tabbed').find('.Active').removeClass('Active');
                    $(this).addClass('Active');
                    $(this).parents('.tabbed').find(ntab).addClass('Active');
                    return false;
                });
            });
        })
    </script>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/modules/jquery.featureList-1.0.0.js"></script>
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
    .row {
        margin-top: 5px;
    }
     #output {
         border: 5px solid rgb(214, 219, 233);
     }                
    .tabList {
        width: 99.8%;
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
        width: 650px;
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
        width: 99.5%;
    }
    .ListNewsHeader h4 {
        font-family: tahoma;
        font-size: 13px;
        text-align: center;
        line-height: 25px;
    }
    .ListNewsBody {
        width: 99%;
        border: 1px solid rgb(64,69,51);
        background: #EEEEEE;
    }
    .feature-news {
        background: #EEEEEE;
        line-height: 25px;
        font-size: 15px;
    }
    .span2 h1 {
        background: #404533;
        border-radius: 5px 5px 0 0;
        color: #fff;
        font-size: 18px;
        height: 10px;
        line-height: 8px;
    }
    .span2 #tabs {
        margin: 10px;
    }
    .tabbed {
        width: 240px;
        position: relative;
        width: 70%;
        margin: 0 auto;
    }
    .tabbed  input[type="text"] {
        width: 191px;
    }
    .tabbed  select {
        width: 205px;
    }
    .tabbed .tabcont {
        background: #eee;
        padding: 18px;
        margin-top: 50px;
        height: 300px;
    }

    .tabbed .tabcont .tabcontent {
        display: none;
        position: relative;
        line-height: 20px;
    }

    .tabbed .tabcont .tabcontent img {
        max-width: 100%;
    }

    .tabbed .tabcont .tabcontent.Active {
        display: block;
    }

    .tabnav {
        position: absolute;
        left: 0;
        width: 100%;
        border-bottom: 1px solid #eee;
    }

    .tabnav li {
        float: left;
        background: #404533;
        text-align: center;
        height: 50px;
    }

    .tabnav li a {
        height: 35px;
        line-height: 17px;
        padding: 0 14px;
        margin-top: 15px;
        border-radius: 5px 5px 0 0;
        font-size: 13px;
        font-weight: bold;
        display: block;
        color: #fff;
    }
    .tabnav li.Active a {
        background: #eee;
        color: #376405;
    }

    .tabtit {
        background: #252B16;
        height: 50px;
        font-size: 18px;
        text-align: center;
        border-radius: 7px 7px 0 0;
        line-height: 48px;
        color: #fff;
    }
    .tabcontent {
        text-align: center;
        background: #EEEEEE;
    }
    .searchTb {
        margin-top: 10px;
    }
    .banner_main_left {
        margin-top: 5px;
    }
    .news_main {
        height: 155px;
        background: #E6EBF9;
        margin-top: 5px;
    }
    .news_main ul li {
        color: blue;
    }
    
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top: -30px;">
    <div class="span2">
        <div class="tabhead">
            <h2 class="tabtit">
                <img src="/Icons/searchnha.png" style="width: 45px; float: left; margin-top: 2px; margin-left: 8px;" />
                Công cụ tìm kiếm </h2>
            <div class="tabcont">
                <div id="tab1" class="tabcontent" align="justify">
                    <div style="height: 20px;">
                    </div>
                    <div style="height: 320px;">
                        <span class="searchTb">
                            <asp:TextBox ID="txtSearchKeyword1" runat="server"></asp:TextBox>
                        </span>

                        <span class="searchDdl">
                            <asp:DropDownList ID="ddlRealEstateType" runat="server">
                            </asp:DropDownList></span>

                        <span class="searchDdl">
                            <asp:DropDownList ID="ddlCitySl" runat="server" OnSelectedIndexChanged="ddlCitySl_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList></span>

                        <span class="searchDdl">
                            <asp:DropDownList ID="ddlDistrictSl" runat="server" AutoPostBack="True">
                            </asp:DropDownList></span>

                        <span class="searchDdl">
                            <asp:DropDownList ID="ddlAreaSl" runat="server">
                            </asp:DropDownList></span>

                        <span class="searchDdl">
                            <asp:DropDownList ID="ddlPriceSl" runat="server">
                            </asp:DropDownList></span>

                        <span class="searchDdl">
                            <asp:DropDownList ID="ddlBetroomNum" runat="server">                           
                            </asp:DropDownList></span>

                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../img/Button/btTimkiem.png" OnClick="ImageButton1_OnClick" />
                    </div>                    
                </div>
            </div>
        </div>   
        <div class="span2" style="margin: 6px 0px;">
            <a href="#"> <img src="/Upload/Banner/A8A-DR_960x90.gif" /></a>
        </div>    
        <div class="span2" style="margin-left: 0px;">
            <a href="#"> <img src="/Upload/Banner/banner_top_batdongsan.gif" /></a>
        </div>         
    </div>
    <div class="span5">
        <ul id="output">            
            <asp:Literal ID="ltrImagesLink" runat="server"></asp:Literal>
        </ul>
        <div class="news_main">
            <%--<marquee scrollamount="2" scrolldelay="98" direction="up" onmouseover="this.stop()" onmouseout="this.start()">--%>
            <ul>
                <asp:Literal ID="ltrTextLink2" runat="server"></asp:Literal>
            </ul>
            <%--</marquee>--%>
        </div>
    </div>
    <div class="span2">
        <div class="feature-news">
            <h1>Tin nổi bật</h1>
            <marquee scrollamount="2" scrolldelay="98" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
            <ul id="tabs">
                <asp:Literal ID="ltrTextLink" runat="server"></asp:Literal>
            </ul></marquee>
        </div>
        <div class="banner_main_left">
            <a href="PostNewRE.aspx" alt="Đăng tin rao bất động sản của bạn"><img src="/Upload/Banner/banner_2.gif" style="width: 100%" /></a>
        </div>
    </div>
    
</div>
<div class="row" style="   margin-left: -7px; margin-top: 5px; margin-bottom: 5px;">
    <div class="span10">
        <a href="#"> <img src="/img/BannerMoving/BNN.gif"/></a>
    </div>
</div>

<div class="row">
    <div class="span7">
        <div class="tabList">
            <div class="tabHeader">
                <h4>Tin rao danh cho bạn</h4>

            </div>
            <div class="tabbody" style="height: 100%; background: #EEEEEE;">
                <asp:Literal ID="ltrTab1" runat="server"></asp:Literal>
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
         <div class="ListNews">
            <div class="ListNewsHeader">
                <h4>Thông tin</h4>
            </div>
            <div class="ListNewsBody">
                <asp:Literal ID="ltrBroker" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</div>
</asp:Content>
