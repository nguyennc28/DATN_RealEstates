using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace RealEstate.DataAccess
{
	public class Page
	{
        #region[Declare variables]
        private string _PageID;
        private string _Name;
        private string _Tag;
        private string _Content;
        private string _Detail;
        private string _Level;
        private string _Title;
        private string _Description;
        private string _Keyword;
        private string _Type;
        private string _Link;
        private string _Target;
        private string _Position;
        private string _Index;
        private string _Ord;
        private string _Active;
        private string _Lang;
        #endregion
        #region[Public Properties]
        public string PageID { get { return _PageID; } set { _PageID = value; } }
        public string Name { get { return _Name; } set { _Name = value; } }
        public string Tag { get { return _Tag; } set { _Tag = value; } }
        public string Content { get { return _Content; } set { _Content = value; } }
        public string Detail { get { return _Detail; } set { _Detail = value; } }
        public string Level { get { return _Level; } set { _Level = value; } }
        public string Title { get { return _Title; } set { _Title = value; } }
        public string Description { get { return _Description; } set { _Description = value; } }
        public string Keyword { get { return _Keyword; } set { _Keyword = value; } }
        public string Type { get { return _Type; } set { _Type = value; } }
        public string Link { get { return _Link; } set { _Link = value; } }
        public string Target { get { return _Target; } set { _Target = value; } }
        public string Position { get { return _Position; } set { _Position = value; } }
        public string Index { get { return _Index; } set { _Index = value; } }
        public string Ord { get { return _Ord; } set { _Ord = value; } }
        public string Active { get { return _Active; } set { _Active = value; } }
        public string Lang { get { return _Lang; } set { _Lang = value; } }
        #endregion
        #region[Page IDataReader]
        public Page PageIDataReader(IDataReader dr)
        {
            DataAccess.Page obj = new DataAccess.Page();
            obj.PageID = (dr["PageID"] is DBNull) ? string.Empty : dr["PageID"].ToString();
            obj.Name = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Tag = (dr["Tag"] is DBNull) ? string.Empty : dr["Tag"].ToString();
            obj.Content = (dr["Content"] is DBNull) ? string.Empty : dr["Content"].ToString();
            obj.Detail = (dr["Detail"] is DBNull) ? string.Empty : dr["Detail"].ToString();
            obj.Level = (dr["Level"] is DBNull) ? string.Empty : dr["Level"].ToString();
            obj.Title = (dr["Title"] is DBNull) ? string.Empty : dr["Title"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Keyword = (dr["Keyword"] is DBNull) ? string.Empty : dr["Keyword"].ToString();
            obj.Type = (dr["Type"] is DBNull) ? string.Empty : dr["Type"].ToString();
            obj.Link = (dr["Link"] is DBNull) ? string.Empty : dr["Link"].ToString();
            obj.Target = (dr["Target"] is DBNull) ? string.Empty : dr["Target"].ToString();
            obj.Position = (dr["Position"] is DBNull) ? string.Empty : dr["Position"].ToString();
            obj.Index = (dr["Index"] is DBNull) ? string.Empty : dr["Index"].ToString();
            obj.Ord = (dr["Ord"] is DBNull) ? string.Empty : dr["Ord"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            obj.Lang = (dr["Lang"] is DBNull) ? string.Empty : dr["Lang"].ToString();
            return obj;
        }
        #endregion
	}
}