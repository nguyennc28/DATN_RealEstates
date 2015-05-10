using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Admins.Modules
{
    public partial class DistrictManager : System.Web.UI.UserControl
    {
        static string Id = "";
        static bool Insert = false;
        static string Password = "";
        //static string Level = "";
        private string Lang = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Lang = Global.GetLang();
            if (!IsPostBack)
            {
                lbtDeleteT.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa?');");
                lbtDeleteB.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa?');");
                BindGrid();
            }
        }
        private void BindGrid()
        {
            grdUser.DataSource = DistrictService.DistrictInfo_GetByAll();
            grdUser.DataBind();
            if (grdUser.PageCount <= 1)
            {
                grdUser.PagerStyle.Visible = false;
            }
        }

        protected void grdUser_ItemDataBound(object sender, DataGridItemEventArgs e)
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
                    string tableRowId = grdUser.ClientID + "_row" + e.Item.ItemIndex.ToString();
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

        protected void grdUser_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            grdUser.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void grdUser_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            string strCA = e.CommandArgument.ToString();
            switch (e.CommandName)
            {
                case "Edit":
                    Insert = false;
                    Id = strCA;
                    List<CityInfo> ListCity = CityService.CityInfo_GetByAll();
                    List<DistrictInfo> Listdistric = DistrictService.DistrictInfo_GetById(Id);
                    txtDistrictID.Text = Listdistric[0].DistrictID;
                    //ddlCity.SelectedIndex = ListCity[0].
                    txtDistrictName.Text = Listdistric[0].DistrictName;

                    pnView.Visible = false;
                    pnUpdate.Visible = true;
                    break;
                case "Delete":
                    DistrictService.DistrictInfo_Delete(strCA);
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
            for (int i = 0; i < grdUser.Items.Count; i++)
            {
                item = grdUser.Items[i];
                if (item.ItemType == ListItemType.AlternatingItem | item.ItemType == ListItemType.Item)
                {
                    if (((CheckBox)item.FindControl("ChkSelect")).Checked)
                    {
                        string strId = item.Cells[1].Text;
                        CityService.CityInfo_Delete(strId);
                    }
                }
            }
            grdUser.CurrentPageIndex = 0;
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
                var obj = new CityInfo { CityID = txtDistrictID.Text, CityName = txtDistrictName.Text };
                if (Insert == true)
                {
                    CityService.CityInfo_Update(obj);
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