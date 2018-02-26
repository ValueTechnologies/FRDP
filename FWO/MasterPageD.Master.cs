using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class MasterPageD : System.Web.UI.MasterPage
    {




        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToString(Session["bIsEmployee"]) == "")
                {
                    Session.Add("bIsEmployee", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["bIsEmployee"]).Value)));
                }

                if (Convert.ToString(Session["ActYr"]) == "")
                {
                    Session.Add("ActYr", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["ActYr"]).Value)));
                }
                if (Convert.ToString(Session["ActYr2"]) == "")
                {
                    Session.Add("ActYr2", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["ActYr2"]).Value)));
                }
                if (Convert.ToString(Session["ActMth"]) == "")
                {
                    Session.Add("ActMth", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["ActMth"]).Value)));
                }
                if (Convert.ToString(Session["CodeSt"]) == "")
                {
                    Session.Add("CodeSt", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["CodeSt"]).Value)));
                }
                if (Convert.ToString(Session["br"]) == "")
                {
                    Session.Add("br", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["br"]).Value)));
                }
                if (Convert.ToString(Session["fy"]) == "")
                {
                    Session.Add("fy", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["fy"]).Value)));
                }

                if (Convert.ToString(Session["EmpName"]) == "")
                {
                    Session.Add("EmpName", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["EmpName"]).Value)));
                }
                if (Convert.ToString(Session["Emp_Id"]) == "")
                {
                    Session.Add("Emp_Id", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)));
                }
                if (Convert.ToString(Session["User_Group_ID"]) == "")
                {
                    Session.Add("User_Group_ID", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["User_Group_ID"]).Value)));
                }
                if (Convert.ToString(Session["UserID"]) == "")
                {
                    Session.Add("UserID", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["UserID"]).Value)));
                }
                if (Convert.ToString(Session["username"]) == "")
                {
                    Session.Add("username", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["username"]).Value)));
                }
                if (Convert.ToString(Session["onlyname"]) == "")
                {
                    Session.Add("onlyname", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["onlyname"]).Value)));
                }
                if (Convert.ToString(Session["GroupID"]) == "")
                {
                    Session.Add("GroupID", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["GroupID"]).Value)));
                }
                if (Convert.ToString(Session["ContactNo"]) == "")
                {
                    Session.Add("ContactNo", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["ContactNo"]).Value)));
                }
                if (Convert.ToString(Session["email"]) == "")
                {
                    Session.Add("email", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["email"]).Value)));
                }
                if (Convert.ToString(Session["designation"]) == "")
                {
                    Session.Add("designation", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["designation"]).Value)));
                }
                if (Convert.ToString(Session["picExt"]) == "")
                {
                    Session.Add("picExt", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["picExt"]).Value)));
                }
                if (Convert.ToString(Session["CompanyID"]) == "")
                {
                    Session.Add("CompanyID", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["CompanyID"]).Value)));
                }
                if (Convert.ToString(Session["Amonth"]) == "")
                {
                    Session.Add("Amonth", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["xx"]).Value)));
                }

                if (Convert.ToString(Session["OfficeId"]) == "")
                {
                    Session.Add("OfficeId", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["yy"]).Value)));
                }
                if (!Page.IsPostBack)
                {
                    if (Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["UserID"]).Value) == "")
                    {
                        Response.Redirect("logout.aspx");
                    }

                    if (Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value) == "")
                    {
                        Response.Redirect("logout.aspx");
                    }
                    else
                    {
                        if (Convert.ToString(Session["cssmenue"]) == "")
                        {
                            string em = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value));
                            cssMenu cssmenue = new cssMenu(Convert.ToInt32(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)));
                            Session.Add("cssmenue", cssmenue.main());
                            string ssssssssssss = Convert.ToString(Session["cssmenue"]);

                        }

                    }



                }
            }
            catch
            {

                Response.Redirect("LogOut.aspx");
            }

        }

        protected void Page_Unload(object sender, EventArgs e)
        {

        }
    }


}