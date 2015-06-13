<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="ViewRegister.aspx.cs" Inherits="RealEstate.ViewRegister" %>

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
                <h2>Thông tin mà bạn đã đăng ký</h2>
            </div>
            <h2>Thông tin về tài khoản của bạn</h2>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên đăng nhập:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtUser" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Mật khẩu</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtPass" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ Email:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtEmail" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Họ và tên:</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtFullName" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Giới tính</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtGender" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Ngày Sinh</span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtBirthday" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>

            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtAddress" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtNumberPhone" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span></p>
                </div>
                <div class="span6">
                    <asp:Label ID="txtIdentyCard" runat="server" Text="Label" CssClass="lblInfo"></asp:Label>
                </div>
            </div>


        </div>
    </div>
</asp:Content>
