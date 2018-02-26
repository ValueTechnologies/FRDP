using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FRDP
{
    public partial class AdminDepartments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SDDept.Insert();
            GridView1.DataBind();
           // Response.Write("<script language=JavaScript> alertR('Record Saved'); </script>");

            //StringBuilder sb = new StringBuilder();
            //sb.Append("<script language='javascript'>");
            //sb.Append("alertG(' Record Saved..! ')</script>");
            //Type t = this.GetType();
            //if (!(ClientScript.IsClientScriptBlockRegistered(t, "PopupScript")))
            //{
            //    ClientScript.RegisterClientScriptBlock(t, "PopUpScript", sb.ToString());
            //}
        }
    }
}