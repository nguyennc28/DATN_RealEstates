using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class BrokerController : SqlDataProvider
    {
        #region[BrokerInfo_GetById]
        public List<BrokerInfo> BrokerInfo_GetById(string Id)
        {
            List<DataAccess.BrokerInfo> list = new List<DataAccess.BrokerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Broker_SelectByID", GetConnection()))
            {
                DataAccess.BrokerInfo obj = new DataAccess.BrokerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@CategoryID", Id));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BrokerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BrokerInfo_GetByTop]
        public List<BrokerInfo> BrokerInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.BrokerInfo> list = new List<DataAccess.BrokerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectTop", GetConnection()))
            {
                DataAccess.BrokerInfo obj = new DataAccess.BrokerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Top", Top));
                dbCmd.Parameters.Add(new SqlParameter("@Where", Where));
                dbCmd.Parameters.Add(new SqlParameter("@Order", Order));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BrokerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BrokerInfo_GetByAll]
        public List<BrokerInfo> BrokerInfo_GetByAll(string Lang)
        {
            List<DataAccess.BrokerInfo> list = new List<DataAccess.BrokerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Broker_SelectAll", GetConnection()))
            {
                DataAccess.BrokerInfo obj = new DataAccess.BrokerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BrokerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BrokerInfo_Paging]
        public List<BrokerInfo> BrokerInfo_Paging(string CurentPage, string PageSize, string Lang)
        {
            List<DataAccess.BrokerInfo> list = new List<DataAccess.BrokerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Broker_SelectPage", GetConnection()))
            {
                DataAccess.BrokerInfo obj = new DataAccess.BrokerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@CurentPage", CurentPage));
                dbCmd.Parameters.Add(new SqlParameter("@PageSize", PageSize));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BrokerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BrokerInfo_Insert]
        public bool BrokerInfo_Insert(BrokerInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Broker_Insert", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                //dbCmd.Parameters.Add(new SqlParameter("@BrokerID", data.BrokerID));
                dbCmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                dbCmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                dbCmd.Parameters.Add(new SqlParameter("@Birthday", data.Birthday));
                dbCmd.Parameters.Add(new SqlParameter("@About", data.About));
                dbCmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
                dbCmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                dbCmd.Parameters.Add(new SqlParameter("@HomePhone", data.HomePhone));
                dbCmd.Parameters.Add(new SqlParameter("@MobiPhone", data.MobiPhone));
                dbCmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                dbCmd.Parameters.Add(new SqlParameter("@PropertyNumber", data.PropertyNumber));
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateName", data.RealEstateName));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("BrokerInfo");
            return true;
        }
        #endregion
        #region[BrokerInfo_Update]
        public bool BrokerInfo_Update(BrokerInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Banner_Update", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@BrokerID", data.BrokerID));
                dbCmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                dbCmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                dbCmd.Parameters.Add(new SqlParameter("@Birthday", data.Birthday));
                dbCmd.Parameters.Add(new SqlParameter("@About", data.About));
                dbCmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
                dbCmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                dbCmd.Parameters.Add(new SqlParameter("@HomePhone", data.HomePhone));
                dbCmd.Parameters.Add(new SqlParameter("@MobiPhone", data.MobiPhone));
                dbCmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                dbCmd.Parameters.Add(new SqlParameter("@PropertyNumber", data.PropertyNumber));
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateName", data.RealEstateName));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("BrokerInfo");
            return true;
        }
        #endregion
        #region[BrokerInfo_Delete]
        public bool BrokerInfo_Delete(string Id)
        {
            using (SqlCommand dbCmd = new SqlCommand("Broker_Delete", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Id", Id));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("BrokerInfo");
            return true;
        }
        #endregion
    }
}
