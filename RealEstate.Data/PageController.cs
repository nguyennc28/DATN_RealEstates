using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RealEstate.DataAccess
{
    public class PageDAL : SqlDataProvider
	{
        Database db = DatabaseFactory.CreateDatabase();
        #region[Page_GetById]
        public List<Page> Page_GetById(string Id)
        {
            List<DataAccess.Page> list = new List<DataAccess.Page>();
            DataAccess.Page obj = new DataAccess.Page();
            DbCommand cmd = db.GetStoredProcCommand("Pages_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.PageIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Page_GetByTop]
        public List<Page> Page_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.Page> list = new List<DataAccess.Page>();
            DataAccess.Page obj = new DataAccess.Page();
            DbCommand cmd = db.GetStoredProcCommand("Pages_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.PageIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Page_GetByAll]
        public List<Page> Page_GetByAll(string Lang)
        {
            List<DataAccess.Page> list = new List<DataAccess.Page>();
            DataAccess.Page obj = new DataAccess.Page();
            DbCommand cmd = db.GetStoredProcCommand("Pages_SelectAll", Lang);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.PageIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Page_GetBySub]
        public List<Page> Page_GetBySub(string Level)
        {
            List<Page> list = new List<Page>();
            using (SqlCommand dbCmd = new SqlCommand("Pages_SelectSub", GetConnection()))
            {
                Page obj = new Page();
                dbCmd.CommandType = CommandType.StoredProcedure;
                //dbCmd.Parameters.Add(new SqlParameter("@Level", Level));
                dbCmd.Parameters.AddWithValue("@Level", Level);
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.PageIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[Page_Paging]
        public List<Page> Page_Paging(string CurentPage, string PageSize, string Lang)
        {
            List<DataAccess.Page> list = new List<DataAccess.Page>();
            DataAccess.Page obj = new DataAccess.Page();
            DbCommand cmd = db.GetStoredProcCommand("Pages_SelectPage", CurentPage, PageSize, Lang);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.PageIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Page_GetByLevel]
        public List<Page> Page_GetByLevel(string Level, string Lang, int LevelLength)
        {
            List<DataAccess.Page> list = new List<DataAccess.Page>();
            DataAccess.Page obj = new DataAccess.Page();
            DbCommand cmd = db.GetStoredProcCommand("sp_Page_GetByLevel", Level, Lang, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.PageIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Page_Insert]
        public bool Page_Insert(Page data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Pages_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                cmd.Parameters.Add(new SqlParameter("@Content", data.Content));
                cmd.Parameters.Add(new SqlParameter("@Detail", data.Detail));
                cmd.Parameters.Add(new SqlParameter("@Level", data.Level));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Keyword", data.Keyword));
                cmd.Parameters.Add(new SqlParameter("@Type", data.Type));
                cmd.Parameters.Add(new SqlParameter("@Link", data.Link));
                cmd.Parameters.Add(new SqlParameter("@Target", data.Target));
                cmd.Parameters.Add(new SqlParameter("@Position", data.Position));
                cmd.Parameters.Add(new SqlParameter("@index", data.Index));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                cmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
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
        #region[Page_Update]
        public bool Page_Update(Page data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Pages_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@PageID", data.PageID));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                cmd.Parameters.Add(new SqlParameter("@Content", data.Content));
                cmd.Parameters.Add(new SqlParameter("@Detail", data.Detail));
                cmd.Parameters.Add(new SqlParameter("@Level", data.Level));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Keyword", data.Keyword));
                cmd.Parameters.Add(new SqlParameter("@Type", data.Type));
                cmd.Parameters.Add(new SqlParameter("@Link", data.Link));
                cmd.Parameters.Add(new SqlParameter("@Target", data.Target));
                cmd.Parameters.Add(new SqlParameter("@Position", data.Position));
                cmd.Parameters.Add(new SqlParameter("@index", data.Index));
                cmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                cmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                cmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
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
        #region[Page_Delete]
        public bool Page_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Pages_Delete", Id);
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