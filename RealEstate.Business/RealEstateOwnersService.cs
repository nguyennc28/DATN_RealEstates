using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class RealEstateOwnersService
    {
        private static RealEstateOwnersController db = new RealEstateOwnersController();
        #region[RealEstateOwnersInfo_GetById]
        public static List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetById(string Id)
        {
            return db.RealEstateOwnersInfo_GetById(Id);
        }
        #endregion
        #region[RealEstateOwnersInfo_GetByAddress]
        public static List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetByAddress(string Address)
        {
            return db.RealEstateOwnersInfo_GetByAddress(Address);
        }
        #endregion
        #region[RealEstateOwnersInfo_GetByTop]
        public static List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.RealEstateOwnersInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[RealEstateOwnersInfo_GetByAll]
        public static List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetByAll()
        {
            return db.RealEstateOwnersInfo_GetByAll();
        }
        #endregion
        #region[RealEstateOwnersInfo_Paging]
        public static List<RealEstateOwnersInfo> RealEstateOwnersInfo_Paging(string CurentPage, string PageSize)
        {
            return db.RealEstateOwnersInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[RealEstateOwnersInfo_Insert]
        public static int RealEstateOwnersInfo_Insert(RealEstateOwnersInfo data, int ID)
        {
            return db.RealEstateOwnersInfo_Insert(data, ID);
        }
        #endregion
        #region[RealEstateOwnersInfo_Update]
        public static bool RealEstateOwnersInfo_Update(RealEstateOwnersInfo data)
        {
            return db.RealEstateOwnersInfo_Update(data);
        }
        #endregion
        #region[RealEstateOwnersInfo_Delete]
        public static bool RealEstateOwnersInfo_Delete(string Id)
        {
            return db.RealEstateOwnersInfo_Delete(Id);
        }
        #endregion
    }
}
