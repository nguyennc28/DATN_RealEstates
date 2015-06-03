using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.Controls
{
    public partial class FeNavbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"].ToString().Equals(""))
                {
                    lblUserName.Text = "Đăng nhập";
                }
                else
                {
                    lblUserName.Text = "Xin chào " + Session["UserName"].ToString();
                }
            }
        }
    }
}