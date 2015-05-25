<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PagesManager.aspx.cs" Inherits="RealEstate.Admins.PagesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
    <script src="../ckeditor/ckeditor.js"></script>
    <style type="text/css">
        .TextFull {
            width: 400px;
        }
        .Number {
            width: 50px;
        }
        .Text {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="PageName">Quản lý người dùng</div>

    <%-- Panel DataDridview --%>
    <asp:Panel ID="pnView" runat="server">
        <%-- Các điêu khiển --%>
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

        <%-- DataGridview --%>
        <div class="dgView">
            <asp:DataGrid ID="grdPages" runat="server" Width="100%" CssClass="TableView"
                AutoGenerateColumns="False"
                OnItemCommand="grdPages_ItemCommand" OnItemDataBound="grdPages_ItemDataBound"
                OnPageIndexChanged="grdPages_PageIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AllowCustomPaging="True" AllowSorting="True" PageSize="50">
                <FooterStyle BackColor="Tan" />
                <HeaderStyle CssClass="trHeader" BackColor="Tan" Font-Bold="True"></HeaderStyle>
                <ItemStyle CssClass="trOdd"></ItemStyle>
                <AlternatingItemStyle CssClass="trEven" BackColor="PaleGoldenrod"></AlternatingItemStyle>
                <Columns>
                    <asp:TemplateColumn ItemStyle-CssClass="Function">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="False"></asp:CheckBox>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server"></asp:CheckBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="Function"></ItemStyle>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn ItemStyle-CssClass="CheckBox">
                        <HeaderTemplate>
                            Kích hoạt
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# RealEstate.Common.PageHelper.ShowActiveStatus(DataBinder.Eval(Container.DataItem, "Active").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderTemplate>
                            Tên Trang
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# RealEstate.Common.StringClass.ShowNameLevel(DataBinder.Eval(Container.DataItem, "Name").ToString(), DataBinder.Eval(Container.DataItem, "Level").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="CheckBox" />
                    </asp:TemplateColumn>


                    <asp:BoundColumn DataField="PageID" HeaderText="PageID" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Active" HeaderText="Active" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Tag" HeaderText="Đường dẫn">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Content" HeaderText="Nội dung">
                        <ItemStyle CssClass="TextFull" Width="300"/>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Detail" HeaderText="Chi tiết">
                        <ItemStyle CssClass="TextFull" Width="300"/>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Title" HeaderText="Tiêu đề">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Description" HeaderText="Mô tả">
                        <ItemStyle CssClass="TextFull" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Keyword" HeaderText="Từ khóa">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Type" HeaderText="Loại trang">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Link" HeaderText="Link">
                        <ItemStyle CssClass="Text" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Position" HeaderText="Vị trí">
                        <ItemStyle CssClass="Number" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Ord" HeaderText="Thứ tự">
                        <ItemStyle CssClass="Number" />
                    </asp:BoundColumn>
                    <asp:TemplateColumn ItemStyle-CssClass="Text">
                        <ItemStyle CssClass="Text" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-CssClass="tdCenter">
                        <HeaderTemplate>Chức năng</HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="cmdAddSub" runat="server" AlternateText="Thêm cấp con" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Level")%>' CommandName="AddSub" CssClass="Add" ImageUrl="/App_Themes/Admin/images/add.png" ToolTip="Thêm cấp con" />
                            <asp:ImageButton ID="cmdEdit" runat="server" AlternateText="Sửa" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PageID")%>' CommandName="Edit" CssClass="Edit" ImageUrl="/App_Themes/Admin/images/edit.png" ToolTip="Sửa" />
                            <asp:ImageButton ID="cmdDelete" runat="server" AlternateText="Xóa" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PageID")%>' CommandName="Delete" CssClass="Delete" ImageUrl="/App_Themes/Admin/images/delete.png" OnClientClick="javascript:return confirm('Bạn có muốn xóa?');" ToolTip="Xóa" />
                            <asp:ImageButton ID="cmdActive" runat="server" AlternateText='<%#RealEstate.Common.PageHelper.ShowActiveToolTip(DataBinder.Eval(Container.DataItem, "Active").ToString())%>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PageID")%>' CommandName="Active" CssClass="Active" ImageUrl='<%#RealEstate.Common.PageHelper.ShowActiveImage(DataBinder.Eval(Container.DataItem, "Active").ToString())%>' ToolTip='<%# RealEstate.Common.PageHelper.ShowActiveToolTip(DataBinder.Eval(Container.DataItem, "Active").ToString())%>' />
                        </ItemTemplate>
                        <ItemStyle CssClass="tdCenter" />
                    </asp:TemplateColumn>

                </Columns>
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            </asp:DataGrid>
        </div>
        <%-- Các điều khiển --%>
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


    <%-- Panel Update Data --%>
    <asp:Panel ID="pnUpdate" runat="server">
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
                    <asp:Label ID="lblName" runat="server" Text="Tên trang(Tên Menu):"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="text" Height="16px" Width="246px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblUsername" runat="server" Text="Đường dẫn trang:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtTag" runat="server" CssClass="text" Height="18px" Width="246px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblContent" runat="server" Text="Nội dung:"></asp:Label></th>
                <td>
                    <ckeditor:ckeditorcontrol id="EdtContent" runat="server"></ckeditor:ckeditorcontrol>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label9" runat="server" Text="Nội dung chi tiết:"></asp:Label></th>
                <td>
                    <ckeditor:ckeditorcontrol id="EdtDetail" runat="server"></ckeditor:ckeditorcontrol>
                </td>
            </tr>
            
            <tr>
                <th>
                    <asp:Label ID="Label12" runat="server" Text="Chọn cấp Menu:"></asp:Label></th>
                <td>
                    <asp:RadioButtonList ID="rdLevelMenu" runat="server"></asp:RadioButtonList>
                </td>
            </tr>

            <tr>
                <th>
                    <asp:Label ID="Label11" runat="server" Text="Tiêu đề:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Height="17px" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label10" runat="server" Text="Mô tả:"></asp:Label></th>
                <td>
                    <ckeditor:ckeditorcontrol id="EdtDescription" runat="server"></ckeditor:ckeditorcontrol>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label13" runat="server" Text="Loại trang:"></asp:Label></th>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Cha</asp:ListItem>
                        <asp:ListItem>Con</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label14" runat="server" Text="Link liên kết:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtLink" runat="server" Height="17px" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label15" runat="server" Text="Vị trí hiển thị:"></asp:Label></th>
                <td>
                    <asp:DropDownList ID="ddlPosition" runat="server">
                        <asp:ListItem Value="1">Menu ngang chính</asp:ListItem>
                        <asp:ListItem Value="2">Menu Ngang Chân trang</asp:ListItem>
                        <asp:ListItem Value="3">Menu dọc trái</asp:ListItem>
                        <asp:ListItem Value="4">Menu dọc phải</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label16" runat="server" Text="Thứ tự:"></asp:Label></th>
                <td>
                    <asp:DropDownList ID="ddlOrd" runat="server">
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
                    <asp:Label ID="lblActive" runat="server" Text="Kích hoạt:"></asp:Label></th>
                <td>
                    <asp:CheckBox ID="chkActive" runat="server" /></td>
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
</asp:Content>
