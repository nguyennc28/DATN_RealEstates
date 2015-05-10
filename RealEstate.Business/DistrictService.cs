using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class DistrictService
    {
        private static DistrictController db = new DistrictController();
        #region[DistrictInfo_GetById]
        public static List<DistrictInfo> DistrictInfo_GetById(string Id)
        {
            return db.DistrictInfo_GetById(Id);
        }
        #endregion
        #region[DistrictInfo_GetByAddress]
        public static List<DistrictInfo> DistrictInfo_GetByAddress(string Address)
        {
            return db.DistrictInfo_GetByAddress(Address);
        }
        #endregion
        #region[DistrictInfo_GetByTop]
        public static List<DistrictInfo> DistrictInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.DistrictInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[DistrictInfo_GetByAll]
        public static List<DistrictInfo> DistrictInfo_GetByAll()
        {
            return db.DistrictInfo_GetByAll();
        }
        #endregion
        #region[DistrictInfo_Paging]
        public static List<DistrictInfo> DistrictInfo_Paging(string CurentPage, string PageSize)
        {
            return db.DistrictInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[DistrictInfo_Insert]
        public static bool DistrictInfo_Insert(DistrictInfo data)
        {
            return db.DistrictInfo_Insert(data);
        }
        #endregion
        #region[DistrictInfo_Update]
        public static bool DistrictInfo_Update(DistrictInfo data)
        {
            return db.DistrictInfo_Update(data);
        }
        #endregion
        #region[DistrictInfo_Delete]
        public static bool DistrictInfo_Delete(string Id)
        {
            return db.DistrictInfo_Delete(Id);
        }
        #endregion
    }
}
