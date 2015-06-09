using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Modules
{
    public partial class Register : System.Web.UI.UserControl
    {
        public event EventHandler ThemNguoiDung = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (ThemNguoiDung != null)
            {
                var lstUser = UsersService.UsersInfo_GetByAll();
                var obj = new UsersInfo
                {
                    UserName = txtUserName.Text,
                    Password = txtPassword.Text,
                    FullName = txtFullName.Text,
                    Gender = rdGender.SelectedValue,
                    Avatar = "",
                    Birthday = txtYear + "-" + ddlThang.SelectedValue + "-" + ddlNgay.SelectedValue,
                    Email = txtEmail.Text,
                    Address = txtAddress.Text,
                    MobilePhone = txtNumberPhone.Text,
                    IdentityCard = txtIdentyCard.Text,
                    LastLoggedOn = "",
                    CreatedDate = DateTime.Now.ToString().Trim(),
                    GroupID = "",
                    Active = "0",
                    Level = "2",
                    Ord = "",
                    Admin = "",
                };
                //UsersService.UsersInfo_Insert(obj);
                Session["UserControl"] = "~/Default2.aspx?mod=Register";
                Response.Redirect("~/Default2.aspx?mod=RegisterSuccess");

                ThemNguoiDung(sender, e);
            }
            
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
            txtYear.Text = "";
        }
    }
}