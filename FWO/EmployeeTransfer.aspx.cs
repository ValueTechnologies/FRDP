using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class EmployeeTransfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShowRpt_Click(object sender, EventArgs e)
        {
            SetMenue.SET();
        }

        [WebMethod]
        public static string GetEmpList(string vals) 
        {
            string[] v = vals.Split('½');
            DSBD Ds = new DSBD();
            DSBDTableAdapters.EmployeeDataTableTableAdapter da = new DSBDTableAdapters.EmployeeDataTableTableAdapter();
            da.Fill(Ds.EmployeeDataTable, v[0], v[1]);
            // DataTable dt = Ds.Tables["EmployeeDataTable"];
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in Ds.Tables["EmployeeDataTable"].Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in Ds.Tables["EmployeeDataTable"].Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }
    }
}