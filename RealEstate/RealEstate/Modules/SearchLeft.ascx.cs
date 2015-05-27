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
    public partial class SearchLeft : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewCity();
                ViewDistrict();
                ViewRealEstateType();
            }
        }

        private void ViewRealEstateType()
        {
            ddlRealEstateType.Items.Clear();
            ddlRealEstateType.Items.Add(new ListItem("-Chọn loại BĐS-","0"));
            List<RealEstateTypeInfo> listEstateTypeInfos = RealEstateTypeService.RealEstateTypeInfo_GetByAll();
            for (int i = 1; i < listEstateTypeInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listEstateTypeInfos[i].NameRealEstateType, listEstateTypeInfos[i].RealEstateTypeID);
                ddlRealEstateType.Items.Add(lsListItem);
            }
            listEstateTypeInfos.Clear();
            listEstateTypeInfos = null;
        }

        private void ViewCity()
        {
            ddlCity.Items.Clear();
            ddlCity.Items.Add(new ListItem("-Chọn Tỉnh(TP)-", "0"));
            List<CityInfo> listCityInfos = CityService.CityInfo_GetByAll();
            for (int i = 1; i < listCityInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listCityInfos[i].CityName, listCityInfos[i].CityID);
                ddlCity.Items.Add(lsListItem);
            }
            listCityInfos.Clear();
            listCityInfos = null;
        }

        private void ViewDistrict()
        {
            ddlDistrict.Items.Clear();
            ddlDistrict.Items.Add(new ListItem("-Chọn Tỉnh(TP)-", "0"));
            List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByAll();
            for (int i = 1; i < listDistrictInfos.Count; i++)
            {
                ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName, listDistrictInfos[i].DistrictID);
                ddlDistrict.Items.Add(lsListItem);
            }
            listDistrictInfos.Clear();
            listDistrictInfos = null;
        }
    }
}