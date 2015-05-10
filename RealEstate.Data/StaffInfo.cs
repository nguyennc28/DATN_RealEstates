using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class StaffInfo
    {
        #region ***** Fields & Properties ***** 
		private string _StaffID;
		public string StaffID
		{ 
			get 
			{ 
				return _StaffID;
			}
			set 
			{ 
				_StaffID = value;
			}
		}
		private string _Fullname;
		public string Fullname
		{ 
			get 
			{ 
				return _Fullname;
			}
			set 
			{ 
				_Fullname = value;
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
		private string _IdNumber;
		public string IdNumber
		{ 
			get 
			{ 
				return _IdNumber;
			}
			set 
			{ 
				_IdNumber = value;
			}
		}
		private string _PhoneNumber;
		public string PhoneNumber
		{ 
			get 
			{ 
				return _PhoneNumber;
			}
			set 
			{ 
				_PhoneNumber = value;
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
		public StaffInfo()
		{
		}
		public StaffInfo(string staffid)
		{
			this.StaffID = staffid;
		}
        public StaffInfo(string staffid, string fullname, string gender, string address, string idnumber, string phonenumber, string homephone, string email)
		{
			this.StaffID = staffid;
			this.Fullname = fullname;
			this.Gender = gender;
			this.Address = address;
			this.IdNumber = idnumber;
			this.PhoneNumber = phonenumber;
			this.HomePhone = homephone;
			this.Email = email;
		}
		#endregion

        #region[StaffInfo IDataReader]
        public StaffInfo StaffInfoIDataReader(IDataReader dr)
        {
            DataAccess.StaffInfo obj = new DataAccess.StaffInfo();
            obj.StaffID = (dr["StaffID"] is DBNull) ? string.Empty : dr["StaffID"].ToString();
            obj.Fullname = (dr["Fullname"] is DBNull) ? string.Empty : dr["Fullname"].ToString();
            obj.Gender = (dr["Gender"] is DBNull) ? string.Empty : dr["Gender"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.IdNumber = (dr["IdNumber"] is DBNull) ? string.Empty : dr["IdNumber"].ToString();
            obj.PhoneNumber = (dr["PhoneNumber"] is DBNull) ? string.Empty : dr["PhoneNumber"].ToString();
            obj.HomePhone = (dr["HomePhone"] is DBNull) ? string.Empty : dr["HomePhone"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            return obj;
        }
        #endregion
    }
}
