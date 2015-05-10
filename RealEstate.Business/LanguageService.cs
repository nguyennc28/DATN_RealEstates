using System;using System.Collections.Generic;using System.Text;using RealEstate.DataAccess;namespace RealEstate.Business{	public class LanguageService	{		private static LanguageDAL db = new LanguageDAL();		#region[Language_GetById]		public static List<Language> Language_GetById(string Id)		{			return db.Language_GetById(Id);		}		#endregion		#region[Language_GetByAll]		public static List<Language> Language_GetByAll()		{			return db.Language_GetByAll();		}		#endregion
        #region[Language_GetByDefault]
        public static string Language_GetByDefault() 
        {
            List<Language> list = new List<Language>();
            list = db.Language_GetByAll();
            return list.FindAll(delegate(Language obj)
            {
                return obj.Default == "True" || obj.Default == "1";
            })[0].Id;
        }
        #endregion		#region[Language_Insert]		public static bool Language_Insert(Language data)		{			return db.Language_Insert(data);		}		#endregion		#region[Language_Update]		public static bool Language_Update(Language data)		{			return db.Language_Update(data);		}		#endregion		#region[Language_Delete]		public static bool Language_Delete(string Id)		{			return db.Language_Delete(Id);		}		#endregion	}}