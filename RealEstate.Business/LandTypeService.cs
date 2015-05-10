using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class LandTypeService
    {
        private static LandTypeController db = new LandTypeController();
        #region[LandTypeInfo_GetById]
        public static List<LandTypeInfo> LandTypeInfo_GetById(string Id)
        {
            return db.LandTypeInfo_GetById(Id);
        }
        #endregion
        #region[LandTypeInfo_GetByAddress]
        public static List<LandTypeInfo> LandTypeInfo_GetByAddress(string Address)
        {
            return db.LandTypeInfo_GetByAddress(Address);
        }
        #endregion
        #region[LandTypeInfo_GetByTop]
        public static List<LandTypeInfo> LandTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.LandTypeInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[LandTypeInfo_GetByAll]
        public static List<LandTypeInfo> LandTypeInfo_GetByAll()
        {
            return db.LandTypeInfo_GetByAll();
        }
        #endregion
        #region[LandTypeInfo_Paging]
        public static List<LandTypeInfo> LandTypeInfo_Paging(string CurentPage, string PageSize)
        {
            return db.LandTypeInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[LandTypeInfo_Insert]
        public static bool LandTypeInfo_Insert(LandTypeInfo data)
        {
            return db.LandTypeInfo_Insert(data);
        }
        #endregion
        #region[LandTypeInfo_Update]
        public static bool LandTypeInfo_Update(LandTypeInfo data)
        {
            return db.LandTypeInfo_Update(data);
        }
        #endregion
        #region[LandTypeInfo_Delete]
        public static bool LandTypeInfo_Delete(string Id)
        {
            return db.LandTypeInfo_Delete(Id);
        }
        #endregion
    }
}
