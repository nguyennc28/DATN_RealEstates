using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class RealEstateNewsInfo
    {
        #region ***** Fields & Properties ***** 
		private string _RealEstateNewsID;
		public string RealEstateNewsID
		{ 
			get 
			{ 
				return _RealEstateNewsID;
			}
			set 
			{ 
				_RealEstateNewsID = value;
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
			get 
			{
                return _Title;
			}
			set 
			{
                _Title = value;
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
		private string _Content;
		public string Content
		{ 
			get 
			{ 
				return _Content;
			}
			set 
			{ 
				_Content = value;
			}
		}
		private string _CategoryID;
		public string CategoryID
		{ 
			get 
			{ 
				return _CategoryID;
			}
			set 
			{ 
				_CategoryID = value;
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
		private string _Source;
		public string Source
		{ 
			get 
			{ 
				return _Source;
			}
			set 
			{ 
				_Source = value;
			}
		}
        private string _Lang;
        public string Lang
        {
            get
            {
                return _Lang;
            }
            set
            {
                _Lang = value;
            }
        }
		#endregion

		#region ***** Init Methods ***** 
		public RealEstateNewsInfo()
		{
		}
		public RealEstateNewsInfo(string realestatenewsid)
		{
			this.RealEstateNewsID = realestatenewsid;
		}
        public RealEstateNewsInfo(string realestatenewsid, string realestateid, string title, string description, string content, string categoryid, string images, string createdate, string createby, string source, string lang)
		{
			this.RealEstateNewsID = realestatenewsid;
			this.RealEstateID = realestateid;
			this.Title = title;
            this.Description = description;
			this.Content = content;
			this.CategoryID = categoryid;
			this.Images = images;
			this.CreateDate = createdate;
			this.CreateBy = createby;
			this.Source = source;
            this.Lang = lang;
		}
		#endregion

         #region[RealEstateNewsInfo IDataReader]
        public RealEstateNewsInfo RealEstateNewsInfoIDataReader(IDataReader dr)
        {
            DataAccess.RealEstateNewsInfo obj = new DataAccess.RealEstateNewsInfo();
            obj.RealEstateNewsID = (dr["RealEstateNewsID"] is DBNull) ? string.Empty : dr["RealEstateNewsID"].ToString();
            obj.RealEstateID = (dr["RealEstateID"] is DBNull) ? string.Empty : dr["RealEstateID"].ToString();
            obj.Title = (dr["Title"] is DBNull) ? string.Empty : dr["Title"].ToString();
            obj.Content = (dr["Content"] is DBNull) ? string.Empty : dr["Content"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.CategoryID = (dr["CategoryID"] is DBNull) ? string.Empty : dr["CategoryID"].ToString();
            obj.Images = (dr["Images"] is DBNull) ? string.Empty : dr["Images"].ToString();
            obj.CreateBy = (dr["CreateBy"] is DBNull) ? string.Empty : dr["CreateBy"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            obj.Source = (dr["Source"] is DBNull) ? string.Empty : dr["Source"].ToString();
            obj.Lang = (dr["Lang"] is DBNull) ? string.Empty : dr["Lang"].ToString();
            return obj;
        }
        #endregion
	}
}
