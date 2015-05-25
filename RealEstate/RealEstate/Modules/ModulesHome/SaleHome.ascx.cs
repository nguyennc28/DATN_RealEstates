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
    public partial class SaleHome : System.Web.UI.UserControl
    {
        private HomeService homeService;
        List<HomeInfo> listHome = new List<HomeInfo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Home();
        }
        private void Load_Home()
        {
            listHome = HomeService.HomeInfo_GetByTop("2", "", "");
            string chuoi = "";
            if (listHome.Count > 0)
            {
                for (int i = 0; i < listHome.Count; i++)
                {
                    chuoi += "<div class =\"ListPro\">";
                    chuoi += "<p class=\"Title\">" + listHome[0].TransactionType + "</p>";
                    chuoi += "<table class=\"tbList\"> <tr class=\"trList\"> <td colspan=\"3\" class=\"tdList1\"><img src=\"" + listHome[0].Image1 + "\" style=\" width:310px \"/></td></tr> <tr class=\"trList\"> <td class=\"tdList\"><img src=\"" + listHome[0].Image2 + "\" style=\" width:100px \"/> </td> <td class=\"tdList\"> <img src=\"" + listHome[0].Image3 + "\" style=\" width:100px \"/></td> <td class=\"tdList\"> <img src=\"" + listHome[0].Image4 + "\" style=\" width:100px \"/> </td></tr> </table>";
                    chuoi += "</div>";
                }
            }
            ltrTab1.Text = chuoi;
            listHome.Clear();
        }
    }
}