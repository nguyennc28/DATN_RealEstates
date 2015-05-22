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
    public class LocationController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[LocationInfo_GetById]
        public List<LocationInfo> LocationInfo_GetById(string Id)
        {
            List<LocationInfo> list = new List<LocationInfo>();
            DataAccess.LocationInfo obj = new DataAccess.LocationInfo();
            DbCommand cmd = db.GetStoredProcCommand("Links_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LocationInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LocationInfo_GetByAddress]
        public List<LocationInfo> LocationInfo_GetByAddress(string Address)
        {
            List<DataAccess.LocationInfo> list = new List<DataAccess.LocationInfo>();
            DataAccess.LocationInfo obj = new DataAccess.LocationInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_LocationInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LocationInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LocationInfo_GetByTop]
        public List<LocationInfo> LocationInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.LocationInfo> list = new List<DataAccess.LocationInfo>();
            DataAccess.LocationInfo obj = new DataAccess.LocationInfo();
            DbCommand cmd = db.GetStoredProcCommand("Links_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LocationInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LocationInfo_GetByAll]
        public List<LocationInfo> LocationInfo_GetByAll()
        {
            List<DataAccess.LocationInfo> list = new List<DataAccess.LocationInfo>();
            DataAccess.LocationInfo obj = new DataAccess.LocationInfo();
            DbCommand cmd = db.GetStoredProcCommand("Links_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LocationInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LocationInfo_Paging]
        public List<LocationInfo> LocationInfo_Paging(string CurentLocationInfo, string LocationInfoSize)
        {
            List<DataAccess.LocationInfo> list = new List<DataAccess.LocationInfo>();
            DataAccess.LocationInfo obj = new DataAccess.LocationInfo();
            DbCommand cmd = db.GetStoredProcCommand("Links_SelectPage", CurentLocationInfo, LocationInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LocationInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LocationInfo_GetByLevel]
        public List<LocationInfo> LocationInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.LocationInfo> list = new List<DataAccess.LocationInfo>();
            DataAccess.LocationInfo obj = new DataAccess.LocationInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_LocationInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LocationInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LocationInfo_Insert]
        public bool LocationInfo_Insert(LocationInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Links_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@xcoor", data.xcoor));
                cmd.Parameters.Add(new SqlParameter("@ycoor", data.ycoor));

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
        #region[LocationInfo_Update]
        public bool LocationInfo_Update(LocationInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Links_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@xcoor", data.xcoor));
                cmd.Parameters.Add(new SqlParameter("@ycoor", data.ycoor));
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
        #region[LocationInfo_Delete]
        public bool LocationInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Links_Delete", Id);
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
