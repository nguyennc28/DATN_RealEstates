using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using RealEstate.Common;


namespace RealEstate
{
    public class Global : System.Web.HttpApplication
    {
        public static string LangDefault = "";
        public static CookieClass Cookie = new CookieClass();
        /// <summary>
        /// Extension of page file
        /// </summary>
        public static string FileExtension = "";

        void RegisterRoutes(RouteCollection routes)
        {
            RouteTable.Routes.MapPageRoute("Content", "Content/{language}-{country}.htm", "~/Modules/Content.aspx");

            //News routes

            RouteTable.Routes.MapPageRoute("News", "News.aspx", "~/Modules/News/NewsView.aspx");
            RouteTable.Routes.MapPageRoute("NewsDate", "News/{Subject}/{date}.htm", "~/Modules/News/NewsView.aspx");
            RouteTable.Routes.MapPageRoute("NewsGroup", "News/{Subject}.htm", "~/Modules/News/NewsView.aspx");
            //phan trang New
            RouteTable.Routes.MapPageRoute("Newspage", "Tinmoi/Trangmoi.htm/page={currentpagenew}", "~/Modules/News/NewsView.aspx");
            //RouteTable.Routes.MapPageRoute("Newshome", "Newshome/{Subject}.htm", "~/Modules/News/NewsView.aspx");
            //RouteTable.Routes.MapPageRoute("Newssearch", "Newssearch/{dk}.htm", "~/Modules/News/NewsView.aspx");
            RouteTable.Routes.MapPageRoute("NewsDetail", "News/{Subject}/{Id}/{title}.htm", "~/Modules/News/NewsDetail.aspx");
            RouteTable.Routes.MapPageRoute("NewsTab", "NewsTab/{Subject}.htm", "~/Modules/News/NewsTab.aspx");
            RouteTable.Routes.MapPageRoute("RssNews", "RssNews.aspx", "~/Modules/Other/RssNews.aspx");

            //Product routes
            RouteTable.Routes.MapPageRoute("OrderSuccess", "OrderSuccess.aspx", "~/Modules/Products/OrderSuccess.aspx");
            RouteTable.Routes.MapPageRoute("ContactOrder", "ContactOrder.aspx", "~/Modules/Products/ContactOrder.aspx");
            RouteTable.Routes.MapPageRoute("ProductsOrder", "Order.htm", "~/Modules/Products/Order.aspx");
            RouteTable.Routes.MapPageRoute("ProductsList", "Product.aspx", "~/Modules/Products/ProductList.aspx");
            RouteTable.Routes.MapPageRoute("ProductsListpage", "ProductList.aspx/page={currentpage}", "~/Modules/Products/ProductList.aspx");
            RouteTable.Routes.MapPageRoute("Products", "{title}.htm", "~/Modules/Products/ProductView.aspx");


            RouteTable.Routes.MapPageRoute("tintuc", "tin/tin-tuc.htm", "~/Modules/News/NewsView.aspx");
            RouteTable.Routes.MapPageRoute("tin-tuc", "tin-tuc/{title}.htm", "~/Modules/News/NewsView.aspx");
            RouteTable.Routes.MapPageRoute("chi-tiet-tin-tuc", "chi-tiet-tin-tuc/{title}.htm", "~/Modules/News/NewsDetail.aspx");
            //RouteTable.Routes.MapPageRoute("Productss", "dien-thoai/{title}.htm", "~/Modules/Products/ProductView.aspx");
            RouteTable.Routes.MapPageRoute("Productspage", "Products/{title}.htm/page={currentpage}", "~/Modules/Products/ProductView.aspx");
            // phan trang cho index
            RouteTable.Routes.MapPageRoute("Productspage1", "Products.htm/page={currentpage2}", "~/index.aspx");

            //dangnhap-dangky
            RouteTable.Routes.MapPageRoute("Register", "dien-thoai/dang-ky-tai-khoan.htm", "~/Modules/Other/Dangky.aspx");
            RouteTable.Routes.MapPageRoute("Login", "dien-thoai/dang-nhap.htm", "~/Modules/Other/Login.aspx");


            //menu cap 1
            RouteTable.Routes.MapPageRoute("Trangchu", "trang-chu.htm", "~/index.aspx");
            RouteTable.Routes.MapPageRoute("Lienhe", "tin/lien-he.htm", "~/Lienhe.aspx");
            RouteTable.Routes.MapPageRoute("Gioithieu", "tin/gioi-thieu.htm", "~/Gioithieu.aspx");
            RouteTable.Routes.MapPageRoute("Tuyendung", "tin/tuyen-dung.htm", "~/Tuyendung.aspx");
            //menu cap 2
            RouteTable.Routes.MapPageRoute("sanphamconcap2", "Product/{title}/{tagcon}.htm", "~/Modules/Products/ProductView1.aspx");
            RouteTable.Routes.MapPageRoute("san-pham-con-cap-2", "{tagcon}.htm/page={currentpage1}", "~/Modules/Products/ProductView1.aspx");
            //view Brand
            RouteTable.Routes.MapPageRoute("brank", "san-pham/{brandid}.htm", "~/Modules/Products/ProductView_Brand.aspx");
            RouteTable.Routes.MapPageRoute("brank-con", "Sanpham/{brandid}.htm/page={currentpage}", "~/Modules/Products/ProductView_Brand.aspx");


            RouteTable.Routes.MapPageRoute("ProductsSaleOff", "products-sale-off.aspx", "~/Modules/Products/ProductSaleOff.aspx");
            RouteTable.Routes.MapPageRoute("ProductCart", "Shopcart/{ProId}/{Idsize}/{Idcolor}/{num}/{title}.htm", "~/Modules/Products/Shopcard.aspx");
            RouteTable.Routes.MapPageRoute("ProductDetail", "chi-tiet/{title}.htm", "~/Modules/Products/ProductDetail.aspx");
            RouteTable.Routes.MapPageRoute("muachung", "mua-chung/{title}.htm", "~/Modules/Products/Detail_Muachung.aspx");
            RouteTable.Routes.MapPageRoute("ProPay", "MethodPay/{title}.htm", "~/Modules/Products/StepPay.aspx");
            RouteTable.Routes.MapPageRoute("ProRegister", "Shopregister/{title}.htm", "~/Modules/Products/RegisterCustomer.aspx");
            RouteTable.Routes.MapPageRoute("Message", "Message/{title}.htm", "~/Modules/Products/Messages.aspx");
            RouteTable.Routes.MapPageRoute("Activeaccount", "Active/{userid}/{title}.htm", "~/Modules/Products/ActiveAccount.aspx");
            RouteTable.Routes.MapPageRoute("Help", "Help/{title}.htm", "~/Modules/Products/Helpsize.aspx");

            //Document routes
            RouteTable.Routes.MapPageRoute("Document", "Document.aspx", "~/Modules/Document/DocumentType.aspx");
            RouteTable.Routes.MapPageRoute("DocumentType", "Document/{Subject}.htm", "~/Modules/Document/DocumentType.aspx");
            RouteTable.Routes.MapPageRoute("DocumentDetail", "Document/{Subject}/{IdDoc}/{title}.htm", "~/Modules/Document/DocumentDetail.aspx");

            //Account routes
            RouteTable.Routes.MapPageRoute("AccountLogon", "Account/Logon.aspx", "~/Modules/Account/Logon.aspx");
            RouteTable.Routes.MapPageRoute("AccountRegister", "Account/register.aspx", "~/Modules/Account/register.aspx");
            RouteTable.Routes.MapPageRoute("AccountFogotpass", "Account/fogotpass.aspx", "~/Modules/Account/fogotpass.aspx");
            //Search routes
            RouteTable.Routes.MapPageRoute("SearchNon", "searchResult.aspx", "~/Modules/Search/searchResult.aspx");
            RouteTable.Routes.MapPageRoute("SearchPrice", "Search/ket-qua.htm", "~/Modules/Search/My_Search_By_Price.aspx");
            RouteTable.Routes.MapPageRoute("SearchPricepaging", "searchprice.aspx/page={currentpage}", "~/Modules/Search/My_Search_By_Price.aspx");
            RouteTable.Routes.MapPageRoute("Searchkeyword", "search.aspx", "~/Modules/Search/My_Search_Form.aspx");
            RouteTable.Routes.MapPageRoute("Searchkeywordpaging", "search.aspx/page={currentpage}", "~/Modules/Search/My_Search_Form.aspx");
            RouteTable.Routes.MapPageRoute("Search", "search.aspx", "~/Modules/Search/Search.aspx");
            RouteTable.Routes.MapPageRoute("SearchVD", "search/vandon.aspx", "~/Modules/search/vandon.aspx");
            RouteTable.Routes.MapPageRoute("SearchVDFull", "search/vandon/{Code}-{Id}.htm", "~/Modules/search/vandon.aspx");
            RouteTable.Routes.MapPageRoute("SearchLB", "search/lichbay.aspx", "~/Modules/search/lichbay.aspx");
            RouteTable.Routes.MapPageRoute("SearchLBFull", "search/lichbay/{Date}/{Code}-{Type}.htm", "~/Modules/search/lichbay.aspx");

            //Library routes
            RouteTable.Routes.MapPageRoute("GroupLibrary", "library.aspx", "~/Modules/Page/library.aspx");
            RouteTable.Routes.MapPageRoute("Library", "library/{Subject}.htm", "~/Modules/Page/library.aspx");

            //Page routes
            RouteTable.Routes.MapPageRoute("Promotionpaging", "Promotion.aspx/page={currentpage}", "~/Modules/Products/Promotion.aspx");
            RouteTable.Routes.MapPageRoute("Promotion", "Promotion.aspx", "~/Modules/Products/Promotion.aspx");
            RouteTable.Routes.MapPageRoute("Default", "default.aspx", "~/Default.aspx");
            RouteTable.Routes.MapPageRoute("ListShop", "ListShop.aspx", "~/Modules/Page/ListShop.aspx");
            RouteTable.Routes.MapPageRoute("Thumb", "thumb.aspx", "~/Modules/Page/thumb.aspx");
            RouteTable.Routes.MapPageRoute("Contact", "contact.aspx", "~/Modules/Page/contact.aspx");
            RouteTable.Routes.MapPageRoute("PageDetail", "noi-dung/{pageid}.htm", "~/Modules/Page/AboutUs.aspx");
            RouteTable.Routes.MapPageRoute("Weather", "weather.aspx", "~/Modules/Other/weather.aspx");
            RouteTable.Routes.MapPageRoute("Exchange", "Exchange.aspx", "~/Modules/Other/Exchange.aspx");
            RouteTable.Routes.MapPageRoute("PageSupport", "Support.aspx", "~/Modules/Page/Support.aspx");
            RouteTable.Routes.MapPageRoute("Error", "Error.aspx", "~/Modules/Page/Error.aspx");
            RouteTable.Routes.MapPageRoute("Logout", "Logout.aspx", "~/Modules/Page/Logout.aspx");
            RouteTable.Routes.MapPageRoute("Logon", "Logon.aspx", "~/Modules/Page/Logon.aspx");
            RouteTable.Routes.MapPageRoute("Admin", "Admin.aspx", "~/Admins/Default.aspx");
            RouteTable.Routes.MapPageRoute("NoPage", "{NoPage}.htm", "~/Default.aspx");
        }


