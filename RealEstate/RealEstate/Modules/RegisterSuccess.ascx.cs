﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.Modules
{
    public partial class RegisterSuccess : System.Web.UI.UserControl
    {
        public int UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    UserID = int.Parse(Request.QueryString["id"].ToString());
            //}
        }
    }
}