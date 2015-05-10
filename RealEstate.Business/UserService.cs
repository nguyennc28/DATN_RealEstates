using System;
using System.Collections.Generic;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
	public class UserService
	{
		private static UserDAL db = new UserDAL();
		#region[User_GetById]
		public static List<User> User_GetById(string Id)
		{
			return db.User_GetById(Id);
		}
		#endregion
		#region[User_GetByTop]
		public static List<User> User_GetByTop(string Top, string Where, string Order)
		{
			return db.User_GetByTop(Top, Where, Order);
		}
		#endregion
		#region[User_GetByAll]
		public static List<User> User_GetByAll()
		{
			return db.User_GetByAll();
		}
		#endregion
        #region[User_ChangePass]
        public static bool User_ChangePass(string UserName, string NewPassword)
        {
            return db.User_ChangePass(UserName, NewPassword);
        }
        #endregion
        #region[User_Validate]
        public static List<User> User_Validate(string UserName, string Password)
        {
            List<User> list = new List<User>();
            list = db.User_GetByAll();
            return list.FindAll(delegate(User obj)
            {
                return obj.Username == UserName && obj.Password == Password;
            });
        }
        #endregion
        #region[User_GetByUsername]
        public static List<User> User_GetByUsername(string UserName)
        {
            List<User> list = new List<User>();
            list = db.User_GetByAll();
            return list.FindAll(delegate(User obj) { return obj.Username == UserName; });
        }
        #endregion
		#region[User_Paging]
		public static List<User> User_Paging(string CurentPage, string PageSize)
		{
			return db.User_Paging(CurentPage, PageSize);
		}
		#endregion
		#region[User_Insert]
		public static bool User_Insert(User data)
		{
			return db.User_Insert(data);
		}
		#endregion
		#region[User_Update]
		public static bool User_Update(User data)
		{
			return db.User_Update(data);
		}
		#endregion
		#region[User_Delete]
		public static bool User_Delete(string Id)
		{
			return db.User_Delete(Id);
           
		}
		#endregion
        #region [User_CheckLogin]

	    public static int User_CheckLogin(string UserName, string Password)
	    {
	        return db.User_CheckLogin(UserName, Password);
	    }
        #endregion
    }
}