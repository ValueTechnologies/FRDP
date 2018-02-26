using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_VehicleRequisitionManual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void P14_Button_Save_Click(object sender, EventArgs e)
        {
            DateTime t1 = DateTime.ParseExact(P14_WebDateChooser1.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime t2 = Convert.ToDateTime(P14_HiddenField_FromDateTime.Value);
            DateTime t3 = Convert.ToDateTime(t1.ToShortDateString() + " " + t2.ToLongTimeString());
            P14_HiddenField_FromDateTime.Value = Convert.ToString(t3);
            t2 = Convert.ToDateTime(P14_HiddenField_ToDateTime.Value);
            t3 = Convert.ToDateTime(t1.ToShortDateString() + " " + t2.ToLongTimeString());
            P14_HiddenField_ToDateTime.Value = Convert.ToString(t3);
            if (P14_TextBox_Location.Text != "")
            {
                P14_SqlDataSource_Save.Insert();
                Label78.Visible = false;
                P14_GridView_Save.DataBind();
            }
            else
            {
                Label78.Visible = true;
            }
        }





    }
}