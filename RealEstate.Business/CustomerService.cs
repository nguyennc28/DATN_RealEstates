using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class CustomerService
    {
        private static CustomerController db = new CustomerController();
        #region[Customer_GetById]
        public static List<CustomerInfo> Customer_GetById(string Id)
        {
            return db.Customer_GetById(Id);
        }
        #endregion
        #region[Customer_GetByTop]
        public static List<CustomerInfo> Customer_GetByTop(string Top, string Where, string Order)
        {
            return db.Customer_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[Customer_GetByAll]
        public static List<CustomerInfo> Customer_GetByAll()
        {
            return db.Customer_GetByAll();
        }
        #endregion
        #region[Customer_Paging]
        public static List<CustomerInfo> Customer_Paging(string CurentPage, string PageSize)
        {
            return db.Customer_Paging(CurentPage, PageSize);
        }
        #endregion
        #region[Customer_Insert]
        public static bool Customer_Insert(CustomerInfo data)
        {
            return db.Customer_Insert(data);
        }
        #endregion
        #region[Customer_Update]
        public static bool Customer_Update(CustomerInfo data)
        {
            return db.Customer_Update(data);
        }
        #endregion
        #region[Customer_Delete]
        public static bool Customer_Delete(string Id)
        {
            return db.Customer_Delete(Id);
        }
        #endregion
    }
}
