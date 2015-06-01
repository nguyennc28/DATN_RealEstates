using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Admins
{
    public partial class PagesManager : System.Web.UI.Page
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
            LoadDropdownList();
        }
        private void BindGrid()
        {
            grdPages.DataSource = PageService.Page_GetByAll(Lang);
            grdPages.DataBind();
            if (grdPages.PageCount <= 1)
            {
                grdPages.PagerStyle.Visible = false;
            }
            else
            {
                grdPages.PagerStyle.Visible = true;
            }
        }

        protected void grdPages_ItemDataBound(object sender, DataGridItemEventArgs e)
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
                    string tableRowId = grdPages.ClientID + "_row" + e.Item.ItemIndex.ToString();
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

        protected void grdPages_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            grdPages.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void grdPages_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            string strCA = e.CommandArgument.ToString();
            switch (e.CommandName)
            {
                case "Edit":
                    Insert = false;
                    Id = strCA;
                    List<RealEstate.DataAccess.Page> listPages = PageService.Page_GetById(Id);
                    txtName.Text = listPages[0].Name;
                    txtTag.Text = listPages[0].Tag;
                    txtLink.Text = listPages[0].Link;
                    //txtTitle.Text - listPages[0].Title;
                    //EdtContent.Text - listPages[0].Content;


                    //List<HomeInfo> listE = HomeService.HomeInfo_GetById(Id);
                    //List<Homes> listViewHomes = HomesService.Homes_GetByAll();
                    //txtHomeName.Text = listE[0].Name;
                    //txtRealEstateOwnersName.Text = listViewHomes[0].RealEstateOwnersName;
                    //ddlHomeType.Text = listViewHomes[0].HomeTypeName;
                    //ddlTransactionType.Text = listViewHomes[0].TransactionType;
                    //EdtDescription.Text = listE[0].Description;
                    //txtAddress.Text = listE[0].Address;
                    //txtPrice.Text = listE[0].Price;
                    //txtTotalArea.Text = listE[0].TotalArea;
                    //txtHomeArea.Text = listE[0].HomeArea;
                    //txtGargenArea.Text = listE[0].GargenArea;
                    //ddlBedroomNumber.Text = listE[0].BedroomNumber;
                    //ddlTierNumber.Text = listE[0].TierNumber;
                    //txtImage0.Text = listE[0].Image1;
                    //txtImage1.Text = listE[0].Image2;
                    //txtImage2.Text = listE[0].Image3;
                    //txtImage3.Text = listE[0].Image4;
                    //txtImage4.Text = listE[0].Image5;
                    //txtImage5.Text = listE[0].Image6;

                    //imgLogo.ImageUrl = listE[0].Logo.Length > 0 ? listE[0].Logo : "";                   
                    //pnView.Visible = false;
                    //pnUpdate.Visible = true;
                    break;
                case "Delete":
                    HomeService.HomeInfo_Delete(strCA);
                    BindGrid();
                    break;
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            //pnUpdate.Visible = true;
            //ControlClass.ResetControlValues(pnUpdate);
            //pnView.Visible = false;
            Insert = true;
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            DataGridItem item = default(DataGridItem);
            for (int i = 0; i < grdPages.Items.Count; i++)
            {
                item = grdPages.Items[i];
                if (item.ItemType == ListItemType.AlternatingItem | item.ItemType == ListItemType.Item)
                {
                    if (((CheckBox)item.FindControl("ChkSelect")).Checked)
                    {
                        string strId = item.Cells[1].Text;
                        HomeService.HomeInfo_Delete(strId);
                    }
                }
            }
            grdPages.CurrentPageIndex = 0;
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
                //HomeInfo obj = new HomeInfo();
                //obj.
                //Data.Brands obj = new Data.Brands();
                //obj.Id = Id;
                //obj.Name = txtName.Text;
                //obj.Logo = txtLogo.Text;
                //obj.Ord = txtOrd.Text;
                //obj.Lang = Lang;
                //if (Insert == true)
                //{
                //    BrandsService.Brands_Insert(obj);
                //}
                //else
                //{
                //    BrandsService.Brands_Update(obj);
                //}
                BindGrid();
                //pnView.Visible = true;
                //pnUpdate.Visible = false;
                Insert = false;
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            //pnView.Visible = true;
            //pnUpdate.Visible = false;
            Insert = false;
        }


        private void LoadDropdownList()
        {
        //    ddlHomeType.Items.Clear();
        //    ddlHomeType.Items.Add(new ListItem("--- Lựa chọn Kiểu nhà ---", "0"));
        //    List<HomeTypeInfo> listHomeTypeServices = HomeTypeService.HomeTypeInfo_GetByAll();
        //    for (int i = 0; i < listHomeTypeServices.Count; i++)
        //    {
        //        ddlHomeType.Items.Add(new ListItem(listHomeTypeServices[i].HomeTypeName, listHomeTypeServices[i].HomeTypeID));
        //    }
        //    listHomeTypeServices.Clear();
        //    listHomeTypeServices = null;

        }

        //private void LoatLevelMenu()
        //{
        //    rdLevelMenu.Items.Clear();
        //    List<RealEstate.DataAccess.Page> listPages = PageService.Page_GetByTop("20", "Active = 1 and LEN(Level) =5", "Ord");
        //    if (listPages.Count > 0)
        //    {
        //        for (int i = 0; i < listPages.Count; i++)
        //        {
        //            List<RealEstate.DataAccess.Page> listSubPage = new List<RealEstate.DataAccess.Page>();
        //            listSubPage = PageService.Page_GetBySub(listPages[i].Level);
        //            if (listSubPage.Count > 0)
        //            {
        //                rdLevelMenu.Items.Add(new ListItem("Cấp 1", "0000"+listPages[i].Ord));
        //                for (int j = 0; j < listSubPage.Count; j++)
        //                {
        //                    rdLevelMenu.Items.Add(new ListItem("Cấp 2", "0000" + listPages[i].Ord + "0000" + listSubPage[i].Ord ));
        //                }
        //            }

        //        }
        //    }
        //    else
        //    {
                
        //    }
        //}


        protected void ddlPageLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPageLevel.SelectedValue == "cap1")
            {
                
            }
        }

    }
}