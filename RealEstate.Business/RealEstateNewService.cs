using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class RealEstateNewService
    {
        private static RealEstateNewsController db = new RealEstateNewsController();
        #region[RealEstateNewsInfo_GetById]
        public static List<RealEstateNewsInfo> RealEstateNewsInfo_GetById(string Id)
        {
            return db.RealEstateNewsInfo_GetById(Id);
        }
        #endregion
        #region[RealEstateNewsInfo_GetByAddress]
        public static List<RealEstateNewsInfo> RealEstateNewsInfo_GetByAddress(string Address)
        {
            return db.RealEstateNewsInfo_GetByAddress(Address);
        }
        #endregion
        #region[RealEstateNewsInfo_GetByTop]
        public static List<RealEstateNewsInfo> RealEstateNewsInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.RealEstateNewsInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[RealEstateNewsInfo_GetByAll]
        public static List<RealEstateNewsInfo> RealEstateNewsInfo_GetByAll()
        {
            return db.RealEstateNewsInfo_GetByAll();
        }
        #endregion
        #region[RealEstateNewsInfo_Paging]
        public static List<RealEstateNewsInfo> RealEstateNewsInfo_Paging(string CurentPage, string PageSize)
        {
            return db.RealEstateNewsInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[RealEstateNewsInfo_Insert]
        public static bool RealEstateNewsInfo_Insert(RealEstateNewsInfo data)
        {
            return db.RealEstateNewsInfo_Insert(data);
        }
        #endregion
        #region[RealEstateNewsInfo_Update]
        public static bool RealEstateNewsInfo_Update(RealEstateNewsInfo data)
        {
            return db.RealEstateNewsInfo_Update(data);
        }
        #endregion
        #region[RealEstateNewsInfo_Delete]
        public static bool RealEstateNewsInfo_Delete(string Id)
        {
            return db.RealEstateNewsInfo_Delete(Id);
        }
        #endregion
    }
}
