using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace RealEstate.DataAccess
{
    public class CategorysInfo
    {
        #region ***** Fields & Properties ***** 
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
		private string _Tag;
		public string Tag
		{ 
			get 
			{ 
				return _Tag;
			}
			set 
			{ 
				_Tag = value;
			}
		}
		private string _Name;
		public string Name
		{ 
			get 
			{ 
				return _Name;
			}
			set 
			{ 
				_Name = value;
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
		private string _Level;
		public string Level
		{ 
			get 
			{ 
				return _Level;
			}
			set 
			{ 
				_Level = value;
			}
		}
		private string _Priority;
		public string Priority
		{ 
			get 
			{ 
				return _Priority;
			}
			set 
			{ 
				_Priority = value;
			}
		}
		private string _Index;
		public string Index
		{ 
			get 
			{ 
				return _Index;
			}
			set 
			{ 
				_Index = value;
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
		private string _Keyword;
		public string Keyword
		{ 
			get 
			{ 
				return _Keyword;
			}
			set 
			{ 
				_Keyword = value;
			}
		}
		private string _Active;
		public string Active
		{ 
			get 
			{ 
				return _Active;
			}
			set 
			{ 
				_Active = value;
			}
		}
		private string _Ord;
		public string Ord
		{ 
			get 
			{ 
				return _Ord;
			}
			set 
			{ 
				_Ord = value;
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
		private string _Image;
		public string Image
		{ 
			get 
			{ 
				return _Image;
			}
			set 
			{ 
				_Image = value;
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
		#endregion

		#region ***** Init Methods ***** 
		public CategorysInfo()
		{
		}
		public CategorysInfo(string categoryid)
		{
			this.CategoryID = categoryid;
		}
		public CategorysInfo(string categoryid, string tag, string name, string content, string level, string priority, string index, string title, string description, string keyword, string active, string ord, string lang, string image, string image2)
		{
			this.CategoryID = categoryid;
			this.Tag = tag;
			this.Name = name;
			this.Content = content;
			this.Level = level;
			this.Priority = priority;
			this.Index = index;
			this.Title = title;
			this.Description = description;
			this.Keyword = keyword;
			this.Active = active;
			this.Ord = ord;
			this.Lang = lang;
			this.Image = image;
			this.Image2 = image2;
		}
		#endregion

        #region[CategorysInfo IDataReader]
        public CategorysInfo CategorysInfoIDataReader(IDataReader dr)
        {
            CategorysInfo obj = new CategorysInfo();
            obj.CategoryID = (dr["CategoryID"] is DBNull) ? string.Empty : dr["CategoryID"].ToString();
            obj.Tag = (dr["Tag"] is DBNull) ? string.Empty : dr["Tag"].ToString();
            obj.Name = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Content = (dr["Content"] is DBNull) ? string.Empty : dr["Content"].ToString();
            obj.Level = (dr["Level"] is DBNull) ? string.Empty : dr["Level"].ToString();
            obj.Priority = (dr["Priority"] is DBNull) ? string.Empty : dr["Priority"].ToString();
            obj.Index = (dr["Index"] is DBNull) ? string.Empty : dr["Index"].ToString();
            obj.Title = (dr["Title"] is DBNull) ? string.Empty : dr["Title"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Keyword = (dr["Keyword"] is DBNull) ? string.Empty : dr["Keyword"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            obj.Ord = (dr["Ord"] is DBNull) ? string.Empty : dr["Ord"].ToString();
            obj.Lang = (dr["Lang"] is DBNull) ? string.Empty : dr["Lang"].ToString();
            obj.Image = (dr["Image"] is DBNull) ? string.Empty : dr["Image"].ToString();
            obj.Image2 = (dr["Image2"] is DBNull) ? string.Empty : dr["Image2"].ToString(); 
            return obj;
        }
        #endregion
    }
}
