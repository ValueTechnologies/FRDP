using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class AddUser : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetUsers()
        {
            return Fn.Data2Json("SELECT        TblHResources.User_ID, TblHResources.Full_Name, TblHResources.ContactNos, TblHResources.Email, TblHResources.U_Status, " +
                         " User_Groups.User_Group_Name AS UGroup, TblHResources.Designation AS Designations " +
"FROM            TblHResources INNER JOIN User_Groups ON TblHResources.UserGroupID = User_Groups.User_Group_Id ");
        }
        [WebMethod]
        public static string ActivateDeactivate(string ID, string Status)
        {
            if (Status == "true")
            {
                Fn.Exec("Update TblHResources SET U_Status = 0 WHERE User_ID = " + ID);
                return "Deactivated Successfully";
            }
            else
            {
                Fn.Exec("Update TblHResources SET U_Status = 1 WHERE User_ID = " + ID);
                return "Activated Successfully";
            }
        }

    }
}