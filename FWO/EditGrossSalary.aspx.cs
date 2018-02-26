using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace FRDP
{
    public partial class EditGrossSalary : System.Web.UI.Page
    {
        static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetPrevousSalary(string EmpID, string Month, string Year)
        {
            //return Fn.Data2Json("SELECT MonthlySalaryID, EmpID, Format(SalaryDate, 'dd - MMMM - yyyy') as SalaryDate, BasicPay, HouseRent, ConveyanceAllowance, IntegratedAllowSplPay, MedicalAllowCurrentBPay, AdhocAllowance7Point5, MiscEidAdvance, ComputerAllowance, AdhocAllowanceEmpty, EntertainmentAllowance, AdhocRelief10Percent, DeputationAllowance, QualificationAllowance, AAllow2013_10Percent, SplReliefAllowance30Percent, DrivingAllowance, AdhocAllowBPNov10_50percent, Arrears, SplAllowJuneBasic20Percent, GrossSalary, GPF, GPFInstallments, StaffLedger, IncomeTax, TradeTax, GroupInsurance, PersonnelInstalment, GRLSLoan, HajFund, BenevolentFund, CarAdvance, MotorCycle, HouseBuilding, SalarySlipCharges, PUTMicroFinance, UnionFund, Shop, EidAdvanceSPL, GovtResidence10Percent, TotalDeductions, NetSalary, Is_SemiAutoSalary FROM  tbl_PayrollEmployeeMonthlySalary Where EmpID = '" + EmpID + "' and DATEPART(month, SalaryDate) = '" + Month + "' and DATEPART(Year, SalaryDate) = '" + Year + "'");
            return Fn.Data2Json(@"SELECT        MonthlySalaryID, EmpID, Format(SalaryDate, 'dd - MMMM - yyyy') AS SalaryDate, BasicPay, HouseRent, ConveyanceAllowance, IntegratedAllowSplPay, MedicalAllowCurrentBPay, AdhocAllowance7Point5, 
                         MiscEidAdvance, ComputerAllowance, AdhocAllowanceEmpty, EntertainmentAllowance, AdhocRelief10Percent, DeputationAllowance, QualificationAllowance, AAllow2013_10Percent, SplReliefAllowance30Percent, 
                         DrivingAllowance, AdhocAllowBPNov10_50percent, Arrears, SplAllowJuneBasic20Percent, GrossSalary, GPF, GPFInstallments, StaffLedger, IncomeTax, TradeTax, GroupInsurance, PersonnelInstalment, 
                         GRLSLoan, HajFund, BenevolentFund, CarAdvance, MotorCycle, HouseBuilding, SalarySlipCharges, PUTMicroFinance, UnionFund, Shop, EidAdvanceSPL, GovtResidence10Percent, TotalDeductions, NetSalary, 
                         Is_SemiAutoSalary, ProjectBaseAllowance, CashAdvanceLoan
FROM            tbl_PayrollEmployeeMonthlySalary Where EmpID = '" + EmpID + "' and DATEPART(month, SalaryDate) = '" + Month + "' and DATEPART(Year, SalaryDate) = '" + Year + "'");

        }


        [WebMethod]
        public static string SaveSalary(string SalaryID, string CompleteData)
        {
            string[] d = CompleteData.Split('½');
            if (SalaryID == "0")
            {
                string id = Fn.ExenID(@"INSERT INTO tbl_PayrollEmployeeMonthlySalary (EmpID, SalaryDate, BasicPay, HouseRent, ConveyanceAllowance, IntegratedAllowSplPay, MedicalAllowCurrentBPay, AdhocAllowance7Point5, MiscEidAdvance, ComputerAllowance, AdhocAllowanceEmpty, EntertainmentAllowance, AdhocRelief10Percent, DeputationAllowance, QualificationAllowance, AAllow2013_10Percent, SplReliefAllowance30Percent, DrivingAllowance, AdhocAllowBPNov10_50percent, Arrears, SplAllowJuneBasic20Percent, GrossSalary, GPF, GPFInstallments, StaffLedger, IncomeTax, TradeTax, GroupInsurance, PersonnelInstalment, GRLSLoan, HajFund, BenevolentFund, CarAdvance, MotorCycle, HouseBuilding, SalarySlipCharges, PUTMicroFinance, UnionFund, Shop, EidAdvanceSPL, GovtResidence10Percent, TotalDeductions, NetSalary, Is_SemiAutoSalary) 
                                    VALUES ('" + d[0] + "','" + d[1] + "','" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "','" + d[12] + "','" + d[13] + "','" + d[14] + "','" + d[15] + "','" + d[16] + "','" + d[17] + "','" + d[18] + "','" + d[19] + "','" + d[20] + "','" + d[21] + "','" + d[22] + "','" + d[23] + "','" + d[24] + "','" + d[25] + "','" + d[26] + "','" + d[27] + "','" + d[28] + "','" + d[29] + "','" + d[30] + "','" + d[31] + "','" + d[32] + "','" + d[33] + "','" + d[34] + "','" + d[35] + "','" + d[36] + "','" + d[37] + "','" + d[38] + "','" + d[39] + "','" + d[40] + "','" + d[41] + "','" + d[42] + "','0' ); Select Scope_Identity();");
                Fn.Exec("usp_PayrollGPFBalanceUpdate '" + d[0] + "', '" + d[22] + "', '" + d[1] + "'");
                return id;
            }
            else
            {
                //=========>Fn.Exec("update tbl_PayrollGPFBalance set Balance = Balance + (Select (-1) * GPF from tbl_PayrollEmployeeMonthlySalary where MonthlySalaryID = '" + SalaryID + "')  where EmpID = " + d[0]);
                
                //Fn.Exec(@"UPDATE tbl_PayrollEmployeeMonthlySalary SET EmpID = '" + d[0] + "', SalaryDate = '" + d[1] + "', BasicPay = '" + d[2] + "', HouseRent = '" + d[3] + "', ConveyanceAllowance = '" + d[4] + "', IntegratedAllowSplPay = '" + d[5] + "', MedicalAllowCurrentBPay = '" + d[6] + "', AdhocAllowance7Point5 = '" + d[7] + "', MiscEidAdvance = '" + d[8] + "', ComputerAllowance = '" + d[9] + "', AdhocAllowanceEmpty = '" + d[10] + "', EntertainmentAllowance = '" + d[11] + "', AdhocRelief10Percent = '" + d[12] + "', DeputationAllowance = '" + d[13] + "', QualificationAllowance = '" + d[14] + "', AAllow2013_10Percent = '" + d[15] + "', SplReliefAllowance30Percent = '" + d[16] + "', DrivingAllowance = '" + d[17] + "', AdhocAllowBPNov10_50percent = '" + d[18] + "', Arrears = '" + d[19] + "', SplAllowJuneBasic20Percent = '" + d[20] + "', GrossSalary = '" + d[21] + "', GPF = '" + d[22] + "', GPFInstallments = '" + d[23] + "', StaffLedger = '" + d[24] + "', IncomeTax = '" + d[25] + "', TradeTax = '" + d[26] + "', GroupInsurance = '" + d[27] + "', PersonnelInstalment = '" + d[28] + "', GRLSLoan = '" + d[29] + "', HajFund = '" + d[30] + "', BenevolentFund = '" + d[31] + "', CarAdvance = '" + d[32] + "', MotorCycle = '" + d[33] + "', HouseBuilding = '" + d[34] + "', SalarySlipCharges = '" + d[35] + "', PUTMicroFinance = '" + d[36] + "', UnionFund = '" + d[37] + "', Shop = '" + d[38] + "', EidAdvanceSPL = '" + d[39] + "', GovtResidence10Percent = '" + d[40] + "', TotalDeductions = '" + d[41] + "', NetSalary = '" + d[42] + "' where MonthlySalaryID = " + SalaryID);

                Fn.Exec(@"UPDATE tbl_PayrollEmployeeMonthlySalary SET 
EmpID ='"+d[0]+@"', BasicPay ='"+d[1]+@"', HouseRent ='"+d[2]+@"', ConveyanceAllowance ='"+d[3]+@"', MedicalAllowCurrentBPay ='"+d[4]+@"', MiscEidAdvance ='"+d[5]+@"', ComputerAllowance ='"+d[6]+@"', EntertainmentAllowance ='"+d[7]+@"', DeputationAllowance ='"+d[8]+@"', 
                         ProjectBaseAllowance ='"+d[9]+@"', Arrears ='"+d[10]+@"', GrossSalary ='"+d[11]+@"', GPF ='"+d[12]+@"', GPFInstallments ='"+d[13]+@"', IncomeTax ='"+d[14]+@"', GroupInsurance ='"+d[15]+@"', PersonnelInstalment ='"+d[16]+@"', CarAdvance ='"+d[17]+@"', MotorCycle ='"+d[18]+@"', HouseBuilding ='"+d[19]+@"', CashAdvanceLoan ='"+d[20]+@"', 
                         TotalDeductions ='"+d[21]+@"', NetSalary ='"+d[22]+@"', Is_SemiAutoSalary =0
where MonthlySalaryID = " + SalaryID);


                //=========>Fn.Exec("usp_PayrollGPFBalanceUpdate '" + d[0] + "', '" + d[22] + "', '" + d[1] + "'");
                return SalaryID;
            }
        }



    }
}