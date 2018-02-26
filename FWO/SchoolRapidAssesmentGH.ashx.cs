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
    /// Summary description for SchoolRapidAssesmentGH
    /// </summary>
    public class SchoolRapidAssesmentGH : IHttpHandler, IRequiresSessionState
    {

        private MyClass Fn = new MyClass();
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');

                int benID = Convert.ToInt32(Convert.ToString(HttpContext.Current.Session["Emp_Id"]));

                HttpFileCollection SelectedFiles = context.Request.Files;
                if (SelectedFiles.Count > 0 && benID > 0)
                {
                    

                    for (int i = 0; i < SelectedFiles.Count; i++)
                    {
                        HttpPostedFile PostedFile = SelectedFiles[i];
                        string FileName = context.Server.MapPath("~/Uploads/SchoolRapidPhoto/" + PostedFile.FileName);
                        string Path = context.Server.MapPath("~/Uploads/SchoolRapidPhoto/");
                        FileInfo fi = new FileInfo(FileName);
                        //decimal fileID = Convert.ToDecimal(d[0]);
                        string FileID = "0";
                        if (d[28] == "0")
                        {
                         FileID=    Fn.ExenID(@"INSERT INTO tblAssesmentRapid
                         (strFormNo, dtSurveyDate, strSchoolName, strContactNoSchool, strSchoolEmail, strOwnerName, strOwnerContactNumber, strOwnerEmail, strPrincipalName, strPrincipalContactNumber, strPrincipalEmail,
                         strAddress1, strAddress2, strNearestLandMark, TblUnionConcilID, tblSlumID, strSchoolLatLang, strSurveyorName1, strSurveyorName2, dtStartDateTime, dtEndDateTime, Q1, Q2, Q3, Q4, Q5, Q6,
                         bisPictureAllowed, PicturePath, nEnterByEmpID, dtEntryDateTime)
                        VALUES('" + d[0] + "','" + d[1] + "','" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "','" + d[12] + "','" + d[13] + "','" + d[14] + "','" + d[15] + "','" + d[16] + "','" + d[17] + "','" + d[18] + "','" + d[19] + "','" + d[20] + "','" + d[21] + "','" + d[22] + "','" + d[23] + "','" + d[24] + "','" + d[25] + "','" + d[26] + "','" + d[27] + "','" + fi.Extension + "','" + Convert.ToString(benID) + "',GETDATE()); SELECT @@IDENTITY");
                        }
                        else
                        {
                            FileID = d[28];
                            Fn.Exec(@"UPDATE       tblAssesmentRapid
SET strFormNo ='" + d[0] + @"', 
dtSurveyDate ='" + d[1] + @"', 
strSchoolName ='" + d[2] + @"', 
strContactNoSchool ='" + d[3] + @"', 
strSchoolEmail ='" + d[4] + @"', 
strOwnerName ='" + d[5] + @"', 
strOwnerContactNumber ='" + d[6] + @"', 
strOwnerEmail ='" + d[7] + @"', 
strPrincipalName ='" + d[8] + @"', 
strPrincipalContactNumber ='" + d[9] + @"', 
strPrincipalEmail ='" + d[10] + @"', 
strAddress1 ='" + d[11] + @"', 
strAddress2 ='" + d[12] + @"', 
strNearestLandMark ='" + d[13] + @"', 
TblUnionConcilID ='" + d[14] + @"', 
tblSlumID ='" + d[15] + @"', 
strSchoolLatLang ='" + d[16] + @"', 
strSurveyorName1 ='" + d[17] + @"', 
strSurveyorName2 ='" + d[18] + @"', 
dtStartDateTime ='"+ d[19] + @"', 
dtEndDateTime ='" + d[20] + @"', 
Q1 ='" + d[21] + @"', 
Q2 ='" + d[22] + @"', 
Q3 ='" + d[23] + @"', 
Q4 ='" + d[24] + @"', 
Q5 ='" + d[25] + @"', 
Q6 ='" + d[26] + @"', 
bisPictureAllowed ='" + d[27] + @"', 
PicturePath ='" + fi.Extension + @"'
WHERE        (tblAssesmentRapidID = '" + FileID + @"')");
                        }
                        PostedFile.SaveAs(Path  + Convert.ToString(FileID) + fi.Extension);
                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path +  Convert.ToString(FileID) + fi.Extension, 32, 32);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/SchoolRapidPhoto/",  "A" + Convert.ToString(FileID) + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }

                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path +  Convert.ToString(FileID) + fi.Extension, 75, 75);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/SchoolRapidPhoto/",  "B" + Convert.ToString(FileID) + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }

                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Record Saved");

                    }
                }

                else if (benID > 0)
                {

                    if (d[28] == "0")
                    {
                        Fn.Exec(@"INSERT INTO tblAssesmentRapid
                         (strFormNo, dtSurveyDate, strSchoolName, strContactNoSchool, strSchoolEmail, strOwnerName, strOwnerContactNumber, strOwnerEmail, strPrincipalName, strPrincipalContactNumber, strPrincipalEmail,
                         strAddress1, strAddress2, strNearestLandMark, TblUnionConcilID, tblSlumID, strSchoolLatLang, strSurveyorName1, strSurveyorName2, dtStartDateTime, dtEndDateTime, Q1, Q2, Q3, Q4, Q5, Q6,
                         bisPictureAllowed,  nEnterByEmpID, dtEntryDateTime)
                        VALUES('" + d[0] + "',CONVERT(DATETIME,'" + d[1] + "',103) ,'" + d[2] + "','" + d[3] + "','" + d[4] + "','" + d[5] + "','" + d[6] + "','" + d[7] + "','" + d[8] + "','" + d[9] + "','" + d[10] + "','" + d[11] + "','" + d[12] + "','" + d[13] + "','" + d[14] + "','" + d[15] + "','" + d[16] + "','" + d[17] + "','" +  d[18] + "','"  + d[19] + "','"  + d[20] + "','" + d[21] + "','" + d[22] + "','" + d[23] + "','" + d[24] + "','" + d[25] + "','" + d[26] + "','" + d[27] + "','" + Convert.ToString(benID) + "',GETDATE())");
                    }
                    else
                    {
                        Fn.Exec(@"UPDATE       tblAssesmentRapid
SET strFormNo ='" + d[0] + @"', 
dtSurveyDate ='" + d[1] + @"', 
strSchoolName ='" + d[2] + @"', 
strContactNoSchool ='" + d[3] + @"', 
strSchoolEmail ='" + d[4] + @"', 
strOwnerName ='" + d[5] + @"', 
strOwnerContactNumber ='" + d[6] + @"', 
strOwnerEmail ='" + d[7] + @"', 
strPrincipalName ='" + d[8] + @"', 
strPrincipalContactNumber ='" + d[9] + @"', 
strPrincipalEmail ='" + d[10] + @"', 
strAddress1 ='" + d[11] + @"', 
strAddress2 ='" + d[12] + @"', 
strNearestLandMark ='" + d[13] + @"', 
TblUnionConcilID ='" + d[14] + @"', 
tblSlumID ='" + d[15] + @"', 
strSchoolLatLang ='" + d[16] + @"', 
strSurveyorName1 ='" + d[17] + @"', 
strSurveyorName2 ='" + d[18] + @"', 
dtStartDateTime ='"  + d[19] + @"', 
dtEndDateTime ='"+ d[20] + @"', 
Q1 ='" + d[21] + @"', 
Q2 ='" + d[22] + @"', 
Q3 ='" + d[23] + @"', 
Q4 ='" + d[24] + @"', 
Q5 ='" + d[25] + @"', 
Q6 ='" + d[26] + @"', 
bisPictureAllowed ='" + d[27] + @"'
WHERE        (tblAssesmentRapidID = '" + d[28] + @"')");
                    }

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