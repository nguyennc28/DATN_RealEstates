using System;
using System.Collections.Generic;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
	public class CategorysService
	{
        private static CategorysController db = new CategorysController();
		#region[CategorysInfo_GetById]
		public static List<CategorysInfo> CategorysInfo_GetById(string Id)
		{
			return db.CategorysInfo_GetById(Id);
		}
		#endregion
		#region[CategorysInfo_GetByTop]
		public static List<CategorysInfo> CategorysInfo_GetByTop(string Top, string Where, string Order)
		{
			return db.CategorysInfo_GetByTop(Top, Where, Order);
		}
		#endregion
        #region[CategorysInfo_GetByIndex]
        public static List<CategorysInfo> Cate_Products_GetByIndex(string Index, string Lang)
        {
            List<CategorysInfo> list = new List<CategorysInfo>();
            list = CategorysInfo_GetByAll(Lang);
            return list.FindAll(delegate(CategorysInfo obj)
            {
                return obj.Active == "1" && obj.Index == Index;
            });
        }
        #endregion
        #region[CategorysInfo_GetByAll]
        public static List<CategorysInfo> CategorysInfo_GetByAll(string Lang)
		{
			return db.CategorysInfo_GetByAll(Lang);
		}
		#endregion
        //#region[CategorysInfo_GetByAll]
        //public static List<CategorysInfo> CategorysInfo_GetByCategorysInfo()
        //{
        //    return db.CategorysInfo_GetByCategorysInfo();
        //}
        //#endregion
        //#region[CategorysInfo_GetByLevel]
        //public static List<CategorysInfo> CategorysInfo_GetByLevel(string Level, string Lang)
        //{
        //    return CategorysInfo_GetByLevel(Level, Lang, 0);
        //}
        //public static List<CategorysInfo> CategorysInfo_GetByLevel(string Level, string Lang, string Active)
        //{
        //    List<CategorysInfo> list = new List<CategorysInfo>();
        //    list = CategorysInfo_GetByLevel(Level, Lang);
        //    return list.FindAll(delegate(CategorysInfo obj)
        //    {
        //        return obj.Active == Active;
        //    });
        //}
        //#endregion
		#region[CategorysInfo_Paging]
		public static List<CategorysInfo> CategorysInfo_Paging(string CurentPage, string PageSize, string Lang)
		{
			return db.CategorysInfo_Paging(CurentPage, PageSize, Lang);
		}
		#endregion
		#region[CategorysInfo_Insert]
		public static bool CategorysInfo_Insert(CategorysInfo data)
		{
			return db.CategorysInfo_Insert(data);
		}
		#endregion
		#region[CategorysInfo_Update]
		public static bool CategorysInfo_Update(CategorysInfo data)
		{
			return db.CategorysInfo_Update(data);
		}
		#endregion
		#region[CategorysInfo_Delete]
		public static bool CategorysInfo_Delete(string Id)
		{
			return db.CategorysInfo_Delete(Id);
		}
		#endregion
      
	}
}