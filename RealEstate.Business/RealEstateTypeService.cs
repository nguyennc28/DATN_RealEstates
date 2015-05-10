using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class RealEstateTypeService
    {
        private static RealEstateTypeController db = new RealEstateTypeController();
        #region[RealEstateTypeInfo_GetById]
        public static List<RealEstateTypeInfo> RealEstateTypeInfo_GetById(string Id)
        {
            return db.RealEstateTypeInfo_GetById(Id);
        }
        #endregion
        #region[RealEstateTypeInfo_GetByAddress]
        public static List<RealEstateTypeInfo> RealEstateTypeInfo_GetByAddress(string Address)
        {
            return db.RealEstateTypeInfo_GetByAddress(Address);
        }
        #endregion
        #region[RealEstateTypeInfo_GetByTop]
        public static List<RealEstateTypeInfo> RealEstateTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.RealEstateTypeInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[RealEstateTypeInfo_GetByAll]
        public static List<RealEstateTypeInfo> RealEstateTypeInfo_GetByAll()
        {
            return db.RealEstateTypeInfo_GetByAll();
        }
        #endregion
        #region[RealEstateTypeInfo_Paging]
        public static List<RealEstateTypeInfo> RealEstateTypeInfo_Paging(string CurentPage, string PageSize)
        {
            return db.RealEstateTypeInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[RealEstateTypeInfo_Insert]
        public static bool RealEstateTypeInfo_Insert(RealEstateTypeInfo data)
        {
            return db.RealEstateTypeInfo_Insert(data);
        }
        #endregion
        #region[RealEstateTypeInfo_Update]
        public static bool RealEstateTypeInfo_Update(RealEstateTypeInfo data)
        {
            return db.RealEstateTypeInfo_Update(data);
        }
        #endregion
        #region[RealEstateTypeInfo_Delete]
        public static bool RealEstateTypeInfo_Delete(string Id)
        {
            return db.RealEstateTypeInfo_Delete(Id);
        }
        #endregion
    }
}
