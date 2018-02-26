using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accAccountsListBanks
    /// </summary>
    public class accAccountsListBanks : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            string[] dataID = { "0", "0" };
            if (context.Request.QueryString["id"] != "")
            {
                dataID = context.Request.QueryString["id"].Split(',');
            }
            else
            {
                //throw new ArgumentException("No parameter specified");
            }
            {
                try
                {
                    //string lists = Fn.GetRecords("select dbo.fn_AccountsList(" + dataID[0] + "," + dataID[1] + ")+'|'+dbo.fn_AcIDList(" + dataID[0] + ")")[0];
                    string lists = Fn.GetRecords("select dbo.fn_AccountsList_SingleCOA_Bank(" + dataID[0] + "," + dataID[1] + ")+'|'+dbo.fn_AcIDList_SingleCOA_Bank(" + dataID[0] + ")")[0];
                    context.Response.ContentType = "text/HTML";
                    context.Response.Write(lists);
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