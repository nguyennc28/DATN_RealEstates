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
                //_cityCode = ddlCity.SelectedValue;
                ViewDistrict();
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
        }

        //_cityCode = ddlCity.SelectedValue;
            //if (_cityCode != null)
            //{
            //    ddlDistrict.Items.Clear();
            //    ddlDistrict.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));

            //    List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100",
            //        "CityCode =" + _cityCode, "DistrictID");
            //    for (int i = 0; i < listDistrictInfos.Count; i++)
            //    {
            //        ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName,
            //            listDistrictInfos[i].DistrictID);
            //        ddlDistrict.Items.Add(lsListItem);
            //    }
            //    listDistrictInfos.Clear();
            //    listDistrictInfos = null;
            //}
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

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            _cityCode = ddlCity.SelectedValue;
            if (_cityCode == null)
            {
                ddlDistrict.Items.Clear();
                ddlDistrict.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));

                List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100",
                    "CityCode = 0", "DistrictID");
                for (int i = 0; i < listDistrictInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName,
                        listDistrictInfos[i].DistrictID);
                    ddlDistrict.Items.Add(lsListItem);
                }
                listDistrictInfos.Clear();
                listDistrictInfos = null;
            }
            else
            {
                ddlDistrict.Items.Clear();
                ddlDistrict.Items.Add(new ListItem("-Chọn Quận (huyện)-", "0"));

                List<DistrictInfo> listDistrictInfos = DistrictService.DistrictInfo_GetByTop("100",
                    "CityCode =" + _cityCode, "DistrictID");
                for (int i = 0; i < listDistrictInfos.Count; i++)
                {
                    ListItem lsListItem = new ListItem(listDistrictInfos[i].DistrictName,
                        listDistrictInfos[i].DistrictID);
                    ddlDistrict.Items.Add(lsListItem);
                }
                listDistrictInfos.Clear();
                listDistrictInfos = null;
            }
        }
    }
}