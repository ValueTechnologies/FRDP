using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace FRDP
{
    /// <summary>
    /// Summary description for accSupportDocList
    /// </summary>
    public class accSupportDocList : IHttpHandler
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
                    string COAHTML = "";
                    DataSet dsTop = Fn.FillDSet("SELECT DocName, DocPath, DocExt,DocID FROM TblVoucherDoc WHERE (VoucherID = " + dataID + ")");
                    for (int i = 0; i < dsTop.Tables[0].Rows.Count; i++)
                    {
                        if (i % 2.0 == 0)
                        {
                            COAHTML = COAHTML + "<div class='Grd' style='float: left; width: 45%;margin-right:10px;'><div onclick='window.open(\"Vouchers/" + dsTop.Tables[0].Rows[i][1] + "\");' style='float: left;'>  <img alt='' src='images/" + dsTop.Tables[0].Rows[i][2] + ".png' height='16' width='16' /> " + dsTop.Tables[0].Rows[i][0] + "</div><div tag='" + dsTop.Tables[0].Rows[i][3] + "' class='DocDel Grd' style='float: right; width: 16px;height: 16px;background-image: url(\"/images/close.ico\");'></div></div>";
                        }
                        else
                        {
                            COAHTML = COAHTML + "<div class='Grd' style='float: left; width: 45%;margin-right:10px;'><div onclick='window.open(\"Vouchers/" + dsTop.Tables[0].Rows[i][1] + "\");' style='float: left;'>  <img alt='' src='images/" + dsTop.Tables[0].Rows[i][2] + ".png' height='16' width='16' /> " + dsTop.Tables[0].Rows[i][0] + "</div><div tag='" + dsTop.Tables[0].Rows[i][3] + "' class='DocDel Grd' style='float: right; width: 16px;height: 16px;background-image: url(\"/images/close.ico\");'></div></div><br />";
                        }
                    }

                    context.Response.ContentType = "text/HTML";
                    context.Response.Write(COAHTML);
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