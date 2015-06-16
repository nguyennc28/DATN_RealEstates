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
                LoadBroker();
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

        private void LoadBroker()
        {
            string chuoi = "";
            List<UsersInfo> listBroker = new List<UsersInfo>();
            listBroker = UsersService.UsersInfo_GetByTop("5", "GroupID = 4", "");
            if (listBroker.Count > 0)
            {
                for (int i = 0; i < listBroker.Count; i++)
                {
                    chuoi += "<div style=\" width: 40%; float: left;\">";
                    chuoi += "<a href=\" \" alt=\" Xem chi tiết \"><img src=\"" + listBroker[i].Avatar + "\" style=\"  \"/></a>";
                    chuoi += "</div>";

                    chuoi += "<div style=\" width:55%; float: right; line-height: 10px;\">";
                    chuoi += "<p><span style=\" font-size: 14px; color: #535699;\">" + listBroker[i].FullName + "</span></p>";
                    chuoi += "<p><span style=\" font-size: 12px; color: red;\">" + listBroker[i].MobilePhone + "</span></p>";
                    chuoi += "<p><span style=\" font-size: 12px; color: #535699;\">" + listBroker[i].Address + "</span></p>";
                    chuoi += "</div>";
                }
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
                    chuoi += "<a href=\" " + listApartmentInfos[i].Tag + " \" alt=\" Xem chi tiết \"><img src=\"" + listApartmentInfos[i].Image1 + "\"/></a>";
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