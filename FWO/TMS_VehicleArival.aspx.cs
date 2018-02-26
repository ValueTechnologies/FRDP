using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Globalization;

namespace FRDP
{
    public partial class TMS_VehicleArival : System.Web.UI.Page
    {
        string connection = Convert.ToString(ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //P2_WebDateChooser.Text = DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
                //DateTime d = DateTime.ParseExact(P2_WebDateChooser.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);// Convert.ToDateTime(P2_WebDateChooser.Text);
                P2_HiddenField_StartTime.Value = DateTime.Now.ToShortDateString() + " 12:01:00 AM";
                P2_HiddenField_EndTime.Value = DateTime.Now.ToShortDateString() + " 11:59:59 PM";

            }
        }
        //   protected void Panel1_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        WebDateChooser1.Value = DateTime.Now;
        //        DateTime d = Convert.ToDateTime(WebDateChooser1.Value);
        //        P1_HiddenField_StartTime.Value = d.ToShortDateString() + " 12:01:00 AM";
        //        P1_HiddenField_EndTime.Value = d.ToShortDateString() + " 11:59:59 PM";
        //        //P1_DropDownList_Name.DataBind();
        //        //P1_DropDownList_Name.Items.Insert(0, "All");
        //        //P1_DropDownList_Name.Items[0].Value = "0";
        //        //P1_DropDownList_Vehicle.DataBind();
        //        //P1_DropDownList_Vehicle.Items.Insert(0, "All");
        //        //P1_DropDownList_Vehicle.Items[0].Value = "0";
        //        //P1_DropDownList_Driver.DataBind();
        //        //P1_DropDownList_Driver.Items.Insert(0, "All");
        //        //P1_DropDownList_Driver.Items[0].Value = "0";

        //        //P1_DropDownList_Destination.DataBind();
        //        //P1_DropDownList_Destination.Items.Insert(0, "All");
        //        //P1_DropDownList_Destination.Items[0].Value = "0";
        //    }
        //}
        //protected void LinkButton10_Click(object sender, EventArgs e)
        //{
        //    GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;

        //    int index = gvRow.RowIndex;
        //    P1_HiddenField_SelectedRow.Value = Convert.ToString(index);
        //    for (int i = 0; i < P1_GridViewAllreadyReservedV.Rows.Count; i++)
        //    {
        //        Panel Panel1Aa = (Panel)P1_GridViewAllreadyReservedV.Rows[i].FindControl("Panel1A");
        //        Panel1Aa.Visible = false;
        //        GridView GridView70 = (GridView)P1_GridViewAllreadyReservedV.Rows[i].FindControl("GridView7");
        //        GridView70.Visible = true;
        //    }
        //    HiddenField HiddenField_Main_Id = (HiddenField)P1_GridViewAllreadyReservedV.Rows[index].FindControl("HiddenField_Main_Id");
        //    P1_HiddenFieldBind_ID.Value = HiddenField_Main_Id.Value;
        //    Panel Panel1A = (Panel)P1_GridViewAllreadyReservedV.Rows[index].FindControl("Panel1A");
        //    Panel1A.Visible = true;
        //    GridView GridView7 = (GridView)P1_GridViewAllreadyReservedV.Rows[index].FindControl("GridView7");
        //    GridView7.Visible = false;

        //}
        //protected void Button10_Click(object sender, EventArgs e)
        //{

        //    SqlDataSource P1_SqlDataSource_Save = (SqlDataSource)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1_SqlDataSource_Save");
        //    P1_SqlDataSource_Save.Insert();

