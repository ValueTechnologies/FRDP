using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class PhysicalAppearance : System.Web.UI.Page
    {
        private static MyClass Fn = new MyClass();


        [WebMethod]

        public static string GetAnimalName(string tag)
        {
            MyClass GetAnimalName = new MyClass();
            return GetAnimalName.Data2Json("Select name From tblAnimal where tag = '" + tag + "'");

        }


        [WebMethod]

        public static string Abreed(string tbl_CompanyID)
        {
            MyClass Abreed = new MyClass();

            //return Abreed.Data2Json("Select * From tblAnimal ");
           
            return Abreed.Data2Json(@"SELECT        tag, tbl_CompanyID
FROM            tblAnimal
WHERE        (tbl_CompanyID = " + tbl_CompanyID + ")");
        }

        [WebMethod]

        public static string health(string tag, string AnimalType)
        {
            MyClass health = new MyClass();
            string query = "";

            if (AnimalType == "All Animals" && tag == "0")
            {
                query = "SELECT tblAnimal.name, tblAnimal.tag, tblAnimalHealthPhysicalA.strAnimalTag, Convert(varchar(50),tblAnimalHealthPhysicalA.dtDateTime) as dtDateTime , tblAnimalHealthPhysicalA.strBodyCondition, tblAnimalHealthPhysicalA.strExcretionType, tblAnimalHealthPhysicalA.strFeedIntake, tblAnimalHealthPhysicalA.strProductionCycle, tblAnimalHealthPhysicalA.strNotes FROM tblAnimal INNER JOIN tblAnimalHealthPhysicalA ON tblAnimal.tag = tblAnimalHealthPhysicalA.strAnimalTag ";
            }

            else
            {
                query = "SELECT tblAnimal.name, tblAnimal.tag, tblAnimalHealthPhysicalA.strAnimalTag, Convert(varchar(50),tblAnimalHealthPhysicalA.dtDateTime) as dtDateTime , tblAnimalHealthPhysicalA.strBodyCondition, tblAnimalHealthPhysicalA.strExcretionType, tblAnimalHealthPhysicalA.strFeedIntake, tblAnimalHealthPhysicalA.strProductionCycle, tblAnimalHealthPhysicalA.strNotes FROM tblAnimal INNER JOIN tblAnimalHealthPhysicalA ON tblAnimal.tag = tblAnimalHealthPhysicalA.strAnimalTag   where strAnimalTag = '" + tag + "'";
            }

            return health.Data2Json(query);

        }

        [WebMethod]

        public static string insert(string tag, string bodyCondition, string adate, string excretionType, string feedIntake, string production, string taNotes)
        {

            using (DBDataContext db = new DBDataContext())
            {
                tblAnimalHealthPhysicalA obj = new tblAnimalHealthPhysicalA();
                if (obj != null)
                {

                    obj.strAnimalTag = tag;
                    obj.dtDateTime = Convert.ToDateTime(adate);
                    obj.strBodyCondition = bodyCondition;
                    obj.strExcretionType = excretionType;
                    obj.strFeedIntake = feedIntake;
                    obj.strProductionCycle = production;
                    obj.strNotes = taNotes;

                    db.tblAnimalHealthPhysicalAs.InsertOnSubmit(obj);
                    db.SubmitChanges();


                }
            }

            return "success";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}