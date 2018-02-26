using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;

namespace FRDP
{
    /// <summary>
    /// Summary description for gen
    /// </summary>
    public class gen : IHttpHandler, IRequiresSessionState
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
                            string[] detaID = Fn.CleanSQL(HttpUtility.UrlDecode(dataID[1])).Split('½');
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblGenerator
                         (LocationID, EnterbyEmp, dtEnteredDate, Modal, Brand, Capacity, FuleTankSize, FuleFilterModal, OilFilterModal, WaterFilterModal, AirFilterModal, OilQuantity, coolentQuantity, ServiceDurationHours, 
                         MinFuleLevelLiter, CurrentMeterReading, GeneratorLifeHours, BatteryModal, BatteryAcidQty, BatteryAcidGravity, EnterByEmpID, EnteryDateTime)
VALUES        ('" + detaID[0] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', GETDATE()  ,'" + detaID[1] + "','" + detaID[2] + "','" + detaID[3] + "','" + detaID[4] + "','" + detaID[5] + "','" + detaID[6] + "','" + detaID[7] + "','" + detaID[8] + "','" + detaID[9] + "','" + detaID[10] + "','" + detaID[11] + "','" + detaID[12] + "','" + detaID[13] + "','" + detaID[14] + "','" + detaID[15] + "','" + detaID[16] + "','" + detaID[17] + "', '" + Convert.ToString(HttpContext.Current.Session["Emp_Id"]) + "', GETDATE())"));
                            break;
                        case 1:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGenerator.tblGeneratorID, tblGenerator.LocationID, tblGenerator.EnterbyEmp, tblGenerator.dtEnteredDate, tblGenerator.Modal, tblGenerator.Brand, tblGenerator.Capacity, tblGenerator.FuleTankSize, 
                         tblGenerator.FuleFilterModal, tblGenerator.OilFilterModal, tblGenerator.WaterFilterModal, tblGenerator.AirFilterModal, tblGenerator.OilQuantity, tblGenerator.coolentQuantity, tblGenerator.ServiceDurationHours, 
                         tblGenerator.MinFuleLevelLiter, tblGenerator.CurrentMeterReading, tblGenerator.GeneratorLifeHours, tbl_Company.CompanyName AS LocationName, tblGenerator.BatteryModal, tblGenerator.BatteryAcidQty, 
                         tblGenerator.BatteryAcidGravity
FROM            tblGenerator INNER JOIN
                         tbl_Company ON tblGenerator.LocationID = tbl_Company.CompanyID where EnterbyEmp=" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
                            break;
                        case 2:
                            string[] d= dataID[1].Split('-');
                            DateTime dt = new DateTime(Convert.ToInt32(d[2]), Convert.ToInt32(d[1]), Convert.ToInt32(d[0]));

                            context.Response.Write(Fn.Exec(@"INSERT INTO tblGeneratorOnOff
                         (dtDate, DipVlue, MeterReading, OnTime, OffTime, Description, tblGeneratorID, EnterByEmpID, EnteryDateTime)
VALUES        ('" + dt + "','" + dataID[2] + "','" + dataID[5] + "','" + d[2] + '-' + d[1] + '-' + d[0] + ' ' + dataID[3] + "','" + d[2] + '-' + d[1] + '-' + d[0] + ' ' + dataID[4] + "','" + dataID[6] + "', " + dataID[7] + ", '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', GETDATE())"));
                            break;

                        case 3:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorOnOffID, MeterKWH, CONVERT(VARCHAR(50), dtDate, 103) AS dtDate, DipVlue, MeterReading, CONVERT(char(5), OnTime, 108) AS OnTime, CONVERT(char(5), OffTime, 108) AS OffTime, 
                                                     CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) / 3600) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 3600 / 60) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 60) AS Duration, 
                                                     Description, tblGeneratorID, MeterReadingEnd, MeterKWHEnd
                            FROM            tblGeneratorOnOff
                            WHERE tblGeneratorID=" + dataID[1] + " ORDER BY dtDate, OnTime"));


