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
    public class HomeController : SqlDataProvider
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[HomeInfo_GetById]
        public List<HomeInfo> HomeInfo_GetById(string Id)
        {
            List<HomeInfo> list = new List<HomeInfo>();
            DataAccess.HomeInfo obj = new DataAccess.HomeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Home_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeInfo_GetByAddress]
        public List<HomeInfo> HomeInfo_GetByAddress(string Address)
        {
            List<DataAccess.HomeInfo> list = new List<DataAccess.HomeInfo>();
            DataAccess.HomeInfo obj = new DataAccess.HomeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_HomeInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeInfo_GetByTop]
        public List<HomeInfo> HomeInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.HomeInfo> list = new List<DataAccess.HomeInfo>();
            DataAccess.HomeInfo obj = new DataAccess.HomeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Home_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeInfo_GetByAll]
        public List<HomeInfo> HomeInfo_GetByAll()
        {
            List<DataAccess.HomeInfo> list = new List<DataAccess.HomeInfo>();
            DataAccess.HomeInfo obj = new DataAccess.HomeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Home_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion

        #region

        public List<HomeInfo> Home_GetByAll()
        {
            List<DataAccess.HomeInfo> list = new List<DataAccess.HomeInfo>();
            DataAccess.HomeInfo obj = new DataAccess.HomeInfo();
            DbCommand cmd = db.GetSqlStringCommand("SELECT * FROM HomeRE");
            //DbCommand cmd = db.GetStoredProcCommand("SELECT * FROM HomeRE");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeInfo_Paging]
        public List<HomeInfo> HomeInfo_Paging(string CurentHomeInfo, string HomeInfoSize)
        {
            List<DataAccess.HomeInfo> list = new List<DataAccess.HomeInfo>();
            DataAccess.HomeInfo obj = new DataAccess.HomeInfo();
            DbCommand cmd = db.GetStoredProcCommand("Home_SelectPage", CurentHomeInfo, HomeInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeInfo_GetByLevel]
        public List<HomeInfo> HomeInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.HomeInfo> list = new List<DataAccess.HomeInfo>();
            DataAccess.HomeInfo obj = new DataAccess.HomeInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_HomeInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomeInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeInfo_Insert]
        public bool HomeInfo_Insert(HomeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Home_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@HomeID", data.HomeID));
                cmd.Parameters.Add(new SqlParameter("@HomeTypeID", data.HomeTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));


                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@TransactionType", data.TransactionType));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                cmd.Parameters.Add(new SqlParameter("@FloorArea", data.FloorArea));
                cmd.Parameters.Add(new SqlParameter("@GargenArea", data.GargenArea));
                cmd.Parameters.Add(new SqlParameter("@HomeArea", data.HomeArea));
                cmd.Parameters.Add(new SqlParameter("@BedroomNumber", data.BedroomNumber));
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
                    throw ex;
                }
                finally
                {
                    if (cmd != null) cmd.Dispose();
                }
            }
        }
        #endregion
        #region[HomeInfo_InsertGetID]
        public int HomeInfo_InsertGetID(HomeInfo data, int ID)
        {
            using (SqlCommand cmd = new SqlCommand("Home_Insert", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                
                //cmd.Parameters.Add(new SqlParameter("@HomeID", data.HomeID));
                cmd.Parameters.Add(new SqlParameter("@HomeTypeID", data.HomeTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Title", data.Title));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@TransactionType", data.TransactionType));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                cmd.Parameters.Add(new SqlParameter("@FloorArea", data.FloorArea));
                cmd.Parameters.Add(new SqlParameter("@GargenArea", data.GargenArea));
                cmd.Parameters.Add(new SqlParameter("@HomeArea", data.HomeArea));
                cmd.Parameters.Add(new SqlParameter("@BedroomNumber", data.BedroomNumber));
                cmd.Parameters.Add(new SqlParameter("@TierNumber", data.TierNumber));
                cmd.Parameters.Add(new SqlParameter("@Image1", data.Image1));
                cmd.Parameters.Add(new SqlParameter("@Image2", data.Image2));
                cmd.Parameters.Add(new SqlParameter("@Image3", data.Image3));
                cmd.Parameters.Add(new SqlParameter("@Image4", data.Image4));
                cmd.Parameters.Add(new SqlParameter("@Image5", data.Image5));
                cmd.Parameters.Add(new SqlParameter("@Image6", data.Image6));
                try
                {

                    ID = (int)cmd.ExecuteScalar();
                    //cmd.ExecuteNonQuery();
                    //SqlDataReader reader = cmd.ExecuteReader();
                    //if (reader.HasRows)
                    //{
                    //    while (reader.Read())
                    //    {
                    //        ID = int.Parse(reader[0].ToString());
                    //    }
                    //}
                    //reader.Close();

                }
                catch (Exception ex)
                {
                    throw ex;
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
        #region[HomeInfo_Update]
        public bool HomeInfo_Update(HomeInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Home_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@HomeID", data.HomeID));
                cmd.Parameters.Add(new SqlParameter("@HomeTypeID", data.HomeTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Title));
                cmd.Parameters.Add(new SqlParameter("@Name", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@Title", data.TransactionType));
                cmd.Parameters.Add(new SqlParameter("@Tag", data.Tag));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
                cmd.Parameters.Add(new SqlParameter("@FloorArea", data.FloorArea));
                cmd.Parameters.Add(new SqlParameter("@GargenArea", data.GargenArea));
                cmd.Parameters.Add(new SqlParameter("@HomeArea", data.HomeArea));
                cmd.Parameters.Add(new SqlParameter("@BedroomNumber", data.BedroomNumber));
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
        #region[HomeInfo_Delete]
        public bool HomeInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Home_Delete", Id);
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
