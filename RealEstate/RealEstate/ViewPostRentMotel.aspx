<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="ViewPostRentMotel.aspx.cs" Inherits="RealEstate.ViewPostRentMotel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Modules/ModuleHome/StyleModuleHome.css" rel="stylesheet" />
    <style type="text/css">
        .lbNameCol {
            font-size: 15px;
            margin-top: 5px;
            color: blue;
            float: right;
        }

        .tabcont {
            margin-top: -35px;
        }

            .tabcont h2 {
                background: #D0D9F3;
                font-weight: bold;
                color: blue;
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

        .tittab h2 {
            background: olive;
            font-weight: bold;
            color: #fff;
            text-align: center;
        }

        .styleTexbox {
            width: 60%;
        }
        .lblInfo {
            color: olive;
            font-weight: bold;
        }
        .span9 {
            text-align: center;
            margin-left: 50px;
            padding-bottom: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tabcont">
        <div id="tab1" class="tabcontent" align="justify">
            <asp:ValidationSummary ID="vsSaleHome" runat="server" ShowMessageBox="True" ShowSummary="False" />
            <div class="tittab">
                <h2>Thông tin chủ sở hữu đăng ký</h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtRealEstateOwner" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <%--<div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Mật khẩu</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtPass" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>--%>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Giấy chứng nhận quyền sự dụng đất: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtCLUR5" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại chủ sở hữu:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtRealEstateOwnerType" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Giới tính: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="txtGender" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ liên hệ của bạn:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtAddress" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtIdentyCard" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>

            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại liên hệ của bạn: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtMobilePhone" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ Email liên hệ: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtEmail" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
           
            
            <div class="tittab">
                <h2>Thông tin nhà trọ của bạn</h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại nhà trọ:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtMotelType" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <%--<div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Mật khẩu</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtPass" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>--%>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">BĐS:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtRealEstate" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtTenChuSoHuu5" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <%--<div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh đại diện: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </div>
            </div>--%>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên nhà trọ:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtTenNha" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Khép kín: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtIsClose" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>

            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Bếp riêng: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtIsCooker" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Nội thất: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtFurniture" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtAddress1" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtDes" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tổng diện tích: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtArea" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Giá: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Thuộc tầng số: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtThuocTang" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 1: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="ltrAnh1" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 2: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="ltrAnh2" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 3: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="ltrAnh3" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 4: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="ltrAnh4" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 5: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="ltrAnh5" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 6: </span></p>
                </div>
                <div class="span6">
                    <asp:Literal ID="ltrAnh6" runat="server"></asp:Literal>
                </div>
            </div>        
        </div>
    </div>
</asp:Content>
