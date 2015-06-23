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
    public partial class Default : System.Web.UI.Page
    {
        private string _cityCode;
        public List<RealEstateNewsInfo> listRealEstateNewsInfos = new List<RealEstateNewsInfo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewCity();
                GetArea();
                GetPrice();
                GetBetroomNum();
                ViewRealEstateType();
                LoadNewsImageSlide();
                LoadHome();
                LoadBroker();
                if (Session["cityName"] != null)
                {
                    ddlCitySl.SelectedValue = Session["cityName"].ToString();
                }
                if (Session["districtName"] != null)
                {
                    ddlDistrictSl.SelectedValue = Session["districtName"].ToString();
                }
                if (Session["price"] != null)
                {
                    ddlPriceSl.SelectedValue = Session["price"].ToString();
                }
                if (Session["area"] != null)
                {
                    ddlAreaSl.SelectedValue = Session["area"].ToString();
                }
                if (Session["k"] != null)
                {
                    txtSearchKeyword1.Text = Session["k"].ToString();
                }

            }
        }
        private void ViewRealEstateType()
        {
            ddlRealEstateType.Items.Clear();
            ddlRealEstateType.Items.Add(new ListItem("-Chọn loại BĐS-", "0"));
            List<RealEstateTypeInfo> listEstateTypeInfos = RealEstateTypeService.RealEstateTypeInfo_GetByAll();
            for (int i = 0; i < listEstateTypeInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listEstateTypeInfos[i].NameRealEstateType,
                    listEstateTypeInfos[i].RealEstateTypeID);
                ddlRealEstateType.Items.Add(lsListItem);

            }
            listEstateTypeInfos.Clear();
            listEstateTypeInfos = null;
        }
        private void ViewCity()
        {
            ddlCitySl.Items.Clear();
            ddlCitySl.Items.Add(new ListItem("-Chọn Tỉnh(TP)-", "0"));
            List<CityInfo> listCityInfos = CityService.CityInfo_GetByAll();
            if (listCityInfos.Count > 0)
            {
                for (int i = 0; i < listCityInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listCityInfos[i].CityName, listCityInfos[i].CityCode);
                    ddlCitySl.Items.Add(lsListItem);
                }
                listCityInfos.Clear();
                listCityInfos = null;
            }
            _cityCode = ddlCitySl.SelectedValue;
            ViewDistrict();
        }
        private void GetPrice()
        {
            ddlPriceSl.Items.Clear();
            ddlPriceSl.Items.Add(new ListItem("-Chọn giá (VNĐ)-", "0"));
            ddlPriceSl.Items.Add(new ListItem("Dưới 1 tỷ VNĐ", "1000000000"));
            ddlPriceSl.Items.Add(new ListItem("1 tỷ VNĐ - 1.5 tỷ VNĐ", "1500000000"));
            ddlPriceSl.Items.Add(new ListItem("1.5 tỷ - 2 tỷ VNĐ", "2000000000"));
            ddlPriceSl.Items.Add(new ListItem("2 tỷ VNĐ - 2.5 tỷ VNĐ", "2500000000"));
            ddlPriceSl.Items.Add(new ListItem("2.5 tỷ VNĐ - 3 tỷ VNĐ", "3000000000"));
            ddlPriceSl.Items.Add(new ListItem("3 tỷ VNĐ - 3.5 tỷ VNĐ", "3500000000"));
            ddlPriceSl.Items.Add(new ListItem("3.5 tỷ VNĐ - 4 tỷ VNĐ", "4000000000"));
            ddlPriceSl.Items.Add(new ListItem("4 tỷ VNĐ - 4.5 tỷ VNĐ", "4500000000"));
            ddlPriceSl.Items.Add(new ListItem("4.5 tỷ VNĐ - 5 tỷ VNĐ", "5000000000"));
            ddlPriceSl.Items.Add(new ListItem("trên 5 tỷ VNĐ", "5000001000"));
        }
        private void GetBetroomNum()
        {
            ddlBetroomNum.Items.Clear();
            ddlBetroomNum.Items.Add(new ListItem("-Chọn số phòng ngủ-", "0"));
            ddlBetroomNum.Items.Add(new ListItem("-1-", "1"));
            ddlBetroomNum.Items.Add(new ListItem("-2-", "2"));
            ddlBetroomNum.Items.Add(new ListItem("-3-", "3"));
            ddlBetroomNum.Items.Add(new ListItem("-4-", "4"));
            ddlBetroomNum.Items.Add(new ListItem("-5-", "5"));
            ddlBetroomNum.Items.Add(new ListItem("-6-", "6"));
            ddlBetroomNum.Items.Add(new ListItem("-7-", "7"));
        }
        private void GetArea()
        {
            ddlAreaSl.Items.Clear();
            ddlAreaSl.Items.Add(new ListItem("-Chọn diện tích (mét vuông)-", "0"));
            ddlAreaSl.Items.Add(new ListItem("Dưới 50 mét vuông ", "50"));
            ddlAreaSl.Items.Add(new ListItem("50 - 100 mét vuông", "100"));
            ddlAreaSl.Items.Add(new ListItem("100 - 150 mét vuông", "150"));
            ddlAreaSl.Items.Add(new ListItem("150 - 200 mét vuông", "200"));
            ddlAreaSl.Items.Add(new ListItem("200 - 250 mét vuông", "250"));
            ddlAreaSl.Items.Add(new ListItem("250 - 300 mét vuông", "300"));
            ddlAreaSl.Items.Add(new ListItem("Trên 300 mét vuông", "301"));
        }
        private void ViewDistrict()
        {
            ddlDistrictSl.Items.Clear();
            if (_cityCode == "0")
            {
                ddlDistrictSl.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));
            }
            else
            {
                List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100", "CityCode =" + _cityCode, "DistrictID");
                for (int i = 0; i < listDistrictInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName, listDistrictInfos[i].DistrictID);
                    ddlDistrictSl.Items.Add(lsListItem);
                }
                listDistrictInfos.Clear();
                listDistrictInfos = null;
            }
        }
        protected void ddlCitySl_SelectedIndexChanged(object sender, EventArgs e)
        {
            _cityCode = ddlCitySl.SelectedValue;
            ViewDistrict();
        }

        protected void ImageButton1_OnClick(object sender, ImageClickEventArgs e)
        {
            if (ddlCitySl.SelectedValue != "" || ddlCitySl.SelectedValue != "" || ddlPriceSl.SelectedValue != "0" ||
                ddlAreaSl.SelectedValue != "" || txtSearchKeyword1.Text != "")
            {
                string Chuoi = "";
                if (ddlCitySl.SelectedValue != "0")
                {
                    Chuoi += "and CityName = " + ddlCitySl.SelectedItem;
                }
                if (ddlDistrictSl.SelectedValue != "0")
                {
                    Chuoi += "and DistrictName = " + ddlDistrictSl.SelectedItem;
                }
                if (ddlPriceSl.SelectedValue != "0")
                {
                    if (ddlPriceSl.SelectedValue == "1000000000")
                    {
                        Chuoi += "and Price > 0 and Price <= 1000000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "1500000000")
                    {
                        Chuoi += "and Price > 1000000000 and <=1500000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "2000000000")
                    {
                        Chuoi += "and Price > 1500000000 and <=2000000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "2500000000")
                    {
                        Chuoi += "and Price > 2000000000 and <=2500000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "3000000000")
                    {
                        Chuoi += "and Price > 2500000000 and <=3000000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "3500000000")
                    {
                        Chuoi += "and Price > 3000000000 and <=3500000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "4000000000")
                    {
                        Chuoi += "and Price > 3500000000 and <=4000000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "4500000000")
                    {
                        Chuoi += "and Price > 4000000000 and <=4500000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "5000000000")
                    {
                        Chuoi += "and Price > 4500000000 and <=5000000000";
                    }
                    else if (ddlPriceSl.SelectedValue == "5000001000")
                    {
                        Chuoi += "and Price > 5000000000 ";
                    }
                }
                if (ddlAreaSl.SelectedValue != "0")
                {
                    if (ddlAreaSl.SelectedValue == "50")
                    {
                        Chuoi += "and Area > 0 and Area <= 50";
                    }
                    else if (ddlAreaSl.SelectedValue != "100")
                    {
                        Chuoi += "and Area >50 and Area <100";
                    }
                    else if (ddlAreaSl.SelectedValue != "150")
                    {
                        Chuoi += "and Area >100 and Area <=150";
                    }
                    else if (ddlAreaSl.SelectedValue != "200")
                    {
                        Chuoi += "and Area >150 and Area <=200";
                    }
                    else if (ddlAreaSl.SelectedValue != "250")
                    {
                        Chuoi += "and Area >200 and Area <= 250";
                    }
                    else if (ddlAreaSl.SelectedValue != "300")
                    {
                        Chuoi += "and Area >250 and Area <= 300";
                    }
                    else if (ddlAreaSl.SelectedValue != "301")
                    {
                        Chuoi += "and Area >300";
                    }
                }
                if (txtSearchKeyword1.Text != "")
                {
                    Chuoi += "and Name like N% '" + txtSearchKeyword1.Text + "'%";
                }

                Session["Key"] = Chuoi;
                Session["cityName"] = ddlCitySl.SelectedValue;
                Session["districtName"] = ddlDistrictSl.SelectedValue;
                Session["price"] = ddlPriceSl.SelectedValue;
                Session["area"] = ddlAreaSl.SelectedValue;
                Session["k"] = txtSearchKeyword1.Text;
                Session["betroom"] = ddlBetroomNum.SelectedValue;
                Response.Redirect("/Default2.aspx?mod=KetQuaTimKiem");
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
                    chuoi += "<div class=\" row \" style=\"border-bottom: 1px solid grey; width: 99%; margin-left: 1px;\">";
                    chuoi += "<div style=\" width: 40%; float: left; margin-left: 10px;\">";
                    chuoi += "<a href=\" \" alt=\" Xem chi tiết \"><img src=\"" + listBroker[i].Avatar +
                             "\" style=\"margin: 5px 0px;\"/></a>";
                    chuoi += "</div>";

                    chuoi += "<div style=\" margin: 5px 0px; width:55%; float: right; line-height: 20px;\">";
                    chuoi += "<p><span style=\" font-size: 14px; color: blue;\">" + listBroker[i].FullName +
                             "</span></p>";
                    chuoi += "<p><span style=\" font-size: 12px; color: red;\">" + listBroker[i].MobilePhone +
                             "</span></p>";
                    chuoi += "<p><span style=\" font-size: 12px; color: #535699;\">" + listBroker[i].Address +
                             "</span></p>";
                    chuoi += "</div>";
                    chuoi += "</div>";
                }
            }
            else
            {
                chuoi += "<p> <span> Chưa có dữ liệu để hỉển thị!</span></p>";
            }
            ltrBroker.Text = chuoi;
            listBroker.Clear();
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

                    chuoiTextLink += "<li> <a href=\"ViewDetails.aspx?ID= " +
                                     listRealEstateNewsInfos[i].RealEstateNewsID + "\" target=\"_blank \" >" + "&rsaquo;&rsaquo; " + listRealEstateNewsInfos[i].Title +
                                     "</a> </li>";
                }
                ltrImagesLink.Text = chuoiImageLinks;
                ltrTextLink.Text = chuoiTextLink;
                ltrTextLink2.Text = chuoiTextLink;
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