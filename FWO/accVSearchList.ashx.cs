using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accVSearchList
    /// </summary>
    public class accVSearchList : IHttpHandler
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
                    //string[] lists = Fn.GetRecords11("sp_Voucher_SearchLst " + dataID);
                    //context.Response.ContentType = "text/HTML";
                    //context.Response.Write(lists[1] + "|" + lists[2].ToString() + "|" + lists[3].ToString() + "|" + lists[4].ToString() + "|" + lists[6].ToString() + "|" + lists[10].ToString());

                    string str = "";
                    using (DBDataContext db =  new DBDataContext())
                    {
                        var obj = db.sp_Voucher_SearchLst(Convert.ToInt32(dataID)).ToList<sp_Voucher_SearchLstResult>().FirstOrDefault();
                        str = Convert.ToString(obj.VoucherNo) + "|" + Convert.ToString(obj.EntryDate) + "|" + Convert.ToString(obj.Memo) + "|" + Convert.ToString(obj.CheqNo) + "|" + Convert.ToString(obj.Full_Name) + "|" + Convert.ToString(obj.VHeader);
                    }
                    context.Response.ContentType = "text/HTML";
                    context.Response.Write(str);

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