using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class AGP : System.Web.UI.Page
    {
        String constr = Convert.ToString(ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"].ConnectionString);
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            if (gvPGselect.Rows.Count > 0)
            {
                for (int i = 0; i < gvPGselect.Rows.Count; i++)
                {
                    HiddenField hfpid = (HiddenField)gvPGselect.Rows[i].FindControl("HFPID");
                    CheckBox ch = (CheckBox)gvPGselect.Rows[i].FindControl("CheckBox1");
                    RadioButton r1 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton1");
                    RadioButton r2 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton2");
                    RadioButton r3 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton3");
                    HiddenFieldPageID.Value = hfpid.Value;
                    if (ch.Checked==true)
                    {
                        if (r1.Checked==true)
                        {
                            HiddenField_Access.Value = "1";
                        }
                        if (r2.Checked == true)
                        {
                            HiddenField_Access.Value = "2";
                        }
                        if (r3.Checked == true)
                        {
                            HiddenField_Access.Value = "3";
                        }
                        SqlDataSourceDeletePage.Delete();
                        SqlDataSourceSave.Insert();
                    }
                    else
                    {
                        SqlDataSourceDeletePage.Delete();
                    }
                }
                GridView1.DataBind();
            }
            string hu = "alertG('Record  Saved');$('#dvAddGroup').dialog('close');";
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "jscript", hu, true);



            //try
            //{
            //    for (int i = 0; i <= CheckBoxListPage.Items.Count - 1; i++)
            //    {
            //        if (CheckBoxListPage.Items[i].Selected == true)
            //        {
            //            HiddenFieldPageID.Value = CheckBoxListPage.Items[i].Value;
            //            if (checkAlreadyValue(Convert.ToInt32(CheckBoxListPage.Items[i].Value), Convert.ToInt32(DropDownLisGroupName.SelectedValue)) >= 1)
            //            {
            //                SqlDataSourceDeletePage.Delete();
            //            }
            //            SqlDataSourceSave.Insert();
            //        }

            //        else
            //        {
            //            HiddenFieldPageID.Value = CheckBoxListPage.Items[i].Value;
            //            if (checkAlreadyValue(Convert.ToInt32(CheckBoxListPage.Items[i].Value), Convert.ToInt32(DropDownLisGroupName.SelectedValue)) >= 1)
            //            {
            //                SqlDataSourceDeletePage.Delete();
            //            }
            //        }

            //    }
            //    GridView1.DataBind();
            //}
            //catch (Exception ex)
            //{

            //    Response.Write(ex.Message);
            //}
        }

        private int checkAlreadyValue(int page_id, int Group_ID)
        {
            try
            {
                con.ConnectionString = constr;
                SqlCommand command = new SqlCommand("SELECT ID FROM Admin_Group_Module_Pages WHERE (Page_ID = @Page_ID) AND (User_Group_Id = @User_Group_Id)", con);
                con.Open();
                command.Parameters.AddWithValue("@Page_ID", page_id);
                command.Parameters.AddWithValue("@User_Group_Id", Group_ID);
                int count = Convert.ToInt32(command.ExecuteScalar());
                con.Close();
                return count;
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
                return 0;
            }
        }

        protected void ButtonCheckall_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i <= CheckBoxListPage.Items.Count - 1; i++)
                {
                    if (!Convert.ToBoolean(CheckBoxListPage.Items[i].Selected))
                    {
                        CheckBoxListPage.Items[i].Selected = true;
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

        protected void ButtonUnCheck_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < CheckBoxListPage.Items.Count; i++)
                {
                    if (Convert.ToBoolean(CheckBoxListPage.Items[i].Selected))
                    {
                        CheckBoxListPage.Items[i].Selected = false;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnSaveGroup_Click(object sender, EventArgs e)
        {
            SqlDataSourceGroupName.Insert();
            DropDownLisGroupName.DataBind();
            string hu = "alert('Record  Saved');$('#dvAddGroup').dialog('close');";
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "jscript", hu, true);
        
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (gvPGselect.Rows.Count>0)
            {
                CheckBox c = (CheckBox)sender;
                for (int i = 0; i < gvPGselect.Rows.Count; i++)
                {
                    CheckBox ch = (CheckBox)gvPGselect.Rows[i].FindControl("CheckBox1");
                    ch.Checked = c.Checked;
                }
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (gvPGselect.Rows.Count > 0)
            {
                for (int i = 0; i < gvPGselect.Rows.Count; i++)
                {
                    RadioButton r1 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton1");
                    RadioButton r2 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton2");
                    RadioButton r3 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton3");

                    r2.Checked = false;
                    r3.Checked = false;
                    r1.Checked = true;
                }
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (gvPGselect.Rows.Count > 0)
            {
               // RadioButton r = (RadioButton)sender;
                for (int i = 0; i < gvPGselect.Rows.Count; i++)
                {
                    RadioButton r1 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton1");
                    RadioButton r2 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton2");
                    RadioButton r3 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton3");
                    r1.Checked = false;

                    r3.Checked = false;
                    r2.Checked= true;
                }
            }
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            if (gvPGselect.Rows.Count > 0)
            {
                for (int i = 0; i < gvPGselect.Rows.Count; i++)
                {
                    RadioButton r1 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton1");
                    RadioButton r2 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton2");
                    RadioButton r3 = (RadioButton)gvPGselect.Rows[i].FindControl("RadioButton3");
                    r1.Checked = false;
                    r2.Checked = false;
                    r3.Checked = true;

                }
            }

        }
    }
}