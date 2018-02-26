using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_ApproveRequisitionB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;

            int index = gvRow.RowIndex;

            HiddenField HiddenField_GRID_VRId = (HiddenField)P18_GridView_Pending.Rows[index].FindControl("HiddenField9");
            HiddenField HiddenFieldFromTime = (HiddenField)P18_GridView_Pending.Rows[index].FindControl("HiddenFieldFromTime");
            HiddenField HiddenField_ToTime = (HiddenField)P18_GridView_Pending.Rows[index].FindControl("HiddenField_ToTime");


            P18_HiddenField_VR_Id.Value = HiddenField_GRID_VRId.Value;
            P18_HiddenField_StartTime.Value = HiddenFieldFromTime.Value;
            P18_HiddenField_EndTime.Value = HiddenField_ToTime.Value;

            for (int i = 0; i < P18_GridView_Pending.Rows.Count; i++)
            {
                P18_GridView_Pending.Rows[i].ForeColor = System.Drawing.Color.Black;
                P18_GridView_Pending.Rows[i].BackColor = System.Drawing.Color.White;
            }
            P18_GridView_Pending.Rows[index].ForeColor = System.Drawing.Color.Red;
            P18_GridView_Pending.Rows[index].BackColor = System.Drawing.Color.LightBlue;

            Panel18A.Visible = true;
            P18_DataList_AvaiableV.DataBind();
            //P18_DataList_AvaiableV.Visible = true;
            //P18_Button_Approve.Visible = true;
            //P18_Button_Reject.Visible = true;
        }
        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;

            int index = gvRow.RowIndex;
            for (int i = 0; i < P18_GridViewAllreadyReservedV.Rows.Count; i++)
            {
                Panel Panel18AAa = (Panel)P18_GridViewAllreadyReservedV.Rows[i].FindControl("Panel18AA");
                Panel18AAa.Visible = false;
            }
            HiddenField HiddenField_Main_Id = (HiddenField)P18_GridViewAllreadyReservedV.Rows[index].FindControl("HiddenField_Main_Id0");
            P18_HiddenFieldBind_ID.Value = HiddenField_Main_Id.Value;
            Panel Panel18AA = (Panel)P18_GridViewAllreadyReservedV.Rows[index].FindControl("Panel18AA");
            Panel18AA.Visible = true;
        }
        protected void Button12_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent.Parent;

            int index = gvRow.RowIndex;
            HiddenField HiddenField_Main_Id = (HiddenField)P18_GridViewAllreadyReservedV.Rows[index].FindControl("HiddenField_Main_Id0");
            P18_HiddenFieldBind_ID.Value = HiddenField_Main_Id.Value;

            TextBox StartDate = (TextBox)P18_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateChooser3");
            TextBox EndDate = (TextBox)P18_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateChooser4");
            TextBox StartTime = (TextBox)P18_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateTimeEdit3");
            TextBox EndTime = (TextBox)P18_GridViewAllreadyReservedV.Rows[index].FindControl("WebDateTimeEdit4");
            // StartDate.Value = DateTime.Now;
            TextBox TextBox23 = (TextBox)P18_GridViewAllreadyReservedV.Rows[index].FindControl("TextBox23");
            //HiddenField P18_HiddenField_BindDestination = (HiddenField)P18_GridViewAllreadyReservedV.Rows[index].FindControl("P18_HiddenField_BindDestination");
            P18_HiddenField_BindDestination.Value = TextBox23.Text;
            DateTime t1 = Convert.ToDateTime(StartDate.Text);
            DateTime t2 = Convert.ToDateTime(StartTime.Text);
            P18_HiddenField_BindStartDate.Value = t1.ToShortDateString() + " " + t2.ToLongTimeString();

            t1 = Convert.ToDateTime(EndDate.Text);
            t2 = Convert.ToDateTime(EndTime.Text);
            P18_HiddenField_BindEndDate.Value = t1.ToShortDateString() + " " + t2.ToLongTimeString();


            P18_HiddenField_Reject_Approve.Value = "2";

            if (P18_HiddenField_VR_Id.Value != "")
            {
                //P18_SqlDataSource_Pending.Insert();
                P18_SqlDataSource_Bind.Insert();
                P18_GridView_Pending.DataBind();

                P18_GridView_ApprovedRejected.DataBind();
                P18_HiddenField_VR_Id.Value = "";
            }
            P18_TextBox_Remarks.Text = "";
            Panel18A.Visible = false;

            //Panel Panel17AA = (Panel)GridView6.Rows[index].FindControl("Panel17AA");
            //Panel17AA.Visible = false;
        }
        protected void Button13_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent.Parent;

            int index = gvRow.RowIndex;
            // HiddenField HiddenField14 = (HiddenField)GridView6.Rows[index].FindControl("HiddenField14");
            P18_HiddenFieldBind_ID.Value = "";//HiddenField14.Value;
            Panel Panel18AA = (Panel)P18_GridViewAllreadyReservedV.Rows[index].FindControl("Panel18AA");
            Panel18AA.Visible = false;
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            DataListItem cell = (DataListItem)(sender as Control).Parent;
            int index = cell.ItemIndex;
            HiddenField HiddenField10 = (HiddenField)P18_DataList_AvaiableV.Items[index].FindControl("HiddenField10");
            HiddenField HiddenField_Driver_I_D = (HiddenField)P18_DataList_AvaiableV.Items[index].FindControl("HiddenField_Driver_I_D");
            LinkButton LinkButton7 = (LinkButton)P18_DataList_AvaiableV.Items[index].FindControl("LinkButton7");
            P18_HiddenField_SelectedDriver.Value = HiddenField_Driver_I_D.Value;
            if (P18_HiddenField_SelectedDriver.Value != "")
            {
                P18_Label_Vehicle.Visible = true;
                P18_Label_DriverTitle.Visible = true;
                P18_DropDownList_SelectedDriver.Visible = true;
                P18_Label_Vehicle.Text = LinkButton7.Text;
                P18_DropDownList_SelectedDriver.DataBind();
                P18_DropDownList_SelectedDriver.SelectedValue = P18_HiddenField_SelectedDriver.Value;
            }
            else
            {
                P18_Label_Vehicle.Visible = false;
                P18_Label_DriverTitle.Visible = false;
                P18_DropDownList_SelectedDriver.Visible = false;
            }

            P18_HiddenField_Vehicle_SelectedID.Value = HiddenField10.Value;
            //P18_TextBox_Remarks.Text = HiddenField10.Value;
            Label66.Visible = false;
            for (int i = 0; i < P18_DataList_AvaiableV.Items.Count; i++)
            {
                P18_DataList_AvaiableV.Items[i].ForeColor = System.Drawing.Color.Black;
                P18_DataList_AvaiableV.Items[i].BackColor = System.Drawing.Color.White;

            }
            P18_DataList_AvaiableV.Items[index].ForeColor = System.Drawing.Color.Red;
            P18_DataList_AvaiableV.Items[index].BackColor = System.Drawing.Color.LightBlue;
        }
        protected void P18_DataList_AvaiableV_PreRender(object sender, EventArgs e)
        {
            //P17_DataList_AvaiableV.ItemTem
            //if (e.Item.ItemType == ListItemType.Header)
            //{
            //    Label NumberLabela = (Label)e.Item.FindControl("NumberLabela");
            //    NumberLabela.Text = P17_DataList_AvaiableV.Items.Count.ToString();
            //}

            //CheckBox ch = (CheckBox)DataListID.Controls.OfType<DataListItem>().First(a => a.ItemType == ListItemType.Header).FindControl("<CheckBoxID>");
            if (P18_DataList_AvaiableV.Items.Count > 0)
            {
                Label NumberLabela = (Label)P18_DataList_AvaiableV.Controls.OfType<DataListItem>().First(a => a.ItemType == ListItemType.Header).FindControl("NumberLabela0");
                NumberLabela.Text = P18_DataList_AvaiableV.Items.Count.ToString();

            }
            else
            {
                Label NumberLabela = (Label)P18_DataList_AvaiableV.Controls.OfType<DataListItem>().First(a => a.ItemType == ListItemType.Header).FindControl("NumberLabela0");
                NumberLabela.Text = "0";
                P18_Label_Vehicle.Visible = false;
                P18_Label_DriverTitle.Visible = false;
                P18_DropDownList_SelectedDriver.Visible = false;
            }
        }
        protected void P18_Button_Approve_Click(object sender, EventArgs e)
        {
            P18_HiddenField_Reject_Approve.Value = "2";
            if (P18_HiddenField_Vehicle_SelectedID.Value == "")
            {
                Label66.Visible = true;
            }
            else
            {
                if (P18_HiddenField_VR_Id.Value != "")
                {
                    P18_SqlDataSource_Pending.Insert();
                    P18_GridView_Pending.DataBind();
                    P18_GridView_ApprovedRejected.DataBind();
                    P18_HiddenField_VR_Id.Value = "";
                }


                P18_TextBox_Remarks.Text = "";
                Panel18A.Visible = false;
            }
        }
        protected void P18_Button_Reject_Click(object sender, EventArgs e)
        {
            P18_HiddenField_Reject_Approve.Value = "1";

            if (P18_HiddenField_VR_Id.Value != "")
            {
                P18_SqlDataSource_Pending.Insert();
                P18_GridView_Pending.DataBind();
                P18_GridView_ApprovedRejected.DataBind();
                P18_HiddenField_VR_Id.Value = "";
            }
            P18_TextBox_Remarks.Text = "";
            Panel18A.Visible = false;
        }







    }
}