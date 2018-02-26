using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace FRDP
{
    public partial class EmployeeParticulars : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string AllBanks()
        {
            return Fn.Data2Json("SELECT BankID, Bank FROM tbl_Banks order by Bank");
        }

        [WebMethod]
        public static string AllddlDirectorate()
        {
            return Fn.Data2Json("SELECT DirectorateID, Directorate FROM tbl_Directorate");
        }


        [WebMethod]
        public static string SaveEmpParticular(string Vals)
        {
            var frmdata = Vals;
            string[] d = frmdata.Split('½');
            Fn.Exec(@"UPDATE       tblEmployee
SET                BPay ='" + d[0] + @"'
WHERE        (EmpID =  '" + d[23] + @"')");
            return Fn.Exec("INSERT INTO tbl_PayrollEmployeeParticulars (BasicPay, RateOfIncrement, MinimumPayScale, DirectorateId, BankId, BankAccountNo, ECRPageNo, CarMaintain, TransferStatus, MoveOver, PickAndDrop, LeaveHaldAverage, UseGovtHouse, Is_Muslim, DepotationAllowance, PersonalLoan, GPFPercentage, GRLS, GRLSInstallments, HouseBuildingAdvance, BasicPayNov2010, BasicPayNov2011, BasicPayJun2015, EmpID) VALUES ('" + d[0] + "','" + d[1] + "','" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "','" + d[12] + "','" + d[13] + "','" + d[14] + "','" + d[15] + "','" + d[16] + "','" + d[17] + "','" + d[18] + "','" + d[19] + "','" + d[20] + "','" + d[21] + "','" + d[22] + "','" + d[23] + "')");
        }



        [WebMethod]
        public static string SearchEmployeePayrollDataByID(string EmpID)
        {
            return Fn.Data2Json(@"SELECT        tblEmployee.BPS, tbl_PayrollEmployeeParticulars.BasicPay, tbl_PayrollEmployeeParticulars.RateOfIncrement, tbl_PayrollEmployeeParticulars.MinimumPayScale, 
                         tbl_PayrollEmployeeParticulars.DirectorateId, tbl_PayrollEmployeeParticulars.BankId, tbl_PayrollEmployeeParticulars.BankAccountNo, tbl_PayrollEmployeeParticulars.ECRPageNo, 
                         tbl_PayrollEmployeeParticulars.CarMaintain, tbl_PayrollEmployeeParticulars.TransferStatus, tbl_PayrollEmployeeParticulars.MoveOver, tbl_PayrollEmployeeParticulars.PickAndDrop, 
                         tbl_PayrollEmployeeParticulars.LeaveHaldAverage, tbl_PayrollEmployeeParticulars.UseGovtHouse, tbl_PayrollEmployeeParticulars.Is_Muslim, tbl_PayrollEmployeeParticulars.DepotationAllowance, 
                         tbl_PayrollEmployeeParticulars.PersonalLoan, tbl_PayrollEmployeeParticulars.GPFPercentage, tbl_PayrollEmployeeParticulars.GRLS, tbl_PayrollEmployeeParticulars.GRLSInstallments, 
                         tbl_PayrollEmployeeParticulars.HouseBuildingAdvance, tbl_PayrollEmployeeParticulars.BasicPayNov2010, tbl_PayrollEmployeeParticulars.BasicPayNov2011, 
                         tbl_PayrollEmployeeParticulars.BasicPayJun2015
FROM            tbl_PayrollEmployeeParticulars INNER JOIN
                         tblEmployee ON tblEmployee.EmpID = tbl_PayrollEmployeeParticulars.EmpID Where tbl_PayrollEmployeeParticulars.EmpID = " + EmpID);
        }




        [WebMethod]
        public static string UpdateEmployeePayrollDataByID(string Vals)
        {
            var frmdata = Vals;
            string[] d = frmdata.Split('½');
            Fn.Exec(@"UPDATE       tblEmployee
SET                BPay ='" + d[0] + @"'
WHERE        (EmpID =  '" + d[23] + @"')");
            return Fn.Exec("UPDATE tbl_PayrollEmployeeParticulars SET BasicPay = '" + d[0] + "', RateOfIncrement = '" + d[1] + "', MinimumPayScale = '" + d[2] + "', DirectorateId = '" + d[3] + "', BankId = '" + d[4] + "', BankAccountNo = '" + d[5] + "', ECRPageNo = '" + d[6] + "', CarMaintain = '" + d[7] + "', TransferStatus = '" + d[8] + "', MoveOver = '" + d[9] + "', PickAndDrop = '" + d[10] + "', LeaveHaldAverage = '" + d[11] + "', UseGovtHouse = '" + d[12] + "', Is_Muslim = '" + d[13] + "', DepotationAllowance = '" + d[14] + "', PersonalLoan = '" + d[15] + "', GPFPercentage = '" + d[16] + "', GRLS = '" + d[17] + "', GRLSInstallments = '" + d[18] + "', HouseBuildingAdvance = '" + d[19] + "', BasicPayNov2010 = '" + d[20] + "', BasicPayNov2011 = '" + d[21] + "', BasicPayJun2015 = '" + d[22] + "' where  EmpID = '" + d[23] + "'");
        }



        [WebMethod]
        public static string SearchEmployees(string empno, string name, string DepartmentID, string DesignationID)
        {
            return Fn.Data2Json("usp_SearchEmployeeBasicDataPayroll '" + empno + "', '" + name + "', '" + DepartmentID + "', '" + DesignationID + "'");
        }







    }
}