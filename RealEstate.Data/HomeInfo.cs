using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class HomeInfo
    {
        #region ***** Fields & Properties ***** 
		private string _HomeID;
		public string HomeID
		{ 
			get 
			{ 
				return _HomeID;
			}
			set 
			{ 
				_HomeID = value;
			}
		}
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
        private string _Title;

        public string Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        private string _CreateDate;

        public string CreateDate
        {
            get { return _CreateDate; }
            set { _CreateDate = value; }
        }


        private string _Name;

        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        private string _TransactionType;
        public string TransactionType
        {
            get { return _TransactionType; }
            set { _TransactionType = value; }
        }


        private string _Tag;

        public string Tag
        {
            get { return _Tag; }
            set { _Tag = value; }
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
		private string _FloorArea;
		public string FloorArea
		{ 
			get 
			{ 
				return _FloorArea;
			}
			set 
			{ 
				_FloorArea = value;
			}
		}
		private string _GargenArea;
		public string GargenArea
		{ 
			get 
			{ 
				return _GargenArea;
			}
			set 
			{ 
				_GargenArea = value;
			}
		}
		private string _HomeArea;
		public string HomeArea
		{ 
			get 
			{ 
				return _HomeArea;
			}
			set 
			{ 
				_HomeArea = value;
			}
		}
		private string _BedroomNumber;
		public string BedroomNumber
		{ 
			get 
			{ 
				return _BedroomNumber;
			}
			set 
			{ 
				_BedroomNumber = value;
			}
		}
		private string _TierNumber;
		public string TierNumber
		{ 
			get 
			{ 
				return _TierNumber;
			}
			set 
			{ 
				_TierNumber = value;
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
        private string _CategoryID;

        public string CategoryID
        {
            get { return _CategoryID; }
            set { _CategoryID = value; }
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
				return _Image4;
			}
			set 
			{ 
				_Image4 = value;
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
        public HomeInfo()
		{
		}
		public HomeInfo(string homeid)
		{
			this.HomeID = homeid;
		}
        public HomeInfo(string homeid, string hometypeid, string realestateownersid, string realestateownerstypeid, string realestateid, string name, string transactionType, string tag, string description, string address, string price, string totalarea, string floorarea, string gargenarea, string homearea, string bedroomnumber, string tiernumber, string image1, string image2, string image3, string image4, string image5, string image6)
		{
			this.HomeID = homeid;
			this.HomeTypeID = hometypeid;
			this.RealEstateOwnersID = realestateownersid;
			this.RealEstateOwnersTypeID = realestateownerstypeid;
			this.RealEstateID = realestateid;
		    this.Name = name;
            this.TransactionType = transactionType;
		    this.Tag = tag;
			this.Description = description;
			this.Address = address;
			this.Price = price;
			this.TotalArea = totalarea;
			this.FloorArea = floorarea;
			this.GargenArea = gargenarea;
			this.HomeArea = homearea;
			this.BedroomNumber = bedroomnumber;
			this.TierNumber = tiernumber;
			this.Image1 = image1;
			this.Image2 = image2;
			this.Image3 = image3;
		    this.Image4 = image4;
		    this.Image5 = image5;
		    this.Image6 = image6;
		}
		#endregion

        #region[HomeInfo IDataReader]
        public HomeInfo HomeInfoIDataReader(IDataReader dr)
        {
            HomeInfo obj = new HomeInfo();
            obj.HomeID = (dr["HomeID"] is DBNull) ? string.Empty : dr["HomeID"].ToString();
            obj.HomeTypeID = (dr["HomeTypeID"] is DBNull) ? string.Empty : dr["HomeTypeID"].ToString();
            obj.RealEstateOwnersID = (dr["RealEstateOwnersID"] is DBNull) ? string.Empty : dr["RealEstateOwnersID"].ToString();
            //obj.RealEstateOwnersTypeID = (dr["RealEstateOwnersTypeID"] is DBNull) ? string.Empty : dr["RealEstateOwnersTypeID"].ToString();
            obj.RealEstateID = (dr["RealEstateID"] is DBNull) ? string.Empty : dr["RealEstateID"].ToString();
            obj.Name = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Title = (dr["Title"] is DBNull) ? string.Empty : dr["Title"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            obj.TransactionType = (dr["TransactionType"] is DBNull) ? string.Empty : dr["TransactionType"].ToString();
            obj.Tag = (dr["Tag"] is DBNull) ? string.Empty : dr["Tag"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.Price = (dr["Price"] is DBNull) ? string.Empty : dr["Price"].ToString();
            obj.TotalArea = (dr["TotalArea"] is DBNull) ? string.Empty : dr["TotalArea"].ToString();
            obj.FloorArea = (dr["FloorArea"] is DBNull) ? string.Empty : dr["FloorArea"].ToString();
            obj.GargenArea = (dr["GargenArea"] is DBNull) ? string.Empty : dr["GargenArea"].ToString();
            obj.HomeArea = (dr["HomeArea"] is DBNull) ? string.Empty : dr["HomeArea"].ToString();
            obj.BedroomNumber = (dr["BedroomNumber"] is DBNull) ? string.Empty : dr["BedroomNumber"].ToString();
            obj.TierNumber = (dr["TierNumber"] is DBNull) ? string.Empty : dr["TierNumber"].ToString();
            obj.CreateBy = (dr["CreateBy"] is DBNull) ? string.Empty : dr["CreateBy"].ToString();
            obj.CityID = (dr["CityID"] is DBNull) ? string.Empty : dr["CityID"].ToString();
            obj.DistrictID = (dr["DistrictID"] is DBNull) ? string.Empty : dr["DistrictID"].ToString();
            obj.LocationID = (dr["LocationID"] is DBNull) ? string.Empty : dr["LocationID"].ToString();
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
