using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
namespace FRDP
{
    public partial class PayrollGetAdvances : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetAdvanceTitles()
        {
            return Fn.Data2Json("SELECT AdvanceTitleID, Advance FROM tbl_AdvanceTitle");
        }

        [WebMethod]
        public static string SaveAdvanceTitle(string AdvanceID, string Amount, string EmpID, string AdvanceDate)
        {
            string id = Fn.ExenID("INSERT INTO tbl_PayrollAdvanceDetail (AdvanceID, Amount, EmpID, AdvanceDate, Balance) VALUES ('" + AdvanceID + "','" + Amount + "','" + EmpID + "','" + AdvanceDate + "','" + Amount + "'); Select SCOPE_IDENTITY();");
            if (AdvanceID == "1002")
            {
                Fn.Exec("usp_PayrollGPFBalanceUpdate '" + EmpID + "', '" + (-1) * Convert.ToDecimal(Amount) + "', '" + AdvanceDate + "'");
            }

            return id;
        }


        [WebMethod]
        public static string GetPreviousData(string EmpID)
        {
            return Fn.Data2Json("Select ROW_NUMBER() over(order by Advance) as Srno, Advance, Amount from(SELECT  tbl_PayrollAdvanceDetail.EmpID, tbl_AdvanceTitle.Advance, Isnull(Sum(tbl_PayrollAdvanceDetail.Balance), 0) as Amount FROM tbl_PayrollAdvanceDetail INNER JOIN tbl_AdvanceTitle ON tbl_PayrollAdvanceDetail.AdvanceID = tbl_AdvanceTitle.AdvanceTitleID where tbl_PayrollAdvanceDetail.EmpID = '" + EmpID + "' group by tbl_PayrollAdvanceDetail.EmpID, tbl_AdvanceTitle.Advance) as tab order by Advance");
        }
    }
}