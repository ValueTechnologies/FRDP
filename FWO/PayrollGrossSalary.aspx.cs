using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


namespace FRDP
{
    public partial class PayrollGrossSalary : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string GetBasicSalaryData(string EmpID)
        {
//            return Fn.Data2Json(@"SELECT        tbl_PayrollEmployeeParticulars.EmpID, tbl_PayrollEmployeeParticulars.BasicPay, tbl_PayrollEmployeeParticulars.RateOfIncrement, tbl_PayrollEmployeeParticulars.MinimumPayScale, 
//                         tbl_PayrollEmployeeParticulars.DirectorateId, tbl_PayrollEmployeeParticulars.BankId, tbl_PayrollEmployeeParticulars.BankAccountNo, tbl_PayrollEmployeeParticulars.ECRPageNo, 
//                         tbl_PayrollEmployeeParticulars.CarMaintain, tbl_PayrollEmployeeParticulars.TransferStatus, tbl_PayrollEmployeeParticulars.MoveOver, tbl_PayrollEmployeeParticulars.PickAndDrop, 
//                         tbl_PayrollEmployeeParticulars.LeaveHaldAverage, tbl_PayrollEmployeeParticulars.UseGovtHouse, tbl_PayrollEmployeeParticulars.Is_Muslim, tbl_PayrollEmployeeParticulars.DepotationAllowance, 
//                         tbl_PayrollEmployeeParticulars.PersonalLoan, tbl_PayrollEmployeeParticulars.GPFPercentage, tbl_PayrollEmployeeParticulars.GRLS, tbl_PayrollEmployeeParticulars.GRLSInstallments, 
//                         tbl_PayrollEmployeeParticulars.HouseBuildingAdvance, tbl_PayrollEmployeeParticulars.BasicPayNov2010, tbl_PayrollEmployeeParticulars.BasicPayNov2011, tbl_PayrollEmployeeParticulars.BasicPayJun2015,
//                          tblEmployee.tblDesigID as DesignationID, tbl_PayrollEmployeeParticulars.IncomeTax, tbl_PayrollEmployeeParticulars.ConveyanceAllowance
//FROM            tbl_PayrollEmployeeParticulars INNER JOIN
//                         tblEmployee ON tblEmployee.EmpId = tbl_PayrollEmployeeParticulars.EmpID WHERE  tbl_PayrollEmployeeParticulars.EmpID = " + EmpID);



            return Fn.Data2Json(@"SELECT        CashAdvanceLoan, HouseBuildingAdvance, MotorCycleAdvance, CarAdvance, PersonnelInstalment, GroupInsurance, IncomeTax, GPFAdvance, GPFContribution, Arrears, ProjectBaseAllowance, 
                         DeputationAllowance, EntertainmentAllowance, ComputerAllowance, MiscEidAdvance, MedicalAllowance, ConveyanceAllowance, HouseRentAllowance, BPay, EmpID
FROM            tblEmployee
WHERE        EmpID = " + EmpID);
        }


