using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.Common;

namespace RealEstate
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            int qh = UsersService.UsersInfo_CheckLogin(txtUserName.Text, txtPassword.Text);
            if (qh > 0)
            {
                switch (qh)
                {
                    case 1:
                        Session["UserName"] = txtUserName.Text.Trim();
                        Response.Redirect("~/Admins/Default.aspx");
                        break;
                    case 2:
                        Session["UserName"] = txtUserName.Text.Trim();
                        Response.Redirect("Default2.aspx");
                        break;
                }

            }
            else
            {
                WebMsgBox.Show("Sai thông tin đăng nhập!");
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("GetPassword.aspx");
        }
    }
}