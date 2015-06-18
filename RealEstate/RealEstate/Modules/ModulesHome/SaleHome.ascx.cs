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
    public partial class SaleHome : System.Web.UI.UserControl
    {
        public List<HomeInfo> listHome = new List<HomeInfo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listHome = HomeService.HomeInfo_GetByTop("3", "", "");
                //Load_Home();
                LoadSaleApartments();
            }            
        }
        private void Load_Home()
        {
            listHome = HomeService.HomeInfo_GetByTop("2", "", "");
            string chuoi = "";
            if (listHome.Count > 0)
            {
                for (int i = 0; i < listHome.Count; i++)
                {
                    chuoi += "<div class =\"ListPro\">";
                    chuoi += "<p class=\"Title\">" + listHome[0].TransactionType + "</p>";
                    chuoi += "<table class=\"tbList\"> <tr class=\"trList\"> <td colspan=\"3\" class=\"tdList1\"><img src=\"" + listHome[0].Image1 + "\" style=\" width:310px \"/></td></tr> <tr class=\"trList\"> <td class=\"tdList\"><img src=\"" + listHome[0].Image2 + "\" style=\" width:100px \"/> </td> <td class=\"tdList\"> <img src=\"" + listHome[0].Image3 + "\" style=\" width:100px \"/></td> <td class=\"tdList\"> <img src=\"" + listHome[0].Image4 + "\" style=\" width:100px \"/> </td></tr> </table>";
                    chuoi += "</div>";
                }
            }
            ltrTab1.Text = chuoi;
            listHome.Clear();
        }
        private void LoadSaleApartments()
        {
            string chuoi = "";
            List<HomeInfo> listApartmentInfos = new List<HomeInfo>();
            listApartmentInfos = HomeService.HomeInfo_GetByAll();
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
            ltrHome.Text = chuoi;
            //ltrTab2.Text = chuoi;
            listApartmentInfos.Clear();
        }
    }
}