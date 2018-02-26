using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class EmployeeAward : System.Web.UI.Page
    {
        private MyClass Fn = new MyClass();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AjaxUploadAttech_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            FileInfo fi = new FileInfo(e.FileName);
            string ext = fi.Extension;
            string[] data = HttpUtility.UrlDecode(Request.Cookies["asp_act"].Value.ToString()).Split('|');
            if (data[1] == "2")
            {
                string fileID = Fn.ExenID("INSERT INTO tblEmpDocs (UploadedFor,EmpID,FileTitle, FileExt) VALUES ('EAward'," + data[0] + ", '" + fi.Name + "', '" + ext + "');select SCOPE_IDENTITY()");
                string filePath = Server.MapPath("~") + "/Uploads/EmpDocuments/" + fileID + ext;
                AjaxUploadAttech.SaveAs(filePath);
            }
            else
            {
                Fn.Exec(@"UPDATE tblEmployee SET PhotoExtension='" + ext + "' WHERE EmpID=" + data[0]);
                string filePath = Server.MapPath("~") + "/Uploads/EmployeePhoto/" + data[0] + ext;
                AjaxUploadAttech.SaveAs(filePath);
                if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                {
                    Bitmap Thumbnail = CreateThumbnail(filePath, 32, 32);
                    string SaveAsThumbnail = System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~") + "/Uploads/EmployeePhoto/", Convert.ToString(data[0]) + "A" + fi.Extension);
                    Thumbnail.Save(SaveAsThumbnail);
                }

                if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                {
                    Bitmap Thumbnail = CreateThumbnail(filePath, 75, 75);
                    string SaveAsThumbnail = System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~") + "/Uploads/EmployeePhoto/", Convert.ToString(data[0]) + "B" + fi.Extension);
                    Thumbnail.Save(SaveAsThumbnail);
                }
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