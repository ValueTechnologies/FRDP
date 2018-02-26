using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class AppointmentLetter : System.Web.UI.Page
    {
        public static HRISDBClass Fn = new HRISDBClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string SearchCandidates(string CompanyID, string DutyStationID, string JobCode, string Name) 
        {
            //and (tbl_SelectedCandidates.OfferAccepted = 1 or tbl_SelectedCandidates.OfferAccepted is null)
            return Fn.Data2Json("SELECT  ROW_NUMBER() over (order by tbl_Candidates.Name) as Srno ,tbl_SelectedCandidates.SelectedCandidateID,  tbl_Candidates.Name, tbl_Candidates.CNIC, tbl_Candidates.CellNo,    FORMAT( tbl_SelectedCandidates.SelectOnDate, 'dd-MMM-yyyy') as SelectOnDate, TblHResources.Full_Name AS SelectedBy FROM            tbl_SelectedCandidates INNER JOIN tbl_Candidates ON tbl_Candidates.CandidateID = tbl_SelectedCandidates.CandidateID INNER JOIN TblHResources ON TblHResources.User_ID = tbl_SelectedCandidates.SelectedBy inner join tbl_JobAdvertisment on tbl_Candidates.RequirementID = tbl_JobAdvertisment.JobRequirementID inner join tbl_JobRequirements on tbl_JobRequirements.JobRequirementID = tbl_JobAdvertisment.JobRequirementID where tbl_JobRequirements.CompanyID = '" + CompanyID + "' and tbl_JobRequirements.DutyStationID = '" + DutyStationID + "' and tbl_JobAdvertisment.JobCode = '" + JobCode + "' and (tbl_Candidates.Name like '%' + '" + Name + "' + '%') ");  
        }


        [WebMethod]
        public static string IsLetterAccepted(string SelectedCandidateID) 
        {
            return Fn.Data2Json("Select OfferAccepted from tbl_SelectedCandidates where SelectedCandidateID =  " + SelectedCandidateID);
        
        }


        [WebMethod]
        public static string AllDepartments(string CompanyID) 
        {
            return Fn.Data2Json("SELECT DepartmentID,   DepartmentName FROM tbl_Departments where CompanyId = " + CompanyID);
        }


        [WebMethod]
        public static string SaveAppointmentLetter(string CandidateSelectedID, string salary, string TimmingFrom, string TimmingTo, string DateOfJoining,  string DeptID, string ProbationPeriod) 
        {
            return Fn.Exec("UPDATE tbl_SelectedCandidates SET Salary = '" + salary + "', OfficeTimmingFrom = '" + TimmingFrom + "', OfficeTimmingTo = '" + TimmingTo + "', DateOfJoining = '" + DateOfJoining + "', DepartmentID = '" + DeptID + "', ProbationPeriodInMonths = '" + ProbationPeriod + "' where SelectedCandidateID = " + CandidateSelectedID);
        }


        [WebMethod]
        public static string SearchAppointedCandidates(string CompanyID, string DutyStationID, string JobCode, string Name)
        {
            return Fn.Data2Json("SELECT ROW_NUMBER() over (order by tbl_Candidates.Name) as Srno , tbl_SelectedCandidates.SelectedCandidateID,  tbl_Candidates.Name, tbl_Candidates.CNIC, tbl_Candidates.CellNo,    FORMAT( tbl_SelectedCandidates.SelectOnDate, 'dd-MMM-yyyy') as SelectOnDate, TblHResources.Full_Name AS SelectedBy , tbl_Departments.DepartmentName, FORMAT( tbl_SelectedCandidates.DateOfJoining, 'dd - MMM - yyyy') as DateOfJoining FROM            tbl_SelectedCandidates INNER JOIN tbl_Candidates ON tbl_Candidates.CandidateID = tbl_SelectedCandidates.CandidateID INNER JOIN TblHResources ON TblHResources.User_ID = tbl_SelectedCandidates.SelectedBy inner join tbl_JobAdvertisment on tbl_Candidates.RequirementID = tbl_JobAdvertisment.JobRequirementID inner join tbl_JobRequirements on tbl_JobRequirements.JobRequirementID = tbl_JobAdvertisment.JobRequirementID Inner join tbl_Departments on tbl_Departments.DepartmentID = tbl_SelectedCandidates.DepartmentID where tbl_JobRequirements.CompanyID = '" + CompanyID + "' and tbl_JobRequirements.DutyStationID = '" + DutyStationID + "' and tbl_JobAdvertisment.JobCode = '" + JobCode + "' and (tbl_Candidates.Name like '%' + '" + Name + "' + '%') and (OfferAccepted = 1) ");
        }





    }
}