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
    /// Summary description for VenderReg
    /// </summary>
    public class VenderReg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var frmdata = context.Request.Form["vls"];
                string[] d = frmdata.Split('½');
                int ID = 0;
                string ParentTableName = "";
                if (d[0] == "1")
                {
                    using (DBDataContext db = new DBDataContext())
                    {
                        int nxt = 0;
                        try
                        {
                            nxt = db.tblVenders.Where(v => v.CategoryVenderContractor == "Vendor").Max(s => s.VenderNo ?? 0);
                        }
                        catch
                        {
                            nxt = 0;
                        }


                        tblVender obj = new tblVender();
                        obj.VenderNo = nxt + 1;
                        obj.Type = d[1];
                        obj.Name = d[2];
                        obj.CNIC_CompanyNTN = d[3];
                        obj.mobileNo1 = d[4];
                        obj.mobileno2 = d[5];
                        obj.phone1 = d[6];
                        obj.phone2 = d[7];
                        obj.Fax = d[8];
                        obj.Email = d[9];
                        obj.Address = d[10];
                        obj.CategoryVenderContractor = "Vendor";
                        db.tblVenders.InsertOnSubmit(obj);
                        db.SubmitChanges();
                        ID = obj.tblVenderID;

                    }
                    ParentTableName = "tblVender";
                }

                if (d[0] == "2")
                {
                    using (DBDataContext db = new DBDataContext())
                    {
                        tblVender_ContactPerson obj = new tblVender_ContactPerson();
                        obj.tbltblVenderID = Convert.ToInt32(d[1]);
                        obj.ContactPersonName = d[2];
                        obj.ContactPersonCNIC = d[3];
                        obj.ContactPersonmobileNo1 = d[4];
                        obj.ContactPersonmobileNo2 = d[5];
                        obj.ContactPersonPhone1 = d[6];
                        obj.ContactPersonphone2 = d[7];
                        obj.ContactPersonemail = d[8];
                        obj.ContactPersonAddress = d[9];
                        obj.ContactRemarks = d[10];
                        db.tblVender_ContactPersons.InsertOnSubmit(obj);
                        db.SubmitChanges();
                        ID = obj.tblVender_ContactPersonID;

                    } ParentTableName = "tblVender_ContactPerson";
                }
                if (d[0] == "3")
                {
                    using (DBDataContext db = new DBDataContext())
                    {
                        int VNO = 1;
                        try
                        {
                            VNO = db.tblVenders.Where(v => v.CategoryVenderContractor == d[1]).Max(s => s.VenderNo ?? 0) + 1;
                        }
                        catch (Exception)
                        {

                            VNO = 1;
                        }

                        tblVender obj = new tblVender();
                        obj.VenderNo = VNO;
                        obj.Type = d[2];
                        obj.Name = d[3];
                        obj.CNIC_CompanyNTN = d[4];
                        obj.mobileNo1 = d[5];
                        obj.mobileno2 = d[6];
                        obj.phone1 = d[7];
                        obj.phone2 = d[8];
                        obj.Fax = d[9];
                        obj.Email = d[10];
                        obj.Address = d[11];
                        obj.CategoryVenderContractor = d[1];
                        db.tblVenders.InsertOnSubmit(obj);
                        db.SubmitChanges();
                        ID = obj.tblVenderID;

                    }
                    ParentTableName = "tblVender";
                }
                if (d[0] == "4")
                {

                }

                if (d[0] == "5")
                {
                    if (d[12] == "0")
                    {


                        using (DBDataContext db = new DBDataContext())
                        {
                            int VNO = 1;
                            try
                            {
                                VNO = db.tblVenders.Where(v => v.CategoryVenderContractor == d[1]).Max(s => s.VenderNo ?? 0) + 1;
                            }
                            catch (Exception)
                            {

                                VNO = 1;
                            }

                            tblVender obj = new tblVender();
                            obj.VenderNo = VNO;
                            obj.Type = d[2];
                            obj.Name = d[3];
                            obj.CNIC_CompanyNTN = d[4];
                            obj.mobileNo1 = d[5];
                            obj.mobileno2 = d[6];
                            obj.phone1 = d[7];
                            obj.phone2 = d[8];
                            obj.Fax = d[9];
                            obj.Email = d[10];
                            obj.Address = d[11];
                            obj.CategoryVenderContractor = d[1];
                            db.tblVenders.InsertOnSubmit(obj);
                            db.SubmitChanges();
                            ID = obj.tblVenderID;

                        }
                    }
                    else
                    {
                        using (DBDataContext db = new DBDataContext())
                        {
                            var obj = db.tblVenders.Where(v => v.tblVenderID == Convert.ToDecimal(d[12])).FirstOrDefault();
                            if (obj != null)
                            {
                                obj.Type = d[2];
                                obj.Name = d[3];
                                obj.CNIC_CompanyNTN = d[4];
                                obj.mobileNo1 = d[5];
                                obj.mobileno2 = d[6];
                                obj.phone1 = d[7];
                                obj.phone2 = d[8];
                                obj.Fax = d[9];
                                obj.Email = d[10];
                                obj.Address = d[11];
                                db.SubmitChanges();
                                ID = obj.tblVenderID;
                            }
                        }
                    }
                    ParentTableName = "tblVender";
                }
                if (d[0] == "6")
                {
                    if (d[12] == "0")
                    {

                        
                        using (DBDataContext db = new DBDataContext())
                        {
                            int VNO = 1;
                            try
                            {
                                VNO = db.tblVenders.Where(v => v.CategoryVenderContractor == d[1] && v.tblCompanyID==Convert.ToDecimal(d[13])).Max(s => s.VenderNo ?? 0) + 1;
                            }
                            catch (Exception)
                            {

                                VNO = 1;
                            }

                            tblVender obj = new tblVender();
                            obj.VenderNo = VNO;
                            obj.Type = d[2];
                            obj.Name = d[3];
                            obj.CNIC_CompanyNTN = d[4];
                            obj.mobileNo1 = d[5];
                            obj.mobileno2 = d[6];
                            obj.phone1 = d[7];
                            obj.phone2 = d[8];
                            obj.Fax = d[9];
                            obj.Email = d[10];
                            obj.Address = d[11];
                            obj.CategoryVenderContractor = d[1];
                            obj.tblCompanyID = Convert.ToDecimal(d[13]);
                            db.tblVenders.InsertOnSubmit(obj);
                            db.SubmitChanges();
                            ID = obj.tblVenderID;

                        }
                    }
                    else
                    {
                        using (DBDataContext db = new DBDataContext())
                        {
                            int VNO = 1;
                            try
                            {
                                VNO = db.tblVenders.Where(v => v.CategoryVenderContractor == d[1] && v.tblCompanyID == Convert.ToDecimal(d[13])).Max(s => s.VenderNo ?? 0) + 1;
                            }
                            catch (Exception)
                            {

                                VNO = 1;
                            }
                            var obj = db.tblVenders.Where(v => v.tblVenderID == Convert.ToDecimal(d[12])).FirstOrDefault();
                            if (obj != null)
                            {
                                obj.VenderNo = VNO;
                                obj.Type = d[2];
                                obj.Name = d[3];
                                obj.CNIC_CompanyNTN = d[4];
                                obj.mobileNo1 = d[5];
                                obj.mobileno2 = d[6];
                                obj.phone1 = d[7];
                                obj.phone2 = d[8];
                                obj.Fax = d[9];
                                obj.Email = d[10];
                                obj.Address = d[11];
                                obj.tblCompanyID = Convert.ToDecimal(d[13]);
                                db.SubmitChanges();
                                ID = obj.tblVenderID;
                            }
                        }
                    }
                    ParentTableName = "tblVender";
                }
                if (context.Request.Files.Count > 0 && ID > 0)
                {
                    HttpFileCollection SelectedFiles = context.Request.Files;

                    for (int i = 0; i < SelectedFiles.Count; i++)
                    {
                        HttpPostedFile PostedFile = SelectedFiles[i];
                        string FileName = context.Server.MapPath("~/Uploads/VenderContractorDocs/" + PostedFile.FileName);
                        string Path = context.Server.MapPath("~/Uploads/VenderContractorDocs/");
                        FileInfo fi = new FileInfo(FileName);
                        long fileID = 0;

                        using (DBDataContext db = new DBDataContext())
                        {
                            tblMultipleFile obj = new tblMultipleFile();
                            obj.ParentID = ID;
                            obj.ParentTableName = ParentTableName;
                            obj.FileTitle = fi.Name;
                            obj.FileExt = fi.Extension;
                            obj.FolderPath = "Uploads/VenderContractorDocs/";
                            db.tblMultipleFiles.InsertOnSubmit(obj);
                            db.SubmitChanges();
                            fileID = obj.tblMultipleFilesID;
                        }
                        PostedFile.SaveAs(Path + Convert.ToString(fileID) + fi.Extension);



                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Record Saved");

                    }
                }

                else if (context.Request.Files.Count <= 0 && ID > 0)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Record Saved");
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