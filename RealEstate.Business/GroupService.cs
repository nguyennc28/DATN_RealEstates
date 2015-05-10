using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class GroupService
    {
        private static GroupController db = new GroupController();
        #region[GroupInfo_GetById]
        public static List<GroupInfo> GroupInfo_GetById(string Id)
        {
            return db.GroupInfo_GetById(Id);
        }
        #endregion
        #region[GroupInfo_GetByAddress]
        public static List<GroupInfo> GroupInfo_GetByAddress(string Address)
        {
            return db.GroupInfo_GetByAddress(Address);
        }
        #endregion
        #region[GroupInfo_GetByTop]
        public static List<GroupInfo> GroupInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.GroupInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[GroupInfo_GetByAll]
        public static List<GroupInfo> GroupInfo_GetByAll()
        {
            return db.GroupInfo_GetByAll();
        }
        #endregion
        #region[GroupInfo_Paging]
        public static List<GroupInfo> GroupInfo_Paging(string CurentPage, string PageSize)
        {
            return db.GroupInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[GroupInfo_Insert]
        public static bool GroupInfo_Insert(GroupInfo data)
        {
            return db.GroupInfo_Insert(data);
        }
        #endregion
        #region[GroupInfo_Update]
        public static bool GroupInfo_Update(GroupInfo data)
        {
            return db.GroupInfo_Update(data);
        }
        #endregion
        #region[GroupInfo_Delete]
        public static bool GroupInfo_Delete(string Id)
        {
            return db.GroupInfo_Delete(Id);
        }
        #endregion
    }
}
