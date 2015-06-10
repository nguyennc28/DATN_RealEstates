using RealEstate.Business;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.DataAccess;

namespace RealEstate
{
    public partial class PostRentLand : System.Web.UI.Page
    {
        private string _cityCode;
        private int _reOwnerId;
        private int _homeId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewCity4();
                ViewRealEstate4();
            }
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
        protected void btnRentLand_Click(object sender, ImageClickEventArgs e)
        {
            var objRealEstateOwner = new RealEstateOwnersInfo
            {
                RealEstateOwnersName = txtRealEstateOwner4.Text,
                CLUR = rdCLUR4.SelectedValue,
                RealEstateOwnersType = rdRealEstateOwnerType4.SelectedItem.ToString(),
                Gender = rdGender4.SelectedValue,
                Address = txtAddress42.Text,
                IdentityCard = txtIdentyCard4.Text,
                MobilePhone = txtMobilePhone4.Text,
                Email = txtEmail4.Text,

            };
            int realEstateOwnerID = RealEstateOwnersService.RealEstateOwnersInfo_Insert(objRealEstateOwner, _reOwnerId);

            var obj2 = new LandInfo
            {
                LandTypeID = ddlLandType4.SelectedValue,
                Name = txtTenNha4.Text,
                RealEstateOwnersID = "1",
                RealEstateID = ddlRealEstate4.SelectedValue,
                Title = "",
                TransactionType = "sale",
                Tag = "",
                CreateBy = txtTenChuSoHuu4.Text,
                CreateDate = DateTime.Now.ToShortDateString(),
                RealEstateOwnersName = txtTenChuSoHuu4.Text,
                CityID = ddlCity4.SelectedValue,
                LocationID = "",
                DistrictID = ddlDistrict4.SelectedValue,
                Address = txtAddress4.Text + ddlDistrict4.SelectedItem + ddlCity4.SelectedItem,
                Description = "N" + txtDescription4.Text,
                TotalArea = txtArea4.Text,
                Price = txtPrice4.Text,
                Image1 = lbImages1.Text,
                Image2 = lbImages2.Text,
                Image3 = lbImages3.Text,
                Image4 = lbImages4.Text,
                Image5 = lbImages5.Text,
                Image6 = lbImages6.Text
            };
            int homeID2 = LandService.LandInfo_InsertGetID(obj2, _homeId);
            Response.Redirect("~/ViewPostNewRE.aspx?reOwnerID=" + realEstateOwnerID + "&homeID=" + homeID2);
        }
        private void ViewCity4()
        {
            ddlCity4.Items.Clear();
            ddlCity4.Items.Add(new ListItem("-Chọn Tỉnh(TP)-", "0"));
            List<CityInfo> listCityInfos = CityService.CityInfo_GetByAll();
            if (listCityInfos.Count > 0)
            {
                for (int i = 0; i < listCityInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listCityInfos[i].CityName, listCityInfos[i].CityCode);
                    ddlCity4.Items.Add(lsListItem);
                }
                listCityInfos.Clear();
                listCityInfos = null;
            }
            _cityCode = ddlCity4.SelectedValue;
            ViewDistrict4();
        }
        private void ViewDistrict4()
        {
            ddlDistrict4.Items.Clear();
            if (_cityCode == "0")
            {
                ddlDistrict4.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));
            }
            else
            {
                List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100", "CityCode =" + _cityCode, "DistrictID");
                for (int i = 0; i < listDistrictInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName, listDistrictInfos[i].DistrictID);
                    ddlDistrict4.Items.Add(lsListItem);
                }
                listDistrictInfos.Clear();
                listDistrictInfos = null;
            }
        }
        private void ViewRealEstate4()
        {
            ddlRealEstate4.Items.Clear();
            ddlRealEstate4.Items.Add(new ListItem("-Chọn BĐS-", "0"));
            List<RealEstateInfo> list = RealEstateService.RealEstateInfo_GetByAll();
            if (list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    ListItem lsListItem = new ListItem(list[i].RealEstateName, list[i].RealEstateID);
                    ddlRealEstate4.Items.Add(lsListItem);
                }
                list.Clear();
                list = null;
            }
            //_cityCode = ddlCity.SelectedValue;
        }
        protected void ddlCity4_SelectedIndexChanged(object sender, EventArgs e)
        {
            _cityCode = ddlCity4.SelectedValue;
            ViewDistrict4();
        }
    }
}