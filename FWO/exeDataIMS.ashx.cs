using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for exeDataIMS
    /// </summary>
    public class exeDataIMS : IHttpHandler
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
            string[] dataID = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.QueryString["id"])).Split('ǁ');
            {
                try
                {
                    context.Response.ContentType = "text/HTML";
                    switch (Convert.ToInt32(dataID[0]))
                    {
                        case 0:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_VMenu('" + dataID[1] + "')")[0]);
                            break;

                        case 1:
                            context.Response.Write(Fn.Data2Json("SELECT CASE WHEN max(Pros_No) IS NULL THEN 'true' ELSE 'false' END AS rtn FROM (SELECT Pros_No FROM tblStudentEnquiry WHERE (Pros_No = '" + dataID[1] + "') AND (Campus = '" + dataID[3] + "') AND (AC_Year = '" + dataID[2] + "')) AS tb"));
                            break;

                        case 2:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblStudentEnquiry (AC_Year, Campus, Pros_No, Reg_No, Std_Name, Std_Sex, Std_DOB, Applevel_Class_ID, ClassGroup_ID, Lst_College, Father_Name, Father_Prof, NIC_No, Tel_Cell, Gaurdian_Name, Tel_Res,Prospectus, EnterBy) VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', CONVERT(DATETIME, '" + dataID[7] + "', 102), '" + dataID[8] + "', '" + dataID[9] + "', '" + dataID[10] + "', '" + dataID[11] + "', '" + dataID[12] + "', '" + dataID[13] + "', '" + dataID[14] + "', '" + dataID[15] + "', '" + dataID[16] + "', '" + dataID[17] + "', '" + dataID[18] + "')"));
                            break;

                        case 3:
                            context.Response.Write(Fn.Data2Json("SELECT  top(10) Pros_No, Std_Name, Father_Name, Tel_Cell, EQ_Date,Std_Sex FROM tblStudentEnquiry ORDER BY EQ_Date DESC"));
                            break;

                        case 4:
                            string where = "";
                            if (dataID[1] != "") { where = "AND AC_Year=" + dataID[1]; }
                            if (dataID[2] != "") { if (where == "") { where = "AND Campus=" + dataID[2]; } else { where += " AND Campus=" + dataID[2]; } }
                            if (dataID[3] != "") { if (where == "") { where = "AND Pros_No=" + dataID[3]; } else { where += " AND Pros_No=" + dataID[3]; } }
                            if (dataID[4] != "") { if (where == "") { where = "AND Std_Name Like'%" + dataID[4] + "%'"; } else { where += " AND Std_Name='%" + dataID[4] + "%'"; } }
                            if (dataID[5] != "") { if (where == "") { where = "AND EQ_Date BETWEEN CONVERT(DATETIME, '" + dataID[5] + "', 102) AND CONVERT(DATETIME, '" + dataID[6] + "', 102)"; } else { where = " AND EQ_Date BETWEEN CONVERT(DATETIME, '" + dataID[5] + "', 102) AND CONVERT(DATETIME, '" + dataID[6] + "', 102)"; } }
                            context.Response.Write(Fn.Data2Json("SELECT TOP (50) tblStudentEnquiry.EnquiryID, tblStudentEnquiry.Pros_No, tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name,   tblStudentEnquiry.EQ_Status, tblStudentEnquiry.EQ_Date, tblStudentEnquiry.Std_Sex, tblClass.Class_Name FROM tblStudentEnquiry INNER JOIN  tblClass ON tblStudentEnquiry.Applevel_Class_ID = tblClass.Class_ID WHERE (tblClass.Class_Name like '" + dataID[7] + "') " + where + " ORDER BY EnquiryID DESC"));
                            break;

                        case 5:
                            context.Response.Write(Fn.Data2Json("SELECT CASE WHEN max(Reg_No) IS NULL THEN 'true' ELSE 'false' END AS rtn FROM (SELECT Reg_No FROM tblStudentEnquiry WHERE (Reg_No = '" + dataID[1] + "')) AS tb"));
                            break;

                        case 6:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblStudentEnquiry  (AC_Year, Campus, Pros_No, Reg_No, Std_Name, Std_Sex, Std_DOB, Applevel_Class_ID, ClassGroup_ID, Lst_College, Nationality, Religion, FormB,   Certificate, Hanicap, Medically, Address, Father_Name, Father_Prof, NIC_No, Tel_Cell, NTN, Designation, Transferred, DoJ, OfAddress, Gaurdian_Name,   Tel_Res, Email, Tel_Office, MInsitute, MYear, MMarks, MGrade, OInsitute, OYear, OMarks, OGrade, EQ_Status, EnterBy) VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', CONVERT(DATETIME, '" + dataID[7] + "', 102), '" + dataID[8] + "', '" + dataID[9] + "', '" + dataID[10] + "', '" + dataID[11] + "', '" + dataID[12] + "', '" + dataID[13] + "', '" + dataID[14] + "', '" + dataID[15] + "', '" + dataID[16] + "', '" + dataID[17] + "', '" + dataID[18] + "', '" + dataID[19] + "', '" + dataID[20] + "', '" + dataID[21] + "', '" + dataID[22] + "', '" + dataID[23] + "', '" + dataID[24] + "', CONVERT(DATETIME,   '" + dataID[25] + "', 102), '" + dataID[26] + "', '" + dataID[27] + "', '" + dataID[28] + "', '" + dataID[29] + "', '" + dataID[30] + "', '" + dataID[31] + "', '" + dataID[32] + "', '" + dataID[33] + "', '" + dataID[34] + "', '" + dataID[35] + "', '" + dataID[36] + "', '" + dataID[37] + "', '" + dataID[38] + "', 'Registered', '" + dataID[39] + "')"));
                            break;

                        case 7:
                            context.Response.Write(Fn.Data2Json("SELECT AC_Year, Campus, Pros_No, Reg_No, Std_Name, Std_Sex, format( Std_DOB,'dd MMMM yyyy') AS Std_DOB, Applevel_Class_ID, ClassGroup_ID, Lst_College, Nationality, Religion, FormB, Certificate, Hanicap, Medically, Address, Father_Name, Father_Prof, NIC_No, Tel_Cell, NTN, Designation, Transferred, format( DoJ,'dd MMMM yyyy') AS DoJ, OfAddress, Gaurdian_Name, Tel_Res, Email, Tel_Office, MInsitute, MYear, MMarks, MGrade, OInsitute, OYear, OMarks, OGrade,EnquiryID, PayStatus, RegFee, Book, format(DoP,'dd MMMM yyyy') as DoP, Building, Security, Other,HouseID,FeeCat,PayMethod FROM tblStudentEnquiry WHERE (EnquiryID = " + dataID[1] + ")"));
                            break;

                        case 8:
                            context.Response.Write(Fn.Exec("UPDATE tblStudentEnquiry SET Reg_No = '" + dataID[4] + "', Std_Name = '" + dataID[5] + "', Std_Sex = '" + dataID[6] + "', Std_DOB = CONVERT(DATETIME, '" + dataID[7] + "', 102), Applevel_Class_ID = '" + dataID[8] + "', ClassGroup_ID = '" + dataID[9] + "',   Lst_College = '" + dataID[10] + "', Nationality = '" + dataID[11] + "', Religion = '" + dataID[12] + "', FormB = '" + dataID[13] + "', Certificate = '" + dataID[14] + "', Hanicap = '" + dataID[15] + "', Medically = '" + dataID[16] + "', Address = '" + dataID[17] + "', Father_Name = '" + dataID[18] + "',   Father_Prof = '" + dataID[19] + "', NIC_No = '" + dataID[20] + "', Tel_Cell = '" + dataID[21] + "', NTN = '" + dataID[22] + "', Designation = '" + dataID[23] + "', Transferred = '" + dataID[24] + "', DoJ = CONVERT(DATETIME, '" + dataID[25] + "', 102),   OfAddress = '" + dataID[26] + "', Gaurdian_Name = '" + dataID[27] + "', Tel_Res = '" + dataID[28] + "', Email = '" + dataID[29] + "', Tel_Office = '" + dataID[30] + "', MInsitute = '" + dataID[31] + "', MYear = '" + dataID[32] + "', MMarks = '" + dataID[33] + "', MGrade = '" + dataID[34] + "', OInsitute = '" + dataID[35] + "',   OYear = '" + dataID[36] + "', OMarks = '" + dataID[37] + "', OGrade = '" + dataID[38] + "',EQ_Status= 'Registered',PayStatus = '" + dataID[40] + "', RegFee = '" + dataID[41] + "', Book = '" + dataID[42] + "', DoP = CONVERT(DATETIME, '" + dataID[43] + "', 102), Building = '" + dataID[44] + "', Security = '" + dataID[45] + "', Other = '" + dataID[46] + "', FeeCat = '" + dataID[47] + "' WHERE (EnquiryID = '" + dataID[48] + "')"));
                            break;

                        case 9:
                            context.Response.Write(Fn.Data2Json("SELECT tblStudentEnquiry.EnquiryID, tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name, tblClass.Class_Name, tblStudentEnquiry.Receipt,   tblStudentEnquiry.Book, format(tblStudentEnquiry.DoR,'dd MMMM yyyy') as DoR, tblStudentEnquiry.RegFee, tblStudentEnquiry.Building, tblStudentEnquiry.Security, tblStudentEnquiry.Other, tblStudentEnquiry.PayStatus, tblStudentEnquiry.PayMethod, format(tblStudentEnquiry.Ffrom, 'MMMM yyyy') AS Ffrom,format(tblStudentEnquiry.Fto, 'MMMM yyyy') AS Fto, format(tblStudentEnquiry.Due, 'dd MMMM yyyy') AS Due FROM tblStudentEnquiry INNER JOIN  tblClass ON tblStudentEnquiry.Applevel_Class_ID = tblClass.Class_ID WHERE (tblStudentEnquiry.EnquiryID = " + dataID[1] + ")"));
                            break;

                        case 10:
                            context.Response.Write(Fn.Exec("UPDATE tblStudentEnquiry SET DoR = CONVERT(DATETIME, '" + dataID[2] + "', 102), Book = '" + dataID[3] + "', RegFee = '" + dataID[4] + "', Building = '" + dataID[5] + "', Security = '" + dataID[6] + "', Other = '" + dataID[7] + "' WHERE (EnquiryID = " + dataID[1] + ")"));
                            break;

                        case 12:
                            context.Response.Write(Fn.Exec("UPDATE tblStudentEnquiry SET TestDate = CONVERT(DATETIME, '" + dataID[2] + "', 102), Interview = '" + dataID[3] + "', Remarks = '" + dataID[4] + "', Subject1 = '" + dataID[5] + "', Subject2 = '" + dataID[6] + "', Subject3 = '" + dataID[7] + "' WHERE (EnquiryID = '" + dataID[1] + "')"));
                            break;

                        case 11:
                            context.Response.Write(Fn.Data2Json("SELECT tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name, tblClass.Class_Name, format(tblStudentEnquiry.TestDate, 'dd MMMM yyyy') AS TestDate,tblStudentEnquiry.Interview, tblStudentEnquiry.Subject1, tblStudentEnquiry.Subject2, tblStudentEnquiry.Subject3, tblStudentEnquiry.Remarks FROM tblStudentEnquiry INNER JOIN tblClass ON tblStudentEnquiry.Applevel_Class_ID = tblClass.Class_ID WHERE (tblStudentEnquiry.EnquiryID = " + dataID[1] + ")"));
                            break;

                        case 14:
                            context.Response.Write(Fn.Data2Json("SELECT  User_ID, Full_Name FROM TblHResources WHERE (PO_ID LIKE '" + dataID[1] + "')"));
                            break;

                        case 13:
                            context.Response.Write(Fn.Data2Json("SELECT TblHResources.User_ID, TblHResources.Full_Name, tblEmployee.FName, tblEmployee.LName, tblEmployee.CNIC, tblEmployee.EmpID FROM TblHResources INNER JOIN tblEmployee ON TblHResources.PO_ID = tblEmployee.EmpID WHERE (Full_Name LIKE '" + dataID[1] + "%')"));
                            break;

                        case 15:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblSections (SessionID, CampusID, ClassID, Section, EmpID) VALUES ('" + dataID[1] + "', '" + dataID[2] + "','" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "')"));
                            break;

                        case 16:
                            context.Response.Write(Fn.Data2Json("SELECT tblSections.SessionID, tblSections.CampusID, tblSections.Section, tblSections.EmpID, tblSections.SectionID, tblClass.Class_Name, FName + ' ' + LName AS EmpName,   tblSections.ClassID FROM tblSections INNER JOIN  tblClass ON tblSections.ClassID = tblClass.Class_ID INNER JOIN  tblEmployee ON tblSections.EmpID = tblEmployee.EmpID WHERE (tblSections.CampusID = " + dataID[1] + ") AND (tblSections.SessionID = " + dataID[2] + ")"));
                            break;

                        case 17:
                            context.Response.Write(Fn.Data2Json("SELECT tblEmployee.FName+' '+tblEmployee.LName as EmpName, tblClassSyllabus.EmpID, tblSubjects.Subject_Name, tblClassSyllabus.SubjectID, tblClassSyllabus.SyllabusID FROM tblClassSyllabus INNER JOIN tblEmployee ON tblClassSyllabus.EmpID = tblEmployee.EmpID INNER JOIN tblSubjects ON tblClassSyllabus.SubjectID = tblSubjects.Subject_ID WHERE (tblClassSyllabus.SectionID = " + dataID[1] + ")"));
                            break;

                        case 18:
                            context.Response.Write(Fn.Exec("INSERT INTO tblClassSyllabus (EmpID, SubjectID, SectionID) VALUES (" + dataID[1] + ", " + dataID[2] + ", " + dataID[3] + ")"));
                            break;

                        case 19:
                            context.Response.Write(Fn.Data2Json("sp_getChallanDTLs " + dataID[1]));
                            break;

                        case 20:
                            string wre = "";
                            if (dataID[1] != "") { wre = "AC_Year=" + dataID[1]; }
                            if (dataID[2] != "") { if (wre == "") { wre = "Campus=" + dataID[2]; } else { wre += " AND Campus=" + dataID[2]; } }
                            if (dataID[3] != "") { if (wre == "") { wre = "Pros_No=" + dataID[3]; } else { wre += " AND Pros_No=" + dataID[3]; } }
                            if (dataID[4] != "") { if (wre == "") { wre = "Std_Name Like'%" + dataID[4] + "%'"; } else { wre += " AND Std_Name='%" + dataID[4] + "%'"; } }
                            if (dataID[5] != "") { if (wre == "") { wre = "EQ_Date BETWEEN CONVERT(DATETIME, '" + dataID[5] + "', 102) AND CONVERT(DATETIME, '" + dataID[6] + "', 102)"; } else { wre = " AND EQ_Date BETWEEN CONVERT(DATETIME, '" + dataID[5] + "', 102) AND CONVERT(DATETIME, '" + dataID[6] + "', 102)"; } }
                            context.Response.Write(Fn.Data2Json("SELECT TOP (50) tblStudentEnquiry.EnquiryID, tblStudentEnquiry.Pros_No, tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name,   tblStudentEnquiry.EQ_Status, tblStudentEnquiry.EQ_Date, tblStudentEnquiry.Std_Sex, tblClass.Class_Name FROM tblStudentEnquiry INNER JOIN  tblClass ON tblStudentEnquiry.Applevel_Class_ID = tblClass.Class_ID WHERE (tblStudentEnquiry.PayStatus = 'Paid') AND (tblClass.Class_Name like '" + dataID[7] + "') AND " + wre + " ORDER BY EnquiryID DESC"));
                            break;

                        case 21:
                            context.Response.Write(Fn.Data2Json("sp_getChallan '" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "'"));
                            break;

                        case 22:
                            context.Response.Write(Fn.Data2Json("SELECT CASE WHEN max(CNIC) IS NULL THEN 'true' ELSE 'false' END AS rtn FROM (SELECT CNIC FROM tblEmployee WHERE (CNIC = '" + dataID[1] + "')) AS tb"));
                            break;

                        case 23:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_UserGroup()")[0]);
                            break;

                        case 24:
                            context.Response.Write(Fn.Exec("UPDATE tblFeeHDR SET PayStatus = 'Paid', DoP = '" + dataID[4] + "', bankID = " + dataID[3] + ",PRecBy = " + dataID[2] + ", PRecDate = GETDATE() WHERE (PayStatus = 'Payable') AND (FeeID = " + dataID[1] + ")"));
                            Fn.Exec("UPDATE tblFeeHDR SET lateFine=(select case when [DoP]>dateadd(day,(7),[duedate]) then (SELECT lateFine2 FROM tblInstitute WHERE (InstID = 1)) else case when [DoP]>[DueDate] then (SELECT lateFine1 FROM tblInstitute WHERE (InstID = 1)) else (0) end end from tblFeeHDR WHERE (FeeID = " + dataID[1] + ")) WHERE (FeeID = " + dataID[1] + ")");
                            break;

                        case 25:
                            string userid = Fn.ExenID("INSERT INTO TblHResources (Full_Name, Group_ID, ContactNos, Email, PO_ID, Regions, Distt, U_Status, U_Pass, enter_by, U_ThemeID) VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', '" + dataID[7] + "', '" + dataID[8] + "', '" + Encryptor.Encrypt(dataID[9]) + "', '" + dataID[10] + "'+convert(varchar,getdate()),1);select SCOPE_IDENTITY()");
                            context.Response.Write(userid);
                            break;

                        case 26:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblEmployee(EmpNo, PostTyp, OfficeType,DSUtblCompanyID,tblCompanyID,User_Group_Id,tblDept,tblDesigID, BPS, tblEmpShiftID, FName, LName, Father, CNIC, Marital, Gender, DoB, Religion, Nationality, Domicile, Mobile, RPh, OPh, email, Area, City, Addrss, Spouse,SpOccu, SoCNIC, SpPh, Dependent, SpEmail,Apoint,Joind, Enterby)VALUES('" + dataID[1] + "', '" + dataID[2] + "',  '" + dataID[3] + "',  '" + dataID[4] + "',  '" + dataID[5] + "',  '" + dataID[6] + "',  '" + dataID[7] + "',  '" + dataID[8] + "', '" + dataID[9] + "', '" + dataID[10] + "', '" + dataID[11] + "', '" + dataID[12] + "', '" + dataID[13] + "', '" + dataID[14] + "','" + dataID[15] + "', '" + dataID[16] + "',  CONVERT(DATETIME, '" + dataID[17] + "', 102), '" + dataID[18] + "', '" + dataID[19] + "', '" + dataID[20] + "', '" + dataID[21] + "', '" + dataID[22] + "', '" + dataID[23] + "', '" + dataID[24] + "', '" + dataID[25] + "', '" + dataID[26] + "', '" + dataID[27] + "', '" + dataID[28] + "', '" + dataID[29] + "', '" + dataID[30] + "', '" + dataID[31] + "', '" + dataID[32] + "', '" + dataID[33] + "', '" + dataID[34] + "','" + dataID[35] + "', '" + dataID[36] + "'); select SCOPE_IDENTITY()"));
                            break;

                        case 27:
                            context.Response.Write(Fn.Data2Json("SELECT Full_Name,Group_ID,ContactNos,Email,PO_ID,Regions,Distt,U_Status,Deportment FROM TblHResources WHERE (User_ID =" + dataID[1] + ")"));
                            break;

                        case 28:
                            Fn.ExenID("UPDATE TblHResources SET Full_Name ='" + dataID[1] + "', Group_ID ='" + dataID[2] + "', ContactNos ='" + dataID[3] + "', Email ='" + dataID[4] + "', PO_ID ='" + dataID[5] + "', Regions ='" + dataID[6] + "', Distt ='" + dataID[7] + "', U_Status ='" + dataID[8] + "', U_Pass ='" + Encryptor.Encrypt(dataID[9]) + "', modify_by ='" + dataID[10] + "'+convert(varchar,getdate()) WHERE (User_ID =" + dataID[11] + ")");
                            context.Response.Write("ok");
                            break;

                        case 29:
                            context.Response.ContentType = "application/" + dataID[1];
                            string[] ds = dataID[4].Split('¦');
                            string[] sql = dataID[5].Split('¦');
                            context.Response.AddHeader("Content-disposition", "filename=" + dataID[2]);
                            byte[] Contents = Fn.RunReport(ds, sql, "TaskMgr." + dataID[3], dataID[1], context, true);
                            context.Response.BinaryWrite(Contents);
                            Contents = null;
                            break;

                        case 30:
                            context.Response.Write(Fn.Data2Json("SELECT AcGroup FROM tblChartAc WHERE (AcType = N'" + dataID[1] + "') GROUP BY AcGroup"));
                            break;

                        case 31:
                            context.Response.Buffer = true;
                            context.Response.Clear();
                            context.Response.AddHeader(
                               "content-disposition",
                               "attachement; filename=" + dataID[1]);
                            //context.Response.ContentType = "application/zip";
                            context.Response.WriteFile(
                               "~/Documents/" + dataID[2]);
                            break;

                        case 32:
                            context.Response.Write(Fn.Exec("UPDATE tblEmployee SET EmpNo = '" + dataID[1] + "', PostTyp = '" + dataID[2] + "', OfficeType = '" + dataID[3] + "', DSUtblCompanyID = '" + dataID[4] + "', tblCompanyID = '" + dataID[5] + "', User_Group_Id = '" + dataID[6] + "', tblDept = '" + dataID[7] + "', tblDesigID = '" + dataID[8] + "', BPS = '" + dataID[9] + "', tblEmpShiftID = '" + dataID[10] + "', FName = '" + dataID[11] + "', LName = '" + dataID[12] + "', Father = '" + dataID[13] + "', CNIC = '" + dataID[14] + "', Marital = '" + dataID[15] + "', Gender = '" + dataID[16] + "', DoB = CONVERT(DATETIME, '" + dataID[17] + "', 102), Religion = '" + dataID[18] + "', Nationality = '" + dataID[19] + "', Domicile = '" + dataID[20] + "', Mobile = '" + dataID[21] + "', RPh = '" + dataID[22] + "', OPh = '" + dataID[23] + "', email = '" + dataID[24] + "', Area = '" + dataID[25] + "', City = '" + dataID[26] + "', Addrss = '" + dataID[27] + "', Spouse = '" + dataID[28] + "', SpOccu = '" + dataID[29] + "', SoCNIC = '" + dataID[30] + "', SpPh = '" + dataID[31] + "', Dependent = '" + dataID[32] + "', SpEmail = '" + dataID[33] + "', Apoint = CONVERT(DATETIME, '" + dataID[34] + "', 102), Joind = CONVERT(DATETIME, '" + dataID[35] + "', 102) where (EmpID = '" + dataID[36] + "')"));
                            break;

                        case 33:
                            //context.Response.Write(Fn.Exec("UPDATE tblEmployee SET PNo = '" + dataID[1] + "', VNo = '" + dataID[2] + "', NTN = '" + dataID[3] + "', Reg = '" + dataID[4] + "', BPay = '" + dataID[5] + "', GPay = '" + dataID[6] + "', NPay = '" + dataID[7] + "', Bank = '" + dataID[8] + "', BCode = '" + dataID[9] + "', BAcc = '" + dataID[10] + "' WHERE (EmpID = '" + dataID[11] + "')"));
                            context.Response.Write(Fn.Exec("UPDATE tblEmployee SET PNo = '" + dataID[1] + "', VNo = '" + dataID[2] + "', NTN = '" + dataID[3] + "', Reg = '" + dataID[4] + "',  GPay = '" + dataID[6] + "', NPay = '" + dataID[7] + "', Bank = '" + dataID[8] + "', BankID = '" + dataID[8] + "', BCode = '" + dataID[9] + "', BAcc = '" + dataID[10] + "' WHERE (EmpID = '" + dataID[11] + "')"));
                            break;

                        case 34:
                            context.Response.Write(Fn.Data2Json("SELECT FileID, FileTitle, FileExt FROM  tblEmpDocs WHERE (EmpID = " + dataID[1] + ")"));
                            break;

                        case 35:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblEmpQualifications (Degree, Completion, Board, Subject1, Subject2, Subject3, CGPA, EduType, EmpID) VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', '" + dataID[7] + "', '" + dataID[8] + "', '" + dataID[9] + "');select SCOPE_IDENTITY()"));
                            break;

                        case 36:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblEmpService(BPS, Post, FDate, TDate, CampusID,Deport, Cat, EmpID) VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', '" + dataID[7] + "', '" + dataID[8] + "');select SCOPE_IDENTITY()"));
                            break;

                        case 37:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblEmpTraining(Training, Duration, FDate, TrainArea, Agency, Venue, City, Country, EmpID)VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', '" + dataID[7] + "', '" + dataID[8] + "', '" + dataID[9] + "');select SCOPE_IDENTITY()"));
                            break;

                        case 38:
                            context.Response.Write(Fn.Data2Json(@"SELECT        EmpID, FName, LName, EmpNo, PostTyp, Father, CNIC, Marital, Gender, format(DoB, 'dd MMMM yyyy') AS DoB, Religion, Nationality, Domicile, Mobile, RPh, OPh, email, Area, City, Addrss, Spouse, SpOccu, 
                         SoCNIC, SpPh, Dependent, SpEmail,  Convert(VARCHAR(50),Apoint,103) AS Apoint,  Convert(VARCHAR(50),Joind,103) AS Joind, EmpStatus, format(LDate, 'dd MMMM yyyy') AS LDate, PNo, VNo, NTN, Reg, BPay, GPay, 
                         NPay, Bank, BankID, BCode, BAcc,  OfficeType, DSUtblCompanyID, tblCompanyID, User_Group_Id, tblDept, tblDesigID, BPS, tblEmpShiftID , ENO = 'FRDP-EMP-'+RIGHT('000000000'+ CAST(EmpNo AS VARCHAR(50)),5), PhotoExtension= CASE WHEN ISNULL(PhotoExtension,'0.png')='0.png' then '0.png' else CAST(EmpID AS VARCHAR(50)) +'B'+PhotoExtension end 
FROM            tblEmployee WHERE (EmpID = '" + dataID[1] + "')"));
                            break;

                        case 39:
                            context.Response.Write(Fn.Data2Json("SELECT Degree, format(Completion,'dd MMMM yyyy') as Completion, Board, Subject1, Subject2, Subject3, CGPA FROM tblEmpQualifications WHERE (EmpID = '" + dataID[1] + "') AND (EduType = '" + dataID[2] + "') ORDER BY Completion DESC"));
                            break;

                        case 40:
                            //context.Response.Write(Fn.Data2Json(@"SELECT ServiceID,tblEmpService.BPS, tblEmpService.Post, case when tblEmpService.TDate='01 January 1900' then 'Up Todate' else format(tblEmpService.TDate, 'dd MMMM yyyy') end AS TDate, tblEmpService.CampusID, tblEmpService.Deport,   tblEmpService.Cat, format(tblEmpService.FDate, 'dd MMMM yyyy') AS FDate, tblCampus.CampusName AS Name FROM tblEmpService INNER JOIN  tblCampus ON tblEmpService.CampusID = tblCampus.CampusID WHERE (tblEmpService.EmpID = '" + dataID[1] + "') ORDER BY tblEmpService.FDate DESC "));
                            context.Response.Write(Fn.Data2Json(@"SELECT        ServiceID, BPS, Post, CASE WHEN tblEmpService.TDate = '01 January 1900' THEN 'Up Todate' ELSE format(tblEmpService.TDate, 'dd MMMM yyyy') END AS TDate, CampusID AS Name, Deport, Cat, 
                         format(FDate, 'dd MMMM yyyy') AS FDate, 1 AS CampusID
FROM            tblEmpService
WHERE        (tblEmpService.EmpID = '" + dataID[1] + @"')
ORDER BY FDate DESC"));

                            break;

                        case 41:
                            context.Response.Write(Fn.Data2Json("SELECT Training, Duration,format(FDate, 'dd MMMM yyyy') AS FDate, TrainArea, Agency, Venue, City, Country FROM tblEmpTraining WHERE (EmpID = '" + dataID[1] + "') ORDER BY FDate DESC"));
                            break;

                        case 42:
                            Fn.Exec("UPDATE tblStudentEnquiry SET HouseID = '" + dataID[5] + "',Reg_No='" + dataID[6] + "' WHERE (EnquiryID = " + dataID[1] + ")");
                            context.Response.Write(Fn.ExenID("INSERT INTO tblClassAllotment(StudID, SectionID, RollNo, SessionID) VALUES (" + dataID[1] + ", " + dataID[2] + ", " + dataID[3] + ", " + dataID[4] + ");select SCOPE_IDENTITY()"));
                            break;

                        case 43:
                            context.Response.Write(Fn.Data2Json("SELECT tblClass.Class_Name, tblSections.Section, tblSections.SectionID, tblEmployee.FName, tblEmployee.LName, COUNT(tblClassAllotment.StudID) AS srth,MAX(isnull(tblClassAllotment.RollNo,0))+1 AS rol FROM tblSections INNER JOIN  tblEmployee ON tblSections.EmpID = tblEmployee.EmpID INNER JOIN  tblClass ON tblSections.ClassID = tblClass.Class_ID LEFT OUTER JOIN  tblClassAllotment ON tblSections.SectionID = tblClassAllotment.SectionID WHERE (tblSections.CampusID = " + dataID[1] + ") AND (tblSections.SessionID = " + dataID[2] + ") GROUP BY tblClass.Class_Name, tblSections.Section, tblSections.SectionID, tblEmployee.FName, tblEmployee.LName"));
                            break;

                        case 44:
                            context.Response.Write(Fn.Data2Json("SELECT id,SectionID, RollNo,Stat FROM tblClassAllotment WHERE (StudID = " + dataID[1] + ") AND (SessionID = " + dataID[2] + ")"));
                            break;

                        case 45:
                            Fn.Exec("UPDATE tblStudentEnquiry SET HouseID = '" + dataID[4] + "',Reg_No='" + dataID[6] + "' WHERE (EnquiryID = " + dataID[5] + ")");
                            context.Response.Write(Fn.Exec("UPDATE tblClassAllotment SET SectionID = " + dataID[2] + ", RollNo = " + dataID[3] + " WHERE (id = " + dataID[1] + ")"));
                            break;

                        case 46:
                            context.Response.Write(Fn.Data2Json("SELECT FeeCat, FeeCatID FROM tblFeeCategoryHDR WHERE (CampusID = " + dataID[1] + ")"));
                            break;

                        case 47:
                            context.Response.Write(Fn.Exec("INSERT INTO tblFeeCategoryHDR (FeeCat, CampusID) VALUES ('" + dataID[1] + "', " + dataID[2] + ")"));
                            break;

                        case 48:
                            context.Response.Write(Fn.Exec("INSERT INTO tblFeeCategoryDTL(Fee, FeeTypeID, FeeCatID) VALUES ('" + dataID[1] + "', " + dataID[2] + ", " + dataID[3] + ")"));
                            break;

                        case 49:
                            context.Response.Write(Fn.Data2Json("SELECT tblFeeCategoryDTL.ID,tblFeeCategoryDTL.Fee, tblFeeType.FeeName FROM tblFeeCategoryDTL INNER JOIN tblFeeType ON tblFeeCategoryDTL.FeeTypeID = tblFeeType.FeeTypID WHERE (tblFeeCategoryDTL.FeeCatID = " + dataID[1] + ")"));
                            break;

                        case 50:
                            context.Response.Write(Fn.Exec("UPDATE TblHResources SET U_ThemeID ='" + dataID[1] + "' WHERE (User_ID = " + dataID[2] + ")"));
                            break;

                        case 51:
                            context.Response.Write(Fn.Data2Json("SELECT tblFeeType.FeeName, tblFeeCategoryDTL.Fee FROM tblFeeCategoryDTL INNER JOIN  tblFeeType ON tblFeeCategoryDTL.FeeTypeID = tblFeeType.FeeTypID WHERE (tblFeeCategoryDTL.FeeCatID = " + dataID[1] + ")"));
                            break;

                        case 52:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblStudent_Fee (FeetypeID, Fee, Stud_ID) VALUES (" + dataID[1] + ", '" + dataID[2] + "', " + dataID[3] + ");select SCOPE_IDENTITY()"));
                            break;

                        case 54:
                            context.Response.Write(Fn.Data2Json("SELECT tblFeeType.FeeName, tblStudent_Fee.Fee, tblStudent_Fee.ID FROM tblStudent_Fee INNER JOIN tblFeeType ON tblStudent_Fee.FeetypeID = tblFeeType.FeeTypID WHERE (tblStudent_Fee.Stud_ID = " + dataID[1] + ")"));
                            break;

                        case 53:
                            context.Response.Write(Fn.Exec("DELETE FROM tblFeeCategoryDTL WHERE (ID = " + dataID[1] + ")")); break;
                        case 55:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblTempFee (FeeTypeId, Fee) VALUES (" + dataID[1] + ", '" + dataID[2] + "');select SCOPE_IDENTITY()"));
                            break;

                        case 56:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblBudgetHDR (AccYearID, CampusID, BudgetTitle) VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "');select SCOPE_IDENTITY()"));
                            break;

                        case 57:
                            context.Response.Write(Fn.Data2Json("SELECT FileID, FileTitle, FileExt FROM  tblStudDocs WHERE (StudID = " + dataID[1] + ")"));
                            break;

                        case 58:
                            context.Response.Write(Fn.Exec("DELETE FROM tblStudent_Fee WHERE (ID = " + dataID[1] + ")"));
                            break;

                        case 59:
                            context.Response.Write(Fn.Exec("DELETE FROM tblTempFee WHERE (ID = " + dataID[1] + ")"));
                            break;

                        case 60:
                            context.Response.Write(Fn.Data2Json("SELECT tblStudentEnquiry.Std_Name, tblStudentEnquiry.Std_Sex, tblStudentEnquiry.Father_Name, tblClass.Class_Name, tblSections.Section, tblClassAllotment.RollNo FROM tblStudentEnquiry INNER JOIN tblClassAllotment ON tblStudentEnquiry.EnquiryID = tblClassAllotment.StudID INNER JOIN tblSections ON tblClassAllotment.SectionID = tblSections.SectionID INNER JOIN tblClass ON tblSections.ClassID = tblClass.Class_ID WHERE (tblSections.CampusID = " + dataID[1] + ") AND (tblClassAllotment.SessionID = " + dataID[2] + ") AND (tblStudentEnquiry.NIC_No = '" + dataID[3] + "') AND (tblStudentEnquiry.EQ_Status = 'Registered') AND tblStudentEnquiry.EnquiryID <> " + dataID[4]));
                            break;

                        case 61:
                            context.Response.Write(Fn.Data2Json("sp_GenChallan '" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + dataID[8] + "','" + dataID[9] + "'"));
                            break;

                        case 62:
                            context.Response.Write(Fn.Data2Json("SELECT * FROM TblOutputActivities WHERE (OutputIndID = " + dataID[1] + ") AND PO_ID=" + dataID[2]));
                            break;

                        case 63:
                            context.Response.ContentType = "application/" + dataID[1];
                            ds = dataID[4].Split('¦');
                            sql = dataID[5].Split('¦');
                            context.Response.AddHeader("Content-disposition", "attachment; filename=" + dataID[2]);
                            Contents = Fn.RunReport(ds, sql, "TaskMgr." + dataID[3], dataID[1], context, true);
                            context.Response.BinaryWrite(Contents);
                            Contents = null;
                            break;

                        case 64:
                            context.Response.Write(Fn.Data2Json("SELECT tblStudentEnquiry.Std_Name, tblClassAllotment.RollNo, tblStudentEnquiry.Father_Name, CONVERT(varchar, tblClassAllotment.StudID) AS StdID,tblStudentEnquiry.Std_Sex FROM tblClassAllotment INNER JOIN  tblStudentEnquiry ON tblClassAllotment.StudID = tblStudentEnquiry.EnquiryID WHERE (tblClassAllotment.SectionID = " + dataID[1] + ") AND (tblStudentEnquiry.EQ_Status = 'Registered') AND (tblStudentEnquiry.PayMethod = " + dataID[2] + ")"));
                            break;

                        case 65:
                            context.Response.Write(Fn.Data2Json("SELECT AcSubGroup FROM tblChartAc WHERE (AcType = N'" + dataID[1] + "') AND (AcGroup = N'" + dataID[2] + "') GROUP BY AcSubGroup"));
                            break;

                        case 66:
                            context.Response.Write(Fn.Data2Json("SELECT AcName, AcCode, AcType, AcGroup, AcSubGroup, TypeAc FROM tblChartAc WHERE (AcID = " + dataID[1] + ")"));
                            break;

                        case 67:
                            Fn.ExenID("INSERT INTO tblFieldMonitoringDTL (IndicatorG, Indicator, Grade, Suggestion, FMonitID) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "')");
                            break;

                        case 68:
                            context.Response.Write(Fn.Exec("UPDATE tblBudgetHDR SET AccYearID = '" + dataID[1] + "', CampusID = '" + dataID[2] + "', BudgetTitle = '" + dataID[3] + "' WHERE (BudgetID = '" + dataID[4] + "')"));
                            break;

                        case 69:
                            context.Response.Write(Fn.Data2Json("SELECT FileTitle, FileExt, FileID FROM tblFVisitDocs WHERE (FVisitID = " + dataID[1] + ")"));
                            break;

                        case 70:
                            context.Response.Write(Fn.Data2Json("SELECT tblSubjects.Subject_Name, tblSubjects.Subject_ID FROM tblSubjects INNER JOIN tblClassSyllabus ON tblSubjects.Subject_ID = tblClassSyllabus.SubjectID WHERE (tblClassSyllabus.SectionID = " + dataID[1] + ") AND (CONVERT(varchar, tblClassSyllabus.EmpID) LIKE '%')"));
                            break;

                        case 72:
                            context.Response.Write(Fn.Data2Json("SELECT tblClassAllotment.StudID, tblClassAllotment.RollNo, tblStudentEnquiry.Std_Name,tblStudentEnquiry.Father_Name FROM tblStudentEnquiry INNER JOIN tblClassAllotment ON tblStudentEnquiry.EnquiryID = tblClassAllotment.StudID WHERE (tblClassAllotment.SectionID = " + dataID[1] + ")"));
                            break;

                        case 71:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblTestHDR (Term, Test_Date, Class_ID, Subject_ID, Total, Paper) VALUES (" + dataID[1] + ", '" + dataID[2] + "', " + dataID[3] + ", " + dataID[4] + ", " + dataID[5] + ", '" + dataID[6] + "');select SCOPE_IDENTITY()")); break;
                        case 73:
                            context.Response.Write(Fn.ExenID("UPDATE tblTestHDR SET Term = " + dataID[1] + ", Test_Date ='" + dataID[2] + "', Class_ID = " + dataID[3] + ", Subject_ID = " + dataID[4] + ", Total = " + dataID[5] + ", Paper = '" + dataID[6] + "' WHERE (StdTest_ID = " + dataID[7] + ")")); break;
                        case 74:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblTestDTL (StdTest_ID, Std_ID, Obt_Marks, Attdnc) VALUES (" + dataID[1] + ", " + dataID[2] + ",'" + dataID[3] + "', '" + dataID[4] + "');select SCOPE_IDENTITY()")); break;
                        case 75:
                            context.Response.Write(Fn.ExenID("UPDATE tblTestDTL SET Obt_Marks = '" + dataID[1] + "', Attdnc = '" + dataID[2] + "' WHERE (id = '" + dataID[3] + "')")); break;
                        case 76:
                            where = "WHERE (CONVERT(varchar, tblExams.ExamID) like '" + dataID[1] + "') AND (CONVERT(varchar, tblTestHDR.Class_ID) like '" + dataID[2] + "') AND (CONVERT(varchar, tblTestHDR.Subject_ID) like '" + dataID[5] + "')";
                            if (dataID[4] != "") { where = " AND Test_Date BETWEEN CONVERT(DATETIME, '" + dataID[3] + "', 102) AND CONVERT(DATETIME, '" + dataID[4] + "', 102)"; }
                            context.Response.Write(Fn.Data2Json("SELECT tblExams.Exam, tblSubjects.Subject_Name, tblEmployee.FName, tblEmployee.LName, tblClass.Class_Name, tblTestHDR.Test_Date,   tblTestHDR.StdTest_ID FROM tblSections INNER JOIN  tblTestHDR INNER JOIN  tblExams ON tblTestHDR.Term = tblExams.ExamID ON tblSections.SectionID = tblTestHDR.Class_ID INNER JOIN  tblClassSyllabus ON tblTestHDR.Subject_ID = tblClassSyllabus.SubjectID AND tblTestHDR.Class_ID = tblClassSyllabus.SectionID INNER JOIN  tblSubjects ON tblTestHDR.Subject_ID = tblSubjects.Subject_ID INNER JOIN  tblEmployee ON tblClassSyllabus.EmpID = tblEmployee.EmpID INNER JOIN  tblClass ON tblSections.ClassID = tblClass.Class_ID " + where + " AND (tblSections.CampusID = 1) AND (tblSections.SessionID = 1) ORDER BY tblTestHDR.Test_Date DESC"));
                            break;

                        case 77:
                            context.Response.Write(Fn.Data2Json("SELECT Class_ID, Test_Date, Term, Subject_ID, Total, Paper FROM tblTestHDR WHERE (StdTest_ID = " + dataID[1] + ")")); break;
                        case 78:
                            context.Response.Write(Fn.Data2Json("SELECT tblClassAllotment.RollNo, tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name, tblTestDTL.Obt_Marks, tblTestDTL.Attdnc, tblTestDTL.id,tblTestDTL.Std_ID FROM tblTestDTL INNER JOIN  tblClassAllotment ON tblTestDTL.Std_ID = tblClassAllotment.StudID INNER JOIN  tblStudentEnquiry ON tblClassAllotment.StudID = tblStudentEnquiry.EnquiryID WHERE (tblTestDTL.StdTest_ID = " + dataID[1] + ")"));
                            break;

                        case 79:
                            context.Response.Write(Fn.Exec("UPDATE tblEmpService SET BPS = '" + dataID[1] + "', Post = '" + dataID[2] + "', FDate ='" + dataID[3] + "', TDate = '" + dataID[4] + "', CampusID = '" + dataID[5] + "', Deport = '" + dataID[6] + "', Cat = '" + dataID[7] + "' WHERE (ServiceID = '" + dataID[8] + "')")); break;
                        case 80:
                            context.Response.Write(Fn.Data2Json("SELECT tblEmployee.EmpID, tblEmployee.FName, tblEmployee.LName FROM tblEmployee INNER JOIN  VWcPost ON tblEmployee.EmpID = VWcPost.EmpID WHERE (tblEmployee.EmpStatus = 'Active') AND (tblEmployee.PostTyp like '" + dataID[2] + "') AND (VWcPost.Deport like '" + dataID[3] + "') AND (VWcPost.CampusID = '" + dataID[1] + "')"));
                            break;

                        case 81:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblTempPay (SHeadId, amt) VALUES (" + dataID[1] + ", '" + dataID[2] + "');select SCOPE_IDENTITY()")); break;
                        case 82:
                            context.Response.Write(Fn.Exec("DELETE FROM tblTempPay WHERE (ID = " + dataID[1] + ")")); break;
                        case 83:
                            context.Response.Write(Fn.HTMLTable("SELECT tblClass.Class_Name + ' ' + tblSections.Section AS Class, SUM(tblFeeDTL.Fee) AS Unpaid FROM tblFeeHDR INNER JOIN tblFeeMonths ON tblFeeHDR.FeeID = tblFeeMonths.FeeID INNER JOIN tblFeeDTL ON tblFeeMonths.FID = tblFeeDTL.FID INNER JOIN tblSections ON tblFeeHDR.SectionID = tblSections.SectionID INNER JOIN tblClass ON tblSections.ClassID = tblClass.Class_ID WHERE (tblSections.SessionID = 1) AND (tblFeeHDR.PRecDate IS NULL) AND (tblFeeHDR.DueDate < GETDATE()) GROUP BY tblClass.Class_Name + ' ' + tblSections.Section")); break;
                        case 84:
                            context.Response.Write(Fn.Exec("UPDATE TblHResources SET U_ThemeID ='" + dataID[1] + "' WHERE (User_ID = " + dataID[2] + ")"));
                            break;

                        case 85:
                            context.Response.Write(Fn.Data2Json("SELECT tblBudgetHDR.BudgetID, tblBudgetHDR.BudgetTitle, tblAC_Year.SessionName FROM tblAC_Year INNER JOIN tblBudgetHDR ON tblAC_Year.Session_ID = tblBudgetHDR.AccYearID WHERE (tblAC_Year.Session_ID = '" + dataID[1] + "')")); break;
                        case 86:
                            context.Response.Write(Fn.Data2Json("sp_GenBudget '" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "'")); break;
                        case 87:
                            context.Response.Write(Fn.HTMLTable("dbo.CrossTab 'SELECT  * from VWBudget0 WHERE (BudgetID = " + dataID[1] + ")','Mth','max(tbox)[]',N'[Account Name]',NULL,',Bdg_Year,Bdg_Month'")); break;
                        case 88:
                            context.Response.Write(Fn.Exec("UPDATE tblBudgetDTL SET Bdg_Amount = '" + dataID[1] + "' WHERE (BID = '" + dataID[2] + "')"));
                            break;

                        case 89:
                            context.Response.Write(Fn.Data2Json("SELECT tblClass.Class_Name + ' ' + tblSections.Section AS clss, tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name, tblStudentEnquiry.Std_Sex, tblStudentEnquiry.Pros_No FROM tblSections INNER JOIN tblClass ON tblSections.ClassID = tblClass.Class_ID INNER JOIN tblClassAllotment ON tblSections.SectionID = tblClassAllotment.SectionID AND tblSections.SessionID = tblClassAllotment.SessionID INNER JOIN tblStudentEnquiry ON tblClassAllotment.StudID = tblStudentEnquiry.EnquiryID WHERE (tblStudentEnquiry.NIC_No = '" + dataID[3] + "') AND (tblSections.SessionID = '" + dataID[2] + "') AND (tblSections.CampusID = '" + dataID[1] + "')"));
                            break;

                        case 90:
                            context.Response.Write(Fn.Data2Json("SELECT tblFeeHDR.FeeID, tblFeeHDR.StudID, tblFeeHDR.SectionID, tblFeeHDR.DueDate, tblFeeHDR.PayStatus, tblFeeHDR.Remarks, tblClass.Class_Name,   tblSections.Section, tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name FROM tblFeeHDR INNER JOIN  tblSections ON tblFeeHDR.SectionID = tblSections.SectionID INNER JOIN  tblClass ON tblSections.ClassID = tblClass.Class_ID INNER JOIN  tblStudentEnquiry ON tblFeeHDR.StudID = tblStudentEnquiry.EnquiryID WHERE (tblSections.SessionID = '" + dataID[1] + "') AND (tblSections.CampusID = '" + dataID[2] + "') AND (tblFeeHDR.ChallanNo ='" + dataID[3] + "') AND (tblFeeHDR.PayStatus = 'Payable')"));
                            break;

                        case 91:
                            context.Response.Write(Fn.Data2Json("SELECT format(Months,'MMMM yyyy') as Months, FID FROM tblFeeMonths WHERE (FeeID = '" + dataID[1] + "')"));
                            break;

                        case 92:
                            context.Response.Write(Fn.Data2Json("SELECT tblFeeDTL.FeeTypID, tblFeeDTL.Fee, tblFeeType.FeeName, tblFeeDTL.id FROM tblFeeDTL INNER JOIN tblFeeType ON tblFeeDTL.FeeTypID = tblFeeType.FeeTypID WHERE (tblFeeDTL.FID = " + dataID[1] + ") AND (tblFeeDTL.FeeTypID <> 9)"));
                            break;

                        case 93:
                            context.Response.Write(Fn.Data2Json("DELETE FROM tblFeeMonths WHERE (FID = " + dataID[1] + ");UPDATE tblFeeHDR SET PayStatus = 'Payable' WHERE (FeeID =  (SELECT MAX(tblFeeHDR.FeeID) AS Expr1 FROM tblFeeHDR INNER JOIN  tblFeeMonths ON tblFeeHDR.FeeID = tblFeeMonths.FeeID WHERE (tblFeeHDR.StudID =  (SELECT tblFeeHDR_1.StudID  FROM tblFeeHDR AS tblFeeHDR_1 LEFT OUTER JOIN  tblFeeMonths AS tblFeeMonths_1 ON tblFeeHDR_1.FeeID = tblFeeMonths_1.FeeID  WHERE (tblFeeMonths_1.FeeID IS NULL))) AND (tblFeeMonths.FeeID IS NOT NULL)));DELETE FROM tblFeeHDR FROM tblFeeHDR LEFT OUTER JOIN tblFeeMonths ON tblFeeHDR.FeeID = tblFeeMonths.FeeID WHERE (tblFeeMonths.FeeID IS NULL)"));
                            break;

                        case 94:
                            context.Response.Write(Fn.Exec("INSERT INTO TblStudtWDrawl(Stud_ID, Remarks, stat) VALUES (" + dataID[1] + ", '" + dataID[3] + "', '" + dataID[3] + "');UPDATE tblClassAllotment SET Stat = '" + dataID[2] + "' WHERE (id = " + dataID[1] + ")"));
                            break;

                        case 95:
                            context.Response.Write(Fn.ExenID("UPDATE tblSections SET EmpID = '" + dataID[5] + "' WHERE (SectionID = '" + dataID[8] + "')"));
                            break;

                        case 96:
                            context.Response.Write(Fn.ExenID("UPDATE tblClassSyllabus SET EmpID = " + dataID[1] + " WHERE (SyllabusID = " + dataID[2] + ")"));
                            break;

                        case 97:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblRegistrationFee (FeeTypeId, Fee,StdID) VALUES (" + dataID[1] + ", '" + dataID[2] + "', '" + dataID[3] + "');select SCOPE_IDENTITY()"));
                            break;

                        case 98:
                            context.Response.Write(Fn.Data2Json("SELECT tblFeeType.FeeName, tblRegistrationFee.Fee, tblRegistrationFee.ID FROM tblRegistrationFee INNER JOIN  tblFeeType ON tblRegistrationFee.FeeTypeId = tblFeeType.FeeTypID WHERE (tblRegistrationFee.StdID = " + dataID[1] + ")"));
                            break;

                        case 99:
                            context.Response.Write(Fn.Exec("UPDATE tblRegistrationFee SET Fee = '" + dataID[1] + "' WHERE (ID = " + dataID[2] + ")"));
                            break;

                        case 100:
                            context.Response.Write(Fn.Exec("UPDATE tblStudentEnquiry SET DoR = CONVERT(DATETIME, '" + dataID[2] + "', 102), Book = '" + dataID[3] + "', PayMethod = '" + dataID[4] + "', Ffrom = CONVERT(DATETIME, '" + dataID[5] + "', 102), Fto = CONVERT(DATETIME, '" + dataID[6] + "', 102), Due = CONVERT(DATETIME, '" + dataID[7] + "', 102) WHERE (EnquiryID = " + dataID[1] + ")"));
                            break;

                        case 101:
                            context.Response.Write(Fn.Data2Json("SELECT format(tblStudentEnquiry.Ffrom, 'MMMM yyyy') AS FMFrom, format(tblStudentEnquiry.Fto, 'MMMM yyyy') AS FMTo, tblStudentEnquiry.Due AS DueDate, tblStudentEnquiry.PayStatus, tblStudentEnquiry.FeeMrks AS Remarks, tblClass.Class_Name, tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name,tblStudentEnquiry.DoP FROM tblClass INNER JOIN tblStudentEnquiry ON tblClass.Class_ID = tblStudentEnquiry.Applevel_Class_ID WHERE (tblStudentEnquiry.EnquiryID = " + dataID[1] + ")"));
                            break;

                        case 102:
                            context.Response.Write(Fn.Exec("sp_PayRegChallan '" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "'"));
                            break;

                        case 103:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblFeeDTL (FeeTypID,Fee,FID) VALUES (" + dataID[1] + ", '" + dataID[2] + "', '" + dataID[3] + "');select SCOPE_IDENTITY()"));
                            break;

                        case 104:
                            context.Response.Write(Fn.Exec("UPDATE tblFeeDTL SET Fee = '" + dataID[1] + "' WHERE (ID = " + dataID[2] + ")"));
                            break;

                        case 105:
                            context.Response.Write(Fn.Exec("UPDATE tblFeeHDR SET isCancel = 1, PayStatus = 'Cancel', PRecBy = '" + dataID[1] + "', PRecDate = GETDATE() WHERE (FeeID = '" + dataID[2] + "')"));
                            break;

                        case 106:
                            context.Response.Write(Fn.Exec("UPDATE tblFeeHDR SET DueDate = CONVERT(DATETIME, '" + dataID[1] + "', 102), Remarks = '" + dataID[2] + "' WHERE (FeeID = '" + dataID[3] + "')"));
                            break;

                        case 107:
                            string rid = Fn.GetRecords("SELECT 1 FROM tblAC_Year WHERE (Session_ID = " + dataID[1] + ") AND ('" + dataID[3] + "' BETWEEN Session_Str AND Session_End)")[0];
                            if (rid == "1")
                            {
                                Fn.Exec("UPDATE tblSetup SET AcYrID = " + dataID[1] + ", EdYrID = " + dataID[2] + ", AccYear = (SELECT Session_Str FROM tblAC_Year WHERE (Session_ID = " + dataID[1] + ")), AMonth = '" + dataID[3] + "' WHERE (CompID = 16)");
                                context.Response.Write(1);
                            }
                            else 
                            { 
                                context.Response.Write(0); 
                            }
                            break;

                        case 108:
                            context.Response.Write(Fn.GetRecords("select case when convert(date,'" + dataID[1] + "')>dateadd(day,(7),convert(date,'" + dataID[2] + "')) then (SELECT lateFine2 FROM tblInstitute WHERE (InstID = 1)) else case when convert(date,'" + dataID[1] + "')>convert(date,'" + dataID[2] + "') then (SELECT lateFine1 FROM tblInstitute WHERE (InstID = 1)) else (0) end end")[0]);
                            break;

                        case 109:
                            context.Response.Write(Fn.Data2Json("SELECT tblStudentEnquiry.Std_Name, tblStudentEnquiry.Father_Name, tblStudentEnquiry.Std_Sex, tblClassAllotment.StudID FROM tblStudentEnquiry INNER JOIN  tblClassAllotment ON tblStudentEnquiry.EnquiryID = tblClassAllotment.StudID WHERE (tblClassAllotment.SectionID = " + dataID[1] + ")"));
                            break;

                        case 110:
                            context.Response.Write(Fn.ExenID("INSERT INTO TblEmpSalary(EmpID, SrlyAmt, SrlyTypID) VALUES (" + dataID[3] + ", " + dataID[2] + ", " + dataID[1] + ");select SCOPE_IDENTITY()"));
                            break;

                        case 111:
                            context.Response.Write("{\"row\":" + Fn.Data2Json("SELECT ESrlyID, SrlyNam, SrlyAmt, EmpID FROM VW_SrlyHeads WHERE (EmpID = " + dataID[1] + ")") + ",\"totl\":" + Fn.GetRecords("SELECT SUM(AMT) AS totAmt FROM VW_SrlyHeads WHERE (EmpID = " + dataID[1] + ")")[0] + "}");
                            break;

                        case 112:
                            context.Response.Write(Fn.ExenID("DELETE FROM TblEmpSalary WHERE (ESrlyID = " + dataID[1] + ")"));
                            break;

                        case 113:
                            context.Response.Write(Fn.Data2Json("sp_GenSalary '" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + dataID[8] + "'"));
                            break;
                        case 114:
                            context.Response.Buffer = true;
                            context.Response.Clear();
                            context.Response.AddHeader(
                               "content-disposition",
                               "attachement; filename=" +Convert.ToString(dataID[1].Trim()));
                            string typ = Fn.ExenID("Select TOP(1) MIME_Type FROM tblExtensions WHERE File_Extension = '." + dataID[2].Split('.')[1] + "'");
                            string f = dataID[2].Replace("Emp/", "");
                            context.Response.ContentType = typ;

                            context.Response.WriteFile("~/Uploads/EmpDocuments/" + f);
                            break;
                        case 115:
                            context.Response.Write(Fn.Data2Json("SELECT FileID, FileTitle, FileExt FROM  tblEmpDocs WHERE (EmpID = " + dataID[1] + ") AND (UploadedFor='" + dataID[2] + @"')"));
                            break;

                        case 116:
                            string[] dataID116 = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form["vls"])).Split('ǁ');
                            string id116 = Fn.ExenID("INSERT INTO tblEmployee(EmpNo, PostTyp, OfficeType,DSUtblCompanyID,tblCompanyID,User_Group_Id,tblDept,tblDesigID, BPS, tblEmpShiftID, BPay, FName, LName, Father, CNIC, Marital, Gender, DoB, Religion, Nationality, Domicile, Mobile, RPh, OPh, email, Area, City, Addrss, Spouse,SpOccu, SoCNIC, SpPh, Dependent, SpEmail,Apoint,Joind, Enterby)VALUES('" + dataID116[1] + "', '" + dataID116[2] + "',  '" + dataID116[3] + "',  '" + dataID116[4] + "',  '" + dataID116[5] + "',  '" + dataID116[6] + "',  '" + dataID116[7] + "',  '" + dataID116[8] + "', '" + dataID116[9] + "', '" + dataID116[10] + "', '" + dataID116[11] + "', '" + dataID116[12] + "', '" + dataID116[13] + "', '" + dataID116[14] + "','" + dataID116[15] + "', '" + dataID116[16] + "',  '" + dataID116[17] + "',  CONVERT(DATETIME, '" + dataID116[18] + "', 102), '" + dataID116[19] + "', '" + dataID116[20] + "', '" + dataID116[21] + "', '" + dataID116[22] + "', '" + dataID116[23] + "', '" + dataID116[24] + "', '" + dataID116[25] + "', '" + dataID116[26] + "', '" + dataID116[27] + "', '" + dataID116[28] + "', '" + dataID116[29] + "', '" + dataID116[30] + "', '" + dataID116[31] + "', '" + dataID116[32] + "', '" + dataID116[33] + "', '" + dataID116[34] + "', CONVERT(DATETIME,'" + dataID116[35] + "',103),CONVERT(DATETIME,'" + dataID116[36] + "',103), '" + dataID116[37] + "'); select SCOPE_IDENTITY()");

                            string login = "00000000000" + dataID116[1];
                            string loginSubString = login.Substring(login.Length - 5);
                            loginSubString = "FRDP-EMP-" + loginSubString;
                            Fn.Exec(@"exec sp_createLoginAllowOneLocation '" + loginSubString + @"','" + Encryptor.Encrypt(loginSubString) + @"' , '" + dataID116[6] + @"','" + id116 + @"','" + dataID116[5] + @"' ");
                            context.Response.Write(id116);
                            break;

                        case 117:
                            string[] dataID117 = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form["vls"])).Split('ǁ');

                            Fn.Exec("UPDATE LOGIN SET User_Group_Id='" + dataID117[6] + "' where TableName='tblEmployee' and Emp_Id=" + dataID117[37]);
                            context.Response.Write(Fn.Exec("UPDATE tblEmployee SET EmpNo = '" + dataID117[1] + "', PostTyp = '" + dataID117[2] + "', OfficeType = '" + dataID117[3] + "', DSUtblCompanyID = '" + dataID117[4] + "', tblCompanyID = '" + dataID117[5] + "', User_Group_Id = '" + dataID117[6] + "', tblDept = '" + dataID117[7] + "', tblDesigID = '" + dataID117[8] + "', BPS = '" + dataID117[9] + "', tblEmpShiftID = '" + dataID117[10] + "', BPay = '" + dataID117[11] + "', FName = '" + dataID117[12] + "', LName = '" + dataID117[13] + "', Father = '" + dataID117[14] + "', CNIC = '" + dataID117[15] + "', Marital = '" + dataID117[16] + "', Gender = '" + dataID117[17] + "', DoB = CONVERT(DATETIME, '" + dataID117[18] + "', 102), Religion = '" + dataID117[19] + "', Nationality = '" + dataID117[20] + "', Domicile = '" + dataID117[21] + "', Mobile = '" + dataID117[22] + "', RPh = '" + dataID117[23] + "', OPh = '" + dataID117[24] + "', email = '" + dataID117[25] + "', Area = '" + dataID117[26] + "', City = '" + dataID117[27] + "', Addrss = '" + dataID117[28] + "', Spouse = '" + dataID117[29] + "', SpOccu = '" + dataID117[30] + "', SoCNIC = '" + dataID117[31] + "', SpPh = '" + dataID117[32] + "', Dependent = '" + dataID117[33] + "', SpEmail = '" + dataID117[34] + "', Apoint = CONVERT(DATETIME, '" + dataID117[35] + "', 103), Joind = CONVERT(DATETIME, '" + dataID117[36] + "', 103) where (EmpID = '" + dataID117[37] + "')"));
                            break;



                        case 118:
                            context.Response.Write(Fn.Data2Json(@"SELECT        COUNT(ISNULL(VoucherID, 0)) + 1 AS VNo
FROM            TblVoucherHDR
WHERE        (CompanyID = '" + dataID[1] + @"') AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '" + Convert.ToDateTime(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["ActMth"]).Value))).ToString("MMMM yyyy") + @"') AND (VoucherNo LIKE N'JV%')"));
                            break;

                        case 119:
                            context.Response.Write(Fn.Data2Json(@"
SELECT        MIN(vwVoucherHDR.EntryDate) AS ed, '- ' AS vr, 'Opening Balance' AS ddc, MAX(0) AS dr, MAX(0) AS cr, SUM(vwVoucherDTL.AmountDeb - vwVoucherDTL.AmountCre) AS bf, MAX('0') AS vi
FROM            vwVoucherHDR INNER JOIN
                         vwVoucherDTL ON vwVoucherHDR.VoucherID = vwVoucherDTL.VoucherID INNER JOIN
                         tblChartAc ON vwVoucherDTL.AccEntryID = tblChartAc.AcID
WHERE        (vwVoucherDTL.AccEntryID = '"+dataID[1]+@"') AND (vwVoucherHDR.EntryDate < CONVERT(DATETIME, '"+dataID[2]+@"', 102)) AND (vwVoucherHDR.Posted = 1) AND (tblChartAc.AcType <> N'Revenue') AND 
                         (tblChartAc.AcType <> N'Expenses')
HAVING        (SUM(vwVoucherDTL.AmountDeb - vwVoucherDTL.AmountCre) <> 0)
"));
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

        private void markSundays(int year, int month)
        {
            MyClass Fn = new MyClass();
            DayOfWeek day = DayOfWeek.Sunday;
            System.Globalization.CultureInfo currentCulture = Thread.CurrentThread.CurrentCulture;
            for (int i = 1; i <= currentCulture.Calendar.GetDaysInMonth(year, month); i++)
            {
                DateTime d = new DateTime(year, month, i);
                if (d.DayOfWeek == day)
                {
                    Fn.Exec("UPDATE tblMWPlan_DTL SET  d" + d.Day.ToString() + " = 5 FROM tblMWPlan_DTL INNER JOIN tblMWPlan_HDR ON tblMWPlan_DTL.MWP_ID = tblMWPlan_HDR.MWP_ID WHERE (tblMWPlan_HDR.MWP_Month = CONVERT(DATETIME, '" + month.ToString() + "-1-" + year.ToString() + "', 102))");
                }
            }
        }
    }
}