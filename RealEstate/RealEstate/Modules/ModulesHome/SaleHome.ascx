<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SaleHome.ascx.cs" Inherits="RealEstate.Modules.ModulesHome.SaleHome" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
<script type="text/javascript">
    $(function () {

        if (localStorage.getItem('active')) {
            $('.tabbed').find('#' + localStorage.getItem('active')).addClass('active');
            $('.tabbed').find('a[href=' + localStorage.getItem('active') + ']').parent().addClass('active');

        }
        else {
            $('.tabbed').find('.tabcontent:first').addClass('active');
            $('.tabbed').find('.tabnav li:first').addClass('active');
        }
        $('.tabbed').find('.tabnav li').each(function () {
            $(this).click(function () {
                ntab = $(this).find('> a').attr('href');
                localStorage.setItem('active', ntab);
                $(this).parents('.tabbed').find('.active').removeClass('active');
                $(this).addClass('active');
                $(this).parents('.tabbed').find(ntab).addClass('active');
                return false;
            });
        });
    })
</script>
<style type="text/css">
    .tabbed {
        padding: 30px 0 0;
        position: relative;
        width: 100%;
        margin: 0 auto;
    }

    .tabbed .tabcont {
         background: #eee;
         padding: 20px;
    }

    .tabbed .tabcont .tabcontent {
        display: none;
        position: relative;
        line-height: 20px;
    }

    .tabbed .tabcont .tabcontent img {
            max-width: 100%;
    }

    .tabbed .tabcont .tabcontent.active {
            display: block;
    }

    .tabnav {
        position: absolute;
        left: 0;
        top: -1px;
        width: 100%;
        border-bottom: 1px solid #eee;
    }

    .tabnav li {
        float: left;
    }

    .tabnav li a {
        height: 30px;
        line-height: 30px;
        padding: 0 14px;
        font-size: 13px;
        font-weight: bold;
        border-radius: 5px 5px 0 0;
        display: block;
        color: #3E9409;
    }

    .tabnav li.active a {
        background: #8BC015;
        color: #B82121;;
    }
</style>


<div class="row">
    <div class="span10">
        <div class="span3">
            <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
        </div>
        <div class="span3">
            <asp:DropDownList ID="ddlPrice" runat="server"></asp:DropDownList>
        </div>
        <div class="span3">
            <asp:DropDownList ID="ddlArea" runat="server"></asp:DropDownList>
        </div>
        <div class="span3">
            <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
        </div>
    </div>
</div>

<div class="tabbed">
    <ul class="tabnav">

        <li><a href="#tab1">Tất cả Tin rao</a></li>

        <li><a href="#tab2">Tin rao mới nhất</a></li>

        <li><a href="#tab3">Tin rao có hình</a></li>

        <li><a href="#tab4">Tin rao có video</a></li>

        <li><a href="#tab5">Xem bản đồ</a></li>

    </ul>
    <div class="tabcont">

        <div id="tab1" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab1" runat="server"></asp:Literal>

        </div>

        <div id="tab2" class="tabcontent" align="justify">
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
</div>
