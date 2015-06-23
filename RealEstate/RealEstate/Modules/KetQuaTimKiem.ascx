<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KetQuaTimKiem.ascx.cs" Inherits="RealEstate.Modules.KetQuaTimKiem" %>
<style type="text/css">
    .dv_sp_header {
        height: 30px;
        background: #808000;
        text-align: center;
        line-height: 28px;
        margin-top: -30px;
    }
    h3 {
          margin-left: 5px;
          /* margin: 5px; */
          font-size: 15px;
          background: #D0D9F3;
          /* color: blue; */
          width: 99.5%;
          height: 25px;
          line-height: 25px;
          /*border-top: 1px solid grey;*/
       }
</style>
<div class='dv_sp_header'>
       <span style="color: #ffffff; font-size: 16px; font-weight: bold">Kết quả tìm kiếm</span>
</div>

<div class="ketquatimkiem">
     <asp:Literal ID="ltrHome" runat="server"></asp:Literal>
    <div id="Div1">

        <div class="dv_paging">
            <asp:Literal ID="ltrpaging" runat="server"></asp:Literal>

        </div>
    </div>
    <div class="clear"></div>
</div>