<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApartmentManager.ascx.cs" Inherits="RealEstate.Admins.Modules.ApartmentManager" %>
<div class="PageName">Brands</div>
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
        </ul>
    </div>
    <div class="dgView">
        <asp:DataGrid ID="grdBrands" runat="server" Width="100%" CssClass="TableView"
            AutoGenerateColumns="False" AllowPaging="True" PageSize="25"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Center"
            OnItemCommand="grdBrands_ItemCommand" OnItemDataBound="grdBrands_ItemDataBound"
            OnPageIndexChanged="grdBrands_PageIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" HorizontalAlign="Center" CellSpacing="1">
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
                <asp:BoundColumn DataField="ApartmentID" HeaderText="ApartmentID" Visible="False" />
                <asp:BoundColumn DataField="RealEstateID" HeaderText="Mã BĐS" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <%--            <asp:BoundColumn DataField="HomeTypeName" HeaderText="Loại nhà" ItemStyle-CssClass="Text" Visible="true">
                <ItemStyle CssClass="Text" />
            </asp:BoundColumn>
            <asp:BoundColumn DataField="RealEstateOwnersName" HeaderText="Nguyên sở hữu" ItemStyle-CssClass="Text" Visible="true">
                <ItemStyle CssClass="Text" />
            </asp:BoundColumn>--%>
                <asp:BoundColumn DataField="Name" HeaderText="Tên căn hộ" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="TransactionType" HeaderText="Loại giao dịch" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Description" HeaderText="Mô tả" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Address" HeaderText="Địa chỉ" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Price" HeaderText="Giá bán" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
               <%-- <asp:BoundColumn DataField="TotalArea" HeaderText="Tổng diện tích" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="HomeArea" HeaderText="Diện tích nhà" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="GargenArea" HeaderText="Diện tích vườn" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="BedroomNumber" HeaderText="Phòng ngủ" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="TierNumber" HeaderText="Tầng" ItemStyle-CssClass="Text" Visible="true">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>--%>
                <asp:BoundColumn DataField="Image1" HeaderText="Ảnh" ItemStyle-CssClass="Image" Visible="true">
                    <ItemStyle CssClass="Image" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Image2" HeaderText="Ảnh" ItemStyle-CssClass="Image" Visible="true">
                    <ItemStyle CssClass="Image" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Image3" HeaderText="Ảnh" ItemStyle-CssClass="Image" Visible="true">
                    <ItemStyle CssClass="Image" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Image4" HeaderText="Ảnh" ItemStyle-CssClass="Image" Visible="true">
                    <ItemStyle CssClass="Image" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Image5" HeaderText="Ảnh" ItemStyle-CssClass="Image" Visible="true">
                    <ItemStyle CssClass="Image" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Image6" HeaderText="Ảnh" ItemStyle-CssClass="Image" Visible="true">
                    <ItemStyle CssClass="Image" />
                </asp:BoundColumn>
                <%-- <asp:BoundColumn DataField="Ord" HeaderText="Thứ tự" ItemStyle-CssClass="CheckBox" Visible="true">
                <ItemStyle CssClass="CheckBox" />
            </asp:BoundColumn>--%>
                <asp:TemplateColumn ItemStyle-CssClass="Function">
                    <HeaderTemplate>Chức năng</HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="cmdEdit" runat="server" AlternateText="Sửa" CommandName="Edit" CssClass="Edit" ToolTip="Sửa" ImageUrl="/App_Themes/Admin/images/edit.png" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"HomeID")%>' /><asp:ImageButton ID="cmdDelete" runat="server" AlternateText="Xóa" CommandName="Delete" CssClass="Delete" ToolTip="Xóa" ImageUrl="/App_Themes/Admin/images/delete.png" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"HomeID")%>' OnClientClick="javascript:return confirm('Bạn có muốn xóa?');" />
                    </ItemTemplate>
                    <ItemStyle CssClass="Function" />
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Center" CssClass="Paging" Position="Bottom" NextPageText="Previous" PrevPageText="Next" BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue"></PagerStyle>
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:DataGrid>
    </div>
    <div class="Control">
        <ul>
            <li>
                <asp:LinkButton CssClass="vadd" ID="lbtAddB" runat="server"
                    OnClick="AddButton_Click">Thêm mới</asp:LinkButton></li>
            <li>
                <asp:LinkButton CssClass="vdelete" ID="lbtDeleteB" runat="server"
                    OnClick="DeleteButton_Click">Xóa</asp:LinkButton></li>
            <li>
                <asp:LinkButton CssClass="vrefresh" ID="lbtRefreshB" runat="server"
                    OnClick="RefreshButton_Click">Làm mới</asp:LinkButton></li>
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
                            ID="lbtUpdateT" runat="server" ValidationGroup="Brands"
                            OnClick="Update_Click">Ghi lại</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton CssClass="uback" ID="lbtBackT" runat="server"
                            CausesValidation="False" ValidationGroup="Brands" OnClick="Back_Click">Trở về</asp:LinkButton></li>
                </ul>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblName" runat="server" Text="Tên hãng:"></asp:Label></th>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server"
                    ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*"
                    SetFocusOnError="True" ValidationGroup="Brands"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblLogo" runat="server" Text="Logo:"></asp:Label></th>
            <td>
                <asp:TextBox ID="txtLogo" runat="server" CssClass="text image"></asp:TextBox>&nbsp;<input id="btnImgLogo" type="button" onclick="BrowseServer('<% =txtLogo.ClientID %>    ','Images');" value="Browse Server" />&nbsp;
                    <asp:Image ID="imgLogo" runat="server" ImageAlign="Middle" Width="100px" /></td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblOrd" runat="server" Text="Thứ tự:"></asp:Label></th>
            <td>
                <asp:TextBox ID="txtOrd" runat="server" CssClass="text image"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="txtOrd_FilteredTextBoxExtender" runat="server"
                    FilterType="Numbers" TargetControlID="txtOrd">
                </asp:FilteredTextBoxExtender>
                &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="txtOrd" Display="Dynamic" ErrorMessage="*"
                    ValidationGroup="Brands"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="Control" colspan="2">
                <ul>
                    <li>
                        <asp:LinkButton CssClass="uupdate" ID="lbtUpdateB" runat="server"
                            ValidationGroup="Brands" OnClick="Update_Click">Ghi lại</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton CssClass="uback" ID="lbtBackB" runat="server"
                            CausesValidation="False" ValidationGroup="Brands" OnClick="Back_Click">Trở về</asp:LinkButton></li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Panel>
