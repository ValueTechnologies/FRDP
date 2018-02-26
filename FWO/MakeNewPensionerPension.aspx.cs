using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class MakeNewPensionerPension : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();

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
                string fileID = Fn.ExenID("INSERT INTO tblEmpDocs (UploadedFor,EmpID,FileTitle, FileExt) VALUES ('EmpPensionDoc'," + data[0] + ", '" + fi.Name + "', '" + ext + "');select SCOPE_IDENTITY()");
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




        [WebMethod]
        public static string LoadEmpCompletePreviousData(string EmpPensionID)
        {
            return Fn.Data2Json("SELECT PensionEmpID, EmpID, Format(ISNULL(DateOfAppointment,  GETDATE()), 'dd-MMMM-yyyy') as DateOfAppointment, Format(ISNULL(DOB,  GETDATE()), 'dd-MMMM-yyyy') as DOB, Format(ISNULL(DateOfRetirement,  GETDATE()), 'dd-MMMM-yyyy') as DateOfRetirement, ISNULL(TotalAgeAtRetirementY, 0) as TotalAgeAtRetirementY, ISNULL(TotalAgeAtRetirementM, 0) as TotalAgeAtRetirementM, ISNULL(TotalAgeAtRetirementD, 0) as TotalAgeAtRetirementD, ISNULL(TotalServiceY, 0) as TotalServiceY, ISNULL(TotalServiceM, 0) as TotalServiceM, ISNULL(TotalServiceD, 0) as TotalServiceD, ISNULL(TotalHolidays, 0) as TotalHolidays, ISNULL(NetQualifyingServiceY, 0) as NetQualifyingServiceY, ISNULL(NetQualifyingServiceM, 0) as NetQualifyingServiceM, ISNULL(NetQualifyingServiceD, 0) as NetQualifyingServiceD,ISNULL(AgeNextBirthdays, 0) AS AgeNextBirthdays,  BankName, AccountNo, FileNo FROM tbl_PensionEmployees where PensionEmpID = " + EmpPensionID);

        }

        [WebMethod]
        public static string LoadPensionType()
        {
            return Fn.Data2Json("SELECT PensionTypeID, PensionType FROM tbl_PensionType order by PensionType");
        }


        [WebMethod]
        public static string SaveData(string Vals)
        {
            string[] d = Vals.Split('½');
            try
            {
                int id = Convert.ToInt32(Fn.ExenID("usp_MakePensionCurruntCalculated '" + d[12] + "', '" + d[0] + "','" + d[1] + "','" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "'"));
                if (id > 0)
                {
                    return "Save Successfully!";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return string.Empty;


        }
    }
}