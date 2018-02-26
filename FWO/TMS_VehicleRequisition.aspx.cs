using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class TMS_VehicleRequisition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void P14_RadioButtonList_Demanded0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void P15_Button_Save_Click(object sender, EventArgs e)
        {

            DateTime t1 = DateTime.ParseExact(P15_WebDateChooser1.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime t2 = Convert.ToDateTime(P15_HiddenField_FromDateTime.Value);//Request.Form[P15_WebDateTimeEdit1.ClientID]);//P15_WebDateTimeEdit1.Text);
            DateTime t3 = Convert.ToDateTime(t1.ToShortDateString() + " " + t2.ToLongTimeString());
            DateTime t4 = DateTime.ParseExact(P15_WebDateChooser2.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            P15_HiddenField_ToDate.Value = Convert.ToString(t4);
            P15_HiddenField_FromDateTime.Value = Convert.ToString(t3);
            t2 = Convert.ToDateTime(P15_HiddenField_ToDateTime.Value);//Request.Form[P15_WebDateTimeEdit2.ClientID]);//P15_WebDateTimeEdit2.Text);
            t3 = Convert.ToDateTime(t1.ToShortDateString() + " " + t2.ToLongTimeString());
            P15_HiddenField_ToDateTime.Value = Convert.ToString(t3);
            if (P15_TextBox_Location.Text != "")
            {
                try
                {
                    if (DatesCheck(P15_WebDateChooser1.Text, P15_WebDateChooser2.Text))
                    {
                        P15_SqlDataSource_Save.Insert();
                        P15_TextBox_Location.Text = "";
                    }
                }
                catch (Exception ex)
                {

                    Response.Write(ex.Message);
                }

                Label77.Visible = false;

                P15_GridView_Save.DataBind();
            }
            else
            {
                Label77.Visible = true;
            }


        }

        private bool DatesCheck(string _FromDate, string _ToDate)
        {
            //////TimeSpan TS = new TimeSpan();
            //////bool val;
            //////TS = Convert.ToDateTime(_FromDate.Value) - DateTime.Now;
            //////if (TS.Days >= 0)
            //////{
            //////    TS = Convert.ToDateTime(_ToDate.Value) - Convert.ToDateTime(_FromDate.Value);
            //////    if (TS.Days + 1 > 0)
            //////    {
            //////        _FromDate.BorderColor = System.Drawing.Color.Black;
            //////        _ToDate.BorderColor = System.Drawing.Color.Black;
            //////        val = true;
            //////    }
            //////    else
            //////    {
            //////        _FromDate.BorderColor = System.Drawing.Color.Red;
            //////        _ToDate.BorderColor = System.Drawing.Color.Red;
            //////        val = false;

            //////    }
            //////}
            //////else
            //////{
            //////    _FromDate.BorderColor = System.Drawing.Color.Red;
            //////    _FromDate.ToolTip = "Enty of Privious Date is is prohabited";
            //////    val = false;
            //////}
            //////return val;
            return true;
        }

    }
}