using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class OrganizationRegistrationRpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlDepartment.DataBind();
                ddlFunction.DataBind();
                ddlsFunction.DataBind();
                ddlActiviy.DataBind();
            }
            
        }



        private void ShowReport()
        {
            ReportViewer1.LocalReport.DataSources.Clear();
            DSBD ds = new DSBD();
            string reportPath = Server.MapPath("OrganizationDevelopmentStructure.rdlc");
            DSBDTableAdapters.usp_OrganizationDevelopmentStructureTableAdapter da1 = new DSBDTableAdapters.usp_OrganizationDevelopmentStructureTableAdapter();

            da1.Fill(ds.usp_OrganizationDevelopmentStructure, Convert.ToInt32(ddlDepartment.SelectedValue), Convert.ToInt32(ddlFunction.SelectedValue), Convert.ToInt32(ddlsFunction.SelectedValue), Convert.ToInt32(ddlActiviy.SelectedValue));

            ReportViewer1.LocalReport.ReportPath = reportPath;
            ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", ds.Tables["usp_OrganizationDevelopmentStructure"]));
            ReportViewer1.LocalReport.Refresh();
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlFunction.DataBind();
            ddlsFunction.DataBind();
            ddlActiviy.DataBind();
        }

        protected void ddlFunction_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlsFunction.DataBind();
            ddlActiviy.DataBind();
        }

        protected void ddlsFunction_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlActiviy.DataBind();
        }

        protected void ddlActiviy_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnSrch_Click(object sender, EventArgs e)
        {
            ShowReport();
        }



    }
}