using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class MotelTypeInfo
    {
        #region ***** Fields & Properties ***** 
		private string _MotelTypeID;
		public string MotelTypeID
		{ 
			get 
			{ 
				return _MotelTypeID;
			}
			set 
			{ 
				_MotelTypeID = value;
			}
		}
		private string _MotelTypeName;
		public string MotelTypeName
		{ 
			get 
			{ 
				return _MotelTypeName;
			}
			set 
			{ 
				_MotelTypeName = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public MotelTypeInfo()
		{
		}
		public MotelTypeInfo(string moteltypeid)
		{
			this.MotelTypeID = moteltypeid;
		}
        public MotelTypeInfo(string moteltypeid, string moteltypename)
		{
			this.MotelTypeID = moteltypeid;
			this.MotelTypeName = moteltypename;
		}
		#endregion

        #region[MotelTypeInfo IDataReader]
        public MotelTypeInfo MotelTypeInfoIDataReader(IDataReader dr)
        {
            MotelTypeInfo obj = new DataAccess.MotelTypeInfo();
            obj.MotelTypeID = (dr["MotelTypeID"] is DBNull) ? string.Empty : dr["MotelTypeID"].ToString();
            obj.MotelTypeName = (dr["MotelTypeName"] is DBNull) ? string.Empty : dr["MotelTypeName"].ToString();
            return obj;
        }
        #endregion
    }
}
