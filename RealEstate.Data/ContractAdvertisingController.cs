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
    public class ContractAdvertisingController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[ContractAdvertisingInfo_GetById]
        public List<ContractAdvertisingInfo> ContractAdvertisingInfo_GetById(string Id)
        {
            List<DataAccess.ContractAdvertisingInfo> list = new List<DataAccess.ContractAdvertisingInfo>();
            DataAccess.ContractAdvertisingInfo obj = new DataAccess.ContractAdvertisingInfo();
            DbCommand cmd = db.GetStoredProcCommand("ContractAdvertising_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.ContractAdvertisingInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[ContractAdvertisingInfo_GetByTop]
        public List<ContractAdvertisingInfo> ContractAdvertisingInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.ContractAdvertisingInfo> list = new List<DataAccess.ContractAdvertisingInfo>();
            DataAccess.ContractAdvertisingInfo obj = new DataAccess.ContractAdvertisingInfo();
            DbCommand cmd = db.GetStoredProcCommand("ContractAdvertising_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.ContractAdvertisingInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[ContractAdvertisingInfo_GetByAll]
        public List<ContractAdvertisingInfo> ContractAdvertisingInfo_GetByAll()
        {
            List<DataAccess.ContractAdvertisingInfo> list = new List<DataAccess.ContractAdvertisingInfo>();
            DataAccess.ContractAdvertisingInfo obj = new DataAccess.ContractAdvertisingInfo();
            DbCommand cmd = db.GetStoredProcCommand("ContractAdvertising_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.ContractAdvertisingInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[ContractAdvertisingInfo_Paging]
        public List<ContractAdvertisingInfo> ContractAdvertisingInfo_Paging(string CurentContractAdvertisingInfo, string ContractAdvertisingInfoSize)
        {
            List<DataAccess.ContractAdvertisingInfo> list = new List<DataAccess.ContractAdvertisingInfo>();
            DataAccess.ContractAdvertisingInfo obj = new DataAccess.ContractAdvertisingInfo();
            DbCommand cmd = db.GetStoredProcCommand("ContractAdvertising_SelectPage", CurentContractAdvertisingInfo, ContractAdvertisingInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.ContractAdvertisingInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[ContractAdvertisingInfo_GetByLevel]
        public List<ContractAdvertisingInfo> ContractAdvertisingInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.ContractAdvertisingInfo> list = new List<DataAccess.ContractAdvertisingInfo>();
            DataAccess.ContractAdvertisingInfo obj = new DataAccess.ContractAdvertisingInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_ContractAdvertisingInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.ContractAdvertisingInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[ContractAdvertisingInfo_Insert]
        public bool ContractAdvertisingInfo_Insert(ContractAdvertisingInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("ContractAdvertising_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@ContractAdvertisingID", data.ContractAdvertisingID));
                cmd.Parameters.Add(new SqlParameter("@ContractAdvertisingName", data.ContractAdvertisingName));
                cmd.Parameters.Add(new SqlParameter("@StaffID", data.StaffID));
                cmd.Parameters.Add(new SqlParameter("@CompanyID", data.CompanyID));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@Fees", data.Fees));
                cmd.Parameters.Add(new SqlParameter("@EndDate", data.EndDate));
                cmd.Parameters.Add(new SqlParameter("@Status", data.Status));
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
        #region[ContractAdvertisingInfo_Update]
        public bool ContractAdvertisingInfo_Update(ContractAdvertisingInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("ContractAdvertising_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@ContractAdvertisingID", data.ContractAdvertisingID));
                cmd.Parameters.Add(new SqlParameter("@ContractAdvertisingName", data.ContractAdvertisingName));
                cmd.Parameters.Add(new SqlParameter("@StaffID", data.StaffID));
                cmd.Parameters.Add(new SqlParameter("@CompanyID", data.CompanyID));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@Fees", data.Fees));
                cmd.Parameters.Add(new SqlParameter("@EndDate", data.EndDate));
                cmd.Parameters.Add(new SqlParameter("@Status", data.Status));
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
        #region[ContractAdvertisingInfo_Delete]
        public bool ContractAdvertisingInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("ContractAdvertising_Delete", Id);
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
