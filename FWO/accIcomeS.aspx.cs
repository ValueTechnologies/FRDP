﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class accIcomeS : System.Web.UI.Page
    {
        public MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

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
            lblDates.Text = "Income between " + txFrom.Text + " to " + txTo.Text;
        }
    }
}