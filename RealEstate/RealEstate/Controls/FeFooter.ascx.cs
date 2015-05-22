using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Controls
{
    public partial class Footer : System.Web.UI.UserControl
    {
        public List<Link> listLinks; 
        protected void Page_Load(object sender, EventArgs e)
        {
            //listLinks = LinkService.Link_GetByAll("vi");
        }
    }
}