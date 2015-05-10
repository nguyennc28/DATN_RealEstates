using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RealEstate.DataAccess
{
	public class SupportDAL
	{
        Database db = DatabaseFactory.CreateDatabase();
        #region[Support_GetById]
        public List<Support> Support_GetById(string Id)
        {
            List<DataAccess.Support> list = new List<DataAccess.Support>();
            DataAccess.Support obj = new DataAccess.Support();
            DbCommand cmd = db.GetStoredProcCommand("sp_Support_GetById", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.SupportIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Support_GetByTop]
        public List<Support> Support_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.Support> list = new List<DataAccess.Support>();
            DataAccess.Support obj = new DataAccess.Support();
            DbCommand cmd = db.GetStoredProcCommand("sp_Support_GetByTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.SupportIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Support_GetByAll]
        public List<Support> Support_GetByAll(string Lang)
        {
            List<DataAccess.Support> list = new List<DataAccess.Support>();
            DataAccess.Support obj = new DataAccess.Support();
            DbCommand cmd = db.GetStoredProcCommand("sp_Support_GetByAll", Lang);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.SupportIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Support_Insert]
        public bool Support_Insert(Support data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Support_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Tel", data.Tel));
                cmd.Parameters.Add(new SqlParameter("@Type", data.Type));
                cmd.Parameters.Add(new SqlParameter("@Nick", data.Nick));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                cmd.Parameters.Add(new SqlParameter("@GroupSupportId", data.GroupSupportId == "" || data.GroupSupportId == "0" ? DBNull.Value : (object)data.GroupSupportId));
                cmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
                cmd.Parameters.Add(new SqlParameter("@Location", data.Location));
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
        #region[Support_Update]
        public bool Support_Update(Support data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Support_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@Id", data.Id));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Tel", data.Tel));
                cmd.Parameters.Add(new SqlParameter("@Type", data.Type));
                cmd.Parameters.Add(new SqlParameter("@Nick", data.Nick));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                cmd.Parameters.Add(new SqlParameter("@GroupSupportId", data.GroupSupportId == "" || data.GroupSupportId == "0" ? DBNull.Value : (object)data.GroupSupportId));
                cmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
                cmd.Parameters.Add(new SqlParameter("@Location", data.Location));
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
        #region[Support_Delete]
        public bool Support_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("sp_Support_Delete", Id);
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
	}
}