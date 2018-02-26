using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class CompanyRegistrationBHU : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        public static string UserID = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        [WebMethod]
        public static string AllCompaniesList(string DSU) 
        {
          
           // return Fn.Data2Json("EXEC SP_AllCompaniesList");

            return Fn.Data2Json(@"SELECT        CompanyID, CompanyName, CompanyAbbrivation, CompanyAddress, CompanyPhoneNo, CompanyPhoneNo1, CompanyEmail, CompanyWebsite, CompanyEstablishmentYear, CompanyDistrictID, ISNULL(GPS,'') GPS, 
                         CompanyLogo, CompanyProvince, Code, ParentId, TblVillageCity, Type, lvl
FROM            tbl_Company WHERE ParentId = "+DSU);
        }



        [WebMethod]
        public static string BindTehsil(int ID)
        {
            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locFU = new List<clsLocation>();
            List<clsLocation> locUC = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                var thisID = db.tbl_Companies.Where(v => v.CompanyID == ID).FirstOrDefault().CompanyDistrictID;
                loc = db.TblTehsils.Where(v => v.DistrictID == thisID).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locFU = db.TblFeildUnits.Where(v => v.TehsilID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation
                {
                    LocID = s.FeildUnitID,
                    LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locUC = db.TblUnionConcils.Where(v => v.FeildUnitID == locFU.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == locUC.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsTehsil obj = new clsTehsil();
            obj.Tehsil = ddllist(loc);
            obj.FU = ddllist(locFU);
            obj.UC = ddllist(locUC);
            obj.village = ddllist(locVillage);
            return new JavaScriptSerializer().Serialize(obj);

        }
        public static string ddllist(List<clsLocation> Lloc)
        {
            string ret = "";
            foreach (var item in Lloc)
            {
                ret += "<option value='" + item.LocID + "'>" + item.LocName + "</option>";
            }
            return ret;
        }
        [WebMethod]
        public static String getlocDistrict(string TypeID)
        {
            int type = 0;
            try
            {
                type = Convert.ToInt32(TypeID);
            }
            catch (Exception)
            {

                return "";
            }
            return Fn.Data2Json("select  DistrictID as LocID, LocName from TblDistrict where RegionID = " + TypeID + " order by LocName");
        }
        [WebMethod]
        public static String getlocRegion()
        {
            return Fn.Data2Json("select ProvinceID as LocID, LocName from TblProvince order by LocName");

        }
    }
}