using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class RealEstateInfo
    {
        #region ***** Fields & Properties ***** 
		private string _RealEstateID;
		public string RealEstateID
		{ 
			get 
			{ 
				return _RealEstateID;
			}
			set 
			{ 
				_RealEstateID = value;
			}
		}
		private string _RealEstateName;
		public string RealEstateName
		{ 
			get 
			{ 
				return _RealEstateName;
			}
			set 
			{ 
				_RealEstateName = value;
			}
		}
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
		private string _RealEstateOwnersID;
		public string RealEstateOwnersID
		{ 
			get 
			{ 
				return _RealEstateOwnersID;
			}
			set 
			{ 
				_RealEstateOwnersID = value;
			}
		}
        private string _CategoryID;
        public string CategoryID
        {
            get { return _CategoryID; }
            set { _CategoryID = value; }
        }
		private string _Address;
		public string Address
		{ 
			get 
			{ 
				return _Address;
			}
			set 
			{ 
				_Address = value;
			}
		}
		private string _Price;
		public string Price
		{ 
			get 
			{ 
				return _Price;
			}
			set 
			{ 
				_Price = value;
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
		private string _CreateBy;
		public string CreateBy
		{ 
			get 
			{ 
				return _CreateBy;
			}
			set 
			{ 
				_CreateBy = value;
			}
		}
		private string _CreateDate;
		public string CreateDate
		{ 
			get 
			{ 
				return _CreateDate;
			}
			set 
			{ 
				_CreateDate = value;
			}
		}
		private string _Area;
		public string Area
		{ 
			get 
			{ 
				return _Area;
			}
			set 
			{ 
				_Area = value;
			}
		}
		private string _Lengh;
		public string Lengh
		{ 
			get 
			{ 
				return _Lengh;
			}
			set 
			{ 
				_Lengh = value;
			}
		}
		private string _Width;
		public string Width
		{ 
			get 
			{ 
				return _Width;
			}
			set 
			{ 
				_Width = value;
			}
		}
		private string _Height;
		public string Height
		{ 
			get 
			{ 
				return _Height;
			}
			set 
			{ 
				_Height = value;
			}
		}
		private string _Images;
		public string Images
		{ 
			get 
			{ 
				return _Images;
			}
			set 
			{ 
				_Images = value;
			}
		}
		private string _Status;
		public string Status
		{ 
			get 
			{ 
				return _Status;
			}
			set 
			{ 
				_Status = value;
			}
		}
		private string _IsVip;
		public string IsVip
		{ 
			get 
			{ 
				return _IsVip;
			}
			set 
			{ 
				_IsVip = value;
			}
		}
		private string _Period;
		public string Period
		{ 
			get 
			{ 
				return _Period;
			}
			set 
			{ 
				_Period = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public RealEstateInfo()
		{
		}
		public RealEstateInfo(string realestateid)
		{
			this.RealEstateID = realestateid;
		}
        public RealEstateInfo(string realestateid, string realestatename, string realestatetypeid, string locationid, string cityid, string regionid, string districtid, string realestateownersid, string address, string price, string description, string createby, string createdate, string area, string lengh, string width, string height, string images, string status, string isvip, string period)
		{
			this.RealEstateID = realestateid;
			this.RealEstateName = realestatename;
			this.RealEstateTypeID = realestatetypeid;
			this.LocationID = locationid;
			this.CityID = cityid;
			this.RegionID = regionid;
			this.DistrictID = districtid;
			this.RealEstateOwnersID = realestateownersid;
			this.Address = address;
			this.Price = price;
			this.Description = description;
			this.CreateBy = createby;
			this.CreateDate = createdate;
			this.Area = area;
			this.Lengh = lengh;
			this.Width = width;
			this.Height = height;
			this.Images = images;
			this.Status = status;
			this.IsVip = isvip;
			this.Period = period;
		}
		#endregion
        #region[RealEstateInfo IDataReader]
        public RealEstateInfo RealEstateInfoIDataReader(IDataReader dr)
        {
            DataAccess.RealEstateInfo obj = new DataAccess.RealEstateInfo();
            obj.RealEstateID = (dr["RealEstateID"] is DBNull) ? string.Empty : dr["RealEstateID"].ToString();
            obj.RealEstateName = (dr["RealEstateName"] is DBNull) ? string.Empty : dr["RealEstateName"].ToString();
            obj.RealEstateTypeID = (dr["RealEstateTypeID"] is DBNull) ? string.Empty : dr["RealEstateTypeID"].ToString();
            obj.LocationID = (dr["LocationID"] is DBNull) ? string.Empty : dr["LocationID"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.CityID = (dr["CityID"] is DBNull) ? string.Empty : dr["CityID"].ToString();
            obj.CreateBy = (dr["CreateBy"] is DBNull) ? string.Empty : dr["CreateBy"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            obj.DistrictID = (dr["DistrictID"] is DBNull) ? string.Empty : dr["DistrictID"].ToString();
            obj.RealEstateOwnersID = (dr["RealEstateOwnersID"] is DBNull) ? string.Empty : dr["RealEstateOwnersID"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.Price = (dr["Price"] is DBNull) ? string.Empty : dr["Price"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Area = (dr["Area"] is DBNull) ? string.Empty : dr["Area"].ToString();
            obj.Lengh = (dr["Lengh"] is DBNull) ? string.Empty : dr["Lengh"].ToString();
            obj.Width = (dr["Width"] is DBNull) ? string.Empty : dr["Width"].ToString();
            obj.Height = (dr["Height"] is DBNull) ? string.Empty : dr["Height"].ToString();
            obj.Images = (dr["Images"] is DBNull) ? string.Empty : dr["Images"].ToString();
            obj.Status = (dr["Status"] is DBNull) ? string.Empty : dr["Status"].ToString();
            obj.IsVip = (dr["IsVip"] is DBNull) ? string.Empty : dr["IsVip"].ToString();
            obj.Period = (dr["Period"] is DBNull) ? string.Empty : dr["Period"].ToString();

            return obj;
        }
        #endregion
    }
}
