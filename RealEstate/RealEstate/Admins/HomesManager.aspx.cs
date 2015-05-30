using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Admins
{
    public partial class HomesManager : System.Web.UI.Page
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
        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnUpload.Click += new System.EventHandler(this.btnUpload_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
        private void btnUpload_Click(object sender, System.EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder = "~/Upload/ImageHouse/";
            strFolder = Server.MapPath(strFolder);

            // Get the name of the file that is posted.


            strFileName = oFile.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }

                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;

                if (File.Exists(strFilePath))
                {
                    lblImages.Text = strFileName + "đã tồn tại trên máy chủ!";
                    lblImages.Visible = true;
                    ltrUploadResult.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"500px\"/>";
                }
                else
                {
                    oFile.PostedFile.SaveAs(strFilePath);
                    lblImages.Text = strFileName + " has been successfully uploaded.";
                    ltrUploadResult.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"500px\" />";
                }

            }
            else
            {
                ltrUploadResult.Text = "Click 'Browse' to select the file to upload.";
            }
        }
        private void BindGrid()
        {
            grdBrands.DataSource = HomesService.Homes_GetByAll();
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
                    List<HomeInfo> listE = HomeService.HomeInfo_GetById(Id);
                    List<Homes> listViewHomes = HomesService.Homes_GetByAll();
                    txtHomeName.Text = listE[0].Name;
                    txtRealEstateOwnersName.Text = listViewHomes[0].RealEstateOwnersName;
                    ddlHomeType.Text = listViewHomes[0].HomeTypeName;
                    ddlTransactionType.Text = listViewHomes[0].TransactionType;
                    EdtDescription.Text = listE[0].Description;
                    txtAddress.Text = listE[0].Address;
                    txtPrice.Text = listE[0].Price;
                    txtTotalArea.Text = listE[0].TotalArea;
                    txtHomeArea.Text = listE[0].HomeArea;
                    txtGargenArea.Text = listE[0].GargenArea;
                    ddlBedroomNumber.Text = listE[0].BedroomNumber;
                    ddlTierNumber.Text = listE[0].TierNumber;
                    //txtImage0.Text = listE[0].Image1;
                    txtImage1.Text = listE[0].Image2;
                    txtImage2.Text = listE[0].Image3;
                    txtImage3.Text = listE[0].Image4;
                    txtImage4.Text = listE[0].Image5;
                    txtImage5.Text = listE[0].Image6;
                    
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
            for (int i = 0; i < grdBrands.Items.Count; i++)
            {
                item = grdBrands.Items[i];
                if (item.ItemType == ListItemType.AlternatingItem | item.ItemType == ListItemType.Item)
                {
                    if (((CheckBox)item.FindControl("ChkSelect")).Checked)
                    {
                        string strId = item.Cells[1].Text;
                        HomeService.HomeInfo_Delete(strId);
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
                HomeInfo obj = new HomeInfo();
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
            ddlHomeType.Items.Clear();
            ddlHomeType.Items.Add(new ListItem("--- Lựa chọn Kiểu nhà ---","0"));
            List<HomeTypeInfo> listHomeTypeServices = HomeTypeService.HomeTypeInfo_GetByAll();
            for (int i = 0; i < listHomeTypeServices.Count; i++)
            {
                ddlHomeType.Items.Add(new ListItem(listHomeTypeServices[i].HomeTypeName, listHomeTypeServices[i].HomeTypeID));
            }
            listHomeTypeServices.Clear();
            listHomeTypeServices = null;
           
        }
    }
}