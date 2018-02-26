using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.SessionState;
using System.Drawing;
using System.Drawing.Imaging;

namespace FRDP
{
    /// <summary>
    /// Summary description for EFSWS
    /// </summary>
    [WebService(Namespace = "http://efs.valuesoft.org/EFSWS.asmx")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class EFSWS : System.Web.Services.WebService, IRequiresSessionState
    {
        MyClass Fn = new MyClass();
        [WebMethod]
        public string LocationsForAndroid(string colNo, string param)
        {
            string ret = "";
            List<sp_AndroidLocationsResult> obj = new List<sp_AndroidLocationsResult>();
            using (DBDataContext db = new DBDataContext())
            {
                obj = db.sp_AndroidLocations().ToList<sp_AndroidLocationsResult>();
            }
            if (colNo == "1")
            {
                // obj.Select(x => x.District).Distinct().ToList<string>();
                foreach (var item in obj.Select(x => x.District).Distinct().ToList<string>())
                {
                    ret += item + '¼';
                }

            }
            if (colNo == "2")
            {
                //  ret = obj.Where(v=>v.District==param).Select(x => x.Tehsil).Distinct().ToList<string>(); 
                foreach (var item in obj.Where(v => v.District == param).Select(x => x.Tehsil).Distinct().ToList<string>())
                {
                    ret += item + '¼';
                }
            }
            if (colNo == "3")
            {
                //ret = obj.Where(v=>v.Tehsil==param).Select(x => x.UC).Distinct().ToList<string>(); 
                foreach (var item in obj.Where(v => v.Tehsil == param).Select(x => x.UC).Distinct().ToList<string>())
                {
                    ret += item + '¼';
                }
            }
            if (colNo == "4")
            {
                // ret = obj.Where(v => v.UC == param).Select(x => x.strSlumName).Distinct().ToList<string>();
                foreach (var item in obj.Where(v => v.UC == param).Select(x => x.strSlumName).Distinct().ToList<string>())
                {
                    ret += item + '¼';
                }
            }
            return ret;
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
        public string UC_Coordinates(string input)
        {
            string[] inputs = input.Split('¼');
            using (DBDataContext db = new DBDataContext())
            {
                EFSWS_Input obj = new EFSWS_Input();
                obj.dtDateTime = DateTime.Now;
                obj.Input = input;
                obj.ServiceName = "UC_Coordinates";
                db.EFSWS_Inputs.InsertOnSubmit(obj);
                db.SubmitChanges();
            }
            foreach (var item in inputs)
            {
                try
                {
                    string[] cord = item.Split('»');

                    using (DBDataContext db = new DBDataContext())
                    {
                        db.sp_UC_Coordinates(Convert.ToInt32(cord[0]), cord[1]);
                    }
                }
                catch
                {


                }


            }

            return "1";
        }

        [WebMethod]
        public string Slum_Coordinates(string input)
        {
            string[] inputs = input.Split('¼');
            using (DBDataContext db = new DBDataContext())
            {
                EFSWS_Input obj = new EFSWS_Input();
                obj.dtDateTime = DateTime.Now;
                obj.Input = input;
                obj.ServiceName = "Slum_Coordinates";
                db.EFSWS_Inputs.InsertOnSubmit(obj);
                db.SubmitChanges();
            }

            foreach (var item in inputs)
            {

                try
                {
                    string[] cord = item.Split('»');
                    using (DBDataContext db = new DBDataContext())
                    {
                        db.sp_Slum_Coordinates(Convert.ToInt32(cord[0]), cord[1]);
                    }
                }
                catch
                {


                }


            }

            return "1";
        }


        [WebMethod]
        public string LoginJ(string txtUser, string txtPass)
        {
            MyClass Fn = new MyClass();
            Employee lblMsg = new Employee() { Emp_Id = 0, ContactNo = "0", username = "0", password = "0", CompanyID = 0, designation = "0", email = "0", EmpName = "0", onlyname = "0", PhotoPath = "0" };
            try
            {
                string ssssssssssss = Encryptor.Encrypt(txtPass);
                DataTable DT = Fn.FillDSet("sp_Login '" + txtUser + "','" + Encryptor.Encrypt(txtPass) + "'").Tables[0];

                if (txtPass == Encryptor.Decrypt(DT.Rows[0][0].ToString()))
                {
                    string EN = "";
                    int? EID = 0, UGID = 0;
                    bool? IsAllowed = false;

                    using (DBDataContext db = new DBDataContext())
                    {
                        db.User_Login(txtUser, ssssssssssss, ref EN, ref EID, ref UGID, "", ref IsAllowed);
                    }
                    if (Convert.ToBoolean(IsAllowed) && Convert.ToInt32(EID) > 0)
                    {
                        lblMsg.Emp_Id = Convert.ToInt32(EID);
                        lblMsg.EmpName = Convert.ToString(EN);
                        lblMsg.username = txtUser;
                        lblMsg.password = txtPass;
                        lblMsg.onlyname = DT.Rows[0][2].ToString();
                        lblMsg.ContactNo = Convert.ToString(DT.Rows[0][4]);
                        lblMsg.email = Convert.ToString(DT.Rows[0][5]).Trim() == "" ? "N/A" : Convert.ToString(DT.Rows[0][5]);
                        lblMsg.designation = Convert.ToString(DT.Rows[0][6]);
                        lblMsg.PhotoPath = Convert.ToString(DT.Rows[0][7]);
                        lblMsg.CompanyID = Convert.ToInt32(DT.Rows[0][13]);
                        Fn.Exec("INSERT INTO tblUserLog(UserID) VALUES (" + DT.Rows[0][1] + ")");
                    }
                }
                else
                {
                    lblMsg.Emp_Id = 0;

                }
            }
            catch (Exception ex)
            {
                lblMsg.Emp_Id = 0;
            }


            return new JavaScriptSerializer().Serialize(lblMsg); ;
        }//End of Login 



        [WebMethod]
        public string a1BindCountry()
        {
            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locProvince = new List<clsLocation>();
            List<clsLocation> locRegion = new List<clsLocation>();
            List<clsLocation> locDistrict = new List<clsLocation>();
            List<clsLocation> locTehsil = new List<clsLocation>();
            List<clsLocation> locFU = new List<clsLocation>();
            List<clsLocation> locUC = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblCountries.Select(s => new clsLocation { LocID = s.CountryID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locProvince = db.TblProvinces.Where(v => v.CountryID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.ProvinceID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locRegion = db.TblRegions.Where(v => v.ProvinceID == locProvince.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.RegionID,
                    LocName = s.LocName.Trim() == "" ? db.TblProvinces.Where(xx => xx.ProvinceID == s.ProvinceID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locDistrict = db.TblDistricts.Where(v => v.RegionID == locRegion.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.DistrictID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locTehsil = db.TblTehsils.Where(v => v.DistrictID == locDistrict.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locFU = db.TblFeildUnits.Where(v => v.TehsilID == locTehsil.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.FeildUnitID,
                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == locFU.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsCountryAndroid obj = new clsCountryAndroid();
            obj.Country = loc;
            obj.Province = locProvince;
            obj.Region = locRegion;
            obj.District = locDistrict;
            obj.Tehsil = locTehsil;
            obj.FU = locFU;
            obj.UC = locUC;
            obj.village = locVillage;
            return new JavaScriptSerializer().Serialize(obj);

        }

        [WebMethod]
        public string a2BindProvince(int ID)
        {
            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locRegion = new List<clsLocation>();
            List<clsLocation> locDistrict = new List<clsLocation>();
            List<clsLocation> locTehsil = new List<clsLocation>();
            List<clsLocation> locFU = new List<clsLocation>();
            List<clsLocation> locUC = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {

                loc = db.TblProvinces.Where(v => v.CountryID == ID).Select(s => new clsLocation { LocID = s.ProvinceID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locRegion = db.TblRegions.Where(v => v.ProvinceID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.RegionID,
                    LocName = s.LocName.Trim() == "" ? db.TblProvinces.Where(xx => xx.ProvinceID == s.ProvinceID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locDistrict = db.TblDistricts.Where(v => v.RegionID == locRegion.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.DistrictID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locTehsil = db.TblTehsils.Where(v => v.DistrictID == locDistrict.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locFU = db.TblFeildUnits.Where(v => v.TehsilID == locTehsil.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.FeildUnitID,
                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == locFU.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsProvinceAndroide obj = new clsProvinceAndroide();
            obj.Province = loc;
            obj.Region = locRegion;
            obj.District = locDistrict;
            obj.Tehsil = locTehsil;
            obj.FU = locFU;
            obj.UC = locUC;
            obj.village = locVillage;
            return new JavaScriptSerializer().Serialize(obj);

        }


        [WebMethod]
        public string UCUpdates(string empId)
        {
            string ucs = "";
            string tehsiles = "";
            string dist = "";
            List<sp_Update_Locations_for_AndroidResult> l = new List<sp_Update_Locations_for_AndroidResult>();
            using (DBDataContext db = new DBDataContext())
            {

                l = db.sp_Update_Locations_for_Android().ToList<sp_Update_Locations_for_AndroidResult>();
            }
            foreach (var uc in l)
            {
                ucs += Convert.ToString(uc.UnionConcilID) + "½" + Convert.ToString(uc.UC) + "½" + Convert.ToString(uc.TehsilID) + "¼";   // ll.a + "½" + Encryptor.Decrypt(ll.b) + "½" + ll.c + "¼";
            }
            if (ucs != "")
            {
                ucs += "»";
                ucs = ucs.Replace("¼»", "");
            }

            foreach (var t in l.Select(ss=> new {id= ss.TehsilID, nm = ss.Tehsil, distID = ss.DistrictID }).Distinct())
            {
                tehsiles += Convert.ToString(t.id) + "½" + Convert.ToString(t.nm) + "½" + Convert.ToString(t.distID) + "¼";
            }
            if (tehsiles != "")
            {
                tehsiles += "»";
                tehsiles = tehsiles.Replace("¼»", "");
            }

            foreach (var d in l.Select(ss=>new {id=ss.DistrictID, nm=ss.District}).Distinct())
            {
                dist += Convert.ToString(d.id) + "½" + Convert.ToString(d.nm) + "¼";
            }

            if (dist != "")
            {
                dist += "»";
                dist = dist.Replace("¼»", "");
            }
            return ucs+"û"+tehsiles+"û"+dist;
        }


        [WebMethod]
        public string SlumUpdates(string empId)
        {
            string slums = "";
            //List<Login> l = new List<Login>();
            using (DBDataContext db = new DBDataContext())
            {

                foreach (var ll in db.tblSlums.Select(sss => new { a = sss.tblSlumID, b = sss.strSlumName, c = sss.TblUnionConcilID })) 
                {
                    slums += ll.a + "½" + ll.b + "½" + ll.c + "¼";
                }
                if (slums != "")
                {
                    slums += "»";
                    slums = slums.Replace("¼»", "");
                }
            }

            return slums;
        }

        [WebMethod]
        public string LoginUpdates()
        {
            string logins = "";
            //List<Login> l = new List<Login>();
            using (DBDataContext db =  new DBDataContext())
            {

                foreach (var ll in db.Logins.Join(db.TblHResources, l => l.Emp_Id, h => h.User_ID, (l, h) => new { a = l.UserName, b = l.Password, c = l.Emp_Id, d = l.User_Group_Id, e = h.Full_Name, f = l.Login_Status }).Where(v => v.f == true))
             {
                 logins += ll.a + "½" + Encryptor.Decrypt(ll.b) + "½" + ll.c + "½" + ll.d + "½" + ll.e + "¼";
             }
             if (logins != "")
             {
                 logins += "»";
                 logins = logins.Replace("¼»", "");
             }
            }
            
            return logins;
        }

        [WebMethod]
        public string SchoolUpdates() {
            string s="";
            using (DBDataContext db =  new DBDataContext())
            {
                var l = db.SP_SchoolUpdates_ForWebService().Where(v => v.Rejected == 1).Select(ss => new { tblAssesmentRapidID = ss.tblAssesmentRapidID, strSchoolName = ss.strSchoolName, TblUnionConcilID = ss.TblUnionConcilID });
                foreach (var item in l)
                {
                    s += item.tblAssesmentRapidID + "½" + item.strSchoolName + "½" + item.TblUnionConcilID + "¼";
                }
            }
            if (s != "")
            {
                s += "»";
                s = s.Replace("¼»", "");
            }
            return s;
        }
        [WebMethod]
        public string a3BindRegion(int ID)
        {

            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locDistrict = new List<clsLocation>();
            List<clsLocation> locTehsil = new List<clsLocation>();
            List<clsLocation> locFU = new List<clsLocation>();
            List<clsLocation> locUC = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblRegions.Where(v => v.ProvinceID == ID).Select(s => new clsLocation
                {
                    LocID = s.RegionID,
                    LocName = s.LocName.Trim() == "" ? db.TblProvinces.Where(xx => xx.ProvinceID == s.ProvinceID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locDistrict = db.TblDistricts.Where(v => v.RegionID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.DistrictID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locTehsil = db.TblTehsils.Where(v => v.DistrictID == locDistrict.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locFU = db.TblFeildUnits.Where(v => v.TehsilID == locTehsil.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.FeildUnitID,
                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == locFU.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsRegionAndroid obj = new clsRegionAndroid();
            obj.Region = loc;
            obj.District = locDistrict;
            obj.Tehsil = locTehsil;
            obj.FU = locFU;
            obj.UC = locUC;
            obj.village = locVillage;
            return new JavaScriptSerializer().Serialize(obj);

        }


        [WebMethod]
        public string a4BindDistrict(int ID)
        {
            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locTehsil = new List<clsLocation>();
            List<clsLocation> locFU = new List<clsLocation>();
            List<clsLocation> locUC = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblDistricts.Where(v => v.RegionID == ID).Select(s => new clsLocation { LocID = s.DistrictID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();

                locTehsil = db.TblTehsils.Where(v => v.DistrictID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locFU = db.TblFeildUnits.Where(v => v.TehsilID == locTehsil.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.FeildUnitID,
                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == locFU.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsDistrictAndroid obj = new clsDistrictAndroid();
            obj.District = loc;
            obj.Tehsil = locTehsil;
            obj.FU = locFU;
            obj.UC = locUC;
            obj.village = locVillage;
            return new JavaScriptSerializer().Serialize(obj);

        }


        [WebMethod]
        public string a5BindTehsil(int ID)
        {
            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locFU = new List<clsLocation>();
            List<clsLocation> locUC = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblTehsils.Where(v => v.DistrictID == ID).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locFU = db.TblFeildUnits.Where(v => v.TehsilID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.FeildUnitID,
                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == locFU.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsTehsilAndroid obj = new clsTehsilAndroid();
            obj.Tehsil = loc;
            obj.FU = locFU;
            obj.UC = locUC;
            obj.village = locVillage;
            return new JavaScriptSerializer().Serialize(obj);

        }


        [WebMethod]
        public string a6BindFU(int ID)
        {
            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locUC = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblFeildUnits.Where(v => v.TehsilID == ID).Select(s => new clsLocation
                {
                    LocID = s.FeildUnitID,
                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsFUAndroid obj = new clsFUAndroid();
            obj.FU = loc;
            obj.UC = locUC;
            obj.village = locVillage;
            return new JavaScriptSerializer().Serialize(obj);

        }

        [WebMethod]
        public string a7BindUC(int ID)
        {

            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblUnionConcils.Where(v => v.FeildUnitID == ID).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsUCAndroid obj = new clsUCAndroid();
            obj.UC = loc;
            obj.village = locVillage;
            return new JavaScriptSerializer().Serialize(obj);

        }

        [WebMethod]

        public string SchoolRapidAssessment(string input)
        {
            string ret = "1";
            using (DBDataContext db = new DBDataContext())
            {
                SchoolRapidAssessmentWebService obj = new SchoolRapidAssessmentWebService();
                obj.input = input;
                db.SchoolRapidAssessmentWebServices.InsertOnSubmit(obj);
                db.SubmitChanges();
            }
            try
            {
                string[] frms = input.Split(new[] { "»»»" }, StringSplitOptions.None);
                foreach (string item in frms)
                {
                    if (item != "")
                    {
                        string[] parts = item.Split(new[] { "¡¡" }, StringSplitOptions.None);
                        string[] p1 = parts[0].Split('½');

                        string photoext = ".jpg";
                        if (p1[24]=="")
                        {
                            photoext = "NULL";
                        }
                        string rapID = Fn.ExenID(@"INSERT INTO tblAssesmentRapid
                         (
PicturePath,
strSchoolName, 
strAddress1, 
strAddress2, 
strNearestLandMark, 
strSchoolLatLang, 
TblUnionConcilID, 
tblSlumID, 
strSurveyorName1, 
dtSurveyDate, 
dtStartDateTime, 
dtEndDateTime, 
Q1, 
Q2, 
Q3, 
Q4, 
Q5, 
Q6, 
bisPictureAllowed, 
strOwnerName, 
strPrincipalName,
strContactNoSchool, 
strOwnerContactNumber, 
strPrincipalContactNumber, 
strSchoolEmail, 
strOwnerEmail, 
strPrincipalEmail, 
UsedClassRooms, 
UnUsedClassRooms,
EnterByEmpID,
EnterDateTime
)
VALUES        (
'" + photoext + @"',
'" + p1[0] + @"',
'" + p1[1] + " " + p1[2] + @"',
'" + p1[3] + @"',
'" + p1[4] + @"',
'" + p1[6] + "," + p1[7] + @"',
'" + p1[10] + @"',
'" + p1[11] + @"',
'" + p1[12] + @"',
'" + p1[13] + @"',
'" + p1[14] + @"',
'" + p1[15] + @"',
'" + p1[16] + @"',
'" + p1[17] + @"',
'" + p1[18] + @"',
'" + p1[19] + @"',
'" + p1[20] + @"',
'" + p1[21] + @"',
'" + p1[22] + @"',
'" + p1[25] + @"',
'" + p1[26] + @"',
'" + p1[27] + @"',
'" + p1[28] + @"',
'" + p1[29] + @"',
'" + p1[30] + @"',
'" + p1[31] + @"',
'" + p1[32] + @"',
'" + p1[33] + @"',
'" + p1[34] + @"',
'" + parts[2] + @"',
'" + DateTime.Now + @"'
) ; select SCOPE_IDENTITY() ");




                        string gt = p1[24];
                        byte[] image_byte = System.Convert.FromBase64String(gt);
                        Image convertedImage = byteArrayToImage(image_byte);
                        try
                        {

                            string path = Server.MapPath("~/Uploads/SchoolRapidPhoto/");
                            convertedImage.Save(path + rapID + ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
                            Bitmap ThumbnailA = CreateThumbnail(path + Convert.ToString(rapID) + ".jpg", 32, 32);
                            string SaveAsThumbnailA = System.IO.Path.Combine(Server.MapPath("~") + "/Uploads/SchoolRapidPhoto/", "A" + Convert.ToString(rapID) + ".jpg");
                            ThumbnailA.Save(SaveAsThumbnailA);
                            Bitmap ThumbnailB = CreateThumbnail(path + Convert.ToString(rapID) + ".jpg", 75, 75);
                            string SaveAsThumbnailB = System.IO.Path.Combine(Server.MapPath("~") + "/Uploads/SchoolRapidPhoto/", "B" + Convert.ToString(rapID) + ".jpg");
                            ThumbnailB.Save(SaveAsThumbnailB);

                        }
                        catch (Exception e)
                        {
                            return e.Message;
                        } 






                        string[] rapidb1 = parts[1].Split('¼');
                        int i = 0;
                        foreach (string rb in rapidb1)
                        {
                            i++;
                            string b = rb.Split('½')[0] == "" ? "0" : rb.Split('½')[0];
                            string g = rb.Split('½')[1] == "" ? "0" : rb.Split('½')[1];
                            Fn.Exec("EXEC spRapidAssessmentBForWebService '" + rapID + "', '" + Convert.ToString(i) + "', '" + b + "', '" + g + "', 0   ");
                        }

                        string[] rapidb2 = parts[3].Split('¼');
                        i = 0;
                        foreach (string rb in rapidb2)
                        {
                            i++;
                            string b = rb.Split('½')[0] == "" ? "0" : rb.Split('½')[0];
                            string g = rb.Split('½')[1] == "" ? "0" : rb.Split('½')[1];
                            Fn.Exec("EXEC spRapidAssessmentBForWebService '" + rapID + "', '" + Convert.ToString(i) + "', '" + b + "', '" + g + "', 1   ");
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                ret = ex.Message;
            }

            return ret;
        }
        [WebMethod]
        public string SchoolDetailedAssessment(string input)
        {
            string ret = "1";
            using (DBDataContext db = new DBDataContext())
            {
                SchoolDetailedAssessmentWebService obj = new SchoolDetailedAssessmentWebService();
                obj.input = input;
                db.SchoolDetailedAssessmentWebServices.InsertOnSubmit(obj);
                db.SubmitChanges();
            }
            string[] i = input.Split(new[] { "»»»" }, StringSplitOptions.None);
            foreach (string item in i)
            {
                string[] ii = item.Split(new[] { "¡¡" }, StringSplitOptions.None);
                string[] inp = ii[0].Split('½');
                string[] inp1 = ii[2].Split('½');
                string tblAssesmentDetailedID = Fn.ExenID(@"INSERT INTO tblAssesmentDetailed
                         (TblUnionConcilID, tblSlumID, tblAssesmentRapidID, dtDate, dtStartTime, dtEndTime, Surveyor1, Surveyor1Contact, SchoolAddressLine1, NearestLandMark, PtclNumber, OtherContact, NameOfContact, CellPhone, 
                         email, GPS, SchoolOwnedBy, OwnersName, OwnersContactNo, PrincipalName, PrincipalBackground, RespondentsName, PositionRespondent, PositionRespondentOther, LowestClass, HighestClass, 
                         SchoolYearlyMonth, SchoolYealyEnd, ShiftOffered, dtStartTimeMorning, dtEndTimeMorning, dtStartTimeAfternoon, dtEndTimeAfternoon, QA10, QA11, IsTheSchoolRegistered, Sections, TypeOfSchool, 
                         TypeOfSchoolOther, LanguageCode, OtherLanguage, YearSchoolEstablished, YearSchoolRegistered, StudentArea1, StudentArea2, StudentArea3, UrduSpeeking, Other, Govt, Private, Slum1Near, Slum2Near, 
                         Slum3Near, EthnicUrdu, EthnicOther, PubOUP, PubOtherTxt, Attendance, AttendanceComputerized, TuitionFeeReceipt, TuitionFeeReceiptComputerized, TeachSalaries, TeacherSalariesComputerized, BankAccount,
                          AccountOnSchoolName, EFSPartned, ApplyRegistration, SchoolBuilding, SchoolBuildingOther, SizePlot1, SizePlot2, Floors1, Floors2, TotalRooms1, TotalRooms2, UnUsedRooms1Morning, 
                         UnUsedRooms2Morning, UnUsedRooms1Afternoon, UnUsedRooms2Afternoon, HallAvailable, HowMany, HallUsedClassRoom, Library, bookshelf, electricity, electricityAvailable, LoadShedding, generator, water, 
                         WaterDrinkable, Pitcher, BoundaryWall, TeachersToilets, TeachersToiletsFunctional, MaleStudentToilets, MaleStudentToiletsFunctional, FemaleStudentToilets, FemaleStudentToiletsFunctional, Playground, 
                         ComputerLab, NuberOfComputer, isBeingUsed, Transportation, NumberOfVans, ClassroomClean, CommonAreasClean, EatingAreaClean, CleanUniforms, NailsHairCut, DustbinAccessible, GarbageDeposit, Enroll, 
                         EnrollOlder,EnterByEmpID,dtEnterDateTime,QE13,QE14,QE15,QF2,QF1a_Class1,QF1b_Class1,QF1c_Class1,QF1a_Class3,QF1b_Class3,QF1c_Class3)
VALUES        ('" + inp[3] + @"','" + inp[4] + @"','" + inp[5] + @"','" + inp[6] + @"','" + inp[8] + @"','" + inp[9] + @"','" + inp[10] + @"','" + inp[11] + @"','" + inp[12] + @"','" + inp[13] + @"','" + inp[14] + @"','" + inp[15] + @"','" + inp[16] + @"','" + inp[17] + @"','" + inp[18] + @"','" + inp[19] + @"','" + inp[20] + @"','" + inp[21] + @"','" + inp[22] + @"','" + inp[23] + @"','" + inp[24] + @"','" + inp[25] + @"','" + inp[26] + @"','" + inp[27] + @"','" + inp[28] + @"','" + inp[29] + @"','" + inp[30] + @"','" + inp[31] + @"','" + inp[32] + @"','" + inp[33] + @"','" + inp[34] + @"','" + inp[35] + @"','" + inp[36] + @"','" + inp[37] + @"','" + inp[38] + @"','" + inp[39] + @"','" + inp[40] + @"','" + inp[41] + @"','" + inp[42] + @"','" + inp[43] + @"','" + inp[44] + @"','" + inp[45] + @"','" + inp[46] + @"','" + inp[47] + @"','" + inp[48] + @"','" + inp[49] + @"','" + inp[50] + @"','" + inp[51] + @"','" + inp[52] + @"','" + inp[53] + @"','" + inp[54] + @"','" + inp[55] + @"','" + inp[56] + @"','" + inp[57] + @"','" + inp[58] + @"','" + inp[59] + @"','" + inp[60] + @"','" + inp[61] + @"','" + inp[62] + @"','" + inp[63] + @"','" + inp[64] + @"','" + inp[65] + @"','" + inp[66] + @"','" + inp[67] + @"','" + inp[68] + @"','" + inp[69] + @"','" + inp[70] + @"','" + inp[71] + @"','" + inp[72] + @"','" + inp[73] + @"','" + inp[74] + @"','" + inp[75] + @"','" + inp[76] + @"','" + inp[77] + @"','" + inp[78] + @"','" + inp[79] + @"','" + inp[80] + @"','" + inp[81] + @"','" + inp[82] + @"','" + inp[83] + @"','" + inp[84] + @"','" + inp[85] + @"','" + inp[86] + @"','" + inp[87] + @"','" + inp[88] + @"','" + inp[89] + @"','" + inp[90] + @"','" + inp[91] + @"','" + inp[92] + @"','" + inp[93] + @"','" + inp[94] + @"','" + inp[95] + @"','" + inp[96] + @"','" + inp[97] + @"','" + inp[98] + @"','" + inp[99] + @"','" + inp[100] + @"','" + inp[101] + @"','" + inp[102] + @"','" + inp[103] + @"','" + inp[104] + @"','" + inp[105] + @"','" + inp[106] + @"','" + inp[107] + @"','" + inp[108] + @"','" + inp[109] + @"','" + inp[110] + @"','" + inp[111] + @"','" + inp[112] + @"','" + inp[113] + @"','" + inp[114] + @"','" + inp[115] + @"','" + inp[116] + @"','" + inp[0] + @"',GETDATE() , '" + inp1[0] + "' , '" + inp1[1] + "' , '" + inp1[2] + "' , '" + inp1[3] + "' , '" + inp1[4] + "' , '" + inp1[5] + "' , '" + inp1[6] + "' , '" + inp1[7] + "' , '" + inp1[8] + "' , '" + inp1[9] + "') ; select SCOPE_IDENTITY()  ");

                foreach (string tchr in ii[1].Split('¼'))
                {
                    string[] t = tchr.Split('½');
                    if (t.Length == 13)
                    {
                        Fn.Exec(@"INSERT INTO tblAssesmentDetailedTeacherInfo
                         (tblAssesmentDetailedID, E1_Name, E2_Type, E3_Age, E4_Gender, E5_Education, E6_YearAppointed, E7_Experience, E8_GradeTaught, E9_Is_Present, E10_If_No_Why, E11_Subject_Taught, E12_SalaryRange)
VALUES        ('" + tblAssesmentDetailedID + "','" + t[0] + "','" + t[1] + "','" + t[2] + "','" + t[3] + "','" + t[4] + "','" + t[5] + "','" + t[6] + "','" + t[7] + "','" + t[8] + "','" + t[9] + "','" + t[10] + "','" + t[12] + "')");
                    }

                }


                foreach (string tchr in ii[3].Split('¼'))
                {
                    string[] t = tchr.Split('½');
                    if (t.Length > 0)
                    {
                        Fn.Exec(@"INSERT INTO tblAssesmentDetailedClassInfo
                         (tblAssesmentDetailedID, Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15, Col16, Col18, Col19, Col21, Col22, Col23, Col24, Col25, Col26, Col27)
                          VALUES        ('" + tblAssesmentDetailedID + "', '" + t[0] + "', '" + t[1] + "', '" + t[2] + "', '" + t[3] + "', '" + t[4] + "', '" + t[5] + "', '" + t[6] + "', '" + t[7] + "', '" + t[8] + "', '" + t[9] + "', '" + t[10] + "', '" + t[11] + "', '" + t[12] + "', '" + t[13] + "', '" + t[14] + "', '" + t[15] + "', '" + t[16] + "', '" + t[17] + "', '" + t[18] + "', '" + t[19] + "', '" + t[20] + "', '" + t[21] + "', '" + t[22] + "', '" + t[23] + "', '" + t[24] + "')");
                    }

                }
            }






            return ret;
            return ret;
        }

        [WebMethod]
        public string SchoolAcademicAssessment(string input)
        {
            string ret = "1";
            using (DBDataContext db = new DBDataContext())
            {
                SchoolAcademicAssessmentWebService obj = new SchoolAcademicAssessmentWebService();
                obj.input = input;
                db.SchoolAcademicAssessmentWebServices.InsertOnSubmit(obj);
                db.SubmitChanges();
            }
            return ret;
        }


        [WebMethod]
        public string OOSC_Family(string generalInfo, string fatherInfo, string motherInfo, string below5above10Info, string studying, string notstudying)
        {
            string rt = "2";
            using (DBDataContext db = new DBDataContext())
            {
                tblOOSC_Temp obj = new tblOOSC_Temp();
                obj.below5above10Info = below5above10Info;
                obj.fatherInfo = fatherInfo;
                obj.generalInfo = generalInfo;
                obj.motherInfo = motherInfo;
                obj.notstudying = notstudying;
                obj.studying = studying;
                db.tblOOSC_Temps.InsertOnSubmit(obj);
                db.SubmitChanges();
            }

            string[] tokens = generalInfo.Split(new[] { "ííí" }, StringSplitOptions.None);
            foreach (var item in tokens)
            {
                if (item != "")
                {
                    //GET 6 STRING here OF EACH ITEM BY »»»
                    string[] str6 = item.Split(new[] { "»»»" }, StringSplitOptions.None);

                    string[] strFamilyInfo = str6[1].Split('½');
                    string str24frmID = "";

                    try
                    {
                        str24frmID = Fn.ExenID(@"INSERT INTO tblOOSC_Form
                         (Date, SurveyorName, RespondentName, FamilyHeadName, RespondentRetlation, FamilyHeadMaritalStatus, FamilyHeadMotherToung,FamilyHeadMotherToungOther, FamilyHeadReligion, IfOtherReligion, MonthlyIncome, ResidentialStatus,  HouseNo, Street, TblUnionConcilID, tblSlumID, SlumDivision, LandMark, ContactName1, ContactNumber1, ContactName2, ContactNumber2)
                        VALUES        ('" + strFamilyInfo[0] + "','" + strFamilyInfo[1] + "','" + strFamilyInfo[2] + "','" + strFamilyInfo[3] + "','" + strFamilyInfo[4] + "','" + strFamilyInfo[5] + "','" + strFamilyInfo[6] + "','" + strFamilyInfo[7] + "','" + strFamilyInfo[8] + "','" + strFamilyInfo[9] + "','" + strFamilyInfo[10] + "','" + strFamilyInfo[11] + "','" + strFamilyInfo[12] + "','" + strFamilyInfo[13] + "','" + strFamilyInfo[16] + "','" + strFamilyInfo[17] + "','" + strFamilyInfo[18] + "','" + strFamilyInfo[19] + "','" + strFamilyInfo[20] + "','" + strFamilyInfo[21] + "','" + strFamilyInfo[22] + "','" + strFamilyInfo[23] + "') ;select SCOPE_IDENTITY() ");

                    }
                    catch (Exception)
                    {
                        rt = "-2";
                    }


                    try
                    {
                        Fn.Exec(@"INSERT INTO tblOOSC_Form_School (tblOOSC_FormID, tblAssesmentRapidID) VALUES (" + str24frmID + @",'" + strFamilyInfo[28] + "')");
                    }
                    catch (Exception)
                    {
                        rt = "-2";
                    }


                    string[] FatherInfo = str6[2].Split('½');
                    try
                    {
                        Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, CNIC_BISP, AGE, Gender, ReceivedEducation, EducationInstitute, HighestClass, ReadNewsPaper, WriteName, AddSubtract, Occupation,tblOOSC_FormID)
                        VALUES('Father','" + FatherInfo[1] + "','" + FatherInfo[2] + "','" + FatherInfo[3] + "','" + FatherInfo[4] + "','" + FatherInfo[5] + "','" + FatherInfo[6] + "','" + FatherInfo[7] + "','" + FatherInfo[8] + "','" + FatherInfo[9] + "','" + FatherInfo[10] + "','" + FatherInfo[11] + "','" + str24frmID + "')");

                    }
                    catch (Exception)
                    {
                        rt = "-2";
                    }
                    string[] MotherInfo = str6[3].Split('½');
                    try
                    {
                        Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, CNIC_BISP, AGE, Gender, ReceivedEducation, EducationInstitute, HighestClass, ReadNewsPaper, WriteName, AddSubtract, Occupation,tblOOSC_FormID)
                        VALUES('Mother','" + MotherInfo[1] + "','" + MotherInfo[2] + "','" + MotherInfo[3] + "','" + MotherInfo[4] + "','" + MotherInfo[5] + "','" + MotherInfo[6] + "','" + MotherInfo[7] + "','" + MotherInfo[8] + "','" + MotherInfo[9] + "','" + MotherInfo[10] + "','" + MotherInfo[11] + "','" + str24frmID + "')");


                    }
                    catch (Exception)
                    {
                        rt = "-2";
                    }
                    string[] OffspringInfo = str6[4].Split('¼');
                    foreach (var os in OffspringInfo)
                    {
                        string[] strData = os.Split('½');
                        try
                        {
                            Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, CNIC_BISP, AGE, Gender, ReceivedEducation, EducationInstitute, HighestClass, ReadNewsPaper, WriteName, AddSubtract, Occupation,tblOOSC_FormID)
                        VALUES('Offspring','" + strData[0] + "','" + strData[1] + "','" + strData[2] + "','" + strData[3] + "','" + strData[4] + "','" + strData[5] + "','" + strData[6] + "','" + strData[7] + "','" + strData[8] + "','" + strData[9] + "','" + strData[10] + "', '" + str24frmID + "')");

                        }
                        catch (Exception)
                        {
                            rt = "-2";
                        }
                    }



                    string[] OffspringInfo1 = str6[5].Split('¼');
                    foreach (var os in OffspringInfo1)
                    {
                        string[] strData = os.Split('½');
                        try
                        {
                            Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name,DOB,  Gender, CurrentlyStudingSchoolName, CurrentlyStudingChildClass, CurrentlyStudingChildSchoolingYear, CurrentlyStudingChildEmployed, CurrentlyStudingChildWork, CurrentlyStudingChildWorkHours, 
                         CurrentlyStudingChildDisability,tblOOSC_FormID, EducationStatus)
                        VALUES('Offspring','" + strData[0] + "','" + strData[1] + "','" + strData[2] + "','" + strData[3] + "','" + strData[4] + "','" + strData[5] + "','" + strData[6] + "','" + strData[7] + "','" + strData[8] + "','" + strData[9] + "','" + str24frmID + "','Currently Studying')");

                        }
                        catch (Exception)
                        {
                            rt = "-2";
                        }
                    }


                    string[] OffspringInfo2 = str6[6].Split('¼');
                    foreach (var os in OffspringInfo2)
                    {
                        if(os!=""){
                        string[] strData = os.Split('½');
                        try
                        {
                            string thisOOSC = Fn.ExenID(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, DOB, Gender, OOSC_Disability, OOSC_BeenToSchool, OOSC_WhenLeavSchool, OOSC_WhyLeaveSchool, OOSC_SchoolName, OOSC_ClassWhenLeftSchool, OOSC_TotalSchoolingYear, OOSC_CanReadStory, 
                         OOSC_CanWriteLetter, OOSC_CanChildAddSubtract, OOSC_IsChilEmployeed, OOSC_ChildWork, OOSC_ChildWorkHours,tblOOSC_FormID, EducationStatus)
                        VALUES('Offspring','" + strData[0] + "','" + strData[1] + "','" + strData[2] + "','" + strData[3] + "','" + strData[4] + "','" + strData[5] + "','" + strData[6] + "','" + strData[7] + "','" + strData[8] + "','" + strData[9] + "','" + strData[10] + "','" + strData[11] + "','" + strData[12] + "','" + strData[13] + "','" + strData[14] + "','" + strData[15] + "','" + str24frmID + "','Out of School');  ;select SCOPE_IDENTITY() ");
                            string gt = strData[16];
                                byte[] image_byte = System.Convert.FromBase64String(gt);
                                Image convertedImage = byteArrayToImage(image_byte);
                                try
                                {
                                    
                                    string path = Server.MapPath("~/Uploads/OOSC_Photos/");
                                    convertedImage.Save(path + thisOOSC + ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
                                    Bitmap ThumbnailA = CreateThumbnail(path + Convert.ToString(thisOOSC) + ".jpg", 32, 32);
                                    string SaveAsThumbnailA = System.IO.Path.Combine(Server.MapPath("~") + "/Uploads/OOSC_Photos/", "A" + Convert.ToString(thisOOSC) + ".jpg");
                                    ThumbnailA.Save(SaveAsThumbnailA);
                                    Bitmap ThumbnailB = CreateThumbnail(path + Convert.ToString(thisOOSC) + ".jpg", 75, 75);
                                    string SaveAsThumbnailB = System.IO.Path.Combine(Server.MapPath("~") + "/Uploads/OOSC_Photos/", "B" + Convert.ToString(thisOOSC) + ".jpg");
                                    ThumbnailB.Save(SaveAsThumbnailB);

                                    Fn.Exec("Update tblOOSC_Form_Family set fileExtention='.jpg' where tblOOSC_Form_FamilyID=" + thisOOSC);

                                }
                                catch (Exception e)
                                {
                                    //return e.Message;
                                    rt = "-2";
                                }  

                        }
                        catch (Exception)
                        {
                            rt = "-2";
                        }
                    }
                    }
                }
            }
            return rt;
        }

        public Image byteArrayToImage(byte[] byteArrayIn)
        {

            //try
            //{
            //    MemoryStream ms = new MemoryStream(byteArrayIn);
            //    Image returnImage = Image.FromStream(ms);
            //    return returnImage;
            //}
            //catch (Exception ex)
            //{

            //    string str = ex.Message;
            //    return null;
            //}

            Stream tempstream;
            System.Drawing.Image tempimage = null;
            try
            {
                tempstream = new MemoryStream(byteArrayIn);
                tempimage = System.Drawing.Image.FromStream(tempstream);
            }
            catch (Exception ex)
            {
              string s1 = "Errormessage 100: \n " + ex.Message;
              string s2 = "Errorsource 100: \n " + ex.Source;
              string s3 = "Errorstacktrace 100: \n " + ex.StackTrace;
              string s4 = "Errortargetsite 100: \n " + ex.TargetSite;


            }
            return tempimage;
        }


        public byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            return ms.ToArray();
        }


        //public byte[] imageToByteArray(System.Drawing.Image imageIn)
        //{
        //    using (var ms = new MemoryStream())
        //    {
        //        imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
        //        return ms.ToArray();
        //    }
        //}

        public string ddllist(List<clsLocation> Lloc)
        {
            string ret = "";
            foreach (var item in Lloc)
            {
                ret += "<option value='" + item.LocID + "'>" + item.LocName + "</option>";
            }
            return ret;
        }

    }//END OF EFSWS

    public class clsVillageAndroid
    {
        public List<clsLocation> village { get; set; }
    }

    public class clsUCAndroid : clsVillageAndroid
    {
        public List<clsLocation> UC { get; set; }
    }

    public class clsFUAndroid : clsUCAndroid
    {
        public List<clsLocation> FU { get; set; }
    }

    public class clsTehsilAndroid : clsFUAndroid
    {
        public List<clsLocation> Tehsil { get; set; }
    }

    public class clsDistrictAndroid : clsTehsilAndroid
    {
        public List<clsLocation> District { get; set; }
    }

    public class clsRegionAndroid : clsDistrictAndroid
    {
        public List<clsLocation> Region { get; set; }
    }
    public class clsProvinceAndroide : clsRegionAndroid
    {
        public List<clsLocation> Province { get; set; }
    }
    public class clsCountryAndroid : clsProvinceAndroide
    {
        public List<clsLocation> Country { get; set; }
    }



}
