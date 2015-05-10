using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class CustomerInfo
    {
        #region ***** Fields & Properties ***** 
		private string _CustomerID;
		public string CustomerID
		{ 
			get 
			{ 
				return _CustomerID;
			}
			set 
			{ 
				_CustomerID = value;
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
				return _Birthday;
			}
			set 
			{ 
				_Birthday = value;
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
		private string _MobileNumber;
		public string MobileNumber
		{ 
			get 
			{ 
				return _MobileNumber;
			}
			set 
			{ 
				_MobileNumber = value;
			}
		}
		private string _HomePhone;
		public string HomePhone
		{ 
			get 
			{ 
				return _HomePhone;
			}
			set 
			{ 
				_HomePhone = value;
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
		#endregion

		#region ***** Init Methods ***** 
		public CustomerInfo()
		{
		}
		public CustomerInfo(string customerid)
		{
			this.CustomerID = customerid;
		}
        public CustomerInfo(string customerid, string username, string password, string fullname, string gender, string address, string identitycard, string mobilenumber, string homephone, string email, string birthday)
		{
			this.CustomerID = customerid;
			this.UserName = username;
			this.Password = password;
			this.FullName = fullname;
			this.Gender = gender;
            this.Birthday = birthday;
			this.Address = address;
			this.IdentityCard = identitycard;
			this.MobileNumber = mobilenumber;
			this.HomePhone = homephone;
			this.Email = email;
		}
		#endregion
        #region[CustomerIDataReader]
        public CustomerInfo CustomerIDataReader(IDataReader dr)
        {
            DataAccess.CustomerInfo obj = new DataAccess.CustomerInfo();
            obj.CustomerID = (dr["CustomerID"] is DBNull) ? string.Empty : dr["CustomerID"].ToString();
            obj.UserName = (dr["UserName"] is DBNull) ? string.Empty : dr["UserName"].ToString();
            obj.Password = (dr["Password"] is DBNull) ? string.Empty : dr["Password"].ToString();
            obj.FullName = (dr["FullName"] is DBNull) ? string.Empty : dr["FullName"].ToString();
            obj.Gender = (dr["Gender"] is DBNull) ? string.Empty : dr["Gender"].ToString();
            obj.Birthday = (dr["Birthday"] is DBNull) ? string.Empty : dr["Birthday"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.IdentityCard = (dr["IdentityCard"] is DBNull) ? string.Empty : dr["IdentityCard"].ToString();
            obj.MobileNumber = (dr["MobileNumber"] is DBNull) ? string.Empty : dr["MobileNumber"].ToString();
            obj.HomePhone = (dr["HomePhone"] is DBNull) ? string.Empty : dr["HomePhone"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            return obj;
        }
        #endregion
    }
}
