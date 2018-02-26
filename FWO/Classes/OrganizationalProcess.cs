using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FRDP
{
    public class OrganizationalProcess
    {

        public int SaveLevel1(string DeptName, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_SaveNewOrgLeve1", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;


                cmd.Parameters.AddWithValue("@DeptName", DeptName);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);
                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
            return ok;

        }


        public int UpdateLevel1(string DeptName, string id, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_UpdateNewOrgLeve1", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;


                cmd.Parameters.AddWithValue("@DeptName", DeptName);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);

                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
            return ok;

        }


        public int SaveLevel2(string funName, string DeptID, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_SaveNewOrgLeve2", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;


                cmd.Parameters.AddWithValue("@FunName", funName);
                cmd.Parameters.AddWithValue("@DeptID", DeptID);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);

                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                string sssssssss = ex.Message;
                sssssssss = "";
            }
            finally
            {
                con.Close();
            }
            return ok;

        }


        public int UpdateLevel2(string funName, string FunctionID, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_UpdateNewOrgLeve2", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;


                cmd.Parameters.AddWithValue("@FunName", funName);
                cmd.Parameters.AddWithValue("@FunID", FunctionID);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);

                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
            return ok;

        }


        public int SaveLevel3(string SubFunName, string FunID, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_SaveNewOrgLeve3", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;


                cmd.Parameters.AddWithValue("@SFunName", SubFunName);
                cmd.Parameters.AddWithValue("@FunID", FunID);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);

                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
            return ok;

        }


        public int UpdateLevel3(string SubFunName, string sFunID, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_UpdateOrgLeve3", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;


                cmd.Parameters.AddWithValue("@SFunName", SubFunName);
                cmd.Parameters.AddWithValue("@sFunID", sFunID);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);

                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
            return ok;

        }


        public int SaveLevel4(string ActivityName, string sFunID, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_SaveNewOrgLeve4", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;

                cmd.Parameters.AddWithValue("@Activity", ActivityName);
                cmd.Parameters.AddWithValue("@sFunID", sFunID);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);
                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
            return ok;

        }


        public int UpdateLevel4(string ActivityName, string ActivityID, string Seq)
        {
            int ok = -1;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.open();

                SqlCommand cmd = new SqlCommand("usp_UpdateOrgLeve4", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm = new SqlParameter("@OK", SqlDbType.Int);
                parm.Direction = ParameterDirection.Output;

                cmd.Parameters.AddWithValue("@Activity", ActivityName);
                cmd.Parameters.AddWithValue("@ActivityID", ActivityID);
                cmd.Parameters.AddWithValue("@Seq", Seq);

                cmd.Parameters.Add(parm);
                cmd.ExecuteNonQuery();

                ok = Convert.ToInt32(cmd.Parameters["@OK"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
            return ok;

        }
    }
}