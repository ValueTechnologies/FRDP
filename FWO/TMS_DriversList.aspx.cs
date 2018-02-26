using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_DriversList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonDriverList_Click(object sender, EventArgs e)
        {
            //if (Basic_Checks._Textbox_Not_Empty(TextBox_MobNo, Label88, "*"))
            //{
                SqlDataSource_Driver.Insert();
            //}

            DropDownList_Drivers.DataBind();
            GridViewDriverList.DataBind();
            TextBox_MobNo.Text = "";
            TextBoxCont2.Text = "";
            TextBoxCont3.Text = "";
            TextBoxLicence.Text = "";
        }
    }
}