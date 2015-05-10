using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business
{
    class ApartmentService
    {
        private static ApartmentController db = new ApartmentController();
        #region[Apartment_GetById]
        public static List<ApartmentInfo> ApartmentInfo_GetById(string Id)
        {
            return db.ApartmentInfo_GetById(Id);
        }
        #endregion
        #region[Apartment_GetByTop]
        public static List<ApartmentInfo> ApartmentInfo_GetByTop(string Top, string Where, string Order)
        {
            return db.ApartmentInfo_GetByTop(Top, Where, Order);
        }
        #endregion
        #region[Apartment_GetByAll]
        public static List<ApartmentInfo> ApartmentInfo_GetByAll(string Lang)
        {
            return db.ApartmentInfo_GetByAll(Lang);
        }
        #endregion
        //#region[Apartment_GetByPosition]
        //public static List<ApartmentInfo> ApartmentInfo_GetByPosition(string position, string Lang)
        //{
        //    List<ApartmentInfo> list = new List<ApartmentInfo>();
        //    list = db.ApartmentInfo_GetByAll(Lang);
        //    return list.FindAll(delegate(ApartmentInfo obj)
        //    {
        //        return (obj.Active.Equals("1") || obj.Active.Equals("True")) && obj.Position == position;
        //    });
        //}
        //#endregion
        //#region[Apartment_ViewByPosition]
        ///// <summary>
        ///// Return ApartmentInfo by positon
        ///// </summary>
        ///// <param name="position">Position of ApartmentInfo</param>
        ///// <returns></returns>
        //public static string ApartmentInfo_ViewByPosition(string position, string Lang)
        //{
        //    return ApartmentInfo_ViewByPosition(position, Lang, false, "", "", "", "");
        //}
        //public static string ApartmentInfo_ViewByPosition(string position, string Lang, bool slideShow, string Width, string Height)
        //{
        //    return ApartmentInfo_ViewByPosition(position, Lang, slideShow, Width, Height, "", "");
        //}
        //public static string ApartmentInfo_ViewByPosition(string position, string Lang, bool slideShow, string Width, string Height, string PlayerPath)
        //{
        //    return ApartmentInfo_ViewByPosition(position, Lang, slideShow, Width, Height, PlayerPath, "");
        //}
        //public static string ApartmentInfo_ViewByPosition(string position, string Lang, bool slideShow, string Width, string Height, string PlayerPath, string xmlPath)
        //{
        //    string strReturn = "";
        //    if (slideShow)
        //    {
        //        string strPlayer = PlayerPath.Length > 0 ? PlayerPath : "/slides.swf";
        //        string strXml = xmlPath.Length > 0 ? xmlPath : "/Modules/GetSlides.aspx";
        //        strReturn = strReturn + string.Format("<script type=\"text/javascript\">EmbedFlash(\"{0}?xml_path=/{1}\", \"{2}\", \"{3}\", \"\");</script>", strPlayer, strXml + "?position=" + position, Width, Height);
        //    }
        //    else
        //    {
        //        List<ApartmentInfo> list = ApartmentInfo_GetByPosition(position, Lang);
        //        for (int i = 0; i < list.Count; i++)
        //        {
        //            //Adv content
        //            if (list[i].Content.Length > 0)
        //            {
        //                strReturn = strReturn + list[i].Content;
        //            }
        //            else
        //            {
        //                //Adv swf
        //                if (list[i].Image.Contains(".swf"))
        //                {
        //                    strReturn = strReturn + string.Format("<script type=\"text/javascript\">EmbedFlash( \"{0}\", \"{1}\", \"{2}\", \"\");</script>", list[i].Image, list[i].Width, list[i].Height);
        //                }
        //                //Adv image
        //                else if (list[i].Image.Contains(".jpg") || list[i].Image.Contains(".jpeg") || list[i].Image.Contains(".gif") || list[i].Image.Contains(".png") || list[i].Image.Contains(".bmp"))
        //                {
        //                    strReturn = strReturn + string.Format("<a href=\"{0}\" target =\"{1}\"><img src=\"{2}\" width=\"{3}\" height=\"{4}\" alt=\"{5}\"/></a>", list[i].Link, list[i].Target, list[i].Image, list[i].Width, list[i].Height, list[i].Name);
        //                }
        //                //Video
        //                else if (list[i].Image.Contains(".flv"))
        //                {
        //                    strReturn = strReturn + string.Format("<script type=\"text/javascript\">playfile( \"{0}\", \"{1}\", \"{2}\", false, \"{3}\", \"\", \"\");</script>", list[i].Image, list[i].Width, list[i].Height, list[i].Image.Replace(".flv", ".jpg"));
        //                }
        //                else
        //                {
        //                    strReturn = strReturn + string.Format("<script type=\"text/javascript\">playfile( \"{0}\", \"{1}\", \"{2}\", false, \"\", \"\", \"\");</script>", list[i].Image, list[i].Width, list[i].Height);
        //                }
        //            }
        //        }
        //    }
        //    return strReturn;
        //}
        //#endregion
        #region[ApartmentInfo_Paging]
        public static List<ApartmentInfo> ApartmentInfo_Paging(string CurentPage, string PageSize, string Lang)
        {
            return db.ApartmentInfo_Paging(CurentPage, PageSize, Lang);
        }
        #endregion
        #region[ApartmentInfo_Insert]
        public static bool ApartmentInfo_Insert(ApartmentInfo data)
        {
            return db.ApartmentInfo_Insert(data);
        }
        #endregion
        #region[ApartmentInfo_Update]
        public static bool ApartmentInfo_Update(ApartmentInfo data)
        {
            return db.ApartmentInfo_Update(data);
        }
        #endregion
        #region[ApartmentInfo_Delete]
        public static bool ApartmentInfo_Delete(string Id)
        {
            return db.ApartmentInfo_Delete(Id);
        }
        #endregion
    }
}
