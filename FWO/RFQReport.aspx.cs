using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class RFQReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (ddRFQs.SelectedValue != "" && ddVendor.SelectedValue!="")
                {
                    ShowReport();
                }
            }
        }

        private void ShowReport()
        {
            //DSBD Ds = new DSBD();
            DSPercuremnet Ds = new DSPercuremnet();

            //DSBDTableAdapters.tblEmployeeTableAdapter da = new DSBDTableAdapters.tblEmployeeTableAdapter();
            //da.Fill(Ds.tblEmployee, ddlGenerator.SelectedValue, ddlLocation.SelectedValue);
            DSPercuremnetTableAdapters.RFQVendersTableAdapter da = new DSPercuremnetTableAdapters.RFQVendersTableAdapter();
            da.Fill(Ds.RFQVenders, Convert.ToInt32(ddVendor.SelectedValue));

            DSPercuremnetTableAdapters.tblInvReqMainTableAdapter daa = new DSPercuremnetTableAdapters.tblInvReqMainTableAdapter();
            daa.Fill(Ds.tblInvReqMain, Convert.ToDecimal(ddRFQs.SelectedValue));

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource rd1 = new ReportDataSource("RFQVenders", Ds.Tables["RFQVenders"]);
            ReportDataSource rd2 = new ReportDataSource("tblInvReqMain", Ds.Tables["tblInvReqMain"]);
            ReportViewer1.LocalReport.DataSources.Add(rd1);
            ReportViewer1.LocalReport.DataSources.Add(rd2);
            String path = Server.MapPath("RFQReportForVenders.rdlc");

            ReportViewer1.LocalReport.ReportPath = path;
            //ReportParameter[] parameters = new ReportParameter[3];
            //parameters[0] = new ReportParameter("ReportParameter1", "Site: " + ddlLocation.SelectedItem.Text);
            //parameters[1] = new ReportParameter("ReportParameter2", "Designation: " + ddlGenerator.SelectedItem.Text);
            //parameters[2] = new ReportParameter("ReportParameter3", "Generator: " + ddlGenerator.SelectedItem.Text);
            //ReportViewer1.LocalReport.SetParameters(parameters);
            ReportViewer1.KeepSessionAlive = true;

            ReportViewer1.LocalReport.Refresh();
        }

        protected void btnGetRpt_Click(object sender, EventArgs e)
        {
            if (ddVendor.SelectedValue!="")
            {
                ShowReport();
            }
        }
    }
}