using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        private string _realEstateNewsID;
        public List<RealEstateNewsInfo> listRealEstateNew;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _realEstateNewsID = Request.QueryString["ID"];
                listRealEstateNew = RealEstateNewService.RealEstateNewsInfo_GetById(_realEstateNewsID);
            }
            
            
        }

        private void LoadRealEstateNews()
        {
            _realEstateNewsID = Request.QueryString["ID"];
            List<RealEstateNewsInfo> listRealEstateNew = new List<RealEstateNewsInfo>();
            listRealEstateNew = RealEstateNewService.RealEstateNewsInfo_GetById(_realEstateNewsID);
        }
    }
}