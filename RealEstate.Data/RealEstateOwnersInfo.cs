using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class RealEstateOwnersInfo
    {
        #region ***** Fields & Properties ***** 
		private string _RealEstateOwnersID;
		public string RealEstateOwnersID
		{ 
			get 
			{ 
				return _RealEstateOwnersID;
			}
			set 
			{ 
				_RealEstateOwnersID = value;
			}
		}
		private string _RealEstateOwnersType;
		public string RealEstateOwnersType
		{ 
			get 
			{ 
				return _RealEstateOwnersType;
			}
			set 
			{ 
				_RealEstateOwnersType = value;
			}
		}
		private string _RealEstateOwnersName;
        public string RealEstateOwnersName
		{ 
			get 
			{ 
				return _RealEstateOwnersName;
			}
			set 
			{ 
				_RealEstateOwnersName = value;
			}
		}
		private string _CLUR;
		public string CLUR
		{ 
			get 
			{ 
				return _CLUR;
			}
			set 
			{ 
				_CLUR = value;
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
		#endregion

		#region ***** Init Methods ***** 
        public RealEstateOwnersInfo()
		{
		}
		public RealEstateOwnersInfo(string realestateownersid)
		{
			this.RealEstateOwnersID = realestateownersid;
		}
		public RealEstateOwnersInfo(string realestateownersid, string realestateownerstypeid, string realestateownersname, string clur, string address, string mobilenumber, string email, string gender, string identitycard)
		{
			this.RealEstateOwnersID = realestateownersid;
			this.RealEstateOwnersType = realestateownerstypeid;
			this.RealEstateOwnersName = realestateownersname;
			this.CLUR = clur;
			this.Address = address;
			this.MobilePhone = mobilenumber;
			this.Email = email;
			this.Gender = gender;
			this.IdentityCard = identitycard;
		}
		#endregion

        #region[HomeTypeInfo IDataReader]
        public RealEstateOwnersInfo RealEstateOwnersInfoIDataReader(IDataReader dr)
        {
            RealEstateOwnersInfo obj = new RealEstateOwnersInfo();
            obj.RealEstateOwnersID = (dr["RealEstateOwnersID"] is DBNull) ? string.Empty : dr["RealEstateOwnersID"].ToString();
            obj.RealEstateOwnersType = (dr["RealEstateOwnersType"] is DBNull) ? string.Empty : dr["RealEstateOwnersType"].ToString();
            obj.RealEstateOwnersName = (dr["RealEstateOwnersName"] is DBNull) ? string.Empty : dr["RealEstateOwnersName"].ToString();
            obj.CLUR = (dr["CLUR"] is DBNull) ? string.Empty : dr["CLUR"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.MobilePhone = (dr["MobilePhone"] is DBNull) ? string.Empty : dr["MobilePhone"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Gender = (dr["Gender"] is DBNull) ? string.Empty : dr["Gender"].ToString();
            obj.IdentityCard = (dr["IdentityCard"] is DBNull) ? string.Empty : dr["IdentityCard"].ToString();
            return obj;
        }
        #endregion
    }
}
