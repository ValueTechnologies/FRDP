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
    public partial class AppointmentLetterRpt : System.Web.UI.Page
    {
        private string SelectedCandidateID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ShowReport(Convert.ToString(Request.QueryString["ID"]));

            }
            
        }


        private void ShowReport(string ID)
        {
            try
            {

                ReportViewer1.LocalReport.DataSources.Clear();
                DSHRIS ds = new DSHRIS();
                string reportPath = Server.MapPath("AppointmentLetterRpt.rdlc");
                DSHRISTableAdapters.usp_JobAppointmentLetterTableAdapter da1 = new DSHRISTableAdapters.usp_JobAppointmentLetterTableAdapter();
                da1.Fill(ds.usp_JobAppointmentLetter, Convert.ToInt32(ID)); 

                DataTable dt = ds.Tables["usp_JobAppointmentLetter"];
                string logoID = Convert.ToString(dt.Rows[0]["CompanyID"]);
                ReportParameter paramLogo = new ReportParameter();
                paramLogo.Name = "imagePath";
                string path;
                path = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);
                path = path.Substring(6, path.Length - 9);
                paramLogo.Values.Add("file:///" + path + @"Uploads\CompanyProfile\" + logoID + ".png");

                ReportParameter paramSalary = new ReportParameter();
                paramSalary.Name = "Salary";
                paramSalary.Values.Add(Convert.ToString(dt.Rows[0]["Salary"]));

                ReportViewer1.LocalReport.EnableExternalImages = true;
                ReportViewer1.LocalReport.ReportPath = reportPath;
                ReportViewer1.LocalReport.SetParameters(paramLogo);
                ReportViewer1.LocalReport.SetParameters(paramSalary);

                ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", ds.Tables["usp_JobAppointmentLetter"]));
                ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception)
            {

            }
        }
        


    }
}