using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_OfficerVehicleAllocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void P13_Button_Save_Click(object sender, EventArgs e)
        {
            if (P13_DropDownList_Emp.Items.Count > 0 && P13_DropDownList_Vehicle.Items.Count > 0)
            {
                P13_SqlDataSource_Save.Insert();
                P13_GridView_Save.DataBind();
            }

        }
        protected void P13_SqlDataSource_Save_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            P13_DropDownList_Emp.DataBind();
            P13_DropDownList_Vehicle.DataBind();
        }

        protected void P13_SqlDataSource_Save_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            P13_DropDownList_Emp.DataBind();
            P13_DropDownList_Vehicle.DataBind();
        }
    }
}