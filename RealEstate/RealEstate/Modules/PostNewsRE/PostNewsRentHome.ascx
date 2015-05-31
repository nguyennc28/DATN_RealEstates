<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostNewsRentHome.ascx.cs" Inherits="RealEstate.Modules.PostNewsRE.PostNewsRentHome" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<%--<asp:ValidationSummary ID="vsSaleHome" runat="server" />--%>
<div>
    <h2>Đăng thông tin bán nhà của bạn </h2>
</div>
<div class="row" style="margin-top: 20px;">
    <div class="span3">
        <p><span class="lbNameCol">Loại nhà:</span></p>
    </div>
    <div class="span6">
        <span class="searchDdl">
            <asp:DropDownList ID="ddlHomeType" runat="server">
            </asp:DropDownList></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">BĐS:</span></p>
    </div>
    <div class="span6">
        <span class="searchDdl">
            <asp:DropDownList ID="ddlRealEstate" runat="server">
            </asp:DropDownList></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

    </div>
    <div class="span6">
        <asp:TextBox ID="txtTenChuSoHuu" runat="server"></asp:TextBox><span class="err">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenChuSoHuu" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Tên nhà:</span></p>
    </div>
    <div class="span6">
        <asp:TextBox ID="txtTenNha" runat="server"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Địa chỉ: </span></p>
    </div>
    <div class="span6">
        <div class="row">
            <p>
                <span>Tỉnh(Thành phố): </span><span class="searchDdl">
                    <asp:DropDownList ID="ddlCity" runat="server">
                    </asp:DropDownList></span>
            </p>
        </div>
        <div class="row">
            <p>
                <span>Huyện(Quận): </span><span class="searchDdl">
                    <asp:DropDownList ID="ddlDistrict" runat="server">
                    </asp:DropDownList></span>
            </p>
        </div>
        <div class="row">
            <p><span>Số nhà, đường, xã(phường): </span>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
        </div>

    </div>

</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Mô tả: </span></p>
    </div>
    <div class="span6">
        <%--<asp:TextBox ID="txtDescription" runat="server" Height="148px" Width="511px"></asp:TextBox>--%>
        <ckeditor:ckeditorcontrol id="txtDescription" runat="server"></ckeditor:ckeditorcontrol>
    </div>
</div>
<div class="row" style="margin-top: 10px;">
    <div class="span3">
        <p><span class="lbNameCol">Tổng diện tích:</span></p>
    </div>
    <div class="span6">
        <asp:TextBox ID="txtArea" runat="server"></asp:TextBox><span> m2</span><span class="err">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtArea" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Diện tích nền:</span></p>
    </div>
    <div class="span6">
        <asp:TextBox ID="txtFloorArea" runat="server"></asp:TextBox>
        <span>m2</span><span class="err">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFloorArea" ErrorMessage="Bạn phải nhập vào diện tích nền">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<%--<div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Diện tích vườn:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox> <span> m2</span>
                </div>
            </div>--%>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Giá:</span></p>
    </div>
    <div class="span6">
        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox><span> VNĐ</span> <span class="err">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Số phòng ngủ:</span></p>
    </div>
    <div class="span6">
        <asp:TextBox ID="txtBetroomNum" runat="server"></asp:TextBox><span class="err">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBetroomNum" ErrorMessage="Bạn phải nhập vào số phòng ngủ">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Số tầng:</span></p>
        <span class="err">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBetroomNum" ErrorMessage="Bạn phải nhập vào số tầng của nhà">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
    <div class="span6">
        <asp:TextBox ID="txtTierNumber" runat="server"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Ảnh 1:</span></p>
    </div>
    <div class="span6">
        <input id="oFile" type="file" runat="server" name="oFile" />
        <asp:Button ID="btnUploadImage" type="submit" Text="Upload" runat="server"></asp:Button>
        <asp:Label ID="lblImages" runat="server" Text="Label" Visible="False"></asp:Label>
        <%--<span class="err">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="oFile" ErrorMessage="Chỉ cho phép tải lên các file có định dạng như sau: jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP" ValidationExpression="/^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$/"></asp:RegularExpressionValidator></span>--%>
        <div style="width: 100%;">
            <asp:Literal ID="ltrUploadResultImage" runat="server"></asp:Literal>
            <asp:Label ID="lbImages1" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Ảnh 2:</span></p>
    </div>
    <div class="span6">
        <input id="oFile2" type="file" runat="server" name="oFile2" />
        <asp:Button ID="btnUploadImage2" type="submit" Text="Upload" runat="server"></asp:Button>
        <asp:Label ID="lblImages2" runat="server" Text="Label" Visible="False"></asp:Label>
        <div style="width: 100%;">
            <asp:Literal ID="ltrUploadResultImage2" runat="server"></asp:Literal>
            <asp:Label ID="lbImages2" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Ảnh 3:</span></p>
    </div>
    <div class="span6">
        <input id="oFile3" type="file" runat="server" name="oFile3" />
        <asp:Button ID="btnUploadImage3" type="submit" Text="Upload" runat="server"></asp:Button>
        <asp:Label ID="lblImages3" runat="server" Text="Label" Visible="False"></asp:Label>
        <div style="width: 100%;">
            <asp:Literal ID="ltrUploadResultImage3" runat="server"></asp:Literal>
            <asp:Label ID="lbImages3" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Ảnh 4:</span></p>
    </div>
    <div class="span6">
        <input id="oFile4" type="file" runat="server" name="oFile4" />
        <asp:Button ID="btnUploadImage4" type="submit" Text="Upload" runat="server"></asp:Button>
        <asp:Label ID="lblImages4" runat="server" Text="Label" Visible="False"></asp:Label>
        <div style="width: 100%;">
            <asp:Literal ID="ltrUploadResultImage4" runat="server"></asp:Literal>
            <asp:Label ID="lbImages4" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Ảnh 5:</span></p>
    </div>
    <div class="span6">
        <input id="oFile5" type="file" runat="server" name="oFile5" />
        <asp:Button ID="btnUploadImage5" type="submit" Text="Upload" runat="server"></asp:Button>
        <asp:Label ID="lblImages5" runat="server" Text="Label" Visible="False"></asp:Label>
        <div style="width: 100%;">
            <asp:Literal ID="ltrUploadResultImage5" runat="server"></asp:Literal>
            <asp:Label ID="lbImages5" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Ảnh 6:</span></p>
    </div>
    <div class="span6">
        <input id="oFile6" type="file" runat="server" name="oFile6" />
        <asp:Button ID="btnUploadImage6" type="submit" Text="Upload" runat="server"></asp:Button>
        <asp:Label ID="lblImages6" runat="server" Text="Label" Visible="False"></asp:Label>
        <div style="width: 100%;">
            <asp:Literal ID="ltrUploadResultImage6" runat="server"></asp:Literal>
            <asp:Label ID="lbImages6" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</div>

<div class="row">
    <div class="span9">
        <asp:ImageButton ID="btnPostNewRE" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnPostNewRE_Click" Width="150px" />
        <asp:ImageButton ID="btnCencelPostNewRE" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px" />
    </div>
</div>
