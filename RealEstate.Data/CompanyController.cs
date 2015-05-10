using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RealEstate.DataAccess
{
	public class CompanyDAL : SqlDataProvider
	{
        Database db = DatabaseFactory.CreateDatabase();
        #region[Company_GetById]
        public List<Company> Company_GetById(string Id)
        {
            List<DataAccess.Company> list = new List<DataAccess.Company>();
            DataAccess.Company obj = new DataAccess.Company();
            DbCommand cmd = db.GetStoredProcCommand("Companys_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CompanyIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Company_GetByTop]
        public List<Company> Company_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.Company> list = new List<DataAccess.Company>();
            DataAccess.Company obj = new DataAccess.Company();
            DbCommand cmd = db.GetStoredProcCommand("Companys_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CompanyIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Company_GetByAll]
        public List<Company> Company_GetByAll()
        {
            List<DataAccess.Company> list = new List<DataAccess.Company>();
            DataAccess.Company obj = new DataAccess.Company();
            DbCommand cmd = db.GetStoredProcCommand("Companys_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CompanyIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Company_Paging]
        public List<Company> Company_Paging(string CurentCompany, string CompanySize)
        {
            List<DataAccess.Company> list = new List<DataAccess.Company>();
            DataAccess.Company obj = new DataAccess.Company();
            DbCommand cmd = db.GetStoredProcCommand("Companys_SelectPage", CurentCompany, CompanySize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CompanyIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Company_GetByLevel]
        public List<Company> Company_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.Company> list = new List<DataAccess.Company>();
            DataAccess.Company obj = new DataAccess.Company();
            DbCommand cmd = db.GetStoredProcCommand("sp_Company_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.CompanyIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[Company_Insert]
        public bool Company_Insert(Company data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Companys_Insert"))
            {
                cmd.Parameters.Add(new SqlParameter("@CompanyName", data.CompanyName));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@HotLine", data.HotLine));
                cmd.Parameters.Add(new SqlParameter("@PhoneNumber", data.PhoneNumber));
                cmd.Parameters.Add(new SqlParameter("@Fax", data.Fax));
                cmd.Parameters.Add(new SqlParameter("@ProvinceId", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Surrogate", data.Surrogate));
                cmd.Parameters.Add(new SqlParameter("@Chevron", data.Chevron));
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
        #region[Company_Update]
        public bool Company_Update(Company data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Companys_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@CompanyID", data.CompanyID));
                cmd.Parameters.Add(new SqlParameter("@CompanyName", data.CompanyName));
                cmd.Parameters.Add(new SqlParameter("@Address", data.Address));
                cmd.Parameters.Add(new SqlParameter("@HotLine", data.HotLine));
                cmd.Parameters.Add(new SqlParameter("@PhoneNumber", data.PhoneNumber));
                cmd.Parameters.Add(new SqlParameter("@Fax", data.Fax));
                cmd.Parameters.Add(new SqlParameter("@ProvinceId", data.Email));
                cmd.Parameters.Add(new SqlParameter("@Surrogate", data.Surrogate));
                cmd.Parameters.Add(new SqlParameter("@Chevron", data.Chevron));
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
        #region[Company_Delete]
        public bool Company_Delete(string Id)
        {
            DbCommand cmd = db.GetStoredProcCommand("Companys_Delete", Id);
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