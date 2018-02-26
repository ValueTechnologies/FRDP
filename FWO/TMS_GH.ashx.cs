using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;

namespace FRDP
{
    /// <summary>
    /// Summary description for TMS_GH
    /// </summary>
    public class TMS_GH : IHttpHandler, IRequiresSessionState
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
                            string formdata = HttpUtility.UrlDecode(context.Request.Form["vls"]);
                            string formcost = HttpUtility.UrlDecode(context.Request.Form["rt1"]);
                            string Case0ID = "0";
                            if (formdata.Contains('½'))
                            {
                                Case0ID = Fn.ExenID(@"INSERT INTO VehicleProblem
                         (Problem, Date, WorkshopID, Vehicle_id, DriverEmpID, Description)
                         VALUES        ('" + formdata.Split('½')[0] + @"','" + formdata.Split('½')[1] + @"','" + formdata.Split('½')[2] + @"','" + formdata.Split('½')[3] + @"','" + formdata.Split('½')[4] + @"','" + formdata.Split('½')[5] + @"'); select SCOPE_IDENTITY()");

                                if (formcost.Contains('¼'))
                                {
                                    foreach (string item in formcost.Split('¼'))
                                    {
                                        if (item.Contains('½'))
                                        {
                                            Fn.Exec(@"INSERT INTO VehicleProblemCost
                         (VehicleProblemID, CostFor, Descrtiption, CostAmount)
VALUES        ('"+Case0ID+@"','"+item.Split('½')[0]+@"','"+item.Split('½')[1]+@"','"+item.Split('½')[2]+@"')");
                                        }
                                    }
                                }
                            }


                            context.Response.Write(Case0ID);
                            break;

                        case 1:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        VehicleProblem.VehicleProblemID, VehicleProblem.Problem, VehicleProblem.Date, Vehicle.Number Vehicle, Workshop.Workshop_Name Workshop, ISNULL(tblEmployee.FName,'')+' '+ ISNULL(tblEmployee.LName,'') AS Driver
FROM            VehicleProblem INNER JOIN
                         Vehicle ON VehicleProblem.Vehicle_id = Vehicle.Vehicle_id INNER JOIN
                         Workshop ON VehicleProblem.WorkshopID = Workshop.Workshop_Id INNER JOIN
                         tblEmployee ON VehicleProblem.DriverEmpID = tblEmployee.EmpID", "tblReq"));
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