using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;


namespace FRDP
{
    /// <summary>
    /// Summary description for UploadKMZ
    /// </summary>
    public class UploadKMZ : IHttpHandler, IRequiresSessionState
    {
        private MyClass Fn = new MyClass();
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                
                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');
                int benID = 0;
                try
                {
                    benID = Convert.ToInt32(Convert.ToString(HttpContext.Current.Session["Emp_Id"]));
                }
                catch 
                {
                    
                    context.Response.Redirect("logout.aspx");
                } 


                if (context.Request.Files.Count > 0 && benID > 0)
                {
                    HttpFileCollection SelectedFiles = context.Request.Files;

                    for (int i = 0; i < SelectedFiles.Count; i++)
                    {
                        HttpPostedFile PostedFile = SelectedFiles[i];
                        string FileName = context.Server.MapPath("~/Uploads/KMZ/" + PostedFile.FileName);
                        string Path = context.Server.MapPath("~/Uploads/KMZ/");
                        FileInfo fi = new FileInfo(FileName);
                        decimal fileID = Convert.ToDecimal(d[0]);

                        Fn.Exec(@"UPDATE       tblSlum
                                SET                KMZFileExtention = '" + fi.Extension + @"', dtKMZFileUploadedDate =GETDATE(), KMZ_Emp =" + Convert.ToString(benID) + @"
                                WHERE        (tblSlumID = " + d[0] + @")");
                        
                        PostedFile.SaveAs(Path + Convert.ToString(d[0]) + fi.Extension);
                        //if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        //{
                        //    Bitmap Thumbnail = CreateThumbnail(Path + d[1] + "_" + Convert.ToString(fileID) + fi.Extension, 32, 32);
                        //    string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/SlumPhotos/", d[1] + "A" + Convert.ToString(fileID) + fi.Extension);
                        //    Thumbnail.Save(SaveAsThumbnail);
                        //}

                        //if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        //{
                        //    Bitmap Thumbnail = CreateThumbnail(Path + d[1] + "_" + Convert.ToString(fileID) + fi.Extension, 75, 75);
                        //    string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/SlumPhotos/", d[1] + "B" + Convert.ToString(fileID) + fi.Extension);
                        //    Thumbnail.Save(SaveAsThumbnail);
                        //}

                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Record Saved");

                    }
                }

                else if (benID > 0)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Record Saved");
                }

                //context.Response.ContentType = "text/plain";
                //context.Response.Write("Files Uploaded Successfully!!");
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