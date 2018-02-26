using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class EmployeeReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (ddlGenerator.SelectedValue != "")
                {
                    ShowReport();
                }
            }
        }
        private void ShowReport()
        {
            DSBD Ds = new DSBD();

            DSBDTableAdapters.tblEmployeeTableAdapter da = new DSBDTableAdapters.tblEmployeeTableAdapter();
            da.Fill(Ds.tblEmployee, ddlGenerator.SelectedValue,  ddlLocation.SelectedValue);


            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource rd1 = new ReportDataSource("EmpRpt1", Ds.Tables["tblEmployee"]);
            ReportViewer1.LocalReport.DataSources.Add(rd1);
            String path = Server.MapPath("EmployeeReport.rdlc");

            ReportViewer1.LocalReport.ReportPath = path;
            ReportParameter[] parameters = new ReportParameter[3];
            parameters[0] = new ReportParameter("ReportParameter1", "Site: " + ddlLocation.SelectedItem.Text);
            parameters[1] = new ReportParameter("ReportParameter2", "Designation: " + ddlGenerator.SelectedItem.Text);
            parameters[2] = new ReportParameter("ReportParameter3", "Generator: " + ddlGenerator.SelectedItem.Text);
            ReportViewer1.LocalReport.SetParameters(parameters);
            ReportViewer1.KeepSessionAlive = true;

            ReportViewer1.LocalReport.Refresh();
        }

        protected void btnShowRpt_Click(object sender, EventArgs e)
        {
            SetMenue.SET();
            if (ddlGenerator.SelectedValue != "")
            {
                ShowReport();
            }
        }
        protected void ddlOfficeTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlOfficeTypes.SelectedValue == "3")
            //{
            //    lblDsu.Visible = true;
            //    ddlDSU.Visible = true;
            //}
            //else
            //{
            //    lblDsu.Visible = false;
            //    ddlDSU.Visible = false;
            //}
        }

    }
}