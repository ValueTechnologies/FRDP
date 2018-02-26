using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class My_Monthly_Attendance : System.Web.UI.Page
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





                EmpAttendance();
                //Yearly_Attendance();
            }
        }


        private void EmpAttendance()
        {
            try
            {
                int emp = 0;
                try
                {
                    emp = Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)));

                }
                catch (Exception)
                {

                    emp = 0;
                }

                if (emp > 0)
                {
                    MyClass Fn = new MyClass();
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
            }
            catch 
            {

                lblEmp.Text = ""; 
            }


            EmployeeSalaries ds = new EmployeeSalaries();
            EmployeeSalariesTableAdapters.AttendanceDetailTableAdapter da = new EmployeeSalariesTableAdapters.AttendanceDetailTableAdapter();
            EmployeeSalariesTableAdapters.Select_Single_Employee_AttendanceTableAdapter da_emp = new EmployeeSalariesTableAdapters.Select_Single_Employee_AttendanceTableAdapter();
            da.Fill(ds.AttendanceDetail, Convert.ToInt32(DropDownList_Month.SelectedValue), Convert.ToInt32(DropDownList_year.SelectedValue), Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));

            da_emp.Fill(ds.Select_Single_Employee_Attendance, Convert.ToInt32(DropDownList_Month.SelectedValue), Convert.ToInt32(DropDownList_year.SelectedValue), Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
            GridView1.DataSource = ds.Tables["AttendanceDetail"];
            GridView1.DataBind();
            GridView2.DataSource = ds.Tables["Select_Single_Employee_Attendance"];
            GridView2.DataBind();
        }
        protected void Button_Search_Click(object sender, EventArgs e)
        {
            EmpAttendance();
           // Yearly_Attendance();
        }

        private void Yearly_Attendance()
        {

            EmployeeSalaries ds = new EmployeeSalaries();
            EmployeeSalariesTableAdapters.Year_MonthsTableAdapter da = new EmployeeSalariesTableAdapters.Year_MonthsTableAdapter();
            EmployeeSalariesTableAdapters.Employee_Monthly_AttendanceTableAdapter da_emp = new EmployeeSalariesTableAdapters.Employee_Monthly_AttendanceTableAdapter();

            da.Fill(ds.Year_Months);
            da_emp.Fill(ds.Employee_Monthly_Attendance, Convert.ToDecimal(DropDownList_year.SelectedValue), Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
            for (int x = 0; x < ds.Tables["Year_Months"].Rows.Count ; x++)
            {
                for (int y = 0; y < ds.Tables["Employee_Monthly_Attendance"].Rows.Count ; y++)
                {
                    if (Convert.ToString(ds.Tables["Year_Months"].Rows[x]["Month_No"]) == Convert.ToString(ds.Tables["Employee_Monthly_Attendance"].Rows[y]["Months"]))
                    {

                        if (Convert.ToString(ds.Tables["Employee_Monthly_Attendance"].Rows[y]["Shift"]) == "Day Shift")
                        {
                            ds.Tables["Year_Months"].Rows[x]["Day Shift"] = Convert.ToString(ds.Tables["Employee_Monthly_Attendance"].Rows[y]["Total"]);
                        }


                        if (Convert.ToString(ds.Tables["Employee_Monthly_Attendance"].Rows[y]["Shift"]) == "Night Shift")
                        {
                            ds.Tables["Year_Months"].Rows[x]["Night Shift"] = Convert.ToString(ds.Tables["Employee_Monthly_Attendance"].Rows[y]["Total"]);
                        }

                        if (Convert.ToString(ds.Tables["Employee_Monthly_Attendance"].Rows[y]["Shift"]) == "Full Fhift")
                        {
                            ds.Tables["Year_Months"].Rows[x]["Full Fhift"] = Convert.ToString(ds.Tables["Employee_Monthly_Attendance"].Rows[y]["Total"]);

                        }
                    }
                }
            }

            GridViewYearlyAttendance.DataSource = ds.Tables["Year_Months"];
            GridViewYearlyAttendance.DataBind();
        }

        protected void GridView2_PreRender(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count != 0)
            {
                for (int i = 0; i < GridView2.Rows.Count ; i++)
                {
                    if (GridView2.Rows[i].Cells[5].Text == "0")
                    {
                        GridView2.Rows[i].ForeColor = System.Drawing.Color.Red;
                    }
                }

            }


        }


    }
}