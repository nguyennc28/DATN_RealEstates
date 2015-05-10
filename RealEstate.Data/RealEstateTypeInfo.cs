using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class RealEstateTypeInfo
    {
        #region ***** Fields & Properties ***** 
		private string _RealEstateTypeID;
		public string RealEstateTypeID
		{ 
			get 
			{ 
				return _RealEstateTypeID;
			}
			set 
			{ 
				_RealEstateTypeID = value;
			}
		}
		private string _NameRealEstateType;
		public string NameRealEstateType
		{ 
			get 
			{ 
				return _NameRealEstateType;
			}
			set 
			{ 
				_NameRealEstateType = value;
			}
		}
		private string _Description;
		public string Description
		{ 
			get 
			{ 
				return _Description;
			}
			set 
			{ 
				_Description = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public RealEstateTypeInfo()
		{
		}
		public RealEstateTypeInfo(string realestatetypeid)
		{
			this.RealEstateTypeID = realestatetypeid;
		}
        public RealEstateTypeInfo(string realestatetypeid, string namerealestatetype, string description)
		{
			this.RealEstateTypeID = realestatetypeid;
			this.NameRealEstateType = namerealestatetype;
			this.Description = description;
		}
		#endregion

        #region[RealEstateTypeInfo IDataReader]
        public RealEstateTypeInfo RealEstateTypeInfoIDataReader(IDataReader dr)
        {
            DataAccess.RealEstateTypeInfo obj = new DataAccess.RealEstateTypeInfo();
            obj.RealEstateTypeID = (dr["RealEstateTypeID"] is DBNull) ? string.Empty : dr["RealEstateTypeID"].ToString();
            obj.NameRealEstateType = (dr["NameRealEstateType"] is DBNull) ? string.Empty : dr["RealEstateName"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
          

            return obj;
        }
        #endregion
    }
}
