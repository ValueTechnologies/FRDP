using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class Short_ListingHR : System.Web.UI.Page
    {
        private static HRISDBClass Fn = new HRISDBClass();
        public static string UserID = string.Empty;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                UserID = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["UserID"]).Value)).ToString();
            }
            catch (Exception)
            {
                Response.Redirect("~/LogOut.aspx");
            }
        }


        [WebMethod]
        public static string FilterRecord(string Company, string JobCode, string DutyStatation, string MinExp, string CWorking, string Gender, string Name, string CNIC)
        {
            return Fn.Data2Json("Declare @name as varchar(50), @cnic as varchar(50), @totalExp as int, @CurruntlyWorking as int, @Gender as int, @companyID as int, @jobCode as varchar(50), @DutyStation as int; set @name = '" + Name + "'; set @cnic = '" + CNIC + "'; set @totalExp = '" + MinExp + "'; set @CurruntlyWorking = '" + CWorking + "'; set @Gender = '" + Gender + "'; set @companyID = '" + Company + "'; set @jobCode = '" + JobCode + "'; set @DutyStation = '" + DutyStatation + "'; if @totalExp = '0' set @totalExp = null; if @name   = ''  set @name = null; if @cnic   = ''  set @cnic = null; if @CurruntlyWorking   = '-1'  set @CurruntlyWorking = null; if @Gender   = '-1'  set @Gender = null; SELECT     row_number() over(order by CandidateID) as srno ,   CandidateID, Name, FatherName, CNIC,CVExtension, TotalExperience, JobCode, CellNo, PhoneNo, EmailAddress, Gender, CVName, DutyStationID, CompanyID, Is_Male CurruntlyWorking FROM            (SELECT DISTINCT  tbl_Candidates.CandidateID, tbl_Candidates.Name, tbl_Candidates.FatherName, tbl_Candidates.CNIC, dbo.fn_GetExperienceInYears(tbl_Candidates.CandidateID) AS TotalExperience, tbl_JobAdvertisment.JobCode, tbl_Candidates.CellNo, tbl_Candidates.PhoneNo, tbl_Candidates.EmailAddress, CASE WHEN Is_Male = 1 THEN 'Male' ELSE 'Female' END AS Gender, CONVERT(varchar(50), tbl_Candidates.CandidateID) + '' + tbl_Candidates.CVExtension AS CVName, tbl_Candidates.CVExtension, tbl_JobRequirements.DutyStationID, tbl_JobRequirements.CompanyID, tbl_EmploymentHistory.CurruntlyWorking, tbl_Candidates.Is_Male FROM            tbl_Candidates LEFT OUTER JOIN tbl_EmploymentHistory ON tbl_Candidates.CandidateID = tbl_EmploymentHistory.CandidateID LEFT OUTER JOIN tbl_JobAdvertisment ON tbl_JobAdvertisment.JobRequirementID = tbl_Candidates.RequirementID LEFT OUTER JOIN tbl_JobRequirements ON tbl_JobAdvertisment.JobRequirementID = tbl_JobRequirements.JobRequirementID where tbl_JobRequirements.ReqStatusID = 4 or tbl_JobRequirements.ReqStatusID = 6) AS MyTable WHERE        (CompanyID = @companyID) AND (JobCode = @jobCode) AND (DutyStationID = @DutyStation) AND (@totalExp is null or TotalExperience >= @totalExp) AND (@name IS NULL OR Name LIKE '%' + @name + '%') AND (@CurruntlyWorking IS NULL OR CurruntlyWorking = @CurruntlyWorking ) AND (@Gender IS NULL OR Is_Male = @Gender) AND (@cnic IS NULL OR CNIC LIKE '%' + @cnic + '%') and ( CandidateID not in (select tbl_ShortListedCandidates.CandidateID from tbl_ShortListedCandidates inner join tbl_JobAdvertisment on tbl_JobAdvertisment.JobRequirementID = tbl_ShortListedCandidates.ReqID where tbl_JobAdvertisment.JobCode =  @jobCode));");
        }

        [WebMethod]
        public static string SMEmployees(string CompanyID)
        {
            return Fn.Data2Json("SELECT User_ID, Full_Name FROM TblHResources where U_Status = 1 and CompanyID = '" + CompanyID + "' and UserGroupID = 1 order by Full_Name");
        }

        [WebMethod]
        public static string HREmp(string CompanyID)
        {
            return Fn.Data2Json("SELECT User_ID, Full_Name FROM TblHResources where U_Status = 1 and CompanyID = '" + CompanyID + "' and UserGroupID = 1002 order by Full_Name");
        }

        [WebMethod]
        public static string TLEmployees(string CompanyID)
        {
            return Fn.Data2Json("SELECT User_ID, Full_Name FROM TblHResources where U_Status = 1 and CompanyID = '" + CompanyID + "' and UserGroupID = 1003 order by Full_Name");
        }

        [WebMethod]
        public static string AllInterviewerMembersList(string jobCode)
        {
            return Fn.Data2Json("Declare @ReqID as int; SELECT @ReqID =  JobRequirementID FROM tbl_JobAdvertisment where JobCode = '"+ jobCode+"'; SELECT    row_number() over(order by User_Group_Name) as srno, TblHResources.Full_Name, User_Groups.User_Group_Name, tbl_InterviewPannel.InerviewerPannelID FROM      tbl_InterviewPannel INNER JOIN TblHResources ON TblHResources.User_ID = tbl_InterviewPannel.InterviewerID INNER JOIN User_Groups ON User_Groups.User_Group_Id = tbl_InterviewPannel.UserGroupID where tbl_InterviewPannel.ReqID = @ReqID ORDER BY User_Groups.Priority;");
        }

        [WebMethod]
        public static string DeleteInterviewer(string interviewerPannelId)
        {
            return Fn.Data2Json("Delete from tbl_InterviewPannel where InerviewerPannelID = " + interviewerPannelId);
        }



        [WebMethod]
        public static string SaveNewSrManagement(string Sr, string jobCode)
        {
            string id = Fn.ExenID("Declare @ReqID as int; SELECT @ReqID =  JobRequirementID FROM tbl_JobAdvertisment where JobCode = '" + jobCode + "'; INSERT INTO tbl_InterviewPannel (InterviewerID, UserGroupID, ReqID) VALUES ('" + Sr + "', '1',@ReqID); Select Scope_Identity();");
            int NewID = Convert.ToInt32(id);
            if (NewID > 0)
            {
                return "1";
            }
            return "0";
        }


        [WebMethod]
        public static string SaveNewHR(string HR, string jobCode)
        {
            string id = Fn.ExenID("Declare @ReqID as int; SELECT @ReqID =  JobRequirementID FROM tbl_JobAdvertisment where JobCode = '" + jobCode + "'; INSERT INTO tbl_InterviewPannel (InterviewerID, UserGroupID, ReqID) VALUES ('" + HR + "', '1002',@ReqID); Select Scope_Identity();");
            int NewID = Convert.ToInt32(id);
            if (NewID > 0)
            {
                return "1";
            }
            return "0";
        }

        [WebMethod]
        public static string SaveNewTeamLead(string TLID, string jobCode)
        {
            string id = Fn.ExenID("Declare @ReqID as int; SELECT @ReqID =  JobRequirementID FROM tbl_JobAdvertisment where JobCode = '" + jobCode + "'; INSERT INTO tbl_InterviewPannel (InterviewerID, UserGroupID, ReqID) VALUES ('" + TLID + "', '1003',@ReqID); Select Scope_Identity();");
            int NewID = Convert.ToInt32(id);
            if (NewID > 0)
            {
                return "1";
            }
            return "0";
        }

        [WebMethod]
        public static string SaveShortListedCandidates(string CandidateList, string jobCode)
        {
            Fn.Exec("Declare @candidateList as varchar(max), @ReqID as int, @shortListedBy as int; set @candidateList = '" + CandidateList + "'; set @shortListedBy = '" + UserID + "'; select @ReqID = JobRequirementID from tbl_JobAdvertisment where JobCode = '" + jobCode + "'; INSERT INTO tbl_ShortListedCandidates (ReqID, CandidateID, ShortlistingDate, ShortListedBy) select @ReqID, items, GETDATE(), @shortListedBy from SplitString(@candidateList, ',')");
            Fn.Exec("UPDATE tbl_JobRequirements SET ReqStatusID = 6 where JobRequirementID in (SELECT JobRequirementID FROM tbl_JobAdvertisment where JobCode = '" + jobCode + "');");
            //int NewID = Convert.ToInt32(id);
            //if (NewID > 0)
            //{
            //    return "1";
            //}
            return "0";
        }




        [WebMethod]
        public static string DetailPersonalInformation(string CandidateID) 
        {
            return Fn.Data2Json("SELECT tbl_Candidates.Name, tbl_Candidates.FatherName, tbl_Candidates.CNIC, tbl_Candidates.CellNo, tbl_Candidates.EmailAddress, case when tbl_Candidates.Is_Male = 1 then 'Male' else 'Female' end as Gender, tbl_Candidates.StreetAddress, TblDistrict.LocName as District FROM tbl_Candidates INNER JOIN TblDistrict ON TblDistrict.LocID = tbl_Candidates.DistrictId Where tbl_Candidates.CandidateID = " + CandidateID);
        }


        [WebMethod]
        public static string DetailAcademicInfo(string CandidateID)
        {
            return Fn.Data2Json("SELECT InstitutionName, Year, Degree, Percentage FROM tbl_CandidateAcadamicInfo where CandidateID = " + CandidateID);
        }



        [WebMethod]
        public static string EmployementHistory(string CandidateID) 
        {
            return Fn.Data2Json("SELECT  CompanyName, FORMAT( JobStartingDate, 'dd - MMMM - yyyy') as JobStartingDate, ISNULL(Format( JobEndingDate, 'dd - MMMM - yyyy'), 'Working') as JobEndingDate, SalaryPackage, JobResponsibility FROM    tbl_EmploymentHistory where CandidateID = '" + CandidateID + "' order by JobEndingDate desc");
        }


        [WebMethod]
        public static string CandidateCertifications(string CandidateID)
        {
            return Fn.Data2Json("SELECT CertificationName, format(PassingDate, 'dd - MMMM - yyyy') as PassingDate, Percentage, InstitutionAuthorityName FROM tbl_CandidateCertification where CandidateID = " + CandidateID);
        }

        [WebMethod]
        public static string CandidateSkills(string CandidateID) 
        {
            return Fn.Data2Json("Select row_number() over(order by Skills) as srno, skills from (SELECT distinct tbl_Skills.Skills , tbl_CandidateSkills.CandidateID FROM tbl_CandidateSkills inner join tbl_Skills on tbl_Skills.SkillsID = tbl_CandidateSkills.SkillID ) as tab where CandidateID = " + CandidateID);
        }







    }
}