        [WebMethod]
        public static string SaveSalary(string SalaryID, string CompleteData)
        {
            string[] d = CompleteData.Split('½');
            if (SalaryID == "0")
            {
                string tot = Fn.GetRecords(@"SELECT ISNULL(COUNT(*),0) AS CNT FROM  tbl_PayrollEmployeeMonthlySalary Where EmpID = '" + d[0] + @"' and DATEPART(month, SalaryDate) = DATEPART(month, CONVERT(DATETIME,'" + d[1] + @"')) and DATEPART(Year, SalaryDate) = DATEPART(Year, CONVERT(DATETIME,'" + d[1] + @"'))")[0];
                if (tot=="0")
                {
                    string id = Fn.ExenID(@"INSERT INTO tbl_PayrollEmployeeMonthlySalary (EmpID, SalaryDate, BasicPay, HouseRent, ConveyanceAllowance, MedicalAllowCurrentBPay, MiscEidAdvance, ComputerAllowance, EntertainmentAllowance, DeputationAllowance, ProjectBaseAllowance, Arrears, 
                         GrossSalary, GPF, GPFInstallments, IncomeTax, GroupInsurance, PersonnelInstalment, CarAdvance, MotorCycle, HouseBuilding, CashAdvanceLoan, TotalDeductions, NetSalary, Is_SemiAutoSalary) 
                                    VALUES ('" + d[0] + "','" + d[1] + "','" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "','" + d[12] + "','" + d[13] + "','" + d[14] + "','" + d[15] + "','" + d[16] + "','" + d[17] + "','" + d[18] + "','" + d[19] + "','" + d[20] + "','" + d[21] + "','" + d[22] + "','" + d[23] + "','0' ); Select Scope_Identity();");
                    Fn.Exec("usp_PayrollGPFBalanceUpdate '" + d[0] + "', '" + d[13] + "', '" + d[1] + "'");
                    //Fn.Exec("UPDATE tbl_PayrollEmployeeParticulars SET  IncomeTax = '" + d[25] + "' where EmpID = '" + d[0] + "'");

                    Fn.Exec(@"UPDATE       tblEmployee
SET                BPay ='"+d[2]+"', HouseRentAllowance ='"+d[3]+"', ConveyanceAllowance ='"+d[4]+"', MedicalAllowance ='"+d[5]+"', MiscEidAdvance ='"+d[6]+"', ComputerAllowance ='"+d[7]+"', EntertainmentAllowance ='"+d[8]+"', DeputationAllowance ='"+d[9]+"', ProjectBaseAllowance ='"+d[10]+"', Arrears ='"+d[11]+@"', 
                         GPFContribution ='"+d[13]+"', GPFAdvance ='"+d[14]+"', IncomeTax ='"+d[15]+"', GroupInsurance ='"+d[16]+"', PersonnelInstalment ='"+d[17]+"', CarAdvance ='"+d[18]+"', MotorCycleAdvance ='"+d[19]+"', HouseBuildingAdvance ='"+d[20]+"', CashAdvanceLoan ='"+d[21]+@"'
						 where EmpID = '"+d[0]+"'");
                    return id;  
                }
                else
                {
                    return "-1";
                }

            }
            else
            {
                Fn.Exec(@"UPDATE tbl_PayrollEmployeeMonthlySalary SET EmpID = '" + d[0] + "', SalaryDate = '" + d[1] + "', BasicPay = '" + d[2] + "', HouseRent = '" + d[3] + "', ConveyanceAllowance = '" + d[4] + "', IntegratedAllowSplPay = '" + d[5] + "', MedicalAllowCurrentBPay = '" + d[6] + "', AdhocAllowance7Point5 = '" + d[7] + "', MiscEidAdvance = '" + d[8] + "', ComputerAllowance = '" + d[9] + "', AdhocAllowanceEmpty = '" + d[10] + "', EntertainmentAllowance = '" + d[11] + "', AdhocRelief10Percent = '" + d[12] + "', DeputationAllowance = '" + d[13] + "', QualificationAllowance = '" + d[14] + "', AAllow2013_10Percent = '" + d[15] + "', SplReliefAllowance30Percent = '" + d[16] + "', DrivingAllowance = '" + d[17] + "', AdhocAllowBPNov10_50percent = '" + d[18] + "', Arrears = '" + d[19] + "', SplAllowJuneBasic20Percent = '" + d[20] + "', GrossSalary = '" + d[21] + "', GPF = '" + d[22] + "', GPFInstallments = '" + d[23] + "', StaffLedger = '" + d[24] + "', IncomeTax = '" + d[25] + "', TradeTax = '" + d[26] + "', GroupInsurance = '" + d[27] + "', PersonnelInstalment = '" + d[28] + "', GRLSLoan = '" + d[29] + "', HajFund = '" + d[30] + "', BenevolentFund = '" + d[31] + "', CarAdvance = '" + d[32] + "', MotorCycle = '" + d[33] + "', HouseBuilding = '" + d[34] + "', SalarySlipCharges = '" + d[35] + "', PUTMicroFinance = '" + d[36] + "', UnionFund = '" + d[37] + "', Shop = '" + d[38] + "', EidAdvanceSPL = '" + d[39] + "', GovtResidence10Percent = '" + d[40] + "', TotalDeductions = '" + d[41] + "', NetSalary = '" + d[42] + "' where MonthlySalaryID = " + SalaryID);
                Fn.Exec("usp_PayrollGPFBalanceUpdate '" + d[0] + "', '" + d[22] + "', '" + d[1] + "'");
                Fn.Exec("UPDATE tbl_PayrollEmployeeParticulars SET IncomeTax = '" + d[25] + "' where EmpID = '" + d[0] + "'");
                return SalaryID;
            }
        }







    }
}