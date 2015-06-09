<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="PostNewRE.aspx.cs" Inherits="RealEstate.PostNewRE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/Modules/PostNewsRE/PostNewsRentHome.ascx" TagPrefix="uc1" TagName="PostNewsRentHome" %>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
<link href="css/Modules/ModuleHome/StyleModuleHome.css" rel="stylesheet" />

<script type="text/javascript">
    $(function () {

        if (localStorage.getItem('active')) {
            $('.tabbed').find('#' + localStorage.getItem('active')).addClass('active');
            $('.tabbed').find('a[href=' + localStorage.getItem('active') + ']').parent().addClass('active');

        }
        else {
            $('.tabbed').find('.tabcontent:first').addClass('active');
            $('.tabbed').find('.tabnav li:first').addClass('active');
        }
        $('.tabbed').find('.tabnav li').each(function () {
            $(this).click(function () {
                ntab = $(this).find('> a').attr('href');
                localStorage.setItem('active', ntab);
                $(this).parents('.tabbed').find('.active').removeClass('active');
                $(this).addClass('active');
                $(this).parents('.tabbed').find(ntab).addClass('active');
                return false;
            });
        });
    })
</script>
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
    
    <div class="tabbed" style="margin-top: -30px;">
    <ul class="tabnav">

        <li><a href="#tab1">Đăng tin bán nhà</a></li>

        <li><a href="#tab2">Đăng tin cho thuê nhà</a></li>

        <li><a href="#tab3">Đăng tin bán đất</a></li>

        <li><a href="#tab4">Đăng tin cho thuê đất</a></li>

        <li><a href="#tab5">Đăng tin cho thuê trọ</a></li>

    </ul>
    <div class="tabcont">

        <div id="tab1" class="tabcontent" align="justify">
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
                    <asp:TextBox ID="txtRealEstateOwner1" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtRealEstateOwner1" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giấy chứng nhận quyền sự dụng đất: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdCLUR1" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:RadioButtonList ID="rdRealEstateOwnerType1" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:RadioButtonList ID="rdGender1" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtAddress2" ErrorMessage="Bạn phải nhập vào địa chỉ của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtIdentyCard1" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtIdentyCard1" ErrorMessage="Bạn phải nhập vào số chứng minh thư của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại liên hệ của bạn: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtMobilePhone1" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtMobilePhone1" ErrorMessage="Bạn phải nhập vào số điện thoại liên hệ!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="span3">
                <p><span class="lbNameCol">Địa chỉ Email liên hệ:</span></p>
            </div>
            <div class="span6">
                <asp:TextBox ID="txtEmail1" runat="server" Width="60%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
                    ControlToValidate="txtEmail1" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                    ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail1"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <%-- Đăng thông tin bán nhà của bạn --%>
            <div style="margin-top: 50px;">
                <h2> Đăng thông tin bán nhà của bạn </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại nhà:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlHomeType1" runat="server" >
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">BĐS:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlRealEstate1" runat="server">
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenChuSoHuu1" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenChuSoHuu1" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên nhà:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenNha1" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ: </span></p>
                </div>
                <div class="span6">
                    <div class="row">
                         <p><span>Tỉnh(Thành phố): </span><span class="searchDdl"><asp:DropDownList ID="ddlCity1" runat="server" OnSelectedIndexChanged="ddlCity1_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Huyện(Quận): </span><span class="searchDdl"><asp:DropDownList ID="ddlDistrict1" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Số nhà, đường, xã(phường): </span><asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress1" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
                    </div>
                    
                </div>
    
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <%--<asp:TextBox ID="txtDescription" runat="server" Height="148px" Width="511px"></asp:TextBox>--%>
                    <ckeditor:ckeditorcontrol id="txtDescription1" runat="server"></ckeditor:ckeditorcontrol>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tổng diện tích:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtArea1" runat="server"></asp:TextBox><span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtArea1" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Diện tích nền:</span></p> 
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtFloorArea1" runat="server"></asp:TextBox> <span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFloorArea1" ErrorMessage="Bạn phải nhập vào diện tích nền">*(băt buộc)</asp:RequiredFieldValidator></span>
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
                    <asp:TextBox ID="txtPrice1" runat="server"></asp:TextBox><span> VNĐ</span> <span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice1" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số phòng ngủ:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtBetroomNum1" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBetroomNum1" ErrorMessage="Bạn phải nhập vào số phòng ngủ">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số tầng:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTierNumber1" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTierNumber1" ErrorMessage="Bạn phải nhập vào số tầng của nhà">*(băt buộc)</asp:RequiredFieldValidator></span>
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
                    <asp:ImageButton ID="btnPostNewRE" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnPostNewRE_Click" Width="150px"/>
                    <asp:ImageButton ID="btnCencelPostNewRE" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px"/>
                </div>
            </div>
            <asp:Literal ID="ltrTab1" runat="server"></asp:Literal>

        </div>

        <div id="tab2" class="tabcontent" align="justify">
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
                    ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail1"
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
                        <p><span>Số nhà, đường, xã(phường): </span><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtAddress2" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
                    </div>
                    
                </div>
    
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <%--<asp:TextBox ID="txtDescription2" runat="server" Height="148px" Width="511px"></asp:TextBox>--%>
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
                    <input id="oFile21" type="file" runat="server" NAME="oFile21"/>
                    <asp:button ID="btnUploadImage21" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages21" runat="server" Text="Label" Visible="False"></asp:Label>
                    <%--<span class="err">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="oFile21" ErrorMessage="Chỉ cho phép tải lên các file có định dạng như sau: jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP" ValidationExpression="/^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$/"></asp:RegularExpressionValidator></span>--%>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage21" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages21" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 2:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile22" type="file" runat="server" NAME="oFile22"/>
                    <asp:button ID="btnUploadImage22" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages22" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage22" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages22" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 3:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile23" type="file" runat="server" NAME="oFile23"/>
                    <asp:button ID="btnUploadImage23" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages23" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage23" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages23" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 4:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile24" type="file" runat="server" NAME="oFile24"/>
                    <asp:button ID="btnUploadImage24" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages24" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage24" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages24" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 5:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile25" type="file" runat="server" NAME="oFile25"/>
                    <asp:button ID="btnUploadImage25" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages25" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage25" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages25" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 6:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile26" type="file" runat="server" NAME="oFile26"/>
                    <asp:button ID="btnUploadImage26" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages26" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage26" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages26" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="span9">
                    <asp:ImageButton ID="btnRentHouse" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnRentHouse_Click" Width="150px"/>
                    <asp:ImageButton ID="btnCencelRentHouse" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px"/>
                </div>
            </div>

        </div>

        <div id="tab3" class="tabcontent" align="justify">
             <%-- Đăng thông tin của chủ sở hữu nhà bán --%>
            <div>
                <h2> Đăng thông tin chủ sở hữu </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtRealEstateOwner3" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtRealEstateOwner3" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giấy chứng nhận quyền sự dụng đất: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdCLUR3" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:RadioButtonList ID="rdRealEstateOwnerType3" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:RadioButtonList ID="rdGender3" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:TextBox ID="txtAddress32" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtAddress32" ErrorMessage="Bạn phải nhập vào địa chỉ của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtIdentyCard3" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtIdentyCard3" ErrorMessage="Bạn phải nhập vào số chứng minh thư của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại liên hệ của bạn: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtMobilePhone3" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtMobilePhone3" ErrorMessage="Bạn phải nhập vào số điện thoại liên hệ!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="span3">
                <p><span class="lbNameCol">Địa chỉ Email liên hệ:</span></p>
            </div>
            <div class="span6">
                <asp:TextBox ID="txtEmail3" runat="server" Width="60%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server"
                    ControlToValidate="txtEmail3" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                    ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail1"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <%-- Đăng thông tin bán nhà của bạn --%>
            <div style="margin-top: 50px;">
                <h2> Đăng thông tin bán đất của bạn </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại đất:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlLandType3" runat="server" >
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">BĐS:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlRealEstate3" runat="server">
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenChuSoHuu3" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtTenChuSoHuu3" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên nhà:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenNha3" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ: </span></p>
                </div>
                <div class="span6">
                    <div class="row">
                         <p><span>Tỉnh(Thành phố): </span><span class="searchDdl"><asp:DropDownList ID="ddlCity3" runat="server" OnSelectedIndexChanged="ddlCity3_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Huyện(Quận): </span><span class="searchDdl"><asp:DropDownList ID="ddlDistrict3" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Số nhà, đường, xã(phường): </span><asp:TextBox ID="txtAddress3" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtAddress3" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
                    </div>
                    
                </div>
    
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <%--<asp:TextBox ID="txtDescription3" runat="server" Height="148px" Width="511px"></asp:TextBox>--%>
                    <ckeditor:ckeditorcontrol id="txtDescription3" runat="server"></ckeditor:ckeditorcontrol>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tổng diện tích:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtArea3" runat="server"></asp:TextBox><span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtArea3" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
           
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giá:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtPrice3" runat="server"></asp:TextBox><span> VNĐ</span> <span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtPrice3" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
           
            
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 1:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile31" type="file" runat="server" NAME="oFile31"/>
                    <asp:button ID="btnUploadImage31" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages31" runat="server" Text="Label" Visible="False"></asp:Label>
                    <%--<span class="err">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="oFile31" ErrorMessage="Chỉ cho phép tải lên các file có định dạng như sau: jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP" ValidationExpression="/^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$/"></asp:RegularExpressionValidator></span>--%>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage31" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages31" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 2:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile32" type="file" runat="server" NAME="oFile32"/>
                    <asp:button ID="btnUploadImage32" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage32" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages32" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 3:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile33" type="file" runat="server" NAME="oFile33"/>
                    <asp:button ID="btnUploadImage33" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages33" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage33" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages33" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 4:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile34" type="file" runat="server" NAME="oFile34"/>
                    <asp:button ID="btnUploadImage34" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages34" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage34" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages34" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 5:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile35" type="file" runat="server" NAME="oFile35"/>
                    <asp:button ID="btnUploadImage35" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages35" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage35" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages35" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 6:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile36" type="file" runat="server" NAME="oFile36"/>
                    <asp:button ID="btnUploadImage36" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages36" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage36" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages36" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="span9">
                    <asp:ImageButton ID="btnSaleLand" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnSaleLand_Click" Width="150px"/>
                    <asp:ImageButton ID="btnCencelbtnSaleLand" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px"/>
                </div>
            </div>
        </div>

        <div id="tab4" class="tabcontent" align="justify">
             <%-- Đăng thông tin của chủ sở hữu nhà bán --%>
            <div>
                <h2> Đăng thông tin chủ sở hữu </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtRealEstateOwner4" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtRealEstateOwner4" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giấy chứng nhận quyền sự dụng đất: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdCLUR4" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:RadioButtonList ID="rdRealEstateOwnerType4" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:RadioButtonList ID="rdGender4" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:TextBox ID="txtAddress42" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtAddress42" ErrorMessage="Bạn phải nhập vào địa chỉ của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtIdentyCard4" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtIdentyCard4" ErrorMessage="Bạn phải nhập vào số chứng minh thư của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại liên hệ của bạn: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtMobilePhone4" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtMobilePhone4" ErrorMessage="Bạn phải nhập vào số điện thoại liên hệ!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="span3">
                <p><span class="lbNameCol">Địa chỉ Email liên hệ:</span></p>
            </div>
            <div class="span6">
                <asp:TextBox ID="txtEmail4" runat="server" Width="60%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server"
                    ControlToValidate="txtEmail4" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                    ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail1"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <%-- Đăng thông tin đất cho thuê của bạn --%>
            <div style="margin-top: 50px;">
                <h2> Đăng thông tin đất cho thuê của bạn </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại đất:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlLandType4" runat="server" >
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">BĐS:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlRealEstate4" runat="server">
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenChuSoHuu4" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtTenChuSoHuu4" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên đất:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenNha4" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ: </span></p>
                </div>
                <div class="span6">
                    <div class="row">
                         <p><span>Tỉnh(Thành phố): </span><span class="searchDdl"><asp:DropDownList ID="ddlCity4" runat="server" OnSelectedIndexChanged="ddlCity4_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Huyện(Quận): </span><span class="searchDdl"><asp:DropDownList ID="ddlDistrict4" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Số nhà, đường, xã(phường): </span><asp:TextBox ID="txtAddress4" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtAddress4" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
                    </div>
                    
                </div>
    
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <%--<asp:TextBox ID="txtDescription4" runat="server" Height="148px" Width="511px"></asp:TextBox>--%>
                    <ckeditor:ckeditorcontrol id="txtDescription4" runat="server"></ckeditor:ckeditorcontrol>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tổng diện tích:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtArea4" runat="server"></asp:TextBox><span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtArea4" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
           
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giá:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtPrice4" runat="server"></asp:TextBox><span> VNĐ</span> <span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="txtPrice4" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
           
            
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 1:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile41" type="file" runat="server" NAME="oFile41"/>
                    <asp:button ID="btnUploadImage41" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages41" runat="server" Text="Label" Visible="False"></asp:Label>
                    <%--<span class="err">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="oFile41" ErrorMessage="Chỉ cho phép tải lên các file có định dạng như sau: jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP" ValidationExpression="/^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$/"></asp:RegularExpressionValidator></span>--%>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage41" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages41" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 2:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile42" type="file" runat="server" NAME="oFile42"/>
                    <asp:button ID="btnUploadImage42" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage42" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages42" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 3:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile43" type="file" runat="server" NAME="oFile43"/>
                    <asp:button ID="btnUploadImage43" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages43" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage43" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages43" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 4:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile44" type="file" runat="server" NAME="oFile44"/>
                    <asp:button ID="btnUploadImage44" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages44" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage44" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages44" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 5:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile45" type="file" runat="server" NAME="oFile45"/>
                    <asp:button ID="btnUploadImage45" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages45" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage45" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages45" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 6:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile46" type="file" runat="server" NAME="oFile46"/>
                    <asp:button ID="btnUploadImage46" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages46" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage46" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages46" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="span9">
                    <asp:ImageButton ID="btnRentLand" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnRentLand_Click" Width="150px"/>
                    <asp:ImageButton ID="btnCencelbtnRentLand" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px"/>
                </div>
            </div>
        </div>

        <div id="tab5" class="tabcontent" align="justify">
             <%-- Đăng thông tin của chủ sở hữu nhà bán --%>
            <div>
                <h2> Đăng thông tin chủ sở hữu </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtRealEstateOwner5" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtRealEstateOwner5" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giấy chứng nhận quyền sự dụng đất: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdCLUR5" runat="server" RepeatDirection="Horizontal" Width="20%">
                        <asp:ListItem Value="Có"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Có</span></asp:ListItem>
                        <asp:ListItem Value="Không"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Không</span></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Loại chủ sở hữu: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdRealEstateOwnerType5" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:RadioButtonList ID="rdGender5" runat="server" RepeatDirection="Horizontal" Width="20%">
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
                    <asp:TextBox ID="txtAddress52" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="txtAddress52" ErrorMessage="Bạn phải nhập vào địa chỉ của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtIdentyCard5" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtIdentyCard5" ErrorMessage="Bạn phải nhập vào số chứng minh thư của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại liên hệ của bạn: </span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtMobilePhone5" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtMobilePhone5" ErrorMessage="Bạn phải nhập vào số điện thoại liên hệ!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="span3">
                <p><span class="lbNameCol">Địa chỉ Email liên hệ:</span></p>
            </div>
            <div class="span6">
                <asp:TextBox ID="txtEmail5" runat="server" Width="60%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server"
                    ControlToValidate="txtEmail5" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                    ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail1"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <%-- Đăng thông tin nhà trọ của bạn --%>
            <div style="margin-top: 50px;">
                <h2> Đăng thông tin nhà trọ của bạn </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại nhà trọ:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlMotelType5" runat="server" >
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">BĐS:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl"><asp:DropDownList ID="ddlRealEstate5" runat="server">
                                            </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenChuSoHuu5" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="txtTenChuSoHuu5" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên nhà trọ:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenNha5" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Khép kín: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdIsClose" runat="server" RepeatDirection="Horizontal" Width="20%">
                        <asp:ListItem Value="1"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Có</span></asp:ListItem>
                        <asp:ListItem Value="0"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Không</span></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Bếp riêng: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdIsCooker" runat="server" RepeatDirection="Horizontal" Width="20%">
                        <asp:ListItem Value="1"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Có</span></asp:ListItem>
                        <asp:ListItem Value="0"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Không</span></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Nội thất: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdFurniture" runat="server" RepeatDirection="Horizontal" Width="20%">
                        <asp:ListItem Value="1"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -25px; margin-right: 15px;">Có</span></asp:ListItem>
                        <asp:ListItem Value="0"><span style="float: right; margin-top: -18px; color: #676563; margin-left: -15px;">Không</span></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ: </span></p>
                </div>
                <div class="span6">
                    <div class="row">
                         <p><span>Tỉnh(Thành phố): </span><span class="searchDdl"><asp:DropDownList ID="ddlCity5" runat="server" OnSelectedIndexChanged="ddlCity5_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Huyện(Quận): </span><span class="searchDdl"><asp:DropDownList ID="ddlDistrict5" runat="server" AutoPostBack="True">
                                            </asp:DropDownList></span></p>
                    </div>
                    <div class="row">
                        <p><span>Số nhà, đường, xã(phường): </span><asp:TextBox ID="txtAddress5" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtAddress5" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
                    </div>
                    
                </div>
    
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <%--<asp:TextBox ID="txtDescription5" runat="server" Height="148px" Width="511px"></asp:TextBox>--%>
                    <ckeditor:ckeditorcontrol id="txtDescription5" runat="server"></ckeditor:ckeditorcontrol>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tổng diện tích:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtArea5" runat="server"></asp:TextBox><span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtArea5" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
           
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giá:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtPrice5" runat="server"></asp:TextBox><span> VNĐ</span> <span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtPrice5" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Thuộc tầng số:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTierNum" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 1:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile51" type="file" runat="server" name="oFile51" />
                    <asp:Button ID="btnUploadImage51" type="submit" Text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages51" runat="server" Text="Label" Visible="False"></asp:Label>
                    <%--<span class="err">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="oFile51" ErrorMessage="Chỉ cho phép tải lên các file có định dạng như sau: jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP" ValidationExpression="/^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$/"></asp:RegularExpressionValidator></span>--%>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage51" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages51" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 2:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile52" type="file" runat="server" NAME="oFile52"/>
                    <asp:button ID="btnUploadImage52" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage52" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages52" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 3:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile53" type="file" runat="server" NAME="oFile53"/>
                    <asp:button ID="btnUploadImage53" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages53" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage53" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages53" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 4:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile54" type="file" runat="server" NAME="oFile54"/>
                    <asp:button ID="btnUploadImage54" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages54" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage54" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages54" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 5:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile55" type="file" runat="server" NAME="oFile55"/>
                    <asp:button ID="btnUploadImage55" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages55" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage55" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages55" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Ảnh 6:</span></p>
                </div>
                <div class="span6">
                    <input id="oFile56" type="file" runat="server" NAME="oFile56"/>
                    <asp:button ID="btnUploadImage56" type="submit" text="Upload" runat="server"></asp:button>
                    <asp:Label ID="lblImages56" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div style="width: 100%;">
                        <asp:Literal ID="ltrUploadResultImage56" runat="server"></asp:Literal>
                        <asp:Label ID="lbImages56" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="span9">
                    <asp:ImageButton ID="btnRentMotel" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnRentMotel_Click" Width="150px"/>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px"/>
                </div>
            </div>
        </div>
    </div>
</div>
    
</asp:Content>
