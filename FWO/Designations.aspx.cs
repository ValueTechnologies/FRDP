using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class Designations : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        public static string UserID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string SaveData(string designation, string detail, string CompanyID, string SalaryFrom, string SalaryTo) 
        {
            return Fn.ExenID("INSERT INTO tbl_Designation (Designation, DesignationDetail, CompanyID, SalaryFrom, SalaryTo) VALUES ('" + designation.Trim() + "', '" + detail.Trim() + "', '" + CompanyID + "', '" + SalaryFrom.Trim() + "', '" + SalaryTo.Trim() + "'); Select SCOPE_IDENTITY();");
        }



        [WebMethod]
        public static string UpdateData(string designation, string detail, string CompanyID, string SalaryFrom, string SalaryTo, string DesignationID)
        {
            return Fn.ExenID("UPDATE tbl_Designation SET   CompanyID = " + CompanyID + ", Designation = '" + designation.Trim() + "', DesignationDetail = '" + detail.Trim() + "', SalaryFrom = " + SalaryFrom.Trim() + ", SalaryTo = " + SalaryTo.Trim() + " WHERE (DesignationID = " + DesignationID + "); Select SCOPE_IDENTITY();");
        }

        [WebMethod]
        public static string AllDesignation(string CompanyID) 
        {
            //return Fn.Data2Json("SELECT    row_number() over(order by SalaryFrom desc) as srno, DesignationID, Designation, DesignationDetail, ISNULL(SalaryFrom, '') SalaryFrom, ISNULL(SalaryTo, '') as SalaryTo FROM tbl_Designation where CompanyID = " + CompanyID + " order by SalaryFrom desc");

            return Fn.Data2Json(@"SELECT     row_number() over(order by SalaryFrom desc) as srno,   tbl_Designation.DesignationID, tbl_Designation.DesignationDetail, ISNULL(tbl_Designation.SalaryFrom, '') AS SalaryFrom, ISNULL(tbl_Designation.SalaryTo, '') AS SalaryTo, tblDesig.NAME AS Designation, 
                         tblDesig.ID AS DesignationID
FROM            tbl_Designation INNER JOIN
                         tblDesig ON tbl_Designation.Designation = tblDesig.ID where CompanyID = " + CompanyID + " order by SalaryFrom desc");
        }
    }
}