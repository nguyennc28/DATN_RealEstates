using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class StaffService
    {
        private static StaffController db = new StaffController();
        #region[StaffInfo_GetById]
        public static List<StaffInfo> StaffInfo_GetById(string Id)
        {
            return db.StaffInfo_GetById(Id);
        }
        #endregion
        #region[StaffInfo_GetByAddress]
        public static List<StaffInfo> StaffInfo_GetByAddress(string Address)
        {
            return db.StaffInfo_GetByAddress(Address);
        }
        #endregion
        #region[StaffInfo_GetByTop]
        public static List<StaffInfo> StaffInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.StaffInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[StaffInfo_GetByAll]
        public static List<StaffInfo> StaffInfo_GetByAll()
        {
            return db.StaffInfo_GetByAll();
        }
        #endregion
        #region[StaffInfo_Paging]
        public static List<StaffInfo> StaffInfo_Paging(string CurentPage, string PageSize)
        {
            return db.StaffInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[StaffInfo_Insert]
        public static bool StaffInfo_Insert(StaffInfo data)
        {
            return db.StaffInfo_Insert(data);
        }
        #endregion
        #region[StaffInfo_Update]
        public static bool StaffInfo_Update(StaffInfo data)
        {
            return db.StaffInfo_Update(data);
        }
        #endregion
        #region[StaffInfo_Delete]
        public static bool StaffInfo_Delete(string Id)
        {
            return db.StaffInfo_Delete(Id);
        }
        #endregion
    }
}
