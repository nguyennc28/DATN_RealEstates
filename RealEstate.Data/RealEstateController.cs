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
    public class RealEstateController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[RealEstateInfo_GetById]
        public List<RealEstateInfo> RealEstateInfo_GetById(string Id)
        {
            List<RealEstateInfo> list = new List<RealEstateInfo>();
            DataAccess.RealEstateInfo obj = new DataAccess.RealEstateInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstates_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateInfo_GetByAddress]
        public List<RealEstateInfo> RealEstateInfo_GetByAddress(string Address)
        {
            List<DataAccess.RealEstateInfo> list = new List<DataAccess.RealEstateInfo>();
            DataAccess.RealEstateInfo obj = new DataAccess.RealEstateInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateInfo_GetByTop]
        public List<RealEstateInfo> RealEstateInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.RealEstateInfo> list = new List<DataAccess.RealEstateInfo>();
            DataAccess.RealEstateInfo obj = new DataAccess.RealEstateInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstates_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateInfo_GetByAll]
        public List<RealEstateInfo> RealEstateInfo_GetByAll()
        {
            List<DataAccess.RealEstateInfo> list = new List<DataAccess.RealEstateInfo>();
            DataAccess.RealEstateInfo obj = new DataAccess.RealEstateInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstates_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateInfo_Paging]
        public List<RealEstateInfo> RealEstateInfo_Paging(string CurentRealEstateInfo, string RealEstateInfoSize)
        {
            List<DataAccess.RealEstateInfo> list = new List<DataAccess.RealEstateInfo>();
            DataAccess.RealEstateInfo obj = new DataAccess.RealEstateInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstates_SelectPage", CurentRealEstateInfo, RealEstateInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateInfo_GetByLevel]
        public List<RealEstateInfo> RealEstateInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.RealEstateInfo> list = new List<DataAccess.RealEstateInfo>();
            DataAccess.RealEstateInfo obj = new DataAccess.RealEstateInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateInfo_Insert]
        public bool RealEstateInfo_Insert(RealEstateInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("RealEstates_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateName", data.RealEstateName));
                cmd.Parameters.Add(new SqlParameter("@RealEstateTypeID", data.RealEstateTypeID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@RegionID", data.RegionID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@Area", data.Area));
                cmd.Parameters.Add(new SqlParameter("@Lengh", data.Lengh));
                cmd.Parameters.Add(new SqlParameter("@Width", data.Width));
                cmd.Parameters.Add(new SqlParameter("@Height", data.Height));
                cmd.Parameters.Add(new SqlParameter("@Images", data.Images));
                cmd.Parameters.Add(new SqlParameter("@Status", data.Status));
                cmd.Parameters.Add(new SqlParameter("@IsVip", data.IsVip));
                cmd.Parameters.Add(new SqlParameter("@Period", data.Period));                
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
        #region[RealEstateInfo_Update]
        public bool RealEstateInfo_Update(RealEstateInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("RealEstates_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateName", data.RealEstateName));
                cmd.Parameters.Add(new SqlParameter("@RealEstateTypeID", data.RealEstateTypeID));
                cmd.Parameters.Add(new SqlParameter("@LocationID", data.LocationID));
                cmd.Parameters.Add(new SqlParameter("@CityID", data.CityID));
                cmd.Parameters.Add(new SqlParameter("@RegionID", data.RegionID));
                cmd.Parameters.Add(new SqlParameter("@DistrictID", data.DistrictID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@CreateBy", data.CreateBy));
                cmd.Parameters.Add(new SqlParameter("@CreateDate", data.CreateDate));
                cmd.Parameters.Add(new SqlParameter("@Area", data.Area));
                cmd.Parameters.Add(new SqlParameter("@Lengh", data.Lengh));
                cmd.Parameters.Add(new SqlParameter("@Width", data.Width));
                cmd.Parameters.Add(new SqlParameter("@Height", data.Height));
                cmd.Parameters.Add(new SqlParameter("@Images", data.Images));
                cmd.Parameters.Add(new SqlParameter("@Status", data.Status));
                cmd.Parameters.Add(new SqlParameter("@IsVip", data.IsVip));
                cmd.Parameters.Add(new SqlParameter("@Period", data.Period));
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
        #region[RealEstateInfo_Delete]
        public bool RealEstateInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("RealEstates_Delete", Id);
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
