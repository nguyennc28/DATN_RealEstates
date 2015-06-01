<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SaleApartments.ascx.cs" Inherits="RealEstate.Modules.ModulesHome.SaleApartments" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
<link href="../../css/Modules/ModuleHome/StyleModuleHome.css" rel="stylesheet" />
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

<div class="row">
    <div class="span10">
        <div class="tabbed">
            <ul class="tabnav">
                <li><a href="#tab1">Tìm kiếm Nhà đất</a></li>
            </ul>
        </div>
        <div class="tabcont" style="height: 100px; background: #EEEEEE;">
            <div id="tab1" class="tabcontent" align="justify">
                <div class="span2" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                </div>
                <div class="span2" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlPrice" runat="server"></asp:DropDownList>
                </div>
                <div class="span2" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlArea" runat="server"></asp:DropDownList>
                </div>
                <div class="span2" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlCity" runat="server" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>
                <div class="span2" style="margin-top: 10px;">
                    <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="True"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tabbed" style="margin-top: 5px;">
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
