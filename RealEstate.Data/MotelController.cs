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
    public class MotelController : SqlDataProvider
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[MotelInfo_GetById]
        public List<MotelInfo> MotelInfo_GetById(string Id)
        {
            List<MotelInfo> list = new List<MotelInfo>();
            DataAccess.MotelInfo obj = new DataAccess.MotelInfo();
            DbCommand cmd = db.GetStoredProcCommand("Motel_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelInfo_GetByAddress]
        public List<MotelInfo> MotelInfo_GetByAddress(string Address)
        {
            List<DataAccess.MotelInfo> list = new List<DataAccess.MotelInfo>();
            DataAccess.MotelInfo obj = new DataAccess.MotelInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_MotelInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelInfo_GetByTop]
        public List<MotelInfo> MotelInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.MotelInfo> list = new List<DataAccess.MotelInfo>();
            DataAccess.MotelInfo obj = new DataAccess.MotelInfo();
            DbCommand cmd = db.GetStoredProcCommand("Motel_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelInfo_GetByAll]
        public List<MotelInfo> MotelInfo_GetByAll()
        {
            List<DataAccess.MotelInfo> list = new List<DataAccess.MotelInfo>();
            DataAccess.MotelInfo obj = new DataAccess.MotelInfo();
            DbCommand cmd = db.GetStoredProcCommand("Motel_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelInfo_Paging]
        public List<MotelInfo> MotelInfo_Paging(string CurentMotelInfo, string MotelInfoSize)
        {
            List<DataAccess.MotelInfo> list = new List<DataAccess.MotelInfo>();
            DataAccess.MotelInfo obj = new DataAccess.MotelInfo();
            DbCommand cmd = db.GetStoredProcCommand("Motel_SelectPage", CurentMotelInfo, MotelInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelInfo_GetByLevel]
        public List<MotelInfo> MotelInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.MotelInfo> list = new List<DataAccess.MotelInfo>();
            DataAccess.MotelInfo obj = new DataAccess.MotelInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_MotelInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.MotelInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[MotelInfo_Insert]
        public bool MotelInfo_Insert(MotelInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Motel_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@MotelID", data.MotelID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@MotelTypeID", data.MotelTypeID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));

                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                cmd.Parameters.Add(new SqlParameter("@IsClosed", data.IsClosed));
                cmd.Parameters.Add(new SqlParameter("@IsCooker", data.IsCooker));
                cmd.Parameters.Add(new SqlParameter("@Furniture", data.Furniture));
                cmd.Parameters.Add(new SqlParameter("@TierNumber", data.TierNumber));
                cmd.Parameters.Add(new SqlParameter("@Image1", data.Image1));
                cmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                cmd.Parameters.Add(new SqlParameter("@Image3", data.Image3));
                cmd.Parameters.Add(new SqlParameter("@Image4", data.Image4));
                cmd.Parameters.Add(new SqlParameter("@Image5", data.Image5));
                cmd.Parameters.Add(new SqlParameter("@Image6", data.Image6));
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

        #region[MotelInfo_InsertGetID]
        public int MotelInfo_InsertGetID(MotelInfo data, int ID)
        {
            using (SqlCommand cmd = new SqlCommand("Motel_Insert", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new SqlParameter("@MotelID", data.MotelID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@MotelTypeID", data.MotelTypeID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));

                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                cmd.Parameters.Add(new SqlParameter("@IsClosed", data.IsClosed));
                cmd.Parameters.Add(new SqlParameter("@IsCooker", data.IsCooker));
                cmd.Parameters.Add(new SqlParameter("@Furniture", data.Furniture));
                cmd.Parameters.Add(new SqlParameter("@TierNumber", data.TierNumber));
                cmd.Parameters.Add(new SqlParameter("@Image1", data.Image1));
                cmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                cmd.Parameters.Add(new SqlParameter("@Image3", data.Image3));
                cmd.Parameters.Add(new SqlParameter("@Image4", data.Image4));
                cmd.Parameters.Add(new SqlParameter("@Image5", data.Image5));
                cmd.Parameters.Add(new SqlParameter("@Image6", data.Image6));
                try
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            ID = int.Parse(reader[0].ToString());
                        }
                    }
                    reader.Close();

                }
                catch (Exception ex)
                {
                    //throw ex;
                    return -1;
                }
                finally
                {
                    if (cmd != null) cmd.Dispose();
                }
                return ID;
            }
        }
        #endregion


        #region[MotelInfo_Update]
        public bool MotelInfo_Update(MotelInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Motel_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@MotelID", data.MotelID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@MotelTypeID", data.MotelTypeID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));

                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                cmd.Parameters.Add(new SqlParameter("@IsClosed", data.IsClosed));
                cmd.Parameters.Add(new SqlParameter("@IsCooker", data.IsCooker));
                cmd.Parameters.Add(new SqlParameter("@Furniture", data.Furniture));
                cmd.Parameters.Add(new SqlParameter("@TierNumber", data.TierNumber));
                cmd.Parameters.Add(new SqlParameter("@Image1", data.Image1));
                cmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                cmd.Parameters.Add(new SqlParameter("@Image3", data.Image3));
                cmd.Parameters.Add(new SqlParameter("@Image4", data.Image4));
                cmd.Parameters.Add(new SqlParameter("@Image5", data.Image5));
                cmd.Parameters.Add(new SqlParameter("@Image6", data.Image6));
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
        #region[MotelInfo_Delete]
        public bool MotelInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Motel_Delete", Id);
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
