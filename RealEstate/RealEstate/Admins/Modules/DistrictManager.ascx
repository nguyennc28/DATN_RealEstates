<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DistrictManager.ascx.cs" Inherits="RealEstate.Admins.Modules.DistrictManager" %>
<div class="ErrMsg">
        <asp:Literal ID="Msg" runat="server"></asp:Literal>
    </div>
    <div class="PageName">Quản lý Quận(Huyện, Thị xã)</div>
    <asp:Panel ID="pnView" runat="server">
        <div class="Control">
            <ul>
                <li>
                    <asp:LinkButton CssClass="vadd" ID="lbtAddT"
                        runat="server" OnClick="AddButton_Click">Thêm mới</asp:LinkButton></li>
                <li>
                    <asp:LinkButton CssClass="vdelete" ID="lbtDeleteT" runat="server"
                        OnClick="DeleteButton_Click">Xóa</asp:LinkButton></li>
                <li>
                    <asp:LinkButton CssClass="vrefresh" ID="lbtRefreshT" runat="server"
                        OnClick="RefreshButton_Click">Làm mới</asp:LinkButton></li>
                <li><a class="vback" href="javascript:void(0);" onclick="window.history.go(-1);">Trở lại</a> </li>
            </ul>
        </div>
        <asp:DataGrid ID="grdUser" runat="server" Width="100%" CssClass="TableView"
            AutoGenerateColumns="False"
            OnItemCommand="grdUser_ItemCommand" OnItemDataBound="grdUser_ItemDataBound"
            OnPageIndexChanged="grdUser_PageIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <FooterStyle BackColor="Tan" />
            <HeaderStyle CssClass="trHeader" BackColor="Tan" Font-Bold="True"></HeaderStyle>
            <ItemStyle CssClass="trOdd"></ItemStyle>
            <AlternatingItemStyle CssClass="trEven" BackColor="PaleGoldenrod"></AlternatingItemStyle>
            <Columns>
                <asp:TemplateColumn ItemStyle-CssClass="tdCenter">
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="False"></asp:CheckBox>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server"></asp:CheckBox>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdCenter"></ItemStyle>
                </asp:TemplateColumn>

                <asp:BoundColumn DataField="DistrictID" HeaderText="DistrictID" Visible="True" />

                <asp:BoundColumn DataField="CityName" HeaderText="Tên Tỉnh(Thành phố)" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                
                <asp:BoundColumn DataField="DistrictName" HeaderText="Tên Quận(Huyện, Thị xã)" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>

                <asp:TemplateColumn ItemStyle-CssClass="Function">
                    <HeaderTemplate>Chức năng</HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="cmdEdit" runat="server" AlternateText="Sửa" CommandName="Edit" CssClass="Edit" ToolTip="Sửa" ImageUrl="/App_Themes/Admin/images/edit.png" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"DistrictID")%>' />
                        <asp:ImageButton ID="cmdDelete" runat="server" AlternateText="Xóa" CommandName="Delete" CssClass="Delete" ToolTip="Xóa" ImageUrl="/App_Themes/Admin/images/delete.png" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"DistrictID")%>' OnClientClick="javascript:return confirm('Bạn có muốn xóa?');" />
                    </ItemTemplate>
                    <ItemStyle CssClass="Function" />
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:DataGrid>
        <div class="Control">
            <ul>
                <li>
                    <asp:LinkButton CssClass="vadd" ID="lbtAddB"
                        runat="server" OnClick="AddButton_Click">Thêm mới</asp:LinkButton></li>
                <li>
                    <asp:LinkButton CssClass="vdelete" ID="lbtDeleteB" runat="server"
                        OnClick="DeleteButton_Click">Xóa</asp:LinkButton></li>
                <li>
                    <asp:LinkButton CssClass="vrefresh" ID="lbtRefreshB" runat="server"
                        OnClick="RefreshButton_Click">Làm mới</asp:LinkButton></li>
                <li><a class="vback" href="javascript:void(0);" onclick="window.history.go(-1);">Trở lại</a> </li>
            </ul>
        </div>
    </asp:Panel>


    <asp:Panel ID="pnUpdate" runat="server" Visible="False">
        <table class="TableUpdate" border="1">
            <tr>
                <td class="Control" colspan="2">
                    <ul>
                        <li>
                            <asp:LinkButton CssClass="uupdate"
                                ID="lbtUpdateT" runat="server" OnClick="Update_Click">Ghi lại</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton CssClass="uback" ID="lbtBackT" runat="server"
                                CausesValidation="False" OnClick="Back_Click">Trở về</asp:LinkButton></li>
                    </ul>
                </td>
            </tr>

            <tr>
                <th>
                    <asp:Label ID="lblDistrictID" runat="server" Text="Mã tỉnh(TP):"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtDistrictID" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>
            
            <tr>
                <th> <asp:Label ID="lblCityName" runat="server" Text="Tên Quận(Huyện, Thị xã):"></asp:Label></th>
                <td> <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList></td>             
            </tr>
          

            <tr>
                <th>
                    <asp:Label ID="lblDistrictName" runat="server" Text="Tên Quận(Huyện, Thị xã):"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtDistrictName" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>
            

            <tr>
                <td class="Control" colspan="2">
                    <ul>
                        <li>
                            <asp:LinkButton CssClass="uupdate" ID="lbtUpdateB" runat="server"
                                OnClick="Update_Click">Ghi lại</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton CssClass="uback" ID="lbtBackB" runat="server"
                                CausesValidation="False" OnClick="Back_Click">Trở về</asp:LinkButton></li>
                    </ul>
                </td>
            </tr>
        </table>
    </asp:Panel>