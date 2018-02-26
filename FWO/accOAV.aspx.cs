using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class accOAV : System.Web.UI.Page
    {
        public MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            string fname = DateTime.Now.ToString("yyyMMddHHmmss") + "." + e.FileName.Split('.')[1];
            Fn.Exec("INSERT INTO TblVoucherDoc(VoucherID, DocName, DocPath, DocExt)VALUES (" + Request.Cookies["VID"].Value + ", '" + e.FileName.Split('.')[0] + "', '" + fname + "', '" + e.FileName.Split('.')[1] + "')");
            string filePath = Server.MapPath("~") + "/Vouchers/" + fname;
            AjaxFileUpload1.SaveAs(filePath);
        }

        protected void btnNewVoucher_Click(object sender, EventArgs e)
        {
            Response.Redirect("./accOAV.aspx");
        }
    }
}