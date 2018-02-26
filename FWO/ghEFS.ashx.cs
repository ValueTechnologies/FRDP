using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace FRDP
{
    /// <summary>
    /// Summary description for ghEFS
    /// </summary>
    public class ghEFS : IHttpHandler, IRequiresSessionState
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
                            if (dataID[1].Split('½')[7] == "0")
                            {


                                context.Response.Write(Fn.Exec(@"INSERT INTO tblPO
                         (dtSurveyDate,TblUnionConcilID, tblSlumID, strName, strContact,strAddress, strDetailes, EmpID, dtEntryDate)
VALUES        ( CONVERT(DATETIME,'" + dataID[1].Split('½')[0] + "',103),'" + dataID[1].Split('½')[1] + "','" + dataID[1].Split('½')[2] + "','" + dataID[1].Split('½')[3] + "','" + dataID[1].Split('½')[4] + "','" + dataID[1].Split('½')[5] + "','" + dataID[1].Split('½')[6] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "',GETDATE())"));


                            }
                            else
                            {
                                context.Response.Write(Fn.Exec(@"UPDATE       tblPO
SET                tblUCID ='" + dataID[1].Split('½')[0] + "', tblSlumID ='" + dataID[1].Split('½')[1] + "', strName ='" + dataID[1].Split('½')[2] + "', strContact ='" + dataID[1].Split('½')[3] + "', strAddress ='" + dataID[1].Split('½')[4] + "', strDetailes ='" + dataID[1].Split('½')[5] + "', EmpID ='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', dtEntryDate = GETDATE() WHERE (tblPOID = '" + dataID[1].Split('½')[5] + "')"));
                            }
                            break;

                        case 1:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOID, tblUCID, tblSlumID, strName, strContact, strAddress, strDetailes
FROM            tblPO where tblUCID='" + dataID[1] + "'"));
                            break;

                        case 2:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSlumID, CONVERT(VARCHAR(50), dtSlumSurveyDate, 103) AS dtSlumSurveyDate, TblUnionConcilID, strSlumName,'' gps, '' AS pic, '' AS kmz
FROM            tblSlum
WHERE        (TblUnionConcilID = " + dataID[1] + @")
ORDER BY strSlumName"));
                            break;

                        case 3:
                            if (dataID[1].Split('½')[3] == "0")
                            {
                                context.Response.Write(Fn.Exec(@"INSERT INTO tblSlum
                         (dtSlumSurveyDate, TblUnionConcilID, strSlumName, dtEntryDate, EmpID)
VALUES        (CONVERT(DATETIME,'" + dataID[1].Split('½')[0] + "',103),'" + dataID[1].Split('½')[1] + "','" + dataID[1].Split('½')[2] + "',GETDATE(),'" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "')"));
                            }
                            else
                            {
                                context.Response.Write(Fn.Exec(@"UPDATE       tblSlum
SET                dtSlumSurveyDate = CONVERT(DATETIME,'" + dataID[1].Split('½')[0] + "',103), TblUnionConcilID ='" + dataID[1].Split('½')[1] + "', strSlumName ='" + dataID[1].Split('½')[2] + "', dtEntryDate =GETDATE(), EmpID ='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"'
WHERE        (tblSlumID = " + dataID[1].Split('½')[3] + ")"));
                            }
                            break;

                        case 4:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSlumID, strSlumName
FROM            tblSlum
WHERE TblUnionConcilID=" + dataID[1] + @"
ORDER BY strSlumName"));
                            break;

                        case 5:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPO.tblPOID, CONVERT(VARCHAR(50), tblPO.dtSurveyDate, 103) AS dtSurveyDate, tblPO.strName, tblPO.strContact, tblPO.strAddress, tblPO.strDetailes, tblPO.EmpID, tblPO.dtEntryDate, 
                         TblUnionConcil.LocName, ISNULL(tblSlum.strSlumName,'') strSlumName
FROM            tblPO INNER JOIN
                         TblUnionConcil ON tblPO.TblUnionConcilID = TblUnionConcil.UnionConcilID LEFT OUTER JOIN
                         tblSlum ON tblPO.tblSlumID = tblSlum.tblSlumID
WHERE        (tblPO.TblUnionConcilID = '" + dataID[1] + @"')
ORDER BY tblPO.strName, dtSurveyDate"));
                            break;

                        case 6:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSlumID, CONVERT(VARCHAR(50), dtSlumSurveyDate, 103) AS dtSlumSurveyDate, TblUnionConcilID, strSlumName, '' AS gps, '' AS pic, '' AS kmz, ISNULL(photoA, '0') AS photoA, ISNULL(photoB, '0') AS photoB, 
                         ISNULL(photoC, '0') AS photoC, ISNULL(photoD, '0') AS photoD, ISNULL(photoE, '0') AS photoE, ISNULL(Caption1, '') AS Caption1, ISNULL(Caption2, '') AS Caption2, ISNULL(Caption3, '') AS Caption3, 
                         ISNULL(Caption4, '') AS Caption4, ISNULL(Caption5, '') AS Caption5, ISNULL(SlumBoundary, '0') AS SlumBoundary, ISNULL(KMZFileExtention,'0') KMZFileExtention
FROM            tblSlum
WHERE        (TblUnionConcilID = " + dataID[1] + @")
ORDER BY strSlumName"));
                            break;

                        case 7:
                            if (dataID[1].Split('½')[7] == "0")
                            {


                                context.Response.Write(Fn.Exec(@"INSERT INTO tblPO
                         (dtSurveyDate,TblUnionConcilID, tblSlumID, strName, strContact,strAddress, strDetailes, EmpID, dtEntryDate)
VALUES        ( CONVERT(DATETIME,'" + dataID[1].Split('½')[0] + "',103),'" + dataID[1].Split('½')[1] + "','" + dataID[1].Split('½')[2] + "','" + dataID[1].Split('½')[3] + "','" + dataID[1].Split('½')[4] + "','" + dataID[1].Split('½')[5] + "','" + dataID[1].Split('½')[6] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "',GETDATE())"));


                            }
                            else
                            {
                                context.Response.Write(Fn.Exec(@"UPDATE       tblPO
SET                tblUCID ='" + dataID[1].Split('½')[0] + "', tblSlumID ='" + dataID[1].Split('½')[1] + "', strName ='" + dataID[1].Split('½')[2] + "', strContact ='" + dataID[1].Split('½')[3] + "', strAddress ='" + dataID[1].Split('½')[4] + "', strDetailes ='" + dataID[1].Split('½')[5] + "', EmpID ='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', dtEntryDate = GETDATE() WHERE (tblPOID = '" + dataID[1].Split('½')[5] + "')"));
                            }
                            break;

                        case 8:
                            context.Response.Write(Fn.Data2Json(@"SELECT tblAssesmentRapidID, strSchoolName, 

ISNULL(strContactNoSchool,'')+' / ' + ISNULL(strOwnerContactNumber,'') +' / '+ ISNULL(strPrincipalContactNumber,'') AS Contact
,

ISNULL(strSchoolEmail,'') +' / ' +  ISNULL(strOwnerEmail,'') +' / ' +  ISNULL(strPrincipalEmail,'') AS email,	

CONVERT(VARCHAR(50),dtSurveyDate,103) AS dtSurveyDate

 FROM dbo.tblAssesmentRapid
 WHERE (TblUnionConcilID = " + dataID[1] + @") AND (tblSlumID=" + dataID[2] + @" OR tblSlumID=0)
 ORDER BY dtSurveyDate"));
                            break;
                        case 9:
                            context.Response.Write(Fn.Data2Json(@"SELECT strFormNo, CONVERT(VARCHAR(50),dtSurveyDate,103) AS dtSurveyDate, strSchoolName, strContactNoSchool, strSchoolEmail, strOwnerName, strOwnerContactNumber, strOwnerEmail, strPrincipalName, strPrincipalContactNumber, strPrincipalEmail,
                         strAddress1, strAddress2, strNearestLandMark, TblUnionConcilID, tblSlumID, strSchoolLatLang, strSurveyorName1, strSurveyorName2, CONVERT(char(5), dtStartDateTime, 108) AS dtStartDateTime, CONVERT(char(5), dtEndDateTime, 108) AS dtEndDateTime, Q1, Q2, Q3, Q4, Q5, Q6,
                         bisPictureAllowed, tblAssesmentRapidID
						 FROM            tblAssesmentRapid WHERE tblAssesmentRapidID=" + dataID[1]));
                            break;

                        case 10:
                            context.Response.Write(Fn.Data2Json(@"SELECT tblAssesmentRapidID, strSchoolName
 FROM dbo.tblAssesmentRapid
 WHERE (TblUnionConcilID = " + dataID[1] + @") AND (tblSlumID=" + dataID[2] + @" OR tblSlumID=0)
 ORDER BY dtSurveyDate"));
                            break;


                        case 11:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblStudentClass.tblStudentClassID, tblStudentClass.strClass, ISNULL(derivedtbl_1.tblAssesmentRapidBID,0) AS tblAssesmentRapidBID, ISNULL(derivedtbl_1.tblAssesmentRapid,0) AS tblAssesmentRapid, ISNULL(derivedtbl_1.nboysMorning,0) AS nboysMorning, ISNULL(derivedtbl_1.ngirlsMorning,0) AS ngirlsMorning, 
                         ISNULL(derivedtbl_1.nboysAfternoon,0) AS nboysAfternoon, ISNULL(derivedtbl_1.ngirlsAfternoon,0) AS ngirlsAfternoon
FROM            tblStudentClass LEFT OUTER JOIN
                             (SELECT        tblAssesmentRapidBID, tblAssesmentRapid, tblStudentClassID, nboysMorning, ngirlsMorning, nboysAfternoon, ngirlsAfternoon
                               FROM            tblAssesmentRapidB
                               WHERE        (tblAssesmentRapid = " + dataID[1] + @")) AS derivedtbl_1 ON tblStudentClass.tblStudentClassID = derivedtbl_1.tblStudentClassID
ORDER BY tblStudentClass.nOrder"));
                            break;
                        case 12:
                            if (dataID[1].Split('¼')[0] == "0")
                            {
                                context.Response.Write(Fn.ExenID(@"INSERT INTO tblAssesmentRapidB
                         (tblAssesmentRapid, tblStudentClassID, " + dataID[1].Split('¼')[2] + @")
VALUES        (" + dataID[1].Split('¼')[3] + "," + dataID[1].Split('¼')[1] + "," + dataID[1].Split('¼')[4] + "); SELECT @@IDENTITY"));
                            }
                            else
                            {
                                context.Response.Write(Fn.Exec(@"UPDATE       tblAssesmentRapidB
SET                " + dataID[1].Split('¼')[2] + @" =  " + dataID[1].Split('¼')[4] + @"
WHERE        (tblAssesmentRapidBID = " + dataID[1].Split('¼')[0] + ")"));
                            }

                            break;
                        case 13:
                            context.Response.Write(Fn.Exec(@"UPDATE       TblUnionConcil
SET                UCBoundary ='" + dataID[1] + @"'
WHERE        (UnionConcilID = " + dataID[2] + ")"));
                            break;

                        case 14:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblSlum
SET                SlumBoundary ='" + dataID[1] + @"'
WHERE        (tblSlumID = " + dataID[2] + ")"));
                            break;

                        case 15:
                            context.Response.Write(Fn.Data2Json(@"Select ISNULL(UCBoundary,'-1') AS b from TblUnionConcil where UnionConcilID= " + dataID[1]));
                            break;

                        case 16:
                            context.Response.Write(Fn.Data2Json(@"SELECT        ISNULL(tblSlum.SlumBoundary, '-1') AS s, ISNULL(TblUnionConcil.UCBoundary,'-1') AS b
FROM            tblSlum INNER JOIN
                         TblUnionConcil ON tblSlum.TblUnionConcilID = TblUnionConcil.UnionConcilID
WHERE        tblSlum.tblSlumID = " + dataID[1]));
                            break;
                        case 17:
                            context.Response.ContentType = "APPLICATION/OCTET-STREAM";
                            String Header17 = "Attachment; Filename=" + dataID[1];
                            context.Response.AppendHeader("Content-Disposition", Header17);
                            System.IO.FileInfo kmzfile = new System.IO.FileInfo(context.Server.MapPath("Uploads/KMZ/" + dataID[1]));
                            context.Response.WriteFile(kmzfile.FullName);
                            //Don't forget to add the following line
                            context.Response.End();

                            break;
                        case 18:
                            context.Response.ContentType = "APPLICATION/OCTET-STREAM";
                            String Header18 = "Attachment; Filename=" + dataID[1];
                            context.Response.AppendHeader("Content-Disposition", Header18);
                            System.IO.FileInfo SlumPhoto = new System.IO.FileInfo(context.Server.MapPath("Uploads/SlumPhotos/" + dataID[1]));
                            context.Response.WriteFile(SlumPhoto.FullName);
                            //Don't forget to add the following line
                            context.Response.End();

                            break;

                        case 19:
                            context.Response.Write(Fn.Data2Json(@"SELECT  DISTINCT      TblUnionConcil.UnionConcilID, TblUnionConcil.LocName AS UC, CASE WHEN TblUnionConcil.Code IS NULL THEN '' ELSE 'UC-' + RIGHT('0' + TblUnionConcil.Code, 2) END AS UCCode, 
                         TblFeildUnit.LocName AS Town,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            tblSlum
                               WHERE        (TblUnionConcilID = TblUnionConcil.UnionConcilID)) AS TSlum,  DBO.fn_slums(TblUnionConcil.UnionConcilID) AS xxx
FROM            TblUnionConcil INNER JOIN
                         TblFeildUnit ON TblUnionConcil.FeildUnitID = TblFeildUnit.FeildUnitID INNER JOIN
                         tblSlum AS tblSlum_1 ON TblUnionConcil.UnionConcilID = tblSlum_1.TblUnionConcilID
ORDER BY UC"));
                            break;

                        case 20:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblAssesmentRapid.tblAssesmentRapidID, TblDistrict.LocName AS District, TblTehsil.LocName AS Town, TblUnionConcil.LocName AS UC, tblAssesmentRapid.strSchoolName, tblAssesmentRapid.strAddress1, 
                         tblAssesmentRapid.strAddress2, tblAssesmentRapid.strNearestLandMark, ISNULL(tblAssesmentRapid.strContactNoSchool, '') AS strContactNoSchool, tblAssesmentRapid.strSchoolLatLang, ISNULL
                             ((SELECT        SUM(ISNULL(nboysMorning, 0) + ISNULL(ngirlsMorning, 0) + ISNULL(nboysAfternoon, 0) + ISNULL(ngirlsAfternoon, 0)) AS S
                                 FROM            (SELECT        tblAssesmentRapidBID, tblAssesmentRapid, tblStudentClassID, nboysMorning, ngirlsMorning, nboysAfternoon, ngirlsAfternoon
                                                           FROM            tblAssesmentRapidB
                                                           WHERE        (tblAssesmentRapid = tblAssesmentRapid.tblAssesmentRapidID)) AS X), 0) AS nStudents, ISNULL(tblAssesmentRapid.Q4,0) AS Fee, tblAssesmentRapid.Q5 AS Funded, 
                         ISNULL(tblAssesmentRapid.Q6,'') AS yearEstablished,  ISNULL(tblAssesmentRapid.RejectionReason,'') AS RejectionReason,


Rejected = CASE WHEN ISNULL( ISNULL(tblAssesmentRapid.Q6,DATEPART(yyyy, GETDATE()) ) - DATEPART(yyyy, CONVERT(DATETIME,tblAssesmentRapid.dtSurveyDate,103)),0)  <1
 OR ISNULL(tblAssesmentRapid.Q4,0) >700 or
    LEN(ISNULL(RejectionReason,'')) >5 OR 
                             ISNULL((SELECT        SUM(ISNULL(nboysMorning, 0) + ISNULL(ngirlsMorning, 0) + ISNULL(nboysAfternoon, 0) + ISNULL(ngirlsAfternoon, 0)) AS S
                                 FROM            (SELECT        tblAssesmentRapidBID, tblAssesmentRapid, tblStudentClassID, nboysMorning, ngirlsMorning, nboysAfternoon, ngirlsAfternoon
                                                           FROM            tblAssesmentRapidB
                                                           WHERE        (tblAssesmentRapid = tblAssesmentRapid.tblAssesmentRapidID)) AS X), 0) <60 THEN 1 ELSE 0 end
FROM            tblAssesmentRapid INNER JOIN
                         TblUnionConcil ON tblAssesmentRapid.TblUnionConcilID = TblUnionConcil.UnionConcilID INNER JOIN
                         TblFeildUnit ON TblUnionConcil.FeildUnitID = TblFeildUnit.FeildUnitID INNER JOIN
                         TblTehsil ON TblFeildUnit.TehsilID = TblTehsil.TehsilID INNER JOIN
                         TblDistrict ON TblTehsil.DistrictID = TblDistrict.DistrictID 
WHERE        (tblAssesmentRapid.TblUnionConcilID = '" + dataID[1]+@"') ORDER BY strSchoolName "));





                            break;


                        case 21:
                            string[] str21 = HttpUtility.UrlDecode(dataID[1]).Split('½');
                            string str21a = "";
                            foreach (string str in str21)
                            {
                                str21a += "'" + str + "',";
                            }
                            str21a += "GETDATE() ,";
                            str21a += "'" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "'";
                            context.Response.Write(Fn.Exec("INSERT INTO [dbo].[tblAssesmentDetailed] VALUES (" + str21a + ")"));
                            break;
                        case 22:
                            string[] arr1 = new string[] {

"dtDate"
,"dtStartTime"
,"dtEndTime"
,"Surveyor1"
,"Surveyor2"
,"Surveyor1Contact"
,"Surveyor2Contact"
,"TblUnionConcilID"
,"tblSlumID"
,"tblAssesmentRapidID"
,"NearestLandMark"
,"SchoolAddressLine1"
,"SchoolAddressLine2"
,"PtclNumber"
,"NameOfContact"
,"CellPhone"
,"email"
,"GPS"
,"SchoolOwnedBy"
,"OwnersName"
,"OwnersContactNo"
,"OwnersEmail"
,"PrincipalName"
,"PrincipalBackground"
,"RespondentsName"
,"PositionRespondent"
,"LowestClass"
,"HighestClass"
,"SchoolYearlyMonth"
,"SchoolYealyEnd"
,"ShiftOffered"
,"dtStartTimeMorning"
,"dtEndTimeMorning"
,"dtStartTimeAfternoon"
,"dtEndTimeAfternoon"
,"QA10"
,"QA11"
,"IsTheSchoolRegistered"
,"Sections"
,"TypeOfSchool"
,"QA15"
,"LanguageCode"
,"YearSchoolEstablished"
,"YearSchoolRegistered"
,"StudentArea1"
,"StudentArea2"
,"StudentArea3"
,"UrduSpeeking"
,"Afghani"
,"PunjabiSiraiki"
,"Bengali"
,"Pathan"
,"Burmi"
,"Baluchi"
,"Other"
,"OtherTxt"
,"Other1"
,"Other1Txt"
,"Govt"
,"PRIVATE"
,"Slum1Near"
,"Slum2Near"
,"Slum3Near"
,"EthnicUrdu"
,"EthnicAfghani"
,"EthnicPunjabi"
,"EthnicBengali"
,"EthnicPathan"
,"EthnicBurmi"
,"EthnicBaluchi"
,"EthnicOther"
,"EthnicOtherTxt"
,"EthnicOther1"
,"EthnicOther1Txt"
,"PubOUP"
,"PubGaba"
,"PubAFAQ"
,"PubOther"
,"PubOtherTxt"
,"PubOther1"
,"PubOther1Txt"
,"PubSindh"
,"Attendance"
,"AttendanceComputerized"
,"TuitionFeeReceipt"
,"TuitionFeeReceiptComputerized"
,"TeachSalaries"
,"TeacherSalariesComputerized"
,"BankAccount"
,"AccountOnSchoolName"
,"EFSPartned"
,"ApplyRegistration"
,"SchoolBuilding"
,"SizePlot1"
,"SizePlot2"
,"Floors1"
,"Floors2"
,"TotalRooms1"
,"TotalRooms2"
,"UnUsedRooms1Morning"
,"UnUsedRooms2Morning"
,"UnUsedRooms1Afternoon"
,"UnUsedRooms2Afternoon"
,"HallAvailable"
,"HowMany"
,"HallUsedClassRoom"
,"Library"
,"bookshelf"
,"electricity"
,"electricityAvailable"
,"LoadShedding"
,"generator"
,"water"
,"WaterDrinkable"
,"Pitcher"
,"BoundaryWall"
,"ToiletsAvaiable"
,"ToiletsFucntional"
,"TeachersToilets"
,"TeachersToiletsFunctional"
,"MaleStudentToilets"
,"MaleStudentToiletsFunctional"
,"FemaleStudentToilets"
,"FemaleStudentToiletsFunctional"
,"Playground"
,"ComputerLab"
,"NuberOfComputer"
,"isBeingUsed"
,"Transportation"
,"NumberOfVans"
,"ClassroomClean"
,"CommonAreasClean"
,"EatingAreaClean"
,"CleanUniforms"
,"NailsHairCut"
,"DustbinAccessible"
,"GarbageDeposit"
,"Enroll"
,"EnrollOlder"
,"dtEnterDateTime"
,"EnterByEmpID"
};
                            string[] str22 = HttpUtility.UrlDecode(dataID[1]).Split('½');
                            int i = 0;
                            foreach (string str in str22)
                            {
                                arr1[i] += "='" + str + "',";
                                i++;
                            }
                            arr1[i + 1] += "=GETDATE(),";
                            arr1[i + 2] += "=" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value));
                            string up = string.Join(",", arr1);
                            context.Response.Write(Fn.Exec("UPDATE [dbo].[tblAssesmentDetailed] SET " + up + " where tblAssesmentDetailed=" + dataID[2]));
                            break;

                        case 23:
                            context.Response.Write(Fn.Data2Json("SELECT GETDATE()"));
                            break;

                        case 24:
                            try
                            {
                                string str24Frm = HttpUtility.UrlDecode(dataID[1]);
                                string str24sch = HttpUtility.UrlDecode(dataID[2]);
                                string str24clsfamily = HttpUtility.UrlDecode(dataID[3]);

                                string str24frmID = Fn.ExenID(@"INSERT INTO tblOOSC_Form
                         (GridCode, Date, FormNo, SurveyorName, RespondentName, FamilyHeadName, RespondentRetlation, FamilyHeadMaritalStatus, FamilyHeadMotherToung, FamilyHeadReligion, IfOtherReligion, MonthlyIncome, 
                         ResidentialStatus, TblUnionConcilID, tblSlumID, SlumDivision, HouseNo, Street, LandMark, ContactName1, ContactNumber1, ContactName2, ContactNumber2)
                         VALUES        ('" + str24Frm.Split('½')[0] + "','" + str24Frm.Split('½')[1] + "','" + str24Frm.Split('½')[2] + "','" + str24Frm.Split('½')[3] + "','" + str24Frm.Split('½')[4] + "','" + str24Frm.Split('½')[5] + "','" + str24Frm.Split('½')[6] + "','" + str24Frm.Split('½')[7] + "','" + str24Frm.Split('½')[8] + "','" + str24Frm.Split('½')[9] + "','" + str24Frm.Split('½')[10] + "','" + str24Frm.Split('½')[11] + "','" + str24Frm.Split('½')[12] + "','" + str24Frm.Split('½')[13] + "','" + str24Frm.Split('½')[14] + "','" + str24Frm.Split('½')[15] + "','" + str24Frm.Split('½')[16] + "','" + str24Frm.Split('½')[17] + "','" + str24Frm.Split('½')[18] + "','" + str24Frm.Split('½')[19] + "','" + str24Frm.Split('½')[20] + "','" + str24Frm.Split('½')[21] + "','" + str24Frm.Split('½')[22] + "') ;select SCOPE_IDENTITY() ");

                                foreach (var item in str24sch.Split('½'))
                                {
                                    Fn.Exec(@"INSERT INTO tblOOSC_Form_School (tblOOSC_FormID, tblAssesmentRapidID) VALUES (" + str24frmID + @"," + item + ")");
                                }


                                foreach (var val in str24clsfamily.Split('¼'))
                                {
                                    string[] str = val.Split('½');
                                    {
                                        Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, DOB, CNIC_BISP, AGE, Gender, ReceivedEducation, EducationInstitute, HighestClass, ReadNewsPaper, WriteName, AddSubtract, Occupation, EducationStatus, CurrentlyStudingSchoolName,
                          CurrentlyStudingChildClass, CurrentlyStudingChildSchoolingYear, CurrentlyStudingChildEmployed, CurrentlyStudingChildWork, CurrentlyStudingChildWorkHours, CurrentlyStudingChildDisability, 
                         OOSC_Disability, OOSC_BeenToSchool, OOSC_WhenLeavSchool, OOSC_WhyLeaveSchool, OOSC_SchoolName, OOSC_ClassWhenLeftSchool, OOSC_TotalSchoolingYear, OOSC_CanReadStory, 
                         OOSC_CanWriteLetter, OOSC_CanChildAddSubtract, OOSC_IsChilEmployeed, OOSC_ChildWork, OOSC_ChildWorkHours, tblOOSC_FormID)
                         VALUES        ('" + str[0] + "','" + str[1] + "','" + str[2] + "','" + str[3] + "','" + str[4] + "','" + str[5] + "','" + str[6] + "','" + str[7] + "','" + str[8] + "','" + str[9] + "','" + str[10] + "','" + str[11] + "','" + str[12] + "','" + str[13] + "','" + str[14] + "','" + str[15] + "','" + str[16] + "','" + str[17] + "','" + str[18] + "','" + str[19] + "','" + str[20] + "','" + str[21] + "','" + str[22] + "','" + str[23] + "','" + str[24] + "','" + str[25] + "','" + str[26] + "','" + str[27] + "','" + str[28] + "','" + str[29] + "','" + str[30] + "','" + str[31] + "','" + str[32] + "','" + str[33] + "','" + str24frmID + "')");
                                    }
                                }
                                context.Response.Write("1");


                            }
                            catch (Exception ex)
                            {

                                context.Response.Write(ex.Message);
                            }
                            break;
                        case 25:
                            context.Response.Write(Fn.HTMLTableWithID(@"Exec [dbo].[sp_OOSC_Report] '"+ HttpUtility.UrlDecode(dataID[1])+"', '1',1", "tblAnimals"));
                            break;

                        case 26:
                            context.Response.Write(Fn.Data2Json(@"SELECT        ISNULL(tblOOSC_Form_Family_1.Name,'') AS Name, ISNULL(tblOOSC_Form_Family_1.DOB,'') DOB, ISNULL(tblOOSC_Form_Family_1.Gender,'') Gender,
                             ISNULL((SELECT        TOP (1) Name
                               FROM            tblOOSC_Form_Family
                               WHERE        (MemberType = 'Father') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)),'') AS Father_Name,
                             (SELECT        TOP (1) CNIC_BISP
                               FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_4
                               WHERE        (MemberType = 'Father') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)) AS Father_CNIC,
                             (SELECT        TOP (1) Occupation
                               FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_5
                               WHERE        (MemberType = 'Father') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)) AS Father_Occupation,
                             ISNULL((SELECT        TOP (1) Name
                               FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_3
                               WHERE        (MemberType = 'Mother') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)),'') AS Mother_Name,
                             (SELECT        TOP (1) CNIC_BISP
                               FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_2
                               WHERE        (MemberType = 'Mother') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)) AS Mother_CNIC, ISNULL(tblOOSC_Form.ContactName1,'') AS Contact_Nmae_1, 
                         ISNULL(tblOOSC_Form.ContactNumber1,'') AS Contact_Number_1, ISNULL(tblOOSC_Form.ContactName2,'') AS Contact_Name_2, ISNULL(tblOOSC_Form.ContactNumber2,'') AS Contact_Number_2, 
                         tblOOSC_Form_Family_1.tblOOSC_Form_FamilyID, TblUnionConcil.UnionConcilID
FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_1 INNER JOIN
                         tblOOSC_Form ON tblOOSC_Form_Family_1.tblOOSC_FormID = tblOOSC_Form.tblOOSC_FormID INNER JOIN
                         tblSlum ON tblOOSC_Form.tblSlumID = tblSlum.tblSlumID INNER JOIN
                         TblUnionConcil ON tblSlum.TblUnionConcilID = TblUnionConcil.UnionConcilID
WHERE        (tblOOSC_Form_Family_1.EducationStatus = 'Out of School') AND (TblUnionConcil.UnionConcilID = '" + dataID[1] + "')"));
                            break;
                            case 27:
                            context.Response.Write(Fn.Data2Json(@"exec sp_SchoolInfo " + dataID[1]));
                            break;

                            case 28:
                            context.Response.Write(Fn.Data2Json(@"exec sp_tblAssesmentRapid_MapForDB "));
                            break;

                            case 29:
                            context.Response.Write(Fn.Data2Json(@"exec sp_oosc_DisplayByID "+dataID[1]));
                            break;

                        case 30:
                            context.Response.Write(Fn.Data2Json(@"SELECT        CAST(tblOOSC_Form_Family_1.tblOOSC_Form_FamilyID AS VARCHAR(50)) AS ChildID, CASE WHEN ISNULL(tblOOSC_Form_Family_1.fileExtention, '') 
                         = '' THEN 'Uploads/EmployeePhoto/0.png' ELSE 'Uploads/OOSC_Photos/B' + CAST(tblOOSC_Form_Family_1.tblOOSC_Form_FamilyID AS VARCHAR(50)) + tblOOSC_Form_Family_1.fileExtention END AS Photo, 
                         ISNULL(tblOOSC_Form_Family_1.Name, '') AS Name, ISNULL(tblOOSC_Form_Family_1.Gender, '') AS Gender, ISNULL(tblOOSC_Form_Family_1.DOB, '') AS DOB, ISNULL(tblOOSC_Form.Date, '') AS SurveyDate, 
                         DATEDIFF(yyyy, CONVERT(DATETIME, ISNULL(tblOOSC_Form_Family_1.DOB, ''), 103), CONVERT(DATETIME, ISNULL(tblOOSC_Form.Date, ''), 103)) AS AgeAtSuervey, ISNULL
                             ((SELECT        TOP (1) Name
                                 FROM            tblOOSC_Form_Family
                                 WHERE        (MemberType = 'Father') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)), '') AS FatherName, ISNULL
                             ((SELECT        TOP (1) CNIC_BISP
                                 FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_4
                                 WHERE        (MemberType = 'Father') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)), '') AS FatherCNIC, ISNULL
                             ((SELECT        TOP (1) Name
                                 FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_3
                                 WHERE        (MemberType = 'Mother') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)), '') AS MotherName, ISNULL
                             ((SELECT        TOP (1) CNIC_BISP
                                 FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_2
                                 WHERE        (MemberType = 'Mother') AND (tblOOSC_FormID = tblOOSC_Form_Family_1.tblOOSC_FormID)), '') AS MotherCNIC, ISNULL(tblOOSC_Form.ContactName1, '') AS ContactName1, 
                         ISNULL(tblOOSC_Form.ContactNumber1, '') AS ContactNo1, ISNULL(tblOOSC_Form.ContactName2, '') AS ContactName2, ISNULL(tblOOSC_Form.ContactNumber2, '') AS ContactNo2, 
                         ISNULL(tblOOSC_Form.HouseNo, '') + ' ' + ISNULL(tblOOSC_Form.Street, '') AS Addresss, TblUnionConcil.LocName AS UCName, TblUnionConcil.Code AS UCCode, TblTehsil.LocName AS TownName, 
                         TblTehsil.Code AS TownCode, TblDistrict.LocName AS DistrictName, TblDistrict.Code AS DistrictCode
FROM            tblOOSC_Form_Family AS tblOOSC_Form_Family_1 INNER JOIN
                         tblOOSC_Form ON tblOOSC_Form_Family_1.tblOOSC_FormID = tblOOSC_Form.tblOOSC_FormID INNER JOIN
                         TblUnionConcil ON tblOOSC_Form.TblUnionConcilID = TblUnionConcil.UnionConcilID INNER JOIN
                         TblFeildUnit ON TblUnionConcil.FeildUnitID = TblFeildUnit.FeildUnitID INNER JOIN
                         TblTehsil ON TblFeildUnit.TehsilID = TblTehsil.TehsilID INNER JOIN
                         TblDistrict ON TblTehsil.DistrictID = TblDistrict.DistrictID
WHERE        (tblOOSC_Form_Family_1.EducationStatus = 'Out of School') AND (tblOOSC_Form_Family_1.tblOOSC_Form_FamilyID = '"+dataID[1]+"')"));
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