<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBoxMain.ascx.cs" Inherits="RealEstate.Modules.SearchBoxMain" %>
<style type="text/css">
    h4 {
        color: #252B16;
    }
</style>
<div class="SearchBox">
    <div class="SearchHeader">
        <h4>Công cụ tìm kiếm</h4>
    </div>
    <div class="SearchBody">
        <div class="tabs">
            <ul class="tab-links">
                <li id="active" class="tabItem"><a href="#tab1">BĐS Bán</a></li>
                <li class="tabItem"><a href="#tab2">BĐS Cho thuê</a></li>
                <li class="tabItem"><a href="#tab3">Môi giới</a></li>
            </ul>
<%--            <asp:DropDownList runat="server" ID="dealerList" ClientIDMode="Static">
                <asp:ListItem>BĐS Bán</asp:ListItem>
                <asp:ListItem>BĐS Cho thuê</asp:ListItem>
                <asp:ListItem>Môi giới</asp:ListItem>
            </asp:DropDownList>--%>
  <%--          <script type="text/javascript">
                $('#dealerList select option').click(function () {
                    //Depend on Value i.e. 0 or 1 respective function gets called. 
                    var currentAttrValue = jQuery(this).attr('href');

                    // Show/Hide Tabs
                    jQuery('.tabs ' + currentAttrValue).show().siblings().hide();

                    // Change/remove current tab to active
                    jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

                    e.preventDefault();
                });
            </script>--%>
            <div class="tab-content">
                <div id="tab1" class="tab active">
                    <p>Tab #1 content goes here!</p>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlRealEstateType" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlCity" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlDistrict" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlArea" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlPrice" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlRegion" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>

                <div id="tab2" class="tab">
                    <p>Tab #2 content goes here!</p>
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
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>

                <div id="tab3" class="tab">
                    <p>Tab #3 content goes here!</p>
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
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>

            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Tìm kiếm" />
            </div>
        </div>
    </div>
</div>

<script src="../js/modules/SearchBoxMain.js"></script>
<link href="../css/Modules/SearchBoxMain.css" rel="stylesheet" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#tab1").hide();
        $("#dealerList option:eq(2)").click(function () {
            $("#tab3").show();
            $("#tab2").hide();
            $("#tab1").hide();
        });
        $("#dealerList option:eq(0)").click(function () {
            $("#tab1").show();
            $("#tab2").hide();
            $("#tab3").hide();
        });
        $("#dealerList option:eq(1)").click(function () {
            $("#tab1").hide();
            $("#tab2").show();
            $("#tab3").hide();
        });
    });
</script>
