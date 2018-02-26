using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class FAQ : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static String PostFeedback(string name, string email, string subject, string feedback)
        {
            string tomail = Fn.GetRecords("SELECT Email FROM TblHResources WHERE (User_ID = 1)")[0];
            Fn.Exec("INSERT INTO TblFeedback(fUser, fEmail, fSubject, fComments)VALUES ('" + Fn.CleanSQL(name) + "', '" + Fn.CleanSQL(email) + "', '" + Fn.CleanSQL(subject) + "', '" + Fn.CleanSQL(feedback) + "')");
            Fn.SendEmail(tomail, subject + " - " + name, feedback, email);
            return "Thanks for feedback";
        }
    }
}