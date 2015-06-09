using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class ViewRegister : System.Web.UI.Page
    {
        public int UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserID = int.Parse(Request.QueryString["id"]);
                Label1.Text = UserID.ToString();
            }
        }
    }
}