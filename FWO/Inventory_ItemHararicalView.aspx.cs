using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class Inventory_ItemHararicalView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<sp_inv_OrderedListResult> o = new List<sp_inv_OrderedListResult>();
            using (DBDataContext db = new DBDataContext())
            {
                o = db.sp_inv_OrderedList().ToList<sp_inv_OrderedListResult>();
            }
            if (o.Count > 0)
            {
                string list = "<ul id='tree'><li tg='" + o[0].tblInvItemsID + "'>";
                int flag = 0;
                for (int i = 0; i < o.Count; i++)
                {
                    list += o[i].fullCodeName + "<img class='adder' src='Images/addrecord.png' title='Add New Child'><img  lid=' + itm.tblInvItemsID + ' title='Edit Info' class='editor' src='Images/EditInfo.png'>";
                    if (i < o.Count - 1)
                    {


                        if (o[i].lvl == o[i + 1].lvl)
                        {
                            list += "</li><li tg='" + o[i + 1].tblInvItemsID + "'>";
                            flag = 0;
                        }
                        if (o[i].lvl < o[i + 1].lvl)
                        {
                            list += "<ul><li tg='" + o[i + 1].tblInvItemsID + "'>";
                            flag = -1;
                        }
                        if (o[i].lvl > o[i + 1].lvl)
                        {
                            list += "</li></ul><li tg='" + o[i + 1].tblInvItemsID + "'>";
                            flag = 1;
                        }
                    }
                    else
                    {
                        if (flag == 0)
                        {
                            list += "</li></ul>";
                        }
                        if (flag == -1)
                        {
                            list += "</ul></li></ul>";
                        }
                        if (flag == 1)
                        {
                            list += "</li></ul>";
                        }

                    }
                }
                lbllist.Text = list;
            }
        }
    }
}