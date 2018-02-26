using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.SessionState;


namespace FRDP
{
    /// <summary>
    /// Summary description for RecruitmentGH
    /// </summary>
    public class RecruitmentGH : IHttpHandler, IRequiresSessionState
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
                            var x0 = context.Request.Form["frmData"];
                            var Id01 = HttpUtility.UrlDecode(Convert.ToString(x0));
                            if (Id01.Split('ǁ')[12]=="0")
                            {
                                context.Response.Write(Fn.ExenID(@"INSERT INTO tblJobRequirement
                         (Post, GradeBPS, PostJobStatus, DutyStation, TotalPositions, Gender, MinAge, MaxAge, Purpose, QualificationRequired, ExperienceRequired, JobDuties, dtDateTime, EnterByEmpID, Status)
VALUES        ('" + Id01.Split('ǁ')[0] + @"','" + Id01.Split('ǁ')[1] + @"','" + Id01.Split('ǁ')[2] + @"','" + Id01.Split('ǁ')[3] + @"','" + Id01.Split('ǁ')[4] + @"','" + Id01.Split('ǁ')[5] + @"','" + Id01.Split('ǁ')[6] + @"','" + Id01.Split('ǁ')[7] + @"','" + WebUtility.HtmlEncode(Id01.Split('ǁ')[8]) + @"','" + WebUtility.HtmlEncode(Id01.Split('ǁ')[9]) + @"','" + WebUtility.HtmlEncode(Id01.Split('ǁ')[10]) + @"','" + WebUtility.HtmlEncode(Id01.Split('ǁ')[11]) + @"',GETDATE(),'" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"','Sent'); select SCOPE_IDENTITY()"));  
                            }
                            else
                            {
                                context.Response.Write(Fn.ExenID(@"UPDATE       tblJobRequirement
SET                Post ='" + Id01.Split('ǁ')[0] + @"', GradeBPS ='" + Id01.Split('ǁ')[1] + @"', PostJobStatus ='" + Id01.Split('ǁ')[2] + @"', DutyStation ='" + Id01.Split('ǁ')[3] + @"', TotalPositions ='" + Id01.Split('ǁ')[4] + @"', Gender ='" + Id01.Split('ǁ')[5] + @"', MinAge ='" + Id01.Split('ǁ')[6] + @"', MaxAge ='" + Id01.Split('ǁ')[7] + @"', Purpose ='" + WebUtility.HtmlEncode(Id01.Split('ǁ')[8]) + @"', QualificationRequired ='" + WebUtility.HtmlEncode(Id01.Split('ǁ')[9]) + @"', ExperienceRequired ='" + WebUtility.HtmlEncode(Id01.Split('ǁ')[10]) + @"', JobDuties ='" + WebUtility.HtmlEncode(Id01.Split('ǁ')[11]) + @"', Status ='Sent' ,Remarks =''
WHERE        (tblJobRequirementID = '" + Id01.Split('ǁ')[12] + @"'); select SCOPE_IDENTITY()"));  
                            }
                            
                            break;


                        case 1:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        tblJobRequirementID, Post, PostJobStatus [Post JobS tatus], DutyStation [Duty Station], TotalPositions [Total Positions], Gender, MinAge [Min Age], MaxAge [Max Age], 
                         Status, Remarks
FROM            tblJobRequirement
order by dtDateTime", "tblReq"));
                            break;
                        case 2:
                            context.Response.Write(Fn.Data2Json(@"SELECT Post, GradeBPS, PostJobStatus, DutyStation, TotalPositions, Gender, MinAge, MaxAge, Purpose, QualificationRequired, ExperienceRequired, JobDuties, tblJobRequirementID FROM tblJobRequirement WHERE tblJobRequirementID="+dataID[1]));
                                break;


                        case 3:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        tblJobRequirementID, Post, GradeBPS [Grade/BPS], PostJobStatus [Post JobS tatus], DutyStation [Duty Station], TotalPositions [Total Positions], Gender, MinAge [Min Age], MaxAge [Max Age], 
                         Status
FROM            tblJobRequirement
 where status = 'Sent'
 order by dtDateTime", "tblReq"));
                            break;

                        case 4:
                            var x4 = context.Request.Form["frmData"];
                            var Id41 = HttpUtility.UrlDecode(Convert.ToString(x4));
                            if (Id41.Split('ǁ')[12] == "0")
                            {
                                context.Response.Write(Fn.ExenID(@"INSERT INTO tblJobRequirement
                         (Post, GradeBPS, PostJobStatus, DutyStation, TotalPositions, Gender, MinAge, MaxAge, Purpose, QualificationRequired, ExperienceRequired, JobDuties, dtDateTime, EnterByEmpID, Status)
VALUES        ('" + Id41.Split('ǁ')[0] + @"','" + Id41.Split('ǁ')[1] + @"','" + Id41.Split('ǁ')[2] + @"','" + Id41.Split('ǁ')[3] + @"','" + Id41.Split('ǁ')[4] + @"','" + Id41.Split('ǁ')[5] + @"','" + Id41.Split('ǁ')[6] + @"','" + Id41.Split('ǁ')[7] + @"','" + WebUtility.HtmlEncode(Id41.Split('ǁ')[8]) + @"','" + WebUtility.HtmlEncode(Id41.Split('ǁ')[9]) + @"','" + WebUtility.HtmlEncode(Id41.Split('ǁ')[10]) + @"','" + WebUtility.HtmlEncode(Id41.Split('ǁ')[11]) + @"',GETDATE(),'" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"','Sent'); select SCOPE_IDENTITY()"));
                            }
                            else
                            {
                                context.Response.Write(Fn.ExenID(@"UPDATE       tblJobRequirement
SET                Post ='" + Id41.Split('ǁ')[0] + @"', GradeBPS ='" + Id41.Split('ǁ')[1] + @"', PostJobStatus ='" + Id41.Split('ǁ')[2] + @"', DutyStation ='" + Id41.Split('ǁ')[3] + @"', TotalPositions ='" + Id41.Split('ǁ')[4] + @"', Gender ='" + Id41.Split('ǁ')[5] + @"', MinAge ='" + Id41.Split('ǁ')[6] + @"', MaxAge ='" + Id41.Split('ǁ')[7] + @"', Purpose ='" + WebUtility.HtmlEncode(Id41.Split('ǁ')[8]) + @"', QualificationRequired ='" + WebUtility.HtmlEncode(Id41.Split('ǁ')[9]) + @"', ExperienceRequired ='" + WebUtility.HtmlEncode(Id41.Split('ǁ')[10]) + @"', JobDuties ='" + WebUtility.HtmlEncode(Id41.Split('ǁ')[11]) + @"'
,  Remarks ='" + WebUtility.HtmlEncode(Id41.Split('ǁ')[14]) + @"' ,  LastDateToApply=CONVERT(DATETIME,'" + WebUtility.HtmlEncode(Id41.Split('ǁ')[15]) + @"',103),  Status='" + WebUtility.HtmlEncode(Id41.Split('ǁ')[16]) + @"'
WHERE        (tblJobRequirementID = '" + Id41.Split('ǁ')[12] + @"'); select SCOPE_IDENTITY()"));
                            }

                            break;
                        case 5:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"Select tblJobRequirementID,  'FRDP-B4-'+RIGHT('00000' + CAST(tblJobRequirementID AS VARCHAR(50)),5) +'/'+CAST(DATEPART(YYYY, dtDateTime) AS VARCHAR(50))+'-R' AS [Case No], Post, GradeBPS [Grade/BPS], PostJobStatus [Job Status], DutyStation [Duty Station], TotalPositions [Total Positions] , convert(varchar(50), CONVERT(DATETIME,ISNULL(LastDateToApply,'01/01/1990'),103), 106) as [Last Date] from tblJobRequirement 
where LastDateToApply > GetDATE() order by dtDateTime desc", "tblJl"));
                            break;
                        //Select tblJobRequirementID,  'PPHI-B4-'+RIGHT('00000' + CAST(tblJobRequirementID AS VARCHAR(50)),5) +'/'+CAST(DATEPART(YYYY, dtDateTime) AS VARCHAR(50))+'-R' AS [Case No] from tblJobRequirement

                        case 6:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblJobRequirementID, 'FRDP-B4-' + RIGHT('00000' + CAST(tblJobRequirementID AS VARCHAR(50)), 5) + '/' + CAST(DATEPART(YYYY, dtDateTime) AS VARCHAR(50)) + '-R' +' [ '+ Post +' ]' as Post
FROM            tblJobRequirement
ORDER BY dtDateTime DESCs"));
                            break;

                        case 7:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        tblCandidate_tblJobRequirement.tblCandidate_tblJobRequirementID, tblCandidate.Name, tblCandidate.FatherName [Father Name], Convert(varchar(50),tblCandidate.dtDOB,103) as [DOB], tblCandidate.CNIC, tblCandidate.City, tblCandidate.District, 
                         tblCandidate.Phone, tblCandidate.Mobile, CONVERT(varchar(50), tblCandidate_tblJobRequirement.dtDateTime, 103) AS [Date Applied], Case When tblCandidate_tblJobRequirement.bIsShortListed=1 Then '<button  title=''Select Candidate...'' class=''btnEdit btn btn-success'' customtooltip=''Select Candidate''>s</button>' else '<button  title=''Select Candidate...'' class=''btnEdit btn btn-info'' customtooltip=''Select Candidate''>s</button>' END as [ ]
FROM            tblCandidate_tblJobRequirement INNER JOIN
                         tblCandidate ON tblCandidate_tblJobRequirement.tblCandidateID = tblCandidate.tblCandidateID
WHERE tblCandidate_tblJobRequirement.tblJobRequirementID =" + dataID[1], "tblJl"));
                            break;

                        case 8:
                            context.Response.Write(Fn.Exec("UPDATE tblCandidate_tblJobRequirement SET bIsShortListed="+dataID[2]+" WHERE tblCandidate_tblJobRequirementID='"+dataID[1]+"'"));
                            break;


                        case 9:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        tblCandidate_tblJobRequirement.tblCandidate_tblJobRequirementID, tblCandidate.Name, tblCandidate.FatherName AS [Father Name], CONVERT(varchar(50), tblCandidate.dtDOB, 103) AS DOB, tblCandidate.CNIC, 
                         tblCandidate.City, tblCandidate.District, tblCandidate.Phone, tblCandidate.Mobile, CONVERT(varchar(50), tblCandidate_tblJobRequirement.dtDateTime, 103) AS [Date Applied], 
                         '<input class=''btnEdit Integer'' type=''text''  value='''+CAST(ISNULL(tblCandidate_tblJobRequirement.InterviewMarks,'0') AS VARCHAR(50))+'''  style=''width: 60px;''>' AS [Interview Marks]
FROM            tblCandidate_tblJobRequirement INNER JOIN
                         tblCandidate ON tblCandidate_tblJobRequirement.tblCandidateID = tblCandidate.tblCandidateID
WHERE tblCandidate_tblJobRequirement.bIsShortListed = 1 and tblCandidate_tblJobRequirement.tblJobRequirementID =" + dataID[1], "tblJl"));
                            break;

                        case 10:
                            context.Response.Write(Fn.Exec("UPDATE tblCandidate_tblJobRequirement SET InterviewMarks='" + dataID[2] + "' WHERE tblCandidate_tblJobRequirementID='" + dataID[1] + "'"));
                            break;

                        case 11:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        tblCandidate_tblJobRequirement.tblCandidate_tblJobRequirementID, tblCandidate.Name, tblCandidate.FatherName AS [Father Name], CONVERT(varchar(50), tblCandidate.dtDOB, 103) AS DOB, tblCandidate.CNIC, 
                         tblCandidate.City, tblCandidate.District, tblCandidate.Phone, tblCandidate.Mobile, CONVERT(varchar(50), tblCandidate_tblJobRequirement.dtDateTime, 103) AS [Date Applied], 
                         ISNULL(tblCandidate_tblJobRequirement.InterviewMarks,0) AS [Interview Marks]
FROM            tblCandidate_tblJobRequirement INNER JOIN
                         tblCandidate ON tblCandidate_tblJobRequirement.tblCandidateID = tblCandidate.tblCandidateID
WHERE tblCandidate_tblJobRequirement.bIsShortListed = 1 and tblCandidate_tblJobRequirement.tblJobRequirementID =" + dataID[1] + " ORDER BY ISNULL(tblCandidate_tblJobRequirement.InterviewMarks,0) ", "tblJl"));
                            break;

                        case 12:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"SELECT        Login.LoginID,'' [Sr#], Login.UserName, tblDtl.Name, tblDtl.[Emp No], tblDtl.[Service Type], tblDtl.Father, tblDtl.CNIC, tblDtl.BPS, tblDtl.Designation, User_Groups.User_Group_Name [Group Name]
FROM            Login INNER JOIN
                             (SELECT        User_ID, Full_Name AS Name, '' AS [Emp No], '' AS [Service Type], FatherName AS Father, CNIC, '' AS BPS, Designation, 'TblHResources' AS TableName
                               FROM            TblHResources
                               UNION
                               SELECT        tblEmployee.EmpID, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS Name, 'FRDP-EMP-' + RIGHT('00000' + CAST(ISNULL(tblEmployee.EmpNo, 0) AS VARCHAR(50)), 5) 
                                                        AS EMPNO, tblEmployee.PostTyp, ISNULL(tblEmployee.Father, '') AS Father, tblEmployee.CNIC, CASE WHEN tblEmployee.BPS = 0 THEN 'N/A' ELSE 'BPS' + CAST(tblEmployee.BPS AS VARCHAR(50))
                                                         END AS BPS, tblDesig.NAME AS Designation, 'tblEmployee' AS TableName
                               FROM            tbl_Company INNER JOIN
                                                        tblDept INNER JOIN
                                                        Shift INNER JOIN
                                                        tblEmployee INNER JOIN
                                                        TblDistrict ON tblEmployee.Domicile = TblDistrict.DistrictID ON Shift.Shift_ID = tblEmployee.tblEmpShiftID INNER JOIN
                                                        tblDesig ON tblEmployee.tblDesigID = tblDesig.ID ON tblDept.ID = tblEmployee.tblDept ON tbl_Company.CompanyID = tblEmployee.tblCompanyID) AS tblDtl ON Login.Emp_Id = tblDtl.User_ID AND 
                         Login.TableName = tblDtl.TableName INNER JOIN
                         User_Groups ON Login.User_Group_Id = User_Groups.User_Group_Id
order by  Login.UserName" , "tblJl"));
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