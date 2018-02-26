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
    public partial class GenerateSalary : System.Web.UI.Page
    {
        static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
            
            Fn.Exec(@"EXEC sp_GenerateSalary " + Convert.ToString(ddlMonth.SelectedValue) + ", " +  Convert.ToString(ddlSalaryYear.SelectedValue) + ", " + Convert.ToString(ddlOfficeType.SelectedValue)  );
            DataSet ds = new DataSet();

            ds = Fn.FillDSet("EXEC usp_DirectorateWiseNetSalaryReportByType " + Convert.ToString(ddlMonth.SelectedValue) + ", " +  Convert.ToString(ddlSalaryYear.SelectedValue) + ", " + Convert.ToString(ddlOfficeType.SelectedValue));
            ShowReport(ds);
        }


        private void ShowReport(DataSet ds)
        {
            try
            {

                ReportViewer1.LocalReport.DataSources.Clear();

                //DSPayroll ds = new DSPayroll();
                string reportPath = Server.MapPath("PayrollDirectorateWiseNetSalaryReportRpt.rdlc");
                //DSPayrollTableAdapters.usp_DirectorateWiseNetSalaryReportTableAdapter da = new DSPayrollTableAdapters.usp_DirectorateWiseNetSalaryReportTableAdapter();

                //da.Fill(ds.usp_DirectorateWiseNetSalaryReport, Convert.ToInt32(ddlMonth.SelectedValue), Convert.ToInt32(ddlYears.SelectedValue), Convert.ToInt32(ddlDirectorate.SelectedValue));

                ReportParameter param = new ReportParameter();
                param.Name = "ReportMonthYear";


                param.Values.Add(Convert.ToString(ddlMonth.SelectedItem.Text) + ", " + Convert.ToInt32(ddlSalaryYear.Text));


                ReportViewer1.LocalReport.ReportPath = reportPath;
                ReportViewer1.LocalReport.SetParameters(param);
                ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", ds.Tables[0]));

                ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception)
            {

            }
        }
    }
}