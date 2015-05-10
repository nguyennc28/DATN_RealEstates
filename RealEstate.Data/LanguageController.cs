using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;
namespace RealEstate.DataAccess
{
	public class LanguageDAL
	{
        Database db = DatabaseFactory.CreateDatabase();
        #region[Language_GetById]
        public List<Language> Language_GetById(string Id)
        {
            List<DataAccess.Language> list = new List<DataAccess.Language>();
            DataAccess.Language obj = new DataAccess.Language();
            DbCommand cmd = db.GetStoredProcCommand("sp_Language_GetById", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LanguageIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Language_GetByAll]
        public List<Language> Language_GetByAll()
        {
            List<DataAccess.Language> list = new List<DataAccess.Language>();
            DataAccess.Language obj = new DataAccess.Language();
            DbCommand cmd = db.GetStoredProcCommand("sp_Language_GetByAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LanguageIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Language_Insert]
        public bool Language_Insert(Language data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Language_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Folder", data.Folder));
                cmd.Parameters.Add(new SqlParameter("@Default", data.Default));
                cmd.Parameters.Add(new SqlParameter("@Image", data.Image));
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
        #region[Language_Update]
        public bool Language_Update(Language data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Language_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@Id", data.Id));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Folder", data.Folder));
                cmd.Parameters.Add(new SqlParameter("@Default", data.Default));
                cmd.Parameters.Add(new SqlParameter("@Image", data.Image));
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
        #region[Language_Delete]
        public bool Language_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("sp_Language_Delete", Id);
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