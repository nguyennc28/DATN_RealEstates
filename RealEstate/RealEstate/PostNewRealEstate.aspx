<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="PostNewRealEstate.aspx.cs" Inherits="RealEstate.PostNewRealEstate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .lbNameCol {
            font-size: 15px;
            margin-top: 5px;
            color: blue;
            float: right;
        }

        h2 {
            background: olive;
            font-weight: bold;
            color: #fff;
            text-align: center;
        }

        #tab1, #tab2, #tab3, #tab4, #tab5 {
            margin-top: -10px;
            border: 1px solid olive;
            background: lavender;
        }

        .span6 {
            margin-left: 10px;
        }

            .span6 .note {
                color: olive;
            }

        .span9 {
            text-align: center;
            margin-left: 50px;
            padding-bottom: 30px;
        }

        .rdListItem label {
            margin-top: -18px;
            margin-left: 20px;
            color: olive;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: -30px;">
        <h2>Chọn loại bất động sản cần đăng </h2>
    </div>
    <div class="row" style="margin-top: 0px; width: 99.8%;margin-left: 0px;border: 1px solid olive;">
        <div class="span3">
            <p><span class="lbNameCol">Chọn loại bất động sản cần đăng: </span></p>
        </div>
        <div class="span6" style="line-height: 20px;">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PostNewSaleHome.aspx">Nhà bán</asp:HyperLink> <br/>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PostRentHouse.aspx">Nhà cho thuê</asp:HyperLink><br>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/PostSaleLand.aspx">Đất bán</asp:HyperLink><br>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/PostRentLand.aspx">Đất cho thuê</asp:HyperLink><br>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/PostRentMotel.aspx">Nhà trọ</asp:HyperLink><br>
        </div>
    </div>
</asp:Content>
