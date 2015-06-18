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
    public class RealEstateOwnersController : SqlDataProvider
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[RealEstateOwnersInfo_GetById]
        public List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetById(string Id)
        {
            List<RealEstateOwnersInfo> list = new List<RealEstateOwnersInfo>();
            DataAccess.RealEstateOwnersInfo obj = new DataAccess.RealEstateOwnersInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateOwners_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersInfo_GetByAddress]
        public List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetByAddress(string Address)
        {
            List<DataAccess.RealEstateOwnersInfo> list = new List<DataAccess.RealEstateOwnersInfo>();
            DataAccess.RealEstateOwnersInfo obj = new DataAccess.RealEstateOwnersInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateOwnersInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersInfo_GetByTop]
        public List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.RealEstateOwnersInfo> list = new List<DataAccess.RealEstateOwnersInfo>();
            DataAccess.RealEstateOwnersInfo obj = new DataAccess.RealEstateOwnersInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateOwners_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersInfo_GetByAll]
        public List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetByAll()
        {
            List<DataAccess.RealEstateOwnersInfo> list = new List<DataAccess.RealEstateOwnersInfo>();
            DataAccess.RealEstateOwnersInfo obj = new DataAccess.RealEstateOwnersInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateOwners_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersInfo_Paging]
        public List<RealEstateOwnersInfo> RealEstateOwnersInfo_Paging(string CurentRealEstateOwnersInfo, string RealEstateOwnersInfoSize)
        {
            List<DataAccess.RealEstateOwnersInfo> list = new List<DataAccess.RealEstateOwnersInfo>();
            DataAccess.RealEstateOwnersInfo obj = new DataAccess.RealEstateOwnersInfo();
            DbCommand cmd = db.GetStoredProcCommand("RealEstateOwners_SelectPage", CurentRealEstateOwnersInfo, RealEstateOwnersInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersInfo_GetByLevel]
        public List<RealEstateOwnersInfo> RealEstateOwnersInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.RealEstateOwnersInfo> list = new List<DataAccess.RealEstateOwnersInfo>();
            DataAccess.RealEstateOwnersInfo obj = new DataAccess.RealEstateOwnersInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_RealEstateOwnersInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.RealEstateOwnersInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[RealEstateOwnersInfo_Insert]
        public int RealEstateOwnersInfo_Insert(RealEstateOwnersInfo data, int ID)
        {
            using (SqlCommand cmd = new SqlCommand("RealEstateOwners_Insert", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersType", data.RealEstateOwnersType));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@CLUR", data.CLUR));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@MobilePhone", data.MobilePhone));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
                //cmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
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
        #region[RealEstateOwnersInfo_Update]
        public bool RealEstateOwnersInfo_Update(RealEstateOwnersInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("RealEstateOwners_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersType", data.RealEstateOwnersType));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
                cmd.Parameters.Add(new SqlParameter("@CLUR", data.CLUR));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@MobilePhone", data.MobilePhone));
                cmd.Parameters.Add(new SqlParameter("@Email", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Gender", data.Gender));
                cmd.Parameters.Add(new SqlParameter("@IdentityCard", data.IdentityCard));
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
        #region[RealEstateOwnersInfo_Delete]
        public bool RealEstateOwnersInfo_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("RealEstateOwners_Delete", Id);
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
