<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SaleWareHouse.ascx.cs" Inherits="RealEstate.Modules.ModulesHome.SaleWareHouse" %>
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

<%--<div class="row">
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
</div>--%>
<div class="row">
    <asp:Literal ID="ltrTab1" runat="server"></asp:Literal>
</div>
   

        