using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class accrptBudgets : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static String Lists()
        {
            return "{ \"Gender\":[{\"txt\":\"Male\"},{\"txt\":\"Female\"}],\"Hanicap\":[{\"txt\":\"No\"},{\"txt\":\"Yes\"}],\"SessionName\":" + Fn.Data2Json("SELECT SessionName as txt FROM tblED_Sessions") + ",\"BudgetTitle\":" + Fn.Data2Json("SELECT BudgetTitle as txt FROM tblBudgetHDR GROUP BY BudgetTitle") + ",\"SessionName\":" + Fn.Data2Json("SELECT SessionName as txt FROM tblAC_Year GROUP BY SessionName") + ",\"ClassGroup_ID\":[{\"txt\":\"General\"},{\"txt\":\"Pre Medical\"},{\"txt\":\"Pre Engineering\"},{\"txt\":\"Computer\"}],\"Father_Prof\":[{\"txt\":\"Other\"},{\"txt\":\"Govt.\"},{\"txt\":\"Teacher\"},{\"txt\":\"Business\"}],\"Stat\":[{\"txt\":\"Enrolled\"},{\"txt\":\"Withdrawal\"},{\"txt\":\"Struck off\"}]}";
        }

        protected void btnExcel_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            GridView gv = new GridView();
            string[] str = HttpUtility.UrlDecode(Request.Cookies["str"].Value).Split('|');
            Fn.fillGrid(gv, str[0] + " '" + str[1] + "','" + str[2] + "','" + str[3] + "','" + str[4] + "'");
            ToExcel(gv);
        }

        private void ToExcel(GridView gv)
        {
            string attachment = "attachment; filename=ExcelSheet.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gv.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }
}