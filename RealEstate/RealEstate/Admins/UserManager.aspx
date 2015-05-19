<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserManager.aspx.cs" Inherits="RealEstate.Admins.UserManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        <asp:DataGrid ID="grdUser" runat="server" Width="100%" CssClass="TableView"
            AutoGenerateColumns="False"
            OnItemCommand="grdUser_ItemCommand" OnItemDataBound="grdUser_ItemDataBound"
            OnPageIndexChanged="grdUser_PageIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AllowCustomPaging="True" AllowSorting="True" PageSize="50">
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
                        Họ tên
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# RealEstate.Common.StringClass.ShowNameLevel(DataBinder.Eval(Container.DataItem, "FullName").ToString(), DataBinder.Eval(Container.DataItem, "Level").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="CheckBox" />
                </asp:TemplateColumn>
                

                <asp:BoundColumn DataField="UserID" HeaderText="UserID" Visible="False" > </asp:BoundColumn>
                <asp:BoundColumn DataField="Active" HeaderText="Active" Visible="False"> </asp:BoundColumn>
                <asp:BoundColumn DataField="UserName" HeaderText="Tên đăng nhập">
                    <ItemStyle CssClass="Text" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Gender" HeaderText="Giới tính"><ItemStyle CssClass="Gender" /> </asp:BoundColumn>
                <asp:BoundColumn DataField="Avatar" HeaderText="Ảnh đại diện"> <ItemStyle CssClass="Image" /> </asp:BoundColumn>
                <asp:BoundColumn DataField="Email" HeaderText="Email" ItemStyle-CssClass="Text" Visible="true"> <ItemStyle CssClass="Text" /> </asp:BoundColumn>
                <asp:BoundColumn DataField="Birthday" HeaderText="Sinh nhật" ItemStyle-CssClass="Number" Visible="true"> <ItemStyle CssClass="Date" /> </asp:BoundColumn>
                <asp:BoundColumn DataField="Address" HeaderText="Địa chỉ"> <ItemStyle CssClass="Text" /></asp:BoundColumn>
                <asp:BoundColumn DataField="Address" HeaderText="Số điện thoại"> <ItemStyle CssClass="Text" /></asp:BoundColumn>
                <asp:BoundColumn DataField="CreatedDate" HeaderText="Ngày tạo"> <ItemStyle CssClass="Date" /> </asp:BoundColumn>
                <asp:BoundColumn DataField="GroupID" HeaderText="Nhóm"><ItemStyle CssClass="Text" /></asp:BoundColumn>
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
                        <asp:ImageButton ID="cmdEdit" runat="server" AlternateText="Sửa" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserID")%>' CommandName="Edit" CssClass="Edit" ImageUrl="/App_Themes/Admin/images/edit.png" ToolTip="Sửa" />
                        <asp:ImageButton ID="cmdDelete" runat="server" AlternateText="Xóa" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserID")%>' CommandName="Delete" CssClass="Delete" ImageUrl="/App_Themes/Admin/images/delete.png" OnClientClick="javascript:return confirm('Bạn có muốn xóa?');" ToolTip="Xóa" />
                        <asp:ImageButton ID="cmdActive" runat="server" AlternateText='<%#RealEstate.Common.PageHelper.ShowActiveToolTip(DataBinder.Eval(Container.DataItem, "Active").ToString())%>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserID")%>' CommandName="Active" CssClass="Active" ImageUrl='<%#RealEstate.Common.PageHelper.ShowActiveImage(DataBinder.Eval(Container.DataItem, "Active").ToString())%>' ToolTip='<%# RealEstate.Common.PageHelper.ShowActiveToolTip(DataBinder.Eval(Container.DataItem, "Active").ToString())%>' />
                    </ItemTemplate>
                    <ItemStyle CssClass="tdCenter" />
                </asp:TemplateColumn>

            </Columns>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:DataGrid>
        
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
                    <asp:Label ID="lblName" runat="server" Text="Họ tên:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="text" Height="16px" Width="246px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblUsername" runat="server" Text="Tên đăng nhập:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="text" Height="18px" Width="246px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="lblPassword" runat="server" Text="Mật khẩu:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="datetime" Height="19px" Width="245px"></asp:TextBox></td>
            </tr>
            <tr style="display: none">
                <th>
                    <asp:Label ID="lblAdmin" runat="server" Text="Quản trị?:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtAdmin" runat="server" CssClass="date" Height="16px" Width="244px"></asp:TextBox></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label2" runat="server" Text="Giới tính:"></asp:Label></th>
                <td>
                    <asp:RadioButtonList ID="rdGender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="true">Nam</asp:ListItem>
                        <asp:ListItem Value="false">Nữ</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label4" runat="server" Text="Ngày sinh:"></asp:Label></th>
                <td>
                    <asp:Calendar ID="cldBirthday" runat="server"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label3" runat="server" Text="Ảnh đại diện:"></asp:Label> </th>
                <td><asp:TextBox ID="txtAvatar" runat="server" CssClass="text image"></asp:TextBox>&nbsp;<input ID="btnimgAvatar" type="button" onclick="BrowseServer('<% =txtAvatar.ClientID %>    ','Images');" value="Browse Server"></input>&nbsp; <asp:Image ID="imgAvatar" runat="server" ImageAlign="Middle" Width="100px" /></td>
            </tr>
            
            <tr>
                <th>
                    <asp:Label ID="Label5" runat="server" Text="Email:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Height="17px" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label6" runat="server" Text="Địa chỉ:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Height="17px" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label7" runat="server" Text="Số điện thoại:"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Height="17px" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>
                    <asp:Label ID="Label8" runat="server" Text="Nhóm người dùng:"></asp:Label></th>
                <td>
                    <asp:DropDownList ID="ddlGroupUser" runat="server" Height="16px" Width="263px">
                    </asp:DropDownList>
                </td>
            </tr>            
            <tr>
                <th>
                    <asp:Label ID="lblOrd" runat="server" Text="Thứ tự:"></asp:Label></th>
                <td>
                    <asp:TextBox ID="txtOrd" runat="server" CssClass="text number" /><asp:RequiredFieldValidator ID="rfvOrd" runat="server" ControlToValidate="txtOrd" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
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
    
    <Ajax:ModalPopupExtender ID="ModalPopupExtender1"  TargetControlID="lbtAddT" PopupControlID="pnUpdate" BackgroundCssClass="popUpStyle" runat="server"></Ajax:ModalPopupExtender>
</asp:Content>
