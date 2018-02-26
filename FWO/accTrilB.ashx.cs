using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for accTrilB
    /// </summary>
    public class accTrilB : IHttpHandler
    {
        private MyClass Fn = new MyClass();

        public void ProcessRequest(HttpContext context)
        {
            string dataID = "0";

            dataID = context.Request.QueryString["id"];
            string frmDate = dataID.Split('|')[1];
            string toDate = dataID.Split('|')[2];
            string comp = dataID.Split('|')[0];
            string fy = dataID.Split('|')[3];

            {
                try
                {
                    string COAHTML = "";
                    double oCr = 0; double oDr = 0; double Cr = 0; double Dr = 0; double cDr = 0; double cCr = 0;
                    double oCr0 = 0; double oDr0 = 0; double Cr0 = 0; double Dr0 = 0; double cDr0 = 0; double cCr0 = 0;
                    double oCr1 = 0; double oDr1 = 0; double Cr1 = 0; double Dr1 = 0; double cDr1 = 0; double cCr1 = 0;
                    double oCr2 = 0; double oDr2 = 0; double Cr2 = 0; double Dr2 = 0; double cDr2 = 0; double cCr2 = 0;
                    DataSet dsTop = Fn.FillDSet("sp_TrialBRpt0 " + comp + ",'" + frmDate + "','" + toDate + "'," + fy);
                    for (int i = 0; i < dsTop.Tables[0].Rows.Count; i++)
                    {

                        try { oDr += (double)dsTop.Tables[0].Rows[i][1];  } catch (Exception) { }
                        try { oCr += (double)dsTop.Tables[0].Rows[i][2]; }
                        catch (Exception) { }
                        try { Dr += (double)dsTop.Tables[0].Rows[i][3]; }
                        catch (Exception) { }
                        try { Cr += (double)dsTop.Tables[0].Rows[i][4]; }
                        catch (Exception) { }
                        try { cDr += (double)dsTop.Tables[0].Rows[i][5]; }
                        catch (Exception) { }
                        try { cCr += (double)dsTop.Tables[0].Rows[i][6]; }
                        catch (Exception) { }
                        
                            
                            
                        

                        COAHTML = COAHTML + "<div><table class='tAcHead'><tr><td class='xhead'>" + dsTop.Tables[0].Rows[i][7] + "</td></tr></table>";
                        DataSet dsGrp = Fn.FillDSet("sp_TrialBRpt1 " + comp + ",'" + frmDate + "','" + toDate + "','" + dsTop.Tables[0].Rows[i][0] + "'," + fy);
                        for (int j = 0; j < dsGrp.Tables[0].Rows.Count; j++)
                        {
                            if (dsGrp.Tables[0].Rows[j][0].ToString() != "")
                            {

                                try { oDr0 += Convert.ToDouble(dsGrp.Tables[0].Rows[j][1]); }
                                catch (Exception) { }
                                try { oCr0 += Convert.ToDouble(dsGrp.Tables[0].Rows[j][2]); }
                                catch (Exception) { }
                                try { Dr0 += Convert.ToDouble(dsGrp.Tables[0].Rows[j][3]); }
                                catch (Exception) { }
                                try { Cr0 += Convert.ToDouble(dsGrp.Tables[0].Rows[j][4]); }
                                catch (Exception) { }
                                try { cDr0 += Convert.ToDouble(dsGrp.Tables[0].Rows[j][5]); }
                                catch (Exception) { }
                                try { cCr0 += Convert.ToDouble(dsGrp.Tables[0].Rows[j][6]); }
                                catch (Exception) { }
                                
                                
                                COAHTML = COAHTML + "<div><table class='tAcGroup'><tr><td class='xhead'>" + dsGrp.Tables[0].Rows[j][7] + "</td><td class='oDr'>" + dsGrp.Tables[0].Rows[j][1] + "</td><td class='oCr'>" + dsGrp.Tables[0].Rows[j][2] + "</td><td class='cDr'>" + dsGrp.Tables[0].Rows[j][3] + "</td><td class='cCr'>" + dsGrp.Tables[0].Rows[j][4] + "</td><td class='tDr'>" + dsGrp.Tables[0].Rows[j][5] + "</td><td class='tCr'>" + dsGrp.Tables[0].Rows[j][6] + "</tr></table>";
                                DataSet dsSub = Fn.FillDSet("sp_TrialBRpt2 " + comp + ",'" + frmDate + "','" + toDate + "','" + dsTop.Tables[0].Rows[i][0] + "','" + dsGrp.Tables[0].Rows[j][0].ToString() + "'," + fy);
                                for (int a = 0; a < dsSub.Tables[0].Rows.Count; a++)
                                {
                                    if (dsSub.Tables[0].Rows[a][0].ToString() != "")
                                    {

                                        try { oDr1 += Convert.ToDouble(dsSub.Tables[0].Rows[a][1]); }
                                        catch (Exception) { }
                                        try { oCr1 += Convert.ToDouble(dsSub.Tables[0].Rows[a][2]); }
                                        catch (Exception) { }
                                        try { Dr1 += Convert.ToDouble(dsSub.Tables[0].Rows[a][3]); }
                                        catch (Exception) { }
                                        try { Cr1 += Convert.ToDouble(dsSub.Tables[0].Rows[a][4]); }
                                        catch (Exception) { }
                                        try { cDr1 += Convert.ToDouble(dsSub.Tables[0].Rows[a][5]); }
                                        catch (Exception) { }
                                        try { cCr1 += Convert.ToDouble(dsSub.Tables[0].Rows[a][6]); }
                                        catch (Exception) { }
                                        
                                        
                                        COAHTML = COAHTML + "<div><table class='tAcSubG'><tr><td class='xhead'>" + dsSub.Tables[0].Rows[a][7] + "</td><td class='oDr'>" + dsSub.Tables[0].Rows[a][1] + "</td><td class='oCr'>" + dsSub.Tables[0].Rows[a][2] + "</td><td class='cDr'>" + dsSub.Tables[0].Rows[a][3] + "</td><td class='cCr'>" + dsSub.Tables[0].Rows[a][4] + "</td><td class='tDr'>" + dsSub.Tables[0].Rows[a][5] + "</td><td class='tCr'>" + dsSub.Tables[0].Rows[a][6] + "</tr></table><div><table class='tblAc'>";
                                        DataSet dsAcc = Fn.FillDSet("sp_TrialBRpt '" + dsGrp.Tables[0].Rows[j][0].ToString() + "','" + dsSub.Tables[0].Rows[a][0].ToString() + "'," + comp + ",'" + frmDate + "','" + toDate + "'," + fy);
                                        for (int b = 0; b < dsAcc.Tables[0].Rows.Count; b++)
                                        {

                                            try { oDr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][3]); }
                                            catch (Exception) { }
                                            try { oCr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][4]); }
                                            catch (Exception) { }
                                            try { Dr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][5]); }
                                            catch (Exception) { }
                                            try { Cr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][6]); }
                                            catch (Exception) { }
                                            try { cDr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][7]); }
                                            catch (Exception) { }
                                            try { cCr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][8]); }
                                            catch (Exception) { }
                                           
                                            
                                            COAHTML = COAHTML + "<tr id='" + dsAcc.Tables[0].Rows[b][0] + "' class='AcCode'><td class='Ac-Code'>" + dsAcc.Tables[0].Rows[b][2] + "</td><td class='Ac-Name'>" + dsAcc.Tables[0].Rows[b][1] + "</td><td class='oDr'>" + dsAcc.Tables[0].Rows[b][3] + "</td><td class='oCr'>" + dsAcc.Tables[0].Rows[b][4] + "</td><td class='cDr'>" + dsAcc.Tables[0].Rows[b][5] + "</td><td class='cCr'>" + dsAcc.Tables[0].Rows[b][6] + "</td><td class='tDr'>" + dsAcc.Tables[0].Rows[b][7] + "</td><td class='tCr'>" + dsAcc.Tables[0].Rows[b][8] + "</tr>";
                                        } COAHTML = COAHTML + "</table></div>";
                                    }
                                    else
                                    {
                                        COAHTML = COAHTML + "<div><table class='tblAc'>";
                                        DataSet dsAcc = Fn.FillDSet("sp_TrialBRpt '" + dsGrp.Tables[0].Rows[j][0].ToString() + "','" + dsSub.Tables[0].Rows[a][0].ToString() + "'," + comp + ",'" + frmDate + "','" + toDate + "'," + fy);
                                        for (int b = 0; b < dsAcc.Tables[0].Rows.Count; b++)
                                        {
                                            if (dsAcc.Tables[0].Rows[b][1].ToString() != "")
                                            {

                                                try { oDr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][3]); }
                                                catch (Exception) { }
                                                try { oCr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][4]); }
                                                catch (Exception) { }
                                                try { Dr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][5]); }
                                                catch (Exception) { }
                                                try { Cr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][6]); }
                                                catch (Exception) { }
                                                try { cDr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][7]); }
                                                catch (Exception) { }
                                                try { cCr2 += Convert.ToDouble(dsAcc.Tables[0].Rows[b][8]); }
                                                catch (Exception) { }
                                                
                                                
                                                COAHTML = COAHTML + "<tr id='" + dsAcc.Tables[0].Rows[b][0] + "' class='AcCode'><td class='Ac-Code'>" + dsAcc.Tables[0].Rows[b][2] + "</td><td class='Ac-Name'>" + dsAcc.Tables[0].Rows[b][1] + "</td><td class='oDr'>" + dsAcc.Tables[0].Rows[b][3] + "</td><td class='oCr'>" + dsAcc.Tables[0].Rows[b][4] + "</td><td class='cDr'>" + dsAcc.Tables[0].Rows[b][5] + "</td><td class='cCr'>" + dsAcc.Tables[0].Rows[b][6] + "</td><td class='tDr'>" + dsAcc.Tables[0].Rows[b][7] + "</td><td class='tCr'>" + dsAcc.Tables[0].Rows[b][8] + "</tr>";
                                            }
                                        } COAHTML = COAHTML + "</table></div>";
                                    }
                                } COAHTML = COAHTML + "</div></div>";
                            }
                        } COAHTML = COAHTML + "</div><div><table style='width: 100%;'><tr><td class='Ac-Code'></td><td class='Ac-Name2'>" + dsTop.Tables[0].Rows[i][7] + " Totals</td><td class='oDr'>" + dsTop.Tables[0].Rows[i][1] + "</td><td class='oCr'>" + dsTop.Tables[0].Rows[i][2] + "</td><td class='cDr'>" + dsTop.Tables[0].Rows[i][3] + "</td><td class='cCr'>" + dsTop.Tables[0].Rows[i][4] + "</td><td class='tDr'>" + dsTop.Tables[0].Rows[i][5] + "</td><td class='tCr'>" + dsTop.Tables[0].Rows[i][6] + "</tr></table></div>";
                    }
                    COAHTML = COAHTML + "</div><br/><br/><table class='tAcHead'><tr><td class='xhead'>Totals</td><td class='oDr'>" + oDr + "</td><td class='oCr'>" + oCr + "</td><td class='cDr'>" + Dr + "</td><td class='cCr'>" + Cr + "</td><td class='tDr'>" + cDr + "</td><td class='tCr'>" + cCr + "</tr></table>";
                    context.Response.ContentType = "text/HTML";
                    context.Response.Write(COAHTML);
                }
                catch (Exception e)
                {
                    string ssssss = e.Message;
                    string tttt = ssssss;
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