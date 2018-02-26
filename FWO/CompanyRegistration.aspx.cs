using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class CompanyRegistration : System.Web.UI.Page
    {
        public static MyClass Fn = new MyClass();
        public static string UserID = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        [WebMethod]
        public static string AllCompaniesList() 
        {
           // return Fn.Data2Json("SELECT CompanyID, CompanyName, CompanyAbbrivation, CompanyAddress, CompanyPhoneNo, CompanyEmail, CompanyWebsite, CompanyEstablishmentYear FROM tbl_Company order by CompanyName");
            return Fn.Data2Json("EXEC SP_AllCompaniesList");
        }


        [WebMethod]
        public static string AllProjectsList()
        {
            // return Fn.Data2Json("SELECT CompanyID, CompanyName, CompanyAbbrivation, CompanyAddress, CompanyPhoneNo, CompanyEmail, CompanyWebsite, CompanyEstablishmentYear FROM tbl_Company order by CompanyName");
            return Fn.Data2Json("EXEC sp_AllProjectsList");
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
            return Fn.Data2Json("select  DistrictID as LocID, LocName from TblDistrict where RegionID in (Select RegionID from TBLRegion where ProvinceID=" + TypeID + ") order by LocName");
        }
        [WebMethod]
        public static String getlocRegion()
        {
            return Fn.Data2Json("select ProvinceID as LocID, LocName from TblProvince order by LocName");

        }
    }
}