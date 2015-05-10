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
    public class RegionController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[RegionInfo_GetById]
        public List<RegionInfo> RegionInfo_GetById(string Id)
        {
            List<RegionInfo> list = new List<RegionInfo>();
            DataAccess.RegionInfo obj = new DataAccess.RegionInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RegionInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RegionInfo_GetByAddress]
        public List<RegionInfo> RegionInfo_GetByAddress(string Address)
        {
            List<DataAccess.RegionInfo> list = new List<DataAccess.RegionInfo>();
            DataAccess.RegionInfo obj = new DataAccess.RegionInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RegionInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RegionInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RegionInfo_GetByTop]
        public List<RegionInfo> RegionInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.RegionInfo> list = new List<DataAccess.RegionInfo>();
            DataAccess.RegionInfo obj = new DataAccess.RegionInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RegionInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RegionInfo_GetByAll]
        public List<RegionInfo> RegionInfo_GetByAll()
        {
            List<DataAccess.RegionInfo> list = new List<DataAccess.RegionInfo>();
            DataAccess.RegionInfo obj = new DataAccess.RegionInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RegionInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RegionInfo_Paging]
        public List<RegionInfo> RegionInfo_Paging(string CurentRegionInfo, string RegionInfoSize)
        {
            List<DataAccess.RegionInfo> list = new List<DataAccess.RegionInfo>();
            DataAccess.RegionInfo obj = new DataAccess.RegionInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentRegionInfo, RegionInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RegionInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RegionInfo_GetByLevel]
        public List<RegionInfo> RegionInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.RegionInfo> list = new List<DataAccess.RegionInfo>();
            DataAccess.RegionInfo obj = new DataAccess.RegionInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RegionInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RegionInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RegionInfo_Insert]
        public bool RegionInfo_Insert(RegionInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@RegionID", data.RegionID));
                cmd.Parameters.Add(new SqlParameter("@RegionName", data.RegionName));

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
        #region[RegionInfo_Update]
        public bool RegionInfo_Update(RegionInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@RegionID", data.RegionID));
                cmd.Parameters.Add(new SqlParameter("@RegionName", data.RegionName));
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
        #region[RegionInfo_Delete]
        public bool RegionInfo_Delete(string Id)
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
