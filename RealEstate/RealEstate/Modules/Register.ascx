<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="RealEstate.Modules.Register" %>
<table align="center" cellpadding="2" cellspacing="0" class="BaoFrame" width= "700px">
        <tr>
            <td class="style2" colspan="2" 
                style="background-color: #0066CC; color: #FFFFFF; font-weight: bold">
                ĐĂNG KÝ THÀNH VIÊN</td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                Tên đăng nhập:</td>
            <td align="left">
                <asp:TextBox ID="txtTenDangNhap" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTenDangNhap" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                Mật khẩu:</td>
            <td align="left">
                <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtMatKhau" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                Xác nhận mật khẩu:</td>
            <td align="left">
                <asp:TextBox ID="txtXacNhanMK" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtXacNhanMK" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                Email:</td>
            <td align="left">
                <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  runat="server" 
                        ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail" 
                        Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                Xác nhận Email:</td>
            <td align="left">
                <asp:TextBox ID="txtXacNhanEmail" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtXacNhanEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  runat="server" 
                        ErrorMessage="Email không hợp lệ" ControlToValidate="txtXacNhanEmail" 
                        Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                Họ và tên:</td>
            <td align="left">
                <asp:TextBox ID="txtHoVaTen" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtHoVaTen" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 30px">
                Điện thoại:</td>
            <td align="left">
                <asp:TextBox ID="txtDienThoai" runat="server"  Width="250px"></asp:TextBox>
            </td>
        </tr>
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