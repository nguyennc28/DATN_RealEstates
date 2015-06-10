using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class ViewPostNewRE : System.Web.UI.Page
    {
        public int PageView;
        public int RealEstateOwnerId;
        public int HomeId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageView = int.Parse(Request.QueryString["PageView"]);
                //RealEstateOwnerId = int.Parse(Request.QueryString["reOwnerID"]);
                HomeId = int.Parse(Request.QueryString["homeID"]);
                Label1.Text = PageView.ToString() + HomeId.ToString();
            }
        }
    }
}