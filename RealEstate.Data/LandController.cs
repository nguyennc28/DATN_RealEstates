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
    public class LandController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[LandInfo_GetById]
        public List<LandInfo> LandInfo_GetById(string Id)
        {
            List<LandInfo> list = new List<LandInfo>();
            DataAccess.LandInfo obj = new DataAccess.LandInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandInfo_GetByAddress]
        public List<LandInfo> LandInfo_GetByAddress(string Address)
        {
            List<DataAccess.LandInfo> list = new List<DataAccess.LandInfo>();
            DataAccess.LandInfo obj = new DataAccess.LandInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_LandInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandInfo_GetByTop]
        public List<LandInfo> LandInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.LandInfo> list = new List<DataAccess.LandInfo>();
            DataAccess.LandInfo obj = new DataAccess.LandInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandInfo_GetByAll]
        public List<LandInfo> LandInfo_GetByAll()
        {
            List<DataAccess.LandInfo> list = new List<DataAccess.LandInfo>();
            DataAccess.LandInfo obj = new DataAccess.LandInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandInfo_Paging]
        public List<LandInfo> LandInfo_Paging(string CurentLandInfo, string LandInfoSize)
        {
            List<DataAccess.LandInfo> list = new List<DataAccess.LandInfo>();
            DataAccess.LandInfo obj = new DataAccess.LandInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentLandInfo, LandInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandInfo_GetByLevel]
        public List<LandInfo> LandInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.LandInfo> list = new List<DataAccess.LandInfo>();
            DataAccess.LandInfo obj = new DataAccess.LandInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_LandInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.LandInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[LandInfo_Insert]
        public bool LandInfo_Insert(LandInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@LandID", data.LandID));
                cmd.Parameters.Add(new SqlParameter("@LandTypeID", data.LandTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersTypeID", data.RealEstateOwnersTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
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
        #region[LandInfo_Update]
        public bool LandInfo_Update(LandInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@LandID", data.LandID));
                cmd.Parameters.Add(new SqlParameter("@LandTypeID", data.LandTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersTypeID", data.RealEstateOwnersTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@Price", data.Price));
                cmd.Parameters.Add(new SqlParameter("@TotalArea", data.TotalArea));
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
        #region[LandInfo_Delete]
        public bool LandInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Group_Delete", Id);
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
