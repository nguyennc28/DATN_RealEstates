using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class MotelTypeService
    {
        private static MotelTypeController db = new MotelTypeController();
        #region[MotelTypeInfo_GetById]
        public static List<MotelTypeInfo> MotelTypeInfo_GetById(string Id)
        {
            return db.MotelTypeInfo_GetById(Id);
        }
        #endregion
        #region[MotelTypeInfo_GetByAddress]
        public static List<MotelTypeInfo> MotelTypeInfo_GetByAddress(string Address)
        {
            return db.MotelTypeInfo_GetByAddress(Address);
        }
        #endregion
        #region[MotelTypeInfo_GetByTop]
        public static List<MotelTypeInfo> MotelTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.MotelTypeInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[MotelTypeInfo_GetByAll]
        public static List<MotelTypeInfo> MotelTypeInfo_GetByAll()
        {
            return db.MotelTypeInfo_GetByAll();
        }
        #endregion
        #region[MotelTypeInfo_Paging]
        public static List<MotelTypeInfo> MotelTypeInfo_Paging(string CurentPage, string PageSize)
        {
            return db.MotelTypeInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[MotelTypeInfo_Insert]
        public static bool MotelTypeInfo_Insert(MotelTypeInfo data)
        {
            return db.MotelTypeInfo_Insert(data);
        }
        #endregion
        #region[MotelTypeInfo_Update]
        public static bool MotelTypeInfo_Update(MotelTypeInfo data)
        {
            return db.MotelTypeInfo_Update(data);
        }
        #endregion
        #region[MotelTypeInfo_Delete]
        public static bool MotelTypeInfo_Delete(string Id)
        {
            return db.MotelTypeInfo_Delete(Id);
        }
        #endregion
    }
}
