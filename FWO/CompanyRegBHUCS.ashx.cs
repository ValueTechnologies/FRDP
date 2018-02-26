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
    /// Summary description for CompanyRegBHUCS
    /// </summary>
    public class CompanyRegBHUCS : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            MyClass Fn = new MyClass();
            try
            {
                var areaid = context.Request.Form["areas"];

                int Newcode = 0;
                try
                {
                    using (DBDataContext db = new DBDataContext())
                    {
                        Newcode = db.tbl_Companies.Where(vv => vv.ParentId == Convert.ToDecimal(areaid)).Max(ss => ss.Code ?? 0);
                        Newcode += 1;
                    }
                }
                catch (Exception)
                {
                    Newcode = 1;
                    
                }
                
                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');

                int CompanyID = 0;
                if (d[9] == "0")
                {
                    CompanyID = Convert.ToInt32(Fn.ExenID("INSERT INTO tbl_Company (CompanyName, CompanyAbbrivation, CompanyPhoneNo, CompanyEmail,  CompanyEstablishmentYear, CompanyWebsite, TblVillageCity,  GPS, CompanyAddress, code, ParentId, Type,lvl) VALUES        ('" + d[0] + "', '" + d[1] + "', '" + d[2] + "', '" + d[3] + "', '" + d[4] + "', '" + d[5] + "', '" + d[6] + "', '" + d[7] + "', '" + d[8] + "','" + Convert.ToString(Newcode) + "','" + areaid + "','BHU','3'); select SCOPE_IDENTITY();"));
                    using (DBDataContext db =  new DBDataContext())
                    {
                        List<TblHResourcesLocation> oblist = new List<TblHResourcesLocation>();
                        var emps = db.Logins.Where(v => v.User_Group_Id == 2).Select(s => s.Emp_Id).ToList<int>();
                        foreach (var emp in emps)
                        {
                            oblist.Add(new TblHResourcesLocation() { LocID =Convert.ToInt32(CompanyID),  User_ID= emp });
                        }
                        db.TblHResourcesLocations.InsertAllOnSubmit(oblist);
                        db.SubmitChanges();
                    }

                }
                else
                {
                    CompanyID = Convert.ToInt32(d[9]);
                    Fn.Exec(@"UPDATE tbl_Company set
CompanyName= '" + d[0] + @"', 
CompanyAbbrivation= '" + d[1] + @"', 
CompanyPhoneNo= '" + d[2] + @"', 
CompanyEmail= '" + d[3] + @"', 
CompanyEstablishmentYear= '" + d[4] + @"', 
CompanyWebsite= '" + d[5] + @"', 
TblVillageCity = '" + d[6] + @"', 
GPS= '" + d[7] + @"', 
CompanyAddress= '" + d[8] + @"', 
ParentId= '" + areaid + @"', 
Type= 'BHU',
lvl= '3'
WHERE CompanyID='" + d[9] + "'");
                }


                if (context.Request.Files.Count > 0 && CompanyID > 0)
                {
                    HttpFileCollection SelectedFiles = context.Request.Files;

                    for (int i = 0; i < SelectedFiles.Count; i++)
                    {
                        HttpPostedFile PostedFile = SelectedFiles[i];
                        string FileName = context.Server.MapPath("~/Uploads/CompanyProfile/" + PostedFile.FileName);
                        string Path = context.Server.MapPath("~/Uploads/CompanyProfile/");
                        FileInfo fi = new FileInfo(FileName);
                        //int fileID = 0;


                        Fn.Exec("update tbl_Company set CompanyLogo =  '" + fi.Extension + "' where CompanyID = " + Convert.ToString(CompanyID));
                        //PostedFile.SaveAs(Path + Convert.ToString(CompanyID) + fi.Extension);

                        PostedFile.SaveAs(Path + Convert.ToString(CompanyID) + fi.Extension);
                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path + Convert.ToString(CompanyID) + fi.Extension, 32, 32);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/CompanyProfile/", "A" + Convert.ToString(CompanyID) + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }

                        if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                        {
                            Bitmap Thumbnail = CreateThumbnail(Path + Convert.ToString(CompanyID) + fi.Extension, 75, 75);
                            string SaveAsThumbnail = System.IO.Path.Combine(context.Server.MapPath("~") + "/Uploads/CompanyProfile/", "B" + Convert.ToString(CompanyID) + fi.Extension);
                            Thumbnail.Save(SaveAsThumbnail);
                        }
                    }
                }

                if (CompanyID > 0)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("DSU Registered Successfully!");
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