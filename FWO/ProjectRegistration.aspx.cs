using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class ProjectRegistration : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        public static string UserID = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        [WebMethod]
        public static string SaveData(string Values) 
        {
            var frmdata = Values;
            string[] d = frmdata.Split('½');

            DateTime endDate = DateTime.Parse(d[2]);
            int ended = 0;
            if (endDate < DateTime.Now)
            {
                ended = 1;
            }

            return Fn.ExenID("INSERT INTO tblProject (ID, ProjectName, StartDate, EndDate, Ended, CreatedOn, CreatedBy) VALUES ((Select IsNULL(Max(ID), 0)+1 from tblProject),'" + d[0] + "' , '" + d[1] + "', '" + d[2] + "', '" + ended + "', '" + DateTime.Now + "', '" + HttpContext.Current.Session["UserID"] + "'); select SCOPE_IDENTITY();");
        }


        [WebMethod]
        public static string AllProjects() 
        {
          //  return Fn.Data2Json("select tbl_Departments.DepartmentID, tbl_Company.CompanyName , tbl_Departments.DepartmentName, tbl_Departments.DepartmentPhoneNo, Case when tbl_Departments.CurrentlyWorking = 1 then 'Yes' else 'No' end as CurrentlyWorking from tbl_Departments inner join  tbl_Company on tbl_Company.CompanyID = tbl_Departments.CompanyId where tbl_Departments.CompanyId = '" + CompanyID + "'  Order by tbl_Company.CompanyName, tbl_Departments.DepartmentName");

            var x = Fn.Data2Json(@"SELECT ProjectName, StartDate, EndDate, Ended from TblProject");
            return x;
        }
    }
}