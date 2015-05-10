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
    public partial class FeBannerSlide : System.Web.UI.UserControl
    {
        List<Advertise> lstAdvertises = new List<Advertise>(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            lstAdvertises = AdvertiseService.Advertise_GetByTop("1", "", "");
            string chuoi = "";
            if (lstAdvertises.Count > 0)
            {
                chuoi += "<div class=\" item active \">";
                chuoi += "<img src=\" " + lstAdvertises[0].Image + " \"  />";
                //style =\" width:980px; height:277px \"
                chuoi += "<div class = \" carousel-caption \">";
                chuoi += "<h4>" + lstAdvertises[0].AdvName + "</h4>";
                chuoi += "<p>" + lstAdvertises[0].Content + "</p>";
                chuoi += "</div>";
                chuoi += "</div>";

                chuoi += "<div class=\" item \">";
                chuoi += "<img src=\" " + lstAdvertises[0].Image + " \"  />";
                chuoi += "<div class = \" carousel-caption \">";
                chuoi += "<h4>" + lstAdvertises[0].AdvName + "</h4>";
                chuoi += "<p>" + lstAdvertises[0].Content + "</p>";
                chuoi += "</div>";
                chuoi += "</div>";

                //for (int i = 0; i < lstAdvertises.Count; i++)
                //{
                //    chuoi += "<div class=\" item active \">";
                //    chuoi += "<img src=\" " + lstAdvertises[i].Image + " \" style =\" width:980px; height:277px \" />";
                //    chuoi += "<div class = \" carousel-caption \">";
                //    chuoi += "<h4>" + lstAdvertises[i].AdvName + "</h4>";
                //    chuoi += "<p>" + lstAdvertises[i].Content + "</p>";
                //    chuoi += "</div>";
                //    chuoi += "</div>";
                //    for (int j = i + 1; j <= lstAdvertises.Count; j++)
                //    {
                //        chuoi += "<div class=\" item \">";
                //        chuoi += "<img src=\" " + lstAdvertises[i].Image + " \" style =\" width:980px; height:277px \" />";
                //        chuoi += "<div class = \" carousel-caption \">";
                //        chuoi += "<h4>" + lstAdvertises[i].AdvName + "</h4>";
                //        chuoi += "<p>" + lstAdvertises[i].Content + "</p>";
                //        chuoi += "</div>";
                //        chuoi += "</div>";
                //    }
                //}
            }
            ltrBannerSilde.Text = chuoi;
            lstAdvertises.Clear();
        }
    }
}