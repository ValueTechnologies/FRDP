using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accContactList
    /// </summary>
    public class accContactList : IHttpHandler
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
                    string lists = Fn.GetRecords("select dbo.fn_ContactList(" + dataID + ")")[0];
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