using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace FRDP
{
    /// <summary>
    /// Summary description for accFillVdtl
    /// </summary>
    public class accFillVdtl : IHttpHandler
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
                    DataSet dsTop = Fn.FillDSet("SELECT tblChartAc.AcCode + ' ' + tblChartAc.AcName AS AcTitle, TblVoucherDTL.Description, TblVoucherDTL.AmountDeb, TblVoucherDTL.AmountCre, TblVoucherDTL.AccEntryID, TblVoucherDTL.ID FROM TblVoucherDTL INNER JOIN  tblChartAc ON TblVoucherDTL.AccEntryID = tblChartAc.AcID WHERE (TblVoucherDTL.VoucherID = " + dataID + ") ORDER BY TblVoucherDTL.AmountDeb DESC");
                    for (int i = 0; i < dsTop.Tables[0].Rows.Count; i++)
                    {
                        COAHTML = COAHTML + dsTop.Tables[0].Rows[i][0] + "|" + dsTop.Tables[0].Rows[i][1] + "|" + dsTop.Tables[0].Rows[i][2] + "|" + dsTop.Tables[0].Rows[i][3] + "|" + dsTop.Tables[0].Rows[i][4] + "|" + dsTop.Tables[0].Rows[i][5] + "¦";
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