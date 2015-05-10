using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class LandService
    {
        private static LandController db = new LandController();
        #region[LandInfo_GetById]
        public static List<LandInfo> LandInfo_GetById(string Id)
        {
            return db.LandInfo_GetById(Id);
        }
        #endregion
        #region[LandInfo_GetByAddress]
        public static List<LandInfo> LandInfo_GetByAddress(string Address)
        {
            return db.LandInfo_GetByAddress(Address);
        }
        #endregion
        #region[LandInfo_GetByTop]
        public static List<LandInfo> LandInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.LandInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[LandInfo_GetByAll]
        public static List<LandInfo> LandInfo_GetByAll()
        {
            return db.LandInfo_GetByAll();
        }
        #endregion
        #region[LandInfo_Paging]
        public static List<LandInfo> LandInfo_Paging(string CurentPage, string PageSize)
        {
            return db.LandInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[LandInfo_Insert]
        public static bool LandInfo_Insert(LandInfo data)
        {
            return db.LandInfo_Insert(data);
        }
        #endregion
        #region[LandInfo_Update]
        public static bool LandInfo_Update(LandInfo data)
        {
            return db.LandInfo_Update(data);
        }
        #endregion
        #region[LandInfo_Delete]
        public static bool LandInfo_Delete(string Id)
        {
            return db.LandInfo_Delete(Id);
        }
        #endregion
    }
}