        //    HiddenField HiddenField_Visited_StafEmpId0 = (HiddenField)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("HiddenField_Visited_StafEmpId0");
        //    HiddenField HiddenField_Vehicle_Requisition_Id0 = (HiddenField)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("HiddenField_Vehicle_Requisition_Id0");
        //    GridView GridView9 = (GridView)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("GridView9");
        //    SqlDataSource SqlDataSource2 = (SqlDataSource)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("SqlDataSource2");
        //    for (int i = 0; i < GridView9.Rows.Count; i++)
        //    {
        //        HiddenField HiddenField_Visited_StafEmpId = (HiddenField)GridView9.Rows[i].FindControl("HiddenField_Visited_StafEmpId");
        //        HiddenField HiddenField_Vehicle_Requisition_Id = (HiddenField)GridView9.Rows[i].FindControl("HiddenField_Vehicle_Requisition_Id");
        //        CheckBox CheckBox1 = (CheckBox)GridView9.Rows[i].FindControl("CheckBox1");
        //        if (CheckBox1.Checked)
        //        {
        //            HiddenField_Visited_StafEmpId0.Value = HiddenField_Visited_StafEmpId.Value;
        //            HiddenField_Vehicle_Requisition_Id0.Value = HiddenField_Vehicle_Requisition_Id.Value;
        //            SqlDataSource2.Insert();
        //        }
        //    }
        //    GridView GridView8 = (GridView)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("GridView8");
        //    HiddenField HiddenField_VFType_Id0 = (HiddenField)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("HiddenField_VFType_Id0");
        //    HiddenField HiddenField_VF_Current = (HiddenField)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("HiddenField_VF_Current");
        //    SqlDataSource P1A_SqlDataSource_CurrentFuel = (SqlDataSource)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_SqlDataSource_CurrentFuel");
        //    for (int j = 0; j < GridView8.Rows.Count; j++)
        //    {
        //        HiddenField HiddenField_VFType_Id = (HiddenField)GridView8.Rows[j].FindControl("HiddenField_VFType_Id");
        //        TextBox TextBox1 = (TextBox)GridView8.Rows[j].FindControl("TextBox1");
        //        HiddenField_VFType_Id0.Value = HiddenField_VFType_Id.Value;
        //        HiddenField_VF_Current.Value = TextBox1.Text;
        //        P1A_SqlDataSource_CurrentFuel.Insert();
        //    }


        //    P1_GridViewAllreadyReservedV.DataBind();



        //}
        //protected void Button11_Click(object sender, EventArgs e)
        //{

        //    GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent.Parent;

        //    int index = gvRow.RowIndex;
        //    // HiddenField HiddenField14 = (HiddenField)GridView6.Rows[index].FindControl("HiddenField14");
        //    P1_HiddenFieldBind_ID.Value = "";//HiddenField14.Value;
        //    var Panel1A = (Panel)P1_GridViewAllreadyReservedV.Rows[index].FindControl("Panel1A");
        //    Panel1A.Visible = false;
        //    GridView GridView7 = (GridView)P1_GridViewAllreadyReservedV.Rows[index].FindControl("GridView7");
        //    GridView7.Visible = true;
        //    P1_HiddenField_SelectedRow.Value = "";
        //}
        //protected void P1A_Button_UseSlipOf_Click(object sender, EventArgs e)
        //{
        //    GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent.Parent;
        //    int index = gvRow.RowIndex;
        //    SqlDataSource s = (SqlDataSource)P1_GridViewAllreadyReservedV.Rows[index].FindControl("P1A_SqlDataSource_Issue_Slip");
        //    s.Insert();
        //    GridView P1A_GridView_Issue_Slip = (GridView)P1_GridViewAllreadyReservedV.Rows[index].FindControl("P1A_GridView_Issue_Slip");
        //    P1A_GridView_Issue_Slip.DataBind();
        //}
        //protected void P1A_DropDownList_VFuleType_PreRender(object sender, EventArgs e)
        //{
        //    if (P1_HiddenField_SelectedRow.Value != "")
        //    {

        //        HiddenField HiddenField_VId = (HiddenField)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("HiddenField_VId");
        //        DropDownList P1A_DropDownList_VFuleType = (DropDownList)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_DropDownList_VFuleType");
        //        Label P1A_Label_Unit = (Label)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_Label_Unit");


        //        SqlConnection con1 = new SqlConnection(connection);
        //        con1.Open();
        //        SqlCommand command1 = new SqlCommand("SELECT Description FROM Vehicle_FuelType WHERE (Vehicle_FuelType_Id = " + P1A_DropDownList_VFuleType.SelectedValue + ")", con1);
        //        P1A_Label_Unit.Text = Convert.ToString(command1.ExecuteScalar());
        //        con1.Close();
        //    }
        //}
        //protected void P1A_DropDownList_FuelStation_PreRender(object sender, EventArgs e)
        //{
        //    if (P1_HiddenField_SelectedRow.Value != "")
        //    {

        //        HiddenField HiddenField_VId = (HiddenField)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("HiddenField_VId");
        //        DropDownList P1A_DropDownList_FuelStation = (DropDownList)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_DropDownList_FuelStation");
        //        Label P1ALabel_FS_AC = (Label)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1ALabel_FS_AC");
        //        TextBox P1A_TextBox_BookNo = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_BookNo");
        //        TextBox P1A_TextBox_SlipNo = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_SlipNo");

