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
		private string _CityCode;
		public string CityCode
		{ 
			get 
			{
                return _CityCode;
			}
			set 
			{
                _CityCode = value;
			}
		}

        private string _DistrictCode;
        public string DistrictCode
        {
            get
            {
                return _DistrictCode;
            }
            set
            {
                _DistrictCode = value;
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
			this.CityCode = cityid;
			this.DistrictName = districtname;
		}
		#endregion
        #region[DistrictInfo IDataReader]
        public DistrictInfo DistrictInfoIDataReader(IDataReader dr)
        {
            DistrictInfo obj = new DataAccess.DistrictInfo();
            obj.DistrictID = (dr["DistrictID"] is DBNull) ? string.Empty : dr["DistrictID"].ToString();
            obj.CityCode = (dr["CityCode"] is DBNull) ? string.Empty : dr["CityCode"].ToString();
            obj.DistrictCode = (dr["DistrictCode"] is DBNull) ? string.Empty : dr["DistrictCode"].ToString();
            obj.DistrictName = (dr["DistrictName"] is DBNull) ? string.Empty : dr["DistrictName"].ToString();
            return obj;
        }
        #endregion
    }
}
