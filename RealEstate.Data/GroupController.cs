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
    public class GroupController
    {
        Database db = DatabaseFactory.CreateDatabase();
        #region[GroupInfo_GetById]
        public List<GroupInfo> GroupInfo_GetById(string Id)
        {
            List<GroupInfo> list = new List<GroupInfo>();
            DataAccess.GroupInfo obj = new DataAccess.GroupInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectByID", Id);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.GroupInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[GroupInfo_GetByAddress]
        public List<GroupInfo> GroupInfo_GetByAddress(string Address)
        {
            List<DataAccess.GroupInfo> list = new List<DataAccess.GroupInfo>();
            DataAccess.GroupInfo obj = new DataAccess.GroupInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_GroupInfo_GetByAddress", Address);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.GroupInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[GroupInfo_GetByTop]
        public List<GroupInfo> GroupInfo_GetByTop(string Top, string Where, string Order)
        {
            List<DataAccess.GroupInfo> list = new List<DataAccess.GroupInfo>();
            DataAccess.GroupInfo obj = new DataAccess.GroupInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectTop", Top, Where, Order);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.GroupInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[GroupInfo_GetByAll]
        public List<GroupInfo> GroupInfo_GetByAll()
        {
            List<DataAccess.GroupInfo> list = new List<DataAccess.GroupInfo>();
            DataAccess.GroupInfo obj = new DataAccess.GroupInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectAll");
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.GroupInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[GroupInfo_Paging]
        public List<GroupInfo> GroupInfo_Paging(string CurentGroupInfo, string GroupInfoSize)
        {
            List<DataAccess.GroupInfo> list = new List<DataAccess.GroupInfo>();
            DataAccess.GroupInfo obj = new DataAccess.GroupInfo();
            DbCommand cmd = db.GetStoredProcCommand("Group_SelectPage", CurentGroupInfo, GroupInfoSize);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.GroupInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[GroupInfo_GetByLevel]
        public List<GroupInfo> GroupInfo_GetByLevel(string Level, int LevelLength)
        {
            List<DataAccess.GroupInfo> list = new List<DataAccess.GroupInfo>();
            DataAccess.GroupInfo obj = new DataAccess.GroupInfo();
            DbCommand cmd = db.GetStoredProcCommand("sp_GroupInfo_GetByLevel", Level, LevelLength);
            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    list.Add(obj.GroupInfoIDataReader(dr));
                }
                dr.Close();
                dr.Dispose();
            }
            return list;
        }
        #endregion
        #region[GroupInfo_Insert]
        public bool GroupInfo_Insert(GroupInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Insert"))
            {
                //cmd.Parameters.Add(new SqlParameter("@GroupID", data.GroupID));
                cmd.Parameters.Add(new SqlParameter("@ParentID", data.ParentID));
                cmd.Parameters.Add(new SqlParameter("@GroupName", data.GroupName));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Status", data.Status));
                cmd.Parameters.Add(new SqlParameter("@Priority", data.Priority));
                cmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
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
        #region[GroupInfo_Update]
        public bool GroupInfo_Update(GroupInfo data)
        {
            using (DbCommand cmd = db.GetStoredProcCommand("Group_Update"))
            {
                cmd.Parameters.Add(new SqlParameter("@GroupID", data.GroupID));
                cmd.Parameters.Add(new SqlParameter("@ParentID", data.ParentID));
                cmd.Parameters.Add(new SqlParameter("@GroupName", data.GroupName));
                cmd.Parameters.Add(new SqlParameter("@Description", data.Description));
                cmd.Parameters.Add(new SqlParameter("@Status", data.Status));
                cmd.Parameters.Add(new SqlParameter("@Priority", data.Priority));
                cmd.Parameters.Add(new SqlParameter("@Lang", data.Lang));
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
        #region[GroupInfo_Delete]
        public bool GroupInfo_Delete(string Id)
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
