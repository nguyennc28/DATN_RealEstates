using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace RealEstate.DataAccess
{
    public class BannerController : SqlDataProvider
    {
        #region[BannerInfo_GetById]
        public List<BannerInfo> BannerInfo_GetById(string Id)
        {
            List<DataAccess.BannerInfo> list = new List<DataAccess.BannerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectByID", GetConnection()))
            {
                DataAccess.BannerInfo obj = new DataAccess.BannerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Id", Id));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BannerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BannerInfo_GetByTop]
        public List<BannerInfo> BannerInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.BannerInfo> list = new List<DataAccess.BannerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectTop", GetConnection()))
            {
                DataAccess.BannerInfo obj = new DataAccess.BannerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Top", Top));
                dbCmd.Parameters.Add(new SqlParameter("@Where", Where));
                dbCmd.Parameters.Add(new SqlParameter("@Order", Order));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BannerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BannerInfo_GetByAll]
        public List<BannerInfo> BannerInfo_GetByAll(string Lang)
        {
            List<DataAccess.BannerInfo> list = new List<DataAccess.BannerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectAll", GetConnection()))
            {
                DataAccess.BannerInfo obj = new DataAccess.BannerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BannerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BannerInfo_Paging]
        public List<BannerInfo> BannerInfo_Paging(string CurentPage, string PageSize, string Lang)
        {
            List<DataAccess.BannerInfo> list = new List<DataAccess.BannerInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectPage", GetConnection()))
            {
                DataAccess.BannerInfo obj = new DataAccess.BannerInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@CurentPage", CurentPage));
                dbCmd.Parameters.Add(new SqlParameter("@PageSize", PageSize));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.BannerInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[BannerInfo_Insert]
        public bool BannerInfo_Insert(BannerInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Banner_Insert", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@BannerID", data.BannerID));
                dbCmd.Parameters.Add(new SqlParameter("@BannerType", data.BannerType));
                dbCmd.Parameters.Add(new SqlParameter("@Size", data.Size));
                dbCmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                dbCmd.Parameters.Add(new SqlParameter("@Images", data.Images));              
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("BannerInfo");
            return true;
        }
        #endregion
        #region[BannerInfo_Update]
        public bool BannerInfo_Update(BannerInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Banner_Update", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@BannerID", data.BannerID));
                dbCmd.Parameters.Add(new SqlParameter("@BannerType", data.BannerType));
                dbCmd.Parameters.Add(new SqlParameter("@Size", data.Size));
                dbCmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                dbCmd.Parameters.Add(new SqlParameter("@Images", data.Images));    
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("BannerInfo");
            return true;
        }
        #endregion
        #region[BannerInfo_Delete]
        public bool BannerInfo_Delete(string Id)
        {
            using (SqlCommand dbCmd = new SqlCommand("Banner_Delete", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Id", Id));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("BannerInfo");
            return true;
        }
        #endregion
    }
}
