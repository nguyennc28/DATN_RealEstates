using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class UsersInfo
    {
        #region ***** Fields & Properties ***** 
		private string _UserID;
		public string UserID
		{ 
			get 
			{ 
				return _UserID;
			}
			set 
			{ 
				_UserID = value;
			}
		}
		private string _UserName;
		public string UserName
		{ 
			get 
			{ 
				return _UserName;
			}
			set 
			{ 
				_UserName = value;
			}
		}
		private string _Password;
		public string Password
		{ 
			get 
			{ 
				return _Password;
			}
			set 
			{ 
				_Password = value;
			}
		}
		private string _FullName;
		public string FullName
		{ 
			get 
			{ 
				return _FullName;
			}
			set 
			{ 
				_FullName = value;
			}
		}
		private string _Gender;
		public string Gender
		{ 
			get 
			{ 
				return _Gender;
			}
			set 
			{ 
				_Gender = value;
			}
		}
		private string _Avatar;
		public string Avatar
		{ 
			get 
			{ 
				return _Avatar;
			}
			set 
			{ 
				_Avatar = value;
			}
		}
		private string _CompanyName;
		public string CompanyName
		{ 
			get 
			{ 
				return _CompanyName;
			}
			set 
			{ 
				_CompanyName = value;
			}
		}
		private string _Birthday;
		public string Birthday
		{ 
			get 
			{ 
				return _Birthday;
			}
			set 
			{ 
				_Birthday = value;
			}
		}
		private string _Email;
		public string Email
		{ 
			get 
			{ 
				return _Email;
			}
			set 
			{ 
				_Email = value;
			}
		}
		private string _Address;
		public string Address
		{ 
			get 
			{ 
				return _Address;
			}
			set 
			{ 
				_Address = value;
			}
		}
		private string _MobilePhone;
		public string MobilePhone
		{ 
			get 
			{ 
				return _MobilePhone;
			}
			set 
			{ 
				_MobilePhone = value;
			}
		}
		private string _IdentityCard;
		public string IdentityCard
		{ 
			get 
			{ 
				return _IdentityCard;
			}
			set 
			{ 
				_IdentityCard = value;
			}
		}
		private string _LastLoggedOn;
		public string LastLoggedOn
		{ 
			get 
			{ 
				return _LastLoggedOn;
			}
			set 
			{ 
				_LastLoggedOn = value;
			}
		}
		private string _CreatedDate;
		public string CreatedDate
		{ 
			get 
			{ 
				return _CreatedDate;
			}
			set 
			{ 
				_CreatedDate = value;
			}
		}
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
		private string _Active;
		public string Active
		{ 
			get 
			{ 
				return _Active;
			}
			set 
			{ 
				_Active = value;
			}
		}
        private string _Level;
        public string Level
        {
            get
            {
                return _Level;
            }
            set
            {
                _Level = value;
            }
        }
		private string _Ord;
		public string Ord
		{ 
			get 
			{ 
				return _Ord;
			}
			set 
			{ 
				_Ord = value;
			}
		}
        private string _Admin;
        public string Admin
        {
            get
            {
                return _Admin;
            }
            set
            {
                _Admin = value;
            }
        } 
		#endregion

		#region ***** Init Methods ***** 
		public UsersInfo()
		{
		}
		public UsersInfo(string userid)
		{
			this.UserID = userid;
		}
        public UsersInfo(string userid, string username, string password, string fullname, string gender, string avatar, string birthday, string email, string address, string mobilephone, string identitycard, string lastloggedon, string createddate, string createdby, string groupid, string active, string level, string ord, string admin)
		{
			this.UserID = userid;
			this.UserName = username;
			this.Password = password;
			this.FullName = fullname;
			this.Gender = gender;
			this.Avatar = avatar;
			this.Birthday = birthday;
			this.Email = email;
			this.Address = address;
			this.MobilePhone = mobilephone;
			this.IdentityCard = identitycard;
			this.LastLoggedOn = lastloggedon;
			this.CreatedDate = createddate;
			this.GroupID = groupid;
			this.Active = active;
            this.Level = level;
			this.Ord = ord;
            this.Admin = admin;
		}
		#endregion
        #region[UsersInfo IDataReader]
        public UsersInfo UsersInfoIDataReader(IDataReader dr)
        {
            DataAccess.UsersInfo obj = new DataAccess.UsersInfo();
            obj.UserID = (dr["UserID"] is DBNull) ? string.Empty : dr["UserID"].ToString();
            obj.UserName = (dr["UserName"] is DBNull) ? string.Empty : dr["UserName"].ToString();
            obj.Password = (dr["Password"] is DBNull) ? string.Empty : dr["Password"].ToString();
            obj.FullName = (dr["FullName"] is DBNull) ? string.Empty : dr["FullName"].ToString();
            obj.Gender = (dr["Gender"] is DBNull) ? string.Empty : dr["Gender"].ToString();
            obj.Avatar = (dr["Avatar"] is DBNull) ? string.Empty : dr["Avatar"].ToString();
            obj.Birthday = (dr["Birthday"] is DBNull) ? string.Empty : dr["Birthday"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.MobilePhone = (dr["MobilePhone"] is DBNull) ? string.Empty : dr["MobilePhone"].ToString();
            obj.IdentityCard = (dr["IdentityCard"] is DBNull) ? string.Empty : dr["IdentityCard"].ToString();
            obj.LastLoggedOn = (dr["LastLoggedOn"] is DBNull) ? string.Empty : dr["LastLoggedOn"].ToString();
            obj.CreatedDate = (dr["CreatedDate"] is DBNull) ? string.Empty : dr["CreatedDate"].ToString();
            obj.GroupID = (dr["GroupID"] is DBNull) ? string.Empty : dr["GroupID"].ToString();
            obj.Level = (dr["Level"] is DBNull) ? string.Empty : dr["Level"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            obj.Ord = (dr["Ord"] is DBNull) ? string.Empty : dr["Ord"].ToString();
            obj.Admin = (dr["Admin"] is DBNull) ? string.Empty : dr["Admin"].ToString();
            return obj;
        }
        #endregion
    }
}
