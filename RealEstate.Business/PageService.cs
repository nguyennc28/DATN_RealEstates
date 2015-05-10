using System;
using System.Collections.Generic;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
	public class PageService
	{
		private static PageDAL db = new PageDAL();
		#region[Page_GetById]
		public static List<Page> Page_GetById(string Id)
		{
			return db.Page_GetById(Id);
		}
		#endregion
		#region[Page_GetByTop]
		public static List<Page> Page_GetByTop(string Top, string Where, string Order)
		{
			return db.Page_GetByTop(Top, Where, Order);
		}
		#endregion
		#region[Page_GetByAll]
		public static List<Page> Page_GetByAll(string Lang)
		{
			return db.Page_GetByAll(Lang);
		}
        public static List<Page> Page_GetByAll(string Lang, string Active)
        {
            List<Page> list = new List<Page>();
            list = Page_GetByAll(Lang);
            return list.FindAll(delegate(Page obj)
            {
                return obj.Active == Active;
            });
        }
		#endregion
        #region[Page_GetByTag]
        public static List<Page> Page_GetByTag(string Tag, string Lang) 
        {
            List<Page> list = new List<Page>();
            list = Page_GetByAll(Lang);
            return list.FindAll(delegate(Page obj)
            {
                return obj.Tag == Tag;
            });
        }
        #endregion
        #region[Page_GetByIndex]
        public static List<Page> Page_GetByIndex(string Lang)
        {
            List<Page> list = new List<Page>();
            list = Page_GetByAll(Lang);
            return list.FindAll(delegate(Page obj)
            {
                return obj.Index == "1" || obj.Index.Equals("1");
            });
        }
        #endregion
        #region[Page_GetBySub]
        public static List<Page> Page_GetBySub(string Level)
        {
            return db.Page_GetBySub(Level);
        }
        #endregion
        #region[Page_GetByLink]
        public static List<Page> Page_GetByLink(string Link, string Lang) 
        {
            List<Page> list = new List<Page>();
            list = db.Page_GetByAll(Lang);
            return list.FindAll(delegate(Page obj)
            {
                return obj.Link.ToLower() == Link.ToLower();
            });
        }
        #endregion
        #region[Page_GetByURL]
        public static List<Page> Page_GetByURL(string URL, string Lang)
        {
            return Page_GetByURL(URL, Lang, "");
        }
        public static List<Page> Page_GetByURL(string URL, string Lang, string GroupNewsId) 
        {
            string strUrl = URL == "" ? "/" : URL.Replace("default.aspx", "");
            List<Page> list = new List<Page>();
            if (GroupNewsId != null && GroupNewsId != ""){
                list = db.Page_GetByAll(Lang);
                return list.FindAll(delegate(Page obj)
                {
                    return obj.Link.ToLower().Contains("/news/" + GroupNewsId);
                });
            }else{
                list = Page_GetByLink(strUrl, Lang);
                return list;
            }
        }
        #endregion
        #region[Page_GetByPosition]
        public static List<Page> Page_GetByPosition(string position, string Lang)
        {
            return Page_GetByPosition(position, Lang, 0);
        }
        public static List<Page> Page_GetByPosition(string position, string Lang, int LevelLength)
        {
            List<Page> list = new List<Page>();
            list = db.Page_GetByAll(Lang);
            return list.FindAll(delegate(Page obj)
            {
                if( LevelLength > 0){
                    return obj.Active.Equals("1") && obj.Position == position && obj.Level.Length == LevelLength;
                }else{
                    return obj.Active.Equals("1") && obj.Position == position;
                }
            });
        }
        #endregion
        #region[Page_ExistByLevel]
        public static bool Page_ExistByLevel(string Level, string Lang)
        {
            List<Page> list = Page_GetByLevel(Level, Lang);
            bool strReturn = list.Count > 0 ? true : false;
            return strReturn;
        }
        public static bool Page_ExistByLevel(string Level, string Lang, string Active)
        {
            List<Page> list = Page_GetByLevel(Level, Lang, 1, Active);
            bool strReturn = list.Count > 0 ? true : false;
            return strReturn;
        }
        #endregion
        #region[Page_GetByLevel]
        public static List<Page> Page_GetByLevel(string Level, string Lang) 
        {
            return Page_GetByLevel(Level, Lang, 0);
        }
        public static List<Page> Page_GetByLevel(string Level, string Lang, string Active)
        {
            List<Page> list = new List<Page>();
            list = Page_GetByLevel(Level, Lang);
            return list.FindAll(delegate(Page obj)
            {
                return obj.Active == Active;
            });
        }
        public static List<Page> Page_GetByLevel(string Level, string Lang, int LevelLength) 
        {
            return db.Page_GetByLevel(Level, Lang, LevelLength);
        }
        public static List<Page> Page_GetByLevel(string Level, string Lang, int LevelLength, string Active)
        {
            List<Page> list = new List<Page>();
            list = Page_GetByLevel(Level, Lang, LevelLength);
            return list.FindAll(delegate(Page obj)
            {
                return obj.Active == Active;
            });
        }
        #endregion
		#region[Page_Paging]
		public static List<Page> Page_Paging(string CurentPage, string PageSize, string Lang)
		{
			return db.Page_Paging(CurentPage, PageSize, Lang);
		}
		#endregion
		#region[Page_Insert]
		public static bool Page_Insert(Page data)
		{
			return db.Page_Insert(data);
		}
		#endregion
		#region[Page_Update]
		public static bool Page_Update(Page data)
		{
			return db.Page_Update(data);
		}
		#endregion
		#region[Page_Delete]
		public static bool Page_Delete(string Id)
		{
			return db.Page_Delete(Id);
		}
		#endregion
	}
}