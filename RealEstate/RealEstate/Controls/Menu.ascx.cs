using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using Page = RealEstate.DataAccess.Page;

namespace RealEstate.Controls
{
    public partial class Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMenu();
        }

        private void LoadMenu()
        {
            string chuoi = "";
            List<DataAccess.Page> listMenu = new List<Page>();
            listMenu = PageService.Page_GetByTop("20", "Active = 1 and LEN(Level) =5", "Ord");
            if (listMenu.Count > 0)
            {
                for (int i = 0; i < listMenu.Count; i++)
                {
                    List<Page> listSubMenu = new List<Page>();
                    listSubMenu = PageService.Page_GetBySub(listMenu[i].Level);
                    if (listSubMenu.Count > 0)
                    {

                        chuoi += "<li> <a href = \" Default2.aspx?mod=" + listMenu[i].Tag + "\">" + listMenu[i].Name + "</a><ul>";
                        for (int j = 0; j < listSubMenu.Count; j++)
                        {
                            chuoi += "<li><a href=\" Default2.aspx?mod=" + listMenu[i].Tag + "\">" + listSubMenu[j].Name + "</a></li>";
                        }
                        chuoi += "</ul></li>";                        
                    }
                    else
                    {
                        chuoi += "<li> <a href=\" Default2.aspx?mod=" + listMenu[i].Tag + "\">" + listMenu[i].Name + "</a></li>";
                    }
                }
                ltrMenu.Text = chuoi;
                listMenu.Clear();
            }
        }
    }
}