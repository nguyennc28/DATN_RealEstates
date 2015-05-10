using System;using System.Data;using System.Data.SqlClient;using System.Collections.Generic;namespace RealEstate.DataAccess{	public class Company	{		#region[Declare variables]		private string  _CompanyID;		private string  _CompanyName;		private string  _Address;
	    private string  _HotLine;		private string  _PhoneNumber;		private string  _Fax;		private string  _Email;
	    private string  _Surrogate;
	    private string _Chevron;		#endregion		#region[Public Properties]		public string CompanyID{ get { return _CompanyID; } set { _CompanyID = value; } }		public string CompanyName{ get { return _CompanyName; } set { _CompanyName = value; } }		public string Address{ get { return _Address; } set { _Address = value; } }
        public string HotLine { get { return _HotLine; } set { _HotLine = value; } }		public string PhoneNumber{ get { return _PhoneNumber; } set { _PhoneNumber = value; } }		public string Fax{ get { return _Fax; } set { _Fax = value; } }		public string Email{ get { return _Email; } set { _Email = value; } }
        public string Surrogate { get { return _Surrogate; } set { _Surrogate = value; } }
        public string Chevron { get { return _Chevron; } set { _Chevron = value; } }		#endregion		#region[Company IDataReader]		public Company CompanyIDataReader(IDataReader dr)		{			DataAccess.Company obj = new DataAccess.Company();
            obj.CompanyID = (dr["CompanyID"] is DBNull) ? string.Empty : dr["CompanyID"].ToString();
            obj.CompanyName = (dr["CompanyName"] is DBNull) ? string.Empty : dr["CompanyName"].ToString();			obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.HotLine = (dr["HotLine"] is DBNull) ? string.Empty : dr["HotLine"].ToString();			obj.PhoneNumber = (dr["PhoneNumber"] is DBNull) ? string.Empty : dr["PhoneNumber"].ToString();			obj.Fax = (dr["Fax"] is DBNull) ? string.Empty : dr["Fax"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Surrogate = (dr["Surrogate"] is DBNull) ? string.Empty : dr["Surrogate"].ToString();
            obj.Chevron = (dr["Chevron"] is DBNull) ? string.Empty : dr["Chevron"].ToString();			return obj;		}		#endregion	}}