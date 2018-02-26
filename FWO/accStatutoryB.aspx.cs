using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class accStatutoryB : System.Web.UI.Page
    {
       public MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (DBDataContext db = new DBDataContext())
                {

                    try
                    {
                        var yrDTL = db.sp_yrDtl(Convert.ToInt32(ddYear.SelectedValue)).FirstOrDefault();
                        //var yr = db.tblAC_Years.Where(v => v.Session_ID == Convert.ToInt32(ddYear.SelectedValue)).FirstOrDefault();
                        //if (yr != null)
                        //{

                        //}
                        //string S = yrDTL.
                        //txFrom.Text = Convert.ToString(yrDTL.DT1);
                        //txTo.Text = Convert.ToString(yrDTL.DT2);
                        txFrom0.Text = Convert.ToString(yrDTL.DT3);
                        txTo0.Text = Convert.ToString(yrDTL.DT4);
                        txH1.Text = Convert.ToString(yrDTL.T1);
                        txH2.Text = Convert.ToString(yrDTL.T2);


                        txFrom.Text ="30 June "+ Convert.ToString(yrDTL.T1);
                        txTo.Text = "30 June "+Convert.ToString(yrDTL.T2);

                        Response.Cookies["txH1"].Value = Convert.ToString(yrDTL.T1);
                        Response.Cookies["txH1"].Expires = DateTime.Now.AddDays(1);

                        Response.Cookies["txH2"].Value = Convert.ToString(yrDTL.T2);
                        Response.Cookies["txH2"].Expires = DateTime.Now.AddDays(1);
                        lblDates.Text = "For the year ended 30 June " + Convert.ToString(yrDTL.T1);
                        GridView1.Visible = true;
                        gvHeads.Visible = true;
                    }
                    catch (Exception)
                    {
                        GridView1.Visible = false;
                        gvHeads.Visible = false;
                       // throw;
                    }

                }

                

            }
        }

        private decimal grdTotal = 0;
        private decimal DrTotal = 0;
        private decimal CrTotal = 0;

        protected void gvLadger_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //decimal rowTotal = Convert.ToDecimal

                //(DataBinder.Eval(e.Row.DataItem, "bf"));
                //grdTotal = grdTotal + rowTotal;

                //decimal Dr = Convert.ToDecimal
                //(DataBinder.Eval(e.Row.DataItem, "dr"));
                //DrTotal = DrTotal + Dr;

                //decimal Cr = Convert.ToDecimal
                //(DataBinder.Eval(e.Row.DataItem, "cr"));
                //CrTotal = CrTotal + Cr;

                //Label lbl = (Label)e.Row.FindControl("lblTotal");
                //lbl.Text = grdTotal.ToString("#,#.00;(#,#.00)");
                //e.Row.Attributes.Add("id", DataBinder.Eval(e.Row.DataItem, "VoucherID").ToString());
                //e.Row.ToolTip = "Click to view voucher";
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblDr = (Label)e.Row.FindControl("lblDr");
                lblDr.Text = DrTotal.ToString("#,#.00;(#,#.00)");
                Label lblCr = (Label)e.Row.FindControl("lblCr");
                lblCr.Text = CrTotal.ToString("#,#.00;(#,#.00)");
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {

            using (DBDataContext db = new DBDataContext())
            {

                try
                {
                    var yrDTL = db.sp_yrDtl(Convert.ToInt32(ddYear.SelectedValue)).FirstOrDefault();
                    //var yr = db.tblAC_Years.Where(v => v.Session_ID == Convert.ToInt32(ddYear.SelectedValue)).FirstOrDefault();
                    //if (yr != null)
                    //{

                    //}
                    //string S = yrDTL.
                    //txFrom.Text = Convert.ToString(yrDTL.DT1);
                    //txTo.Text = Convert.ToString(yrDTL.DT2);
                    txFrom0.Text = Convert.ToString(yrDTL.DT3);
                    txTo0.Text = Convert.ToString(yrDTL.DT4);
                    txH1.Text = Convert.ToString(yrDTL.T1);
                    txH2.Text = Convert.ToString(yrDTL.T2);

                        txFrom.Text ="30 June "+ Convert.ToString(yrDTL.T1);
                        txTo.Text = "30 June "+Convert.ToString(yrDTL.T2);

                    Response.Cookies["txH1"].Value = Convert.ToString(yrDTL.T1);
                    Response.Cookies["txH1"].Expires = DateTime.Now.AddDays(1);

                    Response.Cookies["txH2"].Value = Convert.ToString(yrDTL.T2);
                    Response.Cookies["txH2"].Expires = DateTime.Now.AddDays(1);
                    GridView1.Visible = true;
                    gvHeads.Visible = true;

                    lblDates.Text = "For the year ended 30 June " + Convert.ToString(yrDTL.T1);
                }
                catch (Exception)
                {

                    
GridView1.Visible=false;
gvHeads.Visible = false;
                }

            }
           
        }
    }
}