using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Services;
using System.Web.Script.Serialization;
namespace FRDP
{
    public partial class DB_Employee : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                SetMenue.SET();
            }
        }
        [WebMethod]
        public static string EmpChart(string Q, string yr)
        {
            Charting obj = new Charting();
            obj.categories = new List<string>();
            DataSet ds = Fn.FillDSet(@"EXEC sp_db_EmpChart '"+Q+"','"+yr+"'");

            DataTable d = ds.Tables[0];

            int colCount = d.Columns.Count;
            List<string> colName = new List<string>();

            for (int i = 0; i < colCount; i++)
            {
                colName.Add(d.Columns[i].ColumnName);
            }

            for (int i = 0; i < d.Rows.Count; i++)
            {
                obj.categories.Add(Convert.ToString(d.Rows[i][0]));
            }

            obj.Series = new List<Seris>();
            for (int i = 1; i < colName.Count(); i++)
            {
                Seris ss = new Seris();
                ss.Mydata = new List<string>();
                ss.Myname = colName[i];
                for (int ii = 0; ii < d.Rows.Count; ii++)
                {
                    ss.Mydata.Add(Convert.ToString(d.Rows[ii][i]));
                }
                obj.Series.Add(ss);
            }

            string ret = JsonConvert.SerializeObject(obj);

            return ret;
        }

        [WebMethod]
        public static string Q3(string Q, string yr)
        {
            Charting obj = new Charting();
            obj.categories = new List<string>();
            DataSet ds = Fn.FillDSet(@"exec sp_db_Q3 '"+Q+"','"+yr+"'");

            DataTable d = ds.Tables[0];

            int colCount = d.Columns.Count;
            List<string> colName = new List<string>();

            for (int i = 2; i < colCount; i++)
            {
                colName.Add(d.Columns[i].ColumnName);
            }

            for (int i = 0; i < d.Rows.Count; i++)
            {
                obj.categories.Add(Convert.ToString(d.Rows[i][1]));
            }

            obj.Series = new List<Seris>();
            for (int i = 0; i < colName.Count(); i++)
            {
                Seris ss = new Seris();
                ss.Mydata = new List<string>();
                ss.Myname = colName[i];
                for (int ii = 0; ii < d.Rows.Count; ii++)
                {
                    ss.Mydata.Add(Convert.ToString(d.Rows[ii][i + 2]));
                }
                obj.Series.Add(ss);
            }

            string ret = JsonConvert.SerializeObject(obj);

            return ret;
        }


        [WebMethod]
        public static string Q4(string Q, string yr)
        {
            //            Charting obj = new Charting();
            //            obj.categories = new List<string>();
            //            DataSet ds = Fn.FillDSet(@"dbo.CrossTab '
            //SELECT        NAME, Days, Day, CONVERT(DATETIME,Day,103) AS DD
            //FROM            (
            //
            //SELECT      COUNT(*) AS Days,  UserID, Day, NAME
            //FROM            (SELECT        tblUserLog.UserID, CONVERT(VARCHAR(50), tblUserLog.LoginDT, 103) AS Day, TblHResources.Full_Name AS NAME
            //                          FROM            tblUserLog INNER JOIN
            //                                                    TblHResources ON tblUserLog.UserID = TblHResources.User_ID
            //                          WHERE        (tblUserLog.LoginDT BETWEEN CONVERT(DATETIME, ''" + Q + @"'', 103) AND CONVERT(DATETIME, ''" + yr + @"'', 103))) AS xxx       
            //
            //GROUP BY xxx.UserID, xxx.Day, xxx.NAME
            //
            //						  ) AS X
            //						  
            //',
            //'Name','max(Days ELSE 0 )[]',N'DD,Day',NULL,',1,1'");

            //            DataTable d = ds.Tables[0];

            //            int colCount = d.Columns.Count;
            //            List<string> colName = new List<string>();

            //            for (int i = 2; i < colCount; i++)
            //            {
            //                colName.Add(d.Columns[i].ColumnName);
            //            }

            //            for (int i = 0; i < d.Rows.Count; i++)
            //            {
            //                obj.categories.Add(Convert.ToString(d.Rows[i][1]));
            //               // obj.categories.Add(Convert.ToString(i));
            //            }

            //            obj.Series = new List<Seris>();
            //            for (int i = 0; i < colName.Count(); i++)
            //            {
            //                Seris ss = new Seris();
            //                ss.Mydata = new List<string>();
            //                ss.Myname = colName[i];
            //                for (int ii = 0; ii < d.Rows.Count; ii++)
            //                {
            //                    ss.Mydata.Add(Convert.ToString(d.Rows[ii][i+2]));
            //                }
            //                obj.Series.Add(ss);
            //            }

            //            string ret = JsonConvert.SerializeObject(obj);

            //            return ret;




            Charting obj = new Charting();
            obj.categories = new List<string>();
//            DataSet ds = Fn.FillDSet(@"SELECT   NAME, Count(*) as Logins    
//FROM            (SELECT        tblUserLog.UserID, TblHResources.Full_Name AS NAME
//                          FROM            tblUserLog INNER JOIN
//                                                    TblHResources ON tblUserLog.UserID = TblHResources.User_ID
//                          WHERE  (tblUserLog.UserID!=10037)  AND    (tblUserLog.LoginDT BETWEEN CONVERT(DATETIME, '" + Q + @"', 103) AND DATEADD(MINUTE, 1439,CONVERT(DATETIME, '" + yr + @"', 103)))) AS x
//GROUP BY NAME");




            DataSet ds = Fn.FillDSet(@"exec sp_db_Q4 '"+Q+"','"+yr+"'");
            DataTable d = ds.Tables[0];

            int colCount = d.Columns.Count;
            List<string> colName = new List<string>();

            //for (int i = 0; i < colCount; i++)
            //{
            //    colName.Add(d.Columns[i].ColumnName);
            //}

            for (int i = 0; i < d.Rows.Count; i++)
            {
                colName.Add(Convert.ToString(d.Rows[i][0]));
            }


            for (int i = 0; i < d.Rows.Count; i++)
            {
                obj.categories.Add(Convert.ToString(d.Rows[i][0]));
            }

            obj.Series = new List<Seris>();
            for (int i = 0; i < d.Rows.Count; i++)
            {
                Seris ss = new Seris();
                ss.Mydata = new List<string>();
                //ss.Myname = colName[i];
                ss.Myname = Convert.ToString(d.Rows[i][0]);
                ss.Mydata.Add(Convert.ToString(d.Rows[i][1]));
                //ss.Mydata.Add(Convert.ToString(d.Rows[i][1]));
                //for (int ii = 0; ii < d.Rows.Count; ii++)
                //{

                //    ss.Mydata.Add(Convert.ToString(d.Rows[ii][1]));
                //}
                obj.Series.Add(ss);
            }

            string ret = JsonConvert.SerializeObject(obj);

            return ret;
        }

        [WebMethod]
        public static string Q4A1Web(string obj1, string obj2, string obj3)
        {
            return "";
        }
        [WebMethod]
        public static string GenChart(string Q, string yr)
        {
            //string[] F = Q.Split('/');
            //string[] T = yr.Split('/');

            Charting obj = new Charting();
            obj.categories = new List<string>();



            DataSet ds = Fn.FillDSet(@"exec sp_db_GenChart '"+Q+"','"+yr+"'");

            DataTable d = ds.Tables[0];

            int colCount = d.Columns.Count;
            List<string> colName = new List<string>();

            for (int i = 0; i < colCount; i++)
            {
                colName.Add(d.Columns[i].ColumnName);
            }

            for (int i = 0; i < d.Rows.Count; i++)
            {
                obj.categories.Add(Convert.ToString(d.Rows[i][3]));
            }

            obj.Series = new List<Seris>();
            for (int i = 0; i < colName.Count() - 1; i++)
            {
                Seris ss = new Seris();
                ss.Mydata = new List<string>();
                ss.Myname = colName[i];
                for (int ii = 0; ii < d.Rows.Count; ii++)
                {
                    ss.Mydata.Add(Convert.ToString(d.Rows[ii][i]));
                }
                obj.Series.Add(ss);
            }

            string ret = JsonConvert.SerializeObject(obj);

            return ret;
        }

        [WebMethod]
        public static string Q2A1Web(string obj1, string obj2, string obj3)
        {

            Charting obj = new Charting();
            obj.categories = new List<string>();
            //            DataSet ds = Fn.FillDSet(@"SELECT        tblGeneratorReFueling.InputOil, tblGeneratorReFueling.InputOil * tblGeneratorReFueling.FuelPrice AS Price, CONVERT(VARCHAR(50),tblGeneratorReFueling.FuelingTime,103)
            //+ ' ' + LTRIM(RIGHT(CONVERT(VARCHAR(20), tblGeneratorReFueling.FuelingTime, 100), 7))
            // AS [Date]
            //FROM            tblGeneratorReFueling INNER JOIN
            //                         tblGenerator ON tblGeneratorReFueling.tblGeneratorID = tblGenerator.tblGeneratorID INNER JOIN
            //                         tbl_Company ON tblGenerator.LocationID = tbl_Company.CompanyID
            //WHERE        (tblGeneratorReFueling.dtDateTime BETWEEN CONVERT(DATETIME, '"+obj1+@"', 103) AND DATEADD(MILLISECOND, - 2, DATEADD(DD, 1, CONVERT(DATETIME, '"+obj2+@"', 103)))) AND 
            //                         (tbl_Company.CompanyName = '"+obj3+@"')
            //						 ORDER BY tblGeneratorReFueling.FuelingTime	");


            DataSet ds = Fn.FillDSet(@"exec Q2A1Web  '" + obj1 + "', '" + obj2 + "', '" + obj3 + "'");

            DataTable d = ds.Tables[0];

            int colCount = d.Columns.Count;
            List<string> colName = new List<string>();

            for (int i = 0; i < colCount; i++)
            {
                colName.Add(d.Columns[i].ColumnName);
            }

            for (int i = 0; i < d.Rows.Count; i++)
            {
                obj.categories.Add(Convert.ToString(d.Rows[i][2]));
            }

            obj.Series = new List<Seris>();
            for (int i = 0; i < colName.Count() - 1; i++)
            {
                Seris ss = new Seris();
                ss.Mydata = new List<string>();
                ss.Myname = colName[i];
                for (int ii = 0; ii < d.Rows.Count; ii++)
                {
                    ss.Mydata.Add(Convert.ToString(d.Rows[ii][i]));
                }
                obj.Series.Add(ss);
            }

            string ret = JsonConvert.SerializeObject(obj);

            return ret;
        }


        [WebMethod]
        public static string GetEmpList(string vals)
        {
            string[] v = vals.Split('½');
            //DSBD Ds = new DSBD();
            //try
            //{

            //    DSBDTableAdapters.EmployeeListDataTable1TableAdapter da = new DSBDTableAdapters.EmployeeListDataTable1TableAdapter();
            //    da.Fill(Ds.EmployeeListDataTable1, "%" + v[0] + "%", "%" + v[1] + "%");
            //}
            //catch (Exception ex)
            //{
            //    string error = ex.Message;
            //    error += "";
            //}

//            DataSet Ds = Fn.FillDSet(@"SELECT        TblHResources.User_ID, TblHResources.Full_Name, TblHResources.ContactNos, TblHResources.Email, TblHResources.Designation, TblHResources.EnteryDate, TblHResources.SubTask_ID, 
//                         TblHResources.Expertise, TblHResources.Qualification, TblHResources.Experience, TblHResources.U_ThemeID, TblHResources.U_Pass, TblHResources.Repli, TblHResources.Group_ID, 
//                         TblHResources.Branch_ID, TblHResources.Regions, TblHResources.Distt, TblHResources.U_Status, TblHResources.PO_ID, TblHResources.Deportment, TblHResources.enter_by, TblHResources.modify_by, 
//                         TblHResources.ProjectID, TblHResources.DisplayName, TblHResources.CompanyID, TblHResources.DeptID, TblHResources.UserGroupID, 'PPHI-EMP-' + RIGHT('000' + TblHResources.EmpNo, 3) AS EmpNo, 
//                         TblHResources.CNIC, TblHResources.FatherName, TblHResources.DOB, TblHResources.Is_Male, TblHResources.AppointmentDate, TblHResources.ResignationDate, TblHResources.Address, 
//                         TblHResources.CVExtension, TblHResources.PhotoExtension, ISNULL(TblHResources.Salary, 0) AS Salary, tblDesig.NAME AS Designations, tblDept.Name AS Department, tbl_Company.CompanyName AS Area, 
//                         TblHResources.DesignationID, ISNULL(TblHResources.tblEmpShiftID, 1) AS tblEmpShiftID, Shift.Shift AS strShiftName
//FROM            TblHResources INNER JOIN
//                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID INNER JOIN
//                         tblDesig ON TblHResources.DesignationID = tblDesig.ID INNER JOIN
//                         tblDept ON TblHResources.DeptID = tblDept.ID INNER JOIN
//                         Shift ON TblHResources.tblEmpShiftID = Shift.Shift_ID
//WHERE        (TblHResources.U_Status = 1) AND (tbl_Company.CompanyName LIKE 'Value Resources') AND (tblDesig.NAME LIKE 'Senior Manager')");


            DataSet Ds = Fn.FillDSet(@"SELECT        tblEmployee.EmpID User_ID, ISNULL(tblEmployee.FName,'') +' ' + ISNULL(tblEmployee.LName,'') Full_Name, tblEmployee.Mobile ContactNos,  
                         tblEmployee.tblCompanyID CompanyID, tblEmployee.tblDept DeptID, 'PPHI-EMP-' + RIGHT('0000000' + tblEmployee.EmpNo, 5) AS EmpNo, tblEmployee.CNIC, tblEmployee.Father FatherName, tblEmployee.DOB, 
                         ISNULL(tblEmployee.BPay, 0) AS Salary, tblDesig.NAME AS Designations, tblDept.Name AS Department, tbl_Company.CompanyName AS Area,  Shift.Shift AS strShiftName
FROM            tblEmployee INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         tblDept ON tblEmployee.tblDept = tblDept.ID INNER JOIN
                         Shift ON tblEmployee.tblEmpShiftID = Shift.Shift_ID WHERE        (tbl_Company.CompanyName LIKE '"+v[0]+"') AND (tblDesig.NAME LIKE '"+v[1]+"')");
            // DataTable dt = Ds.Tables["EmployeeDataTable"];
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            //foreach (DataRow dr in Ds.Tables["EmployeeListDataTable"].Rows)
            foreach (DataRow dr in Ds.Tables[0].Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in Ds.Tables[0].Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }


    }
}