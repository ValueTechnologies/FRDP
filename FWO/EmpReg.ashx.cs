using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace FRDP
{
    /// <summary>
    /// Summary description for EmpReg
    /// </summary>
    public class EmpReg : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            MyClass Fn = new MyClass();

            string[] dataID = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.QueryString["id"])).Split('ǁ');
            string[] fdata = new string[500];
            if (context.Request.Form["ourformData"] != null)
            {
                //string testing = context.Request.Form["ourformData"];
                fdata = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form["ourformData"])).Split('½');
            }
            {
                try
                {
                    context.Response.ContentType = "text/HTML";
                    switch (Convert.ToInt32(dataID[0]))
                    {
                        case 0:
                            using (DBDataContext db = new DBDataContext())
                            {
                                if (db.TblHResources.Where(vv => vv.EmpNo.ToUpper() == dataID[1].Replace("FRDP-EMP-", "").ToUpper()).Count() > 0)
                                {
                                    context.Response.Write("-1");
                                }
                                else
                                {
                                    context.Response.Write("1");
                                }
                            }
                            break;
                        case 1:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblInventoryDefault
SET                MaxLevels =" + dataID[1] + @"
WHERE        (tblInventoryDefaultID = 1)"));
                            break;


                        case 2:


                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvItemsID, Code, Name, ISNULL(bIsHead,0) bIsHead, Branch= (

Select count(*) from tblInvItems as B where B.ParentId= M.tblInvItemsID
)
FROM            tblInvItems AS M
WHERE  ParentId IS NULL order by Code"));
                            break;


                        case 3:

                            context.Response.Write(Fn.Data2Json(@" SELECT        tblInvItemsID, Code, Name, ISNULL(bIsHead,0) bIsHead, Branch= (

Select count(*) from tblInvItems as B where B.ParentId= M.tblInvItemsID
)
FROM            tblInvItems AS M
WHERE  ParentId =" + dataID[1] + " order by Code"));
                            break;

                        case 4:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblInvItems
SET                Name = '" + HttpUtility.UrlDecode(dataID[1]) + @"', bIsHead='" + dataID[3] + @"' , Unit= '" + HttpUtility.UrlDecode(dataID[4]) + @"' , MinStockLevel='" + dataID[5] + @"', Menufecturer='" + HttpUtility.UrlDecode(dataID[6]) + @"', Description='" + HttpUtility.UrlDecode(dataID[7]) + @"'
WHERE        (tblInvItemsID = " + dataID[2] + ")"));
                            break;

                        case 5:
                            decimal? tblid = 0;
                            int? tblcode = 0;
                            using (DBDataContext db = new DBDataContext())
                            {
                                db.sp_tblInvItems_Insert(HttpUtility.UrlDecode(dataID[1]), HttpUtility.UrlDecode(dataID[2]), HttpUtility.UrlDecode(dataID[3]), ref tblid, ref tblcode, HttpUtility.UrlDecode(dataID[4]), Convert.ToInt32(HttpUtility.UrlDecode(dataID[5])), HttpUtility.UrlDecode(dataID[6]), HttpUtility.UrlDecode(dataID[7]));
                            }
                            string sssssss = Convert.ToString(tblid) + "½" + Convert.ToString(tblcode);
                            context.Response.Write(sssssss);
                            break;

                        case 6:
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblinvStore
                         (txtStoreName, Type, LocationsID, storeInchargeEmpID, txtContactNo1, txtContactNo2)
                         VALUES        ('" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "')"));
                            break;

                        case 7:
                            //                        context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStoreID, txtStoreName, Type, LocationsID, storeInchargeEmpID, txtContactNo1, txtContactNo2
                            //FROM            tblinvStore"));

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStore.tblinvStoreID, tblinvStore.txtStoreName, tblinvStore.Type, tblinvStore.LocationsID, tblinvStore.storeInchargeEmpID, tblinvStore.txtContactNo1, tblinvStore.txtContactNo2, tbl_Company.CompanyName, 
                         ISNULL(Website_User.EMP_Prefix,'') +' '+ISNULL(Website_User.EF_Name,'') as Emp_Name
FROM            tblinvStore INNER JOIN
                         tbl_Company ON tblinvStore.LocationsID = tbl_Company.CompanyID INNER JOIN
                         Website_User ON tblinvStore.storeInchargeEmpID = Website_User.Emp_Id"));
                            break;

                        case 8:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStoreID, txtStoreName, Type, LocationsID, storeInchargeEmpID, txtContactNo1, txtContactNo2
FROM            tblinvStore where tblinvStoreID=" + dataID[1]));
                            break;

                        case 9:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblinvStore
SET                txtStoreName ='" + dataID[1] + "', Type ='" + dataID[2] + "', LocationsID ='" + dataID[3] + "', storeInchargeEmpID ='" + dataID[4] + "', txtContactNo1 ='" + dataID[5] + "', txtContactNo2 = '" + dataID[6] + "'  where tblinvStoreID=" + dataID[7]));
                            break;


                        case 10:
                            context.Response.Write(Fn.Exec(@"Delete       tblinvStore   where tblinvStoreID=" + dataID[1]));
                            break;

                        case 11:

                            using (DBDataContext db = new DBDataContext())
                            {
                                int? Next = 0;
                                try
                                {
                                    //var = Convert.ToInt32(db.TblHResources.Where(vvv=>vvv.EmpNo!=null).Max(s => s.empl ?? 0));
                                }
                                catch
                                {

                                    Next = 1;
                                }
                                if (Next == null)
                                {
                                    Next = 1;
                                }
                                // Next += 1;
                                //db.tblVenders.Where(v => v.CategoryVenderContractor == dataID[1]).Max(s => s.VenderNo ?? 0)+1)
                                context.Response.Write(Convert.ToString(Next));
                            }
                            break;

                        case 12:
                            context.Response.Write(Fn.Data2Json(@"Select Name + ' (" + dataID[1] + "' + RIGHT( '00000000000000000'+  CAST(VenderNo as varchar(10)),5)+')' Name, tblVenderID  from [dbo].[tblVender] where CategoryVenderContractor='" + dataID[2] + "'"));
                            break;

                        case 13:
                            context.Response.Write(Fn.Data2Json(@"Select DISTINCT CategoryVenderContractor from [dbo].[tblVender] where CategoryVenderContractor!='Vendor'"));
                            break;

                        case 14:

                            context.Response.Write(Fn.Data2Json(@"Select  tblVenderID, RIGHT( '00000000000'+ CAST(VenderNo AS VARCHAR(10)) ,5) AS VenderNo, Type, Name, CNIC_CompanyNTN, mobileNo1, mobileno2, phone1, phone2, Fax, Email, Address, CategoryVenderContractor from tblVender " + dataID[1].Replace("▓", "'") + " " + dataID[2]));
                            break;
                        case 15:
                            context.Response.Write(Fn.Data2Json(@"Select * from tblVender_ContactPerson " + dataID[1] + " " + dataID[2]));
                            break;

                        case 16:
                            context.Response.Write(Fn.Data2Json(@"Select * from tbl_Company where ParentId is null"));
                            break;
                        case 17:
                            context.Response.Write(Fn.Data2Json("EXEC SP_AllCompaniesList"));
                            break;
                        case 18:
                            context.Response.Write(Fn.Data2Json("SELECT Emp_Id, ISNULL(EMP_Prefix,'') +' '+ISNULL(EF_Name,'') as Emp_Name  FROM [dbo].[Website_User]"));
                            break;
                        case 19:
                            context.Response.Write(Fn.Data2Json(@"Select * from tblInvItems where tblInvItemsID= " + dataID[1]));
                            break;

                        case 20:
                            context.Response.Write(Fn.Data2Json(@"Select * from tblDept Order by Name"));
                            break;
                        case 21:
                            context.Response.Write(Fn.Data2Json(@"Select * from tblDesig Order by Name"));
                            break;

                        case 22:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResources.User_ID, TblHResources.Full_Name, TblHResources.ContactNos, TblHResources.Email, TblHResources.Designation, TblHResources.EnteryDate, TblHResources.SubTask_ID, 
                         TblHResources.Expertise, TblHResources.Qualification, TblHResources.Experience, TblHResources.U_ThemeID, TblHResources.U_Pass, TblHResources.Repli, TblHResources.Group_ID, 
                         TblHResources.Branch_ID, TblHResources.Regions, TblHResources.Distt, TblHResources.U_Status, TblHResources.PO_ID, TblHResources.Deportment, TblHResources.enter_by, TblHResources.modify_by, 
                         TblHResources.ProjectID, TblHResources.DisplayName, TblHResources.CompanyID, TblHResources.DeptID, TblHResources.DesignationID, TblHResources.UserGroupID, 'FRDP-EMP-'+RIGHT('000'+TblHResources.EmpNo,3) EmpNo, 
                         TblHResources.CNIC, TblHResources.FatherName, TblHResources.DOB, TblHResources.Is_Male, TblHResources.AppointmentDate, TblHResources.ResignationDate, TblHResources.Address, 
                         TblHResources.CVExtension, TblHResources.PhotoExtension, TblHResources.Salary, tblDesig.NAME AS Designations, tblDept.Name AS Department, tbl_Company.CompanyName AS Area
FROM            TblHResources INNER JOIN
                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID INNER JOIN
                         tblDesig ON TblHResources.DesignationID = tblDesig.ID INNER JOIN
                         tblDept ON TblHResources.DeptID = tblDept.ID WHERE    (TblHResources.U_Status=1)"));


                            break;


                        case 23:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResources.User_ID, TblHResources.Full_Name, TblHResources.ContactNos, TblHResources.Email, TblHResources.Designation, TblHResources.EnteryDate, TblHResources.SubTask_ID, 
                         TblHResources.Expertise, TblHResources.Qualification, TblHResources.Experience, TblHResources.U_ThemeID, TblHResources.U_Pass, TblHResources.Repli, TblHResources.Group_ID, 
                         TblHResources.Branch_ID, TblHResources.Regions, TblHResources.Distt, TblHResources.U_Status, TblHResources.PO_ID, TblHResources.Deportment, TblHResources.enter_by, TblHResources.modify_by, 
                         TblHResources.ProjectID, TblHResources.DisplayName, TblHResources.CompanyID, TblHResources.DeptID, TblHResources.DesignationID, TblHResources.UserGroupID, 'FRDP-EMP-'+RIGHT('000'+TblHResources.EmpNo,3) EmpNo, 
                         TblHResources.CNIC, TblHResources.FatherName, TblHResources.DOB, TblHResources.Is_Male, TblHResources.AppointmentDate, TblHResources.ResignationDate, TblHResources.Address, 
                         TblHResources.CVExtension, TblHResources.PhotoExtension, TblHResources.Salary, tblDesig.NAME AS Designations, tblDept.Name AS Department, tbl_Company.CompanyName AS Area
FROM            TblHResources INNER JOIN
                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID INNER JOIN
                         tblDesig ON TblHResources.DesignationID = tblDesig.ID INNER JOIN
                         tblDept ON TblHResources.DeptID = tblDept.ID
WHERE    (TblHResources.U_Status=1)  AND  (TblHResources.CompanyID = " + dataID[1] + ")"));
                            break;



                        case 24:

                            context.Response.Write(Fn.Data2Json(@"EXEC CROSSTAB '

SELECT        CompanyName ServiceArea, Designation,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            TblHResources
                               WHERE        (CompanyID = X.CID) AND (DesignationID = X.DID)) AS Total
FROM            (SELECT        tbl_Company.CompanyName, tblDesig.NAME AS Designation, tbl_Company.CompanyID AS CID, tblDesig.ID AS DID
                          FROM            tbl_Company CROSS JOIN
                                                    tblDesig
                          WHERE        (tbl_Company.CompanyID IN (6, 7, 8, 9, 10, 11, 12, 13, 14, 15))) AS X

						  ','ServiceArea','SUM(Total ELSE 0 )[]','Designation'"));
                            break;


                        case 25:
                            context.Response.Write(Fn.Data2Json(@"SELECT        LocID
FROM            TblHResourcesLocations
WHERE        (User_ID = " + dataID[1] + ")"));
                            break;



                        case 26:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResources.User_ID, TblHResources.Full_Name, TblHResources.ContactNos, TblHResources.Email, TblHResources.Designation, TblHResources.EnteryDate, TblHResources.SubTask_ID, 
                         TblHResources.Expertise, TblHResources.Qualification, TblHResources.Experience, TblHResources.U_ThemeID, TblHResources.U_Pass, TblHResources.Repli, TblHResources.Group_ID, 
                         TblHResources.Branch_ID, TblHResources.Regions, TblHResources.Distt, TblHResources.U_Status, TblHResources.PO_ID, TblHResources.Deportment, TblHResources.enter_by, TblHResources.modify_by, 
                         TblHResources.ProjectID, TblHResources.DisplayName, TblHResources.CompanyID, TblHResources.DeptID, TblHResources.DesignationID, TblHResources.UserGroupID, 'FRDP-EMP-'+RIGHT('000'+TblHResources.EmpNo,3) EmpNo, 
                         TblHResources.CNIC, TblHResources.FatherName, TblHResources.DOB, TblHResources.Is_Male, TblHResources.AppointmentDate, TblHResources.ResignationDate, TblHResources.Address, 
                         TblHResources.CVExtension, PhotoExtension= CASE WHEN TblHResources.PhotoExtension IS NULL THEN '0.png' else CAST(TblHResources.User_ID AS VARCHAR(10)) +'B'+ TblHResources.PhotoExtension END,Salary= ISNULL(TblHResources.Salary,0), tblDesig.NAME AS Designations, tblDept.Name AS Department, tbl_Company.CompanyName AS Area
FROM            TblHResources INNER JOIN
                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID INNER JOIN
                         tblDesig ON TblHResources.DesignationID = tblDesig.ID INNER JOIN
                         tblDept ON TblHResources.DeptID = tblDept.ID
WHERE     (TblHResources.U_Status=1)  AND  (TblHResources.User_ID = " + dataID[1] + ")"));
                            break;
                        case 27:

                            context.Response.Write(Fn.Exec(@"EXEC sp_tblEmpTransfer_Insert  @tblHResourceID ='" + dataID[1] + @"',
@LocationIDB ='" + dataID[2] + @"',
@DepartmentB='" + dataID[3] + @"',
@DesignationB='" + dataID[4] + @"',
@RoleB='" + dataID[5] + @"',
@SalaryB='" + dataID[6] + @"',
@dtTransferDate='" + dataID[7] + @"',
@tblEmpShiftID='" + dataID[8] + @"',
@EnterByEmpID='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"',
@Locations='" + dataID[9] + @"'
"));




                            break;

                        case 28:
                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblEmpTransfer.tblEmpTransferID, CONVERT(VARCHAR(50), tblEmpTransfer.dtTransferDate, 103) AS TDT, tblEmpTransfer.dtTransferDate, tblEmpTransfer.LocationIDA, tblEmpTransfer.LocationIDB, 
                            //                         tblEmpTransfer.DepartmentA, tblEmpTransfer.DepartmentB, tblEmpTransfer.DesignationA, tblEmpTransfer.DesignationB, tblEmpTransfer.RoleA, tblEmpTransfer.RoleB, tblEmpTransfer.SalaryA, 
                            //                         tblEmpTransfer.SalaryB, tblEmpTransfer.tblHResourceID, tblEmpTransfer.dtDateTime, tblEmpTransfer.EnterByEmpID, tbl_Company_1.CompanyName AS CompanyNameA, 
                            //                         tbl_Company.CompanyName AS CompanyNameB, tblDept.Name AS DeptNameA, tblDept_1.Name AS DeptNameB, tblDesig.NAME AS DesigA, tblDesig_1.NAME AS DesigB, 
                            //                         User_Groups.User_Group_Name AS GroupA, User_Groups_1.User_Group_Name AS GroupB, ValueResources.tblEmpShift.strShiftName AS ShiftA, tblEmpShift_1.strShiftName AS ShiftB
                            //FROM            ValueResources.tblEmpShift INNER JOIN
                            //                         User_Groups INNER JOIN
                            //                         tblDept INNER JOIN
                            //                         tblEmpTransfer INNER JOIN
                            //                         tbl_Company AS tbl_Company_1 ON tblEmpTransfer.LocationIDA = tbl_Company_1.CompanyID INNER JOIN
                            //                         tbl_Company ON tblEmpTransfer.LocationIDB = tbl_Company.CompanyID ON tblDept.ID = tblEmpTransfer.DepartmentA INNER JOIN
                            //                         tblDept AS tblDept_1 ON tblEmpTransfer.DepartmentB = tblDept_1.ID INNER JOIN
                            //                         tblDesig ON tblEmpTransfer.DesignationA = tblDesig.ID INNER JOIN
                            //                         tblDesig AS tblDesig_1 ON tblEmpTransfer.DesignationB = tblDesig_1.ID ON User_Groups.User_Group_Id = tblEmpTransfer.RoleA INNER JOIN
                            //                         User_Groups AS User_Groups_1 ON tblEmpTransfer.RoleB = User_Groups_1.User_Group_Id ON ValueResources.tblEmpShift.tblEmpShiftID = tblEmpTransfer.tblEmpShiftIDA INNER JOIN
                            //                         ValueResources.tblEmpShift AS tblEmpShift_1 ON tblEmpTransfer.tblEmpShiftIDB = tblEmpShift_1.tblEmpShiftID
                            //
                            //
                            //						 WHERE    TblHResources.U_Status=1 AND tblEmpTransfer.tblHResourceID = " + dataID[1] + @"
                            //						 order by dtTransferDate"));

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblEmpTransfer.tblEmpTransferID, CONVERT(VARCHAR(50), tblEmpTransfer.dtTransferDate, 103) AS TDT, tblEmpTransfer.dtTransferDate, tblEmpTransfer.LocationIDA, tblEmpTransfer.LocationIDB, 
                         tblEmpTransfer.DepartmentA, tblEmpTransfer.DepartmentB, tblEmpTransfer.DesignationA, tblEmpTransfer.DesignationB, tblEmpTransfer.RoleA, tblEmpTransfer.RoleB, tblEmpTransfer.SalaryA, 
                         tblEmpTransfer.SalaryB, tblEmpTransfer.tblHResourceID, tblEmpTransfer.dtDateTime, tblEmpTransfer.EnterByEmpID, tbl_Company_1.CompanyName AS CompanyNameA, 
                         tbl_Company.CompanyName AS CompanyNameB, tblDept.Name AS DeptNameA, tblDept_1.Name AS DeptNameB, tblDesig.NAME AS DesigA, tblDesig_1.NAME AS DesigB, 
                         User_Groups.User_Group_Name AS GroupA, User_Groups_1.User_Group_Name AS GroupB, ValueResources.tblEmpShift.strShiftName AS ShiftA, tblEmpShift_1.strShiftName AS ShiftB
FROM            ValueResources.tblEmpShift INNER JOIN
                         User_Groups INNER JOIN
                         tblDept INNER JOIN
                         tblEmpTransfer INNER JOIN
                         tbl_Company AS tbl_Company_1 ON tblEmpTransfer.LocationIDA = tbl_Company_1.CompanyID INNER JOIN
                         tbl_Company ON tblEmpTransfer.LocationIDB = tbl_Company.CompanyID ON tblDept.ID = tblEmpTransfer.DepartmentA INNER JOIN
                         tblDept AS tblDept_1 ON tblEmpTransfer.DepartmentB = tblDept_1.ID INNER JOIN
                         tblDesig ON tblEmpTransfer.DesignationA = tblDesig.ID INNER JOIN
                         tblDesig AS tblDesig_1 ON tblEmpTransfer.DesignationB = tblDesig_1.ID ON User_Groups.User_Group_Id = tblEmpTransfer.RoleA INNER JOIN
                         User_Groups AS User_Groups_1 ON tblEmpTransfer.RoleB = User_Groups_1.User_Group_Id ON ValueResources.tblEmpShift.tblEmpShiftID = tblEmpTransfer.tblEmpShiftIDA INNER JOIN
                         ValueResources.tblEmpShift AS tblEmpShift_1 ON tblEmpTransfer.tblEmpShiftIDB = tblEmpShift_1.tblEmpShiftID


						 WHERE    tblEmpTransfer.tblHResourceID = " + dataID[1] + @"
						 order by dtTransferDate"));

                            break;


                        case 29:
                            context.Response.Write(Fn.Data2Json(@"	SELECT 
'FRDP-EMP-' +RIGHT('0000' + CAST(MAX(EmpNo) + 1 AS VARCHAR(50)) ,3)
AS EmpNo FROM (
SELECT ISNULL(MAX(ISNULL(CAST(EmpNo AS INT),0)),0) EmpNo FROM [dbo].[TblHResources] WHERE EmpNo IS NOT NULL
) AS X"));

                            break;
                        case 30:
                            context.Response.Write(Fn.Exec(@"update tblemployee
set tblEmpShiftID = " + dataID[2] + @"
where EmpID=" + dataID[1]));
                            break;
                        case 31:
                            context.Response.Write(Fn.Exec(@"update tblemployee
set BPay = " + dataID[2] + @"
where EmpID=" + dataID[1]));
                            break;




                        case 32:
                            context.Response.Write(Fn.HTMLTable1(@"exec [dbo].[Select_Single_Employee_AttendanceDashBoard] @Month='" + DateTime.Now.Month + "', @Year='" + DateTime.Now.Year + "', @Emp_ID='" + dataID[1] + "'"));
                            break;


                        case 33:
                            context.Response.Write(Fn.HTMLTableWithID1(@"exec [dbo].[sp_AreaWiseAllEmployeeAttendanceSheet] @Month='" + dataID[1] + "', @Year='" + dataID[2] + "', @LocationID='" + dataID[3] + "'", "tblatt"));
                            break;
                        case 34:
                            string[] sd34 = dataID[2].Split('/');
                            context.Response.Write(Fn.HTMLTableWithID1(@"exec [dbo].[sp_AreaWiseAllEmployeeAttendanceSheet] @Month='" + sd34[1] + "', @Year='" + sd34[2] + "', @LocationID='" + dataID[1] + "'", "tblattx"));
                            break;


                        case 35:
                            string[] s35 = dataID[2].Split('/');
                            string s32d = s35[2] + "-" + s35[1] + "-" + s35[0];

                            //context.Response.Write(Fn.Exec(@"EXEC DBO.spAddEditAttendance " + dataID[1] + ", '" +dataID[2]  + "' ,  '"+ s32d+" "+ dataID[3] + "' , '"+ s32d+" "+ dataID[4] + "' "));

                            context.Response.Write(Fn.Exec(@"EXEC DBO.spAddEditAttendance @Emp_ID=" + dataID[1] + ", @For_Day='" + dataID[2] + "' ,  @Time_In='" + s32d + " " + dataID[3] + "' , @Time_out='" + dataID[5].Split('/')[2] + "-" + dataID[5].Split('/')[1] + "-" + dataID[5].Split('/')[0] + " " + dataID[4] + "' ,@EnterByEmp='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "' "));
                            break;

                        case 36:
                            context.Response.Write(Fn.Exec(@" Delete [dbo].[Emp_Shift_Attendence] where [Emp_ID] = '" + dataID[1] + "' and [For_Day]= CONVERT(DATETIME, '" + dataID[2] + "',103)"));
                            break;

                        case 37:
                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        CompanyName, CompanyID, Total, Present=(
                            //SELECT      COUNT(Emp_Shift_Attendence.Emp_ID) C
                            //FROM            Emp_Shift_Attendence INNER JOIN
                            //                         TblHResources ON Emp_Shift_Attendence.Emp_ID = TblHResources.User_ID
                            //WHERE        (Emp_Shift_Attendence.For_Day = CONVERT(DATETIME, '"+ dataID[1] +@"', 103)) AND (TblHResources.CompanyID = A.CompanyID)
                            //)
                            //FROM            (SELECT        tbl_Company.CompanyName, tbl_Company.CompanyID, COUNT(TblHResources.User_ID) AS Total
                            //                          FROM            TblHResources INNER JOIN
                            //                                                    tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID
                            //                          GROUP BY tbl_Company.CompanyName, tbl_Company.CompanyID) AS A
                            //						  order by A.CompanyName"));
                            //                            
                            context.Response.Write(Fn.Data2Json(@"exec sp_EmpReg37 '" + dataID[1] + "'"));
                            break;
                        case 38:
                            context.Response.Write(Fn.HTMLTable1(@"exec [dbo].[Select_Single_Employee_AttendanceDashBoard] @Month='" + dataID[2] + "', @Year='" + dataID[3] + "', @Emp_ID='" + dataID[1] + "'"));
                            break;
                        case 39:
                            try
                            {
                                //                                context.Response.Write(Fn.Data2Json(@"SELECT        TblHResources.User_ID, TblHResources.Full_Name, TblHResources.ContactNos,
                                //                         CASE WHEN TblHResources.PhotoExtension IS NULL THEN '0.png' ELSE CAST(TblHResources.User_ID AS VARCHAR(10)) 
                                //                         + 'B' + TblHResources.PhotoExtension END AS PhotoExtension, 
                                //						 'PPHI-EMP-' + RIGHT('000' + TblHResources.EmpNo, 3) AS EmpNo,
                                //TblHResources.CNIC,
                                // TblHResources.FatherName,
                                // tblDesig.NAME AS Designations,
                                // tbl_Company.CompanyName AS Area,
                                //  Shift.Shift
                                //                         
                                //FROM            TblHResources INNER JOIN
                                //                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID INNER JOIN
                                //                         tblDesig ON TblHResources.DesignationID = tblDesig.ID INNER JOIN
                                //                         tblDept ON TblHResources.DeptID = tblDept.ID INNER JOIN
                                //                         Shift ON TblHResources.tblEmpShiftID = Shift.Shift_ID
                                //WHERE    (TblHResources.U_Status=1) AND       (TblHResources.User_ID = " + dataID[1] + ")"));


                                context.Response.Write(Fn.Data2Json(@"EXEC sp_EmpReg39 " + dataID[1]));
                            }
                            catch (Exception ex)
                            {

                                context.Response.Write(ex.Message);
                            }

                            break;

                        case 40:
                            context.Response.Write(Fn.Data2Json(@"EXEC SP_GETUSERDTLBYLOGINCOUNT '" + dataID[1] + "', '" + dataID[2] + "', " + dataID[3] + " , '" + dataID[4] + "'"));
                            break;

                        case 41:
                            //                            context.Response.Write(Fn.HTMLTable1(@"SELECT        CONVERT(VARCHAR(50), DATEADD(MINUTE, 540, LoginDT), 103) AS Date, DATENAME(WEEKDAY, DATEADD(MINUTE, 540, LoginDT)) AS Day, substring(convert(varchar(20), DATEADD(MINUTE, 540, LoginDT), 9), 13, 5) + ' ' + substring(convert(varchar(30), DATEADD(MINUTE, 540, LoginDT), 9), 25, 2) AS Time
                            //FROM            tblUserLog
                            //WHERE        (UserID = " + dataID[1] + @") and DATEADD(MINUTE, 540, LoginDT) between Convert(DATETIME,'" + dataID[2] + @"',103) AND DATEADD(MINUTE, 1439,Convert(DATETIME,'" + dataID[3] + @"',103))
                            //ORDER BY DATEADD(MINUTE, 540, LoginDT)"));


                            //                            context.Response.Write(Fn.HTMLTable1(@"SELECT        CONVERT(VARCHAR(50), DATEADD(MINUTE, 540, LoginDT), 103) AS Date, DATENAME(WEEKDAY, DATEADD(MINUTE, 540, LoginDT)) AS Day, substring(convert(varchar(20), DATEADD(MINUTE, 540, LoginDT), 9), 13, 5) + ' ' + substring(convert(varchar(30), DATEADD(MINUTE, 540, LoginDT), 9), 25, 2) AS Time
                            //FROM            tblUserLog
                            //WHERE        (UserID = " + dataID[1] + @") and  LoginDT between Convert(DATETIME,'" + dataID[2] + @"',103) AND Convert(DATETIME,'" + dataID[3] + @"',103)
                            //ORDER BY LoginDT "));


                            context.Response.Write(Fn.HTMLTable1(@"sp_EmpReg41 '" + dataID[1] + @"','" + dataID[2] + @"','" + dataID[3] + @"'"));
                            break;

                        case 42:
                            context.Response.Write(Fn.Data2Json(@"EXEC SP_GETUSERDTLBYEMPID '" + dataID[1] + "'"));
                            break;
                        case 43:
                            context.Response.Write(Fn.Data2Json(@"EXEC sp_tblEmpDeactivate '" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "'"));
                            break;

                        case 44:
                            context.Response.Write(Fn.Data2Json(@"EXEC sp_tblEmpDeactivateDisplay"));
                            break;

                        case 45:
                            context.Response.Write(Fn.Data2Json(@"EXEC sp_tblEmpDeactivateRemove '" + dataID[1] + "'"));
                            break;

                        case 46:

                            context.Response.Write(Fn.Data2Json(@"EXEC sp_EmpAttendanceCompare '01/06/2015', '01/09/2015', '1'"));
                            break;

                        case 47:

                            context.Response.Write(Fn.Exec(@"INSERT INTO tbl_Company
                         (CompanyName, CompanyAbbrivation, CompanyPhoneNo, CompanyEmail, CompanyPhoneNo1, CompanyEstablishmentYear, TblVillageCity, CompanyAddress, GPS, Type)
VALUES        ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', '" + dataID[7] + "', '" + dataID[8] + "', '" + dataID[9] + "','" + dataID[11] + "')"));
                            break;


                        case 48:

                            context.Response.Write(Fn.Exec(@"INSERT INTO tbl_Company
                         (CompanyName, CompanyAbbrivation, CompanyPhoneNo, CompanyEmail, CompanyPhoneNo1, CompanyEstablishmentYear, TblVillageCity, CompanyAddress, GPS, Type)
VALUES        ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', '" + dataID[7] + "', '" + dataID[8] + "', '" + dataID[9] + "','" + dataID[11] + "')"));
                            break;

                        case 49:
                            context.Response.Write(Fn.Data2Json(@"exec sp_Offices_MapForDB "));
                            break;

                        case 50:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tbl_Company.CompanyID, tbl_Company.CompanyName, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyPhoneNo1, 
                         tbl_Company.CompanyEmail, tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear, tbl_Company.CompanyDistrictID, tbl_Company.GPS, CASE WHEN ISNULL(CompanyLogo, '') 
                         = '' THEN 'Images/no-image-available-hi.png' ELSE 'Uploads/CompanyProfile/B' + CAST(CompanyID AS VARCHAR(50)) + ISNULL(CompanyLogo, '') + '?'+ CAST(DATEPART(MICROSECOND,GETDATE()) AS VARCHAR(50)) END AS CompanyLogo, tbl_Company.CompanyProvince, 
                         tbl_Company.Code, tbl_Company.ParentId, tbl_Company.TblVillageCity, tbl_Company.Type, tbl_Company.lvl, TblDistrict.RegionID
FROM            tbl_Company INNER JOIN
                         TblDistrict ON tbl_Company.CompanyDistrictID = TblDistrict.DistrictID  WHERE tbl_Company.CompanyID=" + dataID[1]));
                            break;

                        case 51:
                            List<clsLocation> loc = new List<clsLocation>();
                            List<clsLocation> locFU = new List<clsLocation>();
                            List<clsLocation> locUC = new List<clsLocation>();
                            List<clsLocation> locVillage = new List<clsLocation>();
                            using (DBDataContext db = new DBDataContext())
                            {
                                var thisID = db.tbl_Companies.Where(v => v.CompanyID == Convert.ToInt32(dataID[1])).FirstOrDefault();
                                loc = db.TblTehsils.Where(v => v.DistrictID == thisID.CompanyDistrictID).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                                locFU = db.TblFeildUnits.Where(v => v.TehsilID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                                {
                                    LocID = s.FeildUnitID,
                                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == locFU.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                            }
                            clsTehsil obj = new clsTehsil();
                            obj.Tehsil = ddllist(loc);
                            obj.FU = ddllist(locFU);
                            obj.UC = ddllist(locUC);
                            obj.village = ddllist(locVillage);
                            context.Response.Write(new JavaScriptSerializer().Serialize(obj));
                            break;
                        case 52:
//                            context.Response.Write(Fn.Data2Json(@"SELECT        tbl_Company.CompanyID, tbl_Company.CompanyName, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyPhoneNo1, 
//                         tbl_Company.CompanyEmail, tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear, tbl_Company.CompanyDistrictID, tbl_Company.GPS, CASE WHEN ISNULL(CompanyLogo, '') 
//                         = '' THEN 'Images/no-image-available-hi.png' ELSE 'Uploads/CompanyProfile/B' + CAST(CompanyID AS VARCHAR(50)) + ISNULL(CompanyLogo, '') + '?' + CAST(DATEPART(MICROSECOND, GETDATE()) 
//                         AS VARCHAR(50)) END AS CompanyLogo, tbl_Company.CompanyProvince, tbl_Company.Code, tbl_Company.ParentId, tbl_Company.TblVillageCity, tbl_Company.Type, tbl_Company.lvl, 
//                         TblVillageCity.UnionConcilID, TblUnionConcil.FeildUnitID, TblFeildUnit.TehsilID
//FROM            tbl_Company INNER JOIN
//                         TblVillageCity ON tbl_Company.TblVillageCity = TblVillageCity.VillageCityID INNER JOIN
//                         TblUnionConcil ON TblVillageCity.UnionConcilID = TblUnionConcil.UnionConcilID INNER JOIN
//                         TblFeildUnit ON TblUnionConcil.FeildUnitID = TblFeildUnit.FeildUnitID  WHERE tbl_Company.CompanyID=" + dataID[1]));

                            context.Response.Write(Fn.Data2Json(@"SELECT        tbl_Company.CompanyID, tbl_Company.CompanyName, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyPhoneNo1, 
                         tbl_Company.CompanyEmail, tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear, tbl_Company.CompanyDistrictID, tbl_Company.GPS, CASE WHEN ISNULL(CompanyLogo, '') 
                         = '' THEN 'Images/no-image-available-hi.png' ELSE 'Uploads/CompanyProfile/B' + CAST(CompanyID AS VARCHAR(50)) + ISNULL(CompanyLogo, '') + '?' + CAST(DATEPART(MICROSECOND, GETDATE()) 
                         AS VARCHAR(50)) END AS CompanyLogo, tbl_Company.CompanyProvince, tbl_Company.Code, tbl_Company.ParentId, tbl_Company.TblVillageCity, tbl_Company.Type, tbl_Company.lvl, 
                         TblVillageCity.UnionConcilID, TblUnionConcil.FeildUnitID, TblFeildUnit.TehsilID
FROM            TblUnionConcil INNER JOIN
                         TblVillageCity ON TblUnionConcil.UnionConcilID = TblVillageCity.UnionConcilID INNER JOIN
                         TblFeildUnit ON TblUnionConcil.FeildUnitID = TblFeildUnit.FeildUnitID RIGHT OUTER JOIN
                         tbl_Company ON TblVillageCity.VillageCityID = tbl_Company.TblVillageCity   WHERE tbl_Company.CompanyID=" + dataID[1]));
                            break;
                        case 53:
                            context.Response.Write(Fn.Data2Json(@"		SELECT 
'FRDP-EMP-' +RIGHT('0000' + CAST(MAX(EmpNo) + 1 AS VARCHAR(50)) ,5)
AS EmpNo,  CAST(MAX(EmpNo) + 1 AS VARCHAR(50)) ENo FROM (
SELECT ISNULL(MAX(ISNULL(CAST(EmpNo AS INT),0)),0) EmpNo FROM [dbo].[tblEmployee] WHERE EmpNo IS NOT NULL
) AS X"));

                            break;
                        case 54:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,5) AS EmpNo, ISNULL(tblEmployee.FName, '') +' '+ ISNULL(tblEmployee.LName, '')  AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID, tblEmployee.PostTyp
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));
                            break;

                        case 55:
                            context.Response.Write(Fn.Data2Json(@"EXEC sp_EmployeeDisplay_By_tblEmployeeID " + dataID[1]));

                            break;
                        case 56:
                            context.Response.Write(Fn.Data2Json(@"SELECT        BPS, tblEmpShiftID, tblDesigID, tblDept, User_Group_Id, BPay, EmpID
FROM            tblEmployee
WHERE        (EmpID = " + dataID[1] + @")"));

                            break;


                        case 57:

                            context.Response.Write(Fn.Exec(@"EXEC sp_tblEmpTransfer_InsertPPHI  @tblHResourceID ='" + dataID[1] + @"',
@LocationIDB ='" + dataID[2] + @"',
@dtTransferDate='" + dataID[3] + @"',
@DepartmentB='" + dataID[4] + @"',
@DesignationB='" + dataID[5] + @"',
@RoleB='" + dataID[6] + @"',
@SalaryB='" + dataID[7] + @"',
@tblBPSIDB='" + dataID[8] + @"',
@tblEmpShiftID='" + dataID[9] + @"',
@EnterByEmpID='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"',
@Locations='" + dataID[10] + @"'
"));




                            break;


                        case 58:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblEmpTransfer.tblEmpTransferID, CONVERT(VARCHAR(50), tblEmpTransfer.dtTransferDate, 103) AS TDT, tblEmpTransfer.dtTransferDate, tblEmpTransfer.LocationIDA, tblEmpTransfer.LocationIDB, 
                         tblEmpTransfer.DepartmentA, tblEmpTransfer.DepartmentB, tblEmpTransfer.DesignationA, tblEmpTransfer.DesignationB, tblEmpTransfer.RoleA, tblEmpTransfer.RoleB, tblEmpTransfer.SalaryA, 
                         tblEmpTransfer.SalaryB, tblEmpTransfer.tblHResourceID, tblEmpTransfer.dtDateTime, tblEmpTransfer.EnterByEmpID, tbl_Company_1.CompanyName AS CompanyNameA, 
                         tbl_Company.CompanyName AS CompanyNameB, tblDept.Name AS DeptNameA, tblDept_1.Name AS DeptNameB, tblDesig.NAME AS DesigA, tblDesig_1.NAME AS DesigB, 
                         User_Groups.User_Group_Name AS GroupA, User_Groups_1.User_Group_Name AS GroupB, ValueResources.tblEmpShift.strShiftName AS ShiftA, tblEmpShift_1.strShiftName AS ShiftB, 
                         tblBPS_1.BPSDisplay AS tblBPSIDA, tblBPS.BPSDisplay AS tblBPSIDB
FROM            ValueResources.tblEmpShift INNER JOIN
                         User_Groups INNER JOIN
                         tblDept INNER JOIN
                         tblEmpTransfer INNER JOIN
                         tbl_Company AS tbl_Company_1 ON tblEmpTransfer.LocationIDA = tbl_Company_1.CompanyID INNER JOIN
                         tbl_Company ON tblEmpTransfer.LocationIDB = tbl_Company.CompanyID ON tblDept.ID = tblEmpTransfer.DepartmentA INNER JOIN
                         tblDept AS tblDept_1 ON tblEmpTransfer.DepartmentB = tblDept_1.ID INNER JOIN
                         tblDesig ON tblEmpTransfer.DesignationA = tblDesig.ID INNER JOIN
                         tblDesig AS tblDesig_1 ON tblEmpTransfer.DesignationB = tblDesig_1.ID ON User_Groups.User_Group_Id = tblEmpTransfer.RoleA INNER JOIN
                         User_Groups AS User_Groups_1 ON tblEmpTransfer.RoleB = User_Groups_1.User_Group_Id ON ValueResources.tblEmpShift.tblEmpShiftID = tblEmpTransfer.tblEmpShiftIDA INNER JOIN
                         ValueResources.tblEmpShift AS tblEmpShift_1 ON tblEmpTransfer.tblEmpShiftIDB = tblEmpShift_1.tblEmpShiftID INNER JOIN
                         tblBPS AS tblBPS_1 ON tblEmpTransfer.tblBPSIDA = tblBPS_1.tblBPSID INNER JOIN
                         tblBPS ON tblEmpTransfer.tblBPSIDB = tblBPS.tblBPSID

						 WHERE    tblEmpTransfer.tblHResourceID = " + dataID[1] + @"
						 order by dtTransferDate"));

                            break;
                        case 59:
                            context.Response.Write(Fn.Data2Json(@"SELECT  Distinct strAwardType FROM tblEmployeeAward"));
                            break;
                        case 60:
                            context.Response.Write(Fn.HTMLTable1(@"SELECT        Award, Date, Reason, Remarks
FROM            (SELECT        strAwardType AS Award, dtAwardDate AS Date, Reason, Remarks, CONVERT(DATETIME, dtAwardDate, 103) AS dt
                          FROM            tblEmployeeAward
                          WHERE        (tblEmployeeID = " +dataID[1]+@")) AS X
ORDER BY dt"));
                            break;
                        case 61:
                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblEmployeeAward
                         (tblEmployeeID, strAwardType, dtAwardDate, Reason, Remarks)
VALUES        ('"+dataID[1]+@"','"+dataID[2]+@"','"+dataID[3]+@"','"+dataID[4]+@"','"+dataID[5]+@"')"));
                            break;


                        case 62:
                            context.Response.Write(Fn.HTMLTable1(@"SELECT        dtInquiryDate Date, strInquiryType [Inquery Type], Reason, ShowCauseNotice [Show Cause Notice], OutComesOfInquiry [Outcomes]
FROM            (SELECT        dtInquiryDate, strInquiryType, Reason, ShowCauseNotice, OutComesOfInquiry, CONVERT(datetime, dtInquiryDate, 103) AS dt
                          FROM            tblEmployeeInquiry
                          WHERE        (tblEmployeeID = "+dataID[1]+@")) AS X
ORDER BY dt"));
                            break;


                        case 63:
                            context.Response.Write(Fn.Data2Json(@"SELECT  Distinct strInquiryType strAwardType FROM tblEmployeeInquiry"));
                            break;

                        case 64:
                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblEmployeeInquiry
                         (tblEmployeeID, strInquiryType, dtInquiryDate, Reason, ShowCauseNotice, OutComesOfInquiry)
VALUES        ('"+dataID[1]+@"','"+dataID[2]+@"','"+dataID[3]+@"','"+dataID[4]+@"','"+dataID[5]+@"','"+dataID[6]+@"')"));
                            break;

                        case 65:
                            context.Response.Write(Fn.HTMLTable1(@"SELECT       Date, Explanation,  Reason, Remarks
FROM            (SELECT        strExplanationType AS Explanation, dtExplanationDate AS Date, Reason, Remarks, CONVERT(DATETIME, dtExplanationDate, 103) AS dt
                          FROM            tblEmployeeExplanation
                          WHERE        (tblEmployeeID = " + dataID[1] + @")) AS X
ORDER BY dt"));
                            break;


                        case 66:
                            context.Response.Write(Fn.Data2Json(@"SELECT  Distinct strExplanationType FROM tblEmployeeExplanation"));
                            break;


                        case 67:
                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblEmployeeExplanation
                         (tblEmployeeID, strExplanationType, dtExplanationDate, Reason, Remarks)
VALUES        ('" + dataID[1] + @"','" + dataID[2] + @"','" + dataID[3] + @"','" + dataID[4] + @"','" + dataID[5] + @"')"));
                            break;


                        case 68:
                            context.Response.Write(Fn.Exec(@"exec sp_createLogin '"+dataID[1]+@"','"+ Encryptor.Encrypt(dataID[1])+@"' , '"+dataID[2]+@"','"+dataID[3]+@"' "));
                            break;

                        case 69:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,6) AS EmpNo, ISNULL(tblEmployee.FName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID,
						 tblEmpShiftID= Case when tblEmpShiftID=1 then '<select class=''clsddlShfit'' eid='''+CAST(tblEmployee.EmpID AS VARCHAR(50))+''' style=''width:120px;border: none;background: transparent;''><option value=''1'' selected=''selected''>Morning Shift</option><option value=''2''>Evening Shift</option><option value=''3''>Night Shift</option></select>' 
						 when tblEmpShiftID=2 then '<select class=''clsddlShfit'' eid='''+CAST(tblEmployee.EmpID AS VARCHAR(50))+''' style=''width:120px;border: none;background: transparent;''><option value=''1''>Morning Shift</option><option value=''2'' selected=''selected''>Evening Shift</option><option value=''3''>Night Shift</option></select>' 
						 when tblEmpShiftID=3 then '<select class=''clsddlShfit'' eid='''+CAST(tblEmployee.EmpID AS VARCHAR(50))+''' style=''width:120px;border: none;background: transparent;''><option value=''1''>Morning Shift</option><option value=''2''>Evening Shift</option><option value=''3'' selected=''selected''>Night Shift</option></select>' end

FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));
                            break;

                        case 70:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,6) AS EmpNo, ISNULL(tblEmployee.FName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID,
						  
						 '<input class=''clsSalary'' type=''text'' t='''+CAST( CAST(ISNULL(tblEmployee.BPay,'0.00') AS MONEY) AS VARCHAR(50))+''' value='''+CAST( CAST (ISNULL(tblEmployee.BPay,'0.00') AS MONEY) AS VARCHAR(50))+''' eid='''+CAST(tblEmployee.EmpID AS VARCHAR(50))+''' style=''width: 100px;border: none;background: transparent;''>' AS BPay
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));
                            break;


                        case 71:
                            context.Response.Write(Fn.Data2Json(@"SELECT ID, NAME
FROM            tblDesig
WHERE        (bIsActive = 1) AND ID !=16
and ID in (
SELECT Distinct tblDesigID FROM tblEmployee
where Status=1
)  ORDER BY NAME"));
                            break;

                        case 72:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT       tblEmployee.EmpID ,'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,6) AS [Employee ID], ISNULL(tblEmployee.FName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS Phone, tblDept.Name AS Department, tblDesig.NAME AS Designation, tbl_Company.CompanyName, CAST( ISNULL(tblEmployee.BPay,'0') AS VARCHAR(50)) Salary, Joind [Joined Date]
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 AND  tblEmployee.EmpID NOT IN (Select EmpID from tblEmployee where tblEmployee.Joind ='')
and    tblEmployee.tblDesigID = " + dataID[1] + @" 
Order by CONVERT(DateTime, ISNULL(Joind,'01/01/1900'),103)", "tblDtls" + dataID[1]));
                            break;


                        case 73:
                            context.Response.Write(Fn.Exec(@" Delete tblEmployeeFamily where tblEmployeeFamilyID= " + dataID[1]));
                            break;

                        case 74:
                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblEmployeeFamily
                         (SerialNo, Relation, Name, CNIC, ContactNo, Address, Details, DOB, tblEmployeeID)
                        VALUES        ('" + dataID[1] + @"','" + dataID[2] + @"','" + dataID[3] + @"','" + dataID[4] + @"','" + dataID[5] + @"','" + dataID[6] + @"','" + dataID[7] + @"','" + dataID[8] + @"','" + dataID[9] + @"'); select SCOPE_IDENTITY() "));
                            break;

                        case 75:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblEmployeeFamilyID, ISNULL(SerialNo,'') SerialNo, ISNULL(Relation,'') Relation, ISNULL(Name,'') Name, ISNULL(CNIC,'') CNIC, ISNULL(ContactNo,'') ContactNo, ISNULL(Address,'') Address, ISNULL(Details,'') Details, ISNULL(DOB,'') DOB, tblEmployeeID
FROM            tblEmployeeFamily where tblEmployeeID = " + dataID[1]));
                            break;
                        case 76:
                            context.Response.Write(Fn.Exec(@"EXEC DBO.spAddEditAttendanceMine @Emp_ID=" + dataID[1] + ", @For='" + dataID[2] + "'  "));
                            break;

                            case 77:
                            context.Response.Write(Fn.Data2Json(@"Select * from [dbo].[tbl_CompanyProjectDSUs] where tbl_CompanyProjectID= " + dataID[1]));
                            break;
                            case 78:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tbl_Company.CompanyID, tbl_Company.CompanyName, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyPhoneNo1, 
                         tbl_Company.CompanyEmail, tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear, tbl_Company.CompanyDistrictID, tbl_Company.GPS, CASE WHEN ISNULL(CompanyLogo, '') 
                         = '' THEN 'Images/no-image-available-hi.png' ELSE 'Uploads/CompanyProfile/B' + CAST(CompanyID AS VARCHAR(50)) + ISNULL(CompanyLogo, '') + '?'+ CAST(DATEPART(MICROSECOND,GETDATE()) AS VARCHAR(50)) END AS CompanyLogo, tbl_Company.CompanyProvince, 
                         tbl_Company.Code, tbl_Company.ParentId, tbl_Company.TblVillageCity, tbl_Company.Type, tbl_Company.lvl, TblDistrict.RegionID, CONVERT(VARCHAR(50),dtProjectFromDate,103) AS dtProjectFromDate, CONVERT(VARCHAR(50),dtProjectToDate,103) dtProjectToDate
FROM            tbl_Company INNER JOIN
                         TblDistrict ON tbl_Company.CompanyDistrictID = TblDistrict.DistrictID  WHERE tbl_Company.CompanyID=" + dataID[1]));
                            break;


                            case 79:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,5) AS EmpNo, ISNULL(tblEmployee.FName, '') +' '+ ISNULL(tblEmployee.LName, '')  AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 AND     tblEmployee.PostTyp = 'Project Base' Order by EmpNo"));
                            break;
                            case 80:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tbl_Company.CompanyID, tbl_Company.CompanyName FROM            tbl_Company where lvl=4 order by CompanyName"));
                            break;

                            case 81:
                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblEmployeeProjects
                         (tblCompanyID_ProjectId, dtAssignDate, ProjectBaseSalary, Location, Description, tblEmployeeID)
VALUES        ('" + dataID[1] + @"','" + dataID[2] + @"','" + dataID[3] + @"','" + dataID[4] + @"','" + dataID[5] + @"','" + dataID[6] + @"')"));
                            break;
                            case 82:
                            context.Response.Write(Fn.HTMLTable1(@"SELECT  tbl_Company.CompanyName AS Project, CONVERT(VARCHAR(50),tblEmployeeProjects.dtAssignDate,103) AS [Assign Date], tblEmployeeProjects.ProjectBaseSalary AS [Project Base Salary], 
                         tblEmployeeProjects.Location, tblEmployeeProjects.Description
FROM            tblEmployeeProjects INNER JOIN
                         tbl_Company ON tblEmployeeProjects.tblCompanyID_ProjectId = tbl_Company.CompanyID
WHERE        (tblEmployeeProjects.tblEmployeeID = '"+dataID[1]+@"')"));
                            break;


                        case 83:
                            context.Response.Write(Fn.Exec(@"INSERT INTO Employee_Leaves
                         (tblEmployeeID_LeaveSendTo, Type_Detail_Id, Start_Date, End_Date, Description, Leave_Days, Emp_Id)
VALUES        ('" + dataID[1] + @"','" + dataID[2] + @"',CONVERT(DATETIME,'" + dataID[3] + @"',103),CONVERT(DATETIME,'" + dataID[4] + @"',103),'" + dataID[5] + @"','" + dataID[6] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"')"));
                            break;


                        case 84:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        Employee_Leaves.Emp_Leave_Id, '' AS Sr#, CONVERT(varchar(103), Employee_Leaves.Start_Date, 103) AS [From], CONVERT(varchar(50), Employee_Leaves.End_Date, 103) AS [To], DATEDIFF(dd, 
                         Employee_Leaves.Start_Date, Employee_Leaves.End_Date) AS [Total Days], Employee_Leaves.Description, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS [Sent To], 
                         CASE WHEN is_approved is NULL THEN 'Pending'  WHEN is_approved = 0 THEN 'Rejected'  ELSE 'Approved' END AS Status, ISNULL(Employee_Leaves.Remarks,'') Remarks
FROM            Employee_Leaves INNER JOIN
                         tblEmployee ON Employee_Leaves.tblEmployeeID_LeaveSendTo = tblEmployee.EmpID
WHERE        (Emp_Id = '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"')
Order by Start_Date", "tblJl"));
                            break;
                        case 85:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        Employee_Leaves.Emp_Leave_Id, '' AS Sr#, LoginDTL.Name AS Sender, CONVERT(varchar(103), Employee_Leaves.Start_Date, 103) AS [From], CONVERT(varchar(50), Employee_Leaves.End_Date, 103) AS [To], 
                         DATEDIFF(dd, Employee_Leaves.Start_Date, Employee_Leaves.End_Date) AS [Total Days], Employee_Leaves.Description, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS [Sent To], 
                         '<input tag=''' + CAST(Employee_Leaves.Emp_Leave_Id AS VARCHAR(50)) + ''' class=''frm'' value='''' type=''text'' style=''width: 90px;'' />' AS Remarks
FROM            Employee_Leaves INNER JOIN
                         tblEmployee ON Employee_Leaves.tblEmployeeID_LeaveSendTo = tblEmployee.EmpID INNER JOIN
                             (SELECT        Login.LoginID, tblDtl.Name + ' [ ' + tblDtl.Designation + ' ]' AS Name
                               FROM            Login INNER JOIN
                                                             (SELECT        User_ID, Full_Name AS Name, '' AS [Emp No], '' AS [Service Type], FatherName AS Father, CNIC, '' AS BPS, Designation, 'TblHResources' AS TableName
                                                               FROM            TblHResources
                                                               UNION
                                                               SELECT        tblEmployee_1.EmpID, ISNULL(tblEmployee_1.FName, '') + ' ' + ISNULL(tblEmployee_1.LName, '') AS Name, 'FRDP-EMP-' + RIGHT('00000' + CAST(ISNULL(tblEmployee_1.EmpNo, 0) 
                                                                                        AS VARCHAR(50)), 5) AS EMPNO, tblEmployee_1.PostTyp, ISNULL(tblEmployee_1.Father, '') AS Father, tblEmployee_1.CNIC, 
                                                                                        CASE WHEN tblEmployee_1.BPS = 0 THEN 'N/A' ELSE 'BPS' + CAST(tblEmployee_1.BPS AS VARCHAR(50)) END AS BPS, tblDesig.NAME AS Designation, 
                                                                                        'tblEmployee' AS TableName
                                                               FROM            tbl_Company INNER JOIN
                                                                                        tblDept INNER JOIN
                                                                                        Shift INNER JOIN
                                                                                        tblEmployee AS tblEmployee_1 INNER JOIN
                                                                                        TblDistrict ON tblEmployee_1.Domicile = TblDistrict.DistrictID ON Shift.Shift_ID = tblEmployee_1.tblEmpShiftID INNER JOIN
                                                                                        tblDesig ON tblEmployee_1.tblDesigID = tblDesig.ID ON tblDept.ID = tblEmployee_1.tblDept ON tbl_Company.CompanyID = tblEmployee_1.tblCompanyID) AS tblDtl ON 
                                                         Login.Emp_Id = tblDtl.User_ID AND Login.TableName = tblDtl.TableName INNER JOIN
                                                         User_Groups ON Login.User_Group_Id = User_Groups.User_Group_Id) AS LoginDTL ON Employee_Leaves.Emp_Id = LoginDTL.LoginID
WHERE        (Employee_Leaves.is_approved IS NULL)
ORDER BY Employee_Leaves.Start_Date", "tblJl"));
                            break;

                        case 86:
                            context.Response.Write(Fn.Exec(@"UPDATE Employee_Leaves SET Remarks='"+dataID[3]+"' , is_approved='"+dataID[1]+"' WHERE Emp_Leave_Id= '"+dataID[2]+"'"));
                            break;

                        case 87:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,5) AS EmpNo, ISNULL(tblEmployee.FName, '') +' '+ ISNULL(tblEmployee.LName, '')  AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID, tblEmployee.PostTyp
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 and tblEmployee.EmpID not in (Select EmpID from [dbo].[tbl_PensionEmployees]) AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));
                            break;

                        case 88:
                            context.Response.Write(Fn.HTMLTableWithID(@"Exec [dbo].[sp_EmployeeDragable_Report] '" + HttpUtility.UrlDecode(fdata[0]) + "', '1',1", "tblAnimals"));
                            break;

                        case 89:
                           string id= Fn.ExenID(@"INSERT INTO tblPersonalRequisitionForm
                         (dtDate, tbl_CompanyIDDSU, No, ToThePersonalOffice, Position, Category, Location, SANCTIONED, Certification, Justification, TotalCatchment, OPD, Distance, Details, Post, LoginIDTO, LoginIDSender, LastAction)
VALUES        (CONVERT(DATETIME,'" + fdata[0] + @"',103),'" + fdata[1] + @"','" + fdata[2] + @"','" + fdata[3] + @"','" + fdata[4] + @"','" + fdata[5] + @"','" + fdata[6] + @"','" + fdata[7] + @"','" + fdata[8] + @"','" + fdata[9] + @"','" + fdata[10] + @"','" + fdata[11] + @"','" + fdata[12] + @"','" + fdata[13] + @"','" + fdata[14] + @"','" + fdata[15] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"','SENT'); select SCOPE_IDENTITY() ");


                           context.Response.Write(Fn.Exec(@"INSERT INTO tblPersonalRequisitionFormFWD
                         (tblPersonalRequisitionFormID, LoginIDSenderID, Remarks)
VALUES        ('"+id+@"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"','')"));
                            break;
                        case 90:
                            context.Response.Write(Fn.Data2Json(@"	SELECT CASE WHEN CONVERT(VARCHAR(50),dtDate,103) = '01/01/1900' THEN '' ELSE CONVERT(VARCHAR(50),dtDate,103) END AS dtDate, tbl_CompanyIDDSU, No, ToThePersonalOffice, Position, Category, Location, SANCTIONED, Certification, Justification, TotalCatchment, OPD, Distance, Details, Post, LoginIDTO
FROM tblPersonalRequisitionForm WHERE tblPersonalRequisitionFormID="+dataID[1]));
                            break;
                        case 91:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        tblPersonalRequisitionForm.tblPersonalRequisitionFormID, '' AS Sr#, CASE WHEN CONVERT(VARCHAR(50), dtDate, 103) = '01/01/1900' THEN '' ELSE CONVERT(VARCHAR(50), dtDate, 103) END AS dtDate,tbl_Company.CompanyName DSU, 
                         tblPersonalRequisitionForm.No, tblPersonalRequisitionForm.ToThePersonalOffice, tblPersonalRequisitionForm.Position, tblPersonalRequisitionForm.Category, tblPersonalRequisitionForm.Location, 
                         tblPersonalRequisitionForm.SANCTIONED
FROM            tblPersonalRequisitionForm INNER JOIN
                         tbl_Company ON tblPersonalRequisitionForm.tbl_CompanyIDDSU = tbl_Company.CompanyID
WHERE        tblPersonalRequisitionForm.LoginIDSender =" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)), "tblJl"));
                            break;
                        case 92:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        tblPersonalRequisitionForm.tblPersonalRequisitionFormID, '' AS Sr#, CASE WHEN CONVERT(VARCHAR(50), dtDate, 103) = '01/01/1900' THEN '' ELSE CONVERT(VARCHAR(50), dtDate, 103) END AS dtDate,tbl_Company.CompanyName DSU, 
                         tblPersonalRequisitionForm.No, tblPersonalRequisitionForm.ToThePersonalOffice, tblPersonalRequisitionForm.Position, tblPersonalRequisitionForm.Category, tblPersonalRequisitionForm.Location, 
                         tblPersonalRequisitionForm.SANCTIONED
FROM            tblPersonalRequisitionForm INNER JOIN
                         tbl_Company ON tblPersonalRequisitionForm.tbl_CompanyIDDSU = tbl_Company.CompanyID
WHERE       (tblPersonalRequisitionForm.LastAction <> 'Approved' AND tblPersonalRequisitionForm.LastAction <> 'Rejected') AND tblPersonalRequisitionForm.LoginIDTO =" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)), "tblJl"));
                            break;
                        case 93:
                            context.Response.Write(Fn.Data2Json(@"	SELECT CASE WHEN CONVERT(VARCHAR(50),dtDate,103) = '01/01/1900' THEN '' ELSE CONVERT(VARCHAR(50),dtDate,103) END AS dtDate, tbl_CompanyIDDSU, No, ToThePersonalOffice, Position, Category, Location, SANCTIONED, Certification, Justification, TotalCatchment, OPD, Distance, Details, Post
FROM tblPersonalRequisitionForm WHERE tblPersonalRequisitionFormID=" + dataID[1]));
                            break;

                        case 94:
                            Fn.Exec(@"INSERT INTO tblPersonalRequisitionFormFWD
                         (tblPersonalRequisitionFormID, LoginIDSenderID, Remarks,dtSentDate, Status)
VALUES        ('" + dataID[1] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"','" + dataID[3] + @"', CONVERT(DATETIME,'" + dataID[2] + @"',103),'Approved')");
                            context.Response.Write(Fn.Exec(@"UPDATE       tblPersonalRequisitionForm
SET                LastAction ='Approved', dtLastActionDateTime =GETDATE()
where tblPersonalRequisitionFormID=" + dataID[1]));
                            break;
                        case 95:
                            Fn.Exec(@"INSERT INTO tblPersonalRequisitionFormFWD
                         (tblPersonalRequisitionFormID, LoginIDSenderID, Remarks,dtSentDate, Status)
VALUES        ('" + dataID[1] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"','" + dataID[3] + @"', CONVERT(DATETIME,'" + dataID[2] + @"',103),'Rejected')");
                            context.Response.Write(Fn.Exec(@"UPDATE       tblPersonalRequisitionForm
SET                LastAction ='Rejected', dtLastActionDateTime =GETDATE()
where tblPersonalRequisitionFormID=" + dataID[1]));
                            break;

                        case 96:
                            Fn.Exec(@"INSERT INTO tblPersonalRequisitionFormFWD
                         (tblPersonalRequisitionFormID, LoginIDSenderID, Remarks,dtSentDate, Status)
VALUES        ('" + dataID[1] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"','" + dataID[3] + @"', CONVERT(DATETIME,'" + dataID[2] + @"',103),'Forward')");
                            context.Response.Write(Fn.Exec(@"UPDATE       tblPersonalRequisitionForm
SET                LastAction ='Forward', dtLastActionDateTime =GETDATE(), LoginIDTO='"+dataID[4]+@"'
where tblPersonalRequisitionFormID=" + dataID[1]));
                            break;


                        case 97:
                            context.Response.Write(Fn.Data2Json(@"SELECT        'FRDP-EMP-' + RIGHT('00000000000' + tblEmployee.EmpNo, 5) AS EmpNo, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID AS CompanyID, 
                         tblEmployee.EmpID AS tblEmployeeID, tblEmployee.PostTyp, tbl_PensionEmployees.FileNo, tbl_PensionEmployees.PensionEmpID
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tbl_PensionEmployees ON tblEmployee.EmpID = tbl_PensionEmployees.EmpID
WHERE        (tblEmployee.Status = 1) AND (tblEmployee.tblCompanyID = " + dataID[1] + @")
ORDER BY EmpNo"));
                            break;


                        case 98:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,5) AS EmpNo, ISNULL(tblEmployee.FName, '') +' '+ ISNULL(tblEmployee.LName, '')  AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID, tblEmployee.PostTyp
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 and tblEmployee.EmpID in (Select EmpID from [dbo].[tbl_PayrollEmployeeParticulars]) AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));
                            break;



                        case 99:
//                            context.Response.Write(Fn.Data2Json(@"SELECT        'PPHI-EMP-' + RIGHT('00000000000' + tblEmployee.EmpNo, 5) AS EmpNo, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
//                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID AS CompanyID, 
//                         tblEmployee.EmpID AS tblEmployeeID, tblEmployee.PostTyp, tbl_PensionEmployees.FileNo, tbl_PensionEmployees.PensionEmpID
//FROM            tblDept INNER JOIN
//                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
//                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
//                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
//                         tbl_PensionEmployees ON tblEmployee.EmpID = tbl_PensionEmployees.EmpID
//WHERE        (tblEmployee.Status = 1) AND (tblEmployee.tblCompanyID = " + dataID[1] + @")
//ORDER BY EmpNo"));


context.Response.Write(Fn.Data2Json(@"SELECT        'FRDP-EMP-' + RIGHT('00000000000' + tblEmployee.EmpNo, 5) AS EmpNo, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID AS CompanyID, 
                         tblEmployee.EmpID AS tblEmployeeID, tblEmployee.PostTyp, tbl_PensionEmployees.FileNo, tbl_PensionEmployees.PensionEmpID, ISNULL(tbl_PensionCurruntCalculated.MonthlyPension,0) AS CashableAmount, 
                         ISNULL(tbl_PensionCurruntCalculated.MedicalAllowance,0) MedicalAllowance
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tbl_PensionEmployees ON tblEmployee.EmpID = tbl_PensionEmployees.EmpID LEFT OUTER JOIN
                         tbl_PensionCurruntCalculated ON tblEmployee.EmpID = tbl_PensionCurruntCalculated.EmpID
WHERE    tblEmployee.EmpID not in (Select EmpId from tbl_PensionMonthlyTransfer where PensionMonth = '"+dataID[2]+@"' and PensionYear = '"+dataID[3]+@"') AND (tbl_PensionCurruntCalculated.Is_Currunt is null or tbl_PensionCurruntCalculated.Is_Currunt = 1)  and   (tbl_PensionEmployees.BankID = '"+dataID[4]+@"' ) AND   (tblEmployee.Status = 1) AND (tblEmployee.tblCompanyID = " + dataID[1] + @")
ORDER BY EmpNo"));

                            break;



                        case 100:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'FRDP-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,5) AS EmpNo, ISNULL(tblEmployee.FName, '') +' '+ ISNULL(tblEmployee.LName, '')  AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID, tblEmployee.PostTyp
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE    tblEmployee.Status=1 AND tblEmployee.EmpID NOT IN (Select EmpID   FROM [dbo].[tbl_PayrollEmployeeMonthlySalary] where DATEPART(MONTH, SalaryDate)=DATEPART(MONTH,Convert(datetime, '" + dataID[2] + @"')) and DATEPART(YEAR, SalaryDate) = DATEPART(YEAR,Convert(datetime, '" + dataID[2] + @"')))  AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));
                            break;


                        case 101:
//                            context.Response.Write(Fn.Data2Json(@"SELECT       'PPHI-EMP-'+  RIGHT( '00000000000'+ tblEmployee.EmpNo,5) AS EmpNo, ISNULL(tblEmployee.FName, '') +' '+ ISNULL(tblEmployee.LName, '')  AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
//                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID CompanyID, tblEmployee.EmpID tblEmployeeID, tblEmployee.PostTyp
//FROM            tblDept INNER JOIN
//                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
//                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
//                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
//WHERE    tblEmployee.Status=1 AND tblEmployee.EmpID IN (Select EmpID   FROM [dbo].[tbl_PayrollEmployeeMonthlySalary] where DATEPART(MONTH, SalaryDate)='" + dataID[2] + @"' and DATEPART(YEAR, SalaryDate) = '" + dataID[3] + @"')  AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));

                            context.Response.Write(Fn.Data2Json(@"SELECT        'FRDP-EMP-' + RIGHT('00000000000' + tblEmployee.EmpNo, 5) AS EmpNo, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID AS CompanyID, 
                         tblEmployee.EmpID AS tblEmployeeID, tblEmployee.PostTyp, tbl_PayrollEmployeeMonthlySalary.MonthlySalaryID, tbl_PayrollEmployeeMonthlySalary.bIsApproved
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tbl_PayrollEmployeeMonthlySalary ON tblEmployee.EmpID = tbl_PayrollEmployeeMonthlySalary.EmpID
WHERE    tblEmployee.Status=1 AND DATEPART(MONTH, tbl_PayrollEmployeeMonthlySalary.SalaryDate)='" + dataID[2] + @"' and DATEPART(YEAR, tbl_PayrollEmployeeMonthlySalary.SalaryDate) = '" + dataID[3] + @"'  AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));                                                                                                                                      
                                                                                                                                                          
                      break;



                        case 102:
                            context.Response.Write(Fn.Data2Json(@"SELECT        'FRDP-EMP-' + RIGHT('00000000000' + tblEmployee.EmpNo, 5) AS EmpNo, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS NAME, ISNULL(tblEmployee.CNIC, '') AS CNIC, 
                         ISNULL(tblEmployee.Mobile, '') AS ContactNos, tblDept.Name AS DeptName, tblDesig.NAME AS Designamtion, tbl_Company.CompanyName, tblEmployee.tblCompanyID AS CompanyID, 
                         tblEmployee.EmpID AS tblEmployeeID, tblEmployee.PostTyp, tbl_PayrollEmployeeMonthlySalary.MonthlySalaryID, tbl_PayrollEmployeeMonthlySalary.bIsApproved
FROM            tblDept INNER JOIN
                         tblEmployee ON tblDept.ID = tblEmployee.tblDept INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tbl_PayrollEmployeeMonthlySalary ON tblEmployee.EmpID = tbl_PayrollEmployeeMonthlySalary.EmpID
WHERE    tblEmployee.Status=1 AND DATEPART(MONTH, tbl_PayrollEmployeeMonthlySalary.SalaryDate)='" + dataID[2] + @"' and DATEPART(YEAR, tbl_PayrollEmployeeMonthlySalary.SalaryDate) = '" + dataID[3] + @"' and tbl_PayrollEmployeeMonthlySalary.bIsApproved=0 AND     tblEmployee.tblCompanyID = " + dataID[1] + @" Order by EmpNo"));
                            break;

                        case 103:

                            //string[] str103 = dataID[1].Split('½');
                            //string qry103 = "";
                            //foreach (var item in str103)
                            //{
                            //    qry103 += 
                            //}
                            context.Response.Write(Fn.Exec(@"UPDATE tbl_PayrollEmployeeMonthlySalary SET bIsApproved=1 WHERE MonthlySalaryID IN ("+dataID[1]+")"));
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

        //public class EmpReg : IHttpHandler, IRequiresSessionState
        public static string ddllist(List<clsLocation> Lloc)
        {
            string ret = "";
            foreach (var item in Lloc)
            {
                ret += "<option value='" + item.LocID + "'>" + item.LocName + "</option>";
            }
            return ret;
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