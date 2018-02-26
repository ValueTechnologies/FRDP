using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accCustomRpt
    /// </summary>
    public class accCustomRpt : IHttpHandler
    {
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            MyClass Fn = new MyClass();

            string[] dataID = context.Request.QueryString["id"].Split(':');

            {
                try
                {
                    context.Response.ContentType = "text/HTML";
                    switch (Convert.ToInt32(dataID[0]))
                    {
                        case 0:
                            context.Response.Write(Fn.GetRecords("SELECT Title+'|'+convert(varchar,Dashboard) FROM tblReportHDR where RptID = " + dataID[1])[0]);
                            break;

                        case 1:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_RptDTLs('" + dataID[1] + "')")[0]);
                            break;

                        case 2:

                            context.Response.Write(Fn.HTMLcTable(dataID[2] + " " + dataID[1], "chrt-tb" + dataID[3], "tb-css"));
                            break;

                        case 3:
                            Fn.Exec("DELETE FROM tblReportDTL WHERE (ID = " + dataID[1] + ")");
                            break;

                        case 4:
                            Fn.Exec("DELETE FROM tblReportHDR WHERE (RptID = " + dataID[1] + ")");
                            break;

                        //case 5:
                        //    Fn.Exec("UPDATE tblReportDTL SET sec_sort = " + dataID[2] + ", remarks = '" + dataID[3] + "' WHERE (ID = " + dataID[1] + ")");
                        //    break;

                        case 6:
                            Fn.Exec("UPDATE tblReportHDR SET Dashboard =" + dataID[2] + " WHERE (RptID =" + dataID[1] + ")");
                            break;

                        case 7:
                            context.Response.Write(Fn.HTMLchTable(dataID[2] + " " + dataID[1], "chrt-tb" + dataID[3], "tb-css"));
                            break;

                        case 8:
                            Fn.Exec("INSERT INTO tblDevLog (PostedBy, txtDtls,UserID) VALUES ('" + dataID[1] + ")");
                            context.Response.Write("done");
                            break;

                        case 9:
                            context.Response.Write(Fn.GetRecords("SELECT '<div><h6>'+PostedBy + '</h6><h6>' + CONVERT(varchar, pDate) + '</h6>' + txtDtls+'</Div><div class=\"tab0\" style=\"color: blue; margin-top: 10px;\">'+ isnull(Ans,'')+'</div>' FROM tblDevLog where userid=" + dataID[1])[0]);
                            break;

                        case 10:
                            context.Response.Write(Fn.GetRecords("select dbo.fn_RptList(" + dataID[1] + ")")[0]);
                            break;

                        case 11:
                            Fn.Exec("INSERT INTO tblReportDTL(sp_sql, gruops, sums, remarks, remarksPos, Wheres, tableview, tablePos, row_col, chattype, sec_sort, RptID,chrtview) VALUES (" + dataID[1]);
                            break;

                        case 12:
                            context.Response.Write(Fn.HTMLcTable(dataID[1] + " '" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "'", "chrt-tb", "tb-css"));
                            break;

                        case 13:
                            context.Response.ContentType = "application/" + dataID[1];
                            string[] ds = dataID[4].Split('¦');
                            string[] sql = dataID[5].Split('¦');
                            context.Response.AddHeader("Content-disposition", "filename=" + dataID[2]);
                            byte[] Contents = Fn.RunReport(ds, sql, "TaskMgr." + dataID[3], dataID[1], context, true);
                            context.Response.BinaryWrite(Contents);
                            Contents = null;
                            break;

                        case 14:
                            Fn.Exec("sp_CreateReport N'" + dataID[1] + "','" + Fn.CleanSQL(dataID[2]) + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "'");
                            break;

                        case 15:
                            context.Response.Write(Fn.Data2Json("sp_SearchEmp N'" + dataID[1] + "'"));
                            break;

                        case 16:
                            context.Response.Write(Fn.GetRecords(dataID[1] + " '" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "'")[0]);
                            break;

                        case 17:
                            context.Response.Write(Fn.Data2Json("SELECT top(20) tblInstitueData.InstitueID,tblInstitueData.InstitID, tblInstitueData.Name, tblInstitueData.ITyp, tblInstitueData.ILevel, tblInstitueData.Gender, TblLocation.LocName FROM tblInstitueData INNER JOIN TblLocation ON tblInstitueData.Sec = TblLocation.LocID " + dataID[1].Replace("''", "'")));
                            break;

                        case 18:
                            context.Response.Write(Fn.Data2Json("sp_rptStudentData N'EnquiryID,Std_Sex,Pros_No,Std_Name,Father_Name,age,Class_Name,Section','EnquiryID,Std_Sex,Pros_No,Std_Name,Father_Name,age,Class_Name,Section','" + dataID[1] + "'"));
                            break;

                        case 19:
                            Fn.Exec("UPDATE tblStudentEnquiry SET PayMethod = '" + dataID[3] + "', FeeCat = '" + dataID[2] + "' WHERE (EnquiryID = '" + dataID[1] + "')");
                            break;

                        case 20:
                            context.Response.Write(Fn.Data2Json("sp_SearchStud N'" + dataID[1] + "'"));
                            break;
                        case 21:
                            context.Response.ContentType = "application/" + dataID[1];
                            ds = dataID[4].Split('¦');
                            sql = dataID[5].Split('¦');
                            context.Response.AddHeader("Content-disposition", "filename=" + dataID[2]);
                            Contents = Fn.BarReport(ds, sql, "TaskMgr." + dataID[3], dataID[1], context, true);
                            context.Response.BinaryWrite(Contents);
                            Contents = null;
                            break;
                        case 22:
                            context.Response.ContentType = "application/" + dataID[1];
                            ds = dataID[4].Split('¦');
                            sql = dataID[5].Split('¦');
                            context.Response.AddHeader("Content-disposition", "attachment; filename=" + dataID[2]);
                            Contents = Fn.BarReport(ds, sql, "TaskMgr." + dataID[3], dataID[1], context, true);
                            context.Response.BinaryWrite(Contents);
                            Contents = null;
                            break;
                        case 23:
                            context.Response.Write(Fn.HTMLchTable(dataID[2] + " " + dataID[1], "Chrt-tb" + dataID[3], "tb-css"));
                            break;
                        default:
                            context.Response.Write("<p>Contents not available</p>");
                            break;
                    }
                }
                catch
                {
                    context.Response.ContentType = "text/HTML";
                    context.Response.Write("<p>Contents not available</p>");
                }
            }
        }
    }
}