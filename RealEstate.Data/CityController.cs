using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RealEstate.DataAccess
{
    public class CityController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[CityInfo_GetById]
        public List<CityInfo> CityInfo_GetById(string Id)
        {
            List<CityInfo> list = new List<CityInfo>();
            DataAccess.CityInfo obj = new DataAccess.CityInfo();
            DbCommand cmd = db.GetStoredProcCommand("City_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CityInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[CityInfo_GetByAddress]
        public List<CityInfo> CityInfo_GetByAddress(string Address)
        {
            List<DataAccess.CityInfo> list = new List<DataAccess.CityInfo>();
            DataAccess.CityInfo obj = new DataAccess.CityInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_CityInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CityInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[CityInfo_GetByTop]
        public List<CityInfo> CityInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.CityInfo> list = new List<DataAccess.CityInfo>();
            DataAccess.CityInfo obj = new DataAccess.CityInfo();
            DbCommand cmd = db.GetStoredProcCommand("City_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CityInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[CityInfo_GetByAll]
        public List<CityInfo> CityInfo_GetByAll()
        {
            List<DataAccess.CityInfo> list = new List<DataAccess.CityInfo>();
            DataAccess.CityInfo obj = new DataAccess.CityInfo();
            DbCommand cmd = db.GetStoredProcCommand("City_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CityInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[CityInfo_Paging]
        public List<CityInfo> CityInfo_Paging(string CurentCityInfo, string CityInfoSize)
        {
            List<DataAccess.CityInfo> list = new List<DataAccess.CityInfo>();
            DataAccess.CityInfo obj = new DataAccess.CityInfo();
            DbCommand cmd = db.GetStoredProcCommand("City_SelectPage", CurentCityInfo, CityInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CityInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[CityInfo_GetByLevel]
        public List<CityInfo> CityInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.CityInfo> list = new List<DataAccess.CityInfo>();
            DataAccess.CityInfo obj = new DataAccess.CityInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_CityInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CityInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[CityInfo_Insert]
        public bool CityInfo_Insert(CityInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("City_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@CityCode", data.CityCode));
                cmd.Parameters.Add(new SqlParameter("@CityName", data.CityName));
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
        #region[CityInfo_Update]
        public bool CityInfo_Update(CityInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("City_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@CityCode", data.CityCode));
                cmd.Parameters.Add(new SqlParameter("@CityName", data.CityName));
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
        #region[CityInfo_Delete]
        public bool CityInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("City_Delete", Id);
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
