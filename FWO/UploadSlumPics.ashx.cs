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
    /// Summary description for UploadSlumPics
    /// </summary>
    public class UploadSlumPics : IHttpHandler, IRequiresSessionState
    {

        private MyClass Fn = new MyClass();
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');

                int benID = Convert.ToInt32(Convert.ToString(HttpContext.Current.Session["Emp_Id"]));


                if (context.Request.Files.Count > 0 && benID > 0)
                {
                    HttpFileCollection SelectedFiles = context.Request.Files;

                    for (int i = 0; i < SelectedFiles.Count; i++)
                    {
                        HttpPostedFile PostedFile = SelectedFiles[i];
                        string FileName = context.Server.MapPath("~/Uploads/SlumPhotos/" + PostedFile.FileName);
                        string Path = context.Server.MapPath("~/Uploads/SlumPhotos/");
                        FileInfo fi = new FileInfo(FileName);
                        decimal fileID = Convert.ToDecimal(d[0]);

                        using (DBDataContext db = new DBDataContext())
                        {
                            var o = db.tblSlums.Where(v => v.tblSlumID == fileID).FirstOrDefault();
                            if (o != null)
                            {
                                if (d[1] == "1")
                                {
                                    o.photoA = fi.Extension + "½" + benID + "½" + DateTime.Now.Date;
                                    o.Caption1 = d[2];
                                }
                                if (d[1] == "2")
                                {
                                    o.photoB = fi.Extension + "½" + benID + "½" + DateTime.Now.Date;
                                    o.Caption2 = d[2];
                                }
                                if (d[1] == "3")
                                {
                                    o.photoC = fi.Extension + "½" + benID + "½" + DateTime.Now.Date;
                                    o.Caption3 = d[2];
                                }
                                if (d[1] == "4")
                                {
                                    o.photoD = fi.Extension + "½" + benID + "½" + DateTime.Now.Date;
                                    o.Caption4 = d[2];
                                }
                                if (d[1] == "5")
                                {
                                    o.photoE = fi.Extension + "½" + benID + "½" + DateTime.Now.Date;
                                    o.Caption5 = d[2];
                                }
                                db.SubmitChanges();
                            }
                        }
                        PostedFile.SaveAs(Path + d[1]+"_" + Convert.ToString(fileID) + fi.Extension);
                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path + d[1] + "_" + Convert.ToString(fileID) + fi.Extension, 32, 32);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/SlumPhotos/", d[1] + "A" + Convert.ToString(fileID) + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }

                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path + d[1] + "_" + Convert.ToString(fileID) + fi.Extension, 75, 75);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/SlumPhotos/", d[1] + "B" + Convert.ToString(fileID) + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }

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