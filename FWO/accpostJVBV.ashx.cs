using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accpostJVBV
    /// </summary>
    public class accpostJVBV : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            try
            {

                string[] pram = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.QueryString["id"])).Split('¦');
                context.Response.ContentType = "text/HTML";

                context.Response.Write(Fn.Data2Json("sp_postJV N'" + pram[0] + "','" + pram[1] + "','" + pram[2] + "','" + pram[3] + "', '" + pram[4] + "', '" + (pram[5] == "" ? DBNull.Value.ToString() : pram[5]) + "','" + pram[6] + "', '" + (pram[9] == "" ? DBNull.Value.ToString() : pram[9]) + "', '" + (pram[10] == "" ? DBNull.Value.ToString() : pram[10]) + "'"));
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