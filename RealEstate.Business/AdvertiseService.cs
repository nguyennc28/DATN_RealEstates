using System;
using System.Collections.Generic;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
	public class AdvertiseService
	{
		private static AdvertiseDAL db = new AdvertiseDAL();
		#region[Advertise_GetById]
		public static List<Advertise> Advertise_GetById(string Id)
		{
			return db.Advertise_GetById(Id);
		}
		#endregion
		#region[Advertise_GetByTop]
		public static List<Advertise> Advertise_GetByTop(string Top, string Where, string Order)
		{
			return db.Advertise_GetByTop(Top, Where, Order);
		}
		#endregion
        #region[Advertise_GetBySub]

	    public static List<Advertise> Advertises_GetBySub(string Id)
	    {
	        return db.Advertises_GetBySub(Id);
	    } 
        #endregion
        #region[Advertise_GetByAll]
        public static List<Advertise> Advertise_GetByAll(string Lang)
		{
			return db.Advertise_GetByAll(Lang);
		}
		#endregion
        #region[Advertise_GetByPosition]
        public static List<Advertise> Advertise_GetByPosition(string position, string Lang)
        {
            List<Advertise> list = new List<Advertise>();
            list = db.Advertise_GetByAll(Lang);
            return list.FindAll(delegate(Advertise obj)
            {
                return (obj.Active.Equals("1") || obj.Active.Equals("True")) && obj.Position == position;
            });
        }
        #endregion
        #region[Advertise_ViewByPosition]
        /// <summary>
        /// Return advertise by positon
        /// </summary>
        /// <param name="position">Position of advertise</param>
        /// <returns></returns>
        public static string Advertise_ViewByPosition(string position, string Lang)
        {
            return Advertise_ViewByPosition(position, Lang, false, "", "", "", "");
        }
        public static string Advertise_ViewByPosition(string position, string Lang, bool slideShow, string Width, string Height)
        {
            return Advertise_ViewByPosition(position, Lang, slideShow, Width, Height, "", "");
        }
        public static string Advertise_ViewByPosition(string position, string Lang, bool slideShow, string Width, string Height, string PlayerPath)
        {
            return Advertise_ViewByPosition(position, Lang, slideShow, Width, Height, PlayerPath, "");
        }
        public static string Advertise_ViewByPosition(string position, string Lang, bool slideShow, string Width, string Height, string PlayerPath, string xmlPath)
        {
            string strReturn = "";
            if (slideShow)
            {
                string strPlayer = PlayerPath.Length > 0 ? PlayerPath : "/slides.swf";
                string strXml = xmlPath.Length > 0 ? xmlPath : "/Modules/GetSlides.aspx";
                strReturn = strReturn + string.Format("<script type=\"text/javascript\">EmbedFlash(\"{0}?xml_path=/{1}\", \"{2}\", \"{3}\", \"\");</script>", strPlayer, strXml + "?position=" + position, Width, Height);
            }
            else
            {
                List<Advertise> list = Advertise_GetByPosition(position, Lang);
                for (int i = 0; i < list.Count; i++)
                {
                    //Adv content
                    if (list[i].Content.Length > 0)
                    {
                        strReturn = strReturn + list[i].Content;
                    }
                    else
                    {
                        //Adv swf
                        if (list[i].Image.Contains(".swf"))
                        {
                            strReturn = strReturn + string.Format("<script type=\"text/javascript\">EmbedFlash( \"{0}\", \"{1}\", \"{2}\", \"\");</script>", list[i].Image, list[i].Width, list[i].Height);
                        }
                        //Adv image
                        else if (list[i].Image.Contains(".jpg") || list[i].Image.Contains(".jpeg") || list[i].Image.Contains(".gif") || list[i].Image.Contains(".png") || list[i].Image.Contains(".bmp"))
                        {
                            strReturn = strReturn + string.Format("<a href=\"{0}\" target =\"{1}\"><img src=\"{2}\" width=\"{3}\" height=\"{4}\" alt=\"{5}\"/></a>", list[i].Link, list[i].Target, list[i].Image, list[i].Width, list[i].Height, list[i].AdvName); 
                        }
                        //Video
                        else if (list[i].Image.Contains(".flv"))
                        {
                            strReturn = strReturn + string.Format("<script type=\"text/javascript\">playfile( \"{0}\", \"{1}\", \"{2}\", false, \"{3}\", \"\", \"\");</script>", list[i].Image, list[i].Width, list[i].Height, list[i].Image.Replace(".flv", ".jpg"));
                        }
                        else
                        {
                            strReturn = strReturn + string.Format("<script type=\"text/javascript\">playfile( \"{0}\", \"{1}\", \"{2}\", false, \"\", \"\", \"\");</script>", list[i].Image, list[i].Width, list[i].Height);
                        }
                    }
                }
            }
            return strReturn;
        }
        #endregion
		#region[Advertise_Paging]
		public static List<Advertise> Advertise_Paging(string CurentPage, string PageSize, string Lang)
		{
			return db.Advertise_Paging(CurentPage, PageSize, Lang);
		}
		#endregion
		#region[Advertise_Insert]
		public static bool Advertise_Insert(Advertise data)
		{
			return db.Advertise_Insert(data);
		}
		#endregion
		#region[Advertise_Update]
		public static bool Advertise_Update(Advertise data)
		{
			return db.Advertise_Update(data);
		}
		#endregion
		#region[Advertise_Delete]
		public static bool Advertise_Delete(string Id)
		{
			return db.Advertise_Delete(Id);
		}
		#endregion
	}
}