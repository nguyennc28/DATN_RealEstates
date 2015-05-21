using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace RealEstate.DataAccess
{
    public class ApartmentController : SqlDataProvider
    {
        #region[ApartmentInfo_GetById]
        public List<ApartmentInfo> ApartmentInfo_GetById(string Id)
        {
            List<DataAccess.ApartmentInfo> list = new List<DataAccess.ApartmentInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Apartment_SelectByID", GetConnection()))
            {
                DataAccess.ApartmentInfo obj = new DataAccess.ApartmentInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Id", Id));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.ApartmentInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[ApartmentInfo_GetByTop]
        public List<ApartmentInfo> ApartmentInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.ApartmentInfo> list = new List<DataAccess.ApartmentInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Apartment_SelectTop", GetConnection()))
            {
                DataAccess.ApartmentInfo obj = new DataAccess.ApartmentInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Top", Top));
                dbCmd.Parameters.Add(new SqlParameter("@Where", Where));
                dbCmd.Parameters.Add(new SqlParameter("@Order", Order));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.ApartmentInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[ApartmentInfo_GetByAll]
        public List<ApartmentInfo> ApartmentInfo_GetByAll(string Lang)
        {
            List<DataAccess.ApartmentInfo> list = new List<DataAccess.ApartmentInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Apartment_SelectAll", GetConnection()))
            {
                DataAccess.ApartmentInfo obj = new DataAccess.ApartmentInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.ApartmentInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[ApartmentInfo_Paging]
        public List<ApartmentInfo> ApartmentInfo_Paging(string CurentPage, string PageSize, string Lang)
        {
            List<DataAccess.ApartmentInfo> list = new List<DataAccess.ApartmentInfo>();
            using (SqlCommand dbCmd = new SqlCommand("Apartment_SelectPage", GetConnection()))
            {
                DataAccess.ApartmentInfo obj = new DataAccess.ApartmentInfo();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@CurentPage", CurentPage));
                dbCmd.Parameters.Add(new SqlParameter("@PageSize", PageSize));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.ApartmentInfoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        #endregion
        #region[ApartmentInfo_Insert]
        public bool ApartmentInfo_Insert(ApartmentInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Apartment_Insert", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                //dbCmd.Parameters.Add(new SqlParameter("@ApartmentID", data.ApartmentID));
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                dbCmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                dbCmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                dbCmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                dbCmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                dbCmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                dbCmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                dbCmd.Parameters.Add(new SqlParameter("@TransactionType", data.TransactionType));                
                dbCmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                dbCmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                dbCmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                dbCmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                dbCmd.Parameters.Add(new SqlParameter("@FloorArea", data.FloorArea));
                dbCmd.Parameters.Add(new SqlParameter("@HomeArea", data.HomeArea));
                dbCmd.Parameters.Add(new SqlParameter("@BedroomNumber", data.BedroomNumber));
                dbCmd.Parameters.Add(new SqlParameter("@TierNumber", data.TierNumber));
                dbCmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                dbCmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
                dbCmd.Parameters.Add(new SqlParameter("@Image1", data.Image1));
                dbCmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                dbCmd.Parameters.Add(new SqlParameter("@Image3", data.Image3));
                dbCmd.Parameters.Add(new SqlParameter("@Image4", data.Image4));
                dbCmd.Parameters.Add(new SqlParameter("@Image5", data.Image5));
                dbCmd.Parameters.Add(new SqlParameter("@Image6", data.Image6));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("ApartmentInfo");
            return true;
        }
        #endregion
        #region[ApartmentInfo_Update]
        public bool ApartmentInfo_Update(ApartmentInfo data)
        {
            using (SqlCommand dbCmd = new SqlCommand("Apartment_Update", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@ApartmentID", data.ApartmentID));
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                dbCmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                dbCmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                dbCmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                dbCmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                dbCmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                dbCmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                dbCmd.Parameters.Add(new SqlParameter("@TransactionType", data.TransactionType));
                dbCmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                dbCmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                dbCmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                dbCmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                dbCmd.Parameters.Add(new SqlParameter("@FloorArea", data.FloorArea));
                dbCmd.Parameters.Add(new SqlParameter("@HomeArea", data.HomeArea));
                dbCmd.Parameters.Add(new SqlParameter("@BedroomNumber", data.BedroomNumber));
                dbCmd.Parameters.Add(new SqlParameter("@TierNumber", data.TierNumber));
                dbCmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                dbCmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                dbCmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
                dbCmd.Parameters.Add(new SqlParameter("@Image1", data.Image1));
                dbCmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                dbCmd.Parameters.Add(new SqlParameter("@Image3", data.Image3));
                dbCmd.Parameters.Add(new SqlParameter("@Image4", data.Image4));
                dbCmd.Parameters.Add(new SqlParameter("@Image5", data.Image5));
                dbCmd.Parameters.Add(new SqlParameter("@Image6", data.Image6));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("ApartmentInfo");
            return true;
        }
        #endregion
        #region[ApartmentInfo_Delete]
        public bool ApartmentInfo_Delete(string Id)
        {
            using (SqlCommand dbCmd = new SqlCommand("Apartment_Delete", GetConnection()))
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Id", Id));
                dbCmd.ExecuteNonQuery();
            }
            //Clear cache
            System.Web.HttpContext.Current.Cache.Remove("ApartmentInfo");
            return true;
        }
        #endregion
    }
}