        //        string query = "SELECT Currnt_BookNo, AccountNo, Last_SlipNo + 1 AS SlipNo FROM Fuel_Station WHERE (Fuel_Station_Id = " + P1A_DropDownList_FuelStation.SelectedValue + ")";
        //        SqlConnection con = new SqlConnection(connection);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        SqlDataReader reader1 = cmd.ExecuteReader();
        //        if (reader1.Read())
        //        {
        //            P1A_TextBox_BookNo.Text = Convert.ToString(reader1["Currnt_BookNo"]);
        //            P1ALabel_FS_AC.Text = Convert.ToString(reader1["AccountNo"]);
        //            P1A_TextBox_SlipNo.Text = Convert.ToString(reader1["SlipNo"]);

        //        }
        //        reader1.Close();
        //        con.Close();
        //    }
        //}
        //protected void P1A_TextBox_BookNo_TextChanged(object sender, EventArgs e)
        //{
        //    if (P1_HiddenField_SelectedRow.Value != "")
        //    {
        //        TextBox P1A_TextBox_BookNo = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_BookNo");
        //        DropDownList P1A_DropDownList_FuelStation = (DropDownList)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_DropDownList_FuelStation");
        //        string Qstr = "UPDATE Fuel_Station SET Currnt_BookNo = '" + P1A_TextBox_BookNo.Text + "' WHERE Fuel_Station_Id = " + P1A_DropDownList_FuelStation.SelectedValue + "";
        //        SqlConnection con = new SqlConnection(connection);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand(Qstr, con);
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }
        //}
        //protected void P1A_TextBox_SlipNo_TextChanged(object sender, EventArgs e)
        //{
        //    if (P1_HiddenField_SelectedRow.Value != "")
        //    {
        //        TextBox P1A_TextBox_BookNo = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_BookNo");
        //        TextBox P1A_TextBox_SlipNo = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_SlipNo");
        //        DropDownList P1A_DropDownList_FuelStation = (DropDownList)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_DropDownList_FuelStation");
        //        string Qstr = "UPDATE Fuel_Station SET Last_SlipNo = " + P1A_TextBox_SlipNo.Text + " WHERE Fuel_Station_Id = " + P1A_DropDownList_FuelStation.SelectedValue + "";
        //        SqlConnection con = new SqlConnection(connection);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand(Qstr, con);
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }
        //}
        //protected void P1A_TextBox_MeterStart_TextChanged(object sender, EventArgs e)
        //{
        //    if (P1_HiddenField_SelectedRow.Value != "")
        //    {
        //        TextBox P1A_TextBox_MeterStart = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_MeterStart");
        //        HiddenField HiddenField_VId = (HiddenField)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("HiddenField_VId");
        //        DropDownList P1A_DropDownList_FuelStation = (DropDownList)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_DropDownList_FuelStation");
        //        string Qstr = "UPDATE Vehicle SET CurrentMeterReading = " + P1A_TextBox_MeterStart.Text + " WHERE (Vehicle_id = " + HiddenField_VId.Value + ")";
        //        SqlConnection con = new SqlConnection(connection);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand(Qstr, con);
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }
        //}
        //protected void WebDateChooser1_ValueChanged(object sender, Infragistics.WebUI.WebSchedule.WebDateChooser.WebDateChooserEventArgs e)
        //{
        //    //WebDateChooser1.Value = DateTime.Now;
        //    DateTime d = Convert.ToDateTime(WebDateChooser1.Value);
        //    P1_HiddenField_StartTime.Value = d.ToShortDateString() + " 12:01:00 AM";
        //    P1_HiddenField_EndTime.Value = d.ToShortDateString() + " 11:59:59 PM";
        //    //P1_DropDownList_Name.DataBind();
        //    //P1_DropDownList_Name.Items.Insert(0, "All");
        //    //P1_DropDownList_Name.Items[0].Value = "0";
        //    //P1_DropDownList_Vehicle.DataBind();
        //    //P1_DropDownList_Vehicle.Items.Insert(0, "All");
        //    //P1_DropDownList_Vehicle.Items[0].Value = "0";
        //    //P1_DropDownList_Driver.DataBind();
        //    //P1_DropDownList_Driver.Items.Insert(0, "All");
        //    //P1_DropDownList_Driver.Items[0].Value = "0";

        //    //P1_DropDownList_Destination.DataBind();
        //    //P1_DropDownList_Destination.Items.Insert(0, "All");
        //    //P1_DropDownList_Destination.Items[0].Value = "0";
        //    P1_GridViewAllreadyReservedV.DataBind();
        //}
        //protected void P1_SqlDataSource_Save_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        //{
        //    P1_HiddenField_OutPut_Visit_Id.Value = Convert.ToString(e.Command.Parameters["@Visit_Id_OutPut"].Value);
        //}
        protected void P1A_SqlDataSource_Issue_Slip_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //TextBox P1A_TextBox_BookNo = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_BookNo");
            //TextBox P1A_TextBox_SlipNo = (TextBox)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_TextBox_SlipNo");
            ////P1A_TextBox_SlipNo.Text = Convert.ToString(Convert.ToInt32(P1A_TextBox_SlipNo.Text) + 1);
            //DropDownList P1A_DropDownList_FuelStation = (DropDownList)P1_GridViewAllreadyReservedV.Rows[Convert.ToInt32(P1_HiddenField_SelectedRow.Value)].FindControl("P1A_DropDownList_FuelStation");
            //string Qstr = "UPDATE Fuel_Station SET Last_SlipNo = " + P1A_TextBox_SlipNo.Text + " WHERE Fuel_Station_Id = " + P1A_DropDownList_FuelStation.SelectedValue + "";
            //SqlConnection con = new SqlConnection(connection);
            //con.Open();
            //SqlCommand cmd = new SqlCommand(Qstr, con);
            //cmd.ExecuteNonQuery();
            //con.Close();
        }
        protected void Panel2_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                P2_WebDateChooser.Text = DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
                DateTime d = Convert.ToDateTime(P2_WebDateChooser.Text);
                P2_HiddenField_StartTime.Value = d.ToShortDateString() + " 12:01:00 AM";
                P2_HiddenField_EndTime.Value = d.ToShortDateString() + " 11:59:59 PM";
            }
        }
        //protected void P2_WebDateChooser_ValueChanged(object sender, EventArgs e)
        //{
        //    DateTime d = Convert.ToDateTime(P2_WebDateChooser.Value);
        //    P2_HiddenField_StartTime.Value = d.ToShortDateString() + " 12:01:00 AM";
        //    P2_HiddenField_EndTime.Value = d.ToShortDateString() + " 11:59:59 PM";
        //    P2_GridView_Display.DataBind();
        //}
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Panel6.Visible = true;
            HiddenField HiddenField_Visit_Id = (HiddenField)P2_GridView_Display.Rows[index].FindControl("HiddenField_Visit_Id");
            HiddenField HiddenField_Vehicle_id = (HiddenField)P2_GridView_Display.Rows[index].FindControl("HiddenField_Vehicle_id");
            HiddenField HiddenField_Driver_Emp_Id = (HiddenField)P2_GridView_Display.Rows[index].FindControl("HiddenField_Driver_Emp_Id");
            HiddenField HiddenField_Departure_Time = (HiddenField)P2_GridView_Display.Rows[index].FindControl("HiddenField_Departure_Time");
            HiddenField HiddenField_Arrival_Time = (HiddenField)P2_GridView_Display.Rows[index].FindControl("HiddenField_Arrival_Time");
            HiddenField HiddenField_MeterReading = (HiddenField)P2_GridView_Display.Rows[index].FindControl("HiddenField_MeterReading");

            P2_HiddenField_VisitId.Value = HiddenField_Visit_Id.Value;
            P2_HiddenField_Vehicleid.Value = HiddenField_Vehicle_id.Value;
            P2_HiddenField_Driver_EmpId.Value = HiddenField_Driver_Emp_Id.Value;
            P2_HiddenField_DepartureTime.Value = HiddenField_Departure_Time.Value;
            P2_HiddenField_ArrivalTime.Value = HiddenField_Arrival_Time.Value;
            P2_TextBox_MeterEnd.Text = HiddenField_MeterReading.Value;
            DateTime ArrivalTime = Convert.ToDateTime(P2_HiddenField_ArrivalTime.Value);
            WebDateChooser2.Text = Convert.ToString(ArrivalTime);
            P15_WebDateTimeEdit1.Text = ArrivalTime.ToShortTimeString();



            P2_GridView_Fuel.DataBind();
            for (int i = 0; i < P2_GridView_Display.Rows.Count; i++)
            {
                P2_GridView_Display.Rows[i].ForeColor = System.Drawing.Color.Black;
                P2_GridView_Display.Rows[i].BackColor = System.Drawing.Color.White;
            }
            P2_GridView_Display.Rows[index].ForeColor = System.Drawing.Color.Red;
            P2_GridView_Display.Rows[index].BackColor = System.Drawing.Color.LightBlue;


        }
        protected void HiddenField_Driver_Emp_Id_ValueChanged(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void Button_Save_Click(object sender, EventArgs e)
        {

            try
            {
                for (int f = 0; f < P2_GridView_Fuel.Rows.Count; f++)
                {
                    TextBox TextBox2 = (TextBox)P2_GridView_Fuel.Rows[f].FindControl("TextBox2");
                    HiddenField HiddenField_VFType_Id1 = (HiddenField)P2_GridView_Fuel.Rows[f].FindControl("HiddenField_VFType_Id1");
                    HiddenField_EndVal.Value = TextBox2.Text;
                    HiddenField_Vehicle_FuelType_Id.Value = HiddenField_VFType_Id1.Value;
                    P2_SqlDataSource_CurrentFuel.Update();
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
            try
            {
                for (int f = 0; f < P1A_GridView_Issue_Slip_Return.Rows.Count; f++)
                {
                    HiddenField HiddenField_SlipId = (HiddenField)P1A_GridView_Issue_Slip_Return.Rows[f].FindControl("HiddenField_SlipId");
                    CheckBox CheckBox2 = (CheckBox)P1A_GridView_Issue_Slip_Return.Rows[f].FindControl("CheckBox2");
                    if (CheckBox2.Checked)
                    {
                        HiddenFieldSlipId.Value = HiddenField_SlipId.Value;
                        P1A_SqlDataSource_Issue_SlipReturned.Update();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

            try
            {
                if (P2_TextBox_MeterEnd.Text != "")
                {
                    string Qstr = "UPDATE Vehicle SET CurrentMeterReading = " + P2_TextBox_MeterEnd.Text + " WHERE (Vehicle_id = " + P2_HiddenField_Vehicleid.Value + ")";
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Qstr, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (Exception Ex)
            {

                Response.Write(Ex.Message);
            }

            try
            {
                DateTime t1 = Convert.ToDateTime(WebDateChooser2.Text);
                DateTime t2 = Convert.ToDateTime(P15_WebDateTimeEdit1.Text);
                HiddenField_ArrivedAt.Value = t1.ToShortDateString() + " " + t2.ToLongTimeString();
                P2_SqlDataSource_Display.Update();
                Panel6.Visible = false;
                P2_GridView_Display.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow gv = (GridViewRow)(sender as Control).Parent.Parent;
                int i = gv.RowIndex;
                HiddenField HiddenField1 = (HiddenField)P2_GridView_Fuel.Rows[i].FindControl("HiddenField1");
                TextBox TextBox2 = (TextBox)P2_GridView_Fuel.Rows[i].FindControl("TextBox2");
                if (TextBox2.Text != "")
                {
                    string Qstr = "UPDATE Vehicle_Fuel SET Current_Fuel = " + TextBox2.Text + " WHERE (Vehicle_Fuel_Id = " + HiddenField1.Value + ")";
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Qstr, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
        protected void P2_TextBox_MeterEnd_TextChanged(object sender, EventArgs e)
        {
            if (P2_TextBox_MeterEnd.Text != "")
            {
                try
                {
                    string Qstr = "UPDATE Vehicle SET CurrentMeterReading = " + P2_TextBox_MeterEnd.Text + " WHERE (Vehicle_id = " + P2_HiddenField_Vehicleid.Value + ")";
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Qstr, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {

                    Response.Write(ex.Message);
                }

            }
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            GridViewRow gv = (GridViewRow)(sender as Control).Parent.Parent;
            int i = gv.RowIndex;
            GridViewRow gvtop = (GridViewRow)(sender as Control).Parent.Parent.Parent.Parent.Parent.Parent.Parent;
            GridView GridView8 = (GridView)gvtop.FindControl("GridView8");
            TextBox TextBox1 = (TextBox)GridView8.Rows[i].FindControl("TextBox1");
            HiddenField HiddenField2 = (HiddenField)GridView8.Rows[i].FindControl("HiddenField2");
            if (TextBox1.Text != "")
            {
                try
                {
                    string Qstr = "UPDATE Vehicle_Fuel SET Current_Fuel = " + TextBox1.Text + " WHERE (Vehicle_Fuel_Id = " + HiddenField2.Value + ")";
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Qstr, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {

                    Response.Write(ex.Message);
                }

            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            P2_GridView_Display.DataBind();
            Panel6.Visible = false;
        }
        protected void Button_AddProblem_Click(object sender, EventArgs e)
        {
            if (TextBoxNoOfitems.Text != "")
            {
                SqlDataSourceGrid.Insert();
            }
            GridView1.DataBind();

        }

        protected void P2_WebDateChooser_ValueChanged(object sender, EventArgs e)
        {
            //DateTime d = Convert.ToDateTime(P2_WebDateChooser.Value);
            DateTime d = DateTime.ParseExact(P2_WebDateChooser.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            P2_HiddenField_StartTime.Value = d.ToShortDateString() + " 12:01:00 AM";
            P2_HiddenField_EndTime.Value = d.ToShortDateString() + " 11:59:59 PM";
            P2_GridView_Display.DataBind();
        }
    }
}