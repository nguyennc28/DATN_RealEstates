using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.DataAccess;
using RealEstate.Common;
using RealEstate.Business;

namespace RealEstate
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            int i = 1;
            string JavaScript = "";
            while (i <= 10)
            {
                if (Session["currentPanel"] != null && Session["currentPanel"].ToString() == "div" + i)
                {
                }
                else
                {
                    JavaScript = JavaScript + "<script type=\"text/javascript\"> toggleXPMenu('div" + i + "'); </script>";
                }
                i++;
            }
            //ltrJavaScript.Text = JavaScript;
        }
    }
}