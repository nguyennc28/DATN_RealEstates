using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Modules
{
    public partial class Home : System.Web.UI.UserControl
    {
        public List<RealEstateNewsInfo> listRealEstateNewsInfos = new List<RealEstateNewsInfo>();
        protected void Page_Load(object sender, EventArgs e)
        {                        
            if (!IsPostBack)
            {
                LoadNewsImageSlide();
            }
        }

        private void LoadNewsImageSlide()
        {
            string chuoiImageLinks = "";
            string chuoiTextLink = "";
            listRealEstateNewsInfos = RealEstateNewService.RealEstateNewsInfo_GetByTop("10", "Position=1", "Lang");
            if (listRealEstateNewsInfos.Count != 0)
            {
                for (int i = 0; i < listRealEstateNewsInfos.Count; i++)
                {
                    chuoiImageLinks += "<li> <a href=\" # \" target=\"_blank\">";
                    chuoiImageLinks += " <img src=\"" + listRealEstateNewsInfos[i].Images + " \" alt=\" \"/>";
                    chuoiImageLinks += "</a></li>";

                    chuoiTextLink += "<li> <a href=\"#\" target=\"_blank \" >" + listRealEstateNewsInfos[i].Title +
                                     "</a> </li>";                     
                }
                ltrImagesLink.Text = chuoiImageLinks;
                ltrTextLink.Text = chuoiTextLink;
                listRealEstateNewsInfos.Clear();
            }
        }

        
    }
}