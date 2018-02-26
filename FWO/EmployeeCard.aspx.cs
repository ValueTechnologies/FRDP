using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class EmployeeCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                DataSet ddd = Fn.FillDSet(@"SELECT        tblEmployee.EmpID AS User_ID, CONCAT(tblEmployee.FName, ' ', tblEmployee.LName) AS Full_Name, tblEmployee.Mobile AS ContactNos,
                         CASE WHEN tblEmployee.PhotoExtension IS NULL THEN '0.png' ELSE CAST(tblEmployee.EmpId AS VARCHAR(10)) 
                         + 'B' + tblEmployee.PhotoExtension END AS PhotoExtension, 
						 'FRDP-EMP-' + RIGHT('000' + tblEmployee.EmpNo, 3) AS EmpNo,
tblEmployee.CNIC,
 tblEmployee.Father AS FatherName,
 tblDesig.NAME AS Designations,
 tbl_Company.CompanyName AS Area,
  Shift.Shift, tblDept.Name as DepartmentName,tblEmployee.Gender
          
FROM            tblEmployee INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tblDept ON tblEmployee.tblDept = tblDept.ID INNER JOIN
                         Shift ON tblEmployee.tblEmpShiftID = Shift.Shift_ID
WHERE      (tblEmployee.EmpID = " + emp + ")");

                if (ddd.Tables[0].Rows.Count > 0)
                {
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
                    <td style='text-align: left; border-right: 1px solid #c4c4c4;' id='t4'>" + ddd.Tables[0].Rows[0]["FatherName"] + @"</td>
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
                    <td style='text-align: left; border-right: 1px solid #c4c4c4;' id='t6'>" + ddd.Tables[0].Rows[0]["ContactNos"] + @"</td>
                </tr>

            </tbody>
        </table>";
                    ReportViewer1.LocalReport.DataSources.Clear();
                    String path = Server.MapPath("EmployeeCardRpt.rdlc");
                    string img = new Uri(Server.MapPath("Uploads/EmployeePhoto/" + ddd.Tables[0].Rows[0]["PhotoExtension"])).AbsoluteUri;
                    ReportViewer1.LocalReport.ReportPath = path;
                    ReportParameter[] parameters = new ReportParameter[8];
                    parameters[0] = new ReportParameter("ReportParameter1", Convert.ToString(ddd.Tables[0].Rows[0]["Full_Name"]));
                    parameters[1] = new ReportParameter("ReportParameter2", Convert.ToString(ddd.Tables[0].Rows[0]["Designations"]));
                    parameters[2] = new ReportParameter("ReportParameter3", "Employee No  " + Convert.ToString(ddd.Tables[0].Rows[0]["EmpNo"]));
                    parameters[3] = new ReportParameter("ReportParameter4", "Department  " + Convert.ToString(ddd.Tables[0].Rows[0]["DepartmentName"]));
                    parameters[4] = new ReportParameter("ReportParameter5", "CNIC  " + Convert.ToString(ddd.Tables[0].Rows[0]["CNIC"]));
                    parameters[5] = new ReportParameter("ReportParameter6", "Blood Group A+");
                    parameters[6] = new ReportParameter("ReportParameter7", "Gender  " + Convert.ToString(ddd.Tables[0].Rows[0]["Gender"]));
                    parameters[7] = new ReportParameter("ReportParameter8", img);
                    ReportViewer1.LocalReport.EnableExternalImages = true;
                    ReportViewer1.LocalReport.SetParameters(parameters);
                    ReportViewer1.KeepSessionAlive = true;

                    ReportViewer1.LocalReport.Refresh();
                }
            }
            else
            {
                lblEmp.Text = "";
            }

        }
        protected void btnShowRpt_Click(object sender, EventArgs e)
        {
            EmpAttendance();
        }

     

        protected void ddlEmp_DataBound(object sender, EventArgs e)
        {
            EmpAttendance();
        }



        protected void ddlEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            EmpAttendance();
        }

        protected void ddlOfficeTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlOfficeTypes.SelectedValue=="3")
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