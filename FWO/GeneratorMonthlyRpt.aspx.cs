using System;
using System.Web;
using System.Web.Services;
using System.IO;
using Microsoft.Reporting.WebForms;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

namespace FRDP
{
    public partial class GeneratorMonthlyRpt : System.Web.UI.Page
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
            DSBDTableAdapters.sp_Generator_MonthlyReport1TableAdapter da = new DSBDTableAdapters.sp_Generator_MonthlyReport1TableAdapter();

            da.Fill(Ds.sp_Generator_MonthlyReport1, Convert.ToInt32(ddlGenerator.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue),Convert.ToInt32(ddlYear.SelectedValue));


            //int i = Ds.Tables["sp_Generator_MonthlyReport1"].Rows.Count;
            //int j = 1;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource rd1 = new ReportDataSource("Generate", Ds.Tables["sp_Generator_MonthlyReport1"]);
            ReportViewer1.LocalReport.DataSources.Add(rd1);
            String path = Server.MapPath("GeneratorMonthlyReport.rdlc");

            ReportViewer1.LocalReport.ReportPath = path;
            ReportParameter[] parameters = new ReportParameter[3];
            parameters[0] = new ReportParameter("ReportParameter1", "Site: " + ddlLocation.SelectedItem.Text);
            parameters[1] = new ReportParameter("ReportParameter2", "Report: "+ ddlMonth.SelectedItem.Text + " "+ ddlYear.SelectedItem.Text);
            parameters[2] = new ReportParameter("ReportParameter3", "Generator: " + ddlGenerator.SelectedItem.Text);
            ReportViewer1.LocalReport.SetParameters(parameters);
            ReportViewer1.KeepSessionAlive = true;

            ReportViewer1.LocalReport.Refresh();



        }

        protected void btnShowRpt_Click(object sender, EventArgs e)
        {

            SetMenue.SET();
            if (ddlGenerator.SelectedValue!="")
            {
                ShowReport();
            }
        }

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetMenue.SET();
        }


    }
}