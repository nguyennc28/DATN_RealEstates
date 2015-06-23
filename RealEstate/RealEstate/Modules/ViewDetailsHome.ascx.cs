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
    public partial class ViewDetailsHome : System.Web.UI.UserControl
    {
        private string _homeID;
        public List<HomeInfo> ListHomeInfos;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string chuoi = "";
                _homeID = Request.QueryString["HomeID"];

                ListHomeInfos = HomeService.HomeInfo_GetById(_homeID);
                if (ListHomeInfos.Count > 0)
                {
                    for (int i = 0; i < ListHomeInfos.Count; i++)
                    {
                        chuoi += "<div class=\" row \" style=\"line-height: 25px;\">";
                        chuoi += "<h3><span style=\" color: blue;\"> <a href = \" Default2.aspx?mod=" +
                                 ListHomeInfos[i].Tag + "\">" + ListHomeInfos[i].Title +
                                 "</a> </span></h3>";
                        chuoi += "<hr style=\" border: 1px solid grey;\">";
                        //cột trái
                        chuoi += "<div class=\"span3\">";
                        chuoi += "<img src=\"" + ListHomeInfos[i].Image1 + "\" />";
                        
                        if (ListHomeInfos[i].Image2 != "")
                        {                            
                            chuoi += "<img src=\"" + ListHomeInfos[i].Image2 + "\" />";
                            chuoi += "</div>";
                            if (ListHomeInfos[i].Image3 != "")
                            {
                                chuoi += "<img src=\"" + ListHomeInfos[i].Image3 + "\" />";
                                if (ListHomeInfos[i].Image4 != "")
                                {                                    
                                    chuoi += "<img src=\"" + ListHomeInfos[i].Image4 + "\" />";

                                    if (ListHomeInfos[i].Image5 != "")
                                    {
                                        chuoi += "<img src=\"" + ListHomeInfos[i].Image5 + "\" />";
                                        if (ListHomeInfos[i].Image6 != "")
                                        {
                                            chuoi += "<img src=\"" + ListHomeInfos[i].Image1 + "\" />"; 
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            
                        }
                        chuoi += "</div>";

                        //cột phải
                        chuoi += "<div class=\"span6\">";
                        chuoi += "<p style=\"text-align: justify;\">" + ListHomeInfos[i].Description + "</p>";
                        chuoi += "<p>" + "Giá: " + "<span style=\"color: red; font-weight:bold;\">" +
                                 ListHomeInfos[0].Price + "</span>" + " VND" + " | " + "Tổng diện tích: " +
                                 "<span style=\"color: red; font-weight:bold;\">" + ListHomeInfos[0].TotalArea +
                                 "</span>" + " | " +
                                 "Diện tích nhà: " + "<span style=\"color: red; font-weight:bold;\">" +
                                 ListHomeInfos[0].FloorArea + "</span>" + " | " + "Số phòng ngủ: " +
                                 "<span style=\"color: red; font-weight:bold;\">" +
                                 ListHomeInfos[0].BedroomNumber + "</span>" + "</p>";
                        chuoi += "<p>" + "<table><tr><td width=\"60%\">Địa chỉ: " +
                                 "<span style=\"color: blue; font-weight:bold;\">" + ListHomeInfos[i].Address +
                                 "</span>" + "</td><td width=\"40%\">Người đăng: " +
                                 "<span style=\"color: blue; font-weight:bold;\">" + ListHomeInfos[i].CreateBy +
                                 "</span>" + "</td></tr></table></p>";
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
                ListHomeInfos.Clear();
            }
        }
    }
}