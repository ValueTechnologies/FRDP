using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accpostCOA
    /// </summary>
    public class accpostCOA : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            string dataID = "0";
            if (context.Request.QueryString["id"] != "")
            {
                dataID = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.QueryString["id"]));
            }
            else
            {
                //throw new ArgumentException("No parameter specified");
            }
            {
                try
                {
                    string[] rslt = dataID.Split('|');
                    if (rslt[0] == "0")
                    {
                        Fn.Exec("INSERT INTO tblChartAc(AcGroup,AcSubGroup, AcCode,AcName, AcType,TypeAc,CompID ) VALUES (N'" + (rslt[1] == "" ? DBNull.Value.ToString() : rslt[1]) + "', N'" + (rslt[2] == "" ? DBNull.Value.ToString() : rslt[2]) + "',N'" + rslt[3] + "','" + rslt[4] + "',N'" + rslt[5] + "',N'" + (rslt[6] == "" ? "NULL" : rslt[6]) + "'," + rslt[7] + ")");
                    }
                    else
                    {
                        Fn.Exec("UPDATE tblChartAc SET AcGroup = N'" + (rslt[1] == "" ? DBNull.Value.ToString() : rslt[1]) + "', AcSubGroup = N'" + (rslt[2] == "" ? DBNull.Value.ToString() : rslt[2]) + "', AcName = N'" + rslt[4] + "', AcCode = '" + rslt[3] + "', AcType = N'" + rslt[5] + "',TypeAc=N'" + rslt[6] + "'  WHERE (AcID = " + rslt[0] + ")");
                    } context.Response.ContentType = "text/HTML";
                    context.Response.Write("0");
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