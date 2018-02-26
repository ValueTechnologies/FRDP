using Microsoft.Reporting.WebForms;
using Spire.Barcode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public class MyClass
    {
        public SqlConnection CN = new SqlConnection();
        public string SQL_Str = Convert.ToString(System.Configuration.ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"]); 

        public string CleanSQL(string Txt)
        {
            string str = Txt.Replace("'", "''");
            return str ;
        }
        public byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            return ms.ToArray();
        }
        public byte[] BarReport(string[] DSet, string[] SQL, string RptName, string ExportType, HttpContext oContext, bool bDownloadAttachment = false)
        {
            BarcodeSettings settings;
            settings = new BarcodeSettings();
            string data = "";
            settings.Type = BarCodeType.QRCode;
            settings.Data2D = data;
            settings.ShowText = false;
            settings.BarHeight = 8;
            LocalReport viewer = new LocalReport();
            viewer.ReportEmbeddedResource = RptName;
            for (int i = 0; i < DSet.Length; i++)
            {
                DataTable dt = new DataTable();
                dt = FillDSet(SQL[i]).Tables[0];
                if (dt.Columns.Contains("Barcode"))
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        settings.Data = row["BarTxt"].ToString();
                        BarCodeGenerator generator = new BarCodeGenerator(settings);
                        row["Barcode"] = imageToByteArray(generator.GenerateImage());
                    }
                }
                ReportDataSource datasource = new ReportDataSource(DSet[i], dt);
                viewer.DataSources.Add(datasource);
            }
            viewer.EnableExternalImages = true;
            string ServerPath = new Uri(HttpContext.Current.Server.MapPath("~/images/")).AbsoluteUri;
            ReportParameter parameter = new ReportParameter("ServerPath", ServerPath);
            viewer.SetParameters(parameter);
            byte[] Contents = viewer.Render(ExportType);
            return Contents;
        }
        public string[] GetRecords(string cmd)
        {
            string[] R_Data = { "a", "b", "c", "d", "e", "f", "g", "h", "a", "b", "c", "d", "e", "f", "g", "h" };

            try
            {
                DataSet MyDataSet = new DataSet();
                MyDataSet.Clear();
                System.Data.SqlClient.SqlDataAdapter MyDataAdapter = new System.Data.SqlClient.SqlDataAdapter(cmd, SQL_Str);
                MyDataAdapter.Fill(MyDataSet);
                int i1 = MyDataSet.Tables[0].Rows.Count - 1;
                int j1 = MyDataSet.Tables[0].Columns.Count - 1;
                int ss = 0;
                for (int i = 0; i <= i1; i++)
                {

                    for (int j = 0; j <= j1; j++)
                    {
                        ss = ss + 1;
                        R_Data[ss - 1] = MyDataSet.Tables[0].Rows[i][j].ToString();
                    }

                }
            }
            catch
            {
            }
            return R_Data;
        }

        public string[] GetRecords11(string cmd)
        {
            string[] R_Data = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k" };

            try
            {
                DataSet MyDataSet = new DataSet();
                MyDataSet.Clear();
                System.Data.SqlClient.SqlDataAdapter MyDataAdapter = new System.Data.SqlClient.SqlDataAdapter(cmd, SQL_Str);
                MyDataAdapter.Fill(MyDataSet);
                int i1 = MyDataSet.Tables[0].Rows.Count - 1;
                int j1 = MyDataSet.Tables[0].Columns.Count - 1;
                int ss = 0;
                for (int i = 0; i <= i1; i++)
                {

                    for (int j = 0; j <= j1; j++)
                    {
                        ss = ss + 1;
                        R_Data[ss - 1] = MyDataSet.Tables[0].Rows[i][j].ToString();
                    }

                }
            }
            catch
            {
            }
            return R_Data;
        }
        public string CmdExe(SqlCommand Cmd)
        {
            string msg = "OK";
            try
            {
                CnStr();
                CN.Open();
                Cmd.Connection = CN;
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteNonQuery();
                CN.Close();
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                CN.Close();
            }
            return msg;
        }

        public void CnStr()
        {
            if (CN.State == ConnectionState.Open)

                CN.Close();
            CN.ConnectionString = SQL_Str;
        }
        public int UserRole(string Pg, string UGrp)
        {
            return Convert.ToInt16(GetRecords("SELECT MAX(ISNULL(tb.Role_ID, 0)) AS Role FROM (SELECT TblUser_Role.Role_ID FROM TblUser_Role INNER JOIN TblPages ON TblUser_Role.Page_ID = TblPages.Page_ID WHERE (TblUser_Role.Group_ID = " + UGrp + ") AND (TblPages.Page_Addr = '" + Pg + "')) AS tb FULL OUTER JOIN (SELECT 0 AS Expr1) AS qry ON tb.Role_ID = qry.Expr1")[0]);
        }
        //------------------------------------------------------------------
        //Execute Non Query on SQL or Procedures retrun number of row effected.
        public string Exec(string str)
        {
            string Out;
            try
            {
                CnStr();
                CN.Open();
                SqlCommand cmd = new SqlCommand(str, CN);
                Out = cmd.ExecuteNonQuery().ToString();

                CN.Close();
            }
            catch (System.Exception ex)
            {
                Out = ex.Message;
            }
            return Out;
        }


        public string ExenID(string str)
        {
            string ID;
            try
            {
                CnStr();
                CN.Open();
                SqlCommand cmd = new SqlCommand(str, CN);
                ID = cmd.ExecuteScalar().ToString();
                CN.Close();
            }

            catch (System.Exception ex)
            {
                ID = ex.Message;
            }
            return ID;
        }

        //-------------------------------------------------------------
        public string ExeR(string str)
        {
            string Out;
            try
            {
                CnStr();
                CN.Open();
                SqlCommand cmd = new SqlCommand(str, CN);
                SqlParameter returnValue = new SqlParameter("returnVal", SqlDbType.Int);
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);

                cmd.ExecuteNonQuery().ToString();
                Out = returnValue.Value.ToString();
                CN.Close();
            }
            catch (System.Exception ex)
            {
                Out = ex.Message;
            }
            return Out;
        }
        public DataSet FillDSet(string cmd)
        {
            DataSet MyDataSet = new DataSet();
            try
            {
                System.Data.SqlClient.SqlDataAdapter MyDataAdapter = new System.Data.SqlClient.SqlDataAdapter(cmd, SQL_Str);
                MyDataAdapter.Fill(MyDataSet);
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
            return MyDataSet;
        }

        public void fillGrid(GridView Grd, string cmd)
        {
            try
            {
                DataSet MyDataSet = new DataSet();
                MyDataSet.Clear();
                System.Data.SqlClient.SqlDataAdapter MyDataAdapter = new System.Data.SqlClient.SqlDataAdapter(cmd, SQL_Str);
                MyDataAdapter.Fill(MyDataSet);
                Grd.DataSource = MyDataSet.Tables[0];
                Grd.DataBind();
                MyDataSet.Dispose();
            }
            catch
            {
            }
        }
        public SqlDataReader FillReader(string sql)
        {
            SqlDataReader xReader = null;
            try
            {
                CnStr();
                CN.Open();
                SqlCommand cmd = new SqlCommand(sql, CN);
                xReader = cmd.ExecuteReader();

                //CN.Close();
            }
            catch
            {
            }
            return xReader;
        }

        public DateTime FirstDayOfMonthFromDateTime(DateTime dateTime)
        {
            return new DateTime(dateTime.Year, dateTime.Month, 1);
        }

        public string[] GetRecordsxxx(string cmd)
        {
            string[] R_Data = { ".", "b", "c", "d", "e", "f", "g", "h" };

            try
            {
                DataSet MyDataSet = new DataSet();
                MyDataSet.Clear();
                System.Data.SqlClient.SqlDataAdapter MyDataAdapter = new System.Data.SqlClient.SqlDataAdapter(cmd, SQL_Str);
                MyDataAdapter.Fill(MyDataSet);
                int i1 = MyDataSet.Tables[0].Rows.Count - 1;
                int j1 = MyDataSet.Tables[0].Columns.Count - 1;
                int ss = 0;
                for (int i = 0; i <= i1; i++)
                {
                    for (int j = 0; j <= j1; j++)
                    {
                        ss = ss + 1;
                        R_Data[ss - 1] = MyDataSet.Tables[0].Rows[i][j].ToString();
                    }
                }
            }
            catch
            {
            }
            return R_Data;
        }
        public void SendEmail(string txtTo, string txtSubject, string txtBody, string txtFrom)
        {
            try
            {
                MailMessage mailMsg = new MailMessage();
                SmtpClient smtp = new SmtpClient("mail.valuesoft.org", 25);
                smtp.Credentials = new NetworkCredential("mail@valuesoft.org", "Value@123");
                mailMsg.From = new MailAddress(txtFrom);
                mailMsg.To.Add(txtTo);
                mailMsg.Subject = txtSubject;
                mailMsg.Body = txtBody;
                mailMsg.IsBodyHtml = true;
                smtp.Send(mailMsg);
            }
            catch { }
        }
        public string Grid2Html(string SQL)
        {
            StringWriter stringWrite = new StringWriter();

            HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            GridView gv = new GridView();
            DataSet rlst = FillDSet(SQL);
            gv.DataSource = rlst.Tables[0];
            gv.DataBind();
            gv.RenderControl(htmlWrite);

            return "<thead><tr>" + stringWrite.ToString().Substring(101).Replace("</table>", "").Replace("</div>", "").Replace("</th>" + Environment.NewLine + "		</tr>", "</th></tr></thead><tbody>") + "</tbody>";
        }

        public string HTMLchTable(string SQL, string TBName, string TBClass)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table id='" + TBName + "' class='" + TBClass + "'><thead><tr>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 0; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr>";
                for (int j = 0; j < colCount; j++)
                {
                    outstring = outstring + "<td>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }
            return outstring + "</tbody></table>";
        }

        public string HTMLcTable(string SQL, string TBName, string TBClass)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table id='" + TBName + "' class='" + TBClass + "'><thead><tr><td></td>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 1; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr><th scope='row'>" + rlst.Tables[0].Rows[i][0] + "</th>";
                for (int j = 1; j < colCount; j++)
                {
                    outstring = outstring + "<td>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }
            return outstring + "</tbody></table>";
        }

        public string HTMLTable(string SQL)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<thead><tr>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 0; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr>";
                for (int j = 0; j < colCount; j++)
                {
                    outstring = outstring + "<td>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return outstring + "</tbody>";
        }

        public string HTMLTableG22(string SQL)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<thead><tr>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 0; i < colCount; i++)
            {
                if (i==0)
                {
                    outstring = outstring + "<th scope='col' style='width:70px;'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
                }
                else
                {
                    outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
                }
                
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr>";
                for (int j = 0; j < colCount; j++)
                {
                    outstring = outstring + "<td>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return "<table id='tblAnimals22' class='responsive table table-striped table-bordered table-condensed' style='width: 98%; border-right: 1px solid #c4c4c4;'>" + outstring + "</tbody></table>";
        }

        public string HTMLTable1(string SQL)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table class='responsive table table-bordered' style='padding-bottom: 0px; margin-bottom: 0px;'><thead><tr style='border-right: 1px solid #c4c4c4;'>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 0; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr style='border-right: 1px solid #c4c4c4;'>";
                for (int j = 0; j < colCount; j++)
                {
                    outstring = outstring + "<td style='text-align:left;'>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return outstring + "</tbody></table>";
        }



        public string HTMLTableWithID(string SQL, string tblId)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table id='" + tblId + "' class='responsive table table-bordered' style='width: 100%;'><thead><tr>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 0; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr tag='" + rlst.Tables[0].Rows[i][0] + "'>";
                for (int j = 0; j < colCount; j++)
                {
                    outstring = outstring + "<td  style='text-align:left;'>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return outstring + "</tbody></table>";
        }

        public string HTMLTableWithID_TR_Tag(string SQL, string tblId)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table id='" + tblId + "' class='responsive table table-bordered' style='width: 100%;'><thead><tr  style='border-right: 1px solid #c4c4c4;'>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 1; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr tag='" + rlst.Tables[0].Rows[i][0] + "'  style='border-right: 1px solid #c4c4c4;'>";
                for (int j = 1; j < colCount; j++)
                {
                    outstring = outstring + "<td  style='text-align:left;'>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return outstring + "</tbody></table>";
        }
        public string HTMLTableWithID1(string SQL, string tblId)
        {
            string cntr = "left";
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table id='" + tblId + "' class='responsive table table-striped table-bordered table-condensed' style='  width: 96%;  margin-left: 20px;  margin-right: 20px;  border-right: 1px solid #c4c4c4;'><thead><tr>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 1; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                //outstring = outstring + "<tr tag='" + rlst.Tables[0].Rows[i][0] + "'>";
                outstring = outstring + "<tr  tag='" + rlst.Tables[0].Rows[i][0] + "'>";
                for (int j = 1; j < colCount; j++)
                {
                    cntr = (j>2)? "center":"left";
                    if (cntr=="center")
                    {
                        if (Convert.ToString(rlst.Tables[0].Rows[i][j]) == "A")
                        {
                            outstring = outstring + "<td class='clsTdMark' eid='" + rlst.Tables[0].Rows[i][0] + "' dd='" + Convert.ToString(j - 2) + "' style='text-align:" + cntr + "; cursor: pointer; cursor: hand; background-color: rgba(252, 0, 0, 0.24);'>" + rlst.Tables[0].Rows[i][j] + "</td>";
                        }
                        else
                        {
                            outstring = outstring + "<td  class='clsTdMark' eid='" + rlst.Tables[0].Rows[i][0] + "' dd='" + Convert.ToString(j - 2) + "'  style='text-align:" + cntr + "; cursor: pointer; cursor: hand;'>" + rlst.Tables[0].Rows[i][j] + "</td>";

                        }  
                    }
                    
                    else
                    {
                        if (j == 1)
                        {
                            outstring = outstring + "<td  class='clsShowMonthlyAttendance' rel='" + rlst.Tables[0].Rows[i][0] + "'  style='text-align:" + cntr + "; cursor: pointer; cursor: hand;'>" + rlst.Tables[0].Rows[i][j] + "</td>";
                        }
                        else
                        {
                            outstring = outstring + "<td  style='text-align:" + cntr + ";'>" + rlst.Tables[0].Rows[i][j] + "</td>";

                        }

                    }

                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return outstring + "</tbody></table>";
        }
        public string HTMLTable2(string SQL)
        {
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table  class='responsive table table-bordered' style='width: 100%;'><thead><tr>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 1; i < colCount; i++)
            {
                outstring = outstring + "<th scope='col'>" + rlst.Tables[0].Columns[i].ColumnName + "</th>";
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr tag='" + rlst.Tables[0].Rows[i][0] + "'>";
                for (int j = 1; j < colCount; j++)
                {
                    outstring = outstring + "<td  style='text-align:left;'>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return outstring + "</tbody></table>";
        }


        public string HTMLTable3(string SQL)
        {
            int vrt = 0;
            DataSet rlst = FillDSet(SQL);
            string outstring = "<table  class='responsive table table-bordered' style='width: 100%;'><thead><tr style='height: 200px;'>";
            int colCount = rlst.Tables[0].Columns.Count;
            for (int i = 1; i < colCount; i++)
            {
                if (vrt<=1)
                {
                    outstring = outstring + "<th class='rotate'><div><span>" + rlst.Tables[0].Columns[i].ColumnName + "</span></div></th>"; 
                }
                else
                {
                    outstring = outstring + "<th class='rotate' ><div><span>" + rlst.Tables[0].Columns[i].ColumnName + "</span></div></th>"; 
                }
                vrt++;
            }
            outstring = outstring + "</tr></thead><tbody>";
            for (int i = 0; i < rlst.Tables[0].Rows.Count; i++)
            {
                outstring = outstring + "<tr tag='" + rlst.Tables[0].Rows[i][0] + "'>";
                for (int j = 1; j < colCount; j++)
                {
                    outstring = outstring + "<td  style='text-align:left; width:10px;padding:0px;'>" + rlst.Tables[0].Rows[i][j] + "</td>";
                }
                outstring = outstring + "</tr>";
            }

            string ssssssssssssss = outstring + "</tbody>";
            return outstring + "</tbody></table>";
        }
        public DateTime LastDayOfMonthFromDateTime(DateTime dateTime)
        {
            DateTime firstDayOfTheMonth = new DateTime(dateTime.Year, dateTime.Month, 1);
            return firstDayOfTheMonth.AddMonths(1).AddDays(-1);
        }

        public byte[] RunReport(string[] DSet, string[] SQL, string RptName, string ExportType, HttpContext oContext, bool bDownloadAttachment = false)
        {
            LocalReport viewer = new LocalReport();
            viewer.ReportEmbeddedResource = RptName;
            //string ext = "xlsx";
            //EXCELOPENXML
            //if (ExportType == "pdf") { ext = "pdf"; } else if(ExportType == "WORDOPENXML") { ext = "docx"; }
            for (int i = 0; i < DSet.Length; i++)
            {
                DataTable dt = new DataTable();
                dt = FillDSet(SQL[i]).Tables[0];
                if ((RptName == "FRDP.LRP_Profile.rdlc") && (i == 0))
                {
                    string path = HttpContext.Current.Server.MapPath("~/images/distt/" + dt.Rows[0]["Distt"].ToString() + ".png");
                    dt.Rows[0]["DisttMap"] = File.ReadAllBytes(path);
                }
                ReportDataSource datasource = new ReportDataSource(DSet[i], dt);
                viewer.DataSources.Add(datasource);
            }

            viewer.Refresh();
            byte[] Contents = viewer.Render(ExportType);
            return Contents;
            //oContext.Response.Clear();
            //oContext.Response.ContentType = "application/" + ExportType;
            //if (bDownloadAttachment == true)
            //{
            //    oContext.Response.AddHeader("Content-disposition", "attachment; filename=Report." + ext);
            //}
            //oContext.Response.BinaryWrite(pdfContent);
            //oContext.Response.End();
        }

        public void SendEmailxxxxx(string txtTo, string txtSubject, string txtBody, string txtFrom)
        {
            try
            {
                MailMessage mailMsg = new MailMessage();
                SmtpClient smtp = new SmtpClient("mail.solutionhub.org", 26);
                smtp.Credentials = new NetworkCredential("mail@solutionhub.org", "mzislam1");
                mailMsg.From = new MailAddress(txtFrom);
                mailMsg.To.Add(txtTo);
                mailMsg.Subject = txtSubject;
                mailMsg.Body = txtBody;
                mailMsg.IsBodyHtml = true;
                smtp.Send(mailMsg);
            }
            catch { }
        }
        public string TruncateLongString(string str, int maxLength)
        {
            return str.Length <= maxLength ? str : str.Remove(maxLength);
        }

        public bool[] UserRolls(string Pg, string UGrp)
        {
            bool[] Ac = { false, false, false };
            try
            {
                Ac[0] =
                Convert.ToBoolean(GetRecords("sp_WR_Chk '" + Pg + "'," + UGrp)[0]);
                Ac[1] = Convert.ToBoolean(GetRecords("sp_Edt_Chk '" + Pg + "'," + UGrp)[0]);
                if (Ac[1])
                {
                    Ac[0] = true;
                }
            }
            catch
            {
                Ac[2] = true;
            }
            return Ac;
        }
        public string Data2Json(string str)
        {
            DataTable dt = FillDSet(str).Tables[0];
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        public string JsonData(DataTable dt)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        internal string GetRecordCandidate(int p)
        {
            throw new NotImplementedException();
        }
    }
}