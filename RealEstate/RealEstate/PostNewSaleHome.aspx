﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="PostNewSaleHome.aspx.cs" Inherits="RealEstate.PostNewSaleHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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

        #tab1, #tab2, #tab3, #tab4, #tab5 {
            margin-top: -10px;
            border: 1px solid olive;
            background: lavender;
        }

        .span6 {
            margin-left: 10px;
        }

            .span6 .note {
                color: olive;
            }

        .span9 {
            text-align: center;
            margin-left: 50px;
            padding-bottom: 30px;
        }

        .rdListItem label {
            margin-top: -18px;
            margin-left: 20px;
            color: olive;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ID="vsSaleHome" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <div class="tabcont" style="margin-top: -30px;">

        <div id="tab1" class="tabcontent" align="justify">

            <%-- Đăng thông tin của chủ sở hữu nhà bán --%>
            <div>
                <h2>Đăng thông tin chủ sở hữu </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtRealEstateOwner1" runat="server"></asp:TextBox><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtRealEstateOwner1" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giấy chứng nhận quyền sự dụng đất: </span></p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdCLUR1" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="rdListItem">
                        <asp:ListItem Value="Có">Có</asp:ListItem>
                        <asp:ListItem Value="Không">Không</asp:ListItem>

                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Chủ sở hữu là: </span></p>
                </div>
                <div class="span6" style="color: red;">
                    <asp:RadioButtonList ID="rdRealEstateOwnerType1" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="rdListItem">
                        <asp:ListItem Value="Cá nhân">Cá nhân</asp:ListItem>
                        <asp:ListItem Value="Doanh nghiệp">Doanh nghiệp</asp:ListItem>
                        <asp:ListItem Value="Doanh nghiệp">Dự án nhà nước</asp:ListItem>

                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Giới tính: </span></p>
                </div>
                <div class="span6">
                    <asp:RadioButtonList ID="rdGender1" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="rdListItem">
                        <asp:ListItem Value="Nam">Nam</asp:ListItem>
                        <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Địa chỉ liên hệ của bạn: </span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtAddress2" ErrorMessage="Bạn phải nhập vào địa chỉ của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số chứng minh thư nhân dân: </span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtIdentyCard1" runat="server"></asp:TextBox><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtIdentyCard1" ErrorMessage="Bạn phải nhập vào số chứng minh thư của bạn!">*(bắt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số điện thoại liên hệ của bạn: </span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtMobilePhone1" runat="server"></asp:TextBox><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtMobilePhone1" ErrorMessage="Bạn phải nhập vào số điện thoại liên hệ!">*(bắt buộc)</asp:RequiredFieldValidator></span>
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
                <h2>Đăng thông tin bán nhà của bạn </h2>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="span3">
                    <p><span class="lbNameCol">Loại nhà:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl">
                        <asp:DropDownList ID="ddlHomeType1" runat="server">
                        </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">BĐS:</span></p>
                </div>
                <div class="span6">
                    <span class="searchDdl">
                        <asp:DropDownList ID="ddlRealEstate1" runat="server">
                        </asp:DropDownList></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTenChuSoHuu1" runat="server"></asp:TextBox><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenChuSoHuu1" ErrorMessage="Bạn phải nhập vào họ tên!">*(bắt buộc)</asp:RequiredFieldValidator></span>
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
                        <p>
                            <span>Tỉnh(Thành phố): </span><span class="searchDdl">
                                <asp:DropDownList ID="ddlCity1" runat="server" OnSelectedIndexChanged="ddlCity1_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList></span>
                        </p>
                    </div>
                    <div class="row">
                        <p>
                            <span>Huyện(Quận): </span><span class="searchDdl">
                                <asp:DropDownList ID="ddlDistrict1" runat="server" AutoPostBack="True">
                                </asp:DropDownList></span>
                        </p>
                    </div>
                    <div class="row">
                        <p><span>Số nhà, đường, xã(phường): </span>
                            <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress1" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
                    </div>

                </div>

            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Mô tả: </span></p>
                </div>
                <div class="span6">
                    <%--<asp:TextBox ID="txtDescription" runat="server" Height="148px" Width="511px"></asp:TextBox>--%>
                    <CKEditor:CKEditorControl ID="txtDescription1" runat="server"></CKEditor:CKEditorControl>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="span3">
                    <p><span class="lbNameCol">Tổng diện tích:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtArea1" runat="server"></asp:TextBox><span class="note"> m2</span><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtArea1" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Diện tích nền:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtFloorArea1" runat="server"></asp:TextBox>
                    <span class="note">m2</span><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFloorArea1" ErrorMessage="Bạn phải nhập vào diện tích nền">*(băt buộc)</asp:RequiredFieldValidator></span>
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
                    <asp:TextBox ID="txtPrice1" runat="server"></asp:TextBox><span class="note"> VNĐ</span> <span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice1" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số phòng ngủ:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtBetroomNum1" runat="server"></asp:TextBox><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBetroomNum1" ErrorMessage="Bạn phải nhập vào số phòng ngủ">*(băt buộc)</asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="row">
                <div class="span3">
                    <p><span class="lbNameCol">Số tầng:</span></p>
                </div>
                <div class="span6">
                    <asp:TextBox ID="txtTierNumber1" runat="server"></asp:TextBox><span class="err">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTierNumber1" ErrorMessage="Bạn phải nhập vào số tầng của nhà">*(băt buộc)</asp:RequiredFieldValidator></span>
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
        </div>
    </div>

         <%-- Đăng thông tin cho thuê nhà của bạn --%>
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
</asp:Content>
