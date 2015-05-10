using System;using System.Collections.Generic;using System.Text;using RealEstate.DataAccess;namespace RealEstate.Business{	public class MemberService	{		private static MemberDAL db = new MemberDAL();		#region[Member_GetById]		public static List<Member> Member_GetById(string Id)		{			return db.Member_GetById(Id);		}		#endregion		#region[Member_GetByTop]		public static List<Member> Member_GetByTop(string Top, string Where, string Order)		{			return db.Member_GetByTop(Top, Where, Order);		}		#endregion		#region[Member_GetByAll]		public static List<Member> Member_GetByAll()		{			return db.Member_GetByAll();		}		#endregion
        #region[Member_ChangePass]
        public static bool Member_ChangePass(string UserName, string NewPassword)
        {
            return db.Member_ChangePass(UserName, NewPassword);
        }
        #endregion
        #region[Member_Validate]
        public static List<Member> Member_Validate(string UserName, string Password)
        {
            List<Member> list = new List<Member>();
            list = db.Member_GetByAll();
            return list.FindAll(delegate(Member obj)
            {
                return obj.Username == UserName && obj.Password == Password;
            });
        }
        #endregion
        #region[Member_GetByUsername]
        public static List<Member> User_GetByUsername(string UserName)
        {
            List<Member> list = new List<Member>();
            list = db.Member_GetByAll();
            return list.FindAll(delegate(Member obj) { return obj.Username == UserName; });
        }
        #endregion
        #region[Member_Forgotpass]
        public static List<Member> Member_Forgotpass(string UserName)
        {
            List<Member> list = new List<Member>();
            list = db.Member_GetByAll();
            return list.FindAll(delegate(Member obj) { return obj.Username == UserName || obj.Email == UserName; });
        }
        #endregion		#region[Member_Insert]		public static bool Member_Insert(Member data)		{			return db.Member_Insert(data);		}		#endregion		#region[Member_Update]		public static bool Member_Update(Member data)		{			return db.Member_Update(data);		}		#endregion		#region[Member_Delete]		public static bool Member_Delete(string Id)		{			return db.Member_Delete(Id);		}		#endregion	}}