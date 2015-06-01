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
    public partial class FeBannerSlide1 : System.Web.UI.UserControl
    {
        public List<Advertise> lstAdvertises = new List<Advertise>(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lstAdvertises = AdvertiseService.Advertise_GetByTop("10", "", "");
            }

        }
    }
}