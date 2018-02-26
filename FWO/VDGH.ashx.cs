using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace FRDP
{
    /// <summary>
    /// Summary description for VDGH
    /// </summary>
    public class VDGH : IHttpHandler, IRequiresSessionState
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
                            context.Response.Write(Fn.Data2Json("SELECT DISTINCT at FROM dbo.tblAnimalBreed"));
                            break;
                        case 1:
                            //context.Response.Write(Fn.Data2Json("SELECT DISTINCT at FROM dbo.tblAnimalBreed"));
                            context.Response.Write(Fn.Data2Json(@"SELECT        ISNULL(MAX(Code), 0) + 1 AS Code
FROM            tblAnimal
where          (tbl_CompanyID = '" + dataID[1] + "') AND (at = '" + dataID[2] + "') AND (Gender = '" + dataID[3] + "')"));
                            break;

                        case 2:
                            context.Response.Write(Fn.Data2Json(@"
SELECT        ID, tag, at, breed, age, weight, color, name, offsprings, dialyMilk, CONVERT(VARCHAR(50), PurchaseDate, 103) AS PurchaseDate, tbl_CompanyID, RIGHT('0000' + CAST(Code AS VARCHAR(50)), 4) + '-' + LEFT(at, 1) 
                         + LEFT(Gender, 1) + '-' + RIGHT(ISNULL(CONVERT(VARCHAR(50), DOB, 103), '00'),2) AS tgg, RIGHT('0000' + CAST(Code AS VARCHAR(50)), 4) + '-' + LEFT(at, 1) + LEFT(Gender, 1) AS tg5, ISNULL(CONVERT(VARCHAR(50), 
                         DOB, 103), '') AS DOB, Gender, Code, [dbo].[fn_BreedsByType](AT) AS DDL
FROM            tblAnimal
WHERE        (ID = '" + dataID[1]+@"')
"));
                            break;

                        case 3:
                            context.Response.Write(Fn.Data2Json(@"SELECT DISTINCT at FROM dbo.tblAnimalBreed WHERE at = 'Buffalo' OR at = 'Cow' OR 
at = 'Goat' ORDER BY at"));
                            break;

                        case 4:
                            try
                            {
                                using (DBDataContext db = new DBDataContext())
                                {
                                    db.sp_UpdateDailyMilkProduction(dataID[2], Convert.ToDouble(dataID[3]), Convert.ToDecimal(dataID[1]), dataID[4], dataID[5]);
                                }
                                context.Response.Write("1");
                            }
                            catch 
                            {

                                context.Response.Write("-1");
                            }
                            
                            break;

                        case 5:
                            try
                            {
                                using (DBDataContext db = new DBDataContext())
                                {
                                    var animal = db.tblAnimals.Where(v => v.ID == Convert.ToDecimal(dataID[1])).FirstOrDefault();
                                    if (animal!=null)
                                    {
                                        animal.bisOnProduction = Convert.ToBoolean(dataID[2]);
                                        db.SubmitChanges();
                                    }
                                }
                                context.Response.Write("1");
                            }
                            catch
                            {

                                context.Response.Write("-1");
                            }
                            break;


                        case 6:
                            string ret6 = "1";
                            try
                            {
                                using (DBDataContext db =  new DBDataContext())
                                {
                                    var x = db.tblDailyFeedConsumptions.Where(v => v.tblAnimalID == Convert.ToDecimal(dataID[1]) && v.dtEntryDate.Value.Day == Convert.ToInt32(dataID[2].Split('/')[0]) && v.dtEntryDate.Value.Month == Convert.ToInt32(dataID[2].Split('/')[1]) && v.dtEntryDate.Value.Year == Convert.ToInt32(dataID[2].Split('/')[2])).FirstOrDefault();
                                    if (x!=null)
                                    {
                                        Fn.Exec(@"UPDATE       tblDailyFeedConsumption
SET                " + dataID[3] + @" ='" + dataID[4] + @"'
WHERE        (tblAnimalID = '" + dataID[1] + "') AND (CONVERT(VARCHAR(50),dtEntryDate,103) = '" + dataID[2] + @"')"); 
                                    }
                                    else
                                    {
                                        Fn.Exec(@"INSERT INTO tblDailyFeedConsumption
                         (dtEntryDate, tblAnimalID, " + dataID[3] + @")
VALUES        (CONVERT(DATETIME,'" + dataID[2] + @"',103), '" + dataID[1] + @"', '" + dataID[4] + @"')");
                                    }
                                }
                            }
                            catch 
                            {
                                ret6 = "-1";
                            }
                            context.Response.Write(ret6);
                            break;




                        case 7:
                            try
                            {
                                tblHealthChart flag = null;
                                using (DBDataContext db = new DBDataContext())
                                {
                                    flag = db.tblHealthCharts.Where(v => v.tblAnimalID == Convert.ToDecimal(dataID[1]) && v.dtDate.Value.Day == Convert.ToInt32(dataID[2].Split('/')[0]) && v.dtDate.Value.Month == Convert.ToInt32(dataID[2].Split('/')[1]) && v.dtDate.Value.Year == Convert.ToInt32(dataID[2].Split('/')[2])).FirstOrDefault();
                                }
                                if (flag != null)
                                {
                                    //UPDATE
                                    if (dataID[3]=="1")
                                    {
                                        Fn.Exec(@"UPDATE       tblHealthChart
SET                Cleanliness ='" + dataID[4].Split('½')[0] + @"', Activeness ='" + dataID[4].Split('½')[1] + @"', PredominantOutgrowth ='" + dataID[4].Split('½')[2] + @"', Temprature ='" + dataID[4].Split('½')[3] + @"'
WHERE        (tblHealthChartID = " + Convert.ToString(flag.tblHealthChartID)+ ")");
                                    }
                                    else if (dataID[3]=="2")
	                                {
                                        Fn.Exec(@"UPDATE       tblHealthChart
SET                Horns ='" + dataID[4].Split('½')[0] + @"', Head ='" + dataID[4].Split('½')[1] + @"', LegFR ='" + dataID[4].Split('½')[2] + @"', LegFL ='" + dataID[4].Split('½')[3] + @"', LegBR ='" + dataID[4].Split('½')[4] + @"', LegBL ='" + dataID[4].Split('½')[5] + @"'
WHERE        (tblHealthChartID = " + Convert.ToString(flag.tblHealthChartID) + ")");
	                                }
                                    else if (dataID[3] == "3")
                                    {
                                        Fn.Exec(@"UPDATE       tblHealthChart
SET                Body ='" + dataID[4].Split('½')[0] + @"', Udder ='" + dataID[4].Split('½')[1] + @"', ThanFR ='" + dataID[4].Split('½')[2] + @"', ThanFL ='" + dataID[4].Split('½')[3] + @"', ThanBR ='" + dataID[4].Split('½')[4] + @"', ThanBL ='" + dataID[4].Split('½')[5] + @"'
WHERE        (tblHealthChartID = " + Convert.ToString(flag.tblHealthChartID) + ")");
                                    }
                                    else if (dataID[3] == "4")
                                    {
                                        Fn.Exec(@"UPDATE       tblHealthChart
SET                Ticks ='" + dataID[4].Split('½')[0] + @"', Tail ='" + dataID[4].Split('½')[1] + @"', FeetNail ='" + dataID[4].Split('½')[2] + @"'
WHERE        (tblHealthChartID = " + Convert.ToString(flag.tblHealthChartID) + ")");
                                    }
                                    else if (dataID[3] == "5")
                                    {
                                        Fn.Exec(@"UPDATE       tblHealthChart
SET                Urine ='" + dataID[4].Split('½')[0] + @"', Gobar ='" + dataID[4].Split('½')[1] + @"', GenitalSecretion ='" + dataID[4].Split('½')[2] + @"'
WHERE        (tblHealthChartID = " + Convert.ToString(flag.tblHealthChartID) + ")");
                                    }
                                }
                                else
                                {
                                    //Insert
                                    if (dataID[3] == "1")
                                    {
                                        Fn.Exec(@"INSERT INTO tblHealthChart
                         (tblAnimalID, dtDate, Cleanliness, Activeness, PredominantOutgrowth, Temprature)
VALUES        ('" + dataID[1] + "',CONVERT(DATETIME,'" + dataID[2] + "',103),'" + dataID[4].Split('½')[0] + "','" + dataID[4].Split('½')[1] + "','" + dataID[4].Split('½')[2] + "','" + dataID[4].Split('½')[3] + "')");
                                    }
                                    else if (dataID[3] == "2")
                                    {
                                        Fn.Exec(@"INSERT INTO tblHealthChart
                         (tblAnimalID, dtDate, Horns, Head, LegFR, LegFL, LegBR, LegBL)
VALUES        ('" + dataID[1] + "',CONVERT(DATETIME,'" + dataID[2] + "',103),'" + dataID[4].Split('½')[0] + "','" + dataID[4].Split('½')[1] + "','" + dataID[4].Split('½')[2] + "','" + dataID[4].Split('½')[3] + "','" + dataID[4].Split('½')[4] + "','" + dataID[4].Split('½')[5] + "')");
                                    }
                                    else if (dataID[3] == "3")
                                    {
                                        Fn.Exec(@"INSERT INTO tblHealthChart
                         (tblAnimalID, dtDate, Body, Udder, ThanFR, ThanFL, ThanBR, ThanBL)
VALUES        ('" + dataID[1] + "',CONVERT(DATETIME,'" + dataID[2] + "',103),'" + dataID[4].Split('½')[0] + "','" + dataID[4].Split('½')[1] + "','" + dataID[4].Split('½')[2] + "','" + dataID[4].Split('½')[3] + "','" + dataID[4].Split('½')[4] + "','" + dataID[4].Split('½')[5] + "')");
                                    }
                                    else if (dataID[3] == "4")
                                    {
                                        Fn.Exec(@"INSERT INTO tblHealthChart
                         (tblAnimalID, dtDate, Ticks, Tail, FeetNail)
VALUES        ('" + dataID[1] + "',CONVERT(DATETIME,'" + dataID[2] + "',103),'" + dataID[4].Split('½')[0] + "','" + dataID[4].Split('½')[1] + "','" + dataID[4].Split('½')[2] + "' )");
                                    }
                                    else if (dataID[3] == "5")
                                    {
                                        Fn.Exec(@"INSERT INTO tblHealthChart
                         (tblAnimalID, dtDate, Urine, Gobar, GenitalSecretion)
VALUES        ('" + dataID[1] + "',CONVERT(DATETIME,'" + dataID[2] + "',103),'" + dataID[4].Split('½')[0] + "','" + dataID[4].Split('½')[1] + "','" + dataID[4].Split('½')[2] + "' )");
                                    }
                                }
                                context.Response.Write("1");
                            }
                            catch (Exception)
                            {

                                context.Response.Write("-1");
                            }

                            break;

                        case 8:
                            context.Response.Write(Fn.Data2Json(@"select Distinct at from tblAnimal
where bisOnProduction = 1 or bisOnProduction is null and Gender='Female' 
ORDER BY at"));
                            break;


                        case 9:
                            context.Response.Write(Fn.Data2Json(@"SELECT        ID,  RIGHT('0000' + CAST(Code AS VARCHAR(50)), 4) + '-' + LEFT(at, 1) 
                         + LEFT(Gender, 1) + '-' + RIGHT(ISNULL(CONVERT(VARCHAR(50), DOB, 103), '00'), 2) +' ['+name+']' AS tgg
FROM            tblAnimal
WHERE        (tblAnimal.tbl_CompanyID in (SELECT Value FROM fn_Split('" + dataID[1] + @"', ','))) "));
                            break;

                        case 10:
                            context.Response.Write(Fn.Data2Json(@"Select DISTINCT dtDate FROM (
SELECT        CONVERT(Varchar(50), dtDate, 103) AS dtDate
FROM            tblHealthChart
WHERE        (tblAnimalID in (SELECT Value FROM fn_Split('" + dataID[1] + @"', ',') ))


) AS x"));
                            break;

                        case 11:
                            context.Response.Write(Fn.HTMLTableG22(@"
SELECT     RIGHT('0000' + CAST(tblAnimal.Code AS VARCHAR(50)), 4) + '-' + LEFT(tblAnimal.at, 1) + LEFT(tblAnimal.Gender, 1) 
                         + '-' + RIGHT(ISNULL(CONVERT(VARCHAR(50), tblAnimal.DOB, 103), '00'), 2) AS TAG,  
                         
						 tblAnimal.name AS Name,  
						 ISNULL(derivedtbl_1.Cleanliness,  '') AS Cleanliness,
						 ISNULL(derivedtbl_1.Activeness,  '') AS Activeness,
						 ISNULL(derivedtbl_1.PredominantOutgrowth,  '') AS PredominantOutgrowth,
						 ISNULL(derivedtbl_1.Temprature,  '') AS Temprature,
						 ISNULL(derivedtbl_1.ThanFR,  '') AS ThanFR,
						 ISNULL(derivedtbl_1.ThanFL,  '') AS ThanFL,
						 ISNULL(derivedtbl_1.ThanBR,  '') AS ThanBR,
						 ISNULL(derivedtbl_1.ThanBL,  '') AS ThanBL,
						 ISNULL(derivedtbl_1.Udder,  '') AS Udder,
						 ISNULL(derivedtbl_1.Ticks,  '') AS Ticks,
						 ISNULL(derivedtbl_1.Horns,  '') AS Horns,
						 ISNULL(derivedtbl_1.Head,  '') AS Head,
						 ISNULL(derivedtbl_1.LegFR,  '') AS LegFR,
						 ISNULL(derivedtbl_1.LegFL,  '') AS LegFL,
						 ISNULL(derivedtbl_1.LegBR,  '') AS LegBR,
						 ISNULL(derivedtbl_1.LegBL,  '') AS LegBL,
						 ISNULL(derivedtbl_1.Tail,  '') AS Tail,
						 ISNULL(derivedtbl_1.FeetNail,  '') AS FeetNail,
                         ISNULL(derivedtbl_1.Body,  '') AS Body,
						 ISNULL(derivedtbl_1.Urine,  '') AS Urine,
						 ISNULL(derivedtbl_1.Gobar,  '') AS Gobar,
						 ISNULL(derivedtbl_1.GenitalSecretion, '') AS GenitalSecretion
FROM            tblAnimal LEFT OUTER JOIN
                             (
SELECT        tblHealthChartID, dtDate, tblAnimalID, Cleanliness, Activeness, PredominantOutgrowth, Temprature, ThanFR, ThanFL, ThanBR, ThanBL, Udder, Ticks, Horns, Head, LegFR, LegFL, LegBR, LegBL, Tail, FeetNail, 
                         Body, Urine, Gobar, GenitalSecretion
FROM            tblHealthChart
                               WHERE        (CONVERT(VARCHAR(50), dtDate, 103) = '" +dataID[1]+@"')
							   
							   ) AS derivedtbl_1 ON tblAnimal.ID = derivedtbl_1.tblAnimalID
WHERE        (tblAnimal.ID IN (SELECT Value FROM fn_Split('" + dataID[2] + @"', ',') ))

"));
                            break;

                        case 12:
                            context.Response.Write(Fn.Data2Json(@"Select 0 as ID, 'Unknown' as tgg , 'Male' as Gender ,ord =0
union
SELECT        ID,  RIGHT('0000' + CAST(Code AS VARCHAR(50)), 4) + '-' + LEFT(at, 1) 
                         + LEFT(Gender, 1) + '-' + RIGHT(ISNULL(CONVERT(VARCHAR(50), DOB, 103), '00'), 2) +' ['+name+']' AS tgg, Gender, 1 as ord
FROM            tblAnimal
WHERE        (tblAnimal.tbl_CompanyID = " + dataID[1] + @"  and tblAnimal.at='" + dataID[2] + @"')
order by Gender, ord "));
                            break;

                        case 13:
                            string[] s13 = dataID[1].Split('½');
                            if (s13[4]=="0")
                            {
                                context.Response.Write(Fn.ExenID(@"INSERT INTO tblMating
                         (dtDate, tblAnimalIDFemale, tblAnimalIDMale, MaleDescription, Emp_ID, dtEntryDate)
VALUES        (convert(DateTime, '" + s13[0] + "',103), " + s13[1] + @", " + s13[2] + @", '" + s13[3] + @"', " + Convert.ToString(HttpContext.Current.Session["Emp_Id"]) + @", GETDATE()) ;select SCOPE_IDENTITY()"));
                            }
                            else
                            {
                                context.Response.Write(Fn.Exec(@"UPDATE       tblMating
SET                dtDate =convert(DateTime, '" + s13[0] + @"',103) , tblAnimalIDFemale =" + s13[1] + @", tblAnimalIDMale =" + s13[2] + @", MaleDescription ='" + s13[3] + @"'
WHERE        (tblMatingID = " + s13[4] + @")"));    
                            }
                            
                            break;
                        case 14:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblMating.tblMatingID, CONVERT(VARCHAR(50),tblMating.dtDate,103) AS dtDate, tblMating.tblAnimalIDFemale, tblMating.tblAnimalIDMale, tblMating.MaleDescription, tblMating.Emp_ID, tblMating.dtEntryDate, tblMating.status,

       RIGHT('0000' + CAST(tblAnimal_1.Code AS VARCHAR(50)), 4) + '-' + LEFT(tblAnimal_1.at, 1) 
                         + LEFT(tblAnimal_1.Gender, 1) + '-' + RIGHT(ISNULL(CONVERT(VARCHAR(50), tblAnimal_1.DOB, 103), '00'), 2) +' ['+tblAnimal_1.name+']' AS tgFemale
,
   tgMale= case when tblMating.tblAnimalIDMale=0 then 'Unknown' else     RIGHT('0000' + CAST(tblAnimal.Code AS VARCHAR(50)), 4) + '-' + LEFT(tblAnimal.at, 1) 
                         + LEFT(tblAnimal.Gender, 1) + '-' + RIGHT(ISNULL(CONVERT(VARCHAR(50), tblAnimal.DOB, 103), '00'), 2) +' ['+tblAnimal.name+']' end , tblMating.MaleDescription

FROM            tblMating INNER JOIN
                         tblAnimal AS tblAnimal_1 ON tblMating.tblAnimalIDFemale = tblAnimal_1.ID LEFT OUTER JOIN
                         tblAnimal ON tblMating.tblAnimalIDMale = tblAnimal.ID

						 where tblMating.status is null and tblAnimal_1.at= '" + dataID[1] + "' and tblAnimal_1.tbl_CompanyID= '" + dataID[2] + "' Order by dtDate Desc"));
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