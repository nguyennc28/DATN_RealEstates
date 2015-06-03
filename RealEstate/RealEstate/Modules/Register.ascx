<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="RealEstate.Modules.Register" %>

<div id="tab1" class="tabcontent" align="justify">
    <asp:ValidationSummary ID="vsSaleHome" runat="server" ShowMessageBox="True" ShowSummary="False"/>
    <div>
        <h2> Đăng ký tài khoản </h2>
    </div>
    <h2>Thông tin bắt buộc</h2>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Tên đăng nhập:</span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Mật khẩu</span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Nhập lại mật khẩu</span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="Mật khẩu không khớp nhau!"></asp:CompareValidator>
        </div>
    </div>
    
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Địa chỉ Email:</span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
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
            <asp:TextBox ID="txtReEmail" runat="server"></asp:TextBox>
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
            <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Giới tính</span></p>
        </div>
        <div class="span6">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Nam</asp:ListItem>
                <asp:ListItem>Nữ</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Ngày Sinh</span></p>
        </div>
        <div class="span6">
            <p><span>Ngày: </span><asp:DropDownList ID="ddlNgay" runat="server">
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
                <asp:ListItem></asp:ListItem>
                </asp:DropDownList><span>Tháng: </span><asp:DropDownList ID="ddlThang" runat="server">
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
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList><span>Năm: 
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </span>
                </p>
        </div>
    </div>
    
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Địa chỉ: </span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Số điện thoại: </span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtNumberPhone" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="span3">
            <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span></p>
        </div>
        <div class="span6">
            <asp:TextBox ID="txtIdentyCard" runat="server"></asp:TextBox>
        </div>
    </div>
  
</div>














































<table align="center" cellpadding="2" cellspacing="0" class="BaoFrame" width= "700px">
      
        <tr>
            <td align="right" style="padding-right: 30px" colspan="2">
             <asp:Button ID="btReset" runat="server" Text="Làm lại" 
                    CssClass="Button" />
                <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" 
                    onclick="btnDangKy_Click" CssClass="Button" />
            </td>
        </tr>
        <tr>
            <td align="left" style="padding-right: 30px" colspan="2">
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>