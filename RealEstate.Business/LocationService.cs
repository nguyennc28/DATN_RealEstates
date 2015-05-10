using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class LocationService
    {
        private static LocationController db = new LocationController();
        #region[LocationInfo_GetById]
        public static List<LocationInfo> LocationInfo_GetById(string Id)
        {
            return db.LocationInfo_GetById(Id);
        }
        #endregion
        #region[LocationInfo_GetByAddress]
        public static List<LocationInfo> LocationInfo_GetByAddress(string Address)
        {
            return db.LocationInfo_GetByAddress(Address);
        }
        #endregion
        #region[LocationInfo_GetByTop]
        public static List<LocationInfo> LocationInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.LocationInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[LocationInfo_GetByAll]
        public static List<LocationInfo> LocationInfo_GetByAll()
        {
            return db.LocationInfo_GetByAll();
        }
        #endregion
        #region[LocationInfo_Paging]
        public static List<LocationInfo> LocationInfo_Paging(string CurentPage, string PageSize)
        {
            return db.LocationInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[LocationInfo_Insert]
        public static bool LocationInfo_Insert(LocationInfo data)
        {
            return db.LocationInfo_Insert(data);
        }
        #endregion
        #region[LocationInfo_Update]
        public static bool LocationInfo_Update(LocationInfo data)
        {
            return db.LocationInfo_Update(data);
        }
        #endregion
        #region[LocationInfo_Delete]
        public static bool LocationInfo_Delete(string Id)
        {
            return db.LocationInfo_Delete(Id);
        }
        #endregion
    }
}
