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
    public class MotelTypeController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[MotelTypeInfo_GetById]
        public List<MotelTypeInfo> MotelTypeInfo_GetById(string Id)
        {
            List<MotelTypeInfo> list = new List<MotelTypeInfo>();
            DataAccess.MotelTypeInfo obj = new DataAccess.MotelTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelTypeInfo_GetByAddress]
        public List<MotelTypeInfo> MotelTypeInfo_GetByAddress(string Address)
        {
            List<DataAccess.MotelTypeInfo> list = new List<DataAccess.MotelTypeInfo>();
            DataAccess.MotelTypeInfo obj = new DataAccess.MotelTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_MotelTypeInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelTypeInfo_GetByTop]
        public List<MotelTypeInfo> MotelTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.MotelTypeInfo> list = new List<DataAccess.MotelTypeInfo>();
            DataAccess.MotelTypeInfo obj = new DataAccess.MotelTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelTypeInfo_GetByAll]
        public List<MotelTypeInfo> MotelTypeInfo_GetByAll()
        {
            List<DataAccess.MotelTypeInfo> list = new List<DataAccess.MotelTypeInfo>();
            DataAccess.MotelTypeInfo obj = new DataAccess.MotelTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelTypeInfo_Paging]
        public List<MotelTypeInfo> MotelTypeInfo_Paging(string CurentMotelTypeInfo, string MotelTypeInfoSize)
        {
            List<DataAccess.MotelTypeInfo> list = new List<DataAccess.MotelTypeInfo>();
            DataAccess.MotelTypeInfo obj = new DataAccess.MotelTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentMotelTypeInfo, MotelTypeInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelTypeInfo_GetByLevel]
        public List<MotelTypeInfo> MotelTypeInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.MotelTypeInfo> list = new List<DataAccess.MotelTypeInfo>();
            DataAccess.MotelTypeInfo obj = new DataAccess.MotelTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_MotelTypeInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelTypeInfo_Insert]
        public bool MotelTypeInfo_Insert(MotelTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@MotelTypeID", data.MotelTypeID));
                cmd.Parameters.Add(new SqlParameter("@MotelTypeName", data.MotelTypeName));
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
        #region[MotelTypeInfo_Update]
        public bool MotelTypeInfo_Update(MotelTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@MotelTypeID", data.MotelTypeID));
                cmd.Parameters.Add(new SqlParameter("@MotelTypeName", data.MotelTypeName));
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
        #region[MotelTypeInfo_Delete]
        public bool MotelTypeInfo_Delete(string Id)
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
