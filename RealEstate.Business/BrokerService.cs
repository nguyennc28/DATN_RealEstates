using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class BrokerService
    {
        private static BrokerController db = new BrokerController();
        #region[BrokerInfo_GetById]
        public static List<BrokerInfo> BrokerInfo_GetById(string Id)
        {
            return db.BrokerInfo_GetById(Id);
        }
        #endregion
        #region[BrokerInfo_GetByTop]
        public static List<BrokerInfo> BrokerInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.BrokerInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        //#region[BrokerInfo_GetByIndex]
        //public static List<BrokerInfo> Cate_Products_GetByIndex(string Index, string Lang)
        //{
        //    List<BrokerInfo> list = new List<BrokerInfo>();
        //    list = BrokerInfo_GetByAll(Lang);
        //    return list.FindAll(delegate(BrokerInfo obj)
        //    {
        //return obj.Active == "1" && obj.Index == Index;
        //    });
        //}
        //#endregion
        #region[BrokerInfo_GetByAll]
        public static List<BrokerInfo> BrokerInfo_GetByAll(string Lang)
        {
            return db.BrokerInfo_GetByAll(Lang);
        }
        #endregion
        
        #region[BrokerInfo_Paging]
        public static List<BrokerInfo> BrokerInfo_Paging(string CurentPage, string PageSize, string Lang)
        {
            return db.BrokerInfo_Paging(CurentPage, PageSize, Lang);
        }
        #endregion
        #region[BrokerInfo_Insert]
        public static bool BrokerInfo_Insert(BrokerInfo data)
        {
            return db.BrokerInfo_Insert(data);
        }
        #endregion
        #region[BrokerInfo_Update]
        public static bool BrokerInfo_Update(BrokerInfo data)
        {
            return db.BrokerInfo_Update(data);
        }
        #endregion
        #region[BrokerInfo_Delete]
        public static bool BrokerInfo_Delete(string Id)
        {
            return db.BrokerInfo_Delete(Id);
        }
        #endregion
    }
}
