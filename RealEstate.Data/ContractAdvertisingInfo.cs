using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.DataAccess
{
    public class ContractAdvertisingInfo
    {
        #region ***** Fields & Properties ***** 
		private string _ContractAdvertisingID;
		public string ContractAdvertisingID
		{ 
			get 
			{ 
				return _ContractAdvertisingID;
			}
			set 
			{ 
				_ContractAdvertisingID = value;
			}
		}
		private string _ContractAdvertisingName;
		public string ContractAdvertisingName
		{ 
			get 
			{ 
				return _ContractAdvertisingName;
			}
			set 
			{ 
				_ContractAdvertisingName = value;
			}
		}
		private string _StaffID;
		public string StaffID
		{ 
			get 
			{ 
				return _StaffID;
			}
			set 
			{ 
				_StaffID = value;
			}
		}
		private string _CompanyID;
		public string CompanyID
		{ 
			get 
			{ 
				return _CompanyID;
			}
			set 
			{ 
				_CompanyID = value;
			}
		}
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
		private string _Fees;
		public string Fees
		{ 
			get 
			{ 
				return _Fees;
			}
			set 
			{ 
				_Fees = value;
			}
		}
		private string _EndDate;
		public string EndDate
		{ 
			get 
			{ 
				return _EndDate;
			}
			set 
			{ 
				_EndDate = value;
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
		#endregion

		#region ***** Init Methods ***** 
		public ContractAdvertisingInfo()
		{
		}
		public ContractAdvertisingInfo(string contractadvertisingid)
		{
			this.ContractAdvertisingID = contractadvertisingid;
		}
        public ContractAdvertisingInfo(string contractadvertisingid, string contractadvertisingname, string staffid, string companyid, string bannerid, string createdate, string fees, string enddate, string status)
		{
			this.ContractAdvertisingID = contractadvertisingid;
			this.ContractAdvertisingName = contractadvertisingname;
			this.StaffID = staffid;
			this.CompanyID = companyid;
			this.BannerID = bannerid;
			this.CreateDate = createdate;
			this.Fees = fees;
			this.EndDate = enddate;
			this.Status = status;
		}
		#endregion
        #region[ContractAdvertisingInfo IDataReader]
        public ContractAdvertisingInfo ContractAdvertisingInfoIDataReader(IDataReader dr)
        {
            DataAccess.ContractAdvertisingInfo obj = new DataAccess.ContractAdvertisingInfo();
            obj.ContractAdvertisingID = (dr["ContractAdvertisingID"] is DBNull) ? string.Empty : dr["ContractAdvertisingID"].ToString();
            obj.ContractAdvertisingName = (dr["ContractAdvertisingName"] is DBNull) ? string.Empty : dr["ContractAdvertisingName"].ToString();
            obj.StaffID = (dr["StaffID"] is DBNull) ? string.Empty : dr["StaffID"].ToString();
            obj.CompanyID = (dr["CompanyID"] is DBNull) ? string.Empty : dr["CompanyID"].ToString();
            obj.BannerID = (dr["BannerID"] is DBNull) ? string.Empty : dr["BannerID"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            obj.Fees = (dr["Fees"] is DBNull) ? string.Empty : dr["Fees"].ToString();
            obj.EndDate = (dr["EndDate"] is DBNull) ? string.Empty : dr["EndDate"].ToString();
            obj.Status = (dr["Status"] is DBNull) ? string.Empty : dr["Status"].ToString();
            return obj;
        }
        #endregion
    }
}
