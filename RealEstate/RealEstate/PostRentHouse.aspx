<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="PostRentHouse.aspx.cs" Inherits="RealEstate.PostRentHouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
    <link href="css/Modules/ModuleHome/StyleModuleHome.css" rel="stylesheet" />
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
    #tab1,#tab2,#tab3,#tab4,#tab5{
            margin-top: -10px;
            border: 1px solid olive;
            background: lavender;
    }
    .span6 {
        margin-left: 10px;
    }
    .span9{ text-align: center; margin-left: 50px; padding-bottom: 30px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ID="vsSaleHome" runat="server" ShowMessageBox="True" ShowSummary="False"/>
    <%-- Đăng thông tin của chủ sở hữu nhà bán --%>
            <div>
                <h2> Đăng thông tin chủ sở hữu </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtRealEstateOwner2" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRealEstateOwner2" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giấy chứng nhận quyền sự dụng đất: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdCLUR2" runat="server" RepeatDirection="Horizontal" Width="20%">
                        <asp:ListItem Value="Có"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Có</span></asp:ListItem>
                        <asp:ListItem Value="Không"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Không</span></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giới tính: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdRealEstateOwnerType2" runat="server" RepeatDirection="Horizontal" Width="20%">
                        <asp:ListItem Value="Cá nhân"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Cá nhân</span></asp:ListItem>
                        <asp:ListItem Value="Doanh nghiệp"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Doanh nghiệp</span></asp:ListItem>
                        <asp:ListItem Value="Doanh nghiệp"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Dự án nhà nước</span></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giới tính: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdGender2" runat="server" RepeatDirection="Horizontal" Width="20%">
                        <asp:ListItem Value="Nam"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Nam</span></asp:ListItem>
                        <asp:ListItem Value="Nữ"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Nữ</span></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ liên hệ của bạn: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtAddress22" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAddress22" ErrorMessage="Bạn phải nhập vào địa chỉ của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtIdentyCard2" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtIdentyCard2" ErrorMessage="Bạn phải nhập vào số chứng minh thư của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại liên hệ của bạn: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtMobilePhone2" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtMobilePhone2" ErrorMessage="Bạn phải nhập vào số điện thoại liên hệ!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="span3">
                <p><span class="lbNameCol">Địa chỉ Email liên hệ:</span></p>
            </div>
            <div class="span6">
                <asp:TextBox ID="txtEmail2" runat="server" Width="60%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                    ControlToValidate="txtEmail2" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                    ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail2"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <%-- Đăng thông tin bán nhà của bạn --%>
            <div style="margin-top: 50px;">
                <h2> Đăng thông tin thuê nhà của bạn </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại nhà:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlHomeType2" runat="server" >
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">BĐS:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlRealEstate2" runat="server">
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenChuSoHuu2" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtTenChuSoHuu2" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên nhà:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenNha2" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ: </span></p>
                </div>
                <div class="span6">
                    <div class="row">
                         <p><span>Tỉnh(Thành phố): </span><span class="searchDdl"><asp:DropDownList ID="ddlCity2" runat="server" OnSelectedIndexChanged="ddlCity2_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Huyện(Quận): </span><span class="searchDdl"><asp:DropDownList ID="ddlDistrict2" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Số nhà, đường, xã(phường): </span><asp:TextBox ID="txtAddress2a" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtAddress2a" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
                    </div>
                    
                </div>
    
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <ckeditor:ckeditorcontrol id="txtDescription2" runat="server"></ckeditor:ckeditorcontrol>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tổng diện tích:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtArea2" runat="server"></asp:TextBox><span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtArea2" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Diện tích nền:</span></p> 
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtFloorArea2" runat="server"></asp:TextBox> <span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtFloorArea2" ErrorMessage="Bạn phải nhập vào diện tích nền">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
          
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giá:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtPrice2" runat="server"></asp:TextBox><span> VNĐ</span> <span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtPrice2" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số phòng ngủ:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtBetroomNum2" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtBetroomNum2" ErrorMessage="Bạn phải nhập vào số phòng ngủ">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số tầng:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTierNumber2" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtTierNumber2" ErrorMessage="Bạn phải nhập vào số tầng của nhà">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
             <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 1:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile" type="file" runat="server" NAME="oFile"/>
                    <asp:button ID="btnUploadImage" type="submit" text="Upload" runat="server"></asp:button>
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
                    <input id="oFile2" type="file" runat="server" NAME="oFile2"/>
                    <asp:button ID="btnUploadImage2" type="submit" text="Upload" runat="server"></asp:button>
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
                    <input id="oFile3" type="file" runat="server" NAME="oFile3"/>
                    <asp:button ID="btnUploadImage3" type="submit" text="Upload" runat="server"></asp:button>
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
                    <input id="oFile4" type="file" runat="server" NAME="oFile4"/>
                    <asp:button ID="btnUploadImage4" type="submit" text="Upload" runat="server"></asp:button>
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
                    <input id="oFile5" type="file" runat="server" NAME="oFile5"/>
                    <asp:button ID="btnUploadImage5" type="submit" text="Upload" runat="server"></asp:button>
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
                    <input id="oFile6" type="file" runat="server" NAME="oFile6"/>
                    <asp:button ID="btnUploadImage6" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages6" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage6" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages6" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="span9">
                    <asp:ImageButton ID="btnRentHouse" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnRentHouse_Click" Width="150px"/>
                    <asp:ImageButton ID="btnCencelRentHouse" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px"/>
                </div>
            </div>
</asp:Content>
