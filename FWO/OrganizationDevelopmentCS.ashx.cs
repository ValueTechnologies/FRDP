using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for OrganizationDevelopmentCS
    /// </summary>
    public class OrganizationDevelopmentCS : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            MyClass Fn = new MyClass();
            try
            {
                //var frmdata = context.Request.Form["vls"];

                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');


                string id = d[0].Replace("_", "");
                id = id.Replace("#", "");
                id = id.Replace("imgprvw", "");


                if (context.Request.Files.Count > 0 )
                {
                    HttpFileCollection SelectedFiles = context.Request.Files;

                    for (int i = 0; i < SelectedFiles.Count; i++)
                    {
                        HttpPostedFile PostedFile = SelectedFiles[i];
                        string FileName = context.Server.MapPath("~/Uploads/OrganizationDevelopment/" + PostedFile.FileName);
                        string Path = context.Server.MapPath("~/Uploads/OrganizationDevelopment/");
                        FileInfo fi = new FileInfo(FileName);
                        //int fileID = id;

                        Fn.Exec("UPDATE tblOD_Process SET  Procc = 'Uploads/OrganizationDevelopment/" + id + "" + fi.Extension + "' where ID = " + id);

                        PostedFile.SaveAs(Path + Convert.ToString(id) + fi.Extension);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Activity Uploaded Successfully!");
                    }
                }
                    
            }
            catch (Exception ex)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(ex.Message);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}