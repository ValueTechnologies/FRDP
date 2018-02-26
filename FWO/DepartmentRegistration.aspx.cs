using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class DepartmentRegistration : System.Web.UI.Page
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


            return Fn.ExenID("INSERT INTO tbl_Departments (CompanyId, DepartmentName, DepartmentPhoneNo, CurrentlyWorking) VALUES        ('" + d[0] + "' , '" + d[1] + "', '" + d[2] + "', '" + d[3] + "'); select SCOPE_IDENTITY();");
        }


        [WebMethod]
        public static string AllDepartments(string CompanyID) 
        {
          //  return Fn.Data2Json("select tbl_Departments.DepartmentID, tbl_Company.CompanyName , tbl_Departments.DepartmentName, tbl_Departments.DepartmentPhoneNo, Case when tbl_Departments.CurrentlyWorking = 1 then 'Yes' else 'No' end as CurrentlyWorking from tbl_Departments inner join  tbl_Company on tbl_Company.CompanyID = tbl_Departments.CompanyId where tbl_Departments.CompanyId = '" + CompanyID + "'  Order by tbl_Company.CompanyName, tbl_Departments.DepartmentName");


            return Fn.Data2Json(@"SELECT        tbl_Departments.DepartmentID, tbl_Company.CompanyName, tbl_Departments.DepartmentPhoneNo, CASE WHEN tbl_Departments.CurrentlyWorking = 1 THEN 'Yes' ELSE 'No' END AS CurrentlyWorking, 
                         tblDept.Name AS DepartmentName
FROM            tbl_Departments INNER JOIN
                         tbl_Company ON tbl_Company.CompanyID = tbl_Departments.CompanyId INNER JOIN
                         tblDept ON tbl_Departments.DepartmentName = tblDept.ID
WHERE        (tbl_Departments.CompanyId = '" + CompanyID + @"')
ORDER BY tbl_Company.CompanyName, tbl_Departments.DepartmentName");
        }
    }
}