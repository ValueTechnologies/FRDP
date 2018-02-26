using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace FRDP
{
    public partial class TransferPension : System.Web.UI.Page
    {
        static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string SearchEmployees(string Fileno, string name, string DepartmentID, string DesignationID, string SearchBank, string TransferTO, string Month, string Year)
        {
            return Fn.Data2Json("usp_SearchEmployeePensionersPensionForTransfer'" + Fileno + "', '" + name + "', '" + DepartmentID + "', '" + DesignationID + "' , '" + SearchBank + "'   , '" + TransferTO + "' , '" + Month + "', '" + Year + "'");
        }


        [WebMethod]
        public static string SaveData(string EmpId, string PensionMonth, string PensionYear, string Bank, string MonthlyPension, string MedicalAllowance, string Arrears, string Deductions, string NetPaid, string Remarks)
        {
            return Fn.Exec("usp_PensionMonthlyTransfer '" + EmpId + "' ,'" + PensionMonth + "','" + PensionYear + "','" + Bank + "','" + MonthlyPension + "','" + MedicalAllowance + "','" + Arrears + "','" + Deductions + "','" + NetPaid + "','" + Remarks + "'      ");
        }

        protected void AjaxUploadAttech_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
        }
    }
}