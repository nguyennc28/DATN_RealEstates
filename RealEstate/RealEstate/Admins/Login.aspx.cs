﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Admins
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            //UserService userService = new UserService();
            int qh = UserService.User_CheckLogin(txtUsername.Text, txtPassword.Text);
            if (qh > 0)
            {
                Session["UserName"] = txtUsername.Text.Trim();
                Response.Redirect("~/Admins/Default.aspx");
            }
            else
            {
                WebMsgBox.Show("Sai thông tin đăng nhập!");
            }
        }

        protected void btnHuyBo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}