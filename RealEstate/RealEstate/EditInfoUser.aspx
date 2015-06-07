<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="EditInfoUser.aspx.cs" Inherits="RealEstate.EditInfoUser" %>
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
    #tab1,#tab2,#tab3,#tab4,#tab5{
            margin-top: -10px;
            border: 1px solid olive;
            background: lavender;
    }
    .span6 {
        margin-left: 10px;
    }
    .tittab h2{
        background: olive;
          font-weight: bold;
          color: #fff;
          text-align: center;
    }
    .styleTexbox {
        width: 60%;
    }
    .span9{ text-align: center; margin-left: 50px; padding-bottom: 30px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tabcont">
    <div id="tab1" class="tabcontent" align="justify">
    <asp:ValidationSummary ID="vsSaleHome" runat="server" ShowMessageBox="True" ShowSummary="False"/>
    <div class="tittab">
        <h2> Đăng ký tài khoản </h2>
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
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Nhập lại mật khẩu</span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server" Width="60%"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="Mật khẩu không khớp nhau!"></asp:CompareValidator>
        </div>
    </div>
    
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Địa chỉ Email:</span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtEmail" runat="server" Width="60%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  runat="server" 
                        ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail" 
                        Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Nhập lại Email:</span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtReEmail" runat="server" Width="60%"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtEmail" ErrorMessage="Email không trùng nhau!" ControlToValidate="txtReEmail"></asp:CompareValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  runat="server" 
                        ErrorMessage="Email không hợp lệ" ControlToValidate="txtReEmail" 
                        Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
    </div>
    
    <h2>Thông tin bổ sung:</h2>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Họ và tên:</span></p>
        </div>
        <div class="span6">            
            <asp:TextBox ID="txtFullName" runat="server" Width="60%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Giới tính</span></p>
        </div>
        <div class="span6">
            <asp:RadioButtonList ID="rdGender" runat="server" RepeatDirection="Horizontal" Width="20%">
                <asp:ListItem Value="1"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Nam</span></asp:ListItem>
                <asp:ListItem Value="0"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Nữ</span></asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Ngày Sinh</span></p>
        </div>
        <div class="span6">
            <asp:Calendar ID="cldBirthday" runat="server"></asp:Calendar>
            <%--<p><span>Ngày: </span><asp:DropDownList ID="ddlNgay" runat="server" Width="10%">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem>22</asp:ListItem>
                <asp:ListItem>23</asp:ListItem>
                <asp:ListItem>24</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>26</asp:ListItem>
                <asp:ListItem>27</asp:ListItem>
                <asp:ListItem>28</asp:ListItem>
                <asp:ListItem>29</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList><span>Tháng: </span><asp:DropDownList ID="ddlThang" runat="server" Width="10%">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList><span>Năm: 
                <asp:TextBox ID="txtYear" runat="server" Width="20%"></asp:TextBox>
                </span>
                </p>--%>
        </div>
    </div>
    
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Địa chỉ: </span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtAddress" runat="server" Width="60%"></asp:TextBox>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Số điện thoại: </span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtNumberPhone" runat="server" Width="60%"></asp:TextBox>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtIdentyCard" runat="server" Width="60%"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="span10" style="text-align: center; padding-top: 15px; padding-bottom: 15px;">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/Button/register-button.png" Width="12%" OnClick="ImageButton1_Click"/>
            <asp:ImageButton ID="ImageButton2" runat="server" Width="12%" ImageUrl="~/img/Button/Re-Type.png" OnClick="ImageButton2_Click"/>
        </div>
    </div>
  
</div>
</div>
</asp:Content>
