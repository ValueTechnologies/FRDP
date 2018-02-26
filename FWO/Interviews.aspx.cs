using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class Interviews : System.Web.UI.Page
    {

        public static HRISDBClass Fn = new HRISDBClass();
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
        public static string FilterRecord(string Company, string JobCode, string DutyStatation, string Gender, string Name, string CNIC)
        {
            return Fn.Data2Json("Declare @name as varchar(50), @cnic as varchar(50), @Gender as int, @companyID as int, @jobCode as varchar(50), @DutyStation as int, @EmployeeID as int; set @EmployeeID = '" + UserID + "';  set @name = '" + Name + "'; set @cnic = '" + CNIC + "'; set @Gender = '" + Gender + "'; set @companyID = '" + Company + "'; set @jobCode = '" + JobCode + "'; set @DutyStation = '" + DutyStatation + "'; if @name   = ''  set @name = null; if @cnic   = ''  set @cnic = null; if @Gender   = '-1'  set @Gender = null; Select row_number() over(order by CandidateID) as srno , CandidateID, Name, FatherName, CNIC, CVExtension, TotalExperience, JobCode, CellNo, PhoneNo, EmailAddress, Gender, CVName, DutyStationID, CompanyID from (SELECT      distinct  MyTable.CandidateID, MyTable.Name, MyTable.FatherName, MyTable.CNIC, MyTable.CVExtension, MyTable.TotalExperience, MyTable.JobCode, MyTable.CellNo, MyTable.PhoneNo, MyTable.EmailAddress, MyTable.Gender, MyTable.CVName, MyTable.DutyStationID, MyTable.CompanyID FROM            (SELECT DISTINCT tbl_Candidates.CandidateID, tbl_Candidates.Name, tbl_Candidates.FatherName, tbl_Candidates.CNIC, dbo.fn_GetExperienceInYears(tbl_Candidates.CandidateID) AS TotalExperience, tbl_JobAdvertisment.JobCode, tbl_Candidates.CellNo, tbl_Candidates.PhoneNo, tbl_Candidates.EmailAddress, CASE WHEN Is_Male = 1 THEN 'Male' ELSE 'Female' END AS Gender, CONVERT(varchar(50), tbl_Candidates.CandidateID) + '' + tbl_Candidates.CVExtension AS CVName, tbl_Candidates.CVExtension, tbl_JobRequirements.DutyStationID, tbl_JobRequirements.CompanyID, tbl_EmploymentHistory.CurruntlyWorking, tbl_Candidates.Is_Male FROM            tbl_Candidates LEFT OUTER JOIN tbl_EmploymentHistory ON tbl_Candidates.CandidateID = tbl_EmploymentHistory.CandidateID LEFT OUTER JOIN tbl_JobAdvertisment ON tbl_JobAdvertisment.JobRequirementID = tbl_Candidates.RequirementID LEFT OUTER JOIN tbl_JobRequirements ON tbl_JobAdvertisment.JobRequirementID = tbl_JobRequirements.JobRequirementID WHERE        (tbl_JobRequirements.ReqStatusID = 6)) AS MyTable INNER JOIN tbl_ShortListedCandidates ON tbl_ShortListedCandidates.CandidateID = MyTable.CandidateID WHERE        (MyTable.CompanyID = @companyID) AND (MyTable.JobCode = @jobCode) AND (MyTable.DutyStationID = @DutyStation) AND (@name IS NULL OR MyTable.Name LIKE '%' + @name + '%') AND (@Gender IS NULL OR MyTable.Is_Male = @Gender) AND (@cnic IS NULL OR MyTable.CNIC LIKE '%' + @cnic + '%') ) as myT where @EmployeeID in (Select InterviewerID from tbl_InterviewPannel inner join tbl_JobAdvertisment on tbl_JobAdvertisment.JobRequirementID = tbl_InterviewPannel.ReqID where tbl_JobAdvertisment.JobCode = @jobCode );");
        }


        [WebMethod]
        public static string IntervieweeSkills(string JobCode, string CandidateID) 
        {
            return Fn.Data2Json("Select row_number() over(order by SkillsID) as srno, Skills, SkillsID from (select   tbl_Skills.Skills, tbl_Skills.SkillsID from tbl_JobAdvertisment inner join tbl_JobRequirementSkills on tbl_JobRequirementSkills.ReqID = tbl_JobAdvertisment.JobRequirementID inner join tbl_Skills on tbl_Skills.SkillsID = tbl_JobRequirementSkills.SkillsID where tbl_JobAdvertisment.JobCode =  '" + JobCode + "' ) as MyTab where SkillsID not in (Select SkillID from tbl_InterviewMarks where CandidatesID = '" + CandidateID + "'   and (InterviewerID = '" + UserID + "'))");
        }



        [WebMethod]
        public static string SaveData(string SkillID, string SkillMarks, string CandidateID, string JobCode)
        {
            return Fn.ExenID("insert into tbl_InterviewMarks(CandidatesID, SkillID, Marks, InterviewerID, JobCode, TotalMarks) values('" + CandidateID + "', '" + SkillID + "', '" + SkillMarks + "', '" + UserID + "', '" + JobCode + "', 10); Select scope_Identity();");
        }
    }
}