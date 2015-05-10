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
    public partial class BannerNgang : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showlist();
            }
        }
        void showlist()
        {
            List<Advertise> list = new List<Advertise>();
            list = AdvertiseService.Advertise_GetByTop("10","","");
            string chuoi = "";
            if (list.Count > 0)
            {
                chuoi += "<script type=\"text/javascript\">";
                chuoi += " var imagesDataArray = [";
                for (int i = 0; i < list.Count; i++)
                {
                    chuoi += "{";
                    chuoi += "src: '" + list[i].Image + "',";
                    chuoi += "url: '" + list[i].Link + "',";
                    chuoi += "target: '" + list[i].Target + "',";
                    chuoi += "description: '" + list[i].AdvName + "'";
                    chuoi += "},";
                }

                chuoi += "];";
                chuoi += " jQuery(function () {";
                chuoi += "$('#flipedge').shockwave(imagesDataArray, {";
                chuoi += "'slider-type': 'FlipEdgeSlider',";
                chuoi += "'tiles-in-x': 7,";
                chuoi += "'tiles-in-y': 1,";
                chuoi += "'fixed-rotation-axis': [1, 0, 0],";
                chuoi += "'controller-default-wave-origin': ['50%', '50%'],";
                chuoi += "'autostart-slideshow': true";
                chuoi += "});";
                chuoi += " })";
                chuoi += "</script>";
            }
            ltrslide.Text = chuoi;
        }
    }
}