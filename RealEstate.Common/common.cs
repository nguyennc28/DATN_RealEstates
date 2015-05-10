using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Globalization;
using System.Text;

public class common
{
    public static string url = "";
    //public static string url = "/codemaumoi";
    public SqlConnection conn;
    #region[common]
    public common()
    {
        conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString);
    }
    #endregion
    #region[Update_useronline_date]
    public static void Update_useronline_date()
    {
        using (SqlConnection dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString))
        {
            using (SqlCommand dbCmd = new SqlCommand("update tbvisistor set iuseronline=iuseronline+1,ivisistor=ivisistor+1 where Id=(select top 1 Id from tbvisistor order by Id)", dbConn))
            {
                dbCmd.CommandType = CommandType.Text;
                dbConn.Open();
                dbCmd.ExecuteNonQuery();
                dbConn.Close();
            }
        }
    }
    #endregion
    #region[Reset_useronline]
    public static void Reset_useronline()
    {
        using (SqlConnection dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString))
        {
            using (SqlCommand dbCmd = new SqlCommand("update tbvisistor set iuseronline=1 where Id=(select top 1 Id from tbvisistor order by Id)", dbConn))
            {
                dbCmd.CommandType = CommandType.Text;
                dbConn.Open();
                dbCmd.ExecuteNonQuery();
                dbConn.Close();
            }
        }
    }
    #endregion
    #region[Update_useronline]
    public static void Update_useronline()
    {
        using (SqlConnection dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString))
        {
            using (SqlCommand dbCmd = new SqlCommand("update tbvisistor set iuseronline=iuseronline + 1,ivisistor=ivisistor + 1 where Id=(select top 1 Id from tbvisistor order by Id)", dbConn))
            {
                dbCmd.CommandType = CommandType.Text;
                dbConn.Open();
                dbCmd.ExecuteNonQuery();
                dbConn.Close();
            }
        }
    }
    #endregion
    #region[userofline]
    public static void userofline()
    {
        //List<tbvisistorDATA> list = new List<tbvisistorDATA>();
        //using (SqlConnection dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))
        //{
        //    using (SqlCommand dbCmd = new SqlCommand("select iuseronline from tbvisistor", dbConn))
        //    {
        //        dbCmd.CommandType = CommandType.Text;
        //        dbConn.Open();
        //        using (SqlDataReader reader = dbCmd.ExecuteReader())
        //        {
        //            while (reader.Read())
        //            {
        //                tbvisistorDATA objtbvisistorDATA = new tbvisistorDATA(
        //                    reader["Id"].ToString(),
        //                    reader["iuseronline"].ToString(),
        //                    reader["ivisistor"].ToString(),
        //                    reader["iuseronlinedate"].ToString(),
        //                    reader["dateonline"].ToString());
        //                list.Add(objtbvisistorDATA);
        //            }
        //        }
        //        dbConn.Close();
        //    }
        //}
        //if (list.Count > 0)
        //{
        //    if (list[0].iuseronline == "0")
        //    {
        //        using (SqlConnection dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))
        //        {
        //            using (SqlCommand dbCmd = new SqlCommand("update tbvisistor set iuseronline=1", dbConn))
        //            {
        //                dbCmd.CommandType = CommandType.Text;
        //                dbConn.Open();
        //                dbCmd.ExecuteNonQuery();
        //                dbConn.Close();
        //            }
        //        }
        //    }
        //}
        using (SqlConnection dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString))
        {
            using (SqlCommand dbCmd = new SqlCommand("update tbvisistor set iuseronline=iuseronline-1 where Id=(select top 1 Id from tbvisistor order by Id)", dbConn))
            {
                dbCmd.CommandType = CommandType.Text;
                dbConn.Open();
                dbCmd.ExecuteNonQuery();
                dbConn.Close();
            }
        }
    }
    #endregion
    #region[imgdownload]
    public static string imgdownload(string path)
    {
        string Chuoi = "";
        if (path.IndexOf(".doc") > 0 || path.IndexOf(".Doc") > 0)
        {
            Chuoi = "<img src='images/news/word.png' style='border:0px; width:16px; height:16px'/>";
        }
        else if (path.IndexOf(".pdf") > 0 || path.IndexOf(".Pdf") > 0)
        {
            Chuoi = "<img src='images/news/pdf.png' style='border:0px; width:16px; height:16px'/>";
        }
        else if (path.IndexOf(".zip") > 0 || path.IndexOf(".Zip") > 0)
        {
            Chuoi = "<img src='images/news/zip.png' style='border:0px; width:16px; height:16px'/>";
        }
        else if (path.IndexOf(".xls") > 0 || path.IndexOf(".Xls") > 0)
        {
            Chuoi = "<img src='images/news/excels.png' style='border:0px; width:16px; height:16px'/>";
        }
        else
        {
            Chuoi = "<img src='images/news/files.png' style='border:0px; width:16px; height:16px'/>";
        }
        return Chuoi;
    }
    #endregion
    #region[RemoveUnicode]
    public static string RemoveUnicode(string s)
    {
        string stFormD = s.Normalize(NormalizationForm.FormD);
        StringBuilder sb = new StringBuilder();

        for (int ich = 0; ich < stFormD.Length; ich++)
        {
            UnicodeCategory uc = CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
            if (uc != UnicodeCategory.NonSpacingMark)
            {
                sb.Append(stFormD[ich]);
            }
        }
        string temp = (sb.ToString().Normalize(NormalizationForm.FormC));
        temp = temp.Replace("đ", "d");
        temp = temp.Replace("---", "-");
        temp = temp.Replace("'", "");
        return temp.Replace("Đ", "D");
    }
    #endregion
}
