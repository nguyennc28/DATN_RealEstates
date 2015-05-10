using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class RealEstateService
    {
        private static RealEstateController db = new RealEstateController();
        #region[RealEstateInfo_GetById]
        public static List<RealEstateInfo> RealEstateInfo_GetById(string Id)
        {
            return db.RealEstateInfo_GetById(Id);
        }
        #endregion
        #region[RealEstateInfo_GetByAddress]
        public static List<RealEstateInfo> RealEstateInfo_GetByAddress(string Address)
        {
            return db.RealEstateInfo_GetByAddress(Address);
        }
        #endregion
        #region[RealEstateInfo_GetByTop]
        public static List<RealEstateInfo> RealEstateInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.RealEstateInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[RealEstateInfo_GetByAll]
        public static List<RealEstateInfo> RealEstateInfo_GetByAll()
        {
            return db.RealEstateInfo_GetByAll();
        }
        #endregion
        #region[RealEstateInfo_Paging]
        public static List<RealEstateInfo> RealEstateInfo_Paging(string CurentPage, string PageSize)
        {
            return db.RealEstateInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[RealEstateInfo_Insert]
        public static bool RealEstateInfo_Insert(RealEstateInfo data)
        {
            return db.RealEstateInfo_Insert(data);
        }
        #endregion
        #region[RealEstateInfo_Update]
        public static bool RealEstateInfo_Update(RealEstateInfo data)
        {
            return db.RealEstateInfo_Update(data);
        }
        #endregion
        #region[RealEstateInfo_Delete]
        public static bool RealEstateInfo_Delete(string Id)
        {
            return db.RealEstateInfo_Delete(Id);
        }
        #endregion
    }
}
