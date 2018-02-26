using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class OrganizationDevelopment : System.Web.UI.Page
    {
        public static MyClass fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod]
        public static string Level1() 
        {
            return fn.Data2Json("SELECT Depart, DeptID, DeptSeq FROM tblOD_Process GROUP BY Depart, DeptID, DeptSeq ORDER BY case when  DeptSeq is null then 10000 else DeptSeq end");
        }


        [WebMethod]
        public static string Level2(string deptId)
        {
            return fn.Data2Json("SELECT Func, FuncID, FuncSeq FROM tblOD_Process  WHERE (Func is not null and Func not like '' and Depart like '" + deptId + "' )  GROUP BY Func, FuncID, FuncSeq order by case when FuncSeq is null then 10000 else FuncSeq end ");
        }


        [WebMethod]
        public static string Level3(string FunId)
        {
            return fn.Data2Json("SELECT SFunc, SFuncID, SFuncSeq, SFuncSeq FROM tblOD_Process  WHERE (SFunc is not null and  Func not like '' and Func like '" + FunId + "') GROUP BY SFunc, SFuncID, SFuncSeq order by case when SFuncSeq is null then 10000 else SFuncSeq end");
        }


        [WebMethod]
        public static string Level4(string SFunId)
        {
            return fn.Data2Json("SELECT Activ, ID, Procc, ActivitySeq FROM tblOD_Process  WHERE (Activ is not null and Activ not like '' and SFunc like '" + SFunId + "')  GROUP BY Activ, ID, Procc, ActivitySeq Order by Case when ActivitySeq is null then 10000 else ActivitySeq end");
        }



        [WebMethod]
        public static string SaveLevel1(string NewDeptName, string Seq) 
        {
            OrganizationalProcess op = new OrganizationalProcess();
            int ok = op.SaveLevel1(NewDeptName, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }



        [WebMethod]
        public static string UpdateLevel1(string NewDeptName, string ID, string Seq) 
        {

            ID = ID.Replace("L1", "");
            OrganizationalProcess op = new OrganizationalProcess();
            int ok = op.UpdateLevel1(NewDeptName, ID, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }



        [WebMethod]
        public static string SaveLevel2(string FunName, string DepartmentID, string Seq) 
        {
            string dept = DepartmentID.Replace("L1", "");
            OrganizationalProcess DBManop = new OrganizationalProcess();
            int ok = DBManop.SaveLevel2(FunName, dept, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }


        [WebMethod]
        public static string UpdateLevel2(string FunName, string ID, string Seq) 
        {
            string Function = ID.Replace("L2", "");
            OrganizationalProcess DBManop = new OrganizationalProcess();
            int ok = DBManop.UpdateLevel2(FunName, Function, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }




        [WebMethod]
        public static string SaveLevel3(string SubFunName, string FunID, string Seq)
        {
            string Fun = FunID.Replace("L2", "");
            OrganizationalProcess DBManop = new OrganizationalProcess();
            int ok = DBManop.SaveLevel3(SubFunName, Fun, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }


        [WebMethod]
        public static string UpdateLevel3(string SubFunName, string sFunID, string Seq)
        {
            string sFun = sFunID.Replace("L3", "");
            OrganizationalProcess DBManop = new OrganizationalProcess();
            int ok = DBManop.UpdateLevel3(SubFunName, sFun, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }



        [WebMethod]
        public static string SaveLevel4(string Activity, string sFunID, string Seq)
        {
            string sFunId = sFunID.Replace("L3", "");
            OrganizationalProcess DBManop = new OrganizationalProcess();
            int ok = DBManop.SaveLevel4(Activity, sFunId, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }

        [WebMethod]
        public static string UpdateLevel4(string Activity, string ActivityID, string Seq)
        {
            string Activity_ID = ActivityID.Replace("L4", "");
            OrganizationalProcess DBManop = new OrganizationalProcess();
            int ok = DBManop.UpdateLevel4(Activity, Activity_ID, Seq);
            if (ok > 0)
            {
                return "1";
            }
            return "-1";
        }



        [WebMethod]
        public static string ProcessName(string id) 
        {
            id = id.Replace("L4", "");
            return fn.Data2Json("SELECT ID, Procc FROM tblOD_Process where ID = " + id);
        }
    }
}