using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;

namespace FRDP
{
    /// <summary>
    /// Summary description for PlaceE
    /// </summary>
    public class PlaceE : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            MyClass Fn = new MyClass();

            string[] dataID = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.QueryString["id"])).Split('ǁ');
            string[] fdata = new string[500];
            if (context.Request.Form["ourformData"] != null)
            {
                //string testing = context.Request.Form["ourformData"];
                fdata = HttpUtility.UrlDecode(context.Request.Form["ourformData"]).Split('½');
            }
             
            {
                try
                {
                    context.Response.ContentType = "text/HTML";
                    switch (Convert.ToInt32(dataID[0]))
                    {
                        case 0:
                            context.Response.Write(Fn.Data2Json("Select * from [dbo].[tblInventoryDefault] where tblInventoryDefaultID=1"));
                            break;
                        case 1:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblInventoryDefault
SET                MaxLevels =" + dataID[1] + @"
WHERE        (tblInventoryDefaultID = 1)"));
                            break;


                        case 2:


//                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPlaceID, Code, Name, Branch= (
//
//Select count(*) from tblPlace as B where B.ParentId= M.tblPlaceID
//)
//FROM            tblPlace AS M
//WHERE  ParentId IS NULL order by Code"));


                            context.Response.Write(Fn.Data2Json(@"Select M.CompanyID AS tblPlaceID, M.Code , M.CompanyName AS Name, 0 bIsHead, Branch= (
Select count(*) from tbl_Company AS B Where B.ParentId=M.CompanyID
) from tbl_Company as M WHERE  M.ParentId  IS NULL
order by M.CompanyID, M.Code"));


                            break;


                        case 3:

//                            context.Response.Write(Fn.Data2Json(@" SELECT        tblPlaceID, Code, Name, Branch= (
//
//Select count(*) from tblPlace as B where B.ParentId= M.tblPlaceID
//)
//FROM            tblPlace AS M
//WHERE  ParentId =" + dataID[1] + " order by Code"));



                            context.Response.Write(Fn.Data2Json(@" SELECT       M.CompanyID AS  tblPlaceID, Code, M.CompanyName Name, 0 bIsHead, Branch= (

Select count(*) from tbl_Company as B where B.ParentId= M.CompanyID
)
FROM            tbl_Company AS M
WHERE  ParentId =" + dataID[1] + " order by Code"));



                            break;

                        case 4:
//                            context.Response.Write(Fn.Exec(@"UPDATE       tblPlace
//SET                Name = '" + dataID[1] + @"'
//WHERE        (tblPlaceID = " + dataID[2] + ")"));


                            context.Response.Write(Fn.Exec(@"UPDATE       tbl_Company
SET                CompanyName = '" + dataID[1] + @"'
WHERE        (CompanyID = " + dataID[2] + ")"));
                            break;

                        case 5:
                            decimal? tblid = 0;
                            int? tblcode = 0;
                            using (DBDataContext db = new DBDataContext())
                            {
                                db.sp_tblPlace_Insert(dataID[1], dataID[2], ref tblid, ref tblcode);
                            }
                            string sssssss = Convert.ToString(tblid) + "½" + Convert.ToString(tblcode);
                            context.Response.Write(sssssss);
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