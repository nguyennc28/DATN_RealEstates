<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchLeft.ascx.cs" Inherits="RealEstate.Modules.SearchLeft" %>
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
<style type="text/css">
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
        height: 330px;
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
</style>
<div class="tabbed" style="width: 240px; margin-left: -1px;">
    <div class="tabhead">
        <h2 class="tabtit">
            <img src="/Icons/searchnha.png" style="width: 45px; float: left; margin-top: 2px; margin-left: 8px;" />
            Công cụ tìm kiếm </h2>
        <ul class="tabnav">
            <li style="width: 50px;"><a href="#tab1">BĐS bán </a></li>
            <li style="width: 85px;"><a href="#tab2">BĐS cho thuê</a></li>
            <li style="width: 50px;"><a href="#tab3">Nhà trọ</a></li>
            <li style="width: 55px;"><a href="#tab4">Môi giới</a></li>
        </ul>
    </div>
    <div class="tabcont">
        <div id="tab1" class="tabcontent" align="justify">

                                <span class="searchTb"><asp:TextBox ID="txtSearchKeyword1" runat="server"></asp:TextBox> </span>

                                <span class="searchDdl"><asp:DropDownList ID="ddlRealEstateType" runat="server">
                                </asp:DropDownList></span>

                                <span class="searchDdl"><asp:DropDownList ID="ddlCitySl" runat="server" OnSelectedIndexChanged="ddlCitySl_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList></span>

                                <span class="searchDdl"><asp:DropDownList ID="ddlDistrictSl" runat="server" AutoPostBack="True">
                                </asp:DropDownList></span>

                                <span class="searchDdl"><asp:DropDownList ID="ddlAreaSl" runat="server">
                                </asp:DropDownList></span>

                                <span class="searchDdl"><asp:DropDownList ID="ddlPriceSl" runat="server">
                                </asp:DropDownList></span>

                                <span class="searchDdl"><asp:DropDownList ID="ddlRegionSl" runat="server">
                                </asp:DropDownList></span>
                
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../img/Button/btTimkiem.png" OnClick="ImageButton1_OnClick"/>

        </div>

        <div id="tab2" class="tabcontent" align="justify">
            <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList4" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList5" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList6" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../img/Button/btTimkiem.png"/></td>
                        </tr>
                    </table>
        </div>

        <div id="tab3" class="tabcontent" align="justify">
            <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList7" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList8" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList9" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList10" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList11" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList12" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="../img/Button/btTimkiem.png"/></td>
                        </tr>
                    </table>
        </div>

        <div id="tab4" class="tabcontent" align="justify">
            <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList13" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList14" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList15" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList16" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList17" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList18" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../img/Button/btTimkiem.png"/></td>
                        </tr>
                    </table>
        </div>
    </div>
</div>