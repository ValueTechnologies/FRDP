using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace FRDP
{
    public partial class PayrollDirectorateWiseDeductionsDetailReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                for (int i = 1947; i < DateTime.Now.Year + 2; i++)
                {
                    ddlYears.Items.Add(Convert.ToString(i));
                }
                ddlYears.SelectedValue = Convert.ToString(DateTime.Now.Year);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ShowReport();
        }


        private void ShowReport()
        {
            try
            {

                ReportViewer1.LocalReport.DataSources.Clear();

                DSPayroll ds = new DSPayroll();
                string reportPath = Server.MapPath("PayrollDirectorateWiseDeductionReportRpt.rdlc");

                DSPayrollTableAdapters.sp_DirectorateWiseCompleteSalaryReportTableAdapter da = new DSPayrollTableAdapters.sp_DirectorateWiseCompleteSalaryReportTableAdapter();
                da.Fill(ds.sp_DirectorateWiseCompleteSalaryReport, Convert.ToInt32(ddlMonth.SelectedValue), Convert.ToInt32(ddlYears.SelectedValue), Convert.ToInt32(ddlDirectorate.SelectedValue));

                ReportParameter param = new ReportParameter();
                param.Name = "ReportMonthYear";


                param.Values.Add(Convert.ToString(ddlMonth.SelectedItem.Text) + ", " + Convert.ToInt32(ddlYears.Text));


                ReportViewer1.LocalReport.ReportPath = reportPath;
                ReportViewer1.LocalReport.SetParameters(param);
                ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", ds.Tables["sp_DirectorateWiseCompleteSalaryReport"]));

                ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception)
            {

            }
        }
    }
}