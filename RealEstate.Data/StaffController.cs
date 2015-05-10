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
    public class StaffController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[StaffInfo_GetById]
        public List<StaffInfo> StaffInfo_GetById(string Id)
        {
            List<StaffInfo> list = new List<StaffInfo>();
            DataAccess.StaffInfo obj = new DataAccess.StaffInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.StaffInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[StaffInfo_GetByAddress]
        public List<StaffInfo> StaffInfo_GetByAddress(string Address)
        {
            List<DataAccess.StaffInfo> list = new List<DataAccess.StaffInfo>();
            DataAccess.StaffInfo obj = new DataAccess.StaffInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_StaffInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.StaffInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[StaffInfo_GetByTop]
        public List<StaffInfo> StaffInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.StaffInfo> list = new List<DataAccess.StaffInfo>();
            DataAccess.StaffInfo obj = new DataAccess.StaffInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.StaffInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[StaffInfo_GetByAll]
        public List<StaffInfo> StaffInfo_GetByAll()
        {
            List<DataAccess.StaffInfo> list = new List<DataAccess.StaffInfo>();
            DataAccess.StaffInfo obj = new DataAccess.StaffInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.StaffInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[StaffInfo_Paging]
        public List<StaffInfo> StaffInfo_Paging(string CurentStaffInfo, string StaffInfoSize)
        {
            List<DataAccess.StaffInfo> list = new List<DataAccess.StaffInfo>();
            DataAccess.StaffInfo obj = new DataAccess.StaffInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentStaffInfo, StaffInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.StaffInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[StaffInfo_GetByLevel]
        public List<StaffInfo> StaffInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.StaffInfo> list = new List<DataAccess.StaffInfo>();
            DataAccess.StaffInfo obj = new DataAccess.StaffInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_StaffInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.StaffInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[StaffInfo_Insert]
        public bool StaffInfo_Insert(StaffInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@StaffID", data.StaffID));
                cmd.Parameters.Add(new SqlParameter("@Fullname", data.Fullname));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@IdNumber", data.IdNumber));
                cmd.Parameters.Add(new SqlParameter("@PhoneNumber", data.PhoneNumber));
                cmd.Parameters.Add(new SqlParameter("@HomePhone", data.HomePhone));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
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
        #region[StaffInfo_Update]
        public bool StaffInfo_Update(StaffInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@StaffID", data.StaffID));
                cmd.Parameters.Add(new SqlParameter("@Fullname", data.Fullname));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@IdNumber", data.IdNumber));
                cmd.Parameters.Add(new SqlParameter("@PhoneNumber", data.PhoneNumber));
                cmd.Parameters.Add(new SqlParameter("@HomePhone", data.HomePhone));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
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
        #region[StaffInfo_Delete]
        public bool StaffInfo_Delete(string Id)
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
