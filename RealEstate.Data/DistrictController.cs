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
    public class DistrictController : SqlDataProvider
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[DistrictInfo_GetById]
        public List<DistrictInfo> DistrictInfo_GetById(string Id)
        {
            List<DistrictInfo> list = new List<DistrictInfo>();
            DataAccess.DistrictInfo obj = new DataAccess.DistrictInfo();
            DbCommand cmd = db.GetStoredProcCommand("District_TestByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.DistrictInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[DistrictInfo_GetByAddress]
        public List<DistrictInfo> DistrictInfo_GetByAddress(string Address)
        {
            List<DataAccess.DistrictInfo> list = new List<DataAccess.DistrictInfo>();
            DataAccess.DistrictInfo obj = new DataAccess.DistrictInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_DistrictInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.DistrictInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[DistrictInfo_GetByTop]
        public List<DistrictInfo> DistrictInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.DistrictInfo> list = new List<DataAccess.DistrictInfo>();
            DataAccess.DistrictInfo obj = new DataAccess.DistrictInfo();
            DbCommand cmd = db.GetStoredProcCommand("District_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.DistrictInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[DistrictInfo_GetByAll]
        public List<DistrictInfo> DistrictInfo_GetByAll()
        {
            List<DataAccess.DistrictInfo> list = new List<DataAccess.DistrictInfo>();
            DataAccess.DistrictInfo obj = new DataAccess.DistrictInfo();
            DbCommand cmd = db.GetStoredProcCommand("District_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.DistrictInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[DistrictInfo_Paging]
        public List<DistrictInfo> DistrictInfo_Paging(string CurentDistrictInfo, string DistrictInfoSize)
        {
            List<DataAccess.DistrictInfo> list = new List<DataAccess.DistrictInfo>();
            DataAccess.DistrictInfo obj = new DataAccess.DistrictInfo();
            DbCommand cmd = db.GetStoredProcCommand("District_SelectPage", CurentDistrictInfo, DistrictInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.DistrictInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[DistrictInfo_GetByLevel]
        public List<DistrictInfo> DistrictInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.DistrictInfo> list = new List<DataAccess.DistrictInfo>();
            DataAccess.DistrictInfo obj = new DataAccess.DistrictInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_DistrictInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.DistrictInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[DistrictInfo_Insert]
        public bool DistrictInfo_Insert(DistrictInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("District_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictName", data.DistrictName));
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
        #region[DistrictInfo_Update]
        public bool DistrictInfo_Update(DistrictInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("District_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictName", data.DistrictName));
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
        #region[DistrictInfo_Delete]
        public bool DistrictInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("District_Delete", Id);
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
