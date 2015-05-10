<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Tintuc.aspx.cs" Inherits="RealEstate.Tintuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="hangsp">
<div class="tieudephai">
    <div class="dienthoai"><p>Tin tức</p></div>
    <div class="noidungtin"> 
    <asp:Literal ID="ltrTintuc" runat="server"></asp:Literal>
    <div class="clear"></div>
    <div id="dv_111">
        <div class="dv_paging">
            <asp:Literal ID="ltrpaging" runat="server"></asp:Literal>

        </div>
    </div>
						<%--<a href="#"><img src="img/anhnoidungtin1.jpg" /></a>
						<div class="chitiet">
							<a href="#">Ảo hóa trong Windows Sever 2008 được đẩy mạnh</a>
							<p>Microsoft sẽ cập nhật phiên bản máy chủ hệ điều hành(HĐH) Windows của mình, cung cấp cho HĐH
							nhiều khả năng ảo hóa hơn nữa. Công ty sẽ công bố phiên bản Release Candidate(RC) của bản Service
							Pack 1 (SP1) cho Windowns Sever 2008 R2. Công ty sẽ công bố phiên bản Release Candidate(RC) của bản Service
							Pack 1 (SP1) cho Windowns Sever 2008 R2.
							</p>
						</div>
						<div class="chitiet1">
						<a href="#" >Chi tiết</a>
						<img src="img/iconchitiet1.jpg" />
						</div>--%>
						
	</div>
</div>
</div>
</asp:Content>
