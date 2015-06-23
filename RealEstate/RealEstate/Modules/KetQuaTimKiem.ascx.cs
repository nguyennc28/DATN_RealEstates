using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Modules
{
    public partial class KetQuaTimKiem : System.Web.UI.UserControl
    {
        string currentpage = "1";
        string key = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["key"] != null) { key = Session["key"].ToString(); Session["key"] = key.ToString(); }
            if (!IsPostBack)
            {
                LoadShowHome();
            }
        }
        private void LoadShowHome()
        {
            string chuoi = "";
            List<HomeInfo> listHomeInfos = new List<HomeInfo>();
            listHomeInfos = HomeService.HomeInfo_GetByTop("", Session["key"].ToString(), "");
            if (listHomeInfos.Count > 0)
            {
                for (int i = 0; i < listHomeInfos.Count; i++)
                {
                    chuoi += "<div class=\" row \" style=\"line-height: 25px;\">";
                    chuoi += "<h3><span style=\" color: blue;\"> <a href = \" Default2.aspx?mod=ViewDetailsHome&HomeID=" + listHomeInfos[i].HomeID + "\">" + listHomeInfos[i].Title +
                             "</a> </span></h3>";

                    //cột trái
                    chuoi += "<div class=\"span3\">";
                    chuoi += "<img src=\"" + listHomeInfos[i].Image1 + "\" />";
                    chuoi += "</div>";
                    //cột phải
                    chuoi += "<div class=\"span6\">";
                    chuoi += "<p>" + listHomeInfos[i].Description + "</p>";
                    chuoi += "<p>" + "Giá: " + "<span style=\"color: red; font-weight:bold;\">" + listHomeInfos[0].Price + "</span>" + " VND" + " | " + "Tổng diện tích: " + "<span style=\"color: red; font-weight:bold;\">" + listHomeInfos[0].TotalArea + "</span>" + " | " +
                             "Diện tích nhà: " + "<span style=\"color: red; font-weight:bold;\">" + listHomeInfos[0].FloorArea + "</span>" + " | " + "Số phòng ngủ: " + "<span style=\"color: red; font-weight:bold;\">" +
                             listHomeInfos[0].BedroomNumber + "</span>" + "</p>";
                    chuoi += "<p>" + "<table><tr><td width=\"60%\"><span style=\" color: #676563;\">Địa chỉ: </span>" + "<span style=\"color: blue; font-weight:bold;\">" + listHomeInfos[i].Address + "</span>" + "</td><td width=\"40%\"><span style=\" color: #676563;\">Người đăng: </span>" + "<span style=\"color: blue; font-weight:bold;\">" + listHomeInfos[i].CreateBy + "</span>" + "</td></tr></table></p>";
                    chuoi += "</div>";
                    chuoi += "<hr style=\" width: 99.5%; color: grey; margin-left: 5px;\">";
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
            listHomeInfos.Clear();
        }
        
    }
}