using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RealEstate.DataAccess
{
    public class UsersController : SqlDataProvider
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[UsersInfo_GetById]
        public List<UsersInfo> UsersInfo_GetById(string Id)
        {
            List<DataAccess.UsersInfo> list = new List<DataAccess.UsersInfo>();
            DataAccess.UsersInfo obj = new DataAccess.UsersInfo();
            DbCommand cmd = db.GetStoredProcCommand("Users_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UsersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[UsersInfo_GetByTop]
        public List<UsersInfo> UsersInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.UsersInfo> list = new List<DataAccess.UsersInfo>();
            DataAccess.UsersInfo obj = new DataAccess.UsersInfo();
            DbCommand cmd = db.GetStoredProcCommand("Users_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UsersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[UsersInfo_GetByAll]
        public List<UsersInfo> UsersInfo_GetByAll()
        {
            List<DataAccess.UsersInfo> list = new List<DataAccess.UsersInfo>();
            DataAccess.UsersInfo obj = new DataAccess.UsersInfo();
            DbCommand cmd = db.GetStoredProcCommand("Users_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UsersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[UsersInfo_Paging]
        public List<UsersInfo> UsersInfo_Paging(string CurentPage, string PageSize)
        {
            List<DataAccess.UsersInfo> list = new List<DataAccess.UsersInfo>();
            DataAccess.UsersInfo obj = new DataAccess.UsersInfo();
            DbCommand cmd = db.GetStoredProcCommand("Users_SelectPage", CurentPage, PageSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.UsersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[UsersInfo_Insert]
        public bool UsersInfo_Insert(UsersInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Users_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@UserName", data.UserName));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@FullName", data.FullName));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@Avatar", data.Avatar));
                cmd.Parameters.Add(new SqlParameter("@Birthday", data.Birthday));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@MobilePhone", data.MobilePhone));
                cmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
                cmd.Parameters.Add(new SqlParameter("@LastLoggedOn", data.LastLoggedOn));
                cmd.Parameters.Add(new SqlParameter("@CreatedDate", data.CreatedDate));
                cmd.Parameters.Add(new SqlParameter("@GroupID", data.GroupID));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
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
        #region[UsersInfo_Update]
        public bool UsersInfo_Update(UsersInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Users_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@UserID", data.UserID));
                cmd.Parameters.Add(new SqlParameter("@UserName", data.UserName));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@FullName", data.FullName));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@Avatar", data.Avatar));
                cmd.Parameters.Add(new SqlParameter("@Birthday", data.Birthday));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@MobilePhone", data.MobilePhone));
                cmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
                cmd.Parameters.Add(new SqlParameter("@LastLoggedOn", data.LastLoggedOn));
                cmd.Parameters.Add(new SqlParameter("@CreatedDate", data.CreatedDate));
                cmd.Parameters.Add(new SqlParameter("@GroupID", data.GroupID));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
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
        #region[UsersInfo_Delete]
        public bool UsersInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Users_Delete", Id);
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
        #region[UsersInfo_ChangePass]
        public bool UsersInfo_ChangePass(string UserName, string NewPassword)
        {
            DbCommand cmd = db.GetSqlStringCommand("Update [Users] set [Password]='" + NewPassword + "' where UserName= '" + UserName + "'");
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

        #region[UsersInfo_CheckLogin]

        public int UsersInfo_CheckLogin(string UserName, string Password)
        {
            //using (DbCommand cmd = db.GetStoredProcCommand("UsersInfo_CheckLogin"))
            //{
            //    cmd.Parameters.Add()
            //}
            using (SqlCommand cmd = new SqlCommand("Users_CheckLogin", GetConnection()))
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
