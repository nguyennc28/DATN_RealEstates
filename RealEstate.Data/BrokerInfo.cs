using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class BrokerInfo
	{
		#region ***** Fields & Properties ***** 
		private string _BrokerID;
		public string BrokerID
		{ 
			get 
			{ 
				return _BrokerID;
			}
			set 
			{ 
				_BrokerID = value;
			}
		}
		private string _Name;
		public string Name
		{ 
			get 
			{ 
				return _Name;
			}
			set 
			{ 
				_Name = value;
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
		private  string _Birthday;
		public  string Birthday
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

        private string _About;
        public string About
        {
            get
            {
                return _About;
            }
            set
            {
                _About = value;
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
		private string _MobiPhone;
		public string MobiPhone
		{ 
			get 
			{ 
				return _MobiPhone;
			}
			set 
			{ 
				_MobiPhone = value;
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
		private string _PropertyNumber;
		public string PropertyNumber
		{ 
			get 
			{ 
				return _PropertyNumber;
			}
			set 
			{ 
				_PropertyNumber = value;
			}
		}
		private string _RealEstateName;
		public string RealEstateName
		{ 
			get 
			{ 
				return _RealEstateName;
			}
			set 
			{ 
				_RealEstateName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public BrokerInfo()
		{
		}
		public BrokerInfo(string brokerid)
		{
			this.BrokerID = brokerid;
		}
		public BrokerInfo(string brokerid, string name, string gender,  string birthday, string identitycard, string address, string homephone, string mobiphone, string email, string propertynumber, string realestatename)
		{
			this.BrokerID = brokerid;
			this.Name = name;
			this.Gender = gender;
			this.Birthday = birthday;
			this.IdentityCard = identitycard;
			this.Address = address;
			this.HomePhone = homephone;
			this.MobiPhone = mobiphone;
			this.Email = email;
			this.PropertyNumber = propertynumber;
			this.RealEstateName = realestatename;
		}
		#endregion

        #region[BrokerInfo IDataReader]
        public BrokerInfo BrokerInfoIDataReader(IDataReader dr)
        {
            BrokerInfo obj = new BrokerInfo();
            obj.BrokerID = (dr["BrokerID"] is DBNull) ? string.Empty : dr["BrokerID"].ToString();
            obj.Gender = (dr["Gender"] is DBNull) ? string.Empty : dr["Gender"].ToString();
            obj.Name = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Birthday = (dr["Birthday"] is DBNull) ? string.Empty : dr["Birthday"].ToString();
            obj.IdentityCard = (dr["IdentityCard"] is DBNull) ? string.Empty : dr["IdentityCard"].ToString();
            obj.About = (dr["About"] is DBNull) ? string.Empty : dr["About"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.HomePhone = (dr["HomePhone"] is DBNull) ? string.Empty : dr["HomePhone"].ToString();
            obj.MobiPhone = (dr["MobiPhone"] is DBNull) ? string.Empty : dr["MobiPhone"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.PropertyNumber = (dr["PropertyNumber"] is DBNull) ? string.Empty : dr["PropertyNumber"].ToString();
            obj.RealEstateName = (dr["RealEstateName"] is DBNull) ? string.Empty : dr["RealEstateName"].ToString();
            return obj;
        }
        #endregion
	}

}
