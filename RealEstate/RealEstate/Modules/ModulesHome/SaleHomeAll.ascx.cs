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
    public partial class SaleHomeAll : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSaleHome();
                GetPrice();
                GetCity();
                GetArea();
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
            ddlCity.Items.Add(new ListItem("-Chọn Tỉnh(Thành phố)-","0"));
            for (int i = 0; i <list.Count; i++)
            {
                ddlCity.Items.Add(new ListItem(list[i].CityName, list[i].CityCode));
            }
            list.Clear();
            list = null;
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
        private void LoadSaleHome()
        {
            string chuoi = "";


            List<HomeInfo> listHomeses = new List<HomeInfo>();
            listHomeses = HomeService.HomeInfo_GetByAll();
            if (listHomeses.Count > 0)
            {
                for (int i = 0; i < listHomeses.Count; i++)
                {
                    chuoi += "<div class=\" row \">";
                    chuoi += "<h3> <a href = \" Default2.aspx?mod=" + listHomeses[i].Tag + "\">" + listHomeses[i].Title +
                             "</a> </h3>";

                    //cột trái
                    chuoi += "<div class=\"span3\">";
                    chuoi += "<img src=\"" + listHomeses[i].Image1 + "\" />";
                    chuoi += "</div>";
                    //cột phải
                    chuoi += "<div class=\"span7\">";
                    chuoi += "<p>" + listHomeses[i].Description + "</p>";
                    chuoi += "<p>" + "Giá: " + listHomeses[0].Price + " VND" + " | " + "Tổng diện tích: " + listHomeses[0].TotalArea + " | " +
                             "Diện tích nhà: " + listHomeses[0].FloorArea + " | " + "Số phòng ngủ: " +
                             listHomeses[0].BedroomNumber + " | " + "Số tầng: " + listHomeses[0].TierNumber + "</p>";
                    chuoi += "</div>";


                    chuoi += "</div>";
                }
            }
            else
            {
                chuoi += "<p>" + "Không có dữ liều nào để hiển thị </p>";
            }
            ltrTab1.Text = chuoi;
            listHomeses.Clear();
        }
    }
}