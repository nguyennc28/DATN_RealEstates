using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class HomeTypeService
    {
        private static HomeTypeController db = new HomeTypeController();
        #region[HomeTypeInfo_GetById]
        public static List<HomeTypeInfo> HomeTypeInfo_GetById(string Id)
        {
            return db.HomeTypeInfo_GetById(Id);
        }
        #endregion
        #region[HomeTypeInfo_GetByAddress]
        public static List<HomeTypeInfo> HomeTypeInfo_GetByAddress(string Address)
        {
            return db.HomeTypeInfo_GetByAddress(Address);
        }
        #endregion
        #region[HomeTypeInfo_GetByTop]
        public static List<HomeTypeInfo> HomeTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.HomeTypeInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[HomeTypeInfo_GetByAll]
        public static List<HomeTypeInfo> HomeTypeInfo_GetByAll()
        {
            return db.HomeTypeInfo_GetByAll();
        }
        #endregion
        #region[HomeTypeInfo_Paging]
        public static List<HomeTypeInfo> HomeTypeInfo_Paging(string CurentPage, string PageSize)
        {
            return db.HomeTypeInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[HomeTypeInfo_Insert]
        public static bool HomeTypeInfo_Insert(HomeTypeInfo data)
        {
            return db.HomeTypeInfo_Insert(data);
        }
        #endregion
        #region[HomeTypeInfo_Update]
        public static bool HomeTypeInfo_Update(HomeTypeInfo data)
        {
            return db.HomeTypeInfo_Update(data);
        }
        #endregion
        #region[HomeTypeInfo_Delete]
        public static bool HomeTypeInfo_Delete(string Id)
        {
            return db.HomeTypeInfo_Delete(Id);
        }
        #endregion
    }
}
