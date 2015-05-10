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
    public class CustomerController : SqlDataProvider
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[Customer_GetById]
        public List<CustomerInfo> Customer_GetById(string Id)
        {
            List<DataAccess.CustomerInfo> list = new List<DataAccess.CustomerInfo>();
            DataAccess.CustomerInfo obj = new DataAccess.CustomerInfo();
            DbCommand cmd = db.GetStoredProcCommand("CustomerInfos_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CustomerIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Customer_GetByTop]
        public List<CustomerInfo> Customer_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.CustomerInfo> list = new List<DataAccess.CustomerInfo>();
            DataAccess.CustomerInfo obj = new DataAccess.CustomerInfo();
            DbCommand cmd = db.GetStoredProcCommand("CustomerInfos_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CustomerIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Customer_GetByAll]
        public List<CustomerInfo> Customer_GetByAll()
        {
            List<DataAccess.CustomerInfo> list = new List<DataAccess.CustomerInfo>();
            DataAccess.CustomerInfo obj = new DataAccess.CustomerInfo();
            DbCommand cmd = db.GetStoredProcCommand("CustomerInfos_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CustomerIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Customer_Paging]
        public List<CustomerInfo> Customer_Paging(string CurentCustomerInfo, string CustomerInfoSize)
        {
            List<DataAccess.CustomerInfo> list = new List<DataAccess.CustomerInfo>();
            DataAccess.CustomerInfo obj = new DataAccess.CustomerInfo();
            DbCommand cmd = db.GetStoredProcCommand("CustomerInfos_SelectPage", CurentCustomerInfo, CustomerInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CustomerIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Customer_GetByLevel]
        public List<CustomerInfo> Customer_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.CustomerInfo> list = new List<DataAccess.CustomerInfo>();
            DataAccess.CustomerInfo obj = new DataAccess.CustomerInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_CustomerInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CustomerIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Customer_Insert]
        public bool Customer_Insert(CustomerInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("CustomerInfos_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@CustomerID", data.CustomerID));
                cmd.Parameters.Add(new SqlParameter("@UserName", data.UserName));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@FullName", data.FullName));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@Birthday", data.Birthday));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
                cmd.Parameters.Add(new SqlParameter("@MobileNumber", data.MobileNumber));
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
        #region[Customer_Update]
        public bool Customer_Update(CustomerInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("CustomerInfos_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@CustomerID", data.CustomerID));
                cmd.Parameters.Add(new SqlParameter("@UserName", data.UserName));
                cmd.Parameters.Add(new SqlParameter("@Password", data.Password));
                cmd.Parameters.Add(new SqlParameter("@FullName", data.FullName));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@Birthday", data.Birthday));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
                cmd.Parameters.Add(new SqlParameter("@MobileNumber", data.MobileNumber));
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
        #region[Customer_Delete]
        public bool Customer_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("CustomerInfos_Delete", Id);
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
