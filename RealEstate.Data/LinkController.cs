using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;namespace RealEstate.DataAccess{	public class LinkDAL	{
        Database db = DatabaseFactory.CreateDatabase();
        #region[Link_GetById]
        public List<Link> Link_GetById(string Id)
        {
            List<DataAccess.Link> list = new List<DataAccess.Link>();
            DataAccess.Link obj = new DataAccess.Link();
            DbCommand cmd = db.GetStoredProcCommand("sp_Link_GetById", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LinkIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Link_GetByTop]
        public List<Link> Link_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.Link> list = new List<DataAccess.Link>();
            DataAccess.Link obj = new DataAccess.Link();
            DbCommand cmd = db.GetStoredProcCommand("sp_Link_GetByTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LinkIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Link_GetByAll]
        public List<Link> Link_GetByAll(string Lang)
        {
            List<DataAccess.Link> list = new List<DataAccess.Link>();
            DataAccess.Link obj = new DataAccess.Link();
            DbCommand cmd = db.GetStoredProcCommand("sp_Link_GetByAll", Lang);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LinkIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Link_Paging]
        public List<Link> Link_Paging(string CurentPage, string PageSize, string Lang)
        {
            List<DataAccess.Link> list = new List<DataAccess.Link>();
            DataAccess.Link obj = new DataAccess.Link();
            DbCommand cmd = db.GetStoredProcCommand("sp_Link_Paging", CurentPage, PageSize, Lang);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LinkIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Link_Insert]
        public bool Link_Insert(Link data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Link_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Line1", data.Line1));
                cmd.Parameters.Add(new SqlParameter("@Line2", data.Line2));
                cmd.Parameters.Add(new SqlParameter("@Link1", data.Link1));
                cmd.Parameters.Add(new SqlParameter("@Link2", data.Link2));
                cmd.Parameters.Add(new SqlParameter("@Position", data.Position));
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
        #region[Link_Update]
        public bool Link_Update(Link data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("sp_Link_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@Id", data.Id));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Line1", data.Line1));
                cmd.Parameters.Add(new SqlParameter("@Line2", data.Line2));
                cmd.Parameters.Add(new SqlParameter("@Link1", data.Link1));
                cmd.Parameters.Add(new SqlParameter("@Link2", data.Link2));
                cmd.Parameters.Add(new SqlParameter("@Position", data.Position));
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
        #region[Link_Delete]
        public bool Link_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("sp_Link_Delete", Id);
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