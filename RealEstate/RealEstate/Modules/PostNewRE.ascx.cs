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
    public partial class PostNewRE : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewRealEstateType();
                ViewCity();
                ViewDistrict();
            }
        }

        protected void btnPostNewRE_Click(object sender, ImageClickEventArgs e)
        {
            var obj = new HomeInfo
            {
                HomeTypeID = ddlHomeType.SelectedValue,
                Name = txtTenNha.Text,
                RealEstateOwnersName = txtTenChuSoHuu.Text,
                CityID = ddlCity.SelectedValue,
                DistrictID = ddlDistrict.SelectedValue,
                Address = txtAddress.Text + ddlDistrict.SelectedItem + ddlCity.SelectedItem,
                Description = txtDescription.Text,
                BedroomNumber = txtBetroomNum.Text,
                TotalArea = txtArea.Text,
                FloorArea = txtFloorArea.Text,
                Price = txtPrice.Text,
                TierNumber = txtTierNumber.Text
            };
            HomeService.HomeInfo_Insert(obj);
            Response.Redirect("~/Default2.aspx?mod=ViewPostNewRE");
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
            //_cityCode = ddlCity.SelectedValue;
        }
        private void ViewDistrict()
        {
            ddlDistrict.Items.Clear();
            ddlDistrict.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));
            List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100", "CityCode = 1", "DistrictID");
            for (int i = 0; i < listDistrictInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName, listDistrictInfos[i].DistrictID);
                ddlDistrict.Items.Add(lsListItem);
            }
            listDistrictInfos.Clear();
            listDistrictInfos = null;
        }
        private void ViewRealEstateType()
        {
            ddlHomeType.Items.Clear();
            ddlHomeType.Items.Add(new ListItem("-Chọn loại Nhà-", "0"));
            List<HomeTypeInfo> listddlHomeTypeInfos = HomeTypeService.HomeTypeInfo_GetByAll();
            for (int i = 0; i < listddlHomeTypeInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listddlHomeTypeInfos[i].HomeTypeName,
                    listddlHomeTypeInfos[i].HomeTypeID);
                ddlHomeType.Items.Add(lsListItem);

            }
            listddlHomeTypeInfos.Clear();
            listddlHomeTypeInfos = null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var obj = new HomeInfo
            {
                HomeTypeID = ddlHomeType.SelectedValue,
                Name = txtTenNha.Text,
                RealEstateOwnersName = txtTenChuSoHuu.Text,
                CityID = ddlCity.SelectedValue,
                DistrictID = ddlDistrict.SelectedValue,
                Address = txtAddress.Text + ddlDistrict.SelectedItem + ddlCity.SelectedItem,
                Description = txtDescription.Text,
                BedroomNumber = txtBetroomNum.Text,
                TotalArea = txtArea.Text,
                FloorArea = txtFloorArea.Text,
                Price = txtPrice.Text,
                TierNumber = txtTierNumber.Text
            };
            HomeService.HomeInfo_Insert(obj);
            Response.Redirect("~/Default2.aspx?mod=ViewPostNewRE");
        }
    }
}