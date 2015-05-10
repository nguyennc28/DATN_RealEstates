<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="RealEstate.Controls.Menu" %>
<style type='text/css'>
#nav {
    margin-top: 30px;
    height: 30px;
    background:#404533;
}
#nav ul{
    margin:0px;
    margin-left: -1px;
    padding:0px;
    list-style:none;
	
}
#nav li ul{
	width:150px;	
    background: #818155;
	position:absolute;
	top:30px;
	left:0px;
	z-index:999;
	display:none;
}
#nav li:hover ul{
	display:block;
}
#nav li{
	position:relative;
	display:inline;
	float:left;
}
#nav li li{
	display:block;
	float:none;
}
#nav li a{
    border-left: #C5EDBB 1px solid;
	text-decoration:none;
	color:#fff;
    font-size: 13px;
	float:left;
	height:30px;
	padding:0px 7px;
    line-height: 30px;
}
#nav li li a{
	float:none;
	display:block;
	border-bottom:#999 1px solid;
}
#nav li a:hover{
	background:#E3EDDF;
	color: #055699;
}
</style>
<div class="navbar-inner">
    <div class="container">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse" style="margin-right: -15px;"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a>
        <div class="nav-collapse">            
            <div id="nav">
                <ul>
                    <li> <a href="Default2.aspx?mod=SaleHousing"><img src="Icons/Home_48.png" style="width: 25px; height: 25px;"/></a></li>
                    <asp:Literal ID="ltrMenu" runat="server"></asp:Literal>
                </ul>                
            </div>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>
