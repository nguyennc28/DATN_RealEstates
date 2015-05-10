using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class RealEstateOwnersTypeInfo
    {
        #region ***** Fields & Properties ***** 
		private string _RealEstateOwnersTypeID;
		public string RealEstateOwnersTypeID
		{ 
			get 
			{ 
				return _RealEstateOwnersTypeID;
			}
			set 
			{ 
				_RealEstateOwnersTypeID = value;
			}
		}
		private string _RealEstateOwnersTypeName;
		public string RealEstateOwnersTypeName
		{ 
			get 
			{ 
				return _RealEstateOwnersTypeName;
			}
			set 
			{ 
				_RealEstateOwnersTypeName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public RealEstateOwnersTypeInfo()
		{
		}
		public RealEstateOwnersTypeInfo(string realestateownerstypeid)
		{
			RealEstateOwnersTypeID = realestateownerstypeid;
		}
        public RealEstateOwnersTypeInfo(string realestateownerstypeid, string realestateownerstypename)
		{
			RealEstateOwnersTypeID = realestateownerstypeid;
			RealEstateOwnersTypeName = realestateownerstypename;
		}
		#endregion
        #region[RealEstateOwnersTypeInfo IDataReader]
        public RealEstateOwnersTypeInfo RealEstateOwnersTypeInfoIDataReader(IDataReader dr)
        {
            RealEstateOwnersTypeInfo obj = new RealEstateOwnersTypeInfo();
            obj.RealEstateOwnersTypeID = (dr["RealEstateOwnersTypeID"] is DBNull) ? string.Empty : dr["RealEstateOwnersTypeID"].ToString();
            obj.RealEstateOwnersTypeName = (dr["RealEstateOwnersTypeName"] is DBNull) ? string.Empty : dr["RealEstateOwnersTypeName"].ToString();
            return obj;
        }
        #endregion
    }
}
