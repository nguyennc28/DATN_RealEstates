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
    public class RealEstateOwnersTypeController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[RealEstateOwnersTypeInfo_GetById]
        public List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetById(string Id)
        {
            List<RealEstateOwnersTypeInfo> list = new List<RealEstateOwnersTypeInfo>();
            DataAccess.RealEstateOwnersTypeInfo obj = new DataAccess.RealEstateOwnersTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_GetByAddress]
        public List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetByAddress(string Address)
        {
            List<DataAccess.RealEstateOwnersTypeInfo> list = new List<DataAccess.RealEstateOwnersTypeInfo>();
            DataAccess.RealEstateOwnersTypeInfo obj = new DataAccess.RealEstateOwnersTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateOwnersTypeInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_GetByTop]
        public List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.RealEstateOwnersTypeInfo> list = new List<DataAccess.RealEstateOwnersTypeInfo>();
            DataAccess.RealEstateOwnersTypeInfo obj = new DataAccess.RealEstateOwnersTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_GetByAll]
        public List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetByAll()
        {
            List<DataAccess.RealEstateOwnersTypeInfo> list = new List<DataAccess.RealEstateOwnersTypeInfo>();
            DataAccess.RealEstateOwnersTypeInfo obj = new DataAccess.RealEstateOwnersTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_Paging]
        public List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_Paging(string CurentRealEstateOwnersTypeInfo, string RealEstateOwnersTypeInfoSize)
        {
            List<DataAccess.RealEstateOwnersTypeInfo> list = new List<DataAccess.RealEstateOwnersTypeInfo>();
            DataAccess.RealEstateOwnersTypeInfo obj = new DataAccess.RealEstateOwnersTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentRealEstateOwnersTypeInfo, RealEstateOwnersTypeInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_GetByLevel]
        public List<RealEstateOwnersTypeInfo> RealEstateOwnersTypeInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.RealEstateOwnersTypeInfo> list = new List<DataAccess.RealEstateOwnersTypeInfo>();
            DataAccess.RealEstateOwnersTypeInfo obj = new DataAccess.RealEstateOwnersTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateOwnersTypeInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersTypeInfo_Insert]
        public bool RealEstateOwnersTypeInfo_Insert(RealEstateOwnersTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersTypeID", data.RealEstateOwnersTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersTypeName", data.RealEstateOwnersTypeName));
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
        #region[RealEstateOwnersTypeInfo_Update]
        public bool RealEstateOwnersTypeInfo_Update(RealEstateOwnersTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersTypeID", data.RealEstateOwnersTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersTypeName", data.RealEstateOwnersTypeName));
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
        #region[RealEstateOwnersTypeInfo_Delete]
        public bool RealEstateOwnersTypeInfo_Delete(string Id)
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
