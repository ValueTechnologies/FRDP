using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class Employee_Transfer_Report : System.Web.UI.Page
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
                DataSet ddd = Fn.FillDSet(@"SELECT        TblHResources.User_ID, TblHResources.Full_Name, TblHResources.ContactNos,
                         CASE WHEN TblHResources.PhotoExtension IS NULL THEN '0.png' ELSE CAST(TblHResources.User_ID AS VARCHAR(10)) 
                         + 'B' + TblHResources.PhotoExtension END AS PhotoExtension, 
						 'FRDP-EMP-' + RIGHT('000' + TblHResources.EmpNo, 3) AS EmpNo,
TblHResources.CNIC,
 TblHResources.FatherName,
 tblDesig.NAME AS Designations,
 tbl_Company.CompanyName AS Area,
  Shift.Shift
          
FROM            TblHResources INNER JOIN
                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID INNER JOIN
                         tblDesig ON TblHResources.DesignationID = tblDesig.ID INNER JOIN
                         tblDept ON TblHResources.DeptID = tblDept.ID INNER JOIN
                         Shift ON TblHResources.tblEmpShiftID = Shift.Shift_ID
WHERE     (TblHResources.U_Status = 1) and    (TblHResources.User_ID = " + emp + ")");


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

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SetMenue.SET();
        }

        protected void ddlEmp_DataBound(object sender, EventArgs e)
        {
            EmpAttendance();
        }



        protected void ddlEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            EmpAttendance();
        }
    }
}