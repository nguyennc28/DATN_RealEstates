﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstate.Business;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Admins
{
    public partial class LinksManager : System.Web.UI.Page
    {
        static string Id = "";
        static bool Insert = false;
        private string Lang = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Lang = Global.GetLang();
            if (!IsPostBack)
            {
                lbtDeleteT.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa?');");
                lbtDeleteB.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa?');");
                BindGrid();
            }
        }
        private void BindGrid()
        {
            grdLinks.DataSource = LinkService.Link_GetByAll(Lang);
            grdLinks.DataBind();
            if (grdLinks.PageCount <= 1)
            {
                grdLinks.PagerStyle.Visible = false;
            }
        }

        protected void grdLinks_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            ListItemType itemType = e.Item.ItemType;
            if ((itemType != ListItemType.Footer) && (itemType != ListItemType.Separator))
            {
                if (itemType == ListItemType.Header)
                {
                    object checkBox = e.Item.FindControl("chkSelectAll");
                    if ((checkBox != null))
                    {
                        ((CheckBox)checkBox).Attributes.Add("onClick", "Javascript:chkSelectAll_OnClick(this)");
                    }
                }
                else
                {
                    string tableRowId = grdLinks.ClientID + "_row" + e.Item.ItemIndex.ToString();
                    e.Item.Attributes.Add("id", tableRowId);
                    object checkBox = e.Item.FindControl("chkSelect");
                    if ((checkBox != null))
                    {
                        e.Item.Attributes.Add("onMouseMove", "Javascript:chkSelect_OnMouseMove(this)");
                        e.Item.Attributes.Add("onMouseOut", "Javascript:chkSelect_OnMouseOut(this," + e.Item.ItemIndex.ToString() + ")");
                        ((CheckBox)checkBox).Attributes.Add("onClick", "Javascript:chkSelect_OnClick(this," + e.Item.ItemIndex.ToString() + ")");
                    }
                }
            }
        }

        protected void grdLinks_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            grdLinks.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void grdLinks_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            string strCA = e.CommandArgument.ToString();
            switch (e.CommandName)
            {
                case "Edit":
                    Insert = false;
                    Id = strCA;
                    List<Link> ListLinks = LinkService.Link_GetById(Id);
                    txtName.Text = ListLinks[0].Name;
                    txtLink1.Text = ListLinks[0].Link1;
                    txtLink2.Text = ListLinks[0].Link2;
                    txtPosition.Text = ListLinks[0].Position;
                    txtOrd.Text = ListLinks[0].Ord;
                    pnView.Visible = false;
                    pnUpdate.Visible = true;
                    break;
                case "Delete":
                    LinkService.Link_Delete(strCA);
                    BindGrid();
                    break;
            }
        }
        protected void AddButton_Click(object sender, EventArgs e)
        {
            pnUpdate.Visible = true;
            ControlClass.ResetControlValues(pnUpdate);
            pnView.Visible = false;
            Insert = true;
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            DataGridItem item = default(DataGridItem);
            for (int i = 0; i < grdLinks.Items.Count; i++)
            {
                item = grdLinks.Items[i];
                if (item.ItemType == ListItemType.AlternatingItem | item.ItemType == ListItemType.Item)
                {
                    if (((CheckBox)item.FindControl("ChkSelect")).Checked)
                    {
                        string strId = item.Cells[1].Text;
                        LinkService.Link_Delete(strId);
                    }
                }
            }
            grdLinks.CurrentPageIndex = 0;
            BindGrid();
        }

        protected void RefreshButton_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Link obj = new Link();
                obj.ID = Id;
                obj.Name = txtName.Text;
                obj.Line1 = "";
                obj.Line2 = "";
                obj.Link1 = txtLink1.Text;
                obj.Link2 = txtLink2.Text;
                obj.Position = txtPosition.Text;
                obj.Ord = txtOrd.Text;
                obj.Lang = Lang;
                obj.Active = txtActive.Text;
                
                if (Insert == true)
                {
                    LinkService.Link_Insert(obj);
                }
                else
                {  
                    LinkService.Link_Update(obj);
                }                
                BindGrid();
                pnView.Visible = true;
                pnUpdate.Visible = false;
                Insert = false;
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            pnView.Visible = true;
            pnUpdate.Visible = false;
            Insert = false;
        }
    }
}