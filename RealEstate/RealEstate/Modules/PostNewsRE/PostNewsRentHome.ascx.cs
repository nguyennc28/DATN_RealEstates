﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Modules.PostNewsRE
{
    public partial class PostNewsRentHome : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewRealEstateType();
                ViewRealEstate();
                ViewCity();
                ViewDistrict();
            }
        }

        protected void btnPostNewRE_Click(object sender, ImageClickEventArgs e)
        {
            var obj = new HomeInfo
            {
                HomeTypeID = ddlHomeType.SelectedValue,
                Name = txtTenNha.Text,
                RealEstateOwnersID = "1",
                RealEstateID = ddlRealEstate.SelectedValue,
                Title = "",
                TransactionType = "sale",
                Tag = "",
                CreateBy = txtTenChuSoHuu.Text,
                CreateDate = "",
                RealEstateOwnersName = txtTenChuSoHuu.Text,
                CityID = ddlCity.SelectedValue,
                LocationID = "",
                DistrictID = ddlDistrict.SelectedValue,
                Address = txtAddress.Text + ddlDistrict.SelectedItem + ddlCity.SelectedItem,
                Description = "N" + txtDescription.Text,
                BedroomNumber = txtBetroomNum.Text,
                TotalArea = txtArea.Text,
                FloorArea = txtFloorArea.Text,
                GargenArea = "",
                HomeArea = txtFloorArea.Text,
                Price = txtPrice.Text,
                TierNumber = txtTierNumber.Text,
                Image1 = lbImages1.Text,
                Image2 = lbImages2.Text,
                Image3 = lbImages3.Text,
                Image4 = lbImages4.Text,
                Image5 = lbImages5.Text,
                Image6 = lbImages6.Text
            };
            HomeService.HomeInfo_Insert(obj);
            Response.Redirect("~/Default2.aspx?mod=ViewPostNewRE");
        }
        private void ViewRealEstate()
        {
            ddlRealEstate.Items.Clear();
            ddlRealEstate.Items.Add(new ListItem("-Chọn BĐS-", "0"));
            List<RealEstateInfo> list = RealEstateService.RealEstateInfo_GetByAll();
            if (list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    ListItem lsListItem = new ListItem(list[i].RealEstateName, list[i].RealEstateID);
                    ddlRealEstate.Items.Add(lsListItem);
                }
                list.Clear();
                list = null;
            }
            //_cityCode = ddlCity.SelectedValue;
        }
        private void ViewCity()
        {
            ddlCity.Items.Clear();
            ddlCity.Items.Add(new ListItem("-Chọn Tỉnh(TP)-", "0"));
            List<CityInfo> listCityInfos = CityService.CityInfo_GetByAll();
            if (listCityInfos.Count > 0)
            {
                for (int i = 0; i < listCityInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listCityInfos[i].CityName, listCityInfos[i].CityCode);
                    ddlCity.Items.Add(lsListItem);
                }
                listCityInfos.Clear();
                listCityInfos = null;
            }
            //_cityCode = ddlCity.SelectedValue;
        }
        private void ViewDistrict()
        {
            ddlDistrict.Items.Clear();
            ddlDistrict.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));
            List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100", "CityCode = 1", "DistrictID");
            for (int i = 0; i < listDistrictInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName, listDistrictInfos[i].DistrictID);
                ddlDistrict.Items.Add(lsListItem);
            }
            listDistrictInfos.Clear();
            listDistrictInfos = null;
        }
        private void ViewRealEstateType()
        {
            ddlHomeType.Items.Clear();
            ddlHomeType.Items.Add(new ListItem("-Chọn loại Nhà-", "0"));
            List<HomeTypeInfo> listddlHomeTypeInfos = HomeTypeService.HomeTypeInfo_GetByAll();
            for (int i = 0; i < listddlHomeTypeInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listddlHomeTypeInfos[i].HomeTypeName,
                    listddlHomeTypeInfos[i].HomeTypeID);
                ddlHomeType.Items.Add(lsListItem);

            }
            listddlHomeTypeInfos.Clear();
            listddlHomeTypeInfos = null;
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
            this.btnUploadImage.Click += new System.EventHandler(this.btnUploadImage_Click);
            this.Load += new System.EventHandler(this.Page_Load);

            this.btnUploadImage2.Click += new System.EventHandler(this.btnUploadImage2_Click);
            this.Load += new System.EventHandler(this.Page_Load);

            this.btnUploadImage3.Click += new System.EventHandler(this.btnUploadImage3_Click);
            this.Load += new System.EventHandler(this.Page_Load);

            this.btnUploadImage4.Click += new System.EventHandler(this.btnUploadImage4_Click);
            this.Load += new System.EventHandler(this.Page_Load);

            this.btnUploadImage5.Click += new System.EventHandler(this.btnUploadImage5_Click);
            this.Load += new System.EventHandler(this.Page_Load);

            this.btnUploadImage6.Click += new System.EventHandler(this.btnUploadImage6_Click);
            this.Load += new System.EventHandler(this.Page_Load);
        }
        #endregion
        private void btnUploadImage_Click(object sender, System.EventArgs e)
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
                    lblImages.Text = strFileName + " đã tồn tại trên máy chủ!";
                    lblImages.Visible = true;
                    ltrUploadResultImage.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\"/>";
                    lbImages1.Text = "../Upload/ImageHouse/" + strFileName;
                }
                else
                {
                    oFile.PostedFile.SaveAs(strFilePath);
                    lblImages.Text = strFileName + " đã tải lên thành công!";
                    lbImages1.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\" />";
                }
            }
            else
            {
                ltrUploadResultImage.Text = "Bấm 'Browse' để chọn file cần tải lên!";
            }
        }

        private void btnUploadImage2_Click(object sender, System.EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder = "~/Upload/ImageHouse/";
            strFolder = Server.MapPath(strFolder);

            // Get the name of the file that is posted.
            strFileName = oFile2.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile2.Value != "")
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
                    lblImages2.Text = strFileName + " đã tồn tại trên máy chủ!";
                    lblImages2.Visible = true;
                    lbImages2.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage2.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\"/>";
                }
                else
                {
                    oFile2.PostedFile.SaveAs(strFilePath);
                    lbImages2.Text = "../Upload/ImageHouse/" + strFileName;
                    lblImages2.Text = strFileName + " đã tải lên thành công!";
                    ltrUploadResultImage2.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\" />";
                }
            }
            else
            {
                ltrUploadResultImage2.Text = "Bấm 'Browse' để chọn file cần tải lên!";
            }
        }
        private void btnUploadImage3_Click(object sender, System.EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder = "~/Upload/ImageHouse/";
            strFolder = Server.MapPath(strFolder);

            // Get the name of the file that is posted.
            strFileName = oFile3.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile3.Value != "")
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
                    lblImages3.Text = strFileName + " đã tồn tại trên máy chủ!";
                    lblImages3.Visible = true;
                    lbImages3.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage3.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\"/>";
                }
                else
                {
                    oFile3.PostedFile.SaveAs(strFilePath);
                    lblImages3.Text = strFileName + " đã tải lên thành công!";
                    lbImages3.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage3.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\" />";
                }
            }
            else
            {
                ltrUploadResultImage3.Text = "Bấm 'Browse' để chọn file cần tải lên!";
            }
        }


        private void btnUploadImage4_Click(object sender, System.EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder = "~/Upload/ImageHouse/";
            strFolder = Server.MapPath(strFolder);

            // Get the name of the file that is posted.


            strFileName = oFile4.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile4.Value != "")
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
                    lblImages4.Text = strFileName + " đã tồn tại trên máy chủ!";
                    lblImages4.Visible = true;
                    lbImages4.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage4.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\"/>";
                }
                else
                {
                    oFile4.PostedFile.SaveAs(strFilePath);
                    lblImages4.Text = strFileName + " đã tải lên thành công!";
                    lbImages4.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage4.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\" />";
                }
            }
            else
            {
                ltrUploadResultImage4.Text = "Bấm 'Browse' để chọn file cần tải lên!";
            }
        }

        private void btnUploadImage5_Click(object sender, System.EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder = "~/Upload/ImageHouse/";
            strFolder = Server.MapPath(strFolder);

            // Get the name of the file that is posted.


            strFileName = oFile5.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile5.Value != "")
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
                    lblImages5.Text = strFileName + " đã tồn tại trên máy chủ!";
                    lblImages5.Visible = true;
                    lbImages5.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage5.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\"/>";
                }
                else
                {
                    oFile5.PostedFile.SaveAs(strFilePath);
                    lblImages5.Text = strFileName + " đã tải lên thành công!";
                    lbImages5.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage5.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\" />";
                }

            }
            else
            {
                ltrUploadResultImage5.Text = "CBấm 'Browse' để chọn file cần tải lên!";
            }
        }

        private void btnUploadImage6_Click(object sender, System.EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder = "~/Upload/ImageHouse/";
            strFolder = Server.MapPath(strFolder);

            // Get the name of the file that is posted.
            strFileName = oFile6.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile6.Value != "")
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
                    lblImages6.Text = strFileName + " đã tồn tại trên máy chủ!";
                    lblImages6.Visible = true;
                    lbImages6.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage6.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\"/>";
                }
                else
                {
                    oFile6.PostedFile.SaveAs(strFilePath);
                    lblImages6.Text = strFileName + " đã tải lên thành công!";
                    lbImages6.Text = "../Upload/ImageHouse/" + strFileName;
                    ltrUploadResultImage6.Text = "<img src=\"../Upload/ImageHouse/" + strFileName + " \" width=\"100%\" />";
                }
            }
            else
            {
                ltrUploadResultImage6.Text = "Bấm 'Browse' để chọn file cần tải lên!";
            }
        }
    }
}