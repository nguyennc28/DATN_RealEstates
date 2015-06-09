using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class HomeService
    {
        private static HomeController db = new HomeController();
        #region[HomeInfo_GetById]
        public static List<HomeInfo> HomeInfo_GetById(string Id)
        {
            return db.HomeInfo_GetById(Id);
        }
        #endregion
        #region[HomeInfo_GetByAddress]
        public static List<HomeInfo> HomeInfo_GetByAddress(string Address)
        {
            return db.HomeInfo_GetByAddress(Address);
        }
        #endregion
        #region[HomeInfo_GetByTop]
        public static List<HomeInfo> HomeInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.HomeInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[HomeInfo_GetByAll]
        public static List<HomeInfo> HomeInfo_GetByAll()
        {
            return db.HomeInfo_GetByAll();
        }
        #endregion
        #region
        public static List<HomeInfo> Home_GetByAll()
        {
            return db.Home_GetByAll();
        }
        #endregion
        #region[HomeInfo_Paging]
        public static List<HomeInfo> HomeInfo_Paging(string CurentPage, string PageSize)
        {
            return db.HomeInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[HomeInfo_Insert]
        public static bool HomeInfo_Insert(HomeInfo data)
        {
            return db.HomeInfo_Insert(data);
        }
        #endregion
        #region[HomeInfo_InsertGetID]
        public static int HomeInfo_InsertGetID(HomeInfo data, int ID)
        {
            return db.HomeInfo_InsertGetID(data, ID);
        }
        #endregion
        #region[HomeInfo_Update]
        public static bool HomeInfo_Update(HomeInfo data)
        {
            return db.HomeInfo_Update(data);
        }
        #endregion
        #region[HomeInfo_Delete]
        public static bool HomeInfo_Delete(string Id)
        {
            return db.HomeInfo_Delete(Id);
        }
        #endregion
    }
}
