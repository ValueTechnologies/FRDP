using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_DriverAllocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void P12_Button_Save_Click(object sender, EventArgs e)
        {
            if (P12_DropDownList_Driver.Items.Count > 0 && P12_DropDownList_Vehicle.Items.Count > 0)
            {
                P12_SqlDataSource_Save.Insert();
            }
            P12_DropDownList_Vehicle.DataBind();
            P12_DropDownList_Driver.DataBind();
            P12_GridView_Save.DataBind();
        }



        protected void LinkButton1_Click1(object sender, EventArgs e)
        {

        }
        protected void P12_SqlDataSource_Save_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            P12_DropDownList_Driver.DataBind();
            P12_DropDownList_Vehicle.DataBind();
        }

    }
}