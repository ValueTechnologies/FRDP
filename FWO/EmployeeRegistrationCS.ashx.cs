using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace FRDP
{
    /// <summary>
    /// Summary description for EmployeeRegistrationCS
    /// </summary>
    public class EmployeeRegistrationCS : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            MyClass Fn = new MyClass();
            try
            {
                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');
                string Empid = d[1];
                if (d[0]  == "1")
                {
                    if (context.Request.Files.Count > 0)
                    {
                        HttpFileCollection SelectedFiles = context.Request.Files;

                        for (int i = 0; i < SelectedFiles.Count; i++)
                        {
                            HttpPostedFile PostedFile = SelectedFiles[i];
                            string FileName = context.Server.MapPath("~/Uploads/EmployeePhoto/" + PostedFile.FileName);
                            string Path = context.Server.MapPath("~/Uploads/EmployeePhoto/");
                            FileInfo fi = new FileInfo(FileName);

                            Fn.Exec("UPDATE TblHResources SET PhotoExtension = '" + fi.Extension + "' where User_ID = " + Empid);
                            PostedFile.SaveAs(Path + Convert.ToString(Empid) + fi.Extension);

                            if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                            {
                                Bitmap Thumbnail = CreateThumbnail(Path + Convert.ToString(Empid) + fi.Extension, 32, 32);
                                string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/EmployeePhoto/", Convert.ToString(Empid) + "A" + fi.Extension);
                                Thumbnail.Save(SaveAsThumbnail);
                            }

                            if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                            {
                                Bitmap Thumbnail = CreateThumbnail(Path + Convert.ToString(Empid) + fi.Extension, 75, 75);
                                string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/EmployeePhoto/", Convert.ToString(Empid) + "B" + fi.Extension);
                                Thumbnail.Save(SaveAsThumbnail);
                            }
                        }
                    }
                }

                if (d[0] == "2")
                {
                    if (context.Request.Files.Count > 0)
                    {
                        HttpFileCollection SelectedFiles = context.Request.Files;

                        for (int i = 0; i < SelectedFiles.Count; i++)
                        {
                            HttpPostedFile PostedFile = SelectedFiles[i];
                            string FileName = context.Server.MapPath("~/Uploads/EmployeeCV/" + PostedFile.FileName);
                            string Path = context.Server.MapPath("~/Uploads/EmployeeCV/");
                            FileInfo fi = new FileInfo(FileName);

                            Fn.Exec("UPDATE   TblHResources SET  CVExtension = '" + fi.Extension + "' WHERE (User_ID = '" + Empid + "')");
                            PostedFile.SaveAs(Path + Convert.ToString(Empid) + fi.Extension);
                        }
                    }
                }

                if (d[0] == "3")
                {
                    if (context.Request.Files.Count > 0)
                    {
                        HttpFileCollection SelectedFiles = context.Request.Files;

                        for (int i = 0; i < SelectedFiles.Count; i++)
                        {
                            HttpPostedFile PostedFile = SelectedFiles[i];
                            string FileName = context.Server.MapPath("~/Uploads/EmployeeDocs/" + PostedFile.FileName);
                            string Path = context.Server.MapPath("~/Uploads/EmployeeDocs/");
                            FileInfo fi = new FileInfo(FileName);

                            string NewID = Fn.ExenID("INSERT INTO tbl_EmployeeDocuments (FileName, FileExtension, EntryDate, EmpID) VALUES ('" + fi.Name + "', '" + fi.Extension + "' , GETDATE(), '" + Empid + "'); Select SCOPE_IDENTITY();");

                            PostedFile.SaveAs(Path + Convert.ToString(NewID) + fi.Extension);
                        }
                    }
                }



            }
            catch (Exception ex)
            {

                context.Response.ContentType = "text/plain";
                context.Response.Write(ex.Message);
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
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}