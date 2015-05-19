<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="HomesManager.aspx.cs" Inherits="RealEstate.Admins.HomesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
    <script src="../ckeditor/ckeditor.js"></script>
    <style type="text/css">
        .image{ width: 100px;}
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".vadd").click(function() {
                var view = $(".View");
                var update = $(".Update");
                view.hide();
                update.show();
            });
            $(".uback").on("click", function() {
                $(this).hide();
                var view = $(".View");
                view.show();
            });
        });
    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="PageName">Quản lý nhà mua, bán, cho thuê</div>
    <div class="View">
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
                OnPageIndexChanged="grdBrands_PageIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" HorizontalAlign="Center" CellSpacing="1" AllowCustomPaging="True" AllowSorting="True" ShowFooter="True">
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
                    <%--<asp:BoundColumn DataField="HomeID" HeaderText="HomeID" Visible="False" />
                    <asp:BoundColumn DataField="RealEstateID" HeaderText="Mã BĐS" ItemStyle-CssClass="Text" Visible="true">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>--%>
                    <asp:BoundColumn DataField="HomeTypeName" HeaderText="Loại nhà" ItemStyle-CssClass="Text" Visible="true">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="RealEstateOwnersName" HeaderText="Nguyên sở hữu" ItemStyle-CssClass="Text" Visible="true">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Name" HeaderText="Tên nhà" ItemStyle-CssClass="Text" Visible="true">
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
                    <asp:BoundColumn DataField="TotalArea" HeaderText="Tổng diện tích" ItemStyle-CssClass="Text" Visible="true">
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
                    </asp:BoundColumn>
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
    </div>
    
    <div class="Update">
    <asp:Panel ID="pnUpdate" runat="server">
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
                    <asp:Label ID="lblName" runat="server" Text="Tên nhà:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtHomeName" runat="server" CssClass="text"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtHomeName" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="Brands"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblRealEstateOwnersName" runat="server" Text="Nguyên sở hữu:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtRealEstateOwnersName" runat="server" CssClass="text"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="txtRealEstateOwnersName" Display="Dynamic" ErrorMessage="*"
                        SetFocusOnError="True" ValidationGroup="Brands"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblHomeTypeName" runat="server" Text="Loại nhà:"></asp:Label></th>
                <td>
                    <asp:DropDownList ID="ddlHomeType" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="TransactionType" runat="server" Text="Loại giao dịch:"></asp:Label></th>
                <td>
                    <asp:DropDownList ID="ddlTransactionType" runat="server">
                        <asp:ListItem Value="0">---Lựa chọn kiểu giao dịch---</asp:ListItem>
                        <asp:ListItem Value="Bán">Bán</asp:ListItem>
                        <asp:ListItem Value="Mua">Mua</asp:ListItem>
                        <asp:ListItem Value="Cho thuê">Cho thuê</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    <asp:Label ID="lblDescription" runat="server" Text="Mô tả:"></asp:Label></th>
                <td>
                    <ckeditor:ckeditorcontrol id="EdtDescription" runat="server"></ckeditor:ckeditorcontrol>
                </td>
            </tr>

            <tr>
                <th>
                    <asp:Label ID="Label3" runat="server" Text="Địa chỉ:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="text"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="*"
                        SetFocusOnError="True" ValidationGroup="Brands"></asp:RequiredFieldValidator></td>
            </tr>


            <tr>
                <th>
                    <asp:Label ID="Label4" runat="server" Text="Giá bán:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="text"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label5" runat="server" Text="Tổng diện tích:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtTotalArea" runat="server" CssClass="text"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label6" runat="server" Text="Diện tích nhà:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtHomeArea" runat="server" CssClass="text"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label7" runat="server" Text="Diện tích vườn:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtGargenArea" runat="server" CssClass="text"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label8" runat="server" Text="Số phòng ngủ:"></asp:Label>
                </th>
                <td>
                    <asp:DropDownList ID="ddlBedroomNumber" runat="server">
                        <asp:ListItem Value="0">--- Lựa chọn số phòng ngủ ---</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label9" runat="server" Text="Số tầng:"></asp:Label>
                </th>
                <td>
                    <asp:DropDownList ID="ddlTierNumber" runat="server">
                        <asp:ListItem Value="0">--- Lựa chọn số tầng ---</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblImage0" runat="server" Text="Image1:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtImage0" runat="server" CssClass="text image"></asp:TextBox>
                    &nbsp;<input id="btnImage0" type="button" onclick="BrowseServer('<% =txtImage0.ClientID %>    ','Images');" value="Browse Server" />&nbsp;
                    <asp:Image ID="imgImage0" runat="server" ImageAlign="Middle" Width="100px" />
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblImage1" runat="server" Text="Image2:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtImage1" runat="server" CssClass="text image"></asp:TextBox>
                    &nbsp;<input id="btnImgImage1" type="button" onclick="BrowseServer('<% =txtImage1.ClientID %>','Images'); " value="Browse Server" />&nbsp;
                    <asp:Image ID="imgImage1" runat="server" ImageAlign="Middle" Width="100px" />
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblImage2" runat="server" Text="Image3:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtImage2" runat="server" CssClass="text image"></asp:TextBox>
                    &nbsp;<input id="btnImgImage2" type="button" onclick="BrowseServer('<% =txtImage2.ClientID %>    ','Images');" value="Browse Server" />&nbsp;
                    <asp:Image ID="imgImage2" runat="server" ImageAlign="Middle" Width="100px" />
                </td>
            </tr>
             <tr>
                <th>
                    <asp:Label ID="lblImage3" runat="server" Text="Image4:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtImage3" runat="server" CssClass="text image"></asp:TextBox>
                    &nbsp;<input id="btnImgImage3" type="button" onclick="BrowseServer('<% =txtImage3.ClientID %>    ','Images');" value="Browse Server" />&nbsp;
                    <asp:Image ID="imgImage3" runat="server" ImageAlign="Middle" Width="100px" />
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblImage4" runat="server" Text="Image5:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtImage4" runat="server" CssClass="text image"></asp:TextBox>
                    &nbsp;<input id="btnImgImage4" type="button" onclick="BrowseServer('<% =txtImage4.ClientID %>    ','Images');" value="Browse Server" />&nbsp;
                    <asp:Image ID="imgImage4" runat="server" ImageAlign="Middle" Width="100px" />
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblImage5" runat="server" Text="Image6:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtImage5" runat="server" CssClass="text image"></asp:TextBox>
                    &nbsp;<input id="btnImgImage5" type="button" onclick="BrowseServer('<% =txtImage5.ClientID %>    ','Images');" value="Browse Server" />&nbsp;
                    <asp:Image ID="imgImage5" runat="server" ImageAlign="Middle" Width="100px" />
                </td>
            </tr>
           
            <%--<tr>
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
            </tr>--%>
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
    </div>
</asp:Content>
