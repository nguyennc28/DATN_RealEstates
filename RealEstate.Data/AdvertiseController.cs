using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace RealEstate.DataAccess
{
	public class AdvertiseDAL : SqlDataProvider
	{
		#region[Advertise_GetById]
		public List<Advertise> Advertise_GetById(string Id)
		{
			List<DataAccess.Advertise> list = new List<DataAccess.Advertise>();
            using (SqlCommand dbCmd = new SqlCommand("Advertise_SelectByID", GetConnection()))
			{
				DataAccess.Advertise obj = new DataAccess.Advertise();
				dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@AdvID", Id));
				SqlDataReader dr = dbCmd.ExecuteReader();
				if (dr.HasRows)
				{
					while (dr.Read())
					{
						list.Add(obj.AdvertiseIDataReader(dr));
					}
				}
                dr.Close();
                obj = null;
			}
			return list;
		}
		#endregion
		#region[Advertise_GetByTop]
		public List<Advertise> Advertise_GetByTop(string Top, string Where, string Order)
		{
			List<DataAccess.Advertise> list = new List<DataAccess.Advertise>();
            using (SqlCommand dbCmd = new SqlCommand("Advertise_SelectTop", GetConnection()))
			{
				DataAccess.Advertise obj = new DataAccess.Advertise();
				dbCmd.CommandType = CommandType.StoredProcedure;
				dbCmd.Parameters.Add(new SqlParameter("@Top", Top));
				dbCmd.Parameters.Add(new SqlParameter("@Where", Where));
				dbCmd.Parameters.Add(new SqlParameter("@Order", Order));
				SqlDataReader dr = dbCmd.ExecuteReader();
				if (dr.HasRows)
				{
					while (dr.Read())
					{
						list.Add(obj.AdvertiseIDataReader(dr));
					}
				}
                dr.Close();
                obj = null;
			}
			return list;
		}
		#endregion
        #region[Advertise_GetBySub]
	    public List<Advertise> Advertises_GetBySub(string Id)
	    {
            List<Advertise> list = new List<Advertise>();
            using (SqlCommand dbCmd = new SqlCommand("Advertise_SelectBySub", GetConnection()))
	        {
	            Advertise obj = new Advertise();
	            dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.AddWithValue("@AdvID", Id);
                SqlDataReader dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.AdvertiseIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
	        }
	        return list;
	    } 
        #endregion
        #region[Advertise_GetByAll]
        public List<Advertise> Advertise_GetByAll(string Lang)
		{
			List<DataAccess.Advertise> list = new List<DataAccess.Advertise>();
            using (SqlCommand dbCmd = new SqlCommand("Advertise_SelectAll", GetConnection()))
			{
				DataAccess.Advertise obj = new DataAccess.Advertise();
				dbCmd.CommandType = CommandType.StoredProcedure;
				dbCmd.Parameters.Add(new SqlParameter("@Lang", Lang));
				SqlDataReader dr = dbCmd.ExecuteReader();
				if (dr.HasRows)
				{
					while (dr.Read())
					{
						list.Add(obj.AdvertiseIDataReader(dr));
					}
				}
                dr.Close();
                obj = null;
			}
			return list;
		}
		#endregion
		#region[Advertise_Paging]
		public List<Advertise> Advertise_Paging(string CurentPage, string PageSize, string Lang)
		{
			List<DataAccess.Advertise> list = new List<DataAccess.Advertise>();
            using (SqlCommand dbCmd = new SqlCommand("Advertise_SelectPage", GetConnection()))
			{
				DataAccess.Advertise obj = new DataAccess.Advertise();
				dbCmd.CommandType = CommandType.StoredProcedure;
				dbCmd.Parameters.Add(new SqlParameter("@CurentPage", CurentPage));
				dbCmd.Parameters.Add(new SqlParameter("@PageSize", PageSize));
				dbCmd.Parameters.Add(new SqlParameter("@RowCount", Lang));
				SqlDataReader dr = dbCmd.ExecuteReader();
				if (dr.HasRows)
				{
					while (dr.Read())
					{
						list.Add(obj.AdvertiseIDataReader(dr));
					}
				}
                dr.Close();
                obj = null;
			}
		return list;
		}
		#endregion
		#region[Advertise_Insert]
		public bool Advertise_Insert(Advertise data)
		{
            using (SqlCommand dbCmd = new SqlCommand("Advertise_Insert", GetConnection()))
			{
				dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateId", data.RealEstateId));
				dbCmd.Parameters.Add(new SqlParameter("@AdvName", data.AdvName));
				dbCmd.Parameters.Add(new SqlParameter("@Image", data.Image));
				dbCmd.Parameters.Add(new SqlParameter("@Width", data.Width));
				dbCmd.Parameters.Add(new SqlParameter("@Height", data.Height));
				dbCmd.Parameters.Add(new SqlParameter("@Link", data.Link));
				dbCmd.Parameters.Add(new SqlParameter("@Target", data.Target));
				dbCmd.Parameters.Add(new SqlParameter("@Content", data.Content));
				dbCmd.Parameters.Add(new SqlParameter("@Position", data.Position));
				dbCmd.Parameters.Add(new SqlParameter("@PageId", data.PageId == "" || data.PageId == "0" ? DBNull.Value : (object)data.PageId));
				dbCmd.Parameters.Add(new SqlParameter("@Click", data.Click));
				dbCmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
				dbCmd.Parameters.Add(new SqlParameter("@Active", data.Active));
				dbCmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
                dbCmd.ExecuteNonQuery();
			}
			//Clear cache
			System.Web.HttpContext.Current.Cache.Remove("Advertise");
			return true;
		}
		#endregion
		#region[Advertise_Update]
		public bool Advertise_Update(Advertise data)
		{
            using (SqlCommand dbCmd = new SqlCommand("Advertise_Update", GetConnection()))
			{
				dbCmd.CommandType = CommandType.StoredProcedure;
				dbCmd.Parameters.Add(new SqlParameter("@Id", data.AdvID));
                dbCmd.Parameters.Add(new SqlParameter("@RealEstateId", data.RealEstateId));
				dbCmd.Parameters.Add(new SqlParameter("@AdvName", data.AdvName));
				dbCmd.Parameters.Add(new SqlParameter("@Image", data.Image));
				dbCmd.Parameters.Add(new SqlParameter("@Width", data.Width));
				dbCmd.Parameters.Add(new SqlParameter("@Height", data.Height));
				dbCmd.Parameters.Add(new SqlParameter("@Link", data.Link));
				dbCmd.Parameters.Add(new SqlParameter("@Target", data.Target));
				dbCmd.Parameters.Add(new SqlParameter("@Content", data.Content));
				dbCmd.Parameters.Add(new SqlParameter("@Position", data.Position));
				dbCmd.Parameters.Add(new SqlParameter("@PageId", data.PageId == "" || data.PageId == "0" ? DBNull.Value : (object)data.PageId));
				dbCmd.Parameters.Add(new SqlParameter("@Click", data.Click));
				dbCmd.Parameters.Add(new SqlParameter("@Ord", data.Ord));
				dbCmd.Parameters.Add(new SqlParameter("@Active", data.Active));
				dbCmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
				dbCmd.ExecuteNonQuery();
			}
			//Clear cache
			System.Web.HttpContext.Current.Cache.Remove("Advertise");
			return true;
		}
		#endregion
		#region[Advertise_Delete]
		public bool Advertise_Delete(string Id)
		{
            using (SqlCommand dbCmd = new SqlCommand("Apartment_Delete", GetConnection()))
			{
				dbCmd.CommandType = CommandType.StoredProcedure;
				dbCmd.Parameters.Add(new SqlParameter("@Id", Id));
				dbCmd.ExecuteNonQuery();
			}
			//Clear cache
			System.Web.HttpContext.Current.Cache.Remove("Advertise");
			return true;
		}
		#endregion
		
	}
}