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
    public class RealEstateNewsController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[RealEstateNewsInfo_GetById]
        public List<RealEstateNewsInfo> RealEstateNewsInfo_GetById(string Id)
        {
            List<RealEstateNewsInfo> list = new List<RealEstateNewsInfo>();
            DataAccess.RealEstateNewsInfo obj = new DataAccess.RealEstateNewsInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateNewsInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateNewsInfo_GetByAddress]
        public List<RealEstateNewsInfo> RealEstateNewsInfo_GetByAddress(string Address)
        {
            List<DataAccess.RealEstateNewsInfo> list = new List<DataAccess.RealEstateNewsInfo>();
            DataAccess.RealEstateNewsInfo obj = new DataAccess.RealEstateNewsInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateNewsInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateNewsInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateNewsInfo_GetByTop]
        public List<RealEstateNewsInfo> RealEstateNewsInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.RealEstateNewsInfo> list = new List<DataAccess.RealEstateNewsInfo>();
            DataAccess.RealEstateNewsInfo obj = new DataAccess.RealEstateNewsInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateNewsInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateNewsInfo_GetByAll]
        public List<RealEstateNewsInfo> RealEstateNewsInfo_GetByAll()
        {
            List<DataAccess.RealEstateNewsInfo> list = new List<DataAccess.RealEstateNewsInfo>();
            DataAccess.RealEstateNewsInfo obj = new DataAccess.RealEstateNewsInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateNewsInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateNewsInfo_Paging]
        public List<RealEstateNewsInfo> RealEstateNewsInfo_Paging(string CurentRealEstateNewsInfo, string RealEstateNewsInfoSize)
        {
            List<DataAccess.RealEstateNewsInfo> list = new List<DataAccess.RealEstateNewsInfo>();
            DataAccess.RealEstateNewsInfo obj = new DataAccess.RealEstateNewsInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentRealEstateNewsInfo, RealEstateNewsInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateNewsInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateNewsInfo_GetByLevel]
        public List<RealEstateNewsInfo> RealEstateNewsInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.RealEstateNewsInfo> list = new List<DataAccess.RealEstateNewsInfo>();
            DataAccess.RealEstateNewsInfo obj = new DataAccess.RealEstateNewsInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateNewsInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateNewsInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateNewsInfo_Insert]
        public bool RealEstateNewsInfo_Insert(RealEstateNewsInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@RealEstateNewsID", data.RealEstateNewsID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Content", data.Content));
                cmd.Parameters.Add(new SqlParameter("@CategoryID", data.CategoryID));
                cmd.Parameters.Add(new SqlParameter("@Images", data.Images));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@Source", data.Source));
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
        #region[RealEstateNewsInfo_Update]
        public bool RealEstateNewsInfo_Update(RealEstateNewsInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@RealEstateNewsID", data.RealEstateNewsID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Content", data.Content));
                cmd.Parameters.Add(new SqlParameter("@CategoryID", data.CategoryID));
                cmd.Parameters.Add(new SqlParameter("@Images", data.Images));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@Source", data.Source));
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
        #region[RealEstateNewsInfo_Delete]
        public bool RealEstateNewsInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Group_Delete", Id);
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
