using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class MotelService
    {
        private static MotelController db = new MotelController();
        #region[MotelInfo_GetById]
        public static List<MotelInfo> MotelInfo_GetById(string Id)
        {
            return db.MotelInfo_GetById(Id);
        }
        #endregion
        #region[MotelInfo_GetByAddress]
        public static List<MotelInfo> MotelInfo_GetByAddress(string Address)
        {
            return db.MotelInfo_GetByAddress(Address);
        }
        #endregion
        #region[MotelInfo_GetByTop]
        public static List<MotelInfo> MotelInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.MotelInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[MotelInfo_GetByAll]
        public static List<MotelInfo> MotelInfo_GetByAll()
        {
            return db.MotelInfo_GetByAll();
        }
        #endregion
        #region[MotelInfo_Paging]
        public static List<MotelInfo> MotelInfo_Paging(string CurentPage, string PageSize)
        {
            return db.MotelInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[MotelInfo_Insert]
        public static bool MotelInfo_Insert(MotelInfo data)
        {
            return db.MotelInfo_Insert(data);
        }
        #endregion
        #region[MotelInfo_InsertGetID]
        public static int MotelInfo_InsertGetID(MotelInfo data, int ID)
        {
            return db.MotelInfo_InsertGetID(data, ID);
        }
        #endregion

        #region[MotelInfo_Update]
        public static bool MotelInfo_Update(MotelInfo data)
        {
            return db.MotelInfo_Update(data);
        }
        #endregion
        #region[MotelInfo_Delete]
        public static bool MotelInfo_Delete(string Id)
        {
            return db.MotelInfo_Delete(Id);
        }
        #endregion
    }
}
