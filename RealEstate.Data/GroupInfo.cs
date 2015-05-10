using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class GroupInfo
    {
        #region ***** Fields & Properties ***** 
		private string _GroupID;
		public string GroupID
		{ 
			get 
			{ 
				return _GroupID;
			}
			set 
			{ 
				_GroupID = value;
			}
		}
		private string _ParentID;
		public string ParentID
		{ 
			get 
			{ 
				return _ParentID;
			}
			set 
			{ 
				_ParentID = value;
			}
		}
		private string _GroupName;
		public string GroupName
		{ 
			get 
			{ 
				return _GroupName;
			}
			set 
			{ 
				_GroupName = value;
			}
		}
		private string _Description;
		public string Description
		{ 
			get 
			{ 
				return _Description;
			}
			set 
			{ 
				_Description = value;
			}
		}
		private string _Status;
		public string Status
		{ 
			get 
			{ 
				return _Status;
			}
			set 
			{ 
				_Status = value;
			}
		}
		private string _Priority;
		public string Priority
		{ 
			get 
			{ 
				return _Priority;
			}
			set 
			{ 
				_Priority = value;
			}
		}
		private string _Lang;
		public string Lang
		{ 
			get 
			{ 
				return _Lang;
			}
			set 
			{ 
				_Lang = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public GroupInfo()
		{
		}
		public GroupInfo(string groupid)
		{
			this.GroupID = groupid;
		}
        public GroupInfo(string groupid, string parentid, string groupname, string description, string status, string priority, string lang)
		{
			this.GroupID = groupid;
			this.ParentID = parentid;
			this.GroupName = groupname;
			this.Description = description;
			this.Status = status;
			this.Priority = priority;
			this.Lang = lang;
		}
		#endregion

        #region[GroupInfo IDataReader]
        public GroupInfo GroupInfoIDataReader(IDataReader dr)
        {
            GroupInfo obj = new DataAccess.GroupInfo();
            obj.GroupID = (dr["GroupID"] is DBNull) ? string.Empty : dr["GroupID"].ToString();
            obj.ParentID = (dr["ParentID"] is DBNull) ? string.Empty : dr["ParentID"].ToString();
            obj.GroupName = (dr["GroupName"] is DBNull) ? string.Empty : dr["GroupName"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Status = (dr["Status"] is DBNull) ? string.Empty : dr["Status"].ToString();
            obj.Priority = (dr["Priority"] is DBNull) ? string.Empty : dr["Priority"].ToString();
            obj.Lang = (dr["Lang"] is DBNull) ? string.Empty : dr["Lang"].ToString();
            return obj;
        }
        #endregion
    }
}
