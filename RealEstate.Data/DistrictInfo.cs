using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class DistrictInfo
    {
        #region ***** Fields & Properties ***** 
		private string _DistrictID;
		public string DistrictID
		{ 
			get 
			{ 
				return _DistrictID;
			}
			set 
			{ 
				_DistrictID = value;
			}
		}
		private string _CityID;
		public string CityID
		{ 
			get 
			{ 
				return _CityID;
			}
			set 
			{ 
				_CityID = value;
			}
		}
		private string _DistrictName;
		public string DistrictName
		{ 
			get 
			{ 
				return _DistrictName;
			}
			set 
			{ 
				_DistrictName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public DistrictInfo()
		{
		}
		public DistrictInfo(string districtid)
		{
			this.DistrictID = districtid;
		}
        public DistrictInfo(string districtid, string cityid, string districtname)
		{
			this.DistrictID = districtid;
			this.CityID = cityid;
			this.DistrictName = districtname;
		}
		#endregion
        #region[DistrictInfo IDataReader]
        public DistrictInfo DistrictInfoIDataReader(IDataReader dr)
        {
            DistrictInfo obj = new DataAccess.DistrictInfo();
            obj.DistrictID = (dr["DistrictID"] is DBNull) ? string.Empty : dr["DistrictID"].ToString();
            obj.CityID = (dr["CityID"] is DBNull) ? string.Empty : dr["CityID"].ToString();
            obj.DistrictName = (dr["DistrictName"] is DBNull) ? string.Empty : dr["DistrictName"].ToString();
            return obj;
        }
        #endregion
    }
}
