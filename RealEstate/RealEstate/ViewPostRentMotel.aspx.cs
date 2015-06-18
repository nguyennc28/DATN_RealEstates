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
    public partial class ViewPostRentMotel : System.Web.UI.Page
    {
        public string _realEstateOwnerID;
        public string _MotelID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                _realEstateOwnerID = Request.QueryString["reOwnerID"];
                _MotelID = Request.QueryString["homeID"];
                List<RealEstateOwnersInfo> listUser = RealEstateOwnersService.RealEstateOwnersInfo_GetById(_realEstateOwnerID);
                List<MotelInfo> txtMotelInfos = MotelService.MotelInfo_GetById(_MotelID);
                //if (listUser[0].Gender == "True")
                //{
                //    txtGender.Text = "Nam";
                //}
                //else
                //{
                //    txtGender.Text = "Nữ";
                //}
                txtRealEstateOwner.Text = listUser[0].RealEstateOwnersName;
                txtCLUR5.Text = listUser[0].CLUR;
                txtRealEstateOwnerType.Text = listUser[0].RealEstateOwnersType;
                txtGender.Text = "Nam";
                txtEmail.Text = listUser[0].Email;
                txtAddress.Text = listUser[0].Address;
                txtMobilePhone.Text = listUser[0].MobilePhone;
                txtIdentyCard.Text = listUser[0].IdentityCard;
                //string chuoi = "";
                //chuoi += "<img src=\"" + listUser[0].Avatar + " \" style=\" width: 40% \" />";
                //ltrAvatar.Text = chuoi;



                //Motel
                txtMotelType.Text = txtMotelInfos[0].MotelTypeID;
                txtRealEstate.Text = txtMotelInfos[0].RealEstateID;
                txtTenNha.Text = txtMotelInfos[0].Name;
                txtIsClose.Text = txtMotelInfos[0].IsClosed;
                txtIsCooker.Text = txtMotelInfos[0].IsCooker;
                txtFurniture.Text = txtMotelInfos[0].Furniture;
                txtAddress1.Text = txtMotelInfos[0].Address;
                txtDes.Text = txtMotelInfos[0].Description;
                txtArea.Text = txtMotelInfos[0].TotalArea;
                Label1.Text = txtMotelInfos[0].Price;
                txtThuocTang.Text = txtMotelInfos[0].TierNumber;
                string chuoi = "";
                chuoi += "<img src=\"" + txtMotelInfos[0].Image1 + " \" style=\" width: 90% \" />";
                ltrAnh1.Text = chuoi;
                string chuoi2 = "";
                chuoi2 += "<img src=\"" + txtMotelInfos[0].Image2 + " \" style=\" width: 90% \" />";
                ltrAnh2.Text = chuoi2;
                string chuoi3 = "";
                chuoi3 += "<img src=\"" + txtMotelInfos[0].Image3 + " \" style=\" width: 90% \" />";
                ltrAnh3.Text = chuoi3;
                string chuoi4 = "";
                chuoi4 += "<img src=\"" + txtMotelInfos[0].Image4 + " \" style=\" width: 90% \" />";
                ltrAnh4.Text = chuoi4;
                string chuoi5 = "";
                chuoi5 += "<img src=\"" + txtMotelInfos[0].Image5 + " \" style=\" width: 90% \" />";
                ltrAnh5.Text = chuoi5;
                string chuoi6 = "";
                chuoi6 += "<img src=\"" + txtMotelInfos[0].Image6 + " \" style=\" width: 90% \" />";
                ltrAnh6.Text = chuoi6;


            }
        }
    }
}