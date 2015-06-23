using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Modules.ModulesHome
{
    public partial class HousePavement : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSaleIHousePavement();
            }
        }
        private void LoadSaleIHousePavement()
        {
            string chuoi = "";
            List<HomeInfo> listApartmentInfos = new List<HomeInfo>();
            listApartmentInfos = HomeService.HomeInfo_GetByTop("10", "HomeTypeID = 5", "");
            if (listApartmentInfos.Count > 0)
            {
                for (int i = 0; i < listApartmentInfos.Count; i++)
                {
                    chuoi += "<div class=\" row \" style=\"line-height: 25px;\">";
                    chuoi += "<h3><span style=\" color: blue;\"> <a href = \" Default2.aspx?mod=" + listApartmentInfos[i].Tag + "\">" + listApartmentInfos[i].Title +
                             "</a> </span></h3>";

                    //cột trái
                    chuoi += "<div class=\"span3\">";
                    chuoi += "<img src=\"" + listApartmentInfos[i].Image1 + "\" />";
                    chuoi += "</div>";
                    //cột phải
                    chuoi += "<div class=\"span6\">";
                    chuoi += "<p>" + listApartmentInfos[i].Description + "</p>";
                    chuoi += "<p>" + "Giá: " + "<span style=\"color: red; font-weight:bold;\">" + listApartmentInfos[0].Price + "</span>" + " VND" + " | " + "Tổng diện tích: " + "<span style=\"color: red; font-weight:bold;\">" + listApartmentInfos[0].TotalArea + "</span>" + " | " +
                             "Diện tích nhà: " + "<span style=\"color: red; font-weight:bold;\">" + listApartmentInfos[0].FloorArea + "</span>" + " | " + "Số phòng ngủ: " + "<span style=\"color: red; font-weight:bold;\">" +
                             listApartmentInfos[0].BedroomNumber + "</span>" + "</p>";
                    chuoi += "<p>" + "<table><tr><td width=\"60%\">Địa chỉ: " + "<span style=\"color: blue; font-weight:bold;\">" + listApartmentInfos[i].Address + "</span>" + "</td><td width=\"40%\">Người đăng: " + "<span style=\"color: blue; font-weight:bold;\">" + listApartmentInfos[i].CreateBy + "</span>" + "</td></tr></table></p>";
                    chuoi += "</div>";
                    chuoi += "</div>";
                    //chuoi += "<hr style=\" border: 1px solid grey;\">";
                }
            }
            else
            {
                chuoi += "<p>" + "Không có dữ liều nào để hiển thị </p>";
            }
            ltrTab1.Text = chuoi;
            //ltrTab2.Text = chuoi;
            listApartmentInfos.Clear();
        }
    }
}