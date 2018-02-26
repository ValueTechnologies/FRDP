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

namespace FRDP
{
    public partial class TMS_VehicleSearch : System.Web.UI.Page
    {
        string connect = Convert.ToString(ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"]);
        string myQuery = @"
SELECT     Vehicle.Vehicle_id, Vehicle.Owner, Vehicle.Registration_Authority, Vehicle.Vehicle_Class_Id, Vehicle.Vehicle_Condition_Id, Vehicle.Vehicle_Type_Id, 
                      Vehicle.Vehicle_BodyTypeId, Vehicle.Maker_Name, ISNULL(Vehicle.Manufacture_Year, 0) AS Manufacture_Year, Vehicle.Manufacture_Month, Vehicle.ChassisNumber, 
                      ISNULL(Vehicle.EnginNo, 0) AS EnginNo, Vehicle.SeatingCapcity, Vehicle.Colour, Vehicle.InsuranceNumber, CONVERT(VARCHAR(20), Vehicle.Insurance_FromDate, 
                      103) AS Insurance_FromDate, CONVERT(VARCHAR(20), Vehicle.Insurance_ToDate, 103) AS Insurance_ToDate, Vehicle.Number, Vehicle_BodyType.BodyType, 
                      Vehicle_Class.Class, Vehicle_Condition.Condition, Vehicle_Type.VehicleTypeName, Vehicle.Cost, VehicleManufacturer.Manufacturer_Name, Vehicle.NoOfCylinder, 
                      Vehicle.HorsePower, Vehicle.CubicCapacity, Vehicle.UnLandedWeight, Vehicle.Width, Vehicle.Lenght, Vehicle.Height, ISNULL(Vehicle.Registration_Number, '0') 
                      AS Registration_Number, Vehicle.Purchased_Date, Driver_Allocation.Driver_Id, Officer_Allocation.Officer_Id, VehicleManufacturer.ManufacturerID, 
                       ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') 
                         + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') 
                         + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') 
                      AS Driver_Name, ISNULL(View_Employee_1.Prefix, '') + ' ' + ISNULL(View_Employee_1.EFName, '') + ' ' + ISNULL(View_Employee_1.EMName, '') 
                         + ' ' + ISNULL(View_Employee_1.ELName, '') + ' ' + ISNULL(View_Employee_1.Relation, '') + ' ' + ISNULL(View_Employee_1.RFName, '') 
                         + ' ' + ISNULL(View_Employee_1.RMName, '') + ' ' + ISNULL(View_Employee_1.RLName, '') AS Officer_Name
FROM         Vehicle INNER JOIN
                      Vehicle_Class ON Vehicle.Vehicle_Class_Id = Vehicle_Class.Vehicle_Class_Id INNER JOIN
                      Vehicle_Condition ON Vehicle.Vehicle_Condition_Id = Vehicle_Condition.Vehicle_Condition_Id INNER JOIN
                      Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN
                      Vehicle_Type ON Vehicle.Vehicle_Type_Id = Vehicle_Type.VehicleTypeID INNER JOIN
                      VehicleManufacturer ON Vehicle.Maker_Name = VehicleManufacturer.ManufacturerID LEFT OUTER JOIN
                      View_Employee AS View_Employee_1 INNER JOIN
                      Officer_Allocation ON View_Employee_1.EmpID = Officer_Allocation.Officer_Id ON Vehicle.Vehicle_id = Officer_Allocation.Vehicle_Id LEFT OUTER JOIN
                      View_Employee INNER JOIN
                      Driver_Allocation ON View_Employee.EmpID = Driver_Allocation.Driver_Id ON Vehicle.Vehicle_id = Driver_Allocation.Vehicle_Id
";
        string ThisWhere = "";
        bool myand = false;
        bool mywhere = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Int32 currentyear = Convert.ToInt32(DateTime.Now.Year);
                for (int i = 11; i >= 0; i--)
                {
                    DataBind();
                    DropDownList_Year.Items.Insert(0, Convert.ToString(currentyear - i));
                    DropDownList_Year.Items[0].Value = Convert.ToString(currentyear - i);
                    DataBind();
                }
                DropDownList_Year.DataBind();
                DropDownList_Year.Items.Insert(0, "Select Year");
                DropDownList_Year.Items[0].Value = "";
                DropDownList_Year.SelectedIndex = 0;

                DropDownList_Class.DataBind();
                DropDownList_Class.Items.Insert(0, "Select Class");
                DropDownList_Class.Items[0].Value = "";
                DropDownList_Class.SelectedIndex = 0;


                DropDownList_Driver.DataBind();
                DropDownList_Driver.Items.Insert(0, "Select Driver");
                DropDownList_Driver.Items[0].Value = "";
                DropDownList_Driver.SelectedIndex = 0;

                DropDownList_Officer.DataBind();
                DropDownList_Officer.Items.Insert(0, "Select Officer");
                DropDownList_Officer.Items[0].Value = "";
                DropDownList_Officer.SelectedIndex = 0;


                DropDownList_ManufacturerId.DataBind();
                DropDownList_ManufacturerId.Items.Insert(0, "Select Manufacturer");
                DropDownList_ManufacturerId.Items[0].Value = "";
                DropDownList_ManufacturerId.SelectedIndex = 0;
            }
        }
        protected void Button_Search_Click(object sender, EventArgs e)
        {
            if (TextBox_CC.Text != "")
            {
                if (mywhere)
                {
                    ThisWhere += " and (ISNULL(Vehicle.CubicCapacity, 0) LIKE '%" + TextBox_CC.Text + "%' )";
                }
                else
                {
                    ThisWhere += " WHERE (ISNULL(Vehicle.CubicCapacity, 0) LIKE '%" + TextBox_CC.Text + "%' )";
                    mywhere = true;
                    myand = true;
                }
            }

            if (TextBox_EnginNumber.Text != "")
            {

                if (mywhere)
                {
                    ThisWhere += "  AND (ISNULL(Vehicle.EnginNo, 0) LIKE '%" + TextBox_EnginNumber.Text + "%')";
                }
                else
                {
                    ThisWhere += "  WHERE (ISNULL(Vehicle.EnginNo, 0) LIKE '%" + TextBox_EnginNumber.Text + "%')";
                    mywhere = true;
                    myand = true;
                }

            }

            if (TextBox_INumber.Text != "")
            {
                if (mywhere)
                {

                    ThisWhere += " AND (ISNULL(Vehicle.InsuranceNumber, 0) LIKE '%" + TextBox_INumber.Text + "%' )";
                }
                else
                {
                    ThisWhere += " Where (ISNULL(Vehicle.InsuranceNumber, 0) LIKE '%" + TextBox_INumber.Text + "%' )";
                    mywhere = true;
                    myand = true;
                }

            }
            if (TextBox_RNumber.Text != "")
            {
                if (mywhere)
                {
                    ThisWhere += " and (ISNULL(Vehicle.Registration_Number, 0) LIKE '%" + TextBox_RNumber.Text + "%')";
                }
                else
                {
                    ThisWhere += " where (ISNULL(Vehicle.Registration_Number, 0) LIKE '%" + TextBox_RNumber.Text + "%')";
                    mywhere = true;
                    myand = true;
                }

            }

            if (TextBox_Vnumber.Text != "")
            {
                if (mywhere)
                {
                    ThisWhere += " AND (Vehicle.Number LIKE '%" + TextBox_Vnumber.Text + "%') ";
                }
                else
                {
                    ThisWhere += " WHERE (Vehicle.Number LIKE '%" + TextBox_Vnumber.Text + "%') ";
                    mywhere = true;
                    myand = true;
                }
            }
            if (DropDownList_Year.SelectedIndex != 0)
            {
                if (mywhere)
                {
                    ThisWhere += " AND (Vehicle.Manufacture_Year LIKE '%" + DropDownList_Year.SelectedValue + "%') ";

                }
                else
                {
                    ThisWhere += " WHERE (Vehicle.Manufacture_Year LIKE '%" + DropDownList_Year.SelectedValue + "%') ";
                    mywhere = true;
                    myand = true;
                }
            }
            if (DropDownList_Driver.SelectedIndex != 0)
            {
                if (mywhere)
                {
                    ThisWhere += " AND (Driver_Allocation.Driver_Id =" + DropDownList_Driver.SelectedValue + ") ";

                }
                else
                {
                    ThisWhere += " WHERE (Driver_Allocation.Driver_Id =" + DropDownList_Driver.SelectedValue + ") ";
                    mywhere = true;
                    myand = true;
                }
            }
            if (DropDownList_Officer.SelectedIndex != 0)
            {
                if (mywhere)
                {
                    ThisWhere += " AND (Officer_Allocation.Officer_Id =" + DropDownList_Officer.SelectedValue + ") ";

                }
                else
                {
                    ThisWhere += " WHERE (Officer_Allocation.Officer_Id =" + DropDownList_Officer.SelectedValue + ") ";
                    mywhere = true;
                    myand = true;
                }
            }
            if (DropDownList_Class.SelectedIndex != 0)
            {
                if (mywhere)
                {
                    ThisWhere += " AND (Vehicle.Vehicle_Class_Id =" + DropDownList_Class.SelectedValue + ") ";

                }
                else
                {
                    ThisWhere += " WHERE (Vehicle.Vehicle_Class_Id =" + DropDownList_Class.SelectedValue + ") ";
                    mywhere = true;
                    myand = true;
                }
            }
            if (DropDownList_ManufacturerId.SelectedIndex != 0)
            {
                if (mywhere)
                {
                    ThisWhere += " AND (VehicleManufacturer.ManufacturerID =" + DropDownList_ManufacturerId.SelectedValue + ") ";

                }
                else
                {
                    ThisWhere += " WHERE (VehicleManufacturer.ManufacturerID =" + DropDownList_ManufacturerId.SelectedValue + ") ";
                    mywhere = true;
                    myand = true;
                }
            }
            myQuery = myQuery + ThisWhere;

            SqlConnection con = new SqlConnection(connect);
            SqlCommand cmd = new SqlCommand(myQuery, con);
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            con.Open();
            da.SelectCommand = cmd;
            da.Fill(dt);
            con.Close();
            //GridView_VSearch.AutoGenerateColumns = false;
            //GridView_VSearch.AllowPaging = true;
            //GridView_VSearch.PageSize = 25;
            //GridView_VSearch.PageIndex = indx;
            GridView_VSearch.DataSource = dt;



            GridView_VSearch.DataBind();
            ThisWhere = "";
        }
        protected void DropDownList_Class_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList_Class.SelectedIndex == 0)
            {
                DropDownList_ManufacturerId.DataBind();
                DropDownList_ManufacturerId.Items.Insert(0, "Select Manufacturer");
                DropDownList_ManufacturerId.Items[0].Value = "";
                DropDownList_ManufacturerId.SelectedIndex = 0;
            }
            else
            {
                DropDownList_ManufacturerId.DataBind();
                DropDownList_ManufacturerId.Items.Insert(0, "Select Manufacturer");
                DropDownList_ManufacturerId.Items[0].Value = "";
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox_CC.Text = "";

            TextBox_EnginNumber.Text = "";
            TextBox_INumber.Text = "";
            TextBox_RNumber.Text = "";
            TextBox_Vnumber.Text = "";
            DropDownList_Year.SelectedIndex = 0;
            DropDownList_Class.SelectedIndex = 0;
            DropDownList_Driver.SelectedIndex = 0;
            DropDownList_Officer.SelectedIndex = 0;
            DropDownList_ManufacturerId.DataBind();
            DropDownList_ManufacturerId.Items.Insert(0, "Select Manufacturer");
            DropDownList_ManufacturerId.Items[0].Value = "";
            DropDownList_ManufacturerId.SelectedIndex = 0;

        }
    }

}