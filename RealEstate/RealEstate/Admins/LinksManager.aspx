﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="LinksManager.aspx.cs" Inherits="RealEstate.Admins.LinksManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="PageName">Quản lý danh mục Link</div>
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
        <asp:DataGrid ID="grdLinks" runat="server" Width="100%" CssClass="TableView"
            AutoGenerateColumns="False"
            OnItemCommand="grdLinks_ItemCommand" OnItemDataBound="grdLinks_ItemDataBound"
            OnPageIndexChanged="grdLinks_PageIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
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
                <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="False" />
                <%--<asp:BoundColumn DataField="Active" HeaderText="Active" Visible="False" />--%>
                <%--<asp:TemplateColumn ItemStyle-CssClass="Text">
                    <HeaderTemplate>Họ tên</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# RealEstate.Common.StringClass.ShowNameLevel(DataBinder.Eval(Container.DataItem, "Name").ToString(), DataBinder.Eval(Container.DataItem, "Level").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>--%>
                <asp:BoundColumn DataField="Name" HeaderText="Tên trang liên kết" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Link1" HeaderText="Link liên kết 1" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Link2" HeaderText="Link liên kết 2" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Position" HeaderText="Vị trí" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Ord" HeaderText="Thứ tự" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Active" HeaderText="Trạng thái" ItemStyle-CssClass="Text" Visible="true" >
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <%--<asp:BoundColumn DataField="Admin" HeaderText="Quản trị?" ItemStyle-CssClass="CheckBox" Visible="true" />--%>
                <%--<asp:BoundColumn DataField="Ord" HeaderText="Thứ tự" ItemStyle-CssClass="Number" Visible="true" />--%>
                <%--<asp:TemplateColumn ItemStyle-CssClass="CheckBox">
                    <HeaderTemplate>Kích hoạt</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# RealEstate.Common.PageHelper.ShowActiveStatus(DataBinder.Eval(Container.DataItem, "Active").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>--%>
                <asp:TemplateColumn ItemStyle-CssClass="Function">
                    <HeaderTemplate>Chức năng</HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="cmdEdit" runat="server" AlternateText="Sửa" CommandName="Edit" CssClass="Edit" ToolTip="Sửa" ImageUrl="/App_Themes/Admin/images/edit.png" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' />
                        <asp:ImageButton ID="cmdDelete" runat="server" AlternateText="Xóa" CommandName="Delete" CssClass="Delete" ToolTip="Xóa" ImageUrl="/App_Themes/Admin/images/delete.png" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' OnClientClick="javascript:return confirm('Bạn có muốn xóa?');" />
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
            <%--<tr>
                <th>
                    <asp:Label ID="Label5" runat="server" Text="ID"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtID" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>   --%>     
            <tr>
                <th>
                    <asp:Label ID="lblName" runat="server" Text="Tên trang liên kết:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>
             <tr>
                <th>
                    <asp:Label ID="Label1" runat="server" Text="Link liên kết 1: "></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtLink1" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label4" runat="server" Text="Link liên kết 2: "></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtLink2" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>
             <tr>
                <th>
                    <asp:Label ID="Label2" runat="server" Text="Vị trí:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtPosition" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label3" runat="server" Text="Thứ tự:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtOrd" runat="server" CssClass="text"></asp:TextBox></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label6" runat="server" Text="Trạng thái:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtActive" runat="server" CssClass="text"></asp:TextBox></td>
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
