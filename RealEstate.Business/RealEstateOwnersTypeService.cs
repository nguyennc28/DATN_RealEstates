using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class RealEstateOwnersTypeService
    {
        private static RealEstateOwnersTypeController db = new RealEstateOwnersTypeController();
        #region[RealEstateOwnersTypeInfo_GetById]
        public static List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetById(string Id)
        {
            return db.RealEstateOwnersTypeInfo_GetById(Id);
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_GetByAddress]
        public static List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetByAddress(string Address)
        {
            return db.RealEstateOwnersTypeInfo_GetByAddress(Address);
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_GetByTop]
        public static List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.RealEstateOwnersTypeInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_GetByAll]
        public static List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetByAll()
        {
            return db.RealEstateOwnersTypeInfo_GetByAll();
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_Paging]
        public static List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_Paging(string CurentPage, string PageSize)
        {
            return db.RealEstateOwnersTypeInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_Insert]
        public static bool RealEstateOwnersTypeInfo_Insert(RealEstateOwnersTypeInfo data)
        {
            return db.RealEstateOwnersTypeInfo_Insert(data);
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_Update]
        public static bool RealEstateOwnersTypeInfo_Update(RealEstateOwnersTypeInfo data)
        {
            return db.RealEstateOwnersTypeInfo_Update(data);
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_Delete]
        public static bool RealEstateOwnersTypeInfo_Delete(string Id)
        {
            return db.RealEstateOwnersTypeInfo_Delete(Id);
        }
        #endregion
    }
}
