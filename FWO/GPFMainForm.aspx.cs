using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace FRDP
{
    public partial class GPFMainForm : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static string SearchEmployees(string empno, string name, string DepartmentID, string DesignationID)
        {
            return Fn.Data2Json("usp_SearchEmployeeBasicDataGPFAddedEmployees '" + empno + "', '" + name + "', '" + DepartmentID + "', '" + DesignationID + "', '" + Convert.ToInt32(HttpContext.Current.Session["OfficeId"]) + "'");
        }


        [WebMethod]
        public static string ThisYearAdvances(string EmpID, string FromYear, string ToYear)
        {
            return Fn.Data2Json("usp_ThisYearAdvance '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }
        [WebMethod]
        public static string ThisYearDeposits(string EmpID, string FromYear, string ToYear)
        {
            return Fn.Data2Json("usp_ThisYearDeposit '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }

        [WebMethod]
        public static string ThisYearInsuInstallments(string EmpID, string FromYear, string ToYear)
        {
            return Fn.Data2Json("usp_ThisYearInsuranceInstallments '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }


        [WebMethod]
        public static string GPFOwnContributionSave(string Month, string EmpID, string ContributionAmount, string FromYear, string ToYear)
        {
            int CurrYear = DateTime.Now.Year;
            DateTime ContributionDate;
            if (Convert.ToInt32(Month) >= 7)
            {
                ContributionDate = new DateTime(Convert.ToInt32(FromYear), Convert.ToInt32(Month), 01);
            }
            else
            {
                ContributionDate = new DateTime(Convert.ToInt32(ToYear), Convert.ToInt32(Month), 01);
            }


            Fn.Exec("if exists (select * from tbl_GPFContributionDetail where EmpID = '" + EmpID + "' and ContributionDate = '" + ContributionDate + "') begin update tbl_GPFContributionDetail set Amount  = '" + ContributionAmount + "'  where EmpID = '" + EmpID + "' and ContributionDate = '" + ContributionDate + "'; end else begin INSERT INTO tbl_GPFContributionDetail (EmpID, ContributionDate, Amount) VALUES ('" + EmpID + "', '" + ContributionDate + "' , '" + ContributionAmount + "'); select SCOPE_IDENTITY(); end");
            return Fn.Exec("usp_GPFUpdateOpeningBalance '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }


        [WebMethod]
        public static string LoadPreviousGPFOwnContribution(string EmpID, string FromYear, string ToYear)
        {
            return Fn.Data2Json("usp_GPFOwnContributionLoadData '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");

        }


        [WebMethod]
        public static string GPFOwnRecoverySave(string Month, string EmpID, string RecoveryAmount, string FromYear, string ToYear)
        {
            int CurrYear = DateTime.Now.Year;
            DateTime RecoveryDate;
            if (Convert.ToInt32(Month) >= 7)
            {
                RecoveryDate = new DateTime(Convert.ToInt32(FromYear), Convert.ToInt32(Month), 01);
            }
            else
            {
                RecoveryDate = new DateTime(Convert.ToInt32(ToYear), Convert.ToInt32(Month), 01);
            }


            Fn.Exec("if exists (select * from tbl_GPFRecoveryDetail where EmpID = '" + EmpID + "' and RecoveryDate = '" + RecoveryDate + "') begin update tbl_GPFRecoveryDetail set Amount  = '" + RecoveryAmount + "'  where EmpID = '" + EmpID + "' and RecoveryDate = '" + RecoveryDate + "'; end else begin INSERT INTO tbl_GPFRecoveryDetail (EmpID, RecoveryDate, Amount) VALUES ('" + EmpID + "', '" + RecoveryDate + "' , '" + RecoveryAmount + "'); select SCOPE_IDENTITY(); end");
            return Fn.Exec("usp_GPFUpdateOpeningBalanceRecovery '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }



        [WebMethod]
        public static string LoadPreviousGPFRecovery(string EmpID, string FromYear, string ToYear)
        {
            return Fn.Data2Json("usp_GPFRecoveryLoadData '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }


        [WebMethod]
        public static string GPFProfitSave(string EmpID, string NetGPF, string ProfitRate, string FromYear, string ToYear)
        {
            return Fn.Exec("usp_GPFProfitSave '" + EmpID + "', '" + NetGPF + "', '" + ProfitRate + "', '" + FromYear + "', '" + ToYear + "'");
            //return Fn.Exec("usp_GPFUpdateOpeningBalance '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }

        [WebMethod]
        public static string BalanceStatuses(string EmpID, string FromYear, string ToYear)
        {
            return Fn.Data2Json("usp_GPFBalanceStatus '" + EmpID + "', '" + FromYear + "', '" + ToYear + "'");
        }



    }
}