using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_VehicleAllocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_P11_Save_Click(object sender, EventArgs e)
        {
            if (DropDownList_P11_Vechile_Id.Items.Count > 0)
            {
                SqlDataSource_p11_grid.Insert();
            }
            GridView_p11.DataBind();
            DropDownList_P11_Vechile_Id.DataBind();
        }

        protected void DropDownList_P11_AllocationType_Id0_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gv.RowIndex;
            DropDownList DropDownList_P11_AllocationType_Id0 = (DropDownList)GridView_p11.Rows[index].FindControl("DropDownList_P11_AllocationType_Id0");
            HiddenField HiddenField1 = (HiddenField)GridView_p11.Rows[index].FindControl("HiddenField1");
            HiddenField_P11_Update_AllocationTypeId.Value = DropDownList_P11_AllocationType_Id0.SelectedValue;
            HiddenField_P11_Update_Allocation_Id.Value = HiddenField1.Value;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlDataSource_P11_AllocationType_Id.Update();
        }
        protected void SqlDataSource_p11_grid_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            DropDownList_P11_Vechile_Id.DataBind();
        }
    }
}