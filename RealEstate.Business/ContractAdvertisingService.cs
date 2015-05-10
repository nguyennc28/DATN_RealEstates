using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class ContractAdvertisingService
    {
        private static ContractAdvertisingController db = new ContractAdvertisingController();
        #region[ContractAdvertising_GetById]
        public static List<ContractAdvertisingInfo> ContractAdvertising_GetById(string Id)
        {
            return db.ContractAdvertisingInfo_GetById(Id);
        }
        #endregion
        #region[ContractAdvertising_GetByTop]
        public static List<ContractAdvertisingInfo> ContractAdvertising_GetByTop(string Top, string Where, string Order)
        {
            return db.ContractAdvertisingInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[ContractAdvertising_GetByAll]
        public static List<ContractAdvertisingInfo> ContractAdvertising_GetByAll()
        {
            return db.ContractAdvertisingInfo_GetByAll();
        }
        #endregion
        #region[ContractAdvertising_Paging]
        public static List<ContractAdvertisingInfo> ContractAdvertising_Paging(string CurentPage, string PageSize)
        {
            return db.ContractAdvertisingInfo_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[ContractAdvertising_Insert]
        public static bool ContractAdvertising_Insert(ContractAdvertisingInfo data)
        {
            return db.ContractAdvertisingInfo_Insert(data);
        }
        #endregion
        #region[ContractAdvertising_Update]
        public static bool ContractAdvertising_Update(ContractAdvertisingInfo data)
        {
            return db.ContractAdvertisingInfo_Update(data);
        }
        #endregion
        #region[ContractAdvertising_Delete]
        public static bool ContractAdvertising_Delete(string Id)
        {
            return db.ContractAdvertisingInfo_Delete(Id);
        }
        #endregion
    }
}
