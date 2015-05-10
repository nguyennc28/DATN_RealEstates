using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class UsersService
    {
        private static UsersController db = new UsersController();
        #region[UsersInfo_GetById]
        public static List<UsersInfo> UsersInfo_GetById(string Id)
        {
            return db.UsersInfo_GetById(Id);
        }
        #endregion
        #region[UsersInfo_GetByTop]
        public static List<UsersInfo> UsersInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.UsersInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[UsersInfo_GetByAll]
        public static List<UsersInfo> UsersInfo_GetByAll()
        {
            return db.UsersInfo_GetByAll();
        }
        #endregion
        #region[UsersInfo_ChangePass]
        public static bool UsersInfo_ChangePass(string UsersInfoName, string NewPassword)
        {
            return db.UsersInfo_ChangePass(UsersInfoName, NewPassword);
        }
        #endregion
        #region[UsersInfo_Validate]
        public static List<UsersInfo> UsersInfo_Validate(string UserName, string Password)
        {
            List<UsersInfo> list = new List<UsersInfo>();
            list = db.UsersInfo_GetByAll();
            return list.FindAll(delegate(UsersInfo obj)
            {
                return obj.UserName == UserName && obj.Password == Password;
            });
        }
        #endregion
        #region[UsersInfo_GetByUsersInfoname]
        public static List<UsersInfo> UsersInfo_GetByUsersInfoname(string UsersName)
        {
            List<UsersInfo> list = new List<UsersInfo>();
            list = db.UsersInfo_GetByAll();
            return list.FindAll(delegate(UsersInfo obj) { return obj.UserName == UsersName; });
        }
        #endregion
        #region[UsersInfo_Paging]
        public static List<UsersInfo> UsersInfo_Paging(string CurentPage, string PageSize)
        {
            return db.UsersInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[UsersInfo_Insert]
        public static bool UsersInfo_Insert(UsersInfo data)
        {
            return db.UsersInfo_Insert(data);
        }
        #endregion
        #region[UsersInfo_Update]
        public static bool UsersInfo_Update(UsersInfo data)
        {
            return db.UsersInfo_Update(data);
        }
        #endregion
        #region[UsersInfo_Delete]
        public static bool UsersInfo_Delete(string Id)
        {
            return db.UsersInfo_Delete(Id);

        }
        #endregion
        #region [UsersInfo_CheckLogin]

        public static int UsersInfo_CheckLogin(string UsersInfoName, string Password)
        {
            return db.UsersInfo_CheckLogin(UsersInfoName, Password);
        }
        #endregion
    }
}
