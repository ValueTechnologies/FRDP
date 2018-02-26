using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class VenderRegistration : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        public static string UserID = string.Empty;
        public static string CandidateID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                UserID = ((HttpCookie)HttpContext.Current.Request.Cookies["UserID"]).Value.ToString();
                VenderRegistration.CandidateID = Convert.ToString(Request.QueryString["ID"]);
                

            }
            catch (Exception)
            {
                Response.Redirect("~/LogOut.aspx");
            }
        }


        [WebMethod]
        public static string AllCompaniesList() 
        {
            return Fn.Data2Json("SELECT CompanyID, CompanyName FROM tbl_Company order by CompanyName");
        
        }


        [WebMethod]
        public static string AllDepartments(string CompanyID)
        {
            return Fn.Data2Json("SELECT DepartmentID,  DepartmentName FROM tbl_Departments where CompanyId = " + CompanyID);

        }


        [WebMethod]
        public static string AllDesignation(string CompanyID)
        {
            return Fn.Data2Json("SELECT DesignationID, CompanyID, Designation FROM tbl_Designation where CompanyID = '" + CompanyID + "' order by Designation");

        }


        [WebMethod]
        public static string AllGroups(string CompanyID)
        {
            return Fn.Data2Json("SELECT User_Group_Id, User_Group_Name, Group_Level, Description, Priority FROM User_Groups where CompanyID = '" + CompanyID + "' order by Priority");

        }


        [WebMethod]
        public static string SaveBasicData(string vals) 
        {
            string[] d = vals.Split('½');
            if (d[17] == "0")
            {
                return Fn.ExenID("INSERT INTO TblHResources (EmpNo, CNIC, Full_Name, FatherName, DOB, Is_Male, CompanyID, DeptID, DesignationID, UserGroupID, ContactNos, U_Status, Qualification, Email, AppointmentDate, ResignationDate, Address, EnteryDate) VALUES ('" + d[0] + "','" + d[1] + "','" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "','" + d[12] + "','" + d[13] + "','" + d[14] + "','" + d[15] + "','" + d[16] + "', Getdate());  Select Scope_Identity();");
            }
            else
            {
                Fn.Exec("UPDATE TblHResources SET EmpNo = '" + d[0] + "', CNIC = '" + d[1] + "', Full_Name = '" + d[2] + "', FatherName = '" + d[3] + "', DOB = '" + d[4] + "', Is_Male = '" + d[5] + "', CompanyID = '" + d[6] + "', DeptID = '" + d[7] + "', DesignationID = '" + d[8] + "', UserGroupID = '" + d[9] + "', ContactNos = '" + d[10] + "', U_Status = '" + d[11] + "', Qualification = '" + d[12] + "', Email = '" + d[13] + "', AppointmentDate = '" + d[14] + "', ResignationDate = '" + d[15] + "', Address = '" + d[16] + "' where User_ID = '" + d[17] + "';  Select Scope_Identity();");
                return d[17];
            }
            
        }

        [WebMethod]
        public static string CNICCheck(string cnic) 
        {
            return Fn.Data2Json("Declare @CNIC as varchar(50); set @CNIC = '" + cnic + "';Select CNIC from(select CNIC from TblHResources  union ALL Select REPLACE(CNIC, '-', '') as CNIC from HRIS.dbo.tbl_Candidates) as tab where Replace(CNIC, '-','') = Replace(@CNIC , '-', ''); ");
        }


        [WebMethod]
        public static string LoadPreviousData(string cnic)
        {
            return Fn.Data2Json("SELECT User_ID, Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, Format(DOB, 'dd - MMMM - yyyy') as DOB, Is_Male, Format(AppointmentDate, 'dd - MMMM - yyyy') as AppointmentDate, Format(ResignationDate, 'dd - MMMM - yyyy') as ResignationDate, Address, U_Status FROM            (SELECT        User_ID, Full_Name AS Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, DOB, Is_Male, AppointmentDate, ResignationDate, Address, U_Status FROM            TblHResources UNION ALL SELECT 0 AS User_ID, tbl_Candidates.Name, tbl_Candidates.CellNo AS ContactNos, tbl_Candidates.EmailAddress AS Email, '' AS Qualification, tbl_Candidates.CompanyID, tbl_Candidates.DepartmentID AS DeptID, tbl_Candidates.JobDesignationID AS DesignationID, 0 AS UserGroupID, '' AS EmpNo, tbl_Candidates.CNIC, tbl_Candidates.FatherName, tbl_Candidates.DateOfBirth AS DOB, tbl_Candidates.Is_Male, '' AS AppointmentDate, '' AS ResignationDate, tbl_Candidates.StreetAddress, 0 AS U_Status FROM            tbl_Candidates inner JOIN tbl_SelectedCandidates ON tbl_SelectedCandidates.CandidateID = tbl_Candidates.CandidateID) AS Tab where Replace(Tab.CNIC, '-', '') = Replace('" + cnic + "', '-', '')");
        }

        [WebMethod]
        public static string LoadVenderData()
        {
            if (VenderRegistration.CandidateID != null)
            {
                return Fn.Data2Json("SELECT User_ID, Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, Format(DOB, 'dd - MMMM - yyyy') as DOB, Is_Male, Format(AppointmentDate, 'dd - MMMM - yyyy') as AppointmentDate, Format(ResignationDate, 'dd - MMMM - yyyy') as ResignationDate, Address, U_Status FROM            (SELECT        User_ID, Full_Name AS Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, DOB, Is_Male, AppointmentDate, ResignationDate, Address, U_Status FROM            TblHResources UNION ALL SELECT 0 AS User_ID, tbl_Candidates.Name, tbl_Candidates.CellNo AS ContactNos, tbl_Candidates.EmailAddress AS Email, '' AS Qualification, tbl_Candidates.CompanyID, tbl_Candidates.DepartmentID AS DeptID, tbl_Candidates.JobDesignationID AS DesignationID, 0 AS UserGroupID, '' AS EmpNo, tbl_Candidates.CNIC, tbl_Candidates.FatherName, tbl_Candidates.DateOfBirth AS DOB, tbl_Candidates.Is_Male, '' AS AppointmentDate, '' AS ResignationDate, tbl_Candidates.StreetAddress, 0 AS U_Status FROM            tbl_Candidates inner JOIN tbl_SelectedCandidates ON tbl_SelectedCandidates.CandidateID = tbl_Candidates.CandidateID) AS Tab WHERE      Tab.User_ID = '" + VenderRegistration.CandidateID + "'");
            }
            VenderRegistration.CandidateID = string.Empty;
            return string.Empty;
        }


    }
}