        void Application_Start(object sender, EventArgs e)
        {

            //LangDefault = LanguageService.Language_GetByDefault();
            LangDefault = "vi";
            //FileExtension = GlobalClass.GetAppSettingKey("FileExtension");
            RegisterRoutes(RouteTable.Routes);
            // Code that runs on application startup
            Application["online"] = 0;
            Application["soluottruycap"] = 0;
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            Session["UserControl"] = "";
            Session["UserName"] = "";
            Session["Key"] = "";
            Session["cityName"] = "";
            Session["districtName"] = "";
            Session["price"] = "";
            Session["area"] = "";
            Session["k"] = "";
            Session["betroom"] = "";


            // Code that runs when a new session is started
            if (Session["Lang"] == null)
            {
                Cookie.SetCookie("Lang", LangDefault);
                Session["Lang"] = LangDefault;
            }
            // Code that runs when a new session is started
            Application["online"] = int.Parse(Application["online"].ToString()) + 1;
            // Application["songuoionline"] = int.Parse(Application["soluottruycap"].ToString()) + 1;
            common.Update_useronline();
        }
        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
            if (Session["Lang"] == null)
            {
                Session["Lang"] = GetLang();
            }
            Application["online"] = int.Parse(Application["online"].ToString()) - 1;
            // Code that runs when a session ends.
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer
            // or SQLServer, the event is not raised.
            common.userofline();

        }
        public static string GetLang()
        {
            return StringClass.Check(Cookie.GetCookie("Lang")) ? Cookie.GetCookie("Lang") : "";
        }
        public static string GetLangAdm()
        {

            return StringClass.Check(Cookie.GetCookie("LangAdm")) ? Cookie.GetCookie("LangAdm") : "";

        }

    }
}
