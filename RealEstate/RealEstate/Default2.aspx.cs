using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class Default2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string module = null;
            string userControl = null;
            Control ct = null;
            if (!IsPostBack)
            {
                //if (userControl == null)
                //{
                    
                //}
                //userControl = Session["UserControl"].ToString();
                //HtmlGenericControl gel0 = new HtmlGenericControl("div");
                //switch (userControl)
                //{
                //    case "~/Default2.aspx?mod=Register":
                //        ct = Page.LoadControl("/Modules/Register.ascx");
                //        break;
                //}
                //gel0.Controls.Add(ct);
                //PlaceHolder1.Controls.Add(gel0);


                module = Server.HtmlEncode(Request.QueryString["mod"]);
                HtmlGenericControl gel = new HtmlGenericControl("div");
                switch (module)
                {
                    case "login":
                        ct = Page.LoadControl("login");
                        break;
                    case "Register":
                        ct = Page.LoadControl("/Modules/Register.ascx");
                        break;
                    case "Home":
                        ct = Page.LoadControl("/Modules/Home.ascx");
                        break;
                    // Load các control cho module nhà trọ
                    case "RentMotel":
                        ct = Page.LoadControl("/Modules/ModulesMotel/RentMotel.ascx");
                        break;
                    // Load các control cho modules Home
                    case "SaleHomeAll":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleHomeAll.ascx");
                        break;
                    case "SaleApartments":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleApartments.ascx");
                        break;
                    case "SaleHome":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleHome.ascx");
                        break;
                    case "SaleIndividualVilla":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleIndividualVilla.ascx");
                        break;
                    case "SaleAdjacentVilla":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleAdjacentVilla.ascx");
                        break;
                    case "SaleHousePavement":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleHousePavement.ascx");
                        break;
                    case "SaleWareHouse":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleWareHouse.ascx");
                        break;
                    case "SaleHousing":
                        ct = Page.LoadControl("/Modules/ModulesHome/SaleHousing.ascx");
                        break;
                    // Load Control Đăng tin rao bất động sản
                    case "PostNewRE":
                        ct = Page.LoadControl("/Modules/PostNewRE.ascx");
                        break;
                    //Load Control view tin bất động sản đã đăng
                    case "ViewPostNewRE":
                        ct = Page.LoadControl("/Modules/ViewPostNewRE.ascx");
                        break;
                    // Hiện thị kết quả tìm kiếm
                    case "KetQuaTimKiem":
                        ct = Page.LoadControl("/Modules/KetQuaTimKiem.ascx");
                        break;
                    case "ViewDetailsHome":
                        ct = Page.LoadControl("/Modules/ViewDetailsHome.ascx");
                        break;
                    // Default trang chủ
                    default:
                        ct = Page.LoadControl("/Modules/Home.ascx");
                        break;
                }
                gel.Controls.Add(ct);
                PlaceHolder1.Controls.Add(gel);
            }
        }
    }
}