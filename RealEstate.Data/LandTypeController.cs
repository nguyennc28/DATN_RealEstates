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
    public class LandTypeController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[LandTypeInfo_GetById]
        public List<LandTypeInfo> LandTypeInfo_GetById(string Id)
        {
            List<LandTypeInfo> list = new List<LandTypeInfo>();
            DataAccess.LandTypeInfo obj = new DataAccess.LandTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandTypeInfo_GetByAddress]
        public List<LandTypeInfo> LandTypeInfo_GetByAddress(string Address)
        {
            List<DataAccess.LandTypeInfo> list = new List<DataAccess.LandTypeInfo>();
            DataAccess.LandTypeInfo obj = new DataAccess.LandTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_LandTypeInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandTypeInfo_GetByTop]
        public List<LandTypeInfo> LandTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.LandTypeInfo> list = new List<DataAccess.LandTypeInfo>();
            DataAccess.LandTypeInfo obj = new DataAccess.LandTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandTypeInfo_GetByAll]
        public List<LandTypeInfo> LandTypeInfo_GetByAll()
        {
            List<DataAccess.LandTypeInfo> list = new List<DataAccess.LandTypeInfo>();
            DataAccess.LandTypeInfo obj = new DataAccess.LandTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandTypeInfo_Paging]
        public List<LandTypeInfo> LandTypeInfo_Paging(string CurentLandTypeInfo, string LandTypeInfoSize)
        {
            List<DataAccess.LandTypeInfo> list = new List<DataAccess.LandTypeInfo>();
            DataAccess.LandTypeInfo obj = new DataAccess.LandTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentLandTypeInfo, LandTypeInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandTypeInfo_GetByLevel]
        public List<LandTypeInfo> LandTypeInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.LandTypeInfo> list = new List<DataAccess.LandTypeInfo>();
            DataAccess.LandTypeInfo obj = new DataAccess.LandTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_LandTypeInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandTypeInfo_Insert]
        public bool LandTypeInfo_Insert(LandTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@GroupID", data.GroupID));
                //cmd.Parameters.Add(new SqlParameter("@HomeTypeID", data.HomeTypeID));
                cmd.Parameters.Add(new SqlParameter("@LandTypeName", data.LandTypeName));
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
        #region[LandTypeInfo_Update]
        public bool LandTypeInfo_Update(LandTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@LandTypeID", data.LandTypeID));
                cmd.Parameters.Add(new SqlParameter("@LandTypeName", data.LandTypeName));
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
        #region[LandTypeInfo_Delete]
        public bool LandTypeInfo_Delete(string Id)
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
