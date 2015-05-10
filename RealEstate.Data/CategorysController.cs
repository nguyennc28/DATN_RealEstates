using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace RealEstate.DataAccess
{
    public class CategorysController : SqlDataProvider
    {
        #region[CategorysInfo_GetById]
        public List<CategorysInfo> CategorysInfo_GetById(string Id)
        {
            List<DataAccess.CategorysInfo> list = new List<DataAccess.CategorysInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectByID", GetConnection()))
            {
                DataAccess.CategorysInfo obj = new DataAccess.CategorysInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@CategoryID", Id));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.CategorysInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[CategorysInfo_GetByTop]
        public List<CategorysInfo> CategorysInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.CategorysInfo> list = new List<DataAccess.CategorysInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectTop", GetConnection()))
            {
                DataAccess.CategorysInfo obj = new DataAccess.CategorysInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Top", Top));
                dbCmd.Parameters.Add(new SqlParameter("@Where", Where));
                dbCmd.Parameters.Add(new SqlParameter("@Order", Order));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.CategorysInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[CategorysInfo_GetByAll]
        public List<CategorysInfo> CategorysInfo_GetByAll(string Lang)
        {
            List<DataAccess.CategorysInfo> list = new List<DataAccess.CategorysInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectAll", GetConnection()))
            {
                DataAccess.CategorysInfo obj = new DataAccess.CategorysInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.CategorysInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[CategorysInfo_Paging]
        public List<CategorysInfo> CategorysInfo_Paging(string CurentPage, string PageSize, string Lang)
        {
            List<DataAccess.CategorysInfo> list = new List<DataAccess.CategorysInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Banner_SelectPage", GetConnection()))
            {
                DataAccess.CategorysInfo obj = new DataAccess.CategorysInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@CurentPage", CurentPage));
                dbCmd.Parameters.Add(new SqlParameter("@PageSize", PageSize));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.CategorysInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[CategorysInfo_Insert]
        public bool CategorysInfo_Insert(CategorysInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Banner_Insert", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                dbCmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                dbCmd.Parameters.Add(new SqlParameter("@Content", data.Content));
                dbCmd.Parameters.Add(new SqlParameter("@Level", data.Level));
                dbCmd.Parameters.Add(new SqlParameter("@Priority", data.Priority));
                dbCmd.Parameters.Add(new SqlParameter("@Index", data.Index));
                dbCmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                dbCmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                dbCmd.Parameters.Add(new SqlParameter("@Keyword", data.Keyword));
                dbCmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                dbCmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
                dbCmd.Parameters.Add(new SqlParameter("@Image", data.Image));
                dbCmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("CategorysInfo");
            return true;
        }
        #endregion
        #region[CategorysInfo_Update]
        public bool CategorysInfo_Update(CategorysInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Banner_Update", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@CategoryID", data.CategoryID));
                dbCmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                dbCmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                dbCmd.Parameters.Add(new SqlParameter("@Content", data.Content));
                dbCmd.Parameters.Add(new SqlParameter("@Level", data.Level));
                dbCmd.Parameters.Add(new SqlParameter("@Priority", data.Priority));
                dbCmd.Parameters.Add(new SqlParameter("@Index", data.Index));
                dbCmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                dbCmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                dbCmd.Parameters.Add(new SqlParameter("@Keyword", data.Keyword));
                dbCmd.Parameters.Add(new SqlParameter("@Active", data.Active));
                dbCmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
                dbCmd.Parameters.Add(new SqlParameter("@Image", data.Image));
                dbCmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("CategorysInfo");
            return true;
        }
        #endregion
        #region[CategorysInfo_Delete]
        public bool CategorysInfo_Delete(string Id)
        {
            using (SqlCommand dbCmd = new SqlCommand("Banner_Delete", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Id", Id));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("CategorysInfo");
            return true;
        }
        #endregion
    }
}
