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
    public partial class JDRpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ShowReport(Convert.ToString(Request.QueryString["ID"]));
            }
        }


        private void ShowReport(string ID)
        {
            ReportViewer1.LocalReport.DataSources.Clear();
            DSHRIS ds = new DSHRIS();
            string reportPath = Server.MapPath("CandidateJDRpt.rdlc");
            DSHRISTableAdapters.usp_JDRptTableAdapter da1 = new DSHRISTableAdapters.usp_JDRptTableAdapter();

            da1.Fill(ds.usp_JDRpt, Convert.ToInt32(ID));

            DataTable dt = ds.Tables["usp_JDRpt"];
            string logoID = Convert.ToString(dt.Rows[0]["CompanyID"]);
            ReportParameter paramLogo = new ReportParameter();
            paramLogo.Name = "imagePath";
            string path;
            path = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);
            path = path.Substring(6, path.Length - 9);
            paramLogo.Values.Add("file:///" + path + @"Uploads\CompanyProfile\" + logoID + ".png");


            ReportParameter CandidateName = new ReportParameter();
            CandidateName.Name = "Name";
            CandidateName.Values.Add(Convert.ToString(dt.Rows[0]["Name"]));


            ReportViewer1.LocalReport.EnableExternalImages = true;
            ReportViewer1.LocalReport.ReportPath = reportPath;
            ReportViewer1.LocalReport.SetParameters(paramLogo);
            ReportViewer1.LocalReport.SetParameters(CandidateName);

            ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", ds.Tables["usp_JDRpt"]));
            ReportViewer1.LocalReport.Refresh();
        }




    }
}