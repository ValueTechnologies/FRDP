using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_ApproveRequisitionA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void P14_RadioButtonList_Demanded0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //-----------------

        protected void P16_HiddenField_VR_Id0_ValueChanged(object sender, EventArgs e)
        {

        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;

            int index = gvRow.RowIndex;

            HiddenField HiddenField_GRID_VRId = (HiddenField)P17_GridView_Pending.Rows[index].FindControl("HiddenField8");
            HiddenField HiddenField11 = (HiddenField)P17_GridView_Pending.Rows[index].FindControl("HiddenField11");
            HiddenField HiddenField12 = (HiddenField)P17_GridView_Pending.Rows[index].FindControl("HiddenField12");


            P17_HiddenField_VR_Id.Value = HiddenField_GRID_VRId.Value;
            P17_HiddenField_StartTime.Value = HiddenField11.Value;
            P17_HiddenField_EndTime.Value = HiddenField12.Value;

            for (int i = 0; i < P17_GridView_Pending.Rows.Count; i++)
            {
                P17_GridView_Pending.Rows[i].ForeColor = System.Drawing.Color.Black;
                P17_GridView_Pending.Rows[i].BackColor = System.Drawing.Color.White;
            }
            P17_GridView_Pending.Rows[index].ForeColor = System.Drawing.Color.Red;
            P17_GridView_Pending.Rows[index].BackColor = System.Drawing.Color.LightBlue;


            P17_DataList_AvaiableV.DataBind();
            //P17_TextBox_Remarks.Visible = true;
            //P17_DataList_AvaiableV.Visible = true;
            //P17_Button_Approve.Visible = true;
            //P17_Button_Reject.Visible = true;
            Panel17A.Visible = true;
            P17_GridViewAllreadyReservedV.DataBind();
        }
        protected void P17_Button_Approve_Click(object sender, EventArgs e)
        {
            P17_HiddenField_Reject_Approve.Value = "2";

            if (P17_HiddenField_VR_Id.Value != "")
            {
                P17_SqlDataSource_Pending.Insert();
                P17_GridView_Pending.DataBind();
                P17_GridView_ApprovedRejected.DataBind();
                P17_HiddenField_VR_Id.Value = "";
            }
            P17_TextBox_Remarks.Text = "";
            Panel17A.Visible = false;
            //P17_TextBox_Remarks.Visible = false;
            //P17_Button_Approve.Visible = false;
            //P17_DataList_AvaiableV.Visible = false;
            //P17_Button_Reject.Visible = false;
        }
        protected void P17_Button_Reject_Click(object sender, EventArgs e)
        {
            P17_HiddenField_Reject_Approve.Value = "1";

            if (P17_HiddenField_VR_Id.Value != "")
            {
                P17_SqlDataSource_Pending.Insert();
                P17_GridView_Pending.DataBind();
                P17_GridView_ApprovedRejected.DataBind();
                P17_HiddenField_VR_Id.Value = "";
            }
            P17_TextBox_Remarks.Text = "";
            //P17_TextBox_Remarks.Visible = false;
            //P17_Button_Approve.Visible = false;
            //P17_Button_Reject.Visible = false;
            Panel17A.Visible = false;
        }

        protected void P17_DataList_AvaiableV_PreRender(object sender, EventArgs e)
        {
            //P17_DataList_AvaiableV.ItemTem
            //if (e.Item.ItemType == ListItemType.Header)
            //{
            //    Label NumberLabela = (Label)e.Item.FindControl("NumberLabela");
            //    NumberLabela.Text = P17_DataList_AvaiableV.Items.Count.ToString();
            //}

            //CheckBox ch = (CheckBox)DataListID.Controls.OfType<DataListItem>().First(a => a.ItemType == ListItemType.Header).FindControl("<CheckBoxID>");
            Label NumberLabela = (Label)P17_DataList_AvaiableV.Controls.OfType<DataListItem>().First(a => a.ItemType == ListItemType.Header).FindControl("NumberLabela");
            NumberLabela.Text = P17_DataList_AvaiableV.Items.Count.ToString();

        }
        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;

            int index = gvRow.RowIndex;
            for (int i = 0; i < P17_GridViewAllreadyReservedV.Rows.Count; i++)
            {
                Panel Panel17AAa = (Panel)P17_GridViewAllreadyReservedV.Rows[i].FindControl("Panel17AA");
                Panel17AAa.Visible = false;
            }
            HiddenField HiddenField_Main_Id = (HiddenField)P17_GridViewAllreadyReservedV.Rows[index].FindControl("HiddenField_Main_Id");
            P17_HiddenFieldBind_ID.Value = HiddenField_Main_Id.Value;
            Panel Panel17AA = (Panel)P17_GridViewAllreadyReservedV.Rows[index].FindControl("Panel17AA");
            Panel17AA.Visible = true;

        }


        protected void Button10_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent.Parent;

            int index = gvRow.RowIndex;
            HiddenField HiddenField_Main_Id = (HiddenField)P17_GridViewAllreadyReservedV.Rows[index].FindControl("HiddenField_Main_Id");
            P17_HiddenFieldBind_ID.Value = HiddenField_Main_Id.Value;

            TextBox StartDate = (TextBox)P17_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateChooser1");
            TextBox EndDate = (TextBox)P17_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateChooser2");
            TextBox StartTime = (TextBox)P17_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateTimeEdit1");
            TextBox EndTime = (TextBox)P17_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateTimeEdit2");
            //TextBox
            TextBox TextBox22 = (TextBox)P17_GridViewAllreadyReservedV.Rows[index].FindControl("TextBox22");
            // HiddenField P17_HiddenField_BindDestination = (HiddenField)P17_GridViewAllreadyReservedV.Rows[index].FindControl("P17_HiddenField_BindDestination");
            // StartDate.Value = DateTime.Now;
            P17_HiddenField_BindDestination.Value = TextBox22.Text;
            DateTime t1 = Convert.ToDateTime(StartDate.Text);
            DateTime t2 = Convert.ToDateTime(StartTime.Text);
            P17_HiddenField_BindStartDate.Value = t1.ToShortDateString() + " " + t2.ToLongTimeString();

            t1 = Convert.ToDateTime(EndDate.Text);
            t2 = Convert.ToDateTime(EndTime.Text);
            P17_HiddenField_BindEndDate.Value = t1.ToShortDateString() + " " + t2.ToLongTimeString();


            P17_HiddenField_Reject_Approve.Value = "2";

            if (P17_HiddenField_VR_Id.Value != "")
            {
                P17_SqlDataSource_Pending.Insert();
                P17_SqlDataSource_Bind.Insert();
                P17_GridView_Pending.DataBind();

                P17_GridView_ApprovedRejected.DataBind();
                P17_HiddenField_VR_Id.Value = "";
            }
            P17_TextBox_Remarks.Text = "";
            Panel17A.Visible = false;

            //Panel Panel17AA = (Panel)GridView6.Rows[index].FindControl("Panel17AA");
            //Panel17AA.Visible = false;
        }

        protected void Button11_Click(object sender, EventArgs e)
        {

            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent.Parent;

            int index = gvRow.RowIndex;
            // HiddenField HiddenField14 = (HiddenField)GridView6.Rows[index].FindControl("HiddenField14");
            P17_HiddenFieldBind_ID.Value = "";//HiddenField14.Value;
            Panel Panel17AA = (Panel)P17_GridViewAllreadyReservedV.Rows[index].FindControl("Panel17AA");
            Panel17AA.Visible = false;
        }
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            DataListItem cell = (DataListItem)(sender as Control).Parent;
            int index = cell.ItemIndex;
            HiddenField HiddenField13 = (HiddenField)P17_DataList_AvaiableV.Items[index].FindControl("HiddenField13");
            //LinkButton LinkButton7 = (LinkButton)P18_DataList_AvaiableV.Items[index].FindControl("LinkButton7");
            P17_HiddenField_Vehicle_SelectedID.Value = HiddenField13.Value;
            Label54.Visible = false;
            //P18_TextBox_Remarks.Text = HiddenField10.Value;
            for (int i = 0; i < P17_DataList_AvaiableV.Items.Count; i++)
            {
                P17_DataList_AvaiableV.Items[i].ForeColor = System.Drawing.Color.Black;
                P17_DataList_AvaiableV.Items[i].BackColor = System.Drawing.Color.White;

            }
            P17_DataList_AvaiableV.Items[index].ForeColor = System.Drawing.Color.Red;
            P17_DataList_AvaiableV.Items[index].BackColor = System.Drawing.Color.LightBlue;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            P17_HiddenField_Reject_Approve.Value = "2";
            if (P17_HiddenField_Vehicle_SelectedID.Value == "")
            {
                Label54.Visible = true;
            }
            else
            {
                if (P17_HiddenField_VR_Id.Value != "")
                {
                    P17_SqlDataSource_Pending.Insert();
                    P17_SqlDataSource_DirectApprove.Insert();
                    P17_GridView_Pending.DataBind();
                    P17_GridView_ApprovedRejected.DataBind();
                    P17_HiddenField_VR_Id.Value = "";
                    P17_HiddenField_Vehicle_SelectedID.Value = "";
                }
                P17_TextBox_Remarks.Text = "";
                Panel17A.Visible = false;
            }
        }
    }
}