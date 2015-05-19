using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Admins.Modules
{
    public partial class ApartmentManager : System.Web.UI.UserControl
    {
        static string Id = "";
        static bool Insert = false;
        static string Lang = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lbtDeleteT.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa?');");
                lbtDeleteB.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa?');");
                Lang = Session["Lang"].ToString();
                BindGrid();
            }

        }
        private void BindGrid()
        {
            grdBrands.DataSource = ApartmentService.ApartmentInfo_GetByAll(Lang);
            grdBrands.DataBind();
            if (grdBrands.PageCount <= 1)
            {
                grdBrands.PagerStyle.Visible = false;
            }
            else
            {
                grdBrands.PagerStyle.Visible = true;
            }
        }

        protected void grdBrands_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            ListItemType itemType = e.Item.ItemType;
            if ((itemType != ListItemType.Footer) && (itemType != ListItemType.Separator))
            {
                if (itemType == ListItemType.Header)
                {
                    object checkBox = e.Item.FindControl("chkSelectAll");
                    if ((checkBox != null))
                    {
                        ((CheckBox)checkBox).Attributes.Add("onClick", "Javascript:chkSelectAll_OnClick(this)");
                    }
                }
                else
                {
                    string tableRowId = grdBrands.ClientID + "_row" + e.Item.ItemIndex.ToString();
                    e.Item.Attributes.Add("id", tableRowId);
                    object checkBox = e.Item.FindControl("chkSelect");
                    if ((checkBox != null))
                    {
                        e.Item.Attributes.Add("onMouseMove", "Javascript:chkSelect_OnMouseMove(this)");
                        e.Item.Attributes.Add("onMouseOut", "Javascript:chkSelect_OnMouseOut(this," + e.Item.ItemIndex.ToString() + ")");
                        ((CheckBox)checkBox).Attributes.Add("onClick", "Javascript:chkSelect_OnClick(this," + e.Item.ItemIndex.ToString() + ")");
                    }
                }
            }
        }

        protected void grdBrands_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            grdBrands.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void grdBrands_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            string strCA = e.CommandArgument.ToString();
            switch (e.CommandName)
            {
                case "Edit":
                    Insert = false;
                    Id = strCA;
                    List<ApartmentInfo> listApartmentInfos = ApartmentService.ApartmentInfo_GetById(Id);
                    //txtName.Text = listE[0].Name;
                    //txtLogo.Text = listE[0].Logo;
                    //imgLogo.ImageUrl = listE[0].Logo.Length > 0 ? listE[0].Logo : "";
                    //txtOrd.Text = listE[0].Ord;
                    pnView.Visible = false;
                    pnUpdate.Visible = true;
                    break;
                case "Delete":
                    ApartmentService.ApartmentInfo_Delete(strCA);
                    BindGrid();
                    break;
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            pnUpdate.Visible = true;
            ControlClass.ResetControlValues(pnUpdate);
            pnView.Visible = false;
            Insert = true;
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            DataGridItem item = default(DataGridItem);
            for (int i = 0; i < grdBrands.Items.Count; i++)
            {
                item = grdBrands.Items[i];
                if (item.ItemType == ListItemType.AlternatingItem | item.ItemType == ListItemType.Item)
                {
                    if (((CheckBox)item.FindControl("ChkSelect")).Checked)
                    {
                        string strId = item.Cells[1].Text;
                        ApartmentService.ApartmentInfo_Delete(strId);
                    }
                }
            }
            grdBrands.CurrentPageIndex = 0;
            BindGrid();
        }
        protected void RefreshButton_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ApartmentInfo obj = new ApartmentInfo();
                //obj.Id = Id;
                //obj.Name = txtName.Text;
                //obj.Logo = txtLogo.Text;
                //obj.Ord = txtOrd.Text;
                //obj.Lang = Lang;
                if (Insert == true)
                {
                    ApartmentService.ApartmentInfo_Insert(obj);
                }
                else
                {
                    ApartmentService.ApartmentInfo_Update(obj);
                }
                BindGrid();
                pnView.Visible = true;
                pnUpdate.Visible = false;
                Insert = false;
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            pnView.Visible = true;
            pnUpdate.Visible = false;
            Insert = false;
        }
    }
}