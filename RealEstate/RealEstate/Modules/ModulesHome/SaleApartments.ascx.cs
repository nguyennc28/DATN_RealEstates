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
    public partial class SaleApartments : System.Web.UI.UserControl
    {
        private string _cityCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSaleApartments();
                GetPrice();
                //GetCity();
                GetArea();
                ViewCity();
            }
        }

        private void GetCategory()
        {

        }

        private void GetCity()
        {
            List<CityInfo> list = new List<CityInfo>();
            list = CityService.CityInfo_GetByAll();
            ddlCity.Items.Clear();
            ddlCity.Items.Add(new ListItem("-Chọn Tỉnh(Thành phố)-", "0"));
            for (int i = 0; i < list.Count; i++)
            {
                ddlCity.Items.Add(new ListItem(list[i].CityName, list[i].CityCode));
            }
            list.Clear();
            list = null;
        }
        private void ViewCity()
        {
            ddlCity.Items.Clear();
            ddlCity.Items.Add(new ListItem("-Chọn Tỉnh(TP)-", "0"));
            List<CityInfo> listCityInfos = CityService.CityInfo_GetByAll();
            if (listCityInfos.Count > 0)
            {
                for (int i = 0; i < listCityInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listCityInfos[i].CityName, listCityInfos[i].CityCode);
                    ddlCity.Items.Add(lsListItem);
                }
                listCityInfos.Clear();
                listCityInfos = null;
            }
            _cityCode = ddlCity.SelectedValue;
            ViewDistrict();
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            _cityCode = ddlCity.SelectedValue;
            ViewDistrict();
        }  
        private void ViewDistrict()
        {
            ddlDistrict.Items.Clear();
            if (_cityCode == "0")
            {
                ddlDistrict.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));
            }
            else
            {
                List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100", "CityCode =" + _cityCode, "DistrictID");
                for (int i = 0; i < listDistrictInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName, listDistrictInfos[i].DistrictID);
                    ddlDistrict.Items.Add(lsListItem);
                }
                listDistrictInfos.Clear();
                listDistrictInfos = null;
            }
        }
        private void GetArea()
        {
            ddlArea.Items.Clear();
            ddlArea.Items.Add(new ListItem("-Chọn diện tích (mét vuông)-", "0"));
            ddlArea.Items.Add(new ListItem("Dưới 50 mét vuông ", "50"));
            ddlArea.Items.Add(new ListItem("50 - 100 mét vuông", "100"));
            ddlArea.Items.Add(new ListItem("100 - 150 mét vuông", "150"));
            ddlArea.Items.Add(new ListItem("150 - 200 mét vuông", "200"));
            ddlArea.Items.Add(new ListItem("200 - 250 mét vuông", "250"));
            ddlArea.Items.Add(new ListItem("250 - 300 mét vuông", "300"));
            ddlArea.Items.Add(new ListItem("Trên 300 mét vuông", "301"));
        }
        private void GetPrice()
        {
            ddlPrice.Items.Clear();
            ddlPrice.Items.Add(new ListItem("-Chọn giá (VNĐ)-", "0"));
            ddlPrice.Items.Add(new ListItem("Dưới 1 tỷ VNĐ", "1000000000"));
            ddlPrice.Items.Add(new ListItem("1 tỷ VNĐ - 1.5 tỷ VNĐ", "1500000000"));
            ddlPrice.Items.Add(new ListItem("1.5 tỷ - 2 tỷ VNĐ", "2000000000"));
            ddlPrice.Items.Add(new ListItem("2 tỷ VNĐ - 2.5 tỷ VNĐ", "2500000000"));
            ddlPrice.Items.Add(new ListItem("2.5 tỷ VNĐ - 3 tỷ VNĐ", "3000000000"));
            ddlPrice.Items.Add(new ListItem("3 tỷ VNĐ - 3.5 tỷ VNĐ", "3500000000"));
            ddlPrice.Items.Add(new ListItem("3.5 tỷ VNĐ - 4 tỷ VNĐ", "4000000000"));
            ddlPrice.Items.Add(new ListItem("4 tỷ VNĐ - 4.5 tỷ VNĐ", "4500000000"));
            ddlPrice.Items.Add(new ListItem("4.5 tỷ VNĐ - 5 tỷ VNĐ", "5000000000"));
            ddlPrice.Items.Add(new ListItem("trên 5 tỷ VNĐ", "5000001000"));
        }
        private void LoadSaleApartments()
        {
            string chuoi = "";
            List<ApartmentInfo> listApartmentInfos = new List<ApartmentInfo>();
            listApartmentInfos = ApartmentService.ApartmentInfo_GetByAll("vi");
            if (listApartmentInfos.Count > 0)
            {
                for (int i = 0; i < listApartmentInfos.Count; i++)
                {
                    chuoi += "<div class=\" row \">";
                    chuoi += "<h3> <a href = \" Default2.aspx?mod=" + listApartmentInfos[i].Tag + "\">" + listApartmentInfos[i].Title +
                             "</a> </h3>";

                    //cột trái
                    chuoi += "<div class=\"span3\">";
                    chuoi += "<img src=\"" + listApartmentInfos[i].Image1 + "\" />";
                    chuoi += "</div>";
                    //cột phải
                    chuoi += "<div class=\"span7\">";
                    chuoi += "<p>" + listApartmentInfos[i].Description + "</p>";
                    chuoi += "<p>" + "Giá: " + "<span style=\"color: red; font-weight:bold;\">" + listApartmentInfos[0].Price + "</span>" + " VND" + " | " + "Tổng diện tích: " + "<span style=\"color: red; font-weight:bold;\">" + listApartmentInfos[0].TotalArea + "</span>" + " | " +
                             "Diện tích nhà: " + "<span style=\"color: red; font-weight:bold;\">" + listApartmentInfos[0].FloorArea + "</span>" + " | " + "Số phòng ngủ: " + "<span style=\"color: red; font-weight:bold;\">" +
                             listApartmentInfos[0].BedroomNumber + "</span>" + "</p>";
                    chuoi += "<p>" + "<table><tr><td width=\"70%\">Địa chỉ: " + "<span style=\"color: blue; font-weight:bold;\">" + listApartmentInfos[i].Address + "</span>" + "</td><td width=\"30%\">Người đăng: " + "<span style=\"color: blue; font-weight:bold;\">" + listApartmentInfos[i].CreateBy + "</span>" + "</td></tr></table></p>";
                    chuoi += "</div>";
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
