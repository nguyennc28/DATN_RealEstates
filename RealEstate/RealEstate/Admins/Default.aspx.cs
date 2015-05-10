using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RealEstate.Admins
{
    public partial class Default : System.Web.UI.Page
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
                    case "DistrictManager":
                        ct = Page.LoadControl("/Admins/Modules/DistrictManager.ascx");
                        break;
                    default:
                        ct = Page.LoadControl("/Admins/Modules/Login.ascx");
                        break;
                }
                gel.Controls.Add(ct);
                PlaceHolderAdmin.Controls.Add(gel);
            }
        }
    }
}