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
        private string _cityCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewCity();
                ViewRealEstateType();
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
        
    }
}