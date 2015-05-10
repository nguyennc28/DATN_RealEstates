using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class RegionInfo
    {
        #region ***** Fields & Properties ***** 
		private string _RegionID;
		public string RegionID
		{ 
			get 
			{ 
				return _RegionID;
			}
			set 
			{ 
				_RegionID = value;
			}
		}
		private string _RegionName;
		public string RegionName
		{ 
			get 
			{ 
				return _RegionName;
			}
			set 
			{ 
				_RegionName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public RegionInfo()
		{
		}
		public RegionInfo(string regionid)
		{
			this.RegionID = regionid;
		}
        public RegionInfo(string regionid, string regionname)
		{
			this.RegionID = regionid;
			this.RegionName = regionname;
		}
		#endregion

        #region[RegionInfo IDataReader]
        public RegionInfo RegionInfoIDataReader(IDataReader dr)
        {
            DataAccess.RegionInfo obj = new DataAccess.RegionInfo();
            obj.RegionID = (dr["RegionID"] is DBNull) ? string.Empty : dr["RegionID"].ToString();
            obj.RegionName = (dr["RegionName"] is DBNull) ? string.Empty : dr["RegionName"].ToString();
            return obj;
        }
        #endregion
    }
}
