using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class InterviewGradingPannelResult : System.Web.UI.Page
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
        public static string FilterRecords(string CompanyID, string DutyStationID, string JobCode, string Name) 
        {
            return Fn.Data2Json("Declare @companyID as int,  @dutyStationid as int, @JobCode as varchar(50), @Name as varchar(50); set @companyID = '" + CompanyID + "'; set @dutyStationid = '" + DutyStationID + "'; set @JobCode = '" + JobCode + "'; set @Name = '" + Name + "'; if @Name = '' set @Name = null; SELECT    row_number() over(order by tbl_InterviewMarks.CandidatesID) as srno,    tbl_InterviewMarks.CandidatesID, tbl_Candidates.Name, tbl_Candidates.CNIC, SUM(tbl_InterviewMarks.Marks) AS Marks , Sum(tbl_InterviewMarks.TotalMarks) as TotalMarks     FROM            tbl_InterviewMarks INNER JOIN tbl_JobAdvertisment ON tbl_JobAdvertisment.JobCode = tbl_InterviewMarks.JobCode INNER JOIN tbl_JobRequirements ON tbl_JobAdvertisment.JobRequirementID = tbl_JobRequirements.JobRequirementID INNER JOIN tbl_Candidates ON tbl_InterviewMarks.CandidatesID = tbl_Candidates.CandidateID WHERE        (tbl_JobRequirements.CompanyID = @companyID) AND (tbl_JobRequirements.DutyStationID = @dutyStationid) AND (tbl_JobAdvertisment.JobCode = @JobCode) AND (@Name IS NULL or tbl_Candidates.Name LIKE '%' + @Name + '%') AND ( tbl_InterviewMarks.CandidatesID not in (Select CandidateID from tbl_SelectedCandidates))    GROUP BY tbl_InterviewMarks.CandidatesID, tbl_Candidates.Name, tbl_Candidates.CNIC");
        
        }


        [WebMethod]
        public static string DetailMarksOfCandidate(string CandidateID)
        {
            return Fn.Data2Json("DECLARE @cols AS NVARCHAR(MAX),@query  AS NVARCHAR(MAX), @unionQuery as NVARCHAR(max); DECLARE @Skills VARCHAR(8000); Select @Skills = COALESCE(@Skills + ', ', '') + Skills from(Select distinct Skills  from (SELECT   '[' + tbl_Skills.Skills   + ']' as Skills FROM            tbl_InterviewMarks INNER JOIN TblHResources ON TblHResources.User_ID = tbl_InterviewMarks.InterviewerID INNER JOIN tbl_Skills ON tbl_Skills.SkillsID = tbl_InterviewMarks.SkillID INNER JOIN tbl_Candidates ON tbl_Candidates.CandidateID = tbl_InterviewMarks.CandidatesID WHERE        (tbl_InterviewMarks.CandidatesID = " + CandidateID + ")) as mySmallTab )as Mytabl; set @cols = @Skills; set @query = 'SELECT Interviewer, ' + @cols + ' from (SELECT        tbl_InterviewMarks.Marks, TblHResources.Full_Name AS Interviewer, tbl_Skills.Skills, tbl_Candidates.Name FROM            tbl_InterviewMarks INNER JOIN TblHResources ON TblHResources.User_ID = tbl_InterviewMarks.InterviewerID INNER JOIN tbl_Skills ON tbl_Skills.SkillsID = tbl_InterviewMarks.SkillID INNER JOIN tbl_Candidates ON tbl_Candidates.CandidateID = tbl_InterviewMarks.CandidatesID WHERE        (tbl_InterviewMarks.CandidatesID = " + CandidateID + ")) x pivot (SUM(Marks) for Skills in (' + @cols + ')) p ';    set @unionQuery = 'SELECT top(1) Interviewer, ' + @cols + ' from (SELECT        tbl_InterviewMarks.Marks, TblHResources.Full_Name AS Interviewer, tbl_Skills.Skills, tbl_Candidates.Name FROM            tbl_InterviewMarks INNER JOIN TblHResources ON TblHResources.User_ID = tbl_InterviewMarks.InterviewerID INNER JOIN tbl_Skills ON tbl_Skills.SkillsID = tbl_InterviewMarks.SkillID INNER JOIN tbl_Candidates ON tbl_Candidates.CandidateID = tbl_InterviewMarks.CandidatesID WHERE        (tbl_InterviewMarks.CandidatesID = " + CandidateID + ")) x pivot (SUM(Marks) for Skills in (' + @cols + ')) p ' set @query  = @unionQuery + ' union all ' + @query execute sp_executesql @query;");
        }


        [WebMethod]
        public static string SaveCandidates(string CandidateList) 
        {
            return Fn.ExenID("INSERT INTO tbl_SelectedCandidates (CandidateID, SelectedBy, SelectOnDate) select items, '"+ UserID +"', GETDATE() from SplitString('" + CandidateList + "', ','); Select scope_identity();");
            
        }



        [WebMethod]
        public static string SendEmail(string CandidatesID) 
        {
            DBManagerHRIS dbMan = new DBManagerHRIS();

            int[] MailTo = new int[50];
            int TotalEmailID = 0;
            for (int i = 0; i < CandidatesID.Split(',').Length - 1; i++)
            {
                MailTo[i] = Convert.ToInt32(CandidatesID.Split(',')[i]);
                TotalEmailID++;
            }
            for (int Index = 0; Index < TotalEmailID; Index++)
            {
                Fn.SendEmail(Fn.GetRecords("SELECT        EmailAddress FROM            tbl_Candidates WHERE (CandidateID = " + MailTo[Index] + ")")[0], "Job Offer Letter", Fn.GetRecordCandidate(MailTo[Index]), Fn.GetRecords("SELECT  distinct      tbl_Company.CompanyEmail FROM            tbl_Candidates INNER JOIN tbl_JobRequirements ON tbl_Candidates.RequirementID = tbl_JobRequirements.JobRequirementID inner join tbl_Company on tbl_Company.CompanyID = tbl_JobRequirements.CompanyID where tbl_Candidates.CandidateID =  " + MailTo[Index])[0], dbMan.GetInterviewerPannelEmail(CandidatesID));
            }
            return string.Empty;
        }
    }
}