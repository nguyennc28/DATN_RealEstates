using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class RegionService
    {
        private static RegionController db = new RegionController();
        #region[RegionInfo_GetById]
        public static List<RegionInfo> RegionInfo_GetById(string Id)
        {
            return db.RegionInfo_GetById(Id);
        }
        #endregion
        #region[RegionInfo_GetByAddress]
        public static List<RegionInfo> RegionInfo_GetByAddress(string Address)
        {
            return db.RegionInfo_GetByAddress(Address);
        }
        #endregion
        #region[RegionInfo_GetByTop]
        public static List<RegionInfo> RegionInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.RegionInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[RegionInfo_GetByAll]
        public static List<RegionInfo> RegionInfo_GetByAll()
        {
            return db.RegionInfo_GetByAll();
        }
        #endregion
        #region[RegionInfo_Paging]
        public static List<RegionInfo> RegionInfo_Paging(string CurentPage, string PageSize)
        {
            return db.RegionInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[RegionInfo_Insert]
        public static bool RegionInfo_Insert(RegionInfo data)
        {
            return db.RegionInfo_Insert(data);
        }
        #endregion
        #region[RegionInfo_Update]
        public static bool RegionInfo_Update(RegionInfo data)
        {
            return db.RegionInfo_Update(data);
        }
        #endregion
        #region[RegionInfo_Delete]
        public static bool RegionInfo_Delete(string Id)
        {
            return db.RegionInfo_Delete(Id);
        }
        #endregion
    }
}
