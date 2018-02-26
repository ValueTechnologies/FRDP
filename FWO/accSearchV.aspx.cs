using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class accSearchV : System.Web.UI.Page
    {
        public MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gvVList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gvVList, "Select$" + e.Row.RowIndex.ToString());
            }
        }
    }
}