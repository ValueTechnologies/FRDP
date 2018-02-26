using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_VehicleAllocationCategories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Basic_Checks._Textbox_Not_Empty(TextBox_VAllocation_Type, Label85, "*"))
            {
                SqlDataSource_VAllocationType.Insert();
            }

            GridView_VAllocationType.DataBind();
            TextBox_VAllocation_Description.Text = "";
            TextBox_VAllocation_Type.Text = "";
        }
    }
}