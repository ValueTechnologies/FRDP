using System;
using System.Web;
using System.Web.Services;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;


namespace FRDP
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.RemoveAll();
            //Session.Abandon();
            //Response.Cookies["UserID"].Value = null;
            //Response.Cookies["username"].Value = null;
            //Response.Cookies["GroupID"].Value = null;

            //HttpCookie aCookie;
            //string cookieName;
            //int limit = Request.Cookies.Count;
            //for (int i = 0; i < limit; i++)
            //{
            //    cookieName = Request.Cookies[i].Name;
            //    aCookie = new HttpCookie(cookieName);
            //    aCookie.Expires = DateTime.Now.AddDays(-1);
            //    Response.Cookies.Add(aCookie);
            //}
            //Response.Redirect("default.aspx");
        }

        [WebMethod]
        public static string RemoveAllCookies()
        {
            List<string> cookieslist = new List<string>();
            HttpCookie aCookie;
            string cookieName;
            int limit = HttpContext.Current.Request.Cookies.Count;
            for (int i = 0; i < limit; i++)
            {
                cookieName = HttpContext.Current.Request.Cookies[i].Name;
                cookieslist.Add(cookieName);
                aCookie = new HttpCookie(cookieName);
                aCookie.Expires = DateTime.Now.AddDays(-1);
                HttpContext.Current.Response.Cookies.Add(aCookie);
            }


            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
            try
            {
                HttpContext.Current.Request.Cookies["UserID"].Value = null;
            }
            catch (Exception)
            {
                
                
            }
            try
            {
HttpContext.Current.Request.Cookies["username"].Value = null;
            }
            catch (Exception)
            {
                
                
            }
            try
            {
HttpContext.Current.Request.Cookies["GroupID"].Value = null;
            }
            catch (Exception)
            {
                
                
            }
            

            return new JavaScriptSerializer().Serialize(cookieslist);
        }
    }
}