<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SaleHome.ascx.cs" Inherits="RealEstate.Modules.ModulesHome.SaleHome" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
<link href="../../css/Modules/ModuleHome/StyleModuleHome.css" rel="stylesheet" />
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

<style type="text/css">
    #bigPic {
        width: 300px;
        height: 225px;
        padding: 1px;
        border: 1px solid #CCC;
        background-color: #FFF;
        margin-bottom: 10px;
    }

        #bigPic img {
            position: absolute;
            display: none;
        }

    ul#smallPic li.Active {
        border: 2px solid #000;
        background: #fff;
        padding: 2px;
    }

    ul#smallPic, ul#smallPic li {
        margin: 0;
        padding: 0;
        list-style: none;
    }

        ul#smallPic li {
            float: left;
            margin-right: 7px;
            margin-bottom: 5px;
            border: 1px solid #CCC;
            padding: 3px;
            cursor: pointer;
        }

        ul#smallPic img {
            float: left;
            width: 88px;
            /*height:80px;*/
            line-height: 80px;
            overflow: hidden;
            position: relative;
            z-index: 1;
        }
        h3 {
          margin-left: 5px;
          /* margin: 5px; */
          font-size: 15px;
          background: #D0D9F3;
          /* color: blue; */
          width: 99.5%;
          height: 25px;
          line-height: 25px;
          border-top: 1px solid grey;
       }
        .span6 {
        margin-left: 10px;
         }
    h2 {
        text-align: center;
        color: #ffffff;
        background: #808000;
        font-size: 16px;
        font-weight: bold;
     }
        .row .row {
        line-height: 25px;
    }
</style>

<div class="row" style="
    margin-top: -30px;
">
    <div class="span10">
        <div class="tabbed">
            <ul class="tabnav">
                <li><a href="#tab1">Tìm kiếm Nhà đất</a></li>
            </ul>
        </div>
        <div class="tabcont" style="height: 100px; background: #EEEEEE;">
            <div id="tab1" class="tabcontent" align="justify">
                <div class="span3" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                </div>
                <div class="span3" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlPrice" runat="server"></asp:DropDownList>
                </div>
                <div class="span3" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlArea" runat="server"></asp:DropDownList>
                </div>
                <div class="span3" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="tabbed" style="margin-top: 5px;">
    <ul class="tabnav">

        <li><a href="#tab1">Tất cả Tin rao</a></li>

        <li><a href="#tab2">Tin rao mới nhất</a></li>

        <li><a href="#tab3">Tin rao có hình</a></li>

        <li><a href="#tab4">Tin rao có video</a></li>

        <li><a href="#tab5">Xem bản đồ</a></li>

    </ul>
    <div class="tabcont">

        <div id="tab1" class="tabcontent" align="justify">--%>
<div class="row" style=" margin-left: 0px; border: 1px solid grey;">
    <h2> Tin rao bán nhà </h2>
    
    <asp:Literal ID="ltrHome" runat="server"></asp:Literal>
</div>

<div class="row" style="margin-left: -5px;">
    <% if (listHome.Count == 0)
        {%>
    <p>Dữ liệu đang được cập nhật </p>
    <%} %>
    <%
        else
        {%>
    <% for (int i = 0; i < listHome.Count; i++)
        {%>
    <div class="span3">
        <div id="bigPic">
            <img src="<% =listHome[i].Image1 %>" alt="" />
            <img src="<% =listHome[i].Image2 %>" alt="" />
            <img src="<% =listHome[i].Image3 %>" alt="" />
        </div>
        <ul id="smallPic">
            <li class="Active" rel="1">
                <img src="<% =listHome[i].Image1 %>" alt="" />
            </li>
            <li rel="2">
                <img src="<% =listHome[i].Image2 %>" alt="" /></li>
            <li rel="3">
                <img src="<% =listHome[i].Image3 %>" alt="" /></li>
        </ul>
    </div>
    <%} %>
    <%} %>
        
</div>
<div class="row" style="margin-left: 10px; margin-top: 5px;">
    <asp:Literal ID="ltrTab1" runat="server"></asp:Literal>

</div>

<%--<div id="tab2" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab2" runat="server"></asp:Literal>
        </div>
        <div id="tab3" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab3" runat="server"></asp:Literal>
        </div>

        <div id="tab4" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab4" runat="server"></asp:Literal>
        </div>

        <div id="tab5" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab5" runat="server"></asp:Literal>
        </div>
    </div>
</div>--%>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
<script type="text/javascript">
    var currentImage;
    var currentIndex = -1;
    var interval;

    function showImage(index) {
        if (index < $('#bigPic img').length) {
            var indexImage = $('#bigPic img')[index];
            if (currentImage) {
                if (currentImage != indexImage) {
                    $(currentImage).css('z-index', 2);
                    clearTimeout(myTimer);
                    $(currentImage).fadeOut(250, function () {
                        myTimer = setTimeout("showNext()", 3000);
                        $(this).css({ 'display': 'none', 'z-index': 1 });
                    });
                }
            }
            $(indexImage).css({ 'display': 'block', 'opacity': 1 });
            currentImage = indexImage;
            currentIndex = index;
            $('#smallPic li').removeClass('Active');
            $($('#smallPic li')[index]).addClass('Active');
        }
    }

    function showNext() {
        var len = $('#bigPic img').length;
        var next = currentIndex < (len - 1) ? currentIndex + 1 : 0;
        showImage(next);
    }

    var myTimer;
    $(document).ready(function () {
        myTimer = setTimeout("showNext()", 3000);
        showNext();
        $('#smallPic li').bind('click', function (e) {
            var count = $(this).attr('rel');
            showImage(parseInt(count) - 1);
        });
    });
</script>
