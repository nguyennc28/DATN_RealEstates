using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class LandInfo
    {
        #region ***** Fields & Properties ***** 
		private string _LandID;
		public string LandID
		{ 
			get 
			{ 
				return _LandID;
			}
			set 
			{ 
				_LandID = value;
			}
		}
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
		private string _RealEstateOwnersTypeID;
		public string RealEstateOwnersTypeID
		{ 
			get 
			{ 
				return _RealEstateOwnersTypeID;
			}
			set 
			{ 
				_RealEstateOwnersTypeID = value;
			}
		}
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
		private string _TotalArea;
		public string TotalArea
		{ 
			get 
			{ 
				return _TotalArea;
			}
			set 
			{ 
				_TotalArea = value;
			}
		}
		private string _Image1;
		public string Image1
		{ 
			get 
			{ 
				return _Image1;
			}
			set 
			{ 
				_Image1 = value;
			}
		}
		private string _Image2;
		public string Image2
		{ 
			get 
			{
                return _Image2;
			}
			set 
			{
                _Image2 = value;
			}
		}
        private string _Image3;
        public string Image3
        {
            get
            {
                return _Image3;
            }
            set
            {
                _Image3 = value;
            }
        }
        private string _Image4;
        public string Image4
        {
            get
            {
                return _Image4;
            }
            set
            {
                _Image4 = value;
            }
        }
        private string _Image5;
        public string Image5
        {
            get
            {
                return _Image5;
            }
            set
            {
                _Image5 = value;
            }
        }
        private string _Image6;
        public string Image6
        {
            get
            {
                return _Image6;
            }
            set
            {
                _Image6 = value;
            }
        }
		#endregion

		#region ***** Init Methods ***** 
		public LandInfo()
		{
		}
		public LandInfo(string landid)
		{
			this.LandID = landid;
		}
        public LandInfo(string landid, string landtypeid, string realestateownersid, string realestateownerstypeid, string realestateid, string description, string address, string price, string totalarea, string image1, string image2, string image3, string image4, string image5, string image6)
		{
			this.LandID = landid;
			this.LandTypeID = landtypeid;
			this.RealEstateOwnersID = realestateownersid;
			this.RealEstateOwnersTypeID = realestateownerstypeid;
			this.RealEstateID = realestateid;
			this.Description = description;
			this.Address = address;
			this.Price = price;
			this.TotalArea = totalarea;
			this.Image1 = image1;
			this.Image2 = image2;
            this.Image3 = image3;
            this.Image4 = image4;
            this.Image5 = image5;
            this.Image6 = image6;
		}
		#endregion

        #region[LandInfo IDataReader]
        public LandInfo LandInfoIDataReader(IDataReader dr)
        {
            LandInfo obj = new DataAccess.LandInfo();
            obj.LandID = (dr["LandID"] is DBNull) ? string.Empty : dr["LandID"].ToString();
            obj.LandTypeID = (dr["LandTypeID"] is DBNull) ? string.Empty : dr["LandTypeID"].ToString();
            obj.RealEstateOwnersID = (dr["RealEstateOwnersID"] is DBNull) ? string.Empty : dr["RealEstateOwnersID"].ToString();
            obj.RealEstateOwnersTypeID = (dr["RealEstateOwnersTypeID"] is DBNull) ? string.Empty : dr["RealEstateOwnersTypeID"].ToString();
            obj.RealEstateID = (dr["RealEstateID"] is DBNull) ? string.Empty : dr["RealEstateID"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.Price = (dr["Price"] is DBNull) ? string.Empty : dr["Price"].ToString();
            obj.TotalArea = (dr["TotalArea"] is DBNull) ? string.Empty : dr["TotalArea"].ToString();
            obj.Image1 = (dr["Image1"] is DBNull) ? string.Empty : dr["Image1"].ToString();
            obj.Image2 = (dr["Image2"] is DBNull) ? string.Empty : dr["Image2"].ToString();
            obj.Image3 = (dr["Image3"] is DBNull) ? string.Empty : dr["Image3"].ToString();
            obj.Image4 = (dr["Image4"] is DBNull) ? string.Empty : dr["Image4"].ToString();
            obj.Image5 = (dr["Image5"] is DBNull) ? string.Empty : dr["Image5"].ToString();
            obj.Image6 = (dr["Image6"] is DBNull) ? string.Empty : dr["Image6"].ToString();
            return obj;
        }
        #endregion
    }
}
