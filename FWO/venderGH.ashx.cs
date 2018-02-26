using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;
namespace FRDP
{
    /// <summary>
    /// Summary description for venderGH
    /// </summary>
    public class venderGH : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            MyClass Fn = new MyClass();

            string[] dataID = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.QueryString["id"])).Split('ǁ');

            {
                try
                {
                    context.Response.ContentType = "text/HTML";
                    switch (Convert.ToInt32(dataID[0]))
                    {
                        case 0:
                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblVenderSegment
                         (SegmentName, Description, EnterByLoginID)
VALUES        ('" + dataID[1] + @"','" + dataID[2] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"') ;select SCOPE_IDENTITY()"));
                            break;

                        case 1:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblVenderSegmentID, SegmentName, Description, dtDateCreated, EnterByLoginID
FROM            tblVenderSegment Order by SegmentName"));
                            break;

                        case 2:
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblVenderSegmentV
                         (tblVenderSegmentID, tblVenderID)
                            VALUES        ('"+dataID[1]+"','"+dataID[2]+"')"));
                            break;
                        case 3:
                            context.Response.Write(Fn.Data2Json(@"Select  tblVenderID, RIGHT( '00000000000'+ CAST(VenderNo AS VARCHAR(10)) ,5) AS VenderNo, Type, Name, CNIC_CompanyNTN, mobileNo1, mobileno2, phone1, phone2, Fax, Email, Address, CategoryVenderContractor from tblVender
where tblVenderID IN (select DISTINCT tblVenderID FROM tblVenderSegmentV WHERE tblVenderSegmentID='"+dataID[1]+"'  )"));
                            break;

                        case 4:
                            context.Response.Write(Fn.Exec(@"Delete [dbo].[tblVenderSegmentV] where tblVenderSegmentID = '"+dataID[1]+"' and tblVenderID='"+dataID[2]+"'"));
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}