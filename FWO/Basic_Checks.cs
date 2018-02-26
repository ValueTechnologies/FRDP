using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FRDP
{
    public static class Basic_Checks
    {
        public static bool _Textbox_Not_Empty(TextBox _TextBox_ID, Label _Label_ID, string _Message_String)
        {
            bool val = true;
            if (_TextBox_ID.Text == "")
            {
                _TextBox_ID.BorderColor = System.Drawing.Color.Red;
                _TextBox_ID.BorderStyle = BorderStyle.Dotted;
                _Label_ID.Visible = true;
                _Label_ID.ForeColor = System.Drawing.Color.Red;
                _Label_ID.Text = _Message_String;
                val = false;
            }
            else
            {
                _TextBox_ID.BorderStyle = BorderStyle.NotSet;
                _TextBox_ID.BorderColor = System.Drawing.Color.Black;
                _Label_ID.Visible = false;
            }
            return val;
        }
    }
}