using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;namespace RealEstate.DataAccess{	public class MemberDAL	{
        Database db = DatabaseFactory.CreateDatabase();
        #region[Member_GetById]
        public List<Member> Member_GetById(string Id)
        {
            List<DataAccess.Member> list = new List<DataAccess.Member>();
            DataAccess.Member obj = new DataAccess.Member();
            DbCommand cmd = db.GetStoredProcCommand("sp_Member_GetById", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MemberIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Member_GetByTop]
        public List<Member> Member_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.Member> list = new List<DataAccess.Member>();
            DataAccess.Member obj = new DataAccess.Member();
            DbCommand cmd = db.GetStoredProcCommand("sp_Member_GetByTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MemberIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Member_GetByAll]
        public List<Member> Member_GetByAll()
        {
            List<DataAccess.Member> list = new List<DataAccess.Member>();
            DataAccess.Member obj = new DataAccess.Member();
            DbCommand cmd = db.GetStoredProcCommand("sp_Member_GetByAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MemberIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Member_Insert]
        public bool Member_Insert(Member data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Member_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Username", data.Username));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@GroupMemberId", data.GroupMemberId == "" || data.GroupMemberId == "0" ? DBNull.Value : (object)data.GroupMemberId));
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
        #region[Member_Update]
        public bool Member_Update(Member data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Member_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@Id", data.Id));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Username", data.Username));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@GroupMemberId", data.GroupMemberId == "" || data.GroupMemberId == "0" ? DBNull.Value : (object)data.GroupMemberId));
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
        #region[Member_Delete]
        public bool Member_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("sp_Member_Delete", Id);
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
        #endregion						        #region[Member_ChangePass]
        public bool Member_ChangePass(string UserName, string NewPassword)
        {
            DbCommand cmd = db.GetSqlStringCommand("Update [Member] set [password]='" + NewPassword + "' where Username= '" + UserName + "'");
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
        #endregion									}}