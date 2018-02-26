using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class EmployeeRegistration : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        public static string UserID = string.Empty;
        public static string CandidateID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string AllCompaniesList()
        {
            return Fn.Data2Json("SELECT CompanyID, CompanyName FROM tbl_Company order by CompanyName");
        }
        [WebMethod]
        public static string getCompanies(string Level)
        {
            return Fn.Data2Json("SELECT CompanyID, CompanyName FROM tbl_Company Where lvl=" + Level);
        }

        [WebMethod]
        public static string AllDepartments(string CompanyID)
        {
            // return Fn.Data2Json("SELECT DepartmentID,  DepartmentName FROM tbl_Departments where CompanyId = " + CompanyID);



            //            return Fn.Data2Json(@"SELECT        tbl_Departments.DepartmentID, tblDept.Name AS DepartmentName
            //FROM            tbl_Departments INNER JOIN
            //                         tblDept ON tbl_Departments.DepartmentName = tblDept.ID where CompanyId = " + CompanyID);


//            return Fn.Data2Json(@"SELECT        Name AS DepartmentName, ID AS DepartmentID
//FROM            tblDept
//WHERE ID IN (SELECT    Distinct    DepartmentName
//FROM            tbl_Departments where CompanyId = " + CompanyID + ")");

            return Fn.Data2Json(@"SELECT        Name AS DepartmentName, ID AS DepartmentID
FROM            tblDept
");
        }


        [WebMethod]
        public static string AllDesignation(string CompanyID)
        {
            // return Fn.Data2Json("SELECT DesignationID, CompanyID, Designation FROM tbl_Designation where CompanyID = '" + CompanyID + "' order by Designation");
            ////            return Fn.Data2Json(@"SELECT        tbl_Designation.DesignationID, tbl_Designation.CompanyID, tblDesig.NAME AS Designation
            ////FROM            tbl_Designation INNER JOIN
            ////                         tblDesig ON tbl_Designation.Designation = tblDesig.ID where CompanyID = '" + CompanyID + "' order by Designation");

//            return Fn.Data2Json(@"SELECT        NAME AS Designation, ID AS DesignationID
//FROM            tblDesig WHERE ID IN (SELECT   Distinct     Designation
//FROM            tbl_Designation where CompanyID = '" + CompanyID + "') order by Designation");

            return Fn.Data2Json(@"SELECT        NAME AS Designation, ID AS DesignationID
FROM            tblDesig  order by Designation");

        }


        [WebMethod]
        public static string AllGroups(string CompanyID)
        {
            //return Fn.Data2Json("SELECT User_Group_Id, User_Group_Name, Group_Level, Description, Priority FROM User_Groups where CompanyID = '" + CompanyID + "' order by Priority");
            return Fn.Data2Json("SELECT User_Group_Name, User_Group_Id, Group_Level, StrDescription, MP FROM User_Groups ORDER BY Group_Level");
        }


        [WebMethod]
        public static string SaveBasicData(string vals, string loc)
        {
            string[] d = vals.Split('½');
            string[] l = loc.Split('½');
            if (d[17] == "0")
            {


                DataSet ds = Fn.FillDSet(@"SELECT 
'FRDP-EMP-' +RIGHT('0000' + CAST(MAX(EmpNo) + 1 AS VARCHAR(50)) ,3) 
AS EmpNo 
,  CAST(MAX(EmpNo) + 1 AS VARCHAR(50))  EC
FROM (
SELECT CAST(EmpNo AS INT) EmpNo FROM [dbo].[TblHResources] WHERE EmpNo IS NOT NULL
) AS X");

                DataTable dttt = ds.Tables[0];
                string eno = Convert.ToString(dttt.Rows[0][0]);
                string en = Convert.ToString(dttt.Rows[0][1]);
                string UserID = Fn.ExenID("INSERT INTO TblHResources (EmpNo, CNIC, Full_Name, FatherName, DOB, Is_Male, CompanyID, DeptID, DesignationID, UserGroupID, ContactNos, U_Status, Qualification, Email, AppointmentDate, ResignationDate, Address, EnteryDate) VALUES ('" + en + "','" + d[1] + "','" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "','" + d[12] + "','" + d[13] + "','" + d[14] + "','" + d[15] + "','" + d[16] + "', Getdate());  Select Scope_Identity();");


                Fn.Exec("DELETE FROM TblHResourcesLocations WHERE UserID=" + UserID);

                foreach (var item in l)
                {
                    Fn.Exec(@"INSERT INTO TblHResourcesLocations
                         (User_ID, LocID)
                    VALUES ("+UserID+","+item+")");
                }

                Fn.Exec(@"UPDATE       TblHResources
                SET                U_Pass ='" + Encryptor.Encrypt(d[0]) + "' where User_ID=" + UserID);
                Fn.Exec(@"INSERT INTO Login
                         (UserName, Password, Created_Date, User_Group_Id, Emp_Id, Login_Status, IP_Check)
                VALUES        ('" + eno + "' ,'" + Encryptor.Encrypt(eno) + "', GETDATE(),'" + d[9] + "','" + UserID + "', 1, 0)");

                return UserID;
            }
            else
            {
                Fn.Exec("UPDATE TblHResources SET CNIC = '" + d[1] + "', Full_Name = '" + d[2] + "', FatherName = '" + d[3] + "', DOB = '" + d[4] + "', Is_Male = '" + d[5] + "', CompanyID = '" + d[6] + "', DeptID = '" + d[7] + "', DesignationID = '" + d[8] + "', UserGroupID = '" + d[9] + "', ContactNos = '" + d[10] + "', U_Status = '" + d[11] + "', Qualification = '" + d[12] + "', Email = '" + d[13] + "', AppointmentDate = '" + d[14] + "', ResignationDate = '" + d[15] + "', Address = '" + d[16] + "' where User_ID = '" + d[17] + "';  Select Scope_Identity();");

                Fn.Exec(@"UPDATE Login
                         SET User_Group_Id='" + d[9] + "' WHERE Emp_Id =" + d[17]);



                Fn.Exec("DELETE FROM TblHResourcesLocations WHERE User_ID=" + d[17]);
                List<TblHResourcesLocation> el = new List<TblHResourcesLocation>();
                foreach (var item in l)
                {
                 //   Fn.Exec(@"INSERT INTO TblHResourcesLocations (User_ID, LocID) VALUES (" + d[17] + "," + item + ")");
                    if (item != "")
                    {
                        el.Add(new TblHResourcesLocation() { LocID = Convert.ToInt32(item), User_ID = Convert.ToInt32(d[17]) });
                    }
                    
                }
                if (l.Length>0)
                {
                    using (DBDataContext db = new DBDataContext())
                    {
                        db.TblHResourcesLocations.InsertAllOnSubmit(el);
                        db.SubmitChanges();
                    }   
                }


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
            return Fn.Data2Json(@"SELECT User_ID, Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, Format(DOB, 'dd - MMMM - yyyy') as DOB, Is_Male, Format(AppointmentDate, 'dd - MMMM - yyyy') as AppointmentDate, Format(ResignationDate, 'dd - MMMM - yyyy') as ResignationDate, Address, U_Status FROM            (SELECT        User_ID, Full_Name AS Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, DOB, Is_Male, AppointmentDate, ResignationDate, Address, U_Status FROM            TblHResources UNION ALL SELECT 0 AS User_ID, tbl_Candidates.Name, tbl_Candidates.CellNo AS ContactNos, tbl_Candidates.EmailAddress AS Email, '' AS Qualification, tbl_Candidates.CompanyID, tbl_Candidates.DepartmentID AS DeptID, tbl_Candidates.JobDesignationID AS DesignationID, 0 AS UserGroupID, '' AS EmpNo, tbl_Candidates.CNIC, tbl_Candidates.FatherName, tbl_Candidates.DateOfBirth AS DOB, tbl_Candidates.Is_Male, '' AS AppointmentDate, '' AS ResignationDate, tbl_Candidates.StreetAddress, 0 AS U_Status FROM            tbl_Candidates inner JOIN tbl_SelectedCandidates ON tbl_SelectedCandidates.CandidateID = tbl_Candidates.CandidateID) AS Tab where Replace(Tab.CNIC, '-', '') = Replace('" + cnic + "', '-', '')");
        }


        [WebMethod]
        public static string LoadPreviousDataByID(string cnic)
        {
            return Fn.Data2Json(@"SELECT User_ID, Name, ContactNos, Email, Qualification, CompanyID, DeptID, 
DesignationID, UserGroupID, EmpNo, CNIC, FatherName, Format(DOB, 'dd - MMMM - yyyy') as DOB, 
Is_Male, Format(AppointmentDate, 'dd - MMMM - yyyy') as AppointmentDate, 
Format(ResignationDate, 'dd - MMMM - yyyy') as ResignationDate, Address, U_Status FROM           
 (
 
 
SELECT        User_ID, Full_Name AS Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, 

'FRDP-EMP-' + RIGHT('0000' + EmpNo, 3)
as EmpNo
, CNIC, FatherName, DOB, Is_Male, AppointmentDate, ResignationDate, Address, 
                         U_Status
FROM            TblHResources


	 
	 
	 
	 
	 ) AS Tab where User_ID = '" + cnic + "'");
        }

        [WebMethod]
        public static string LoadEmployeeData()
        {
            if (EmployeeRegistration.CandidateID != null)
            {
                return Fn.Data2Json("SELECT User_ID, Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, Format(DOB, 'dd - MMMM - yyyy') as DOB, Is_Male, Format(AppointmentDate, 'dd - MMMM - yyyy') as AppointmentDate, Format(ResignationDate, 'dd - MMMM - yyyy') as ResignationDate, Address, U_Status FROM            (SELECT        User_ID, Full_Name AS Name, ContactNos, Email, Qualification, CompanyID, DeptID, DesignationID, UserGroupID, EmpNo, CNIC, FatherName, DOB, Is_Male, AppointmentDate, ResignationDate, Address, U_Status FROM            TblHResources UNION ALL SELECT 0 AS User_ID, tbl_Candidates.Name, tbl_Candidates.CellNo AS ContactNos, tbl_Candidates.EmailAddress AS Email, '' AS Qualification, tbl_Candidates.CompanyID, tbl_Candidates.DepartmentID AS DeptID, tbl_Candidates.JobDesignationID AS DesignationID, 0 AS UserGroupID, '' AS EmpNo, tbl_Candidates.CNIC, tbl_Candidates.FatherName, tbl_Candidates.DateOfBirth AS DOB, tbl_Candidates.Is_Male, '' AS AppointmentDate, '' AS ResignationDate, tbl_Candidates.StreetAddress, 0 AS U_Status FROM            tbl_Candidates inner JOIN tbl_SelectedCandidates ON tbl_SelectedCandidates.CandidateID = tbl_Candidates.CandidateID) AS Tab WHERE      Tab.User_ID = '" + EmployeeRegistration.CandidateID + "'");
            }
            EmployeeRegistration.CandidateID = string.Empty;
            return string.Empty;
        }


    }
}