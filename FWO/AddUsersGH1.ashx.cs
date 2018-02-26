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
    public class AddUsersGH1 : IHttpHandler, IRequiresSessionState
    {
        private MyClass Fn = new MyClass();
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');

                int benID = Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)));

                using (DBDataContext db = new DBDataContext())
                {
                    //if (db.TblHResources.Where(v => v.Email == d[5]).Count() == 0)
                    //{
                       // TblHResource obj = new TblHResource();
                    var obj = db.TblHResources.Where(v => v.User_ID == benID).FirstOrDefault();
                    if (obj!=null)
                    {
                        
                    }
                       
                        obj.ContactNos = d[0];
                        obj.Email = d[1];
                        obj.U_Pass = Encryptor.Encrypt(d[2].Replace("'", ""));
                        db.SubmitChanges();
                        

                        Fn.ExenID(@"UPDATE Login
                         SET Password='" + obj.U_Pass + "' WHERE Emp_Id="+benID);
                    //}
                    //else
                    //{
                    //    context.Response.ContentType = "text/plain";
                    //    context.Response.Write("Record Already Exists");
                    //}
                }


                if (context.Request.Files.Count > 0 && benID > 0)
                {
                    HttpFileCollection SelectedFiles = context.Request.Files;

                    for (int i = 0; i < SelectedFiles.Count; i++)
                    {
                        HttpPostedFile PostedFile = SelectedFiles[i];
                        string FileName = context.Server.MapPath("~/Uploads/EmployeePhoto/" + PostedFile.FileName);
                        string Path = context.Server.MapPath("~/Uploads/UserPhoto/");
                        FileInfo fi = new FileInfo(FileName);
                        int fileID = benID;

                        using (DBDataContext db = new DBDataContext())
                        {
                            var o = db.TblHResources.Where(v => v.User_ID == fileID).FirstOrDefault();
                            if (o != null)
                            {
                                o.PhotoExtension = fi.Extension;
                                //o.DisplayName = fi.Extension;
                                db.SubmitChanges();
                            }
                        }
                        PostedFile.SaveAs(Path + Convert.ToString(fileID) + fi.Extension);
                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path + Convert.ToString(fileID) + fi.Extension, 32, 32);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/UserPhoto/", Convert.ToString(fileID) + "A" + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }

                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path + Convert.ToString(fileID) + fi.Extension, 75, 75);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/UserPhoto/", Convert.ToString(fileID) + "B" + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }



                        //using (DBDataContext db =  new DBDataContext())
                        //{
                        //    db.sp_RegisterEmpWithLogin(d[0], d[1], "", "", "", d[2], d[5], "", d[3], 1, 1, DateTime.Now, Encryptor.Encrypt(d[6].Replace("'", "")), Convert.ToInt32(d[4]), Convert.ToString(benID)+"."+ fi.Extension);
                        //}



                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Record Saved");

                    }
                }

                else if (benID > 0)
                {
                    //using (DBDataContext db = new DBDataContext())
                    //{
                    //    db.sp_RegisterEmpWithLogin(d[0], d[1], "", "", "", d[2], d[5], "", d[3], 1, 1, DateTime.Now, Encryptor.Encrypt(d[6].Replace("'", "")), Convert.ToInt32(d[4]), null);
                    //}
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


        public Bitmap CreateThumbnail(string ImagePath, int ThumbnailWidth, int ThumbnailHeight)
        {
            System.Drawing.Bitmap Thumbnail = null;
            try
            {
                Bitmap ImageBMP = new Bitmap(ImagePath);
                ImageFormat loFormat = ImageBMP.RawFormat;

                decimal lengthRatio;
                int ThumbnailNewWidth = 0;
                int ThumbnailNewHeight = 0;
                decimal ThumbnailRatioWidth;
                decimal ThumbnailRatioHeight;

                // If the uploaded image is smaller than a thumbnail size the just return it
                if (ImageBMP.Width <= ThumbnailWidth && ImageBMP.Height <= ThumbnailHeight)
                    return ImageBMP;

                // Compute best ratio to scale entire image based on larger dimension.
                if (ImageBMP.Width > ImageBMP.Height)
                {
                    ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                    ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                    lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                    ThumbnailNewWidth = ThumbnailWidth;
                    decimal lengthTemp = ImageBMP.Height * lengthRatio;
                    ThumbnailNewHeight = (int)lengthTemp;
                }
                else
                {
                    ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                    ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                    lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                    ThumbnailNewHeight = ThumbnailHeight;
                    decimal lengthTemp = ImageBMP.Width * lengthRatio;
                    ThumbnailNewWidth = (int)lengthTemp;
                }
                Thumbnail = new Bitmap(ThumbnailNewWidth, ThumbnailNewHeight);
                Graphics g = Graphics.FromImage(Thumbnail);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.FillRectangle(Brushes.White, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);
                g.DrawImage(ImageBMP, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);

                ImageBMP.Dispose();
            }
            catch
            {
                return null;
            }

            return Thumbnail;
        }









    }
}