using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accCOA
    /// </summary>
    public class accCOA : IHttpHandler
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
                    DataSet dsTop = Fn.FillDSet("SELECT HeadName FROM tblCOA ORDER BY HeadID");
                    for (int i = 0; i < dsTop.Tables[0].Rows.Count; i++)
                    {
                        COAHTML = COAHTML + "<div class='AcHead'>" + dsTop.Tables[0].Rows[i][0] + "</div>";
                        DataSet dsGrp = Fn.FillDSet("SELECT AcGroup FROM tblChartAc WHERE (AcType = N'" + dsTop.Tables[0].Rows[i][0] + "') AND (CompID = " + dataID + ") GROUP BY AcGroup");
                        for (int j = 0; j < dsGrp.Tables[0].Rows.Count; j++)
                        {
                            if (dsGrp.Tables[0].Rows[j][0].ToString() != "")
                            {
                                COAHTML = COAHTML + "<div class='AcGroup'>" + dsGrp.Tables[0].Rows[j][0] + "</div>";
                                DataSet dsSub = Fn.FillDSet("SELECT AcSubGroup FROM tblChartAc WHERE (isnull(AcGroup,'') = N'" + dsGrp.Tables[0].Rows[j][0].ToString() + "') and AcType=N'" + dsTop.Tables[0].Rows[i][0] + "' AND (CompID = " + dataID + ") GROUP BY AcSubGroup");
                                for (int a = 0; a < dsSub.Tables[0].Rows.Count; a++)
                                {
                                    if (dsSub.Tables[0].Rows[a][0].ToString() != "")
                                    {
                                        COAHTML = COAHTML + "<div class='AcSubG'>" + dsSub.Tables[0].Rows[a][0] + "</div>";
                                        DataSet dsAcc = Fn.FillDSet("SELECT AcID, AcName, AcCode, AcType, AcGroup, AcSubGroup, AcStatus FROM tblChartAc WHERE isnull(AcSubGroup,'')=N'" + dsSub.Tables[0].Rows[a][0].ToString() + "' and (isnull(AcGroup,'') = N'" + dsGrp.Tables[0].Rows[j][0].ToString() + "') and AcType=N'" + dsTop.Tables[0].Rows[i][0] + "' AND (CompID = " + dataID + ") ORDER BY AcCode");
                                        for (int b = 0; b < dsAcc.Tables[0].Rows.Count; b++)
                                        {
                                            COAHTML = COAHTML + "<div id='" + dsAcc.Tables[0].Rows[b][0] + "' class='AcCode'>" + dsAcc.Tables[0].Rows[b][2] + " " + dsAcc.Tables[0].Rows[b][1] + "</div>";
                                        }
                                    }
                                    else
                                    {
                                        DataSet dsAcc = Fn.FillDSet("SELECT AcID, AcName, AcCode, AcType, AcGroup, AcSubGroup, AcStatus FROM tblChartAc WHERE isnull(AcGroup,'')=N'" + dsGrp.Tables[0].Rows[j][0].ToString() + "' and isnull(AcSubGroup,'')=N'" + dsSub.Tables[0].Rows[a][0].ToString() + "' and (isnull(AcGroup,'') = N'" + dsGrp.Tables[0].Rows[j][0].ToString() + "') and AcType=N'" + dsTop.Tables[0].Rows[i][0] + "' AND (CompID = " + dataID + ") ORDER BY AcCode");
                                        for (int b = 0; b < dsAcc.Tables[0].Rows.Count; b++)
                                        {
                                            if (dsAcc.Tables[0].Rows[b][1].ToString() != "")
                                            {
                                                COAHTML = COAHTML + "<div id='" + dsAcc.Tables[0].Rows[b][0] + "' class='AcCode'>" + dsAcc.Tables[0].Rows[b][2] + " " + dsAcc.Tables[0].Rows[b][1] + "</div>";
                                            }
                                        }
                                    }
                                }
                            }
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