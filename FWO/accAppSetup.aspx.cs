using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class accAppSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void dvFee_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            //grdList.DataBind();
        }

        protected void dvFee_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            //Label lblMsg = dvFee.FindControl("lblMsg1") as Label;
            //try
            //{
            //    TextBox uName = dvFee.FindControl("TextBox2") as TextBox;

            //    if (uName.Text == "")
            //    {
            //        lblMsg.Text = "Please enter a fee name ...";
            //        e.Cancel = true;
            //    }
            //}
            //catch (Exception ex)
            //{
            //    lblMsg.Text = ex.Message;
            //    e.Cancel = true;
            //}
        }

        protected void dvFee_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
           // Label lblMsg = dvFee.FindControl("lblMsg0") as Label;
           // TextBox uName = dvFee.FindControl("TextBox1") as TextBox;
           // if (uName.Text == "")
           // {
           //     lblMsg.Text = "Please enter a fee name ...";
           //     e.Cancel = true;
           // }
           //// grdList.DataBind();
        }

        protected void grdList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           // grdList.PageIndex = e.NewPageIndex;
        }

        protected void grdList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //dvFee.ChangeMode(DetailsViewMode.Edit);
        }

        protected void grdList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               // e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(grdList, "Select$" + e.Row.RowIndex.ToString());
            }
        }
    }
}