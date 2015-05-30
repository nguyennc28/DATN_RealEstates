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
    public class RealEstateTypeController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[RealEstateTypeInfo_GetById]
        public List<RealEstateTypeInfo> RealEstateTypeInfo_GetById(string Id)
        {
            List<RealEstateTypeInfo> list = new List<RealEstateTypeInfo>();
            DataAccess.RealEstateTypeInfo obj = new DataAccess.RealEstateTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateType_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateTypeInfo_GetByAddress]
        public List<RealEstateTypeInfo> RealEstateTypeInfo_GetByAddress(string Address)
        {
            List<DataAccess.RealEstateTypeInfo> list = new List<DataAccess.RealEstateTypeInfo>();
            DataAccess.RealEstateTypeInfo obj = new DataAccess.RealEstateTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateTypeInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateTypeInfo_GetByTop]
        public List<RealEstateTypeInfo> RealEstateTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.RealEstateTypeInfo> list = new List<DataAccess.RealEstateTypeInfo>();
            DataAccess.RealEstateTypeInfo obj = new DataAccess.RealEstateTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateType_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateTypeInfo_GetByAll]
        public List<RealEstateTypeInfo> RealEstateTypeInfo_GetByAll()
        {
            List<DataAccess.RealEstateTypeInfo> list = new List<DataAccess.RealEstateTypeInfo>();
            DataAccess.RealEstateTypeInfo obj = new DataAccess.RealEstateTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateType_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateTypeInfo_Paging]
        public List<RealEstateTypeInfo> RealEstateTypeInfo_Paging(string CurentRealEstateTypeInfo, string RealEstateTypeInfoSize)
        {
            List<DataAccess.RealEstateTypeInfo> list = new List<DataAccess.RealEstateTypeInfo>();
            DataAccess.RealEstateTypeInfo obj = new DataAccess.RealEstateTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateType_SelectPage", CurentRealEstateTypeInfo, RealEstateTypeInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateTypeInfo_GetByLevel]
        public List<RealEstateTypeInfo> RealEstateTypeInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.RealEstateTypeInfo> list = new List<DataAccess.RealEstateTypeInfo>();
            DataAccess.RealEstateTypeInfo obj = new DataAccess.RealEstateTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateTypeInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateTypeInfo_Insert]
        public bool RealEstateTypeInfo_Insert(RealEstateTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("RealEstateType_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateTypeID", data.RealEstateTypeID));
                cmd.Parameters.Add(new SqlParameter("@NameRealEstateType", data.NameRealEstateType));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
               
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
        #region[RealEstateTypeInfo_Update]
        public bool RealEstateTypeInfo_Update(RealEstateTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("RealEstateType_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@RealEstateTypeID", data.RealEstateTypeID));
                cmd.Parameters.Add(new SqlParameter("@NameRealEstateType", data.NameRealEstateType));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
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
        #region[RealEstateTypeInfo_Delete]
        public bool RealEstateTypeInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("RealEstateType_Delete", Id);
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
