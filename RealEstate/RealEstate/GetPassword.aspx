<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="GetPassword.aspx.cs" Inherits="RealEstate.GetPassword" %>

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
                <h2>LẤY LẠI MẬT KHẨU </h2>
            </div>
            <h2>Thông tin bắt buộc</h2>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Nhập vào địa chỉ Email của bạn:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtEmail" runat="server" Width="60%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                        ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="span10" style="text-align: center; padding-top: 15px; padding-bottom: 15px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/Button/login-button.png" Width="12%" OnClick="ImageButton1_Click" />                                      
                </div>
            </div>

        </div>
    </div>
</asp:Content>
