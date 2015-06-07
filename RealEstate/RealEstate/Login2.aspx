<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="RealEstate.Login2" %>

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
                <h2>ĐĂNG NHẬP HỆ THỐNG </h2>
            </div>
            <h2>Thông tin bắt buộc</h2>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên đăng nhập:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtUserName" runat="server" Width="60%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Mật khẩu</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="60%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="span10" style="text-align: center; padding-top: 15px; padding-bottom: 15px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/Button/login-button.png" Width="12%" OnClick="ImageButton1_Click" />
                    <asp:ImageButton ID="ImageButton2" runat="server" Width="12%" ImageUrl="~/img/Button/Re-Type.png" OnClick="ImageButton2_Click" />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Quên mật khẩu?</asp:LinkButton>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
