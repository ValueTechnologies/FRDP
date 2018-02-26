using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;
namespace FRDP
{
    /// <summary>
    /// Summary description for Elect
    /// </summary>
    public class Elect : IHttpHandler, IRequiresSessionState
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
                            using (DBDataContext db = new DBDataContext())
                            {
                                if (db.tblElecticityMeters.Where(vv => vv.MeterNo.ToUpper() == dataID[4].ToUpper()).Count() > 0)
                                {
                                    context.Response.Write("Meter No Already Registered");
                                    break;
                                }
                            }
                            if (dataID[2] == "WAPDA In")
                            {
                                context.Response.Write(Fn.Exec(@"INSERT INTO dbo.tblElecticityMeter
                            (tbl_Company_LocationID, MeterType,     MeterPlacedAt, MeterNo, MeterReading, OwnerName, OwnerType, Emp_Id, dtDateTime, MultipleFactor)
                            VALUES        ('" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "',GETDATE() , '" + dataID[8] + "')"));
                            }
                            else if (dataID[2] == "Main Meter")
                            {
                                context.Response.Write(Fn.Exec(@"INSERT INTO dbo.tblElecticityMeter
                         (tbl_Company_LocationID, MeterType, WapdaMeterID,  MeterPlacedAt, MeterNo, MeterReading, OwnerName, OwnerType, Emp_Id, dtDateTime, MultipleFactor)
                         VALUES        ('" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + dataID[8] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "',GETDATE() , '" + dataID[9] + "')"));
                            }
                            else if (dataID[2] == "Sub Meter")
                            {
                                context.Response.Write(Fn.Exec(@"INSERT INTO dbo.tblElecticityMeter
                         (tbl_Company_LocationID, MeterType, WapdaMeterID, MainMeterID, MeterPlacedAt, MeterNo, MeterReading, OwnerName, OwnerType, Emp_Id, dtDateTime, MultipleFactor)
                         VALUES        ('" + dataID[1] + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + dataID[8] + "','" + dataID[9] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "',GETDATE() , '" + dataID[10] + "')"));
                            }
                           break;


                        case 1:
                            context.Response.Write(Fn.Data2Json(@"SELECT  tblElecticityMeter.MeterNo,      tblElecticityMeter.tblElecticityMeterID, tblElecticityMeter.MeterType, tblElecticityMeter.OwnerName, tblElecticityMeter.tbl_Company_LocationID, tblElecticityMeter.MeterReading, tblElecticityMeter.Emp_Id, 
                         tblElecticityMeter.dtDateTime, tbl_Company.CompanyName
FROM            tblElecticityMeter INNER JOIN
                         tbl_Company ON tblElecticityMeter.tbl_Company_LocationID = tbl_Company.CompanyID"));
                            break;

                        case 2:
                            context.Response.Write(Fn.Exec(@"DELETE FROM tblElecticityMeter
WHERE        tblElecticityMeterID = " + dataID[1]));
                            break;

                        case 3:
                            context.Response.Write(Fn.Data2Json(@"SELECT  tblElecticityMeter.MeterNo,      tblElecticityMeter.tblElecticityMeterID, tblElecticityMeter.MeterType, tblElecticityMeter.OwnerName, tblElecticityMeter.tbl_Company_LocationID, tblElecticityMeter.MeterReading, tblElecticityMeter.Emp_Id, 
                         tblElecticityMeter.dtDateTime, tbl_Company.CompanyName
FROM            tblElecticityMeter INNER JOIN
                         tbl_Company ON tblElecticityMeter.tbl_Company_LocationID = tbl_Company.CompanyID where tblElecticityMeter.tblElecticityMeterID =" + dataID[1]));
                            break;


                        case 4:
                            context.Response.Write(Fn.Exec(@"UPDATE       tblElecticityMeter
                            SET                MeterNo ='" + dataID[1] + "', MeterType ='" + dataID[2] + "', OwnerName ='" + dataID[3] + "', tbl_Company_LocationID ='" + dataID[4] + "', MeterReading ='" + dataID[5] + "' WHERE tblElecticityMeterID=" + dataID[6]));
                            break;


                        case 5:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblElecticityMeterID, MeterNo
FROM            tblElecticityMeter
WHERE        (tbl_Company_LocationID =" + dataID[1] + ") ORDER BY MeterNo"));
                            break;

                        case 6:
                            string[] d6 = dataID[3].Split('-');
                            DateTime dt6 = new DateTime(Convert.ToInt32(d6[2]), Convert.ToInt32(d6[1]), Convert.ToInt32(d6[0]));
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblElecticityMeterReading
                         (tblElecticityMeterID, dtDate, reading, OffPeakReading, OnPeakReading)
                        VALUES        ('" + dataID[2] + "','" + dt6 + "','" + dataID[4] + "', '" + dataID[5] + "', '" + dataID[6] + "')"));
                            break;

                        case 7:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblElecticityMeterReading.tblElecticityMeterReadingID, CONVERT(VARCHAR(50),tblElecticityMeterReading.dtDate,103) AS dtDate, tblElecticityMeterReading.reading, tblElecticityMeterReading.tblElecticityMeterID, tblElecticityMeter.MeterNo
FROM            tblElecticityMeterReading INNER JOIN
                         tblElecticityMeter ON tblElecticityMeterReading.tblElecticityMeterID = tblElecticityMeter.tblElecticityMeterID ORDER BY tblElecticityMeterReading.dtDate , tblElecticityMeter.MeterNo
"));
                            break;


                        case 8:
                            context.Response.Write(Fn.Exec(@"DELETE FROM tblElecticityMeterReading
WHERE        tblElecticityMeterReadingID = " + dataID[1]));
                            break;
                        //////////////////////////////////////////
                        case 9:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorMaintinanceID, CONVERT(VARCHAR(50), dtDateTime, 103) AS dtDateTime, MeterReading, HoursValue,Parts, Description, tblGeneratorID
FROM            tblGeneratorMaintinance
WHERE tblGeneratorID=" + dataID[1] + "ORDER BY dtDateTime"));
                            break;

                        case 10:
                            string[] d10 = dataID[1].Split('-');
                            DateTime dt10 = new DateTime(Convert.ToInt32(d10[2]), Convert.ToInt32(d10[1]), Convert.ToInt32(d10[0]));

                            context.Response.Write(Fn.Exec(@"INSERT INTO tblGeneratorOnOff
                         (dtDate, DipVlue, MeterReading, OnTime, OffTime, Description, tblGeneratorID)
VALUES        ('" + dt10 + "','" + dataID[5] + "','" + dataID[4] + "','" + d10[2] + '-' + d10[1] + '-' + d10[0] + ' ' + dataID[2] + "','" + d10[2] + '-' + d10[1] + '-' + d10[0] + ' ' + dataID[3] + "','" + dataID[6] + "', " + dataID[7] + ")"));
                            break;


                        case 11:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorID AS ID, ISNULL(Modal,'') +' '+ ISNULL(Brand,'') AS Modal
FROM            tblGenerator
WHERE        LocationID =" + dataID[1]));
                            break;

                        case 12:
                            context.Response.Write(Fn.Data2Json(@"SELECT tblGenerator.tblGeneratorID, tblGenerator.LocationID, tblGenerator.EnterbyEmp, tblGenerator.dtEnteredDate, tblGenerator.Modal, tblGenerator.Brand, tblGenerator.Capacity, tblGenerator.FuleTankSize, 
                         tblGenerator.FuleFilterModal, tblGenerator.OilFilterModal, tblGenerator.WaterFilterModal, tblGenerator.AirFilterModal, tblGenerator.OilQuantity, tblGenerator.coolentQuantity, tblGenerator.ServiceDurationHours, 
                         tblGenerator.MinFuleLevelLiter, tblGenerator.CurrentMeterReading, tblGenerator.GeneratorLifeHours, tbl_Company.CompanyName AS LocationName
FROM            tblGenerator INNER JOIN
                         tbl_Company ON tblGenerator.LocationID = tbl_Company.CompanyID where tblGenerator.tblGeneratorID=" + dataID[1]));
                            break;


                        case 13:
                            context.Response.Write(Fn.Data2Json(@"Select tblElecticityMeterID , MeterNo  from tblElecticityMeter where tbl_Company_LocationID='" + dataID[1] + "' AND MeterType='WAPDA In'"));
                            break;
                        case 14:
                            context.Response.Write(Fn.Data2Json(@"Select tblElecticityMeterID , MeterNo  from tblElecticityMeter where tbl_Company_LocationID='" + dataID[1] + "' AND WapdaMeterID='" + dataID[2] + "' AND MeterType='Main Meter'"));
                            break;
                        case 15:
                            context.Response.Write(Fn.Data2Json(@"Select Distinct MeterPlacedAt  from tblElecticityMeter Where MeterPlacedAt is not NULL AND tbl_Company_LocationID=" + dataID[1]));
                            break;

                        case 16:
                            context.Response.Write(Fn.Data2Json(@"Select Distinct OwnerName  from tblElecticityMeter Where OwnerName is not NULL AND tbl_Company_LocationID=" + dataID[1]));
                            break;

                        case 17:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblElecticityMeterReading.tblElecticityMeterReadingID, CONVERT(VARCHAR(50), tblElecticityMeterReading.dtDate, 103) AS dtDate, tblElecticityMeterReading.reading, tblElecticityMeterReading.tblElecticityMeterID,
                          tblElecticityMeter.MeterNo, ISNULL(tblElecticityMeterReading.OffPeakReading, '0') AS OffPeakReading, ISNULL(tblElecticityMeterReading.OnPeakReading, '0') AS OnPeakReading
FROM            tblElecticityMeterReading INNER JOIN
                         tblElecticityMeter ON tblElecticityMeterReading.tblElecticityMeterID = tblElecticityMeter.tblElecticityMeterID
WHERE        (tblElecticityMeterReading.tblElecticityMeterID = " + dataID[1] + @") and  (DATEPART(MM,tblElecticityMeterReading.dtDate) = " + dataID[2].Split('-')[1] + @") AND (DATEPART(YYYY,tblElecticityMeterReading.dtDate) = " + dataID[2].Split('-')[2] + @")  ORDER BY tblElecticityMeterReading.dtDate , tblElecticityMeter.MeterNo"));
                            break;

                        case 18:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblElecticityMeter.MeterNo, tblElecticityMeter.tblElecticityMeterID, tblElecticityMeter.MeterType, tblElecticityMeter.OwnerName, tblElecticityMeter.tbl_Company_LocationID, tblElecticityMeter.MeterReading, 
                         tblElecticityMeter.Emp_Id, tblElecticityMeter.dtDateTime, tbl_Company.CompanyName
FROM            tblElecticityMeter INNER JOIN
                         tbl_Company ON tblElecticityMeter.tbl_Company_LocationID = tbl_Company.CompanyID
WHERE        tblElecticityMeter.tbl_Company_LocationID = " + dataID[1]));
                            break;

                            //                        case 13:
                            //context.Response.Write(Fn.Data2Json(@""));
                            //break;

                            //                        case 13:
                            //context.Response.Write(Fn.Data2Json(@""));
                            //break;
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