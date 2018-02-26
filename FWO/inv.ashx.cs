using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;
namespace FRDP
{
    /// <summary>
    /// Summary description for inv
    /// </summary>
    public class inv : IHttpHandler, IRequiresSessionState
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
                            context.Response.Write(Fn.Data2Json("Select * from [dbo].[tblInventoryDefault] where tblInventoryDefaultID=1"));
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
                                try
                                {
                                    db.sp_tblInvItems_Insert(HttpUtility.UrlDecode(dataID[1]), HttpUtility.UrlDecode(dataID[2]), HttpUtility.UrlDecode(dataID[3]), ref tblid, ref tblcode, HttpUtility.UrlDecode(dataID[4]), Convert.ToInt32(HttpUtility.UrlDecode(dataID[5])), HttpUtility.UrlDecode(dataID[6]), HttpUtility.UrlDecode(dataID[7]));
                                }
                                catch (Exception ex)
                                {

                                    context.Response.Write(ex.Message);
                                }

                            }
                            string sssssss = Convert.ToString(tblid) + "½" + Convert.ToString(tblcode);
                            context.Response.Write(sssssss);
                            break;

                        case 6:
                            using (DBDataContext db = new DBDataContext())
                            {
                                int? Next = 0;
                                try
                                {
                                    Next = Convert.ToInt32(db.tblinvStores.Where(v => v.ParentId == null).Max(s => s.Code ?? 0));
                                    Next++;
                                }
                                catch
                                {

                                    Next = 1;
                                }
                                if (Next == null)
                                {
                                    Next = 1;
                                }

                                context.Response.Write(Fn.Exec(@"INSERT INTO tblinvStore
                         (txtStoreName, Type, LocationsID, storeInchargeEmpID, txtContactNo1, txtContactNo2, bIsHead, Code)
                         VALUES        ('" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','1', " + Next + ")"));
                            }

                            break;

                        case 7:
                            //                        context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStoreID, txtStoreName, Type, LocationsID, storeInchargeEmpID, txtContactNo1, txtContactNo2
                            //FROM            tblinvStore"));

                            //                           context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStore.tblinvStoreID, tblinvStore.txtStoreName, tblinvStore.Type, tblinvStore.LocationsID, tblinvStore.storeInchargeEmpID, tblinvStore.txtContactNo1, tblinvStore.txtContactNo2, tbl_Company.CompanyName, 
                            //                         ISNULL(Website_User.EMP_Prefix,'') +' '+ISNULL(Website_User.EF_Name,'') as Emp_Name
                            //FROM            tblinvStore INNER JOIN
                            //                         tbl_Company ON tblinvStore.LocationsID = tbl_Company.CompanyID INNER JOIN
                            //                         Website_User ON tblinvStore.storeInchargeEmpID = Website_User.Emp_Id"));




                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStore.tblinvStoreID, tblinvStore.txtStoreName, tblinvStore.Type, tblinvStore.LocationsID, tblinvStore.storeInchargeEmpID, tblinvStore.txtContactNo1, tblinvStore.txtContactNo2, tbl_Company.CompanyName, 
                         TblHResources.Full_Name AS Emp_Name
FROM            tblinvStore INNER JOIN
                         tbl_Company ON tblinvStore.LocationsID = tbl_Company.CompanyID INNER JOIN
                         TblHResources ON tblinvStore.storeInchargeEmpID = TblHResources.User_ID"));
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
                                    Next = Convert.ToInt32(db.tblVenders.Where(v => v.CategoryVenderContractor == dataID[1]).Max(s => s.VenderNo) ?? 0);
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
                                context.Response.Write(Convert.ToString(Next + 1));
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
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResourcesLocations.LocID CompanyID, CompanyName= CASE WHEN tbl_Company.Type = 'Head Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Head Office]' WHEN tbl_Company.Type = 'Co-Ordination Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Co-Ordination Office]' WHEN tbl_Company.Type = 'Field Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Field Office]'   ELSE ISNULL(tbl_Company.CompanyName,'') + ' [School]' END, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyEmail, 
                         tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear
FROM            TblHResourcesLocations INNER JOIN
                         tbl_Company ON TblHResourcesLocations.LocID = tbl_Company.CompanyID
WHERE  TblHResourcesLocations.User_ID = " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + " order by tbl_Company.lvl, CompanyName"));
                            break;
                        case 18:
                            //context.Response.Write(Fn.Data2Json("SELECT Emp_Id, ISNULL(EMP_Prefix,'') +' '+ISNULL(EF_Name,'') as Emp_Name  FROM [dbo].[Website_User]"));

                            context.Response.Write(Fn.Data2Json(@"SELECT        EmpID Emp_Id, 'FRDP-EMP-' + RIGHT('00000' + CAST(ISNULL(EmpNo, 0) AS VARCHAR(50)), 5) + ' ' + ISNULL(FName, '') + ' ' + ISNULL(LName, '') AS Emp_Name
FROM            tblEmployee
WHERE        (Status = 1) AND  (EmpNo IS NOT NULL) and (tblCompanyID = " + dataID[1] + " )"));

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
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStoreID ID, Code, txtStoreName as Name, ISNULL(bIsHead,0) bIsHead, Branch= (
Select count(*) from tblinvStore as B where B.ParentId= M.tblinvStoreID
)
FROM            tblinvStore AS M
WHERE  ParentId IS NULL order by Code"));
                            break;

                        case 23:
                            context.Response.Write(Fn.Data2Json(@" SELECT        tblinvStoreID as ID, Code, txtStoreName Name, ISNULL(bIsHead,0) bIsHead, Branch= (

Select count(*) from tblinvStore as B where B.ParentId= M.tblinvStoreID
)
FROM            tblinvStore AS M 
WHERE  ParentId =" + dataID[1] + " order by Code"));
                            break;
                        case 24:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblinvStore
SET                txtStoreName = '" + HttpUtility.UrlDecode(dataID[1]) + @"', bIsHead='" + dataID[3] + @"' 
WHERE        (tblinvStoreID = " + dataID[2] + ")"));
                            break;
                        case 25:
                            tblid = 0;
                            tblcode = 0;
                            using (DBDataContext db = new DBDataContext())
                            {
                                db.sp_tblinvStore_Insert(HttpUtility.UrlDecode(dataID[1]), HttpUtility.UrlDecode(dataID[2]), HttpUtility.UrlDecode(dataID[3]), ref tblid, ref tblcode);
                            }
                            sssssss = Convert.ToString(tblid) + "½" + Convert.ToString(tblcode);
                            context.Response.Write(sssssss);
                            break;


                        case 26:
                            //                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStoreID ID, Code, txtStoreName as Name, ISNULL(bIsHead,0) bIsHead, Branch= (
                            //Select count(*) from tblinvStore as B where B.ParentId= M.tblinvStoreID
                            //)
                            //FROM            tblinvStore AS M
                            //WHERE  ParentId IS NULL order by Code"));



                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStoreID AS ID, Code, txtStoreName AS Name, ISNULL(bIsHead, 0) AS bIsHead,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            tblinvStore AS B
                               WHERE        (ParentId = M.tblinvStoreID)) AS Branch
FROM            tblinvStore AS M
WHERE        (ParentId IS NULL) AND (LocationsID = " + dataID[1] + @")
ORDER BY Code"));
                            break;

                        case 27:
                            //                         context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStore.tblinvStoreID, tblinvStore.txtStoreName, tblinvStore.Type, tblinvStore.LocationsID, tblinvStore.storeInchargeEmpID, tblinvStore.txtContactNo1, tblinvStore.txtContactNo2, tbl_Company.CompanyName, 
                            //                         TblHResources.Full_Name AS Emp_Name
                            //FROM            tblinvStore INNER JOIN
                            //                         tbl_Company ON tblinvStore.LocationsID = tbl_Company.CompanyID INNER JOIN
                            //                         TblHResources ON tblinvStore.storeInchargeEmpID = TblHResources.User_ID"));

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStore.tblinvStoreID, tblinvStore.txtStoreName, tblinvStore.Type, tblinvStore.LocationsID, tblinvStore.storeInchargeEmpID, tblinvStore.txtContactNo1, tblinvStore.txtContactNo2, tbl_Company.CompanyName, 
                         TblHResources.Full_Name AS Emp_Name
FROM            tblinvStore INNER JOIN
                         tbl_Company ON tblinvStore.LocationsID = tbl_Company.CompanyID INNER JOIN
                         TblHResources ON tblinvStore.storeInchargeEmpID = TblHResources.User_ID
WHERE        (tblinvStore.LocationsID = " + dataID[1] + @")
ORDER BY Type, txtStoreName"));
                            break;
                        case 28:
                            //                        context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStore.tblinvStoreID, tblinvStore.txtStoreName, tblinvStore.Type, tblinvStore.LocationsID, tblinvStore.storeInchargeEmpID, tblinvStore.txtContactNo1, tblinvStore.txtContactNo2, tbl_Company.CompanyName, 
                            //                         TblHResources.Full_Name AS Emp_Name
                            //FROM            tblinvStore INNER JOIN
                            //                         tbl_Company ON tblinvStore.LocationsID = tbl_Company.CompanyID INNER JOIN
                            //                         TblHResources ON tblinvStore.storeInchargeEmpID = TblHResources.User_ID
                            //WHERE        (tblinvStore.LocationsID = " + dataID[1] + @")
                            //ORDER BY Type, txtStoreName"));
                            context.Response.Write(Fn.Data2Json(@"exec sp_Stores_of_Location " + dataID[1]));
                            break;

                        case 29:
                            context.Response.Write(Fn.Data2Json(@"exec sp_Portions_of_Store " + dataID[1]));
                            break;
                        case 30:
                            context.Response.Write(Fn.Data2Json(@"exec sp_Inventory_ItemsList "));
                            break;

                        case 31:
                            //string[] str31 = dataID;
                            context.Response.Write(Fn.Exec(@"EXEC sp_inv31 '" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + dataID[8] + "', '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "'"));
                            break;

                        case 32:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblinvStoretblInvItemsID, txtStoreName, txtItemName, txtStoreNameasPortionName, fQty
FROM            tblinvStoretblInvItems
WHERE        tblinvStoreID =  " + dataID[1]));
                            break;

                        case 33:

                            string s33 = "";
                            if (dataID[1] == "1")
                            {
                                s33 = " and (Status=0 or status=1 or status=2) and CONVERT(VARCHAR(50), EnteryDateTime, 103) = CONVERT(VARCHAR(50), GETDATE(), 103) ";
                            }
                            if (dataID[1] == "2")
                            {
                                s33 = " and (Status=0 or status=1 or status=2) and ISNULL(bIsImportantForSender,0) = 1 ";
                            }
                            if (dataID[1] == "3")
                            {
                                s33 = " and Status=2 ";
                            }
                            if (dataID[1] == "4" || dataID[1] == "7" || dataID[1] == "8")
                            {
                                s33 = " and (Status=0 or status=1 or status=2)  ";
                            }
                            if (dataID[1] == "5")
                            {
                                s33 = " and Status=1 ";
                            }
                            if (dataID[1] == "6")
                            {
                                s33 = " and (Status=0 ) ";
                            }
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvReqMainID, yearlyNo, EnterByEmpID, EnterByEmpLocationID, EnterByEmpShiftID, EnteryDateTime, CONVERT(VARCHAR(50), EnteryDateTime, 103) AS Dated, Status, ToStoreID, StoreName, Subject, 
                         Description, 'R' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo, 
                         LEFT('- ' + Description, 40) AS subDescription, ISNULL(bIsImportantForSender,0) bIsImportantForSender, ISNULL(bIsDeletedBySender,0) bIsDeletedBySender
FROM            tblInvReqMain
Where ISNULL(bIsDeletedBySender,0) = 0  AND (Type = 'REQ') AND EnterByEmpID =" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + s33 + " ORDER BY EnteryDateTime Desc"));
                            break;

                        case 34:
                            context.Response.Write(Fn.Exec(@"update tblInvReqMain set bIsImportantForSender =" + dataID[2] + " where tblInvReqMainID = " + dataID[1]));
                            break;


                        case 35:
                            //                            context.Response.Write(Fn.Data2Json(@"SELECT  tblInvReqSubID, tblInvReqMainID, temID, ItemName, Quality, Quantity, Unit, Availability=1000, QuantityIssued=ISNULL(QuantityIssued,0)
                            //FROM            tblInvReqSub
                            //WHERE        tblInvReqMainID = " + dataID[1]));


                            context.Response.Write(Fn.Data2Json(@"SELECT  tblInvReqSubID, tblInvReqMainID, temID, ItemName, Quality, Quantity, Unit, Availability=(SELECT  SUM(ISNULL(tblinvStoretblInvItems.fQty, 0))
FROM            tblInvReqMain INNER JOIN
                         tblInvReqSub ON tblInvReqMain.tblInvReqMainID = tblInvReqSub.tblInvReqMainID INNER JOIN
                         tblinvStoretblInvItems ON tblInvReqMain.ToStoreID = tblinvStoretblInvItems.tblinvStoreID AND tblInvReqSub.temID = tblinvStoretblInvItems.tblInvItemsID
WHERE        (tblInvReqSub.tblInvReqSubID = tblInvReqSubID)), QuantityIssued=ISNULL(QuantityIssued,0)
FROM            tblInvReqSub
WHERE        tblInvReqMainID = " + dataID[1]));
                            break;
                        case 36:
                            context.Response.Write(Fn.Exec(@"update tblInvReqSub set QuantityIssued ='" + dataID[2] + "' where tblInvReqSubID = " + dataID[1]));
                            break;
                        case 37:
                            context.Response.Write(Fn.Exec(@"update tblInvReqMain set bIsImportantForIssuer =" + dataID[2] + " where tblInvReqMainID = " + dataID[1]));
                            break;

                        case 38:
                            string s38 = "";
                            if (dataID[1] == "1")
                            {
                                s38 = " and (Status=1 or status=2) and CONVERT(VARCHAR(50), EnteryDateTime, 103) = CONVERT(VARCHAR(50), GETDATE(), 103) ";
                            }
                            if (dataID[1] == "2")
                            {
                                s38 = " and (Status=1 or status=2) and ISNULL(bIsImportantForIssuer,0) = 1 ";
                            }
                            if (dataID[1] == "3")
                            {
                                s38 = " and Status=1 ";
                            }
                            if (dataID[1] == "4" || dataID[1] == "6" || dataID[1] == "7" || dataID[1] == "8")
                            {
                                s38 = " and (Status=1 or status=2)";
                            }
                            if (dataID[1] == "5")
                            {
                                s38 = " and Status=2 ";
                            }
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvReqMainID, yearlyNo, EnterByEmpID, EnterByEmpLocationID, EnterByEmpShiftID, EnteryDateTime, CONVERT(VARCHAR(50), EnteryDateTime, 103) AS Dated, Status, ToStoreID, StoreName, Subject, 
                         Description, 'R' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo, 
                         LEFT('- ' + Description, 40) AS subDescription, ISNULL(bIsImportantForIssuer,0) bIsImportantForSender, ISNULL(bIsDeletedByIssuer,0) bIsDeletedBySender
FROM            tblInvReqMain
Where  (Type = 'REQ') AND ISNULL(bIsDeletedByIssuer,0) = 0 " + s38 + " ORDER BY EnteryDateTime DESC"));
                            //Where ISNULL(bIsDeletedByIssuer,0) = 0 AND EnterByEmpID =" + Convert.ToString(HttpContext.Current.Session["Emp_Id"])));
                            break;

                        case 39:
                            context.Response.Write(Fn.Exec(@"exec sp_tblInvReqMain_Issue '" + dataID[1] + "' , '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', '" + dataID[2] + "'"));
                            break;
                        case 40:
                            context.Response.Write(Fn.Data2Json(@"SELECT        ISNULL(tbl_Company.CompanyID,0) AS LocationID, ISNULL(tbl_Company.CompanyName,0) AS LocationName, tblInvReqMain.ToStoreID AS StoreID, tblInvReqMain.StoreName, tblInvReqMain.Subject, tblInvReqSub.temID AS ItemID, 
                         tblInvReqSub.ItemName, tblInvReqSub.Quality, tblInvReqSub.Quantity, tblInvReqSub.Unit
FROM            tbl_Company INNER JOIN
                         tblinvStore ON tbl_Company.CompanyID = tblinvStore.LocationsID RIGHT OUTER JOIN
                         tblInvReqSub INNER JOIN
                         tblInvReqMain ON tblInvReqSub.tblInvReqMainID = tblInvReqMain.tblInvReqMainID ON tblinvStore.tblinvStoreID = tblInvReqMain.ToStoreID
WHERE        tblInvReqMain.tblInvReqMainID = " + dataID[1]));
                            break;


                        case 41:

                            string s41 = "";
                            if (dataID[1] == "1")
                            {
                                s41 = " and (Status=0 or status=1 or status=2) and CONVERT(VARCHAR(50), EnteryDateTime, 103) = CONVERT(VARCHAR(50), GETDATE(), 103) ";
                            }
                            if (dataID[1] == "2")
                            {
                                s41 = " and (Status=0 or status=1 or status=2) and ISNULL(bIsImportantForSender,0) = 1 ";
                            }
                            if (dataID[1] == "3")
                            {
                                s41 = " and Status=2 ";
                            }
                            if (dataID[1] == "4" || dataID[1] == "7" || dataID[1] == "8")
                            {
                                s41 = " and (Status=0 or status=1 or status=2)  ";
                            }
                            if (dataID[1] == "5")
                            {
                                s41 = " and Status=1 ";
                            }
                            if (dataID[1] == "6")
                            {
                                s41 = " and (Status=0 ) ";
                            }
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvIndentMainID, yearlyNo, EnterByEmpID, EnterByEmpLocationID, EnterByEmpShiftID, EnteryDateTime, CONVERT(VARCHAR(50), EnteryDateTime, 103) AS Dated, Status, ToStoreID, StoreName, Subject, 
                         Description, 'IND-' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvIndentNo, 
                         LEFT('- ' + Description, 40) AS subDescription, ISNULL(bIsImportantForSender,0) bIsImportantForSender, ISNULL(bIsDeletedBySender,0) bIsDeletedBySender
FROM            tblInvIndentMain
Where ISNULL(bIsDeletedBySender,0) = 0 AND EnterByEmpID =" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + s41 + " ORDER BY EnteryDateTime DESC"));
                            break;

                        case 42:
                            context.Response.Write(Fn.Exec(@"update tblInvIndentMain set bIsImportantForSender =" + dataID[2] + " where tblInvIndentMainID = " + dataID[1]));
                            break;

                        case 43:
                            context.Response.Write(Fn.Data2Json(@"SELECT        ISNULL(tbl_Company.CompanyID,0) AS LocationID, ISNULL(tbl_Company.CompanyName,0) AS LocationName, tblInvIndentMain.ToStoreID AS StoreID, tblInvIndentMain.StoreName, tblInvIndentMain.Subject, tblInvIndentSub.temID AS ItemID, 
                         tblInvIndentSub.ItemName, tblInvIndentSub.Quality, tblInvIndentSub.Quantity, tblInvIndentSub.Unit
FROM            tbl_Company INNER JOIN
                         tblinvStore ON tbl_Company.CompanyID = tblinvStore.LocationsID RIGHT OUTER JOIN
                         tblInvIndentSub INNER JOIN
                         tblInvIndentMain ON tblInvIndentSub.tblInvIndentMainID = tblInvIndentMain.tblInvIndentMainID ON tblinvStore.tblinvStoreID = tblInvIndentMain.ToStoreID
WHERE        tblInvIndentMain.tblInvIndentMainID =" + dataID[1]));
                            break;


                        case 44:
                            context.Response.Write(Fn.Data2Json(@"SELECT * FROM dbo.tblVender WHERE tblVenderID=" + dataID[1]));
                            break;

                        case 45:

                            using (DBDataContext db = new DBDataContext())
                            {
                                int? Next = 0;
                                try
                                {
                                    Next = Convert.ToInt32(db.tblVenders.Where(v => v.CategoryVenderContractor == dataID[1] && v.tblCompanyID == Convert.ToDecimal(dataID[2])).Max(s => s.VenderNo) ?? 0);
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
                                context.Response.Write(Convert.ToString(Next + 1));
                            }
                            break;


                        case 46:
                            context.Response.Write(Fn.Data2Json(@"Select Name + ' (" + dataID[1] + "' + RIGHT( '00000000000000000'+  CAST(VenderNo as varchar(10)),5)+')' Name, tblVenderID  from [dbo].[tblVender] where CategoryVenderContractor='" + dataID[2] + "' and tblCompanyID='" + dataID[3] + "'"));
                            break;

                        case 47:
                            context.Response.Write(Fn.Data2Json(@"Select * from tbl_Company where lvl=2 and CompanyID in

(

SELECT    tbl_Company.ParentId
FROM            TblHResourcesLocations INNER JOIN
                         tbl_Company ON TblHResourcesLocations.LocID = tbl_Company.CompanyID
WHERE        (tbl_Company.lvl = 3) AND (TblHResourcesLocations.User_ID = "+ Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))+@") )"));
                            break;

                        case 48:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResourcesLocations.LocID CompanyID, CompanyName= CASE WHEN tbl_Company.Type = 'Head Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Head Office]' WHEN tbl_Company.Type = 'Co-Ordination Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Co-Ordination Office]' WHEN tbl_Company.Type = 'Field Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Field Office]'   ELSE ISNULL(tbl_Company.CompanyName,'') + ' [School]' END, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyEmail, 
                         tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear
FROM            TblHResourcesLocations INNER JOIN
                         tbl_Company ON TblHResourcesLocations.LocID = tbl_Company.CompanyID
WHERE     (tbl_Company.lvl = '1')  AND  TblHResourcesLocations.User_ID = " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));

                            //   context.Response.Write(Fn.Data2Json(@"EXEC sp_AllCompaniesListByEmpPPHI  " + Convert.ToString(HttpContext.Current.Session["Emp_Id"]) +@" , "+ dataID[1]+@" , " + dataID[2]));                                  

                            break;
                        case 49:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResourcesLocations.LocID CompanyID, CompanyName= CASE WHEN tbl_Company.Type = 'Head Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Head Office]' WHEN tbl_Company.Type = 'Co-Ordination Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Co-Ordination Office]' WHEN tbl_Company.Type = 'Field Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Field Office]'   ELSE ISNULL(tbl_Company.CompanyName,'') + ' [School]' END, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyEmail, 
                         tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear
FROM            TblHResourcesLocations INNER JOIN
                         tbl_Company ON TblHResourcesLocations.LocID = tbl_Company.CompanyID
WHERE     (tbl_Company.lvl = '2')  AND  TblHResourcesLocations.User_ID = " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
                            break;
                        case 50:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResourcesLocations.LocID CompanyID, CompanyName= CASE WHEN tbl_Company.Type = 'Head Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Head Office]' WHEN tbl_Company.Type = 'Co-Ordination Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Co-Ordination Office]' WHEN tbl_Company.Type = 'Field Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Field Office]'   ELSE ISNULL(tbl_Company.CompanyName,'') + ' [School]' END, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyEmail, 
                         tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear
FROM            TblHResourcesLocations INNER JOIN
                         tbl_Company ON TblHResourcesLocations.LocID = tbl_Company.CompanyID
WHERE     (tbl_Company.lvl = '3') AND tbl_Company.ParentId='" + dataID[1] + @"' AND  TblHResourcesLocations.User_ID = " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
                            break;


                        case 51:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResourcesLocations.LocID CompanyID, CompanyName= CASE WHEN tbl_Company.Type = 'Head Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Head Office]' WHEN tbl_Company.Type = 'Co-Ordination Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Co-Ordination Office]' WHEN tbl_Company.Type = 'Field Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Field Office]'   ELSE ISNULL(tbl_Company.CompanyName,'') + ' [School]' END, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyEmail, 
                         tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear
FROM            TblHResourcesLocations INNER JOIN
                         tbl_Company ON TblHResourcesLocations.LocID = tbl_Company.CompanyID
WHERE     (tbl_Company.lvl = '3') AND tbl_Company.ParentId='" + dataID[1] + @"' AND  TblHResourcesLocations.User_ID = " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
                            break;
                        case 52:
                            context.Response.Write(Fn.Data2Json(@"SELECT        TblHResourcesLocations.LocID CompanyID, CompanyName= CASE WHEN tbl_Company.Type = 'Head Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Head Office]' WHEN tbl_Company.Type = 'Co-Ordination Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Co-Ordination Office]' WHEN tbl_Company.Type = 'Field Office' THEN ISNULL(tbl_Company.CompanyName,'') + ' [Field Office]'   ELSE ISNULL(tbl_Company.CompanyName,'') + ' [School]' END, tbl_Company.CompanyAbbrivation, tbl_Company.CompanyAddress, tbl_Company.CompanyPhoneNo, tbl_Company.CompanyEmail, 
                         tbl_Company.CompanyWebsite, tbl_Company.CompanyEstablishmentYear
FROM            TblHResourcesLocations INNER JOIN
                         tbl_Company ON TblHResourcesLocations.LocID = tbl_Company.CompanyID
WHERE  TblHResourcesLocations.User_ID = " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + " order by tbl_Company.lvl, CompanyName"));

                            break;
                        case 53:
                            context.Response.Write(Fn.Data2Json(@"EXEC sp_AllCompaniesListByEmpPPHI  " + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @" , " + dataID[1] + @" , " + dataID[2]));

                            break;
                        case 54:
                            context.Response.Write(Fn.Data2Json(@"Select Distinct unit from [dbo].[tblInvItems]
order by Unit"));
                            break;
                        case 55:
                            context.Response.Write(Fn.Data2Json(@"SELECT        CompanyID, CompanyName, ISNULL(CompanyAddress,'') CompanyAddress, Type, lvl
FROM            tbl_Company where lvl = 1 or lvl=2
order by lvl, CompanyName"));
                            break;


                        case 56:


                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvItemsID, Code, Name, ISNULL(bIsHead,0) bIsHead, Branch= (
Select count(*) from tblInvItems as B where B.ParentId= M.tblInvItemsID
)
FROM            tblInvItems AS M
WHERE  ParentId IS NULL and tblInvItemsID='" + dataID[1] + "' order by Code"));
                            break;



                        case 57:
                            decimal? tblid57 = 0;
                            int? tblcode57 = 0;
                            using (DBDataContext db = new DBDataContext())
                            {
                                try
                                {
                                    db.sp_tblInvItemsMedicine_Insert(HttpUtility.UrlDecode(dataID[1]), HttpUtility.UrlDecode(dataID[2]), HttpUtility.UrlDecode(dataID[3]), ref tblid57, ref tblcode57, HttpUtility.UrlDecode(dataID[4]), Convert.ToInt32(HttpUtility.UrlDecode(dataID[5])), HttpUtility.UrlDecode(dataID[6]), HttpUtility.UrlDecode(dataID[7]), HttpUtility.UrlDecode(dataID[8]));
                                }
                                catch (Exception ex)
                                {

                                    context.Response.Write(ex.Message);
                                }

                            }
                            context.Response.Write(Convert.ToString(tblid57) + "½" + Convert.ToString(tblcode57));
                            break;

                        case 58:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblInvItems
SET                Name = '" + HttpUtility.UrlDecode(dataID[1]) + @"', bIsHead='" + dataID[3] + @"' , Unit= '" + HttpUtility.UrlDecode(dataID[4]) + @"' , MinStockLevel='" + dataID[5] + @"', Menufecturer='" + HttpUtility.UrlDecode(dataID[6]) + @"', Description='" + HttpUtility.UrlDecode(dataID[7]) + @"', GENERIC_NAME='" + HttpUtility.UrlDecode(dataID[8]) + @"'
WHERE        (tblInvItemsID = " + dataID[2] + ")"));
                            break;



                        case 59:
                            decimal? tblid59 = 0;
                            int? tblcode59 = 0;
                            using (DBDataContext db = new DBDataContext())
                            {
                                try
                                {
                                    db.sp_tblInvItemsFixedAssetItem_Insert(HttpUtility.UrlDecode(dataID[1]), HttpUtility.UrlDecode(dataID[2]), HttpUtility.UrlDecode(dataID[3]), ref tblid59, ref tblcode59, HttpUtility.UrlDecode(dataID[4]), Convert.ToInt32(HttpUtility.UrlDecode(dataID[5])), HttpUtility.UrlDecode(dataID[6]), HttpUtility.UrlDecode(dataID[7]), Convert.ToInt32(HttpUtility.UrlDecode(dataID[8])), Convert.ToInt32(HttpUtility.UrlDecode(dataID[9])));
                                }
                                catch (Exception ex)
                                {

                                    context.Response.Write(ex.Message);
                                }

                            }
                            context.Response.Write(Convert.ToString(tblid59) + "½" + Convert.ToString(tblcode59));

                            break;

                        case 60:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblInvItems
SET                Name = '" + HttpUtility.UrlDecode(dataID[1]) + @"', bIsHead='" + dataID[3] + @"' , Unit= '" + HttpUtility.UrlDecode(dataID[4]) + @"' , MinStockLevel='" + dataID[5] + @"', Menufecturer='" + HttpUtility.UrlDecode(dataID[6]) + @"', Description='" + HttpUtility.UrlDecode(dataID[7]) + @"', LifeYear='" + HttpUtility.UrlDecode(dataID[8]) + @"', DepreciationPercentage='" + HttpUtility.UrlDecode(dataID[9]) + @"'
WHERE        (tblInvItemsID = " + dataID[2] + ")"));
                            break;


                        case 61:
                            context.Response.Write(Fn.Data2Json(@"exec sp_Inventory_ItemsListFixedAssets "));
                            break;
                        case 62:
                            if (dataID[17+1] == "0")
                            {


//                                context.Response.Write(Fn.Exec(@"INSERT INTO tblFixedAssetItems
//                         (tblCompanyID, displayDate, PO#, SerialNo, ProductNo, Insurance, Warranty, Note, tblInvItemsID, tblLoginID, dtEntryDate)
//VALUES        ('" + dataID[1] + @"',CONVERT(DATETIME,'" + dataID[2] + @"',103),'" + dataID[3] + @"','" + dataID[4] + @"','" + dataID[5] + @"','" + dataID[6] + @"','" + dataID[7] + @"','" + dataID[8] + @"','" + dataID[10] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"',GETDATE())"));

                                context.Response.Write(Fn.Exec(@"INSERT INTO tblFixedAssetItems
                         (officeType, DSUID, tblCompanyID, displayDate, PO#, tblInvItemsIDAssetCategoryID, DepriciationMethod, DepriciationRate, tblInvItemsID, fPurchaseValue, LifeYear, Salvage, SerialNo, ProductNo, Insurance, 
                         Warranty, Note, dtEntryDate, tblLoginID)
VALUES        ('" + dataID[0+1] + @"','" + dataID[1+1] + @"','" + dataID[2+1] + @"',CONVERT(DATETIME,'" + dataID[3+1] + @"',103),'" + dataID[4+1] + @"','" + dataID[5+1] + @"','" + dataID[6+1] + @"','" + dataID[7+1] + @"','" + dataID[8+1] + @"','" + dataID[9+1] + @"','" + dataID[10+1] + @"','" + dataID[11+1] + @"','" + dataID[12+1] + @"','" + dataID[13+1] + @"','" + dataID[14+1] + @"','" + dataID[15+1] + @"','" + dataID[16+1] + @"',GETDATE(),'" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"')"));

                            }
                            else
                            {
                                context.Response.Write(Fn.Exec(@"UPDATE       tblFixedAssetItems
officeType ='" + dataID[0+1] + @"', DSUID ='" + dataID[1+1] + @"', tblCompanyID ='" + dataID[2+1] + @"', displayDate =CONVERT(DATETIME,'" + dataID[3+1] + @"',103), PO# ='" + dataID[4+1] + @"', tblInvItemsIDAssetCategoryID ='" + dataID[5+1] + @"', DepriciationMethod ='" + dataID[6+1] + @"', DepriciationRate ='" + dataID[7+1] + @"', tblInvItemsID ='" + dataID[8+1] + @"', fPurchaseValue ='" + dataID[9+1] + @"', LifeYear ='" + dataID[10+1] + @"', Salvage ='" + dataID[11+1] + @"', SerialNo ='" + dataID[12+1] + @"', ProductNo ='" + dataID[13+1] + @"', Insurance ='" + dataID[14+1] + @"', Warranty ='" + dataID[15+1] + @"', Note ='" + dataID[16+1] + @"'
WHERE        (tblFixedAssetItemsID = '" + (dataID[11] + "')")));
                            }
                            break;

                        case 63:
                            context.Response.Write(Fn.Data2Json(@"SELECT        RIGHT('0000000000000000' + CAST(tblFixedAssetItems.tblFixedAssetItemsID AS VARCHAR(50)), 7) AS Code, tblFixedAssetItems.tblFixedAssetItemsID, tblFixedAssetItems.tblCompanyID, CONVERT(VARCHAR(50), 
                         tblFixedAssetItems.displayDate, 103) AS displayDate, tblFixedAssetItems.PO# AS PO, tblFixedAssetItems.SerialNo, tblFixedAssetItems.ProductNo, tblFixedAssetItems.Insurance, tblFixedAssetItems.Warranty, 
                         tblFixedAssetItems.Note, tblFixedAssetItems.tblInvItemsID, tblFixedAssetItems.tblLoginID, tblFixedAssetItems.dtEntryDate, tbl_Company.CompanyName, tblInvItems.Name
FROM            tblFixedAssetItems INNER JOIN
                         tbl_Company ON tblFixedAssetItems.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tblInvItems ON tblFixedAssetItems.tblInvItemsID = tblInvItems.tblInvItemsID
						 where tblFixedAssetItems.tblCompanyID = " + dataID[1]));
                            break;


                        case 64:
                            context.Response.Write(Fn.GetRecords("SELECT PerBHUGrantedAmount FROM tblAC_Year where Session_ID=" + dataID[1])[0]);
                            break;

                        case 65:
                            context.Response.Write(Fn.Data2Json(@"exec sp_DSUListForMedicineBudget '" + dataID[1] + @"','" + dataID[2] + @"'"));
                            break;

                        case 66:
                            Fn.Exec("UPDATE tblDSUYearlyBudet SET TotalBHUInSession='" + dataID[3] + "' WHERE tblDSUYearlyBudetID=" + dataID[4]);
                            context.Response.Write(Fn.Data2Json(@"exec sp_DSUListForMedicineBudget '" + dataID[1] + @"','" + dataID[2] + @"'"));
                            break;
                        case 67:

                            context.Response.Write(Fn.Exec(@" exec sp_TblHResourcesLocationsInsert '" + dataID[1] + "','" + dataID[2] + "'"));
                            break;

                        case 68:
                            //                            context.Response.Write(Fn.Exec(@"DELETE FROM TblHResourcesLocations
                            //WHERE        (User_ID = '" + dataID[1] + "') AND (LocID = '" + dataID[2] + "')"));

                            context.Response.Write(Fn.Exec(@"EXEC sp_TblHResourcesLocationsDelete '" + dataID[1] + "', '" + dataID[2] + "'"));
                            break;

                        case 69:
                            context.Response.Write(Fn.Data2Json(@"SELECT Distinct       LocID
FROM            TblHResourcesLocations
WHERE        (User_ID = '" + dataID[1] + "')"));
                            break;




                        case 70:

                            string s70 = "";
                            if (dataID[1] == "1")
                            {
                                s70 = " and (Status=0 or status=1 or status=2) and CONVERT(VARCHAR(50), EnteryDateTime, 103) = CONVERT(VARCHAR(50), GETDATE(), 103) ";
                            }
                            if (dataID[1] == "2")
                            {
                                s70 = " and (Status=0 or status=1 or status=2) and ISNULL(bIsImportantForSender,0) = 1 ";
                            }
                            if (dataID[1] == "3")
                            {
                                s70 = " and Status=2 ";
                            }
                            if (dataID[1] == "4" || dataID[1] == "7" || dataID[1] == "8")
                            {
                                s70 = " and (Status=0 or status=1 or status=2)  ";
                            }
                            if (dataID[1] == "5")
                            {
                                s70 = " and Status=1 ";
                            }
                            if (dataID[1] == "6")
                            {
                                s70 = " and (Status=0 ) ";
                            }
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvReqMainID, yearlyNo, EnterByEmpID, EnterByEmpLocationID, EnterByEmpShiftID, EnteryDateTime, CONVERT(VARCHAR(50), EnteryDateTime, 103) AS Dated, Status, ToStoreID, StoreName, Subject, 
                         Description, 'R' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo, 
                         LEFT('- ' + Description, 40) AS subDescription, ISNULL(bIsImportantForSender,0) bIsImportantForSender, ISNULL(bIsDeletedBySender,0) bIsDeletedBySender
FROM            tblInvReqMain
Where ISNULL(bIsDeletedBySender,0) = 0 AND (Type = 'REQP') AND EnterByEmpID =" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + s70 + " ORDER BY EnteryDateTime Desc"));
                            break;

                        case 71:
                            string s71 = "";
                            if (dataID[1] == "1")
                            {
                                s71 = " and (Status=1 or status=2) and CONVERT(VARCHAR(50), EnteryDateTime, 103) = CONVERT(VARCHAR(50), GETDATE(), 103) ";
                            }
                            if (dataID[1] == "2")
                            {
                                s71 = " and (Status=1 or status=2) and ISNULL(bIsImportantForIssuer,0) = 1 ";
                            }
                            if (dataID[1] == "3")
                            {
                                s71 = " and Status=1 ";
                            }
                            if (dataID[1] == "4" || dataID[1] == "6" || dataID[1] == "7" || dataID[1] == "8")
                            {
                                s71 = " and (Status=1 or status=2)";
                            }
                            if (dataID[1] == "5")
                            {
                                s71 = " and Status=2 ";
                            }
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvReqMainID, yearlyNo, EnterByEmpID, EnterByEmpLocationID, EnterByEmpShiftID, EnteryDateTime, CONVERT(VARCHAR(50), EnteryDateTime, 103) AS Dated, Status, ToStoreID, StoreName, Subject, 
                         Description, 'R' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo, 
                         LEFT('- ' + Description, 40) AS subDescription, ISNULL(bIsImportantForIssuer,0) bIsImportantForSender, ISNULL(bIsDeletedByIssuer,0) bIsDeletedBySender
FROM            tblInvReqMain
Where  (Type = 'REQP') AND ISNULL(bIsDeletedByIssuer,0) = 0 " + s71 + " ORDER BY EnteryDateTime DESC"));
                            //Where ISNULL(bIsDeletedByIssuer,0) = 0 AND EnterByEmpID =" + Convert.ToString(HttpContext.Current.Session["Emp_Id"])));
                            break;


                        case 72:
                            //                            context.Response.Write(Fn.Data2Json(@"SELECT  tblInvReqSubID, tblInvReqMainID, temID, ItemName, Quality, Quantity, Unit, Availability=1000, QuantityIssued=ISNULL(QuantityIssued,0)
                            //FROM            tblInvReqSub
                            //WHERE        tblInvReqMainID = " + dataID[1]));


                            context.Response.Write(Fn.Data2Json(@"SELECT  tblInvReqSubID, tblInvReqMainID, temID, ItemName, Quality, Quantity, Unit, Availability=0, QuantityIssued=ISNULL(QuantityIssued,0)
FROM            tblInvReqSub
WHERE        tblInvReqMainID = " + dataID[1]));
                            break;


                        case 73:
                            context.Response.Write(Fn.Exec(@"exec sp_tblInvReqMain_ApproveReject '" + dataID[1] + "' , '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', '" + dataID[2] + "', '" + dataID[3] + @"'"));
                            break;


                        case 74:
                            context.Response.Write(Fn.Data2Json(@"SELECT tblInvReqMainID, 'R' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT ('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo FROM tblInvReqMain WHERE Type='REQP' and (ApprovedRejectStatus = 'Approved') ORDER BY tblInvReqNo"));
                            break;


                        case 75:
                            string s75 = "";
                            if (dataID[1] == "1")
                            {
                                s75 = " and (Status=1 or status=2) and CONVERT(VARCHAR(50), EnteryDateTime, 103) = CONVERT(VARCHAR(50), GETDATE(), 103) ";
                            }
                            if (dataID[1] == "2")
                            {
                                s75 = " and (Status=1 or status=2) and ISNULL(bIsImportantForIssuer,0) = 1 ";
                            }
                            if (dataID[1] == "3")
                            {
                                s75 = " and Status=1 ";
                            }
                            if (dataID[1] == "4" || dataID[1] == "6" || dataID[1] == "7" || dataID[1] == "8")
                            {
                                s75 = " and (Status=1 or status=2)";
                            }
                            if (dataID[1] == "5")
                            {
                                s75 = " and Status=2 ";
                            }
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvReqMainID, yearlyNo, EnterByEmpID, EnterByEmpLocationID, EnterByEmpShiftID, EnteryDateTime, CONVERT(VARCHAR(50), EnteryDateTime, 103) AS Dated, Status, ToStoreID, StoreName, Subject, 
                         Description, 'RFQ' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo, 
                         LEFT('- ' + Description, 40) AS subDescription, ISNULL(bIsImportantForIssuer,0) bIsImportantForSender, ISNULL(bIsDeletedByIssuer,0) bIsDeletedBySender
FROM            tblInvReqMain
Where  (Type = 'RFQ') AND ISNULL(bIsDeletedByIssuer,0) = 0 " + s75 + " ORDER BY EnteryDateTime DESC"));
                            //Where ISNULL(bIsDeletedByIssuer,0) = 0 AND EnterByEmpID =" + Convert.ToString(HttpContext.Current.Session["Emp_Id"])));
                            break;

                        case 76:
                            context.Response.Write(Fn.Data2Json(@"SELECT tblInvReqMainVenders.tblVenderID, 'VND' + RIGHT ('00000000000' + CAST(tblVender.VenderNo AS VARCHAR(10)), 5) + ' ' + ISNULL(tblVender.Name, '') AS VenderNo FROM tblInvReqMainVenders INNER JOIN tblVender ON tblInvReqMainVenders.tblVenderID = tblVender.tblVenderID WHERE (tblInvReqMainVenders.tblInvReqMainID = '"+dataID[1]+@"') ORDER BY VenderNo"));
                            //Where ISNULL(bIsDeletedByIssuer,0) = 0 AND EnterByEmpID =" + Convert.ToString(HttpContext.Current.Session["Emp_Id"])));
                            break;

                        case 77:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"exec sp_GettblInvRFQVendorPrice '" + dataID[1] + @"','"+dataID[2]+@"','"+ Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) +@"' ", "tblJl"));
                            break;


                        case 78:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblInvRFQVendorPrice
SET                fUnitPrice ='" + dataID[1] + @"', fUnitPriceFinal='" + dataID[1] + @"', dtUpdatedDate =GETDATE(), LoginID ='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"'
WHERE        (tblInvRFQVendorPriceID = '" +dataID[2]+@"')"));
                            break;

                        case 79:

                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"exec dbo.CrossTab 'SELECT 1 ID,  '''' [Sr#],     ''VND'' + RIGHT(''00000000000'' + CAST(tblVender.VenderNo AS VARCHAR(10)), 5) + '' '' + ISNULL(tblVender.Name, '''') AS Vender, tblInvReqSub.ItemName [Item Name], tblInvReqSub.Quality, tblInvReqSub.Quantity, 
                         tblInvReqSub.Unit, tblInvRFQVendorPrice.fUnitPrice [Unit Price], [Total Price]=tblInvRFQVendorPrice.fUnitPrice * tblInvReqSub.Quantity
FROM            tblInvRFQVendorPrice INNER JOIN
                         tblVender ON tblInvRFQVendorPrice.tblVenderID = tblVender.tblVenderID INNER JOIN
                         tblInvReqSub ON tblInvRFQVendorPrice.tblInvReqSubID = tblInvReqSub.tblInvReqSubID
WHERE        (tblInvReqSub.tblInvReqMainID = "+dataID[1]+@")'
,'Vender','max([Unit Price] ELSE 0 )[]',N'ID,[Sr#],[Item Name],Quality ',NULL,',1,1'", "tblJl"));
                            break;

                        case 80:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"exec dbo.CrossTab 'SELECT 2 ID,  '''' [Sr#],     ''VND'' + RIGHT(''00000000000'' + CAST(tblVender.VenderNo AS VARCHAR(10)), 5) + '' '' + ISNULL(tblVender.Name, '''') AS Vender, tblInvReqSub.ItemName [Item Name], tblInvReqSub.Quality, tblInvReqSub.Quantity, 
                         tblInvReqSub.Unit, tblInvRFQVendorPrice.fUnitPrice [Unit Price], [Total Price]=tblInvRFQVendorPrice.fUnitPrice * tblInvReqSub.Quantity
FROM            tblInvRFQVendorPrice INNER JOIN
                         tblVender ON tblInvRFQVendorPrice.tblVenderID = tblVender.tblVenderID INNER JOIN
                         tblInvReqSub ON tblInvRFQVendorPrice.tblInvReqSubID = tblInvReqSub.tblInvReqSubID
WHERE        (tblInvReqSub.tblInvReqMainID = "+dataID[1]+@")'
,'Vender','max([Total Price] ELSE 0 )[]',N'ID,[Sr#],[Item Name],Quality,Quantity ',NULL,',1,1'", "tblJ2"));
                            break;

                        case 81:
                            context.Response.Write(Fn.Data2Json(@"SELECT        'FRDP-EMP-' + RIGHT('00000' + CAST(ISNULL(tblEmployee.EmpNo, 0) AS VARCHAR(50)), 5) + ' ' + ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS Emp_Name, T.LoginID
FROM            tblEmployee INNER JOIN
                             (SELECT        Emp_Id, LoginID
                               FROM            Login
                               WHERE        (TableName = 'tblEmployee')) AS T ON tblEmployee.EmpID = T.Emp_Id
WHERE        (tblEmployee.Status = 1) AND (tblEmployee.EmpNo IS NOT NULL) and (tblEmployee.tblCompanyID = " + dataID[1] + " )"));

                            break;

                        case 82:
                            context.Response.Write(Fn.HTMLTableWithID_TR_Tag(@"exec sp_GettblInvRFQVendorPriceFinal '" + dataID[1] + @"','" + dataID[2] + @"','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"' ", "tblJ3"));
                            break;


                        case 83:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblInvRFQVendorPrice
SET          fUnitPriceFinal='" + dataID[1] + @"', dtUpdatedDate =GETDATE(), LoginID ='" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + @"'
WHERE        (tblInvRFQVendorPriceID = '" + dataID[2] + @"')"));
                            break;
                            context.Response.Write("");
                        case 84:
                            context.Response.Write(Fn.Exec(@"EXEC sp_InvRFQVendorApproval '"+dataID[1]+@"','"+dataID[2]+@"','"+dataID[3]+@"','"+Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))+@"'"));
                            break;
                        case 85:
                            context.Response.Write(Fn.Data2Json(@"SELECT tblInvReqMainVenders.tblVenderID, 'VND' + RIGHT ('00000000000' + CAST(tblVender.VenderNo AS VARCHAR(10)), 5) + ' ' + ISNULL(tblVender.Name, '') AS VenderNo, ISNULL(tblInvReqMainVenders.ApprovalRemarks,'') AS ApprovalRemarks FROM tblInvReqMainVenders INNER JOIN tblVender ON tblInvReqMainVenders.tblVenderID = tblVender.tblVenderID WHERE (tblInvReqMainVenders.bIsApproved = 1)  AND  (tblInvReqMainVenders.tblInvReqMainID = '" + dataID[1] + @"') ORDER BY VenderNo"));
                            //Where ISNULL(bIsDeletedByIssuer,0) = 0 AND EnterByEmpID =" + Convert.ToString(HttpContext.Current.Session["Emp_Id"])));
                            break;


                        case 86:
                            context.Response.Write(Fn.Data2Json(@"SELECT        ISNULL(tbl_Company.CompanyID,0) AS LocationID, ISNULL(tbl_Company.CompanyName,0) AS LocationName, tblInvReqMain.ToStoreID AS StoreID, tblInvReqMain.StoreName, tblInvReqMain.Subject, tblInvReqSub.temID AS ItemID, 
                         tblInvReqSub.ItemName, tblInvReqSub.Quality, tblInvReqSub.Quantity, tblInvReqSub.Unit
FROM            tbl_Company INNER JOIN
                         tblinvStore ON tbl_Company.CompanyID = tblinvStore.LocationsID RIGHT OUTER JOIN
                         tblInvReqSub INNER JOIN
                         tblInvReqMain ON tblInvReqSub.tblInvReqMainID = tblInvReqMain.tblInvReqMainID ON tblinvStore.tblinvStoreID = tblInvReqMain.ToStoreID
WHERE        tblInvReqMain.tblInvReqMainID = " + dataID[1]));
                            break;



                        case 87:
                            context.Response.Write(Fn.Data2Json(@"SELECT       'QT-'+ RIGHT('00000' + CAST(tblInvReqMainVendersID AS VARCHAR(50)) ,5) as POTitle,   tblInvReqMainID, tblVenderID, tblInvReqMainVendersID
FROM            tblInvReqMainVenders
WHERE        (bIsApproved = 1)"));// where id not in PO table 
                            break;


                        case 88:
                            context.Response.Write(Fn.Data2Json(@"SELECT        ISNULL(tbl_Company.CompanyID,0) AS LocationID, ISNULL(tbl_Company.CompanyName,0) AS LocationName, tblInvReqMain.ToStoreID AS StoreID, tblInvReqMain.StoreName, tblInvReqMain.Subject, tblInvReqSub.temID AS ItemID, 
                         tblInvReqSub.ItemName, tblInvReqSub.Quality, tblInvReqSub.Quantity, tblInvReqSub.Unit
FROM            tbl_Company INNER JOIN
                         tblinvStore ON tbl_Company.CompanyID = tblinvStore.LocationsID RIGHT OUTER JOIN
                         tblInvReqSub INNER JOIN
                         tblInvReqMain ON tblInvReqSub.tblInvReqMainID = tblInvReqMain.tblInvReqMainID ON tblinvStore.tblinvStoreID = tblInvReqMain.ToStoreID
WHERE        tblInvReqMain.tblInvReqMainID = " + dataID[1]));
                            break;



                        case 89:
                            string s89 = "";
                            if (dataID[1] == "1")
                            {
                                s89 = " and (Status=1 or status=2) and CONVERT(VARCHAR(50), EnteryDateTime, 103) = CONVERT(VARCHAR(50), GETDATE(), 103) ";
                            }
                            if (dataID[1] == "2")
                            {
                                s89 = " and (Status=1 or status=2) and ISNULL(bIsImportantForIssuer,0) = 1 ";
                            }
                            if (dataID[1] == "3")
                            {
                                s89 = " and Status=1 ";
                            }
                            if (dataID[1] == "4" || dataID[1] == "6" || dataID[1] == "7" || dataID[1] == "8")
                            {
                                s89 = " and (Status=1 or status=2)";
                            }
                            if (dataID[1] == "5")
                            {
                                s89 = " and Status=2 ";
                            }
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblInvReqMainID, yearlyNo, EnterByEmpID, EnterByEmpLocationID, EnterByEmpShiftID, EnteryDateTime, CONVERT(VARCHAR(50), EnteryDateTime, 103) AS Dated, Status, ToStoreID, StoreName, Subject, 
                         Description, 'FRDP/PO/' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo, 
                         LEFT('- ' + Description, 40) AS subDescription, ISNULL(bIsImportantForIssuer,0) bIsImportantForSender, ISNULL(bIsDeletedByIssuer,0) bIsDeletedBySender
FROM            tblInvReqMain
Where  (Type = 'PO') AND ISNULL(bIsDeletedByIssuer,0) = 0 " + s89 + " ORDER BY EnteryDateTime DESC"));
                            //Where ISNULL(bIsDeletedByIssuer,0) = 0 AND EnterByEmpID =" + Convert.ToString(HttpContext.Current.Session["Emp_Id"])));
                            break;

                        case 90:
                            context.Response.Write(Fn.Data2Json(@"exec sp_Inventory_ItemsListFixedAssets "));
                            break;


                            
                        case 91:
                            context.Response.Write(Fn.Data2Json(@"exec sp_Inventory_ItemsListFixedAssetsItemsByCat '"+dataID[1]+ "'"));
                            break;

                        case 92:
                            context.Response.Write(Fn.Data2Json(@"Select officeType, DSUID, tblCompanyID, CASE WHEN CONVERT(VARCHAR(50), displayDate,103) = '01/01/1900' THEN '' ELSE CONVERT(VARCHAR(50), displayDate,103) END AS displayDate, PO#, tblInvItemsIDAssetCategoryID, DepriciationMethod, DepriciationRate, tblInvItemsID, fPurchaseValue, LifeYear, Salvage, SerialNo, ProductNo, Insurance, Warranty, Note, tblFixedAssetItemsID from tblFixedAssetItems wheretblFixedAssetItemsID="+dataID[1]));
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