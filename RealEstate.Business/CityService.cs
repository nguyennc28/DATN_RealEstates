using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class CityService
    {
        private static CityController db = new CityController();
        #region[CityInfo_GetById]
        public static List<CityInfo> CityInfo_GetById(string Id)
        {
            return db.CityInfo_GetById(Id);
        }
        #endregion
        #region[CityInfo_GetByAddress]
        public static List<CityInfo> CityInfo_GetByAddress(string Address)
        {
            return db.CityInfo_GetByAddress(Address);
        }
        #endregion
        #region[CityInfo_GetByTop]
        public static List<CityInfo> CityInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.CityInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[CityInfo_GetByAll]
        public static List<CityInfo> CityInfo_GetByAll()
        {
            return db.CityInfo_GetByAll();
        }
        #endregion
        #region[CityInfo_Paging]
        public static List<CityInfo> CityInfo_Paging(string CurentPage, string PageSize)
        {
            return db.CityInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[CityInfo_Insert]
        public static bool CityInfo_Insert(CityInfo data)
        {
            return db.CityInfo_Insert(data);
        }
        #endregion
        #region[CityInfo_Update]
        public static bool CityInfo_Update(CityInfo data)
        {
            return db.CityInfo_Update(data);
        }
        #endregion
        #region[CityInfo_Delete]
        public static bool CityInfo_Delete(string Id)
        {
            return db.CityInfo_Delete(Id);
        }
        #endregion
    }
}
