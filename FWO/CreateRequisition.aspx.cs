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
    public partial class CreateRequisition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string MakeRequisition(string h, string i, string con, string thisid)
        {
            string ret="";
            JavaScriptSerializer jss = new JavaScriptSerializer();
            var head = jss.Deserialize<Dictionary<string, dynamic>>(h);
            if (thisid=="0")
            {
            dynamic ai = JObject.Parse(i);
            decimal? tblInvReqMainID=0;
            string tblInvReqNo="";
            using (DBDataContext db = new DBDataContext())
            {
                db.sp_tblInvReqMain_Insert(Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))), Convert.ToInt32(con), Convert.ToDecimal(head["Head"]["StoreID"]), Convert.ToString(head["Head"]["StoreName"]), Convert.ToString(head["Head"]["Subject"]), Convert.ToString(head["Head"]["Description"]), ref tblInvReqMainID, ref tblInvReqNo);
                List<tblInvReqSub> l = new List<tblInvReqSub>();
                foreach (var item in ai.Items)
                {
                    var f = item;
                    tblInvReqSub o = new tblInvReqSub();
                    o.ItemName = item.ItemName;
                    o.Quality = item.Quality;
                    o.Quantity = item.Quantity;
                    o.tblInvReqMainID = tblInvReqMainID;
                    o.temID = item.ItemID;
                    o.Unit = item.Unit;
                    l.Add(o);
                }
                db.tblInvReqSubs.InsertAllOnSubmit(l);
                db.SubmitChanges();
            }
           ret= Convert.ToString(tblInvReqMainID) + "½" + tblInvReqNo;
            }
            else
            {
                MyClass Fn = new MyClass();
                Fn.Exec("delete [dbo].[tblInvReqSub] where tblInvReqMainID=" + thisid.Split('½')[0]);
                Fn.Exec(@"UPDATE       tblInvReqMain
                        SET                Status ='" + con + @"', ToStoreID ='" + Convert.ToString(head["Head"]["StoreID"]) + @"', StoreName ='" + Convert.ToString(head["Head"]["StoreName"]) + @"', Subject ='" + Convert.ToString(head["Head"]["Subject"]) + @"', Description ='" + Convert.ToString(head["Head"]["Description"]) + @"'
                        WHERE        (tblInvReqMainID = " + thisid.Split('½')[0] + @" )");
                using (DBDataContext db = new DBDataContext())
                {
                    dynamic ai = JObject.Parse(i);
                    List<tblInvReqSub> l = new List<tblInvReqSub>();
                    foreach (var item in ai.Items)
                    {
                        var f = item;
                        tblInvReqSub o = new tblInvReqSub();
                        o.ItemName = item.ItemName;
                        o.Quality = item.Quality;
                        o.Quantity = item.Quantity;
                        o.tblInvReqMainID = Convert.ToDecimal(thisid.Split('½')[0]);
                        o.temID = item.ItemID;
                        o.Unit = item.Unit;
                        l.Add(o);
                    }
                    db.tblInvReqSubs.InsertAllOnSubmit(l);
                    db.SubmitChanges();
                }
                ret = thisid;
            }
            return ret;
        }
    }
}