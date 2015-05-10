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
    public class HomeTypeController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[HomeTypeInfo_GetById]
        public List<HomeTypeInfo> HomeTypeInfo_GetById(string Id)
        {
            List<HomeTypeInfo> list = new List<HomeTypeInfo>();
            DataAccess.HomeTypeInfo obj = new DataAccess.HomeTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeTypeInfo_GetByAddress]
        public List<HomeTypeInfo> HomeTypeInfo_GetByAddress(string Address)
        {
            List<DataAccess.HomeTypeInfo> list = new List<DataAccess.HomeTypeInfo>();
            DataAccess.HomeTypeInfo obj = new DataAccess.HomeTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_HomeTypeInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeTypeInfo_GetByTop]
        public List<HomeTypeInfo> HomeTypeInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.HomeTypeInfo> list = new List<DataAccess.HomeTypeInfo>();
            DataAccess.HomeTypeInfo obj = new DataAccess.HomeTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeTypeInfo_GetByAll]
        public List<HomeTypeInfo> HomeTypeInfo_GetByAll()
        {
            List<DataAccess.HomeTypeInfo> list = new List<DataAccess.HomeTypeInfo>();
            DataAccess.HomeTypeInfo obj = new DataAccess.HomeTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeTypeInfo_Paging]
        public List<HomeTypeInfo> HomeTypeInfo_Paging(string CurentHomeTypeInfo, string HomeTypeInfoSize)
        {
            List<DataAccess.HomeTypeInfo> list = new List<DataAccess.HomeTypeInfo>();
            DataAccess.HomeTypeInfo obj = new DataAccess.HomeTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentHomeTypeInfo, HomeTypeInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeTypeInfo_GetByLevel]
        public List<HomeTypeInfo> HomeTypeInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.HomeTypeInfo> list = new List<DataAccess.HomeTypeInfo>();
            DataAccess.HomeTypeInfo obj = new DataAccess.HomeTypeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_HomeTypeInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeTypeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeTypeInfo_Insert]
        public bool HomeTypeInfo_Insert(HomeTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@GroupID", data.GroupID));
                //cmd.Parameters.Add(new SqlParameter("@HomeTypeID", data.HomeTypeID));
                cmd.Parameters.Add(new SqlParameter("@HomeTypeName", data.HomeTypeName));
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
        #region[HomeTypeInfo_Update]
        public bool HomeTypeInfo_Update(HomeTypeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@HomeTypeID", data.HomeTypeID));
                cmd.Parameters.Add(new SqlParameter("@HomeTypeName", data.HomeTypeName));
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
        #region[HomeTypeInfo_Delete]
        public bool HomeTypeInfo_Delete(string Id)
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
