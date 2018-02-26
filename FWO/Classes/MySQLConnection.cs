using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace FRDP
{
    public class MySQLConnection
    {
        public SqlConnection con = null;

        public MySQLConnection()
        {

        }

        public void open()
        {
            if (con == null)
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"].ConnectionString);
                con.Open();
            }
            else
            {
                con.Open();
            }
        }


        public void openHRIS()
        {
            if (con == null)
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["VD_DB_ConnectionString"].ConnectionString);
                con.Open();
            }
            else
            {
                con.Open();
            }
        }




        public void Close()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }


        public void CloseHRIS()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}
