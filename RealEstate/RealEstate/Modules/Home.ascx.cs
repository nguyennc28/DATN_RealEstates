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
                LoadHome();
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

        private void LoadHome()
        {
            string chuoi = "";
            List<ApartmentInfo> listApartmentInfos = new List<ApartmentInfo>();
            listApartmentInfos = ApartmentService.ApartmentInfo_GetByAll("vi");
            if (listApartmentInfos.Count > 0)
            {
                for (int i = 0; i < listApartmentInfos.Count; i++)
                {
                    chuoi += "<div class=\" row \" style=\" margin-left: 10px; line-height: 20px;\">";
                    chuoi += "<h3 style=\" color: blue;\"> <a href = \" Default2.aspx?mod=" + listApartmentInfos[i].Tag + "\" style=\" color: olive;\">" + listApartmentInfos[i].Title +
                             "</a> </h3>";

                    //cột trái
                    chuoi += "<div class=\"span1\" style=\" width: 135px;\">";
                    chuoi += "<a href=\" " + listApartmentInfos[i].Tag + " \" alt=\" Xem chi tiết \"><img src=\"" + listApartmentInfos[i].Image1 + "\"/>";
                    chuoi += "</div>";
                    //cột phải
                    chuoi += "<div class=\"span5\">";
                    chuoi += "<p ><span style=\" color: green;\" >" + listApartmentInfos[i].Description + "</span></p>";
                    chuoi += "<p>" + "Giá: " + "<span style=\"color: red;\">" + listApartmentInfos[0].Price + "</span>" + " VND" + " | " + "Tổng diện tích: " + "<span style=\"color: red;\">" + listApartmentInfos[0].TotalArea + "</span>" + " | " +
                             "Diện tích nhà: " + "<span style=\"color: red;\">" + listApartmentInfos[0].FloorArea + "</span>" + " | " + "Số phòng ngủ: " + "<span style=\"color: red; font-weight:bold;\">" +
                             listApartmentInfos[0].BedroomNumber + "</span>" + "</p>";
                    chuoi += "<p>" + "<table><tr><td width=\"50%\">Địa chỉ: " + "<span style=\"color: blue;\">" + listApartmentInfos[i].Address + "</span>" + "</td><td width=\"50%\">Người đăng: " + "<span style=\"color: blue; \">" + listApartmentInfos[i].CreateBy + "</span>" + "</td></tr></table></p>";
                    chuoi += "</div>";
                    chuoi += "<hr style=\" margin-left: 9px; width: 99%; color: grey\">";
                    chuoi += "</div>";
                }
            }
            else
            {
                chuoi += "<p>" + "Không có dữ liều nào để hiển thị </p>";
            }
            ltrTab1.Text = chuoi;
            listApartmentInfos.Clear();
        }
    }
}