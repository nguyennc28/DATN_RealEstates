using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class Default2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string module = null;
            Control ct = null;
            if (!IsPostBack)
            {
                module = Server.HtmlEncode(Request.QueryString["mod"]);
                HtmlGenericControl gel = new HtmlGenericControl("div");
                switch (module)
                {
                    case "login":
                        ct = Page.LoadControl("login");
                        break;
                    case "SaleHousing":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleHousing.ascx");
                        break;
                    default:
                        ct = Page.LoadControl("/Modules/Test.ascx");
                        break;
                }
                gel.Controls.Add(ct);
                PlaceHolder1.Controls.Add(gel);
            }
        }
    }
}