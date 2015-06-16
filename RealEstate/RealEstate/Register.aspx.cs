using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate
{
    public partial class Register : System.Web.UI.Page
    {
        private int UserID;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static byte[] encryptData(string data)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashedBytes;
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
            return hashedBytes;
        }
        public static string md5(string data)
        {
            return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            var lstUser = UsersService.UsersInfo_GetByAll();
            var obj = new UsersInfo
            {
                UserName = txtUserName.Text,
                Password = md5(txtPassword.Text),
                FullName = txtFullName.Text,
                Gender = rdGender.SelectedValue,
                Avatar = lbImages1.Text,
                Birthday = "",
                Email = txtEmail.Text,
                Address = txtAddress.Text,
                MobilePhone = txtNumberPhone.Text,
                IdentityCard = txtIdentyCard.Text,
                LastLoggedOn = "",
                CreatedDate = "",
                GroupID = ddlNhomNguoiDung.SelectedValue,
                Active = "0",
                Level = "2",
                Ord = "",
                Admin = "",
            };
            int userId = UsersService.UsersInfo_Insert(obj, UserID);
            Session["UserControl"] = "~/Default2.aspx?mod=Register";
            Response.Redirect("~/ViewRegister.aspx?id=" + userId);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtFullName.Text = "";
            txtIdentyCard.Text = "";
            txtNumberPhone.Text = "";
            txtPassword.Text = "";
            txtReEmail.Text = "";
            txtRePassword.Text = "";
            txtUserName.Text = "";
            //txtYear.Text = "";
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
       
        }
        #endregion
        private void btnUploadImage_Click(object sender, System.EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder = "~/Upload/Avartar/";
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
                    ltrUploadResultImage.Text = "<img src=\"../Upload/Avartar/" + strFileName + " \" width=\"50%\"/>";
                    lbImages1.Text = "../Upload/Avartar/" + strFileName;
                }
                else
                {
                    oFile.PostedFile.SaveAs(strFilePath);
                    lblImages.Text = strFileName + " đã tải lên thành công!";
                    lbImages1.Text = "../Upload/Avartar/" + strFileName;
                    ltrUploadResultImage.Text = "<img src=\"../Upload/Avartar/" + strFileName + " \" width=\"50%\" />";
                }
            }
            else
            {
                ltrUploadResultImage.Text = "Bấm 'Browse' để chọn file cần tải lên!";
            }
        }
    }
}