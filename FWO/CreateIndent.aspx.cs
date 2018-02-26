using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class CreateIndent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string MakeIndent(string h, string i, string con, string thisid)
        {
            string ret="";
            JavaScriptSerializer jss = new JavaScriptSerializer();
            var head = jss.Deserialize<Dictionary<string, dynamic>>(h);
            if (thisid=="0")
            {
            dynamic ai = JObject.Parse(i);
            decimal? tblInvIndentMainID=0;
            string tblInvIndentNo="";
            using (DBDataContext db = new DBDataContext())
            {
                db.sp_tblInvIndentMain_Insert(Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))), Convert.ToInt32(con), Convert.ToDecimal(head["Head"]["StoreID"]), Convert.ToString(head["Head"]["StoreName"]), Convert.ToString(head["Head"]["Subject"]), Convert.ToString(head["Head"]["Description"]), ref tblInvIndentMainID, ref tblInvIndentNo);
                List<tblInvIndentSub> l = new List<tblInvIndentSub>();
                foreach (var item in ai.Items)
                {
                    var f = item;
                    tblInvIndentSub o = new tblInvIndentSub();
                    o.ItemName = item.ItemName;
                    o.Quality = item.Quality;
                    o.Quantity = item.Quantity;
                    o.tblInvIndentMainID = tblInvIndentMainID;
                    o.temID = item.ItemID;
                    o.Unit = item.Unit;
                    l.Add(o);
                }
                db.tblInvIndentSubs.InsertAllOnSubmit(l);
                db.SubmitChanges();
            }
           ret= Convert.ToString(tblInvIndentMainID) + "½" + tblInvIndentNo;
            }
            else
            {
                MyClass Fn = new MyClass();
                Fn.Exec("delete [dbo].[tblInvIndentSub] where tblInvIndentMainID=" + thisid.Split('½')[0]);
                Fn.Exec(@"UPDATE       tblInvIndentMain
                        SET                Status ='" + con + @"', ToStoreID ='" + Convert.ToString(head["Head"]["StoreID"]) + @"', StoreName ='" + Convert.ToString(head["Head"]["StoreName"]) + @"', Subject ='" + Convert.ToString(head["Head"]["Subject"]) + @"', Description ='" + Convert.ToString(head["Head"]["Description"]) + @"'
                        WHERE        (tblInvIndentMainID = " + thisid.Split('½')[0] + @" )");
                using (DBDataContext db = new DBDataContext())
                {
                    dynamic ai = JObject.Parse(i);
                    List<tblInvIndentSub> l = new List<tblInvIndentSub>();
                    foreach (var item in ai.Items)
                    {
                        var f = item;
                        tblInvIndentSub o = new tblInvIndentSub();
                        o.ItemName = item.ItemName;
                        o.Quality = item.Quality;
                        o.Quantity = item.Quantity;
                        o.tblInvIndentMainID = Convert.ToDecimal(thisid.Split('½')[0]);
                        o.temID = item.ItemID;
                        o.Unit = item.Unit;
                        l.Add(o);
                    }
                    db.tblInvIndentSubs.InsertAllOnSubmit(l);
                    db.SubmitChanges();
                }
                ret = thisid;
            }
            return ret;
        }
    }
}