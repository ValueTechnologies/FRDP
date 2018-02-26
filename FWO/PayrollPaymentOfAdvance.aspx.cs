using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace FRDP
{
    public partial class PayrollPaymentOfAdvance : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string SearchPrevousData(string EmpID, string AdvanceId)
        {
            return Fn.Data2Json("SELECT ROW_NUMBER() over(order by AdvanceDate) as Srno, AdvanceDetailID, Amount, Format(AdvanceDate, 'dd-MMM-yyyy') as AdvanceDate, Balance FROM tbl_PayrollAdvanceDetail where AdvanceID = '" + AdvanceId + "' and EmpID = '" + EmpID + "' and Balance > 0");
        }

        [WebMethod]
        public static string SavePayment(string AdvanceID, string EmpID, string AdvanceDetailid, string Date, string Amount)
        {
            Fn.Exec("usp_PayrollAdvancePayment '" + AdvanceDetailid + "', '" + Date + "', '" + Amount + "'");
            if (AdvanceID == "1002")
            {
                Fn.Exec("usp_PayrollGPFBalanceUpdate '" + EmpID + "', '" + Convert.ToDecimal(Amount) + "', '" + Date + "'");
            }

            return string.Empty;
        }


    }
}