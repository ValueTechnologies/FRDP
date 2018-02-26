using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class behram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = TextBox1.Text;
            string[] arr = s.Split('½');
            string res = "";
            foreach (var item in arr)
            {
                res += item + "\n";
            }
            TextBox2.Text = res;
        }
    }
}