using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class Monthly_Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownList_year.Items.Clear();
                DropDownList_Month.SelectedValue = Convert.ToString(DateTime.Today.Month);

                for (int count = 0; count < (DateTime.Today.Year + 5) - 2015; count++)
                {
                    ListItem l = new ListItem() { Text = Convert.ToString(2015 + count), Value = Convert.ToString(2015 + count) };
                    DropDownList_year.Items.Insert(count, l);
                }
                DropDownList_year.SelectedValue = Convert.ToString(DateTime.Today.Year);

            }
        }
        private void EmpAttendance()
        {
            int emp = 0;
            try
            {
                emp = Convert.ToInt32(ddlEmp.SelectedValue);

            }
            catch (Exception)
            {

                emp = 0;
            }

            if (emp>0)
            {
                MyClass Fn =  new MyClass();
                DataSet ddd = Fn.FillDSet(@"SELECT        tblEmployee.EmpID User_ID, ISNULL(tblEmployee.FName,'') + ' ' + ISNULL(tblEmployee.LName,'') Full_Name, tblEmployee.Mobile,
                         CASE WHEN tblEmployee.PhotoExtension IS NULL THEN '0.png' ELSE CAST(tblEmployee.EmpID AS VARCHAR(10)) 
                         + 'B' + tblEmployee.PhotoExtension END AS PhotoExtension, 
						 'FRDP-EMP-' + RIGHT('000000' + tblEmployee.EmpNo, 6) AS EmpNo,
tblEmployee.CNIC,
 tblEmployee.Father,
 tblDesig.NAME AS Designations,
 tbl_Company.CompanyName AS Area,
  Shift.Shift
          
FROM            tblEmployee INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tblDept ON tblEmployee.tblDept = tblDept.ID INNER JOIN
                         Shift ON tblEmployee.tblEmpShiftID = Shift.Shift_ID
WHERE        (tblEmployee.EmpID = " + emp + ")");


                lblEmp.Text = @"  <table class='table'>
            <tbody>
                <tr class='success'>
                    <td rowspan='3' style='width: 85px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;'>
                        <img id='imgEmpPhoto' src='Uploads/EmployeePhoto/" + ddd.Tables[0].Rows[0]["PhotoExtension"] + @"' alt='' style='width: 75px;' class='image marginR10' /></td>
                    <td style='text-align: left; width: 80px;'><strong>Emp#</strong></td>
                    <td style='text-align: left;' id='t1'>" + ddd.Tables[0].Rows[0]["EmpNo"] + @"</td>
                    <td style='text-align: left; width: 95px;'><strong>Name</strong></td>
                    <td style='text-align: left; border-right: 1px solid #c4c4c4;' id='t2'>" + ddd.Tables[0].Rows[0]["Full_Name"] + @"</td>
                </tr>
                <tr class='error'>
                    <td style='text-align: left; border-left: 1px solid #c4c4c4;'><strong>CNIC</strong></td>
                    <td style='text-align: left;' id='t3'>" + ddd.Tables[0].Rows[0]["CNIC"] + @"</td>
                    <td style='text-align: left;'><strong>Father Name</strong></td>
                    <td style='text-align: left; border-right: 1px solid #c4c4c4;' id='t4'>" + ddd.Tables[0].Rows[0]["Father"] + @"</td>
                </tr>
                <tr class='info'>

                    <td style='text-align: left;border-left: 1px solid #c4c4c4;'><strong>Designation</strong></td>
                    <td style='text-align: left;' id='t5'>" + ddd.Tables[0].Rows[0]["Designations"] + @"</td>
                    <td style='text-align: left;'><strong>Appointed At</strong></td>
                    <td style='text-align: left; border-right: 1px solid #c4c4c4;' id='t6'>" + ddd.Tables[0].Rows[0]["Area"] + @"</td>
                </tr>

                <tr class='error'>
                    <td style='border-left: 1px solid #c4c4c4;'>&nbsp;</td><td style='text-align: left;'><strong>Shift</strong></td>
                    <td style='text-align: left;' id='t5'>" + ddd.Tables[0].Rows[0]["Shift"] + @"</td>
                    <td style='text-align: left;'><strong>Contact</strong></td>
                    <td style='text-align: left; border-right: 1px solid #c4c4c4;' id='t6'>" + ddd.Tables[0].Rows[0]["Mobile"] + @"</td>
                </tr>

            </tbody>
        </table>";
            }
            else
            {
                lblEmp.Text = "";
            }
            EmployeeSalaries ds = new EmployeeSalaries();
            EmployeeSalariesTableAdapters.AttendanceDetailTableAdapter da = new EmployeeSalariesTableAdapters.AttendanceDetailTableAdapter();
            EmployeeSalariesTableAdapters.Select_Single_Employee_AttendanceTableAdapter da_emp = new EmployeeSalariesTableAdapters.Select_Single_Employee_AttendanceTableAdapter();
            da.Fill(ds.AttendanceDetail, Convert.ToInt32(DropDownList_Month.SelectedValue), Convert.ToInt32(DropDownList_year.SelectedValue), emp);

            da_emp.Fill(ds.Select_Single_Employee_Attendance, Convert.ToInt32(DropDownList_Month.SelectedValue), Convert.ToInt32(DropDownList_year.SelectedValue), emp);
            GridView1.DataSource = ds.Tables["AttendanceDetail"];
            GridView1.DataBind();
            GridView2.DataSource = ds.Tables["Select_Single_Employee_Attendance"];
            GridView2.DataBind();
        }
        protected void btnShowRpt_Click(object sender, EventArgs e)
        {
            EmpAttendance();
        }

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SetMenue.SET();
        }

        protected void ddlEmp_DataBound(object sender, EventArgs e)
        {
            EmpAttendance();
        }

        protected void GridView2_PreRender(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count != 0)
            {
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    if (GridView2.Rows[i].Cells[5].Text == "0")
                    {
                        GridView2.Rows[i].ForeColor = System.Drawing.Color.Red;
                    }
                }

            }
        }

        protected void ddlEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            EmpAttendance();
        }

        protected void ddlOfficeTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlOfficeTypes.SelectedValue == "3")
            //{
            //    lblDsu.Visible = true;
            //    ddlDSU.Visible = true;
            //}
            //else
            //{
            //    lblDsu.Visible = false;
            //    ddlDSU.Visible = false;
            //}
        }



        protected void ddlLocation_DataBound(object sender, EventArgs e)
        {
            ddlGenerator.DataBind();
        }

        protected void ddlGenerator_DataBound(object sender, EventArgs e)
        {
            ddlEmp.DataBind();
        }
    }
}