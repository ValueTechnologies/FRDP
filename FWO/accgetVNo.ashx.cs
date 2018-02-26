using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accgetVNo
    /// </summary>
    public class accgetVNo : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            string dataID = "0";
            if (context.Request.QueryString["id"] != "")
            {
                dataID = context.Request.QueryString["id"];
            }
            else
            {
                //throw new ArgumentException("No parameter specified");
            }
            {
                try
                {
                    string[] rslt = dataID.Split('|');
                    string vno = Fn.GetRecords("SELECT COUNT(ISNULL(VoucherID, 0)) + 1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = " + rslt[0] + ") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '" + rslt[1] + "') AND (VoucherNo LIKE N'" + rslt[2] + "%')")[0];
                    context.Response.ContentType = "text/HTML";
                    context.Response.Write(rslt[2] + "/" + vno);
                }
                catch
                {
                    context.Response.ContentType = "text/HTML";
                    context.Response.Write("<p>Contents not available</p>");
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}