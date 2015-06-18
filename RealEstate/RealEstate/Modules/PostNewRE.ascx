<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostNewRE.ascx.cs" Inherits="RealEstate.Modules.PostNewRE" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
<link href="../../css/Modules/ModuleHome/StyleModuleHome.css" rel="stylesheet" />



<link href="../css/uploadify.css" rel="stylesheet" />
<script src="../Scripts/jquery-1.3.2.min.js"></script>
<script src="../Scripts/jquery.uploadify.js"></script>
<script type="text/javascript">
    $(function () {

        if (localStorage.getItem('active')) {
            $('.tabbed').find('#' + localStorage.getItem('active')).addClass('Active');
            $('.tabbed').find('a[href=' + localStorage.getItem('active') + ']').parent().addClass('Active');

        }
        else {
            $('.tabbed').find('.tabcontent:first').addClass('Active');
            $('.tabbed').find('.tabnav li:first').addClass('Active');
        }
        $('.tabbed').find('.tabnav li').each(function () {
            $(this).click(function () {
                ntab = $(this).find('> a').attr('href');
                localStorage.setItem('active', ntab);
                $(this).parents('.tabbed').find('.Active').removeClass('Active');
                $(this).addClass('Active');
                $(this).parents('.tabbed').find(ntab).addClass('Active');
                return false;
            });
        });
    })
</script>
<script type = "text/javascript">
    $(window).load(
        function () {
            $("#<%=FileUpload1.ClientID%>").fileUpload({
            'uploader': 'Scripts/uploader.swf',
            'cancelImg': 'img/cancel.png',
            'buttonText': 'Browse Files',
            'script': 'Upload.ashx',
            'folder': 'Upload',
            'fileDesc': 'Image Files',
            'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
            'multi': true,
            'auto': false
        });
    }
);
</script> 


<div class="tabbed" style="margin-top: 5px;">
    <ul class="tabnav">

        <li><a href="#tab1">Đăng tin bán nhà</a></li>

        <li><a href="#tab2">Đăng tin cho thuê nhà</a></li>

        <li><a href="#tab3">Đăng tin bán đất</a></li>

        <li><a href="#tab4">Đăng tin cho thuê đất</a></li>

        <li><a href="#tab5">Đăng tin cho thuê trọ</a></li>

    </ul>
    <div class="tabcont">

        <div id="tab1" class="tabcontent" align="justify">
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:Literal ID="ltrTab1" runat="server"></asp:Literal>

        </div>

        <div id="tab2" class="tabcontent" align="justify">

            <asp:Literal ID="ltrTab2" runat="server"></asp:Literal>
        </div>
        <div id="tab3" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab3" runat="server"></asp:Literal>
        </div>

        <div id="tab4" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab4" runat="server"></asp:Literal>
        </div>

        <div id="tab5" class="tabcontent" align="justify">
            <asp:Literal ID="ltrTab5" runat="server"></asp:Literal>
        </div>
    </div>
</div>

<asp:ValidationSummary ID="vsSaleHome" runat="server" />
<div>
    <h2> Đăng thông tin bán nhà của bạn </h2>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Loại nhà:</span></p>
    </div>
    <div class="span7">
        <span class="searchDdl"><asp:DropDownList ID="ddlHomeType" runat="server">
                                </asp:DropDownList></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Tên chủ sở hữu:</span> </p>

    </div>
    <div class="span7">
        <asp:TextBox ID="txtTenChuSoHuu" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenChuSoHuu" ErrorMessage="Bạn phải nhập vào họ tên!">*(yêu cầu)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Tên nhà:</span></p>
    </div>
    <div class="span7">
        <asp:TextBox ID="txtTenNha" runat="server"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Địa chỉ: </span></p>
    </div>
    <div class="span7">
        <div class="span2">
            <p><span>Tỉnh(Thành phố): </span><span class="searchDdl"><asp:DropDownList ID="ddlCity" runat="server">
                                </asp:DropDownList></span></p>
        </div>
        <div class="span2">
            <p><span>Huyện(Quận): </span><span class="searchDdl"><asp:DropDownList ID="ddlDistrict" runat="server">
                                </asp:DropDownList></span></p>
            
        </div>
        <p><span>Số nhà, đường, xã(phường)</span><asp:TextBox ID="txtAddress" runat="server"></asp:TextBox><span class="err"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span></p>
    </div>
    
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Mô tả: </span></p>
    </div>
    <div class="span7">
        <asp:TextBox ID="txtDescription" runat="server" Height="148px" Width="511px"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Tổng diện tích:</span></p>
    </div>
    <div class="span7">
        <asp:TextBox ID="txtArea" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtArea" ErrorMessage="Bạn phải nhập vào tổng diện tích">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Diện tích nền:</span></p> 
    </div>
    <div class="span7">
        <asp:TextBox ID="txtFloorArea" runat="server"></asp:TextBox> <span> m2</span><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFloorArea" ErrorMessage="Bạn phải nhập vào diện tích nền">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<%--<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Diện tích vườn:</span></p>
    </div>
    <div class="span7">
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox> <span> m2</span>
    </div>
</div>--%>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Giá:</span></p>
    </div>
    <div class="span7">
        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox><span> VNĐ</span> <span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="Bạn phải nhập vào giá cả">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Số phòng ngủ:</span></p>
    </div>
    <div class="span7">
        <asp:TextBox ID="txtBetroomNum" runat="server"></asp:TextBox><span class="err"> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBetroomNum" ErrorMessage="Bạn phải nhập vào số phòng ngủ">*(băt buộc)</asp:RequiredFieldValidator></span>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Số tầng:</span></p>
    </div>
    <div class="span7">
        <asp:TextBox ID="txtTierNumber" runat="server"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="span3">
        <p><span class="lbNameCol">Ảnh 1:</span></p>
    </div>
    <div class="span7">
        <a href="javascript:$('#<%=FileUpload1.ClientID%>').fileUploadStart()">Tải lên ảnh</a>&nbsp; 
           |&nbsp;<a href="javascript:$('#<%=FileUpload1.ClientID%>').fileUploadClearQueue()">Xóa</a> 
            <div style = "padding:40px">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
    </div>
</div>
<div class="row">
    <div class="span7">
        <asp:ImageButton ID="btnPostNewRE" runat="server" ImageUrl="~/Icons/btnPostNewRE.png" OnClick="btnPostNewRE_Click" />
        <asp:ImageButton ID="btnCencelPostNewRE" runat="server" ImageUrl="~/Icons/btnCencelPostNewRE.png" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </div>
</div>