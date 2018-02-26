using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_Motor_Registration : System.Web.UI.Page
    {
        string connection = Convert.ToString(ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"]);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (Basic_Checks._Textbox_Not_Empty(TextBox_BodyType, Label84, "*"))
            //{
                SqlDataSource_Vehicle_BodyTypeId.Insert();
            //}

            GridView3.DataBind();
            TextBox_BodyTypeDescription.Text = "";
            TextBox_BodyType.Text = "";
            Panel10.Visible = true;
            Panel5.Visible = false;
            DropDownList_Vehicle_BodyTypeId.DataBind();


        }

        protected void Button1Cancel_Click(object sender, EventArgs e)
        {
            //if (Basic_Checks._Textbox_Not_Empty(TextBox_BodyType, Label84, "*"))
            //{
            //SqlDataSource_Vehicle_BodyTypeId.Insert();
            //}

            //GridView3.DataBind();
            TextBox_BodyTypeDescription.Text = "";
            TextBox_BodyType.Text = "";
            Panel10.Visible = true;
            Panel5.Visible = false;
            DropDownList_Vehicle_BodyTypeId.DataBind();


        }
        protected void Button_P1_Save_Click(object sender, EventArgs e)
        {

            if (Basic_Checks._Textbox_Not_Empty(TextBox_P1_Class, Label80, "*"))
            {
                SqlDataSource_Vehicle_Class_Id.Insert();

            }

            GridView1.DataBind();
            TextBox_P1_Class.Text = "";
            TextBox_P1_Description.Text = "";
            Panel10.Visible = true;
            Panel1.Visible = false;
            DropDownList_Vehicle_Class_Id.DataBind();
        }

        protected void Button_P1_Cancel_Click(object sender, EventArgs e)
        {
            Panel10.Visible = true;
            Panel1.Visible = false;
            DropDownList_Vehicle_Class_Id.DataBind();
        }
        protected void Button_P2_Save_Click(object sender, EventArgs e)
        {
            //if (Basic_Checks._Textbox_Not_Empty(TextBox_Manufacturer, Label81, "*"))
            //{
                SqlDataSource_Manufacturer.Insert();

            //}

            GridView_P2_Manufacturer.DataBind();
            TextBox_Manufacturer.Text = "";
            TextBox_Location.Text = "";
            TextBox_Phone.Text = "";
            Panel10.Visible = true;
            DropDownList_ManufacturerId.DataBind();
            Panel2.Visible = false;
        }
        protected void Button_P3_Save_Click(object sender, EventArgs e)
        {
            if (Basic_Checks._Textbox_Not_Empty(TextBox_VehicleType, Label82, "*"))
            {
                SqlDataSource_Vehicle_Type.Insert();
            }

            TextBox_VehicleType.Text = "";
            GridView2.DataBind();
            Panel10.Visible = true;
            Panel3.Visible = false;
            Vehicle_Type_Id.DataBind();
        }
        protected void Button_P3_Cancel_Click(object sender, EventArgs e)
        {

            Panel10.Visible = true;
            Panel3.Visible = false;
            Vehicle_Type_Id.DataBind();
        }
        protected void Button_P4_Save_Click(object sender, EventArgs e)
        {
            //if (Basic_Checks._Textbox_Not_Empty(TextBox_Condition, Label83, "*"))
            //{
                SqlDataSource_Vehicle_Condition_Id.Insert();
            //}

            TextBox_ConditionDescription.Text = "";
            TextBox_Condition.Text = "";
            GridView_Condition.DataBind();
            Panel10.Visible = true;
            Panel4.Visible = false;
            DropDownList_Vehicle_Condition_Id.DataBind();
        }


        protected void Button_P4_Cancel_Click(object sender, EventArgs e)
        {
            //if (Basic_Checks._Textbox_Not_Empty(TextBox_Condition, Label83, "*"))
            ////{
            //SqlDataSource_Vehicle_Condition_Id.Insert();
            ////}

            TextBox_ConditionDescription.Text = "";
            TextBox_Condition.Text = "";
            //GridView_Condition.DataBind();
            Panel10.Visible = true;
            Panel4.Visible = false;
            DropDownList_Vehicle_Condition_Id.DataBind();
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel10.Visible = false;
            Panel1.Visible = true;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

            Panel10.Visible = false;
            Panel2.Visible = true;

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Panel10.Visible = false;
            Panel3.Visible = true;
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            Panel10.Visible = false;
            Panel4.Visible = true;
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            Panel10.Visible = false;
            Panel5.Visible = true;
        }
        protected void SqlDataSource_Save_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            HiddenField_Vehicle_id.Value = Convert.ToString(e.Command.Parameters["@Vehicle_id_Return"].Value);

        }
        protected void Button_Save_Click(object sender, EventArgs e)
        {
            //HiddenField_Insurance_FromDate.Value = Convert.ToString(WebDateChooser_Insurance_FromDate.Value);
            //HiddenField__Insurance_ToDate.Value = Convert.ToString(WebDateChooser_Insurance_ToDate.Value);

             
            //HiddenField_Insurance_FromDate.Value =Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["WebDateChooser_Insurance_FromDate"]).Value));
            //HiddenField__Insurance_ToDate.Value = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["WebDateChooser_Insurance_ToDate"]).Value));

            //HiddenField_Insurance_FromDate.Value = Request.Form[WebDateChooser_Insurance_FromDate.ClientID];
            //HiddenField__Insurance_ToDate.Value = Request.Form[WebDateChooser_Insurance_ToDate.ClientID];
            if (TextBox_Number.Text != "")
            {

                if (TextBox_InsuranceNumber.Text == "")
                {
                    HiddenField__Insurance_ToDate.Value = "";
                    HiddenField_Insurance_FromDate.Value = "";

                }

                SqlDataSource_Save.Insert();
                for (int i = 0; i < CheckBoxList_Vehicle_FuelType.Items.Count; i++)
                {
                    if (CheckBoxList_Vehicle_FuelType.Items[i].Selected == true)
                    {
                        HiddenField_Vehicle_FuelType_Id.Value = CheckBoxList_Vehicle_FuelType.Items[i].Value;
                        //string connection = Convert.ToString(ConfigurationManager.ConnectionStrings["TMSConnectionString"]);
                        //string Qry = "INSERT INTO Vehicle_Fuel (Vehicle_FuelType_Id, Vehicle_id, Emp_Id) VALUES (" + CheckBoxList_Vehicle_FuelType.Items[i].Value + "," + HiddenField_Vehicle_id.Value+ ","+Session["Emp_Id"]+")";
                        //SqlConnection con = new SqlConnection(connection);
                        //SqlCommand cmd = new SqlCommand(Qry, con);
                        //con.Open();
                        //cmd.ExecuteNonQuery();
                        //con.Close();
                        SqlDataSource_Vehicle_FuelType_Id.Insert();
                    }
                }
                Label79.Visible = false;
            }
            else
            {
                Label79.Visible = true;
            }
            TextBox_ChassisNumber.Text = "";
            TextBox_Colour.Text = "";
            TextBox_CubicCapacity.Text = "";
            TextBox_EnginNo.Text = "";
            TextBox_Height.Text = "";
            TextBox_HorsePower.Text = "";
            TextBox_InsuranceNumber.Text = "";
            TextBox_Lenght.Text = "";
            //TextBox_Maker_Name.Text = "";
            DropDownList_ManufactureMonths.DataBind();
            DropDownList_ManufactureMonths.Items.Insert(0, "");
            DropDownList_ManufactureMonths.Items[0].Value = "";
            TextBox_Manufacture_Year.Text = "";
            TextBox_NoOfCylinder.Text = "";
            // TextBox_OwnerName.Text = "";
            TextBox_Registration_Authority.Text = "";
            TextBox_SeatingCapcity.Text = "";
            TextBox_UnLandedWeight.Text = "";
            TextBox_Width.Text = "";
            TextBox_Number.Text = "";
            TextBox_Cost.Text = "";
            TextBox_RegistrationNo.Text = "";
            GridView5.DataBind();
        }
        protected void Button_Update_P10_Click(object sender, EventArgs e)
        {
            if (HiddenField_VehicleId_p10.Value != "0")
            {
                //HiddenField_Insurance_FromDate.Value = Convert.ToString(WebDateChooser_Insurance_FromDate.Value);
                //HiddenField__Insurance_ToDate.Value = Convert.ToString(WebDateChooser_Insurance_ToDate.Value);

                //HiddenField_Insurance_FromDate.Value = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["WebDateChooser_Insurance_FromDate"]).Value));
                //HiddenField__Insurance_ToDate.Value = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["WebDateChooser_Insurance_ToDate"]).Value));

                if (TextBox_Number.Text != "")
                {
                    if (TextBox_InsuranceNumber.Text == "")
                    {
                        HiddenField__Insurance_ToDate.Value = "";
                        HiddenField_Insurance_FromDate.Value = "";
                    }
                    SqlDataSource_Save0.Insert();
                    for (int i = 0; i < CheckBoxList_Vehicle_FuelType.Items.Count; i++)
                    {
                        if (CheckBoxList_Vehicle_FuelType.Items[i].Selected == true)
                        {
                            HiddenField_Vehicle_FuelType_Id.Value = CheckBoxList_Vehicle_FuelType.Items[i].Value;
                            //string connection = Convert.ToString(ConfigurationManager.ConnectionStrings["TMSConnectionString"]);
                            //string Qry = "INSERT INTO Vehicle_Fuel (Vehicle_FuelType_Id, Vehicle_id, Emp_Id) VALUES (" + CheckBoxList_Vehicle_FuelType.Items[i].Value + "," + HiddenField_Vehicle_id.Value+ ","+Session["Emp_Id"]+")";
                            //SqlConnection con = new SqlConnection(connection);
                            //SqlCommand cmd = new SqlCommand(Qry, con);
                            //con.Open();
                            //cmd.ExecuteNonQuery();
                            //con.Close();
                            SqlDataSource_Vehicle_FuelType_Id0.Insert();
                        }
                    }
                }
                TextBox_ChassisNumber.Text = "";
                TextBox_Colour.Text = "";
                TextBox_CubicCapacity.Text = "";
                TextBox_EnginNo.Text = "";
                TextBox_Height.Text = "";
                TextBox_HorsePower.Text = "";
                TextBox_InsuranceNumber.Text = "";
                TextBox_Lenght.Text = "";
                //TextBox_Maker_Name.Text = "";
                DropDownList_ManufactureMonths.DataBind();
                DropDownList_ManufactureMonths.Items.Insert(0, "");
                DropDownList_ManufactureMonths.Items[0].Value = "";
                TextBox_Manufacture_Year.Text = "";
                TextBox_NoOfCylinder.Text = "";
                // TextBox_OwnerName.Text = "";
                TextBox_Registration_Authority.Text = "";
                TextBox_SeatingCapcity.Text = "";
                TextBox_UnLandedWeight.Text = "";
                TextBox_Width.Text = "";
                TextBox_Number.Text = "";
                TextBox_Cost.Text = "";
                TextBox_RegistrationNo.Text = "";
                GridView5.DataBind();
                CheckBoxList_Vehicle_FuelType.DataBind();
                Button_Cancel_P10.Visible = false;
                Button_Update_P10.Visible = false;
                Button_Save.Visible = true;
                for (int lop = 0; lop < GridView5.Rows.Count; lop++)
                {
                    LinkButton LinkButtona = (LinkButton)GridView5.Rows[lop].FindControl("LinkButton3");
                    LinkButtona.ForeColor = System.Drawing.Color.Blue;
                }
            }
        }


        protected void Button_Cancel_P10_Click(object sender, EventArgs e)
        {
            Button_Cancel_P10.Visible = false;
            Button_Update_P10.Visible = false;
            Button_Save.Visible = true;
            for (int lop = 0; lop < GridView5.Rows.Count; lop++)
            {
                LinkButton LinkButtona = (LinkButton)GridView5.Rows[lop].FindControl("LinkButton3");
                LinkButtona.ForeColor = System.Drawing.Color.Blue;
            }
            HiddenField_VehicleId_p10.Value = "0";
            TextBox_ChassisNumber.Text = "";
            TextBox_Colour.Text = "";
            TextBox_CubicCapacity.Text = "";
            TextBox_EnginNo.Text = "";
            TextBox_Height.Text = "";
            TextBox_HorsePower.Text = "";
            TextBox_InsuranceNumber.Text = "";
            TextBox_Lenght.Text = "";
            //TextBox_Maker_Name.Text = "";
            DropDownList_ManufactureMonths.DataBind();
            DropDownList_ManufactureMonths.Items.Insert(0, "");
            DropDownList_ManufactureMonths.Items[0].Value = "";
            TextBox_Manufacture_Year.Text = "";
            TextBox_NoOfCylinder.Text = "";
            // TextBox_OwnerName.Text = "";
            TextBox_Registration_Authority.Text = "";
            TextBox_SeatingCapcity.Text = "";
            TextBox_UnLandedWeight.Text = "";
            TextBox_Width.Text = "";
            TextBox_Number.Text = "";
            TextBox_Cost.Text = "";
            TextBox_RegistrationNo.Text = "";
            CheckBoxList_Vehicle_FuelType.DataBind();
        }

        protected bool hasval(string fid)
        {
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            SqlCommand command = new SqlCommand("SELECT Vehicle_Fuel_Id FROM Vehicle_Fuel WHERE (Vehicle_id = " + HiddenField_VehicleId_p10.Value + ") AND (Vehicle_FuelType_Id = " + fid + ")", con);
            SqlDataReader reader = command.ExecuteReader();
            bool val = reader.HasRows;
            reader.Close();
            con.Close();
            return val;
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            GridViewRow gv = (GridViewRow)(sender as Control).Parent.Parent;
            int i = gv.RowIndex;
            LinkButton LinkButton3 = (LinkButton)GridView5.Rows[i].FindControl("LinkButton3");
            HiddenField HiddenField2 = (HiddenField)GridView5.Rows[i].FindControl("HiddenField2");
            HiddenField_VehicleId_p10.Value = HiddenField2.Value;
            for (int lop = 0; lop < GridView5.Rows.Count; lop++)
            {
                LinkButton LinkButtona = (LinkButton)GridView5.Rows[lop].FindControl("LinkButton3");
                LinkButtona.ForeColor = System.Drawing.Color.Blue;
            }
            LinkButton3.ForeColor = System.Drawing.Color.Red;


            {
                ////Fetch Data

                SqlConnection con = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand("Select_Vehicle_For_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter v_id = new SqlParameter("@Vehicle_id", HiddenField_VehicleId_p10.Value);
                //cmd.Parameters.Add(v_id);
                //SqlDataReader r = cmd.ExecuteReader(new SqlParameter("@Vehicle_id", HiddenField_VehicleId_p10.Value));

                cmd.Parameters.Add(new SqlParameter("@Vehicle_id", HiddenField_VehicleId_p10.Value));
                con.Open();
                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {


                    TextBox_Registration_Authority.Text = Convert.ToString(r["Registration_Authority"]);
                    DropDownList_Vehicle_Class_Id.DataBind();
                    DropDownList_Vehicle_Class_Id.SelectedValue = Convert.ToString(r["Vehicle_Class_Id"]);
                    DropDownList_Vehicle_Condition_Id.DataBind();
                    DropDownList_Vehicle_Condition_Id.SelectedValue = Convert.ToString(r["Vehicle_Condition_Id"]);
                    DropDownList_ManufacturerId.DataBind();
                    DropDownList_ManufacturerId.SelectedValue = Convert.ToString(r["Maker_Name"]);
                    Vehicle_Type_Id.DataBind();
                    Vehicle_Type_Id.SelectedValue = Convert.ToString(r["Vehicle_Type_Id"]);
                    DropDownList_Vehicle_BodyTypeId.DataBind();
                    DropDownList_Vehicle_BodyTypeId.SelectedValue = Convert.ToString(r["Vehicle_BodyTypeId"]);

                    TextBox_Manufacture_Year.Text = Convert.ToString(r["Manufacture_Year"]);
                    DropDownList_ManufactureMonths.SelectedValue = Convert.ToString(r["Manufacture_Month"]);
                    TextBox_NoOfCylinder.Text = Convert.ToString(r["NoOfCylinder"]);
                    TextBox_HorsePower.Text = Convert.ToString(r["HorsePower"]);
                    TextBox_CubicCapacity.Text = Convert.ToString(r["CubicCapacity"]);
                    TextBox_ChassisNumber.Text = Convert.ToString(r["ChassisNumber"]);
                    TextBox_EnginNo.Text = Convert.ToString(r["EnginNo"]);
                    TextBox_SeatingCapcity.Text = Convert.ToString(r["SeatingCapcity"]);
                    TextBox_UnLandedWeight.Text = Convert.ToString(r["UnLandedWeight"]);
                    TextBox_Colour.Text = Convert.ToString(r["Colour"]);
                    TextBox_Lenght.Text = Convert.ToString(r["Lenght"]);
                    TextBox_Width.Text = Convert.ToString(r["Width"]);
                    TextBox_Height.Text = Convert.ToString(r["Height"]);
                    TextBox_InsuranceNumber.Text = Convert.ToString(r["InsuranceNumber"]);
                    WebDateChooser_Insurance_FromDate.Text = Convert.ToString(r["Insurance_FromDate"]);
                    HiddenField_Insurance_FromDate.Value = Convert.ToString(r["Insurance_FromDate"]);
                    WebDateChooser_Insurance_ToDate.Text = Convert.ToString(r["Insurance_ToDate"]);
                    HiddenField__Insurance_ToDate.Value = Convert.ToString(r["Insurance_ToDate"]);
                    TextBox_Number.Text = Convert.ToString(r["Number"]);
                    TextBox_RegistrationNo.Text = Convert.ToString(r["Registration_Number"]);
                    WebDateChooser_PurchasedDate.Text = Convert.ToString(r["Purchased_Date"]);
                    TextBox_Cost.Text = Convert.ToString(r["Cost"]);
                    //= Convert.ToString(r["Date_Time"]);
                    //= Convert.ToString(r["Emp_Id"]);


                }
                else
                {

                }
                con.Close();
                CheckBoxList_Vehicle_FuelType.DataBind();
                for (int ind = 0; ind < CheckBoxList_Vehicle_FuelType.Items.Count; ind++)
                {
                    if (hasval(CheckBoxList_Vehicle_FuelType.Items[ind].Value))
                    {
                        CheckBoxList_Vehicle_FuelType.Items[ind].Selected = true;
                        //HiddenField_Vehicle_FuelType_Id.Value = CheckBoxList_Vehicle_FuelType.Items[i].Value;
                        //string connection = Convert.ToString(ConfigurationManager.ConnectionStrings["TMSConnectionString"]);
                        //string Qry = "INSERT INTO Vehicle_Fuel (Vehicle_FuelType_Id, Vehicle_id, Emp_Id) VALUES (" + CheckBoxList_Vehicle_FuelType.Items[i].Value + "," + HiddenField_Vehicle_id.Value+ ","+Session["Emp_Id"]+")";
                        //SqlConnection con = new SqlConnection(connection);
                        //SqlCommand cmd = new SqlCommand(Qry, con);
                        //con.Open();
                        //cmd.ExecuteNonQuery();
                        //con.Close();
                        //SqlDataSource_Vehicle_FuelType_Id.Insert();
                    }
                }

                //////Fetch Data
            }
            Button_Cancel_P10.Visible = true;
            Button_Update_P10.Visible = true;
            Button_Save.Visible = false;
        }
        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            GridViewRow gv = (GridViewRow)(sender as Control).Parent.Parent;
            int i = gv.RowIndex;
            LinkButton LinkButton13 = (LinkButton)GridView5.Rows[i].FindControl("LinkButton13");
            HiddenField HiddenField2 = (HiddenField)GridView5.Rows[i].FindControl("HiddenField2");
            HiddenField_VehicleId_p10.Value = HiddenField2.Value;
            SqlDataSource_Save.Delete();
            GridView5.DataBind();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            TextBox_Manufacturer.Text = "";
            TextBox_Location.Text = "";
            TextBox_Phone.Text = "";
            Panel10.Visible = true;
            DropDownList_ManufacturerId.DataBind();
            Panel2.Visible = false;
        }
    }
}