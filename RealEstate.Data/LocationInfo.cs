using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class LocationInfo
    {
        #region ***** Fields & Properties ***** 
		private string _LocationID;
		public string LocationID
		{ 
			get 
			{ 
				return _LocationID;
			}
			set 
			{ 
				_LocationID = value;
			}
		}
		private string _xcoor;
		public string xcoor
		{ 
			get 
			{ 
				return _xcoor;
			}
			set 
			{ 
				_xcoor = value;
			}
		}
		private string _ycoor;
		public string ycoor
		{ 
			get 
			{ 
				return _ycoor;
			}
			set 
			{ 
				_ycoor = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public LocationInfo()
		{
		}
		public LocationInfo(string locationid)
		{
			this.LocationID = locationid;
		}
        public LocationInfo(string locationid, string xcoor, string ycoor)
		{
			this.LocationID = locationid;
			this.xcoor = xcoor;
			this.ycoor = ycoor;
		}
		#endregion

        #region[LocationInfo IDataReader]
        public LocationInfo LocationInfoIDataReader(IDataReader dr)
        {
            LocationInfo obj = new DataAccess.LocationInfo();
            obj.LocationID = (dr["LocationID"] is DBNull) ? string.Empty : dr["LocationID"].ToString();
            obj.xcoor = (dr["xcoor"] is DBNull) ? string.Empty : dr["xcoor"].ToString();
            obj.ycoor = (dr["ycoor"] is DBNull) ? string.Empty : dr["ycoor"].ToString();
            return obj;
        }
        #endregion
    }
}
