using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using Microsoft.Reporting.WebForms;

namespace FRDP
{
    public class ExportAndDownload : System.Web.UI.Page
    {
        public string DownloadableFileName { get; set; }
        public void DownloadFile(string FormatExtension, string FormatType, DataTable dt, string ServerPath, string ReportName)
        {
            // select appropriate contenttype, while binary transfer it identifies filetype
            string contentType = string.Empty;
            if (FormatExtension.Equals(".pdf"))
                contentType = "application/pdf";
            if (FormatExtension.Equals(".doc"))
                contentType = "application/ms-word";
            if (FormatExtension.Equals(".xls"))
                contentType = "application/xls";

            DataTable dsData = new DataTable();
            dsData = dt;

            string FileName = "File_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + FormatExtension;
            string extension;
            string encoding;
            string mimeType;
            string[] streams;
            Warning[] warnings;

            LocalReport report = new LocalReport();
            report.ReportPath = ServerPath ;// Server.MapPath("~/rptEmployee.rdlc");
            ReportDataSource rds = new ReportDataSource();
            rds.Name = "DataSet1";//This refers to the dataset name in the RDLC file
            rds.Value = dsData;
            report.DataSources.Add(rds);

            Byte[] mybytes = report.Render(FormatType, null,
                            out extension, out encoding,
                            out mimeType, out streams, out warnings); //for exporting to PDF
            using (FileStream fs = File.Create(ServerPath.Replace(ReportName, "") + "/download/" + FileName))
            {
                fs.Write(mybytes, 0, mybytes.Length);
            }

            DownloadableFileName = FileName;
            
            

        }
    }
}