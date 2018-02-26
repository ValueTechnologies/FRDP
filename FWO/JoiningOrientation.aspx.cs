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
    public partial class JoiningOrientation : System.Web.UI.Page
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
        public static string SearchCandidates(string CompanyID, string DutyStationID, string JobCode, string Name)
        {
            return Fn.Data2Json("SELECT  ROW_NUMBER() over (order by tbl_Candidates.Name) as Srno ,tbl_SelectedCandidates.SelectedCandidateID,  tbl_Candidates.Name, tbl_Candidates.CNIC, tbl_Candidates.CellNo,    FORMAT( tbl_SelectedCandidates.SelectOnDate, 'dd-MMM-yyyy') as SelectOnDate, TblHResources.Full_Name AS SelectedBy FROM            tbl_SelectedCandidates INNER JOIN tbl_Candidates ON tbl_Candidates.CandidateID = tbl_SelectedCandidates.CandidateID INNER JOIN TblHResources ON TblHResources.User_ID = tbl_SelectedCandidates.SelectedBy Inner join tbl_JobAdvertisment on tbl_Candidates.RequirementID = tbl_JobAdvertisment.JobRequirementID Inner join tbl_JobRequirements on tbl_JobRequirements.JobRequirementID = tbl_JobAdvertisment.JobRequirementID where tbl_JobRequirements.CompanyID = '" + CompanyID + "' and tbl_JobRequirements.DutyStationID = '" + DutyStationID + "' and tbl_JobAdvertisment.JobCode = '" + JobCode + "' and (tbl_Candidates.Name like '%' + '" + Name + "' + '%') and (tbl_SelectedCandidates.Is_Joined is null) and (tbl_SelectedCandidates.EmailSnapShot is not null)");
        }


        [WebMethod]
        public static string JoiningSaveData(string IsJoined, string JoiningRespoinsible, string EmailTo, string CandidateID)
        {
            DBManagerHRIS dbMan = new DBManagerHRIS();
            DataTable dt = new DataTable();
            int[] MailTo = new int[50];
            int TotalEmailID = 0;
            for (int i = 0; i < EmailTo.Split(',').Length - 1; i++)
            {
                MailTo[i] = Convert.ToInt32(EmailTo.Split(',')[i]);
                TotalEmailID++;
            }
            for (int Index = 0; Index < TotalEmailID; Index++)
            {
                Fn.SendEmail(Fn.GetRecords("Select Email from TblHResources where User_ID =  " + MailTo[Index])[0], "New Joining", dbMan.JoiningEmailBody(CandidateID), Fn.GetRecords("Select Email from TblHResources where User_ID = " + UserID)[0], dt);

            }
            Fn.Exec("UPDATE tbl_SelectedCandidates SET Is_Joined = '" + IsJoined + "', JoiningResponsible = '" + JoiningRespoinsible + "', JoiningEmail = 1, JoiningEntryDate = GETDATE() where SelectedCandidateID = " + CandidateID);
            return Fn.Exec("INSERT INTO tbl_JoiningOrentationMail (JoiningOrientation, MailTo, MaiFrom, CandidateSelectedID, EntryDate)  Select 'Joining', items, '" + UserID + "', '" + CandidateID + "', GETDATE() from SplitString('" + EmailTo + "', ','); ");
        }


        [WebMethod]
        public static string OrientationSaveData(string OrientationStatus, string OrientationRespoinsible, string EmailTo, string CandidateID)
        {

            DBManagerHRIS dbMan = new DBManagerHRIS();
            DataTable dt = new DataTable();
            int[] MailTo = new int[50];
            int TotalEmailID = 0;
            for (int i = 0; i < EmailTo.Split(',').Length - 1; i++)
            {
                MailTo[i] = Convert.ToInt32(EmailTo.Split(',')[i]);
                TotalEmailID++;
            }

            Fn.Exec("UPDATE tbl_SelectedCandidates SET OrientationStatus = '" + OrientationStatus + "', OrientationResponsible = '" + OrientationRespoinsible + "', OrientationEmail = 1, OrientationEntryDate = GETDATE() where SelectedCandidateID =  " + CandidateID);
            Fn.Exec("INSERT INTO tbl_JoiningOrentationMail (JoiningOrientation, MailTo, MaiFrom, CandidateSelectedID, EntryDate)  Select 'Orientation', items, '" + UserID + "', '" + CandidateID + "', GETDATE() from SplitString('" + EmailTo + "', ','); ");

            for (int Index = 0; Index < TotalEmailID; Index++)
            {
                Fn.SendEmail(Fn.GetRecords("Select Email from TblHResources where User_ID =  " + MailTo[Index])[0], "Orientation New Hiring", dbMan.OrientationEmailBody(CandidateID), Fn.GetRecords("Select Email from TblHResources where User_ID = " + UserID)[0], dt);

            }
            return "1";
        }



        [WebMethod]
        public static string Department()
        {
            MyClass VRMISFN = new MyClass();
            return VRMISFN.Data2Json("Select 0 as DeptID, ' --- All ---' as Depart union SELECT        DeptID, Depart FROM tblOD_Process group by Depart, DeptID Order by Depart");
        }


        [WebMethod]
        public static string Function(string Deptid)
        {
            MyClass VRMISFN = new MyClass();
            return VRMISFN.Data2Json("Select 0 as FuncID, ' --- All ---' as Func union SELECT FuncID, Func FROM tblOD_Process where FuncID is not null and Func is not null and DeptID = '" + Deptid + "' group by Func, FuncID Order by Func");
        }

        [WebMethod]
        public static string sFunction(string funID)
        {
            MyClass VRMISFN = new MyClass();
            return VRMISFN.Data2Json("Select 0 as SFuncID, ' --- All ---' as SFunc union SELECT SFuncID, SFunc FROM tblOD_Process where SFuncID is not null and SFunc is not null and FuncID = '"+ funID +"' group by SFunc, SFuncID Order by SFunc");
        }

        [WebMethod]
        public static string Activity(string sfunID)
        {
            MyClass VRMISFN = new MyClass();
            return VRMISFN.Data2Json("Select 0 as ID, ' --- All ---' as Activ union SELECT ID, Activ FROM tblOD_Process where ID is not null and Activ is not null and Activ not like '' and SFuncID = '"+ sfunID +"' group by Activ, ID Order by Activ");
        }


        [WebMethod]
        public static string OrganizationStructure(string deptid, string funid, string sfunID, string activityID, string AddedActivities) 
        {
            return Fn.Data2Json("usp_OrganizationDevelopmentStructure @deptID = " + deptid + ", @funID = " + funid + ", @sFunID = " + sfunID + ", @ActivityID = " + activityID + ", @AddedActivities = '" + AddedActivities + "'");
        }


        [WebMethod]
        public static string SaveJDData(string Activities, string candidateID) 
        {

            return Fn.Exec("usp_SaveJDData @ActivityID = '" + Activities + "' , @CandidateID = '" + candidateID + "' ,@DevelopBy = '" + UserID + "'");
        }


    }
}