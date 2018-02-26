using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;


namespace FRDP
{
    public partial class JobAdvertisment : System.Web.UI.Page
    {

        public static HRISDBClass Fn = new HRISDBClass();
        public static string UserID = string.Empty;
        public static string JobReqID = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {
            UserID = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["UserID"]).Value));
        }
        //protected void AjaxUploadAttech_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        //{
        //    FileInfo fi = new FileInfo(e.FileName);
        //    string ext = fi.Extension;
        //    string[] data = HttpUtility.UrlDecode(Request.Cookies["IDforDocument"].Value.ToString()).Split('|');
        //    string fileID = Fn.ExenID("INSERT INTO tblDocuments (FileTitle, FileExt, tblName, tblID, EnterByEmpID) VALUES ('" + fi.Name + "','" + ext + "', 'tblJobRequirement', '" + data[0] + "','" + Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) + "'); select SCOPE_IDENTITY()");
        //    string filePath = Server.MapPath("~") + "/Uploads/AllDocuments/" + fileID + ext;
        //    AjaxUploadAttech.SaveAs(filePath);
        //    if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
        //    {
        //        Bitmap Thumbnail = CreateThumbnail(filePath, 32, 32);
        //        string SaveAsThumbnail = System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~") + "/Uploads/AllDocuments/", fileID + "A" + fi.Extension);
        //        Thumbnail.Save(SaveAsThumbnail);
        //    }

        //    if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
        //    {
        //        Bitmap Thumbnail = CreateThumbnail(filePath, 75, 75);
        //        string SaveAsThumbnail = System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~") + "/Uploads/AllDocuments/", fileID + "B" + fi.Extension);
        //        Thumbnail.Save(SaveAsThumbnail);
        //    }
        //}


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
        public static string AllJobRequests(string DepartmentID, string CompanyID)
        {
            if (DepartmentID.Trim() == "0")
            {
                return Fn.Data2Json("SELECT row_number() over(order by JobRequirementID) as srno, tbl_Departments.DepartmentName, tbl_JobRequirements.JobRequirementID, tbl_JobRequirements.PurposeOfHiring, tbl_JobRequirements.DutyStationID, tbl_JobRequirements.SalaryRange, Convert(varchar(50), tbl_JobRequirements.EntryDateTime, 106) as EntryDateTime, tbl_Company.CompanyName, TblHResources.Full_Name, tbl_Designation.Designation , TblHResources_1.Full_Name as JobSpecifiedName FROM tbl_JobRequirements INNER JOIN tbl_Company ON tbl_JobRequirements.CompanyID = tbl_Company.CompanyID INNER JOIN tbl_Departments ON tbl_JobRequirements.DepartmentID = tbl_Departments.DepartmentID INNER JOIN TblHResources ON tbl_JobRequirements.EnteredByID = TblHResources.User_ID INNER JOIN tbl_Designation ON tbl_JobRequirements.JobDesignationID = tbl_Designation.DesignationID Inner join tbl_JobSpecifications on tbl_JobSpecifications.ReqirementID = tbl_JobRequirements.JobRequirementID Inner join TblHResources as TblHResources_1 ON TblHResources_1.User_ID =  tbl_JobSpecifications.SpecifiedBy where  ReqStatusID = 5 and tbl_JobRequirements.CompanyID =  " + CompanyID + "  Order by EntryDateTime desc");
            }
            return Fn.Data2Json("SELECT row_number() over(order by JobRequirementID) as srno, tbl_Departments.DepartmentName, tbl_JobRequirements.JobRequirementID, tbl_JobRequirements.PurposeOfHiring, tbl_JobRequirements.DutyStationID, tbl_JobRequirements.SalaryRange, Convert(varchar(50), tbl_JobRequirements.EntryDateTime, 106) as EntryDateTime, tbl_Company.CompanyName, TblHResources.Full_Name, tbl_Designation.Designation , TblHResources_1.Full_Name as JobSpecifiedName FROM tbl_JobRequirements INNER JOIN tbl_Company ON tbl_JobRequirements.CompanyID = tbl_Company.CompanyID INNER JOIN tbl_Departments ON tbl_JobRequirements.DepartmentID = tbl_Departments.DepartmentID INNER JOIN TblHResources ON tbl_JobRequirements.EnteredByID = TblHResources.User_ID INNER JOIN tbl_Designation ON tbl_JobRequirements.JobDesignationID = tbl_Designation.DesignationID Inner join tbl_JobSpecifications on tbl_JobSpecifications.ReqirementID = tbl_JobRequirements.JobRequirementID Inner join TblHResources as TblHResources_1 ON TblHResources_1.User_ID =  tbl_JobSpecifications.SpecifiedBy where  ReqStatusID = 5 and tbl_Departments.DepartmentID = " + DepartmentID + "  Order by EntryDateTime desc");
        }


        [WebMethod]
        public static string SaveNewSourceOfAdvertisment(string Source)
        {
            string id = Fn.ExenID("INSERT INTO tbl_SourceOfAdvertisment ( SourceOfAdvertisment) VALUES ('" + Source + "');Select Scope_Identity();");
            int NewID = Convert.ToInt32(id);
            if (NewID > 0)
            {
                return "1";
            }
            return "0";
        }



        [WebMethod]
        public static string AllSourceOfAdvertisment()
        {
            return Fn.Data2Json("SELECT SourceOfAdvertismentID, SourceOfAdvertisment FROM tbl_SourceOfAdvertisment order by SourceOfAdvertisment");
        }

        [WebMethod]
        public static string SaveNewMethodOfApply(string Method)
        {
            string id = Fn.ExenID("INSERT INTO tbl_HowToApply (HowToApply) VALUES ( '" + Method + "') ; Select Scope_Identity();");
            int NewID = Convert.ToInt32(id);
            if (NewID > 0)
            {
                return "1";
            }
            return "0";
        }



        [WebMethod]
        public static string AllHowToApply()
        {
            return Fn.Data2Json("SELECT HowToApplyID, HowToApply FROM tbl_HowToApply order by HowToApply");
        }



        [WebMethod]
        public static string SaveData(string Source, string DOA, string LDA, string POCP, string EOCP, string HowToApply, string JobReqID, string AdvCode)
        {
            string id = Fn.ExenID(@"INSERT INTO tbl_JobAdvertisment (SourceOfAdvertismentID, DateOfAdvertisment, LastDateToApply, PhoneNoForQueries, EmailForQueries, HowToApplyID, JobRequirementID, JobCode) VALUES ('" + Source + "', '" + DOA + "', '" + LDA + "', '" + POCP + "', '" + EOCP + "','" + HowToApply + "','" + JobReqID + "', '" + AdvCode + "') ;  UPDATE tbl_JobRequirements SET ReqStatusID = 4 where JobRequirementID = '" + JobReqID + "';Select Scope_Identity();");
            int NewID = Convert.ToInt32(id);
            JobAdvertisment.JobReqID = Convert.ToString(JobReqID);

            if (NewID > 0)
            {
                return "1";
            }
            return "0";
        }



        [WebMethod]
        public static string JobCode(string ReqID)
        {
            return Fn.Data2Json("Declare @CAbbri as varchar(50); Select @CAbbri = tbl_Company.CompanyAbbrivation from  tbl_JobRequirements 	inner join tbl_Company on tbl_Company.CompanyID = tbl_JobRequirements.CompanyID where tbl_JobRequirements.JobRequirementID = '" + ReqID + "';  select @CAbbri + '-' +Convert(varchar(50), ISNULL(max(JobAdvertismentID), 0) + 1) as JOBID from tbl_JobAdvertisment");
        }

        protected void btnShowReport_Click(object sender, EventArgs e)
        {
            ShowReport();
        }



        private void ShowReport()
        {
           
        }


        protected void btnShow_Click(object sender, EventArgs e)
        {
            ShowReport();
        }
    }
}