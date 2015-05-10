using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace RealEstate.DataAccess
{
    public class BannerInfo
    {
        #region ***** Fields & Properties ***** 
		private string _BannerID;
		public string BannerID
		{ 
			get 
			{ 
				return _BannerID;
			}
			set 
			{ 
				_BannerID = value;
			}
		}
		private string _BannerType;
		public string BannerType
		{ 
			get 
			{ 
				return _BannerType;
			}
			set 
			{ 
				_BannerType = value;
			}
		}
		private string _Size;
		public string Size
		{ 
			get 
			{ 
				return _Size;
			}
			set 
			{ 
				_Size = value;
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
		#endregion

		#region ***** Init Methods ***** 
		public BannerInfo()
		{
		}
		public BannerInfo(string bannerid)
		{
			this.BannerID = bannerid;
		}
		public BannerInfo(string bannerid, string bannertype, string size, string description, string images)
		{
			this.BannerID = bannerid;
			this.BannerType = bannertype;
			this.Size = size;
			this.Description = description;
			this.Images = images;
		}
		#endregion

        #region[BannerInfo IDataReader]
        public BannerInfo BannerInfoIDataReader(IDataReader dr)
        {
            BannerInfo obj = new BannerInfo();
            obj.BannerID = (dr["BannerID"] is DBNull) ? string.Empty : dr["BannerID"].ToString();
            obj.BannerType = (dr["BannerType"] is DBNull) ? string.Empty : dr["BannerType"].ToString();
            obj.Size = (dr["Size"] is DBNull) ? string.Empty : dr["Size"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Images = (dr["Images"] is DBNull) ? string.Empty : dr["Images"].ToString(); return obj;
        }
        #endregion
    }
}
