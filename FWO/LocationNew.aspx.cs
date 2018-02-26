using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class LocationNew : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod]
        public static String LocProv()
        {
            return Fn.Data2Json("SELECT CountryID LocID,LocName FROM TBLCountry  ORDER BY LocName");
        }

        [WebMethod]
        public static String getlocProvince(string TypeID)
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
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblProvinces.Where(v => v.CountryID == Convert.ToInt32(TypeID))
                    .Select(s => new clsLocation { LocID = s.ProvinceID, LocName = s.LocName }).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
        }
        [WebMethod]
        public static String getlocRegion(string TypeID)
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
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblRegions.Where(v => v.ProvinceID == Convert.ToInt32(TypeID))
                    .Select(s => new clsLocation { LocID = s.RegionID, LocName = s.LocName.Trim() == "" ? db.TblProvinces.Where(xx => xx.ProvinceID == s.ProvinceID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName }).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
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
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblDistricts.Where(v => v.RegionID == Convert.ToInt32(TypeID))
                    .Select(s => new clsLocation { LocID = s.DistrictID, LocName = s.LocName }).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
        }
        [WebMethod]
        public static String getlocTehsil(string TypeID)
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
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblTehsils.Where(v => v.DistrictID == Convert.ToInt32(TypeID))
                    .Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
        }
        [WebMethod]
        public static String getlocFeildUnit(string TypeID)
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
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblFeildUnits.Where(v => v.TehsilID == Convert.ToInt32(TypeID))
                    .Select(s => new clsLocation { LocID = s.FeildUnitID, LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName }).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
        }





        [WebMethod]
        public static String getlocFeildUnitX(string TypeID)
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
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblFeildUnits.Where(v => v.TehsilID == Convert.ToInt32(TypeID))
                    .Select(s => new clsLocation
                    {
                        LocID = s.FeildUnitID,
                        LocName = s.LocName.Trim() == "" ? db.TblTehsils.Where(xx => xx.TehsilID == s.TehsilID).Select(ss => ss.LocName).FirstOrDefault() : s.LocName
                    }

                    ).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
        }


        [WebMethod]
        public static String getlocUnionConcil(string TypeID)
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
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblUnionConcils.Where(v => v.FeildUnitID == Convert.ToInt32(TypeID))
                    .Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
        }

        [WebMethod]
        public static String getlocVillageCity(string TypeID)
        {

            int type = 0;
            try
            {
                type = Convert.ToInt32(TypeID);
            }
            catch (Exception)
            {

                type = 0;
            }
            //return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");
            List<clsLocation> Location = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                Location = db.TblVillageCities.Where(v => v.UnionConcilID == Convert.ToInt32(type))
                    .Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).ToList<clsLocation>();
            }

            return new JavaScriptSerializer().Serialize(Location.OrderBy(o => o.LocName));
        }

        [WebMethod]
        public static String getloc(string TypeID)
        {
            //int Type = 0;
            //try
            //{
            //    Type = Convert.ToInt32(TypeID);
            //}
            //catch (Exception)
            //{

            //    Type = 0;
            //}
            //switch (Convert.ToInt32(Type))
            //{
            //    case 1:
            //        //  return Fn.Data2Json("SELECT CountryID LocID, LocName FROM TBLCOUNTRY ORDER BY LocName");
            //        return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");


            //    case 2:
            //        return Fn.Data2Json("SELECT Provinceid LocID, LocName FROM tblProvince ORDER BY LocName");

            //    case 3:
            //        return Fn.Data2Json("SELECT RegionID LocID, LocName FROM TblRegion ORDER BY LocName");


            //    case 4:
            //        return Fn.Data2Json("SELECT DISTRICTID LocID, LocName FROM TblDistrict ORDER BY LocName");


            //    case 5:
            //        return Fn.Data2Json("SELECT TehsilID LocID, LocName FROM TblTehsil ORDER BY LocName");


            //    case 6:
            //        return Fn.Data2Json("SELECT FeildUnitID LocID, LocName FROM TblFeildUnit ORDER BY LocName");

            //    case 7:
            //        return Fn.Data2Json("SELECT UnionConcilID LocID, LocName FROM TBLUnionConcil ORDER BY LocName");

            //    case 8:
            //        return Fn.Data2Json("SELECT VillageCityID LocID, LocName FROM TblVillageCity ORDER BY LocName");

            //    default:
            //        return "";

            //}

            return "";

        }
        [WebMethod]
        public static String AddLoc(String Loc, string Latude, string Path, string TypeID, string ParentID, string Population)
        {

            //  string myret = Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path," + getTblName(TypeID).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + ParentID + ")");
            // return myret;
            ///8888888888888888888888888888888888888888888888888TypeID

            switch (TypeID)
            {
                case "1":
                    // return "tblCountry";
                    using (DBDataContext db = new DBDataContext())
                    {
                        if (db.TblCountries.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim()).Count() > 0)
                        {
                            return "-1";
                        }

                        else
                        {
                            TblCountry tbl = new TblCountry();
                            tbl.LocName = Loc;
                            tbl.Latitude = Latude;
                            tbl.Path = Path;
                            tbl.Lat = Latude;
                            tbl.Longitude = Latude;
                            db.TblCountries.InsertOnSubmit(tbl);
                            db.SubmitChanges();
                            return "1";
                        }
                    }

                case "2":
                    //return "TblProvince";
                    using (DBDataContext db = new DBDataContext())
                    {
                        if (db.TblProvinces.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim() && v.CountryID == Convert.ToInt32(ParentID)).Count() > 0)
                        {
                            return "-1";
                        }
                    }

                    return Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path," + getTblName(Convert.ToString(Convert.ToInt32(TypeID) - 1)).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + ParentID + ")");

                case "3":
                    //return "TblRegion";
                    using (DBDataContext db = new DBDataContext())
                    {


                        if (db.TblRegions.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim() && v.ProvinceID == Convert.ToInt32(ParentID)).Count() > 0)
                        {
                            return "-1";
                        }
                    }
                    return Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path," + getTblName(Convert.ToString(Convert.ToInt32(TypeID) - 1)).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + ParentID + ")");
                case "4":
                    // return "TblDistrict";
                    using (DBDataContext db = new DBDataContext())
                    {

                        if (db.TblDistricts.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim()).Count() > 0)
                        {
                            return "-1";
                        }
                    }
                    return Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path," + getTblName(Convert.ToString(Convert.ToInt32(TypeID) - 1)).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + ParentID + ")");
                case "5":
                    // return "TblTehsil";

                    using (DBDataContext db = new DBDataContext())
                    {

                        if (db.TblTehsils.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim() && v.DistrictID == Convert.ToInt32(ParentID)).Count() > 0)
                        {
                            return "-1";
                        }
                    }
                    return Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path," + getTblName(Convert.ToString(Convert.ToInt32(TypeID) - 1)).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + ParentID + ")");
                case "6":
                    // return "TblFeildUnit";
                    using (DBDataContext db = new DBDataContext())
                    {

                        if (db.TblFeildUnits.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim() && v.TehsilID == Convert.ToInt32(ParentID)).Count() > 0)
                        {
                            return "-1";
                        }
                    }
                    return Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path," + getTblName(Convert.ToString(Convert.ToInt32(TypeID) - 1)).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + ParentID + ")");

                case "7":
                    // return "TblUnionConcil";
                    using (DBDataContext db = new DBDataContext())
                    {

                        if (db.TblUnionConcils.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim() && v.FeildUnitID == Convert.ToInt32(ParentID)).Count() > 0)
                        {
                            return "-1";
                        }
                    }
                    return Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path," + getTblName(Convert.ToString(Convert.ToInt32(TypeID) - 1)).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + ParentID + ")");

                case "8":
                    //                    return "TblVillageCity";
                    using (DBDataContext db = new DBDataContext())
                    {

                        if (db.TblVillageCities.Where(v => v.LocName.ToUpper().Trim() == Loc.ToUpper().Trim() && v.UnionConcilID == Convert.ToInt32(ParentID)).Count() > 0)
                        {
                            return "-1";
                        }
                    }
                    return Fn.Exec("insert into " + getTblName(TypeID) + " (LocName,Lat,Path,Population," + getTblName(Convert.ToString(Convert.ToInt32(TypeID) - 1)).ToUpper().Replace("TBL", "") + "ID) values('" + Loc + "','" + Latude + "','" + Path + "'," + Population + "," + ParentID + ")");

                default:
                    return "";
            }


            //var loca = db.s.Where(v => v.LocName.ToUpper() == Loc.ToUpper() && v.TypeID == Convert.ToInt32(TypeID)).FirstOrDefault();
            //if (loca != null)
            //{
            //    return "-1";
            //}
            //else
            //{
            //    return Fn.Exec("insert into  (LocName,Lat,Path,TypeID,ParentID) values('" + Loc + "','" + Latude + "','" + Path + "','" + TypeID + "'," + ParentID + ")");


            //}

            //}

            //return "";


        }
        [WebMethod]
        public static String getRec(string LocID)
        {
            return Fn.Data2Json("SELECT LocName,Lat,Path,TypeID FROM  where LocID= " + LocID);
        }

        [WebMethod]
        public static String getRec(string LocID, string tbl)
        {
            if (tbl == "8")
            {
                return Fn.Data2Json("SELECT LocName,Lat,Path,"+tbl+" AS TypeID,Population FROM " + getTblName(tbl) + " where " + getTblName(tbl).ToUpper().Replace("TBL", "") + "ID" + "= " + LocID);
            }
            return Fn.Data2Json("SELECT LocName,Lat,Path," + tbl + " AS TypeID FROM " + getTblName(tbl) + " where " + getTblName(tbl).ToUpper().Replace("TBL", "") + "ID" + "= " + LocID);
        }

        public static string getTblName(string tbl)
        {
            switch (tbl)
            {
                case "1":
                    return "tblCountry";
                case "2":
                    return "TblProvince";
                case "3":
                    return "TblRegion";
                case "4":
                    return "TblDistrict";
                case "5":
                    return "TblTehsil";
                case "6":
                    return "TblFeildUnit";
                case "7":
                    return "TblUnionConcil";
                case "8":
                    return "TblVillageCity";
                default:
                    return "";
            }

        }

        [WebMethod]
        public static String UpdateLoc(String Loc, string Latude, string Path, string LocID)
        {
            return Fn.Exec("UPDATE  SET LocName = '" + Loc + "', Lat = '" + Latude + "', Path = '" + Path + "' WHERE (LocID = " + LocID + ")");
        }


        [WebMethod]
        public static String UpdateLoc(String Loc, string Latude, string Path, string LocID, string tbl, string Population)
        {
            if (tbl == "8")
            {
                return Fn.Exec("UPDATE " + getTblName(tbl) + " SET LocName = '" + Loc + "', Lat = '" + Latude + "', Path = '" + Path + "', Population = '" + Population + "' WHERE (" + getTblName(tbl).ToUpper().Replace("TBL", "") + "ID" + "= " + LocID + ")");
            }
            return Fn.Exec("UPDATE " + getTblName(tbl) + " SET LocName = '" + Loc + "', Lat = '" + Latude + "', Path = '" + Path + "' WHERE (" + getTblName(tbl).ToUpper().Replace("TBL", "") + "ID" + "= " + LocID + ")");
        }


        [WebMethod]
        public static string BindVillage(int ID)
        {
            List<clsLocation> loc = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblVillageCities.Where(v => v.UnionConcilID == ID).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsVillage obj = new clsVillage();
            obj.village = ddllist(loc);
            return new JavaScriptSerializer().Serialize(obj);
        }



        [WebMethod]
        public static string BindUC(int ID)
        {

            List<clsLocation> loc = new List<clsLocation>();
            List<clsLocation> locVillage = new List<clsLocation>();
            using (DBDataContext db = new DBDataContext())
            {
                loc = db.TblUnionConcils.Where(v => v.FeildUnitID == ID).Select(s => new clsLocation { LocID = s.UnionConcilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
                locVillage = db.TblVillageCities.Where(v => v.UnionConcilID == loc.Select(ss => ss.LocID).FirstOrDefault()).Select(s => new clsLocation { LocID = s.VillageCityID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
            }
            clsUC obj = new clsUC();
            obj.UC = ddllist(loc);
            obj.village = ddllist(locVillage);
            return new JavaScriptSerializer().Serialize(obj);

        }


        [WebMethod]
        public static string BindFU(int ID)
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
            clsFU obj = new clsFU();
            obj.FU = ddllist(loc);
            obj.UC = ddllist(locUC);
            obj.village = ddllist(locVillage);
            return new JavaScriptSerializer().Serialize(obj);

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
                loc = db.TblTehsils.Where(v => v.DistrictID == ID).Select(s => new clsLocation { LocID = s.TehsilID, LocName = s.LocName }).OrderBy(o => o.LocName).ToList<clsLocation>();
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


        [WebMethod]
        public static string BindDistrict(int ID)
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
            clsDistrict obj = new clsDistrict();
            obj.District = ddllist(loc);
            obj.Tehsil = ddllist(locTehsil);
            obj.FU = ddllist(locFU);
            obj.UC = ddllist(locUC);
            obj.village = ddllist(locVillage);
            return new JavaScriptSerializer().Serialize(obj);

        }



        [WebMethod]
        public static string BindRegion(int ID)
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
            clsRegion obj = new clsRegion();
            obj.Region = ddllist(loc);
            obj.District = ddllist(locDistrict);
            obj.Tehsil = ddllist(locTehsil);
            obj.FU = ddllist(locFU);
            obj.UC = ddllist(locUC);
            obj.village = ddllist(locVillage);
            return new JavaScriptSerializer().Serialize(obj);

        }


        [WebMethod]
        public static string BindProvince(int ID)
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
            clsProvince obj = new clsProvince();
            obj.Province = ddllist(loc);
            obj.Region = ddllist(locRegion);
            obj.District = ddllist(locDistrict);
            obj.Tehsil = ddllist(locTehsil);
            obj.FU = ddllist(locFU);
            obj.UC = ddllist(locUC);
            obj.village = ddllist(locVillage);
            return new JavaScriptSerializer().Serialize(obj);

        }



        [WebMethod]
        public static string BindCountry()
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
            clsCountry obj = new clsCountry();
            obj.Country = ddllist(loc);
            obj.Province = ddllist(locProvince);
            obj.Region = ddllist(locRegion);
            obj.District = ddllist(locDistrict);
            obj.Tehsil = ddllist(locTehsil);
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



    }


    public class clsVillage
    {
        public string village { get; set; }
    }

    public class clsUC : clsVillage
    {
        public string UC { get; set; }
    }

    public class clsFU : clsUC
    {
        public string FU { get; set; }
    }

    public class clsTehsil : clsFU
    {
        public string Tehsil { get; set; }
    }

    public class clsDistrict : clsTehsil
    {
        public string District { get; set; }
    }

    public class clsRegion : clsDistrict
    {
        public string Region { get; set; }
    }
    public class clsProvince : clsRegion
    {
        public string Province { get; set; }
    }
    public class clsCountry : clsProvince
    {
        public string Country { get; set; }
    }


}