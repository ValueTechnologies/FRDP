using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accAutoLists
    /// </summary>
    public class accAutoLists : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            int dataID = 0;
            if (context.Request.QueryString["id"] != "")
            {
                dataID = Convert.ToInt32(context.Request.QueryString["id"]);
            }
            else
            {
                //throw new ArgumentException("No parameter specified");
            }
            {
                try
                {
                    string lists = Fn.GetRecords("select dbo.fn_SubGList('" + dataID + "')+'¦'+dbo.fn_GroupList('" + dataID + "')")[0];
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