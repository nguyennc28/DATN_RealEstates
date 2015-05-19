using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    public class HomesService
    {
        private static HomesController db = new HomesController();
        #region[Homes_GetByAll]
        public static List<Homes> Homes_GetByAll()
        {
            return db.Homes_GetByAll();
        }
        #endregion
      
    }
}
