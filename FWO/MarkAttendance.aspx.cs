using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class MarkAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownList_year.Items.Clear();
                DropDownList_Month.SelectedValue = Convert.ToString(DateTime.Today.Month);

                for (int count = 0; count < (DateTime.Today.Year + 5) - 2015; count++)
                {
                    ListItem l = new ListItem() { Text = Convert.ToString(2015 + count), Value = Convert.ToString(2015 + count) };
                    DropDownList_year.Items.Insert(count, l);
                }
                DropDownList_year.SelectedValue = Convert.ToString(DateTime.Today.Year);

            }

        }

        protected void ddlOfficeTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlOfficeTypes.SelectedValue == "3")
            //{
            //    lblDsu.Visible = true;
            //    ddlDSU.Visible = true;
            //}
            //else
            //{
            //    lblDsu.Visible = false;
            //    ddlDSU.Visible = false;
            //}
        }
    }
}