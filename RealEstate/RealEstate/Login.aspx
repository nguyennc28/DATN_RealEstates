<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RealEstate.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .FrmLogin {
            text-align: center;
            border: 1px solid #D98328;
        }
        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            width: 35%;
            text-align: right;
        }
        .auto-style4 {
            width: 65%;
            height: 30px;
            text-align: left;
        }
        h4 {
            color: #D98328;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="row">
           <div class="row">
            <div class="span10">
                <div class="FrmLogin">
                    <fieldset>
                        <legend>
                            Đăng nhập
                        </legend>

                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2">
                                    <img src="Icons/Login.png" />
                                    <h4>Đăng nhập </h4>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Tên đăng nhập</td>
                                <td class="auto-style4">
                                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Mật khẩu</td>
                                <td class="auto-style4">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1" colspan="2">
                                    <asp:CheckBox ID="cbRemember" runat="server" Text="Ghi nhớ tài khoản" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="2">
                                    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
                                    &nbsp;<asp:Button ID="btnReset" runat="server" Text="Nhập lại" />
                                    <asp:LinkButton ID="LinkButton1" runat="server">Quên mật khẩu?</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="2">
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Icons/facebook_login4.png" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="2">&nbsp;</td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

