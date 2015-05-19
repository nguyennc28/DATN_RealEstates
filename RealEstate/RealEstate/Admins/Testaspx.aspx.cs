using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate.Admins
{
    public partial class Testaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropDowlist();
            }
        }

        private void LoadDropDowlist()
        {
            ddlHomeType.Items.Clear();
            ddlHomeType.Items.Add(new ListItem("-Kiểu nhà-", "0"));
            List<HomeTypeInfo> listHomeTypeServices = HomeTypeService.HomeTypeInfo_GetByAll();
            for (int i = 0; i < listHomeTypeServices.Count; i++)
            {
                ddlHomeType.Items.Add(new ListItem(listHomeTypeServices[i].HomeTypeName, listHomeTypeServices[i].HomeTypeID));
            }
            listHomeTypeServices.Clear();
            listHomeTypeServices = null;
        }
    }
}