//                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorOnOffID, MeterKWH, CONVERT(VARCHAR(50), dtDate, 103) AS dtDate, DipVlue, MeterReading, CONVERT(char(5), OnTime, 108) AS OnTime, CONVERT(char(5), OffTime, 108) AS OffTime, 
//                         CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) / 3600) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 3600 / 60) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 60) AS Duration, 
//                         Description, tblGeneratorID, MeterReadingEnd, MeterKWHEnd 
//FROM            tblGeneratorOnOff
//WHERE tblGeneratorID=" + dataID[1] + @" and dtDate in (Select dtdate from (
//Select ROW_NUMBER() over(order by dtDate desc) as rn, dtdate from (
//SELECT DISTINCT dtDate FROM tblGeneratorOnOff WHERE tblGeneratorID=" + dataID[1] + @" 
//) ddd   ) as ddd1 where ddd1.rn in (1, 2, 3) )
//ORDER BY dtDate"));


                            break;


                        case 4:
                            string[] d4= dataID[1].Split('-');
                            DateTime dt4 = new DateTime(Convert.ToInt32(d4[2]), Convert.ToInt32(d4[1]), Convert.ToInt32(d4[0]));
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblGeneratorReFueling
                         (dtDateTime, FuelingTime, MeterReading, HoursValue, IntankOil, InputOil, DipBefore, DipAfter,FuelSlipNo, FuelPrice, tblGeneratorID, EnterByEmpID, EnteryDateTime)
                        VALUES        ('" + dt4 + "','" + d4[2] + '-' + d4[1] + '-' + d4[0] + ' ' + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + dataID[8] + "','" + dataID[9] + "','" + dataID[10] + "','" + dataID[11] + "', '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', GETDATE())"));
                            break;


                        case 5:
                            context.Response.Write(Fn.Data2Json(@"SELECT    FuelSlipNo, FuelPrice, convert(char(5),FuelingTime, 108) FuelingTime,      tblGeneratorReFuelingID, CONVERT(VARCHAR(50),dtDateTime,103) dtDateTime, MeterReading, HoursValue, IntankOil, InputOil, DipBefore, DipAfter, tblGeneratorID
FROM            tblGeneratorReFueling
WHERE tblGeneratorID=" + dataID[1] + " ORDER BY dtDateTime"));
                            break;

                        case 6:
                            string[] d6= dataID[1].Split('-');
                            DateTime dt6 = new DateTime(Convert.ToInt32(d6[2]), Convert.ToInt32(d6[1]), Convert.ToInt32(d6[0]));
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblGeneratorService
                         (dtDateTime, MeterReading, HoursValue, NextServiceHRS, OilFilter, FuelFilter, Fuel_Water_Septr_Filter, Air_Filter, Bettery, Radiator, OilLtrs, Description, tblGeneratorID, EnterByEmpID, EnteryDateTime)
                        VALUES        ('" + dt6 + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "','" + dataID[7] + "','" + dataID[8] + "','" + dataID[9] + "','" + dataID[10] + "','" + dataID[11] + "','" + dataID[12] + "','" + dataID[13] + "', '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', GETDATE())"));
                            break;

                        case 7:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorServiceID, CONVERT(VARCHAR(50), dtDateTime, 103) AS dtDateTime, MeterReading, HoursValue, Description, tblGeneratorID, NextServiceHRS, OilFilter, FuelFilter, Fuel_Water_Septr_Filter, Air_Filter, 
                         Bettery, Radiator, OilLtrs
FROM            tblGeneratorService
WHERE tblGeneratorID=" + dataID[1] + " ORDER BY dtDateTime"));
                            break;


                        case 8:
                            string[] d8 = dataID[1].Split('-');
                            DateTime dt8 = new DateTime(Convert.ToInt32(d8[2]), Convert.ToInt32(d8[1]), Convert.ToInt32(d8[0]));
                            context.Response.Write(Fn.Exec(@"INSERT INTO tblGeneratorMaintinance
                         (dtDateTime, MeterReading, HoursValue,Parts, Description, tblGeneratorID, EnterByEmpID, EnteryDateTime)
                        VALUES        ('" + dt8 + "','" + dataID[2] + "','" + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "','" + dataID[6] + "', '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', GETDATE())"));
                            break;

                        case 9:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorMaintinanceID, CONVERT(VARCHAR(50), dtDateTime, 103) AS dtDateTime, MeterReading, HoursValue,Parts, Description, tblGeneratorID
FROM            tblGeneratorMaintinance
WHERE tblGeneratorID=" + dataID[1] + "ORDER BY dtDateTime"));
                            break;

                        case 10:
                            string[] d10 = dataID[1].Split('-');
                            DateTime dt10 = new DateTime(Convert.ToInt32(d10[2]), Convert.ToInt32(d10[1]), Convert.ToInt32(d10[0]));

                            context.Response.Write(Fn.Exec(@"INSERT INTO tblGeneratorOnOff
                         (dtDate, OnTime, OffTime, MeterReading,MeterReadingEnd, MeterKWH, MeterKWHEnd,  DipVlue, Description, tblGeneratorID, EnterByEmpID, EnteryDateTime)
VALUES        ('" + dt10 + "','" + d10[2] + '-' + d10[1] + '-' + d10[0] + ' ' + dataID[2] + "','" + d10[2] + '-' + d10[1] + '-' + d10[0] + ' ' + dataID[3] + "','" + dataID[4] + "','" + dataID[5] + "', '" + dataID[6] + "','" + dataID[7] + "', '" + dataID[8] + "', '" + dataID[9] + "', " + dataID[10] + ", '" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "', GETDATE())"));
                            break;


                        case 11:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorID AS ID, ISNULL(Modal,'') +' '+ ISNULL(Brand,'') AS Modal
FROM            tblGenerator
WHERE        LocationID =" + dataID[1]));
                            break;

                        case 12:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGenerator.tblGeneratorID, tblGenerator.LocationID, tblGenerator.EnterbyEmp, tblGenerator.dtEnteredDate, tblGenerator.Modal, tblGenerator.Brand, tblGenerator.Capacity, tblGenerator.FuleTankSize, 
                         tblGenerator.FuleFilterModal, tblGenerator.OilFilterModal, tblGenerator.WaterFilterModal, tblGenerator.AirFilterModal, tblGenerator.OilQuantity, tblGenerator.coolentQuantity, tblGenerator.ServiceDurationHours, 
                         tblGenerator.MinFuleLevelLiter, tblGenerator.CurrentMeterReading, tblGenerator.GeneratorLifeHours, tbl_Company.CompanyName AS LocationName, tblGenerator.BatteryModal, tblGenerator.BatteryAcidQty, 
                         tblGenerator.BatteryAcidGravity
FROM            tblGenerator INNER JOIN
                         tbl_Company ON tblGenerator.LocationID = tbl_Company.CompanyID where tblGenerator.tblGeneratorID=" + dataID[1]));
                            break;

                        case 13:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGenerator.tblGeneratorID, tblGenerator.LocationID, tblGenerator.EnterbyEmp, tblGenerator.dtEnteredDate, tblGenerator.Modal, tblGenerator.Brand, tblGenerator.Capacity, tblGenerator.FuleTankSize, 
                         tblGenerator.FuleFilterModal, tblGenerator.OilFilterModal, tblGenerator.WaterFilterModal, tblGenerator.AirFilterModal, tblGenerator.OilQuantity, tblGenerator.coolentQuantity, tblGenerator.ServiceDurationHours, 
                         tblGenerator.MinFuleLevelLiter, tblGenerator.CurrentMeterReading, tblGenerator.GeneratorLifeHours, tbl_Company.CompanyName AS LocationName, tblGenerator.BatteryModal, tblGenerator.BatteryAcidQty, 
                         tblGenerator.BatteryAcidGravity
FROM            tblGenerator INNER JOIN
                         tbl_Company ON tblGenerator.LocationID = tbl_Company.CompanyID"));
                            break;

                        case 14:
                            context.Response.Write(Fn.Exec(@"DELETE FROM tblGeneratorOnOff
WHERE        (tblGeneratorOnOffID = " + dataID[1] + ")"));
                            
                            break;


                        case 15:
//                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorOnOffID, MeterKWH, CONVERT(VARCHAR(50), dtDate, 103) AS dtDate, DipVlue, MeterReading, CONVERT(char(5), OnTime, 108) AS OnTime, CONVERT(char(5), OffTime, 108) AS OffTime, 
//                                                     CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) / 3600) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 3600 / 60) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 60) AS Duration, 
//                                                     Description, tblGeneratorID, MeterReadingEnd, MeterKWHEnd
//                            FROM            tblGeneratorOnOff
//                            WHERE tblGeneratorID=" + dataID[1] + " ORDER BY dtDate"));


                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorOnOffID, MeterKWH, CONVERT(VARCHAR(50), dtDate, 103) AS dtDate, DipVlue, MeterReading, CONVERT(char(5), OnTime, 108) AS OnTime, CONVERT(char(5), OffTime, 108) AS OffTime, 
                                                     CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) / 3600) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 3600 / 60) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 60) AS Duration, 
                                                     Description, tblGeneratorID, MeterReadingEnd, MeterKWHEnd 
                            FROM            tblGeneratorOnOff
                            WHERE tblGeneratorID=" + dataID[1] + @" and dtDate in (Select dtdate from (
                            Select ROW_NUMBER() over(order by dtDate desc) as rn, dtdate from (
                            SELECT DISTINCT dtDate FROM tblGeneratorOnOff WHERE tblGeneratorID=" + dataID[1] + @" 
                            ) ddd   ) as ddd1 where ddd1.rn in (1, 2, 3 , 4) )
                            ORDER BY dtDate, OnTime"));


                            break;


                        case 16:
                            context.Response.Write(Fn.Exec(@"DELETE FROM tblGeneratorService
                            WHERE        (tblGeneratorServiceID = " + dataID[1] + ")"));

                            break;


                        case 17:
                            context.Response.Write(Fn.Exec(@"DELETE FROM tblGeneratorReFueling
                            WHERE        (tblGeneratorReFuelingID = " + dataID[1] + ")"));

                            break;

                        case 18:
                            context.Response.Write(Fn.Data2Json(@"SELECT    FuelSlipNo, FuelPrice, convert(char(5),FuelingTime, 108) FuelingTime,      tblGeneratorReFuelingID, CONVERT(VARCHAR(50),dtDateTime,103) dtDateTime, MeterReading, HoursValue, IntankOil, InputOil, DipBefore, DipAfter, tblGeneratorID
FROM            tblGeneratorReFueling
WHERE tblGeneratorID=" + dataID[1] + " and dtDateTime= CONVERT(DATETIME,'" + dataID[2].Replace('-','/') + "',103) ORDER BY dtDateTime"));
                            break;
                        case 19:

                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorServiceID, CONVERT(VARCHAR(50), dtDateTime, 103) AS dtDateTime, MeterReading, HoursValue, Description, tblGeneratorID, NextServiceHRS, OilFilter, FuelFilter, Fuel_Water_Septr_Filter, Air_Filter, 
                         Bettery, Radiator, OilLtrs
FROM            tblGeneratorService
WHERE tblGeneratorID=" + dataID[1] + " and dtDateTime= CONVERT(DATETIME,'" + dataID[2].Replace('-', '/') + "',103)  ORDER BY dtDateTime"));
                            break;


                        case 20:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGeneratorOnOffID, MeterKWH, CONVERT(VARCHAR(50), dtDate, 103) AS dtDate, DipVlue, MeterReading, CONVERT(char(5), OnTime, 108) AS OnTime, CONVERT(char(5), OffTime, 108) AS OffTime, 
                                                     CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) / 3600) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 3600 / 60) + ':' + CONVERT(varchar(5), DATEDIFF(s, OnTime, OffTime) % 60) AS Duration, 
                                                     Description, tblGeneratorID, MeterReadingEnd, MeterKWHEnd
                            FROM            tblGeneratorOnOff
                            WHERE tblGeneratorID=" + dataID[1] + " and dtDate= CONVERT(DATETIME,'" + dataID[2].Replace('-', '/') + "',103)   ORDER BY dtDate, OnTime"));
                            break;

                        case 21:
                            context.Response.Write(Fn.Data2Json(@"SELECT        tblGenerator.tblGeneratorID, tblGenerator.LocationID, tblGenerator.EnterbyEmp, tblGenerator.dtEnteredDate, tblGenerator.Modal, tblGenerator.Brand, tblGenerator.Capacity, tblGenerator.FuleTankSize, 
                         tblGenerator.FuleFilterModal, tblGenerator.OilFilterModal, tblGenerator.WaterFilterModal, tblGenerator.AirFilterModal, tblGenerator.OilQuantity, tblGenerator.coolentQuantity, tblGenerator.ServiceDurationHours, 
                         tblGenerator.MinFuleLevelLiter, tblGenerator.CurrentMeterReading, tblGenerator.GeneratorLifeHours, tbl_Company.CompanyName AS LocationName, tblGenerator.BatteryModal, tblGenerator.BatteryAcidQty, 
                         tblGenerator.BatteryAcidGravity
FROM            tblGenerator INNER JOIN
                         tbl_Company ON tblGenerator.LocationID = tbl_Company.CompanyID
WHERE        tblGenerator.LocationID = " + dataID[1]));
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