using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FRDP
{
    public class clsDB
    {
    }

    public class clsLocation
    {
        public int LocID { get; set; }
        public string LocName { get; set; }
    }

    public class TblHResourcesSingle : spUserInfoResult
    {

        public List<spUserDistrictsResult> UserDisticts = new List<spUserDistrictsResult>();
    }

    public partial class DBDataContext
    {
        public DBDataContext() :
            base(System.Configuration.ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"].ToString(), mappingSource)
        {
            OnCreated();
        }
    }

}