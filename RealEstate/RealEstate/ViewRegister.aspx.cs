using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.DataAccess;

namespace RealEstate
{
    public partial class ViewRegister : System.Web.UI.Page
    {
        public string UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserID = Request.QueryString["id"];
                List<UsersInfo> listUser = UsersService.UsersInfo_GetById(UserID);
                //if (listUser[0].Gender == "True")
                //{
                //    txtGender.Text = "Nam";
                //}
                //else
                //{
                //    txtGender.Text = "Nữ";
                //}
                txtGender.Text = "Nam";
                txtUser.Text = listUser[0].UserName;
                //txtPass.Text = listUser[0].Password;
                txtEmail.Text = listUser[0].Email;
                txtAddress.Text = listUser[0].Address;
                txtBirthday.Text = listUser[0].Birthday;
                txtNumberPhone.Text = listUser[0].MobilePhone;
                txtIdentyCard.Text = listUser[0].IdentityCard;
                txtFullName.Text = listUser[0].FullName;
                string chuoi = "";
                chuoi += "<img src=\"" + listUser[0].Avatar + " \" style=\" width: 40% \" />";
                ltrAvatar.Text = chuoi;
            }
        }
    }
}