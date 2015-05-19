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
    public class HomesController
    {
        Database db = DatabaseFactory.CreateDatabase();
       
        #region[Homes_GetByAll]
        public List<Homes> Homes_GetByAll()
        {
            List<DataAccess.Homes> list = new List<DataAccess.Homes>();
            DataAccess.Homes obj = new DataAccess.Homes();
            DbCommand cmd = db.GetSqlStringCommand("SELECT * FROM HomeRE");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.HomesIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[HomeInfo_Update]
        public bool HomeInfo_Update(Homes data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Home_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@HomeID", data.HomeID));
                cmd.Parameters.Add(new SqlParameter("@HomeTypeID", data.HomeTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersID", data.RealEstateOwnersID));
                //cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersTypeID", data.RealEstateOwnersTypeID));
                cmd.Parameters.Add(new SqlParameter("@RealEstateID", data.RealEstateID));
                cmd.Parameters.Add(new SqlParameter("@Name", data.Name));
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

                cmd.Parameters.Add(new SqlParameter("@HomeTypeName", data.HomeTypeName));
                cmd.Parameters.Add(new SqlParameter("@RealEstateOwnersName", data.RealEstateOwnersName));
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
    }
}
