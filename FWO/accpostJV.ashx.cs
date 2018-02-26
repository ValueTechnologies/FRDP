using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accpostJV
    /// </summary>
    public class accpostJV : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string[] pram = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.QueryString["id"])).Split('¦');
                context.Response.ContentType = "text/HTML";

                context.Response.Write(Fn.Data2Json("sp_postJV N'" + pram[0] + "','" + pram[1] + "','" + pram[2] + "','" + pram[3] + "', '" + pram[4] + "', '" + (pram[5] == "" ? DBNull.Value.ToString() : pram[5]) + "','" + pram[6] + "', '" + (pram[7] == "" ? DBNull.Value.ToString() : pram[8]) + "', '" + (pram[8] == "" ? DBNull.Value.ToString() : pram[8]) + "'"));
                //context.Response.Write(Fn.GetRecords("SELECT VoucherID FROM TblVoucherHDR WHERE (VoucherNo = N'" + pram[2] + "') AND (EntryDate = CONVERT(DATETIME, '" + pram[1] + "', 102)) AND (CompanyID = " + pram[4] + ")")[0].ToString());
            }
            catch (Exception ex)
            {
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