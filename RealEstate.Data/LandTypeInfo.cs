using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class LandTypeInfo
    {
        #region ***** Fields & Properties ***** 
		private string _LandTypeID;
		public string LandTypeID
		{ 
			get 
			{ 
				return _LandTypeID;
			}
			set 
			{ 
				_LandTypeID = value;
			}
		}
		private string _LandTypeName;
		public string LandTypeName
		{ 
			get 
			{ 
				return _LandTypeName;
			}
			set 
			{ 
				_LandTypeName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public LandTypeInfo()
		{
		}
		public LandTypeInfo(string landtypeid)
		{
			this.LandTypeID = landtypeid;
		}
        public LandTypeInfo(string landtypeid, string landtypename)
		{
			this.LandTypeID = landtypeid;
			this.LandTypeName = landtypename;
		}
		#endregion
        #region[LandTypeInfo IDataReader]
        public LandTypeInfo LandTypeInfoIDataReader(IDataReader dr)
        {
            LandTypeInfo obj = new DataAccess.LandTypeInfo();
            obj.LandTypeID = (dr["LandTypeID"] is DBNull) ? string.Empty : dr["LandTypeID"].ToString();
            obj.LandTypeName = (dr["LandTypeName"] is DBNull) ? string.Empty : dr["LandTypeName"].ToString();
            return obj;
        }
        #endregion
    }
}
