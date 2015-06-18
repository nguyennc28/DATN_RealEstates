<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="PostRentMotel.aspx.cs" Inherits="RealEstate.PostRentMotel" %>
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
            margin-top: -30px;
            border: 1px solid olive;
            background: lavender;
    }
    .span6 {
        margin-left: 10px;
    }
    .span9{ text-align: center; margin-left: 50px; padding-bottom: 30px;}
    .rdListItem label {
            margin-top: -18px;
            margin-left: 20px;
            color: olive;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ID="vsSaleHome" runat="server" ShowMessageBox="True" ShowSummary="False"/>
     <%-- Đăng thông tin của chủ sở hữu nhà bán --%>
    <div id="tab1" class="tabcontent" align="justify">
            <div >
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
                    <asp:RadioButtonList ID="rdCLUR5" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="rdListItem">
                        <asp:ListItem Value="Có">Có</asp:ListItem>
                        <asp:ListItem Value="Không">Không</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Loại chủ sở hữu: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdRealEstateOwnerType5" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="rdListItem">
                        <asp:ListItem Value="Cá nhân">Cá nhân</asp:ListItem>
                        <asp:ListItem Value="Doanh nghiệp">Doanh nghiệp</asp:ListItem>
                        <asp:ListItem Value="Doanh nghiệp">Dự án nhà nước</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giới tính: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdGender5" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="rdListItem">
                        <asp:ListItem Value="Nam">Nam</asp:ListItem>
                        <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
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
                    ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail5"
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
                        <asp:ListItem Value="1">Nhà trọ Sinh viên</asp:ListItem>
                        <asp:ListItem Value="2">Nhà trọ VIP</asp:ListItem>
                        <asp:ListItem Value="3">Khách sạn</asp:ListItem>
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
                    <asp:RadioButtonList ID="rdIsClose" runat="server" RepeatDirection="Horizontal" Width="20%" CssClass="rdListItem">
                        <asp:ListItem Value="1">Có</asp:ListItem>
                        <asp:ListItem Value="0">Không</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Bếp riêng: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdIsCooker" runat="server" RepeatDirection="Horizontal" Width="20%" CssClass="rdListItem">
                        <asp:ListItem Value="1">Có</asp:ListItem>
                        <asp:ListItem Value="0">Không</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Nội thất: </span> </p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdFurniture" runat="server" RepeatDirection="Horizontal" Width="20%" CssClass="rdListItem">
                        <asp:ListItem Value="1">Có</asp:ListItem>
                        <asp:ListItem Value="0">Không</asp:ListItem>
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
                    <p><span class="lbNameCol">Tổng diện tích: </span></p>
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
                    <asp:ImageButton ID="btnRentMotel" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnRentMotel_Click" Width="150px"/>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" Width="150px"/>
                </div>
            </div>
    </div>
</asp:Content>
