using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_ApproveTransportRequisition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;

            int index = gvRow.RowIndex;

            HiddenField HiddenField_GRID_VRId = (HiddenField)P16_GridView_Pending.Rows[index].FindControl("HiddenField7");

            P16_HiddenField_VR_Id.Value = HiddenField_GRID_VRId.Value;


            for (int i = 0; i < P16_GridView_Pending.Rows.Count; i++)
            {
                P16_GridView_Pending.Rows[i].ForeColor = System.Drawing.Color.Black;
                P16_GridView_Pending.Rows[i].BackColor = System.Drawing.Color.White;
            }
            P16_GridView_Pending.Rows[index].ForeColor = System.Drawing.Color.Red;
            P16_GridView_Pending.Rows[index].BackColor = System.Drawing.Color.LightBlue;

            P16_TextBox_Remarks.Visible = true;
            P16_Button_Approve.Visible = true;
            P16_Button_Reject.Visible = true;
        }
        protected void P16_Button_Approve_Click(object sender, EventArgs e)
        {
            P16_HiddenField_Reject_Approve.Value = "2";

            if (P16_HiddenField_VR_Id.Value != "")
            {
                P16_SqlDataSource_Pending.Insert();
                P16_GridView_Pending.DataBind();
                P16_GridView_ApprovedRejected.DataBind();
                P16_HiddenField_VR_Id.Value = "";
            }
            P16_TextBox_Remarks.Text = "";
            P16_TextBox_Remarks.Visible = false;
            P16_Button_Approve.Visible = false;
            P16_Button_Reject.Visible = false;
        }
        protected void P16_Button_Reject_Click(object sender, EventArgs e)
        {
            P16_HiddenField_Reject_Approve.Value = "1";

            if (P16_HiddenField_VR_Id.Value != "")
            {
                P16_SqlDataSource_Pending.Insert();
                P16_GridView_Pending.DataBind();
                P16_GridView_ApprovedRejected.DataBind();
                P16_HiddenField_VR_Id.Value = "";
            }
            P16_TextBox_Remarks.Text = "";
            P16_TextBox_Remarks.Visible = false;
            P16_Button_Approve.Visible = false;
            P16_Button_Reject.Visible = false;
        }
    }
}