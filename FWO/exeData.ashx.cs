using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;

namespace FRDP
{
    /// <summary>
    /// Summary description for exeData
    /// </summary>
    public class exeData : IHttpHandler, IRequiresSessionState
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
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_VMenu('" + dataID[1] + "')")[0]);
                            break;

                        case 1:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_POList('" + dataID[1] + "')")[0]);
                            break;

                        case 2:
                            //context.Response.Write(Fn.Data2Json("SELECT LocID, LocName FROM TblLocation WHERE (TypeID = 4)"));

                            context.Response.Write(Fn.Data2Json(@"SELECT        DistrictID LocID, LocName
FROM            TblDistrict order by LocName"));
                            break;

                        case 3:
                            //context.Response.Write(Fn.Data2Json("SELECT ProjCode, ProjTitle, ProjectID FROM  tblProjects WHERE (ProjectStatus = 3)"));
                            string sssssssss = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value));

                            string s = sssssssss;
                            context.Response.Write(Fn.Data2Json(@"SELECT ProjCode, ProjTitle, ProjectID FROM  tblProjects WHERE (ProjectStatus = 3)
and ProjectID in (

SELECT        TBLProjectID
FROM            TblHResourcesProject
WHERE        (TblHResourcesID = " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @")
)"));


                            break;

                        case 4:
                            context.Response.Write(Fn.Data2Json("SELECT ProjCode, ProjTitle, ProjectID, OverallObj, SpecificObj, StartDate, EndDate FROM tblProjects WHERE (ProjectStatus = 3) AND (ProjectID = " + dataID[1] + ")"));
                            break;

                        case 5:
                            context.Response.Write(Fn.Data2Json("SELECT Outcome, OutcomeObj, ProjectOutcomeID FROM tblProjectOutcomes WHERE (ProjectID = " + dataID[1] + ")"));
                            break;

                        case 6:
                            context.Response.Write(Fn.Data2Json("SELECT Output, OutputID FROM  tblOutputs WHERE (ProjectOutcomeID = " + dataID[1] + ")"));
                            break;

                        case 7:
                            context.Response.Write(Fn.Data2Json("SELECT OutcomeIndicID , Indicators FROM tblOutcomeIndicators WHERE (ProjectOutcomeID= " + dataID[1] + ")"));
                            break;

                        case 8:
                            context.Response.Write(Fn.Data2Json("SELECT OutputIndID, IndicatorTitle FROM TblOutputIndicators WHERE (OutputID = " + dataID[1] + ")"));
                            break;

                        case 9:
                            context.Response.Write(Fn.Data2Json("SELECT Activity FROM TblOutputActivities WHERE (ProjectID = " + dataID[1] + ") GROUP BY Activity"));
                            break;

                        case 10:
                            context.Response.Write(Fn.Data2Json("SELECT tblPartnerOrgs.PO_ID, tblPartnerOrgs.PO_Name FROM tblPartnerOrgs INNER JOIN tblProjectIPs ON tblPartnerOrgs.PO_ID = tblProjectIPs.PO_ID WHERE (tblProjectIPs.ProjectID = " + dataID[1] + ")"));
                            break;

                        case 11:
                            //ITS DONE WITH NEW LOCATION FORMAT
                            // context.Response.Write(Fn.Data2Json("SELECT vFU.LocID, vFU.LocName FROM (SELECT LocID, LocName, ParentID  FROM TblLocation  WHERE (TypeID = 6)) AS vFU INNER JOIN  (SELECT LocID, ParentID  FROM TblLocation AS TblLocation_2  WHERE (TypeID = 5)) AS vTesil ON vFU.ParentID = vTesil.LocID INNER JOIN  (SELECT LocID, ParentID  FROM TblLocation AS TblLocation_1  WHERE (TypeID = 4)) AS vDistt ON vTesil.ParentID = vDistt.LocID INNER JOIN  tblProjectLocations ON vDistt.LocID = tblProjectLocations.LocID WHERE (tblProjectLocations.ProjectID = " + dataID[1] + ")"));
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblFeildUnit.FeildUnitID AS LocID, CASE WHEN TblFeildUnit.LocName = '' THEN TblTehsil.LocName ELSE TblTehsil.LocName END AS LocName
FROM            TblFeildUnit INNER JOIN
                         TblTehsil ON TblFeildUnit.TehsilID = TblTehsil.TehsilID INNER JOIN
                         tblProjectLocations ON TblTehsil.DistrictID = tblProjectLocations.LocID
WHERE        (tblProjectLocations.ProjectID =" + dataID[1] + ")"));
                            break;

                        case 12:
                            context.Response.Write(Fn.Data2Json("SELECT  User_ID, Full_Name FROM TblHResources WHERE (PO_ID LIKE '" + dataID[1] + "')"));
                            break;

                        case 13:
                            context.Response.Write(Fn.Data2Json("SELECT User_ID, Full_Name, Email FROM TblHResources WHERE (Full_Name LIKE '" + dataID[1] + "%')"));
                            break;

                        case 14:
                            context.Response.Write(Fn.ExenID("INSERT INTO TblOutputActivities(Activity, Sub_Activity, StartDate, EndDate,ActvType,LocID,UCID,VillageID, PO_ID,Budget,  Responsible, Target, OwnShare, POShare, Note, ProjectID, OutputIndID,Created) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'+convert(varchar,getdate()))"));
                            break;

                        case 15:
                            context.Response.Write(Fn.Data2Json("SELECT * FROM TblOutputActivities WHERE (OutputIndID = " + dataID[1] + ")"));
                            break;

                        case 16:
                            context.Response.Write(Fn.Data2Json("SELECT * FROM TblOutputActivities WHERE (OutputActivityID = " + dataID[1] + ")"));
                            break;

                        case 17:
                            string[] dta = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Split('ǁ');
                            context.Response.Write(Fn.Exec("UPDATE TblOutputActivities SET Activity = '" + dta[0] + "', Sub_Activity = '" + dta[1] + "', StartDate = '" + dta[2] + "', EndDate = '" + dta[3] + "', ActvType = '" + dta[4] + "', LocID = '" + dta[5] + "', UCID = '" + dta[6] + "', VillageID = '" + dta[7] + "', PO_ID = '" + dta[8] + "', Budget = '" + dta[9] + "', Responsible = '" + dta[10] + "', Target = '" + dta[11] + "', OwnShare = '" + dta[12] + "', POShare = '" + dta[13] + "', Note = '" + dta[14] + "',  Modif = '" + dta[15] + "'+convert(varchar,getdate()) WHERE (OutputActivityID = '" + dta[16] + "')"));
                            break;

                        case 18:
                            context.Response.Write(Fn.Data2Json("SELECT tblProjects.ProjCode, tblProjects.ProjTitle, tblProjects.ProjectID FROM tblProjects INNER JOIN tblProjectIPs ON tblProjects.ProjectID = tblProjectIPs.ProjectID WHERE (tblProjects.ProjectStatus = 3) AND (tblProjectIPs.PO_ID = " + dataID[1] + ")"));
                            break;

                        case 19:
                            context.Response.Write(Fn.Data2Json("SELECT TblLocation.LocID, TblLocation.LocName FROM TblLocation INNER JOIN  tblProjectLocations ON TblLocation.LocID = tblProjectLocations.LocID INNER JOIN  tblProjectIPs ON tblProjectLocations.ProjectID = tblProjectIPs.ProjectID WHERE (TblLocation.TypeID = 4) AND (tblProjectIPs.PO_ID = " + dataID[1] + ")"));
                            break;

                        case 20:
                            context.Response.Write(Fn.Data2Json("SELECT TblOutputIndicators.IndicatorTitle, TblOutputIndicators.OutputIndID FROM TblOutputIndicators INNER JOIN TblOutputActivities ON TblOutputIndicators.OutputIndID = TblOutputActivities.OutputIndID WHERE (TblOutputIndicators.ProjectId = " + dataID[1] + ") AND (TblOutputActivities.PO_ID = " + dataID[2] + ") GROUP BY TblOutputIndicators.IndicatorTitle, TblOutputIndicators.OutputIndID"));
                            break;

                        case 21:
                            context.Response.Write(Fn.Data2Json("SELECT TblLocation.LocID,TblOutputActivities.BenType,TblOutputActivities.BenValue,TblOutputActivities.Activity,TblOutputActivities.Expenditures,TblOutputActivities.KeyRlst,TblOutputActivities.bMale,TblOutputActivities.bFemale,TblOutputActivities.KeyRecm,TblOutputActivities.ReportDate,TblOutputActivities.Achived, TblOutputActivities.Sub_Activity, TblOutputActivities.StartDate, TblOutputActivities.EndDate, TblOutputActivities.Target,   TblOutputActivities.Note, TblOutputActivities.OwnShare, TblOutputActivities.POShare, TblHResources.Full_Name, TblHResources.Email,   TblLocation.LocName FROM TblOutputActivities INNER JOIN  TblLocation ON TblOutputActivities.LocID = TblLocation.LocID INNER JOIN  TblHResources ON TblOutputActivities.Responsible = TblHResources.User_ID WHERE (TblHResources.U_Status = 1) and  (TblOutputActivities.OutputActivityID = " + dataID[1] + ")"));
                            break;
                        case 22:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblActivityBeneficiaries(BName, Gender, CNIC, Phone, Org, Design,beneficryHH, OutputActivityID,id, Created) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'+convert(varchar,getdate()))"));
                            break;
                        case 23:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_UserGroup()")[0]);
                            break;

                        case 24:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_Regions()")[0]);
                            break;

                        case 25:
                            string userid = Fn.ExenID("INSERT INTO TblHResources (Full_Name, Group_ID, ContactNos, Email, PO_ID, Regions, Distt, U_Status, U_Pass, enter_by, U_ThemeID) VALUES ('" + dataID[1] + "', '" + dataID[2] + "', '" + dataID[3] + "', '" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "', '" + dataID[7] + "', '" + dataID[8] + "', '" + Encryptor.Encrypt(dataID[9]) + "', '" + dataID[10] + "'+convert(varchar,getdate()),1);select SCOPE_IDENTITY()");
                            context.Response.Write(userid);
                            break;

                        case 26:
                            context.Response.Write(Fn.Data2Json("SELECT * FROM tblActivityBeneficiaries WHERE (OutputActivityID = " + dataID[1] + ")"));
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
                            byte[] Contents = Fn.RunReport(ds, sql, "UNDP." + dataID[3], dataID[1], context, true);
                            context.Response.BinaryWrite(Contents);
                            Contents = null;
                            break;

                        case 30:
                            context.Response.Write(Fn.Data2Json("SELECT FileTitle, FileExt, FileID FROM tblActivityDocs WHERE (tblPOPActivityActionID = " + dataID[1] + ")"));
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

                        case 31100:
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
                            string[] rec = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Split('ǁ');
                            context.Response.Write(Fn.Exec("UPDATE TblOutputActivities SET " + rec[1] + " ='" + rec[0] + "' WHERE (OutputActivityID = " + rec[2] + ")"));
                            break;

                        case 33:
                            context.Response.Write(Fn.Data2Json("SELECT FileGrp FROM tblProjectDocs WHERE (ProjectID = " + dataID[1] + ") GROUP BY FileGrp"));
                            break;

                        case 34:
                            context.Response.Write(Fn.Data2Json("SELECT FileID, FileTitle, FileExt FROM  tblProjectDocs WHERE (ProjectID = " + dataID[1] + ") AND (FileGrp = '" + dataID[2] + "')"));
                            break;

                        case 35:
                            context.Response.Write(Fn.Data2Json("SELECT Category FROM tblProjectCompliance WHERE (ProjectID = " + dataID[1] + ") GROUP BY Category"));
                            break;

                        case 36:
                            context.Response.Write(Fn.Data2Json("SELECT ComplianceID, ProjectID, GCClause, ReportActiv, Responsible FROM tblProjectCompliance WHERE (ProjectID = " + dataID[1] + ") AND (Category = '" + dataID[2] + "')"));
                            break;

                        case 37:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblProjectCompliance ( Category, GCClause, ReportActiv, Frequency, Responsible, SubmitTo, DatesDue, DatesCompleted, MOV, Remarks,ProjectID, Created) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'+convert(varchar,getdate()))"));
                            break;

                        case 38:
                            context.Response.Write(Fn.Data2Json("SELECT * FROM tblProjectCompliance WHERE (ComplianceID = " + dataID[1] + ")"));
                            break;

                        case 39:
                            string[] dt = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Split('ǁ');
                            context.Response.Write(Fn.Exec("UPDATE tblProjectCompliance SET Category = '" + dt[0] + "', GCClause = '" + dt[1] + "', ReportActiv = '" + dt[2] + "', Frequency = '" + dt[3] + "', Responsible = '" + dt[4] + "', SubmitTo = '" + dt[5] + "', DatesDue = '" + dt[6] + "', DatesCompleted = '" + dt[7] + "', MOV = '" + dt[8] + "', Remarks = '" + dt[9] + "', Modifi = '" + dt[10] + "'+convert(varchar,getdate()) WHERE (ComplianceID = '" + dt[11] + "')"));
                            break;

                        case 40:
                            context.Response.Write(Fn.Data2Json("SELECT CRPID, CRP_Name FROM TblCRPs WHERE (Field_Unit = " + dataID[1] + ")"));
                            break;

                        case 41:
                            context.Response.Write(Fn.Data2Json("SELECT CO_ID, CO_Title FROM tblCommunityOrgs WHERE (CO_Type like '%" + dataID[1] + "') AND (UCID = " + dataID[2] + ")"));
                            break;

                        case 42:
                            context.Response.Write(Fn.Data2Json("SELECT Mem_Name, MemType, Mem_Cell, Gender, CNIC, Mem_ID FROM tblCO_Members WHERE (CO_ID = " + dataID[1] + ")"));
                            break;

                        case 43:
                            context.Response.Write(Fn.Data2Json("SELECT CO_ID, CO_Title, CO_Type FROM tblCommunityOrgs WHERE (CO_Village = " + dataID[1] + ") AND POID=" + dataID[2]));
                            break;

                        case 44:
                            string x = Fn.GetRecords("SELECT MeetID FROM tblCOsMeetings WHERE (CO_ID = " + dataID[1] + ") AND (mMonth = CONVERT(DATETIME, '" + dataID[2] + "', 102))")[0];
                            if (x == ".") { x = Fn.ExenID("INSERT INTO tblCOsMeetings(CO_ID, mMonth)VALUES(" + dataID[1] + ", '" + dataID[2] + "');select SCOPE_IDENTITY()"); }
                            Fn.Exec("INSERT INTO tblCOMemSavings(MeetID, MemID, Saving, Attend) SELECT " + x + ", Mem_ID, 0, '' FROM tblCO_Members WHERE (CO_ID = " + dataID[1] + ")");
                            context.Response.Write(Fn.Data2Json("SELECT tblCOsMeetings_1.MeetID, (SELECT SUM(tblCOMemSavings.Saving) AS Expr1  FROM tblCOMemSavings INNER JOIN  tblCOsMeetings ON tblCOMemSavings.MeetID = tblCOsMeetings.MeetID  WHERE (tblCOsMeetings.CO_ID = " + dataID[1] + ") AND (tblCOsMeetings.mMonth < CONVERT(DATETIME, '" + dataID[2] + "', 102)) AND   (tblCOMemSavings.MemID = tblCO_Members.Mem_ID)) AS upto, tbm.dtaID, tblCO_Members.Mem_Name, tblCO_Members.MemType,   tbm.Saving, tbm.Attend FROM tblCOsMeetings AS tblCOsMeetings_1 INNER JOIN  tblCOMemSavings AS tbm ON tblCOsMeetings_1.MeetID = tbm.MeetID INNER JOIN  tblCO_Members ON tbm.MemID = tblCO_Members.Mem_ID WHERE (tblCOsMeetings_1.MeetID = " + x + ")"));
                            break;

                        case 45:
                            context.Response.Write(Fn.Exec("UPDATE tblCOMemSavings SET " + dataID[1] + " = '" + dataID[2] + "' WHERE (dtaID = " + dataID[3] + ")"));
                            break;

                        case 46:
                            context.Response.Write(Fn.Exec("UPDATE tblCOsMeetings SET " + dataID[1] + " = '" + dataID[2] + "' WHERE (MeetID = " + dataID[3] + ")"));
                            break;

                        case 47:
                            context.Response.Write(Fn.Data2Json("SELECT  Mem_ID, Mem_Name, CNIC FROM tblCO_Members WHERE (CO_ID = " + dataID[1] + ")"));
                            break;

                        case 48:
                            context.Response.Write(Fn.Data2Json("SELECT TOP (6) TblOutputActivities.Activity, TblOutputActivities.Sub_Activity, TblHResources.Full_Name, tblProjects.ProjTitle, TblOutputActivities.OutputActivityID FROM TblOutputActivities INNER JOIN TblHResources ON TblOutputActivities.Responsible = TblHResources.User_ID INNER JOIN tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID WHERE (NOT (TblOutputActivities.ReportDate IS NULL)) AND (CONVERT(varchar, TblOutputActivities.PO_ID) LIKE '" + dataID[1] + "') ORDER BY TblOutputActivities.ReportDate DESC"));
                            break;

                        case 49:
                            context.Response.Write(Fn.Data2Json("SELECT TOP (6) Convert(varchar(25),Task)+' ...' as tk,Task, Remarks FROM tblStaffActivity WHERE (SDate < DATEADD(d, 3, GETDATE())) AND (UserID = " + dataID[1] + ") ORDER BY SDate DESC"));
                            break;

                        case 50:
                            context.Response.Write(Fn.Exec("UPDATE TblHResources SET U_ThemeID ='" + dataID[1] + "' WHERE (User_ID = " + dataID[2] + ")"));
                            break;

                        case 51:
                            context.Response.Write(Fn.Data2Json("SELECT MIN(tbc.OutputActivityID * 10000) AS pID, tbc.Activity AS pName, MIN(DATEADD(month, 1, tbc.StartDate)) AS pStart, MAX(DATEADD(month, 1, tbc.EndDate))   AS pEnd, MAX(TblHResources.Full_Name) AS pRes, 0 AS pParent, 1 AS pGroup, MIN(tbc.OutputActivityID * 2000) AS srt FROM TblOutputActivities AS tbc INNER JOIN  TblHResources ON tbc.Responsible = TblHResources.User_ID WHERE (tbc.ProjectID = " + dataID[1] + ") GROUP BY tbc.Activity UNION SELECT tbc.OutputActivityID AS pID, tbc.Sub_Activity AS pName, DATEADD(month, 1, tbc.StartDate) AS pStart, DATEADD(month, 1, tbc.EndDate) AS pEnd,   TblHResources.Full_Name AS pRes,  (SELECT pid  FROM VWActiv  WHERE (Activity = tbc.Activity)) AS pParent, 0 AS pGroup,  (SELECT pid  FROM VWActiv AS VWActiv_1  WHERE (Activity = tbc.Activity)) AS srt FROM TblOutputActivities AS tbc INNER JOIN  TblHResources ON tbc.Responsible = TblHResources.User_ID WHERE (tbc.ProjectID = " + dataID[1] + ") ORDER BY srt, pStart"));
                            break;

                        case 52:
                            context.Response.Write(Fn.Data2Json("SELECT TblOutputActivities.Sub_Activity AS title, TblOutputActivities.StartDate AS date, '<b>' + tblProjects.ProjTitle + '</b><br/>' + TblOutputActivities.Note AS description,   'PO Name: ' + tblPartnerOrgs.PO_Name + ' Responsible: ' + TblHResources.Full_Name AS url, '' AS type FROM TblOutputActivities INNER JOIN  tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID INNER JOIN  tblPartnerOrgs ON TblOutputActivities.PO_ID = tblPartnerOrgs.PO_ID INNER JOIN  TblHResources ON TblOutputActivities.Responsible = TblHResources.User_ID"));
                            break;
                        case 54:
                            context.Response.Write(Fn.Data2Json("SELECT tblProjectSectors.SecID, tblLists.listTxt FROM tblProjectSectors INNER JOIN tblLists ON tblProjectSectors.SecID = tblLists.id WHERE (tblLists.listTyp = '2') AND (tblProjectSectors.ProjectID = " + dataID[1] + ")"));
                            break;
                        case 53:
                            context.Response.Write(Fn.HTMLTable("CrossTab 'SELECT CO_Type, CO_Status, CO_ID FROM tblCommunityOrgs','CO_Status','count(CO_ID)[]',N'CO_Type',NULL,',1,1'")); break;
                        case 55:
                            context.Response.Write(Fn.Data2Json("SELECT Outcome FROM tblProjectOutcomes WHERE (SecID = " + dataID[1] + ")"));
                            break;
                        case 56:
                            context.Response.Write(Fn.Data2Json("SELECT tblOutputs.Output FROM tblOutputs INNER JOIN tblProjectOutcomes ON tblOutputs.ProjectOutcomeID = tblProjectOutcomes.ProjectOutcomeID WHERE (tblProjectOutcomes.Outcome = (SELECT Outcome FROM tblProjectOutcomes WHERE (ProjectOutcomeID = " + dataID[1] + ")))"));
                            break;
                        case 57:
                            context.Response.Write(Fn.Data2Json("SELECT tblStaffActivity.TaskID, tblStaffActivity.Task, DATEADD(month, 1, tblStaffActivity.SDate) as SDate, DATEADD(month, 1, tblStaffActivity.EDate) as EDate, tblStaffActivity.Remarks, tblStaffActivity.Target,   tblStaffActivity.Achived * 100 / tblStaffActivity.Target AS pComp, TblHResources.Full_Name FROM tblStaffActivity INNER JOIN  TblHResources ON tblStaffActivity.UserID = TblHResources.User_ID WHERE (tblStaffActivity.UserID = " + dataID[1] + ") AND (format(tblStaffActivity.SDate, 'MMMM yyyy') = '" + dataID[2] + "')"));
                            break;
                        case 58:
                            context.Response.Write(Fn.ExenID("INSERT INTO tblStaffActivity (Task,AchStatus, SDate, EDate, Target, Achived, Remarks, UserID) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "')"));
                            break;
                        case 59:
                            context.Response.Write(Fn.Data2Json("SELECT Task, SDate, EDate, Target, Achived, Remarks FROM tblStaffActivity WHERE (TaskID = " + dataID[1] + ")"));
                            break;
                        case 60:
                            string[] tsk = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Split('ǁ');
                            context.Response.Write(Fn.Exec("UPDATE tblStaffActivity SET Task = '" + tsk[0] + "', SDate = '" + tsk[1] + "', EDate = '" + tsk[2] + "', Target = '" + tsk[3] + "', Achived = '" + tsk[4] + "', Remarks = '" + tsk[5] + "' WHERE (TaskID = '" + tsk[6] + "')"));
                            break;
                        case 61:
                            //Fn.Exec("sp_CreateProject '" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'");
                            Fn.Exec("sp_CreateProject '" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'");
                            break;
                        case 62:
                            context.Response.Write(Fn.Data2Json("SELECT * FROM TblOutputActivities WHERE (OutputIndID = " + dataID[1] + ") AND PO_ID=" + dataID[2]));
                            break;

                        case 63:
                            context.Response.ContentType = "application/" + dataID[1];
                            ds = dataID[4].Split('¦');
                            sql = dataID[5].Split('¦');
                            context.Response.AddHeader("Content-disposition", "attachment; filename=" + dataID[2]);
                            Contents = Fn.RunReport(ds, sql, "UNDP." + dataID[3], dataID[1], context, true);
                            context.Response.BinaryWrite(Contents);
                            Contents = null;
                            break;
                        case 64:
                            string rptid = Fn.ExenID("INSERT INTO tblFieldMonitoringHDR (PO_ID, mDate, ProjectID, FUID, UCID, VillageID, Male, Female, RptTitle,MoniterName, Created) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'+convert(varchar,getdate()));select SCOPE_IDENTITY()");
                            context.Response.Write(rptid);
                            break;
                        case 65:
                            context.Response.Write(Fn.Data2Json("SELECT IndicatorG FROM tblFieldMonitoringDTL GROUP BY IndicatorG ORDER BY IndicatorG"));
                            break;
                        case 66:
                            context.Response.Write(Fn.Data2Json("SELECT Indicator FROM tblFieldMonitoringDTL WHERE (IndicatorG = '" + dataID[1] + "') GROUP BY Indicator ORDER BY Indicator"));
                            break;
                        case 67:
                            Fn.ExenID("INSERT INTO tblFieldMonitoringDTL (IndicatorG, Indicator, Grade,KeyAch,KeyIssus, Suggestion,OverallObser, FMonitID) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "')");
                            break;
                        case 68:
                            context.Response.Write(Fn.Data2Json("SELECT IndicatorG, Indicator, Grade,  Suggestion FROM tblFieldMonitoringDTL WHERE (FMonitID = " + dataID[1] + ")"));
                            break;
                        case 69:
                            context.Response.Write(Fn.Data2Json("SELECT FileTitle, FileExt, FileID FROM tblFVisitDocs WHERE (FVisitID = " + dataID[1] + ")"));
                            break;
                        case 70:
                            context.Response.Write(Fn.Data2Json("SELECT tblCommunityOrgs.CO_Title,tblCommunityOrgs.CO_Type, tblCommunityOrgs.CO_ID FROM tblCommunityOrgs INNER JOIN TblLocation ON tblCommunityOrgs.UCID = TblLocation.LocID WHERE (TblLocation.ParentID = " + dataID[1] + ")"));
                            break;
                        case 72:
                            //context.Response.Write(Fn.HTMLTable("SELECT tblProjects.ProjCode, SUM(tblProjects.OwnShare + tblProjects.POShare) AS Budget, SUM(TblOutputActivities.OwnShare + TblOutputActivities.POShare) AS Planned, SUM(TblOutputActivities.Expenditures) AS Expenditures FROM TblOutputActivities INNER JOIN tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID GROUP BY tblProjects.ProjCode"));

                            context.Response.Write(Fn.HTMLTable(@"SELECT  ISNULL( Budget,'0') Budget, ISNULL(Planned,'0') as Planned, ISNULL(Expenditures,'') AS Expenditures
FROM            (SELECT        tblProjects.ProjCode, SUM(tblProjects.OwnShare + tblProjects.POShare) AS Budget, SUM(TblOutputActivities.OwnShare + TblOutputActivities.POShare) AS Planned, SUM(TblOutputActivities.Expenditures) 
                         AS Expenditures
FROM            TblOutputActivities INNER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID
GROUP BY tblProjects.ProjCode) AS T"));
                            break;
                        case 721:
                            context.Response.Write(Fn.HTMLTable(@"SELECT  ProjCode, ISNULL(Budget,'0') Budget, ISNULL(Planned,'0')Planned, ISNULL(Expenditures,'0') Expenditures FROM            (SELECT        tblProjects.ProjCode, SUM(tblProjects.OwnShare + tblProjects.POShare) AS Budget, SUM(TblOutputActivities.OwnShare + TblOutputActivities.POShare) AS Planned, SUM(TblOutputActivities.Expenditures) 
                         AS Expenditures, tblProjects.ProjectID
FROM            TblOutputActivities RIGHT OUTER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID
GROUP BY tblProjects.ProjCode, tblProjects.ProjectID  HAVING         (tblProjects.ProjectID = " + dataID[1] + ")) AS T"));
                            break;
                        case 71:
                            // context.Response.Write(Fn.HTMLTable("SELECT tblProjects.ProjCode AS Project, SUM(TblOutputActivities.Target) AS Target, SUM(TblOutputActivities.Achived) AS Achived FROM TblOutputActivities INNER JOIN tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID GROUP BY tblProjects.ProjCode")); break;
                            context.Response.Write(Fn.HTMLTable(@"SELECT        ISNULL(tblProjects.ProjCode,'') AS Project, ISNULL(SUM(TblOutputActivities.Target),'0') AS Target, ISNULL(SUM(TblOutputActivities.Achived),'') AS Achived
FROM            TblOutputActivities RIGHT OUTER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID
GROUP BY tblProjects.ProjCode")); break;
                        case 711:
                            context.Response.Write(Fn.HTMLTable("SELECT tblProjects.ProjCode AS Project, SUM(TblOutputActivities.Target) AS Target, SUM(TblOutputActivities.Achived) AS Achived FROM TblOutputActivities INNER JOIN tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID GROUP BY tblProjects.ProjCode HAVING        (tblProjects.ProjectID = " + dataID[1] + ")")); break;


                        case 73:
                            //context.Response.Write(Fn.HTMLTable("CrossTab 'SELECT District, Budget, Title FROM VW_Dashbord','District','sum(Budget)[]',N'Title',NULL,',1,1'")); 

                            context.Response.Write(Fn.HTMLTable(@"CrossTab

'Select Top(100) Percent * from (



SELECT     TblDistrict.LocName AS District,   ISNULL(SUM(tblProjects.OwnShare + tblProjects.POShare),0) AS Budget, ''Budget'' AS Title
FROM            TblOutputActivities INNER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID INNER JOIN
                         TblTehsil ON TblOutputActivities.LocID = TblTehsil.TehsilID INNER JOIN
                         TblDistrict ON TblTehsil.DistrictID = TblDistrict.DistrictID
GROUP BY TblDistrict.LocName




UNION
SELECT        TblDistrict.LocName AS District, ISNULL(SUM(TblOutputActivities.OwnShare + TblOutputActivities.POShare),0) AS Planned, ''Planned'' AS Title
FROM            TblDistrict INNER JOIN
                         TblTehsil ON TblDistrict.DistrictID = TblTehsil.DistrictID INNER JOIN
                         TblOutputActivities INNER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID ON TblTehsil.TehsilID = TblOutputActivities.LocID
GROUP BY TblDistrict.LocName



UNION



SELECT        TblDistrict.LocName AS District, ISNULL( SUM(TblOutputActivities.Expenditures), 0) AS Expenditures, ''Expenditures'' AS Title
FROM            TblDistrict INNER JOIN
                         TblTehsil ON TblDistrict.DistrictID = TblTehsil.DistrictID INNER JOIN
                         TblOutputActivities INNER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID ON TblTehsil.TehsilID = TblOutputActivities.LocID
GROUP BY TblDistrict.LocName
) as T','District','sum(Budget)[]',N'Title',NULL,',1,1'"));
                            break;

                        case 731:
                            //  context.Response.Write(Fn.HTMLTable("CrossTab 'SELECT District, Budget, Title FROM VW_Dashbord','District','sum(Budget)[]',N'Title',NULL,',1,1'"));


                            context.Response.Write(Fn.HTMLTable(@"CrossTab

'Select Top(100) Percent * from (



Select T.District, T.Budget, T.Title from (

SELECT        TblDistrict.LocName AS District, ISNULL(SUM(tblProjects.OwnShare + tblProjects.POShare), 0) AS Budget, ''Budget'' AS Title, tblProjects.ProjectID
FROM            TblOutputActivities INNER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID INNER JOIN
                         TblTehsil ON TblOutputActivities.LocID = TblTehsil.TehsilID INNER JOIN
                         TblDistrict ON TblTehsil.DistrictID = TblDistrict.DistrictID
GROUP BY TblDistrict.LocName, tblProjects.ProjectID




UNION
SELECT        TblDistrict.LocName AS District, ISNULL(SUM(TblOutputActivities.OwnShare + TblOutputActivities.POShare), 0) AS Planned, ''Planned'' AS Title, tblProjects.ProjectID
FROM            TblDistrict INNER JOIN
                         TblTehsil ON TblDistrict.DistrictID = TblTehsil.DistrictID INNER JOIN
                         TblOutputActivities INNER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID ON TblTehsil.TehsilID = TblOutputActivities.LocID
GROUP BY TblDistrict.LocName, tblProjects.ProjectID



UNION



SELECT        TblDistrict.LocName AS District, ISNULL(SUM(TblOutputActivities.Expenditures), 0) AS Expenditures, ''Expenditures'' AS Title, tblProjects.ProjectID
FROM            TblDistrict INNER JOIN
                         TblTehsil ON TblDistrict.DistrictID = TblTehsil.DistrictID INNER JOIN
                         TblOutputActivities INNER JOIN
                         tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID ON TblTehsil.TehsilID = TblOutputActivities.LocID
GROUP BY TblDistrict.LocName, tblProjects.ProjectID


) as T WHERE T.ProjectID=" + dataID[1] + @"



) as TT','District','sum(Budget)[]',N'Title',NULL,',1,1'"));


                            break;
                        case 74:
                            context.Response.Write(Fn.HTMLTable("SELECT tblDataIndicators.SubInd AS Title, SUM(tblRSPsData.Vals) AS COs FROM tblRSPsData INNER JOIN tblDataIndicators ON tblRSPsData.IndicatID = tblDataIndicators.dIndicatID WHERE (tblDataIndicators.dIndicatID IN (1, 2, 3)) GROUP BY tblDataIndicators.SubInd")); break;

                        case 741:
                            context.Response.Write(Fn.HTMLTable("SELECT tblDataIndicators.SubInd AS Title, SUM(tblRSPsData.Vals) AS COs FROM tblRSPsData INNER JOIN tblDataIndicators ON tblRSPsData.IndicatID = tblDataIndicators.dIndicatID) GROUP BY tblDataIndicators.SubInd")); break;

                        case 75:
                            context.Response.Write(Fn.HTMLTable("sp_ProjGIS2 'Sub_Activity','Sub_Activity as Activity,sum(Target) as Target,sum(Achived) as Achived',' where VillageID=" + dataID[1] + "'")); break;
                        case 76:
                            context.Response.Write(Fn.HTMLTable("SELECT 'Expenditures' AS Title, SUM(Expenditures) AS [Budget vs Expenditures] FROM TblOutputActivities WHERE (VillageID = " + dataID[1] + ") Union SELECT 'Budget' AS Title, SUM(OwnShare + POShare) AS Exp FROM TblOutputActivities WHERE (VillageID = " + dataID[1] + ")")); break;
                        case 77:
                            context.Response.Write(Fn.HTMLTable("sp_ProjGIS2 'BenType','BenType,sum(BenValue) as [Beneficiaries]',' where VillageID=" + dataID[1] + "'")); break;
                        case 78:
                            context.Response.Write(Fn.Data2Json("SELECT tblProjects.ProjCode, tblProjects.ProjTitle, tblProjects.ProjectID FROM tblProjects INNER JOIN tblProjectIPs ON tblProjects.ProjectID = tblProjectIPs.ProjectID WHERE (CONVERT(varchar, tblProjectIPs.PO_ID) LIKE '" + dataID[1] + "') GROUP BY tblProjects.ProjCode, tblProjects.ProjTitle, tblProjects.ProjectID"));
                            break;
                        case 79:
                            context.Response.Write(Fn.Data2Json("SELECT RptTitle, mDate, FMonitID FROM tblFieldMonitoringHDR WHERE (ProjectID = " + dataID[1] + ") ORDER BY mDate DESC"));
                            break;
                        case 80:
                            context.Response.Write(Fn.Data2Json("SELECT tblFieldMonitoringHDR.FMonitID, tblFieldMonitoringHDR.RptTitle, tblFieldMonitoringHDR.mDate, tblFieldMonitoringHDR.Male, tblFieldMonitoringHDR.Female, tblFieldMonitoringHDR.Created, tblFieldMonitoringHDR.Modify, tblProjects.ProjCode, tblProjects.ProjTitle, tblPartnerOrgs.PO_Name,  TblLocation.LocName AS Village, TblLocation_1.LocName AS FU FROM tblFieldMonitoringHDR INNER JOIN tblProjects ON tblFieldMonitoringHDR.ProjectID = tblProjects.ProjectID INNER JOIN tblPartnerOrgs ON tblFieldMonitoringHDR.PO_ID = tblPartnerOrgs.PO_ID INNER JOIN TblLocation ON tblFieldMonitoringHDR.VillageID = TblLocation.LocID INNER JOIN TblLocation AS TblLocation_1 ON tblFieldMonitoringHDR.FUID = TblLocation_1.LocID WHERE (tblFieldMonitoringHDR.FMonitID = " + dataID[1] + ")"));
                            break;
                        case 82:
                            context.Response.Write(Fn.Data2Json("select SecID,SecTitle from TblSectors"));
                            break;
                        case 83:
                            context.Response.Write(Fn.Data2Json("SELECT CO_Type FROM tblCommunityOrgs GROUP BY CO_Type"));
                            break;
                        case 84:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_ProCurrency()")[0]);
                            break;

                        case 87:
                            context.Response.Write(Fn.HTMLTable("SELECT tblProjects.ProjCode, SUM(tblProjects.OwnShare + tblProjects.POShare) AS Budget, SUM(TblOutputActivities.OwnShare +TblOutputActivities.POShare) AS Planned,SUM(TblOutputActivities.Expenditures) AS Expenditures FROM TblOutputActivities INNER JOIN tblProjects ON TblOutputActivities.ProjectID = tblProjects.ProjectID GROUP BY tblProjects.ProjCode, tblProjects.ProjectID Having tblProjects.ProjectID =2"));
                            break;


                        case 88:
                            context.Response.Write(Fn.HTMLTable(@"CrossTAB

'SELECT        LocName, ISNULL(Total,0) Total, Title
FROM            (SELECT        TblProvince.LocName, TblProvince.ProvinceID, COUNT(TblDistrict.LocName) AS Total, ''District'' AS Title
                          FROM            TblProvince INNER JOIN
                                                    TblRegion ON TblProvince.ProvinceID = TblRegion.ProvinceID INNER JOIN
                                                    TblDistrict ON TblRegion.RegionID = TblDistrict.RegionID
                          GROUP BY TblProvince.LocName, TblProvince.ProvinceID
                          UNION
                          SELECT        TblProvince_1.LocName, TblProvince_1.ProvinceID, COUNT(tblPartnerOrgs.PO_Abrv) AS Total, ''RSPs'' AS Title
                          FROM            tblPartnerOrgs INNER JOIN
                                                   tblProjectIPs ON tblPartnerOrgs.PO_ID = tblProjectIPs.PO_ID INNER JOIN
                                                   tblProjectLocations ON tblProjectIPs.ProjectID = tblProjectLocations.ProjectID INNER JOIN
                                                   TblDistrict AS TblDistrict_1 ON tblProjectLocations.LocID = TblDistrict_1.DistrictID INNER JOIN
                                                   TblRegion AS TblRegion_1 ON TblDistrict_1.RegionID = TblRegion_1.RegionID INNER JOIN
                                                   TblProvince AS TblProvince_1 ON TblRegion_1.ProvinceID = TblProvince_1.ProvinceID
                          WHERE        (tblPartnerOrgs.PO_Type = 1)
                          GROUP BY TblProvince_1.LocName, TblProvince_1.ProvinceID) AS T


						  ','LocName','sum(Total)[]',N'Title',NULL,',1,1'"));

                            break;


                        case 881:
                            context.Response.Write(Fn.HTMLTable(@"CrossTAB

'SELECT        LocName, ISNULL(Total,0) Total, Title
FROM            (SELECT        TblProvince.LocName, TblProvince.ProvinceID, COUNT(TblDistrict.LocName) AS Total, ''District'' AS Title
                          FROM            TblProvince INNER JOIN
                                                    TblRegion ON TblProvince.ProvinceID = TblRegion.ProvinceID INNER JOIN
                                                    TblDistrict ON TblRegion.RegionID = TblDistrict.RegionID
                          GROUP BY TblProvince.LocName, TblProvince.ProvinceID
                          UNION
                          SELECT        TblProvince_1.LocName, TblProvince_1.ProvinceID, COUNT(tblPartnerOrgs.PO_Abrv) AS Total, ''RSPs'' AS Title
                          FROM            tblPartnerOrgs INNER JOIN
                                                   tblProjectIPs ON tblPartnerOrgs.PO_ID = tblProjectIPs.PO_ID INNER JOIN
                                                   tblProjectLocations ON tblProjectIPs.ProjectID = tblProjectLocations.ProjectID INNER JOIN
                                                   TblDistrict AS TblDistrict_1 ON tblProjectLocations.LocID = TblDistrict_1.DistrictID INNER JOIN
                                                   TblRegion AS TblRegion_1 ON TblDistrict_1.RegionID = TblRegion_1.RegionID INNER JOIN
                                                   TblProvince AS TblProvince_1 ON TblRegion_1.ProvinceID = TblProvince_1.ProvinceID
                          WHERE        (tblPartnerOrgs.PO_Type = 1)
                          GROUP BY TblProvince_1.LocName, TblProvince_1.ProvinceID) AS T 
where T.ProvinceID = " + dataID[1] + @"

						  ','LocName','sum(Total)[]',N'Title',NULL,',1,1'"));

                            break;





                        case 89:

                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSPOCIID, tblSPID, strOI, strOIDescription, dtDateEntered, tblTblHResourcesID
                            //FROM            tblSPOCI
                            //WHERE        (tblSPID = " + dataID[1] + ")"));


                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSPOCIID, strOI strOutcomeIndicatorNo,  strOIDescription strOutComeIndicatorTxt, tblSPID, 'Outcome Indicator '+ strOI +' - '+ strOIDescription as strOI, strOIDescription, dtDateEntered, tblTblHResourcesID
FROM            tblSPOCI
WHERE        (tblSPID = " + dataID[1] + ") AND (tblSPOCID = " + dataID[2] + ")"));
                            break;



                        case 891:

                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSPOCIID, tblSPID, strOI, strOIDescription, dtDateEntered, tblTblHResourcesID
                            //FROM            tblSPOCI
                            //WHERE        (tblSPID = " + dataID[1] + ")"));


                            context.Response.Write(Fn.Data2Json(@"SELECT        tblNSPOCIID, strOI strOutcomeIndicatorNo,  strOIDescription strOutComeIndicatorTxt, tblNSPID, 'Outcome Indicator '+ strOI +' - '+ strOIDescription as strOI, strOIDescription, dtDateEntered, tblTblHResourcesID
FROM            tblNSPOCI
WHERE        (tblNSPID = " + dataID[1] + ") AND (tblNSPOCID = " + dataID[2] + ")"));
                            break;
                        case 90:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSPOP, tblSPID, strOP strOutPutNo, strOIDescription strOutputTxt, 'Output '+ strOP +' Indicators - '+strOIDescription as strOP, strOIDescription, dtDateEntered, tblTblHResourcesID
FROM            tblSPOP
WHERE        (tblSPID = " + dataID[1] + ") AND (tblSPOCID = " + dataID[2] + ")"));

                            break;
                        case 901:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblNSPOP, tblNSPID, strOP strOutPutNo, strOIDescription strOutputTxt, 'Output '+ strOP +' Indicators - '+strOIDescription as strOP, strOIDescription, dtDateEntered, tblTblHResourcesID
FROM            tblNSPOP
WHERE        (tblNSPID = " + dataID[1] + ") AND (tblNSPOCID = " + dataID[2] + ")"));

                            break;

                        case 91:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblCPAPOCID, strOC + ' ' + strOCDescription AS strOCs, dtDateEntered, tblTblHResourcesID, tblSPOCID, strOC, strOCDescription, tblSPOPID, tblCPAPID
FROM            tblCPAPOC
WHERE        (tblCPAPID = " + dataID[1] + ") Order by strOC "));
                            break;

                        case 92:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblCPAPOPID, strOP +' '+ strOPDescription strOPs, dtDateEntered, tblTblHResourcesID, tblCPAPOCID
FROM            tblCPAPOP
WHERE        (tblCPAPOCID = " + dataID[1] + ") Order by strOP "));
                            break;



                        case 93:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOCID, strOC + ' ' + strOCDescription AS strOCs, dtDateEntered, tblTblHResourcesID, tblCPAPOCID, tblProjectsID
FROM            tblPOC
WHERE        (tblCPAPOCID = " + dataID[1] + ") AND (tblProjectsID = " + dataID[2] + ") Order by strOC"));
                            break;


                        case 94:

                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOPID,strOP,strOPDescription, strOP +' '+ strOPDescription strOPs, dtDateEntered, tblTblHResourcesID, tblProjectsID
                            //FROM            tblPOP
                            //WHERE        (tblpid is not null and tblProjectsID = " + dataID[1] + " AND ForYear =" + dataID[2] + ") Order by strOP "));

                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOP.tblPOPID, tblPOP.strOP, tblPOP.strOPDescription, tblPOP.strOP + ' ' + tblRRFOutput.strOPDescription AS strOPs, tblPOP.dtDateEntered, tblPOP.tblTblHResourcesID, tblPOP.tblProjectsID
                            //                         
                            //FROM            tblPOP INNER JOIN
                            //                         tblRRFOutput ON tblPOP.tblRRFOutputID = tblRRFOutput.tblRRFOutputID
                            //                            WHERE        (tblPOP.tblpid is not null and tblPOP.tblProjectsID = " + dataID[1] + " AND tblPOP.ForYear =" + dataID[2] + ") Order by strOP "));


                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOP.tblPOPID, tblPOP.strOP + ' ' + tblRRFOutput.strOPDescription AS strOPs, tblPOP.dtDateEntered, tblPOP.tblTblHResourcesID, tblPOP.tblProjectsID, tblRRFOutput.strOP, tblRRFOutput.strOPDescription, 
                         tblPOP.strRisk, tblPOP.strAssumption
FROM            tblPOP INNER JOIN
                         tblRRFOutput ON tblPOP.tblRRFOutputID = tblRRFOutput.tblRRFOutputID
                            WHERE        (tblPOP.tblpid is not null and tblPOP.tblProjectsID = " + dataID[1] + " AND tblPOP.ForYear =" + dataID[2] + ") Order by strOP "));

                            break;



                        case 95:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblCPAPOC_IndID, strOCInd + ' ' + strOC_IndDescription AS strOPs, dtDateEntered, tblTblHResourcesID, tblCPAPOCID, strOCInd
FROM            tblCPAPOC_Ind
WHERE        (tblCPAPOCID = " + dataID[1] + ") Order by strOCInd  "));
                            break;


                        case 96:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblCPAPOPindID, strOP +' '+ strOPDescription strOPs, dtDateEntered, tblTblHResourcesID, tblCPAPOPID
FROM            tblCPAPOPind
WHERE        (tblCPAPOPID = " + dataID[1] + ") Order by strOP "));
                            break;


                        case 97:

                            string ssssssssssss = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','");


                            Fn.Exec("sp_CreateProjectUNDP '" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'");
                            break;

                        case 98:
                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblProjects.ProjCode, tblProjects.ProjTitle, tblProjects.ProjectID, tblProjects.StartDate, tblProjects.EndDate, ISNULL(tblCPAPOP.strOP, '') + ' ' + ISNULL(tblCPAPOP.strOPDescription, '') AS CPAPOP, 
                            //                         ISNULL(tblCPAPOC.strOC, '') + ' ' + ISNULL(tblCPAPOC.strOCDescription, '') AS CPAPOC, ISNULL(tblSPOP.strOP, '') + ' ' + ISNULL(tblSPOP.strOIDescription, '') AS SPOP, ISNULL(tblSPOC.strOutComeNo, '') 
                            //                         + ' ' + ISNULL(tblSPOC.strDescription, '') AS SPOC, 'Stratigic Plan for : ' + CAST(DATEPART(YYYY, tblSP.dtFrom) AS VARCHAR(50)) + ' - ' + RIGHT(CAST(DATEPART(YYYY, tblSP.dtTo) AS VARCHAR(50)), 2) AS SP, 
                            //                         tblSP.tblSPID
                            //FROM            tblProjects INNER JOIN
                            //                         tblCPAPOP ON tblProjects.tblCPAPOPID = tblCPAPOP.tblCPAPOPID INNER JOIN
                            //                         tblCPAPOC ON tblCPAPOP.tblCPAPOCID = tblCPAPOC.tblCPAPOCID INNER JOIN
                            //                         tblSPOP ON tblCPAPOC.tblSPOPID = tblSPOP.tblSPOP INNER JOIN
                            //                         tblSPOC ON tblSPOP.tblSPOCID = tblSPOC.tblSPOCID INNER JOIN
                            //                         tblSP ON tblSPOC.tblSPID = tblSP.tblSPID

                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblProjects.ProjCode, tblProjects.ProjTitle, tblProjects.ProjectID, Convert(varchar(50),tblProjects.StartDate,103) as StartDate, Convert(varchar(50),tblProjects.EndDate,103) EndDate, ISNULL(tblCPAPOP.strOP, '') + ' ' + ISNULL(tblCPAPOP.strOPDescription, '') AS CPAPOP, 
                            //                         ISNULL(tblCPAPOC.strOC, '') + ' ' + ISNULL(tblCPAPOC.strOCDescription, '') AS CPAPOC, ISNULL(tblSPOP.strOP, '') + ' ' + ISNULL(tblSPOP.strOIDescription, '') AS SPOP, ISNULL(tblSPOC.strOutComeNo, '') 
                            //                         + ' ' + ISNULL(tblSPOC.strDescription, '') AS SPOC, 'Stratigic Plan for : ' + CAST(DATEPART(YYYY, tblSP.dtFrom) AS VARCHAR(50)) + ' - ' + RIGHT(CAST(DATEPART(YYYY, tblSP.dtTo) AS VARCHAR(50)), 2) AS SP, 
                            //                         tblSP.tblSPID
                            //FROM            tblProjects INNER JOIN
                            //                         tblCPAPOP ON tblProjects.tblCPAPOPID = tblCPAPOP.tblCPAPOPID INNER JOIN
                            //                         tblCPAPOC ON tblCPAPOP.tblCPAPOCID = tblCPAPOC.tblCPAPOCID INNER JOIN
                            //                         tblSPOP ON tblCPAPOC.tblSPOPID = tblSPOP.tblSPOP INNER JOIN
                            //                         tblSPOC ON tblSPOP.tblSPOCID = tblSPOC.tblSPOCID INNER JOIN
                            //                         tblSP ON tblSPOC.tblSPID = tblSP.tblSPID


                            context.Response.Write(Fn.Data2Json(@"SELECT   tblProjects.ProjAward_ID,     tblProjects.ProjCode, tblProjects.ProjTitle, tblProjects.ProjectID, CONVERT(varchar(50), tblProjects.StartDate, 103) AS StartDate, CONVERT(varchar(50), tblProjects.EndDate, 103) AS EndDate, 
                         ISNULL(tblCPAPOP.strOP, '') + ' ' + ISNULL(tblCPAPOP.strOPDescription, '') AS CPAPOP, ISNULL(tblCPAPOC.strOC, '') + ' ' + ISNULL(tblCPAPOC.strOCDescription, '') AS CPAPOC, ISNULL(tblSPOP.strOP, '') 
                         + ' ' + ISNULL(tblSPOP.strOIDescription, '') AS SPOP, ISNULL(tblSPOC.strOutComeNo, '') + ' ' + ISNULL(tblSPOC.strDescription, '') AS SPOC, 'Stratigic Plan for : ' + CAST(DATEPART(YYYY, tblSP.dtFrom) 
                         AS VARCHAR(50)) + ' - ' + RIGHT(CAST(DATEPART(YYYY, tblSP.dtTo) AS VARCHAR(50)), 2) AS SP, tblSP.tblSPID, tblCPAP.tblCPAPID, 'CPAP for : ' + CAST(DATEPART(YYYY, tblCPAP.dtFrom) AS VARCHAR(50)) 
                         + ' - ' + RIGHT(CAST(DATEPART(YYYY, tblCPAP.dtTo) AS VARCHAR(50)), 2) AS CPAP, ISNULL(Website_User_1.EMP_Prefix, '') + ' ' + ISNULL(Website_User_1.EF_Name, '') + ' (' + ISNULL(Website_User_1.Email, '') 
                         + ')' AS ProgOfficer, ISNULL(Website_User.EMP_Prefix, '') + ' ' + ISNULL(Website_User.EF_Name, '') + ' (' + ISNULL(Website_User.Email, '') + ')' AS ProjManager, ISNULL(Website_User_2.EMP_Prefix, '') 
                         + ' ' + ISNULL(Website_User_2.EF_Name, '') + ' (' + ISNULL(Website_User_2.Email, '') + ')' AS UnitHead, tblProjects.ThemeticArea AS Unit
FROM            tblSPOC INNER JOIN
                         tblSPOP ON tblSPOC.tblSPOCID = tblSPOP.tblSPOCID INNER JOIN
                         tblSP ON tblSPOC.tblSPID = tblSP.tblSPID INNER JOIN
                         tblProjects INNER JOIN
                         tblCPAPOP ON tblProjects.tblCPAPOPID = tblCPAPOP.tblCPAPOPID INNER JOIN
                         tblCPAPOC ON tblCPAPOP.tblCPAPOCID = tblCPAPOC.tblCPAPOCID ON tblSPOP.tblSPOP = tblProjects.tblSPOPID INNER JOIN
                         tblCPAP ON tblCPAPOC.tblCPAPID = tblCPAP.tblCPAPID INNER JOIN
                         Website_User AS Website_User_1 ON tblProjects.ProgramOfficerID = Website_User_1.Emp_Id INNER JOIN
                         Website_User ON tblProjects.ProjectManagerID = Website_User.Emp_Id INNER JOIN
                         Website_User AS Website_User_2 ON tblProjects.UnitHead = Website_User_2.Emp_Id
 WHERE (ProjectID = " + dataID[1] + ")"));
                            break;





                        case 99:

                            context.Response.Write(Fn.Data2Json(@"SELECT      tblPOPActivityID , ISNULL(strActivityNo,'') +' '+ ISNULL(strActivityDescription,'') Display
FROM            tblPOPActivity
WHERE        (tblPOPID = " + dataID[1] + " ) Order by Display "));
                            break;




                        case 100:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOPID,strOP,strOPDescription, strOP +' '+ strOPDescription strOPs, dtDateEntered, tblTblHResourcesID, tblProjectsID
FROM            tblPOP
WHERE        (tblProjectsID = " + dataID[1] + " AND ForYear =" + dataID[2] + ") Order by strOP "));
                            break;



                        case 101:
                            context.Response.Write(Fn.Data2Json("SELECT ProjCode, ProjTitle, ProjectID FROM  tblProjects WHERE (ThemeticArea = '" + dataID[1] + "')"));
                            break;


                        case 102:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblCPAPOP.tblCPAPOPID, ISNULL(tblCPAPOP.strOP,'') + ' '+ ISNULL(tblCPAPOP.strOPDescription,'') CPAPOUTPUT, tblCPAPOC.tblCPAPOCID, ISNULL(tblCPAPOC.strOC,'') +' '+ ISNULL(tblCPAPOC.strOCDescription,'') AS CPAPOUTCOME
FROM            tblProjects INNER JOIN
                         tblCPAPOP ON tblProjects.tblCPAPOPID = tblCPAPOP.tblCPAPOPID INNER JOIN
                         tblCPAPOC ON tblCPAPOP.tblCPAPOCID = tblCPAPOC.tblCPAPOCID
WHERE        (tblProjects.ProjectID = " + dataID[1] + ")"));
                            break;

                        case 103:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSP_Outcome_Output_Indicator_Component.tblSP_Outcome_Output_Indicator_Component_ID, tblSP_Outcome_Output_Indicator_Component.strCode, 
                         tblSP_Outcome_Output_Indicator_Component.strIndicatorComponent, tblSP_Outcome_Output_Indicator_Component.SourceBaseline, tblSP_Outcome_Output_Indicator_Component.ReportingTime, 
                         tblSP_Outcome_Output_Indicator_Component.Planed_Baseline, tblSP_Outcome_Output_Indicator_Component.Actual_Baseline, tblSP_Outcome_Output_Indicator_Component.Planed_2014, 
                         tblSP_Outcome_Output_Indicator_Component.Actual_2014, tblSP_Outcome_Output_Indicator_Component.Planed_2015, tblSP_Outcome_Output_Indicator_Component.Actual_2015, 
                         tblSP_Outcome_Output_Indicator_Component.Planed_2016, tblSP_Outcome_Output_Indicator_Component.Actual_2016, tblSP_Outcome_Output_Indicator_Component.Planed_2017, 
                         tblSP_Outcome_Output_Indicator_Component.Actual_2017, tblSP_Outcome_Output_Indicator_Component.Footnotes, tblSP_Outcome_Output_Indicator_Component.Projects
FROM            tblSPOP INNER JOIN
                         tblSPOP_Indicator ON tblSPOP.tblSPOP = tblSPOP_Indicator.tblSPOPID INNER JOIN
                         tblSP_Outcome_Output_Indicator_Component ON tblSPOP_Indicator.tblSPOP_IndicatorID = tblSP_Outcome_Output_Indicator_Component.ParentID
WHERE         (tblSP_Outcome_Output_Indicator_Component.Type = '" + dataID[2] + "') and (tblSPOP.tblSPOP = " + dataID[1] + ")"));
                            break;

                        case 1031:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblNSP_Outcome_Output_Indicator_Component.tblNSP_Outcome_Output_Indicator_Component_ID, tblNSP_Outcome_Output_Indicator_Component.strCode, 
                         tblNSP_Outcome_Output_Indicator_Component.strIndicatorComponent, tblNSP_Outcome_Output_Indicator_Component.SourceBaseline, tblNSP_Outcome_Output_Indicator_Component.ReportingTime, 
                         tblNSP_Outcome_Output_Indicator_Component.Planed_Baseline, tblNSP_Outcome_Output_Indicator_Component.Actual_Baseline, tblNSP_Outcome_Output_Indicator_Component.Planed_2014, 
                         tblNSP_Outcome_Output_Indicator_Component.Actual_2014, tblNSP_Outcome_Output_Indicator_Component.Planed_2015, tblNSP_Outcome_Output_Indicator_Component.Actual_2015, 
                         tblNSP_Outcome_Output_Indicator_Component.Planed_2016, tblNSP_Outcome_Output_Indicator_Component.Actual_2016, tblNSP_Outcome_Output_Indicator_Component.Planed_2017, 
                         tblNSP_Outcome_Output_Indicator_Component.Actual_2017, tblNSP_Outcome_Output_Indicator_Component.Footnotes, tblNSP_Outcome_Output_Indicator_Component.Projects, 
                         tblNSP_Outcome_Output_Indicator_Component.Planed_2013, tblNSP_Outcome_Output_Indicator_Component.Actual_2013
FROM            tblNSPOP INNER JOIN
                         tblNSPOP_Indicator ON tblNSPOP.tblNSPOP = tblNSPOP_Indicator.tblNSPOPID INNER JOIN
                         tblNSP_Outcome_Output_Indicator_Component ON tblNSPOP_Indicator.tblNSPOP_IndicatorID = tblNSP_Outcome_Output_Indicator_Component.ParentID
WHERE         (tblNSP_Outcome_Output_Indicator_Component.Type = '" + dataID[2] + "') and (tblNSPOP.tblNSPOP = " + dataID[1] + ")"));
                            break;

                        case 104:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblSP_Outcome_Output_Indicator_Component.tblSP_Outcome_Output_Indicator_Component_ID, tblSP_Outcome_Output_Indicator_Component.strCode, 
                         tblSP_Outcome_Output_Indicator_Component.strIndicatorComponent, tblSP_Outcome_Output_Indicator_Component.SourceBaseline, tblSP_Outcome_Output_Indicator_Component.ReportingTime, 
                         tblSP_Outcome_Output_Indicator_Component.Planed_Baseline, tblSP_Outcome_Output_Indicator_Component.Actual_Baseline, tblSP_Outcome_Output_Indicator_Component.Planed_2014, 
                         tblSP_Outcome_Output_Indicator_Component.Actual_2014, tblSP_Outcome_Output_Indicator_Component.Planed_2015, tblSP_Outcome_Output_Indicator_Component.Actual_2015, 
                         tblSP_Outcome_Output_Indicator_Component.Planed_2016, tblSP_Outcome_Output_Indicator_Component.Actual_2016, tblSP_Outcome_Output_Indicator_Component.Planed_2017, 
                         tblSP_Outcome_Output_Indicator_Component.Actual_2017, tblSP_Outcome_Output_Indicator_Component.Footnotes, tblSP_Outcome_Output_Indicator_Component.Projects
FROM            tblSP_Outcome_Output_Indicator_Component INNER JOIN
                         tblSPOCI ON tblSP_Outcome_Output_Indicator_Component.ParentID = tblSPOCI.tblSPOCIID
WHERE        (tblSP_Outcome_Output_Indicator_Component.Type = '" + dataID[2] + "') AND (tblSPOCI.tblSPOCIID = " + dataID[1] + ")"));
                            break;


                        case 1041:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblNSP_Outcome_Output_Indicator_Component.tblNSP_Outcome_Output_Indicator_Component_ID, tblNSP_Outcome_Output_Indicator_Component.strCode, 
                         tblNSP_Outcome_Output_Indicator_Component.strIndicatorComponent, tblNSP_Outcome_Output_Indicator_Component.SourceBaseline, tblNSP_Outcome_Output_Indicator_Component.ReportingTime, 
                         tblNSP_Outcome_Output_Indicator_Component.Planed_Baseline, tblNSP_Outcome_Output_Indicator_Component.Actual_Baseline, tblNSP_Outcome_Output_Indicator_Component.Planed_2014, 
                         tblNSP_Outcome_Output_Indicator_Component.Actual_2014, tblNSP_Outcome_Output_Indicator_Component.Planed_2015, tblNSP_Outcome_Output_Indicator_Component.Actual_2015, 
                         tblNSP_Outcome_Output_Indicator_Component.Planed_2016, tblNSP_Outcome_Output_Indicator_Component.Actual_2016, tblNSP_Outcome_Output_Indicator_Component.Planed_2017, 
                         tblNSP_Outcome_Output_Indicator_Component.Actual_2017, tblNSP_Outcome_Output_Indicator_Component.Footnotes, tblNSP_Outcome_Output_Indicator_Component.Projects, 
                         tblNSP_Outcome_Output_Indicator_Component.Planed_2013, tblNSP_Outcome_Output_Indicator_Component.Actual_2013
FROM            tblNSP_Outcome_Output_Indicator_Component INNER JOIN
                         tblNSPOCI ON tblNSP_Outcome_Output_Indicator_Component.ParentID = tblNSPOCI.tblNSPOCIID
WHERE        (tblNSP_Outcome_Output_Indicator_Component.Type = '" + dataID[2] + "') AND (tblNSPOCI.tblNSPOCIID = " + dataID[1] + ")"));
                            break;
                        case 105:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblCPAPOCID, strOC+' '+strOCDescription strOCs, dtDateEntered, tblTblHResourcesID, tblSPOCID
FROM            tblCPAPOC
Order by strOC "));
                            break;





                        case 106:
                            // context.Response.Write(Fn.ExenID("INSERT INTO TblOutputActivities(Activity, Sub_Activity, StartDate, EndDate,ActvType,LocID,UCID,VillageID, PO_ID,Budget,  Responsible, Target, OwnShare, POShare, Note, ProjectID, OutputIndID,Created) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'+convert(varchar,getdate()))"));

                            //                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblCPAPOPind_BaseLine
                            //                         (tblCPAPOPindID, strBaseLineText)
                            //VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") +"')"
                            //           ));


                            string[] dtval = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Split('ǁ');
                            //context.Response.Write(Fn.Exec("UPDATE TblOutputActivities SET Activity = '" + dta[0] + "', Sub_Activity = '" + dta[1] + "', StartDate = '" + dta[2] + "', EndDate = '" + dta[3] + "', ActvType = '" + dta[4] + "', LocID = '" + dta[5] + "', UCID = '" + dta[6] + "', VillageID = '" + dta[7] + "', PO_ID = '" + dta[8] + "', Budget = '" + dta[9] + "', Responsible = '" + dta[10] + "', Target = '" + dta[11] + "', OwnShare = '" + dta[12] + "', POShare = '" + dta[13] + "', Note = '" + dta[14] + "',  Modif = '" + dta[15] + "'+convert(varchar,getdate()) WHERE (OutputActivityID = '" + dta[16] + "')"));
                            //context.Response.Write(Fn.Exec("UPDATE TblOutputActivities SET Activity = '" + dtval[0] + "', Sub_Activity = '" + dtval[1] + "', StartDate = '" + dtval[2] + "', EndDate = '" + dtval[3] + "', ActvType = '" + dta[4] + "', LocID = '" + dta[5] + "', UCID = '" + dta[6] + "', VillageID = '" + dta[7] + "', PO_ID = '" + dta[8] + "', Budget = '" + dta[9] + "', Responsible = '" + dta[10] + "', Target = '" + dta[11] + "', OwnShare = '" + dta[12] + "', POShare = '" + dta[13] + "', Note = '" + dta[14] + "',  Modif = '" + dta[15] + "'+convert(varchar,getdate()) WHERE (OutputActivityID = '" + dta[16] + "')"));
                            context.Response.Write(Fn.Exec(@"UPDATE       tblCPAPOPind
SET                strBaseLineText = '" + dtval[1] + @"'
WHERE        (tblCPAPOPindID = " + dtval[0] + @")"));

                            break;

                        case 107:
                            // context.Response.Write(Fn.ExenID("INSERT INTO TblOutputActivities(Activity, Sub_Activity, StartDate, EndDate,ActvType,LocID,UCID,VillageID, PO_ID,Budget,  Responsible, Target, OwnShare, POShare, Note, ProjectID, OutputIndID,Created) VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "'+convert(varchar,getdate()))"));

                            //                            context.Response.Write(Fn.ExenID(@"INSERT INTO tblCPAPOPind_Targets
                            //                         (tblCPAPOPindID, strTargetText)
                            //VALUES ('" + Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Replace("ǁ", "','") + "')"
                            //           ));
                            string[] dt107 = Fn.CleanSQL(HttpUtility.UrlDecode(context.Request.Form.ToString())).Split('ǁ');
                            context.Response.Write(Fn.Exec(@"UPDATE       tblCPAPOPind
SET                strTargetText = '" + dt107[1] + @"'
WHERE        (tblCPAPOPindID = " + dt107[0] + @")"));
                            break;





                        case 108:

                            //                            context.Response.Write(Fn.Data2Json(@"SELECT      tblPOPActivityID , ISNULL(strActivityNo,'') +' '+ ISNULL(strActivityDescription,'') Display
                            //FROM            tblPOPActivity
                            //WHERE        (tblPOPID = " + dataID[1] + " ) Order by Display "));

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOPActivity.tblPOPActivityID, ISNULL(tblPOPActivity.strActivityNo, '') + ' ' + ISNULL(tblPOPActivity.strActivityDescription, '') AS Display, tblRRFOutputIndicatorYearlyTarget.strTargetType, 
                         tblRRFOutputIndicatorYearlyTarget.strYear, tblPOPActivity.tblPOPID
FROM            tblPOPActivity INNER JOIN
                         tblPOPTarget ON tblPOPActivity.tblPOPTargetID = tblPOPTarget.tblPOPTargetID INNER JOIN
                         tblPOPIndicator ON tblPOPTarget.tblPOPIndicatorID = tblPOPIndicator.tblPOPIndicatorID INNER JOIN
                         tblRRFOutputIndicator ON tblPOPIndicator.tblRRFOutputIndicatorID = tblRRFOutputIndicator.tblRRFOutputIndicatorID INNER JOIN
                         tblRRFOutputIndicatorYearlyTarget ON tblRRFOutputIndicator.tblRRFOutputIndicatorID = tblRRFOutputIndicatorYearlyTarget.tblRRFOutputIndicatorID
WHERE     (tblPOPActivity.tblPOPID = " + dataID[1] + ") AND   (tblRRFOutputIndicatorYearlyTarget.strYear = " + dataID[2] + ") Order by Display "));
                            break;

                        case 109:
                            //context.Response.Write(Fn.Data2Json(@"select DISTINCT strType from tblCheckList Order by strType "));
                            context.Response.Write(Fn.Data2Json(@"select DISTINCT X.strType from (
select strType, sum(Weightage) S from tblCheckList group by strType having sum(Weightage) = 100
) as X  Order by X.strType"));
                            break;


                        case 110:
                            context.Response.Write(Fn.Data2Json(@"SELECT tblCheckListID, Checklist, Evidence, CAST(Weightage AS VARCHAR(10))+'%' Weightage, Weightage as WeightageOnly
FROM            tblCheckList
WHERE listOrder!=0 and strType='" + HttpUtility.UrlDecode(dataID[1]) + @"'
ORDER BY listOrder"));
                            break;


                        case 111:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblActivityDocs.FileTitle, tblActivityDocs.FileExt, tblActivityDocs.FileID
FROM            tblActivityDocs INNER JOIN
                         tblPOPActivityAction ON tblActivityDocs.tblPOPActivityActionID = tblPOPActivityAction.tblPOPActivityActionID INNER JOIN
                         tblPOPActivity ON tblPOPActivityAction.tblPOPActivityID = tblPOPActivity.tblPOPActivityID
WHERE        (tblPOPActivity.tblPOPIndicatorID = " + dataID[1] + ")"));
                            break;


                        case 112:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblActivityDocs.FileTitle, tblActivityDocs.FileExt, tblActivityDocs.FileID, tblPOPIndicator.tblPOPID
FROM            tblActivityDocs INNER JOIN
                         tblPOPActivityAction ON tblActivityDocs.tblPOPActivityActionID = tblPOPActivityAction.tblPOPActivityActionID INNER JOIN
                         tblPOPActivity ON tblPOPActivityAction.tblPOPActivityID = tblPOPActivity.tblPOPActivityID INNER JOIN
                         tblPOPIndicator ON tblPOPActivity.tblPOPIndicatorID = tblPOPIndicator.tblPOPIndicatorID
WHERE        (tblPOPIndicator.tblPOPID = " + dataID[1] + ")"));
                            break;

                        case 113:
                            context.Response.Write(Fn.Data2Json(@"select DISTINCT strType from tblCheckList Order by strType "));
                            break;



                        case 114:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblCheckListID, strType, listOrder, Weightage, Checklist, Evidence
FROM            tblCheckList
WHERE  strType='" + HttpUtility.UrlDecode(dataID[1]) + @"'
ORDER BY listOrder"));
                            break;


                        case 115:
                            context.Response.Write(Fn.Exec("DELETE tblCheckList WHERE tblCheckListID=" + dataID[1]));
                            break;

                        case 116:
                            context.Response.Write(Fn.Exec(@"
INSERT INTO tblCheckList
                         (strType, listOrder, Checklist, Evidence, Weightage)
VALUES        ('" + HttpUtility.UrlDecode(dataID[1]) + "','" + HttpUtility.UrlDecode(dataID[2]) + "','" + HttpUtility.UrlDecode(dataID[3]) + "','" + HttpUtility.UrlDecode(dataID[4]) + "','" + HttpUtility.UrlDecode(dataID[5]) + "')"));
                            break;

                        case 117:
                            context.Response.Write(Fn.Exec("Update tblCheckList SET " + dataID[1] + "='" + dataID[2] + "' WHERE tblCheckListID=" + dataID[3]));
                            break;








                        case 118:
                            // context.Response.Write(Fn.Data2Json(@"Select  DISTINCT QType as strType from tblFAQ Order by strType "));
                            context.Response.Write(Fn.Data2Json(@"Select  DISTINCT QType as strType , ID=(Select Top 1 tblFAQID from tblFAQ where QType=x.QType  ) from tblFAQ as x Order by strType "));
                            break;
                        case 119:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblFAQID,  QType, listOrder, strQuestion, strAnswer, bIsVisible
FROM            tblFAQ
WHERE  QType='" + HttpUtility.UrlDecode(dataID[1]) + @"'
ORDER BY listOrder"));
                            break;
                        case 120:
                            context.Response.Write(Fn.Exec(@"
INSERT INTO tblFAQ
                         (QType, listOrder, strQuestion, strAnswer, bIsVisible, nEmpID)
VALUES        ('" + HttpUtility.UrlDecode(dataID[1]) + "','" + HttpUtility.UrlDecode(dataID[2]) + "','" + HttpUtility.UrlDecode(dataID[3]) + "','" + HttpUtility.UrlDecode(dataID[4]) + "','" + HttpUtility.UrlDecode(dataID[5]) + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "')"));
                            break;

                        case 121:
                            context.Response.Write(Fn.Exec("DELETE tblFAQ WHERE tblFAQID=" + dataID[1]));
                            break;
                        case 122:
                            context.Response.Write(Fn.Exec("Update tblFAQ SET " + dataID[1] + "='" + dataID[2] + "' WHERE tblFAQID=" + dataID[3]));
                            break;


                        case 123:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblFAQID,  QType, listOrder, strQuestion, strAnswer, bIsVisible , CONVERT(VARCHAR(50),dtDateTime,103) AS dtDateTime 
FROM            tblFAQ
WHERE bIsVisible=1 and  QType='" + HttpUtility.UrlDecode(dataID[1]) + @"'
ORDER BY listOrder"));
                            break;






                        case 124:

                            //                           context.Response.Write(Fn.Data2Json(@"SELECT tblPOPActivityChallengeID, tblPOPActivityID, strChallenges, strActionTaken, strLeasonLearnt, strSuggestedActionForfuture
                            //FROM            tblPOPActivityChallenge
                            //WHERE        tblPOPActivityID = '" + HttpUtility.UrlDecode(dataID[1]) + @"'
                            //ORDER BY strChallenges"));

                            context.Response.Write(Fn.Data2Json(@"SELECT DISTINCT strChallenges FROM            tblPOPActivityChallenge
WHERE        tblPOPActivityID = '" + HttpUtility.UrlDecode(dataID[1]) + @"'
ORDER BY strChallenges"));

                            break;


                        case 125:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOPActivityChallengeID, tblPOPActivityID, strChallenges, strActionTaken, strLeasonLearnt, strSuggestedActionForfuture
FROM            tblPOPActivityChallenge
WHERE        strChallenges = '" + HttpUtility.UrlDecode(dataID[1]) + @"' and tblPOPActivityID = " + dataID[2] + @"
ORDER BY strChallenges"));



                            break;

                        case 126:
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblPOPActivityChallenge
                         (tblPOPActivityID, strChallenges, strActionTaken, strLeasonLearnt, strSuggestedActionForfuture)
VALUES        (" + dataID[5] + ",'" + HttpUtility.UrlDecode(dataID[4]) + "','" + HttpUtility.UrlDecode(dataID[1]) + "','" + HttpUtility.UrlDecode(dataID[2]) + "','" + HttpUtility.UrlDecode(dataID[3]) + "')"));
                            //  " + dataID[6] + "
                            //  '" + dataID[6] + "'
                            break;
                        case 127:
                            context.Response.Write(Fn.Exec("DELETE tblPOPActivityChallenge WHERE tblPOPActivityChallengeID=" + dataID[1]));
                            break;



                        case 128:
                            context.Response.Write(Fn.Exec("Update tblPOPActivityChallenge SET " + dataID[1] + "='" + dataID[2] + "' WHERE tblPOPActivityChallengeID=" + dataID[3]));
                            break;


                        case 129:

                            context.Response.Write(Fn.Exec(@"INSERT INTO tblPOPActivityActionAttendance
                         (tblPOPActivityActionID, Name, Designation, Gender, CellNo, CNIC, Male, Female, tblActivityDocsID)
VALUES        (" + HttpUtility.UrlDecode(dataID[6]) + ",'" + HttpUtility.UrlDecode(dataID[1]) + "','" + HttpUtility.UrlDecode(dataID[2]) + "','" + HttpUtility.UrlDecode(dataID[3]) + "','" + HttpUtility.UrlDecode(dataID[4]) + "','" + HttpUtility.UrlDecode(dataID[5]) + "','0','0','0')"));
                            break;
                        case 130:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOPActivityActionAttendanceID, tblPOPActivityActionID, Name, Designation, Gender, CellNo, CNIC, Male, Female, tblActivityDocsID OutputActivityID
FROM            tblPOPActivityActionAttendance where bIsAttachment = 0 and tblPOPActivityActionID = " + dataID[1]));
                            break;


                        case 131:
                            context.Response.Write(Fn.Exec("DELETE tblPOPActivityActionAttendance WHERE tblPOPActivityActionAttendanceID=" + dataID[1]));

                            break;
                        case 132:
                            context.Response.Write(Fn.Exec("Update tblPOPActivityActionAttendance SET " + dataID[1] + "='" + dataID[2] + "' WHERE tblPOPActivityActionAttendanceID=" + dataID[3]));
                            break;


                        case 133:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOPActivityActionAttendance.tblPOPActivityActionID, tblPOPActivityActionAttendance.Male, tblPOPActivityActionAttendance.Female, totals=tblPOPActivityActionAttendance.Male+ tblPOPActivityActionAttendance.Female, tblPOPActivityActionAttendance.tblActivityDocsID, 
                         tblPOPActivityActionAttendance.bIsAttachment, tblActivityDocs.FileTitle, Fileid= CAST(tblActivityDocs.FileID AS VARCHAR(10))+tblActivityDocs.FileExt, CONVERT(VARCHAR(50),tblActivityDocs.dtFileUploadedDateTime,103) AS dtUploaded
FROM            tblPOPActivityActionAttendance INNER JOIN
                         tblActivityDocs ON tblPOPActivityActionAttendance.tblActivityDocsID = tblActivityDocs.FileID



where bIsAttachment=1 and tblPOPActivityActionAttendance.tblPOPActivityActionID=" + dataID[1] + @"
ORDER BY dtFileUploadedDateTime"));





                            break;






                        ////////Calender Events

                        case 134:
                            context.Response.Write(Fn.Data2Json(@"Select * from [dbo].[EventType] where DisplayYear=" + dataID[1] + " order by ord"));
                            break;


                        case 135:
                            context.Response.Write(Fn.Exec(@"INSERT INTO EventType
                         (EventType, EventTypeColor, DisplayYear, ord)
VALUES        ('" + dataID[1] + "','" + dataID[2] + "'," + dataID[3] + "," + dataID[4] + ")"));


                            break;


                        case 136:
                            context.Response.Write(Fn.Exec("DELETE EventType WHERE EventTypeID=" + dataID[1]));

                            break;

                        case 137:
                            context.Response.Write(Fn.Exec("Update EventType SET " + dataID[1] + "='" + dataID[2] + "' WHERE EventTypeID=" + dataID[3]));
                            break;

                        case 138:
                            context.Response.Write(Fn.Data2Json(@"SELECT        EventTypeID, EventType, EventTypeColor, DisplayYear, ord
FROM            EventType
WHERE        (DisplayYear = '" + dataID[1] + @"')
ORDER BY ord"));
                            break;
                        case 139:


                            context.Response.Write(Fn.Data2Json(@"SELECT        EventEntry.EventEntryID, EventEntry.EventTypeMonthID

,
CASE WHEN spliter='to' then CAST(DATEPART(DD,dtEventStart) AS VARCHAR(10))+ ' - '+ CAST(DATEPART(DD,dtEventEnd) AS VARCHAR(10)) when   spliter='' then CAST(DATEPART(DD,dtEventStart) AS VARCHAR(10)) when spliter='&' then 

SUBSTRING((SELECT ' & ' + cast(DATEPART(DD,s.dtTate) as varchar)
                      FROM EventDates s
					  WHERE s.EventEntryID=EventEntry.EventEntryID
                      ORDER BY s.dtTate
                     FOR XML PATH('')), 8, 200000)

					  END Display


FROM            EventEntry INNER JOIN
                         EventTypeMonth ON EventEntry.EventTypeMonthID = EventTypeMonth.EventTypeMonthID
WHERE        (EventTypeMonth.EventTypeID = " + dataID[1] + @") AND (EventTypeMonth.Month = " + dataID[2] + ")"));

                            break;

                        case 140:

                            context.Response.Write(Fn.Data2Json(@"SELECT        EventTypeMonth.EventTypeMonthID, EventTypeMonth.EventTypeID, EventTypeMonth.Month, EventEntry.EventEntryID, CASE WHEN spliter = 'to' THEN CAST(DATEPART(DD, dtEventStart) AS VARCHAR(10)) 
                         + ' - ' + CAST(DATEPART(DD, dtEventEnd) AS VARCHAR(10)) WHEN spliter = '' THEN CAST(DATEPART(DD, dtEventStart) AS VARCHAR(10)) WHEN spliter = '&' THEN 
						 
						 SUBSTRING((SELECT ' & ' + cast(DATEPART(DD,s.dtTate) as varchar)
                      FROM EventDates s
					  WHERE s.EventEntryID=EventEntry.EventEntryID
                      ORDER BY s.dtTate
                     FOR XML PATH('')), 8, 200000)
						 
						  END AS Display
FROM            EventEntry INNER JOIN
                         EventTypeMonth ON EventEntry.EventTypeMonthID = EventTypeMonth.EventTypeMonthID INNER JOIN
                         EventType ON EventTypeMonth.EventTypeID = EventType.EventTypeID
WHERE        (EventType.DisplayYear = " + dataID[1] + @")"));
                            break;



                        case 141:
                            //    context.Response.Write(Fn.ExenID(@"INSERT INTO EventTypeMonth
                            //                         (EventTypeID, Month)
                            //VALUES        (" + dataID[1] + "," + dataID[2] + ");select SCOPE_IDENTITY()"));

                            context.Response.Write(Fn.ExenID(@"EXEC [DBO].[SP_GETEventTypeMonthID] @EventTypeID=" + dataID[1] + " , @Month=" + dataID[2]));



                            break;


                        case 142:
                            context.Response.Write(Fn.Data2Json(@"SELECT        EventDates.EventDatesID,  CONVERT(VARCHAR(50),EventDates.dtTate,103) AS dtTate
FROM            EventEntry INNER JOIN
                         EventDates ON EventEntry.EventEntryID = EventDates.EventEntryID
WHERE        (EventEntry.EventTypeMonthID  = " + dataID[1] + @")"));
                            break;



                        case 143:
                            context.Response.Write(Fn.Exec("DELETE EventDates WHERE EventDatesID=" + dataID[1] + " ; DELETE  EventEntry WHERE spliter='&' AND EventEntryID NOT IN (SELECT        EventEntryID FROM            EventDates) "));

                            break;


                        case 144:
                            context.Response.Write(Fn.Exec("Update EventDates SET " + dataID[1] + "=Convert(datetime,'" + dataID[2] + "',103) WHERE EventDatesID=" + dataID[3]));
                            break;


                        case 145:
                            context.Response.Write(Fn.ExenID(@"EXEC [DBO].[sp_InsertDates] @EventTypeMonthID=" + dataID[1] + " , @dtTate='" + dataID[2] + "'"));
                            break;




                        case 146:
                            context.Response.Write(Fn.Exec(@"      INSERT INTO EventEntry
                         (EventTypeMonthID, dtEventStart, dtEventEnd, spliter)
VALUES        (" + dataID[1] + ",CONVERT(DATETIME, '" + dataID[2] + "',103),CONVERT(DATETIME, '" + dataID[3] + "',103), 'to')"));


                            break;

                        case 147:

                            context.Response.Write(Fn.Data2Json(@"SELECT        EventEntryID, EventTypeMonthID, Description, Convert(varchar(50),dtEventStart,103) as dtEventStart, Convert(varchar(50),dtEventEnd,103) as dtEventEnd, spliter
FROM            EventEntry WHERE spliter='to' and EventTypeMonthID =" + dataID[1]));
                            break;


                        case 148:
                            context.Response.Write(Fn.Exec("DELETE EventEntry WHERE EventEntryID=" + dataID[1]));

                            break;

                        case 149:
                            context.Response.Write(Fn.Exec("Update EventEntry SET " + dataID[1] + "=Convert(datetime,'" + dataID[2] + "',103) WHERE EventEntryID=" + dataID[3]));
                            break;
                           
                        case 150:
                            context.Response.Write(Fn.Data2Json("EXEC [dbo].[sp_cssMenuSubForCentre]   @Module_ID=" + dataID[1] + "@User_Group_Id=" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["User_Group_ID"]).Value))));
                            break;
                        case 151:
                            context.Response.Write(Fn.GetRecords("SELECT dbo.fn_AnimalSearch('" + dataID[1] + "')")[0]);
                            break;

                        case 152:
                            context.Response.Write(Fn.GetRecords("SELECT tag+'|'+at+'|'+breed+'|'+ISNULL(age,'')+'|'+ISNULL(weight,'')+'|'+ISNULL(color,'')+'|'+ISNULL(name,'')+'|'+ Convert(varchar(50), isnull(PurchaseDate,''),103) as PurchaseDate  FROM tblAnimal WHERE (ID =" + dataID[1] + ")")[0]);
                            break;


                        case 994:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblPOPID,strOP,strOPDescription, strOP +' '+ strOPDescription strOPs, dtDateEntered, tblTblHResourcesID, tblProjectsID
FROM            tblPOP
WHERE        (tblProjectsID = " + dataID[1] + " AND ForYear =" + dataID[2] + ") Order by strOP "));
                            break;
                        case 998:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblProjects.ProjCode, tblProjects.ProjTitle, tblProjects.ProjectID, tblProjects.StartDate, tblProjects.EndDate, ISNULL(tblCPAPOP.strOP, '') + ' ' + ISNULL(tblCPAPOP.strOPDescription, '') AS CPAPOP, 
                         ISNULL(tblCPAPOC.strOC, '') + ' ' + ISNULL(tblCPAPOC.strOCDescription, '') AS CPAPOC, ISNULL(tblSPOP.strOP, '') + ' ' + ISNULL(tblSPOP.strOIDescription, '') AS SPOP, ISNULL(tblSPOC.strOutComeNo, '') 
                         + ' ' + ISNULL(tblSPOC.strDescription, '') AS SPOC, 'Stratigic Plan for : ' + CAST(DATEPART(YYYY, tblSP.dtFrom) AS VARCHAR(50)) + ' - ' + RIGHT(CAST(DATEPART(YYYY, tblSP.dtTo) AS VARCHAR(50)), 2) AS SP, 
                         tblSP.tblSPID
FROM            tblProjects INNER JOIN
                         tblCPAPOP ON tblProjects.tblCPAPOPID = tblCPAPOP.tblCPAPOPID INNER JOIN
                         tblCPAPOC ON tblCPAPOP.tblCPAPOCID = tblCPAPOC.tblCPAPOCID INNER JOIN
                         tblSPOP ON tblCPAPOC.tblSPOPID = tblSPOP.tblSPOP INNER JOIN
                         tblSPOC ON tblSPOP.tblSPOCID = tblSPOC.tblSPOCID INNER JOIN
                         tblSP ON tblSPOC.tblSPID = tblSP.tblSPID

 WHERE (ProjectID = " + dataID[1] + ")"));
                            break;


                        case 999:

                            context.Response.Write(Fn.Data2Json(@"SELECT      tblPOPActivityID , ISNULL(strActivityNo,'') +' '+ ISNULL(strActivityDescription,'') Display
FROM            tblPOPActivity
WHERE        (tblPOPID = " + dataID[1] + " ) Order by Display "));
                            break;


                        case 1000:

                            context.Response.Write(Fn.Data2Json(@"SELECT        iconlink AS iconFilePath, tblPageIconID AS iconValue
FROM            tblPageIcon"));
                            break;

                        case 1001:

                            context.Response.Write(Fn.Data2Json(@"SELECT        Module_Name, Module_Id, Priority
FROM            Admin_User_Module
WHERE        (Status = 1)"));
                            break;

                        case 1002:

                            context.Response.Write(Fn.Data2Json(@"SELECT        Admin_User_Module_Pages.Page_Name, Admin_User_Module_Pages.Page_ID, Admin_User_Module_Pages.Priority, Admin_User_Module_Pages.Module_ID, Admin_User_Module_Pages.Status, 
                         ISNULL(Admin_User_Module_Pages.tblPageIconID, 1220) AS tblPageIconID, tblPageIcon.iconlink
FROM            Admin_User_Module_Pages INNER JOIN
                         tblPageIcon ON ISNULL(Admin_User_Module_Pages.tblPageIconID, 1220) = tblPageIcon.tblPageIconID
						 WHERE        (Module_ID = '" + dataID[1] + @"')
ORDER BY Admin_User_Module_Pages.Priority
"));
                            break;


                        case 1003:

                            context.Response.Write(Fn.Exec(@"UPDATE       Admin_User_Module_Pages
SET                tblPageIconID = '" + dataID[1] + @"'
WHERE        (Page_ID = " + dataID[2] + ")"));
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