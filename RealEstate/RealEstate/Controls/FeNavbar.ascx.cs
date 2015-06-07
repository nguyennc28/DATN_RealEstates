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
                    linkLogin.Visible = true;
                    linkDangKy.Visible = true;
                    linkXinChao.Visible = false;
                    LinkDangXuat.Visible = false;
                }
                else
                {
                    lblUserName.Text = "Xin chào " + Session["UserName"].ToString();
                    linkLogin.Visible = false;
                    linkXinChao.Visible = true;
                    linkDangKy.Visible = false;
                    LinkDangXuat.Visible = true;
                }
            }
        }
        protected void linkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Login2.aspx");
        }

        protected void linkXinChao_Click(object sender, EventArgs e)
        {
            Response.Redirect("/EditInfoUser.aspx");
        }

        protected void linkDangKy_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Register.aspx");
        }

        protected void LinkDangXuat_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            linkDangKy.Visible = true;
            LinkDangXuat.Visible = false;
            linkLogin.Visible = true;
            linkXinChao.Visible = false;
            Response.Redirect("/Default2.aspx?mod=Home");
        }
    }
}