using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class HomeTypeInfo
    {
        #region ***** Fields & Properties ***** 
		private string _HomeTypeID;
		public string HomeTypeID
		{ 
			get 
			{ 
				return _HomeTypeID;
			}
			set 
			{ 
				_HomeTypeID = value;
			}
		}
		private string _HomeTypeName;
		public string HomeTypeName
		{ 
			get 
			{ 
				return _HomeTypeName;
			}
			set 
			{ 
				_HomeTypeName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public HomeTypeInfo()
		{
		}
		public HomeTypeInfo(string hometypeid)
		{
			this.HomeTypeID = hometypeid;
		}
        public HomeTypeInfo(string hometypeid, string hometypename)
		{
			this.HomeTypeID = hometypeid;
			this.HomeTypeName = hometypename;
		}
		#endregion

        #region[HomeTypeInfo IDataReader]
        public HomeTypeInfo HomeTypeInfoIDataReader(IDataReader dr)
        {
            HomeTypeInfo obj = new DataAccess.HomeTypeInfo();
            obj.HomeTypeID = (dr["HomeTypeID"] is DBNull) ? string.Empty : dr["HomeTypeID"].ToString();
            obj.HomeTypeName = (dr["HomeTypeName"] is DBNull) ? string.Empty : dr["HomeTypeName"].ToString();
            return obj;
        }
        #endregion
    }
}
