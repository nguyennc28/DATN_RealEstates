using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RealEstate.DataAccess
{
	public class UserDAL : SqlDataProvider
	{
        Database db = DatabaseFactory.CreateDatabase();
        #region[User_GetById]
        public List<User> User_GetById(string Id)
        {
            List<DataAccess.User> list = new List<DataAccess.User>();
            DataAccess.User obj = new DataAccess.User();
            DbCommand cmd = db.GetStoredProcCommand("User_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UserIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[User_GetByTop]
        public List<User> User_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.User> list = new List<DataAccess.User>();
            DataAccess.User obj = new DataAccess.User();
            DbCommand cmd = db.GetStoredProcCommand("User_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UserIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[User_GetByAll]
        public List<User> User_GetByAll()
        {
            List<DataAccess.User> list = new List<DataAccess.User>();
            DataAccess.User obj = new DataAccess.User();
            DbCommand cmd = db.GetStoredProcCommand("sp_User_GetByAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UserIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[User_Paging]
        public List<User> User_Paging(string CurentPage, string PageSize)
        {
            List<DataAccess.User> list = new List<DataAccess.User>();
            DataAccess.User obj = new DataAccess.User();
            DbCommand cmd = db.GetStoredProcCommand("User_SelectPage", CurentPage, PageSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UserIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[User_Insert]
        public bool User_Insert(User data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("User_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Username", data.Username));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@Level", data.Level));
                cmd.Parameters.Add(new SqlParameter("@Admin", data.Admin));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                try
                {
                    db.ExecuteNonQuery(cmd);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                    //throw ex;
                }
                finally
                {
                    if (cmd != null) cmd.Dispose();
                }
            }
        }
        #endregion
        #region[User_Update]
        public bool User_Update(User data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("User_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@Id", data.Id));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Username", data.Username));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@Level", data.Level));
                cmd.Parameters.Add(new SqlParameter("@Admin", data.Admin));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                try
                {
                    db.ExecuteNonQuery(cmd);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                    //throw ex;
                }
                finally
                {
                    if (cmd != null) cmd.Dispose();
                }
            }
        }
        #endregion
        #region[User_Delete]
        public bool User_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("User_Delete", Id);
            try
            {
                db.ExecuteNonQuery(cmd);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                //throw ex;
            }
            finally
            {
                if (cmd != null) cmd.Dispose();
            }
        }
        #endregion						
        #region[User_ChangePass]
        public bool User_ChangePass(string UserName, string NewPassword)
        {
            DbCommand cmd = db.GetSqlStringCommand("Update [user] set [password]='" + NewPassword + "' where Username= '" + UserName + "'");
            try
            {
                db.ExecuteNonQuery(cmd);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                //throw ex;
            }
            finally
            {
                if (cmd != null) cmd.Dispose();
            }
        }
        #endregion	
		
        #region[User_CheckLogin]

	    public int User_CheckLogin(string UserName, string Password)
	    {
            //using (DbCommand cmd = db.GetStoredProcCommand("User_CheckLogin"))
            //{
            //    cmd.Parameters.Add()
            //}
	        using (SqlCommand cmd = new SqlCommand("User_CheckLogin", GetConnection()))
	        {
	            cmd.CommandType = CommandType.StoredProcedure;
	            cmd.Parameters.Add(new SqlParameter("@UserName", UserName));
	            cmd.Parameters.Add(new SqlParameter("@Password", Password));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
	            da.Fill(dt);
	            if (dt.Rows.Count >= 1)
	            {
                    return int.Parse(dt.Rows[0]["Level"].ToString());
	            }
	            else
	            {
	                return -1;
	            }
	        }
	    }
        #endregion
    }
}