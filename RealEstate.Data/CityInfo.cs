using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace RealEstate.DataAccess
{
    public class CityInfo
    {
        #region ***** Fields & Properties ***** 
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
		private string _CityName;
		public string CityName
		{ 
			get 
			{ 
				return _CityName;
			}
			set 
			{ 
				_CityName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public CityInfo()
		{
		}
		public CityInfo(string cityid)
		{
			this.CityID = cityid;
		}
        public CityInfo(string cityid, string cityname)
		{
			this.CityID = cityid;
			this.CityName = cityname;
		}
		#endregion

        #region[City IDataReader]
        public CityInfo CityInfoIDataReader(IDataReader dr)
        {
            CityInfo obj = new CityInfo();
            obj.CityID = (dr["CityID"] is DBNull) ? string.Empty : dr["CityID"].ToString();
            obj.CityName = (dr["CityName"] is DBNull) ? string.Empty : dr["CityName"].ToString();
            return obj;
        }
        #endregion
    }
}
