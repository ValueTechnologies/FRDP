using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accupdateJV
    /// </summary>
    public class accupdateJV : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            string _data = context.Request.QueryString["id"];

            try
            {
                string[] pram = _data.Split('¦');

                Fn.Exec("sp_updateJV N'" + pram[0].Replace("'", "''") + "','" + pram[2].Replace("'", "''") + "','" + pram[1] + "','" + pram[3] + "', '" + pram[4] + "', '" + (pram[5] == "" ? DBNull.Value.ToString() : pram[5]) + "'," + pram[6] + "," + pram[7]);
                context.Response.ContentType = "text/HTML";
                context.Response.Write(pram[6]);
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