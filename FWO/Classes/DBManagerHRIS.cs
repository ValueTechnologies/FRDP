using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FRDP
{
    public class DBManagerHRIS
    {
        public DataTable GetInterviewerPannelEmail(string CandidateID)
        {
            DataTable dt = new DataTable();
            MySQLConnection con = new MySQLConnection();
            try
            {
                con.openHRIS();
                SqlCommand cmd = new SqlCommand("usp_InterviewerPannel", con.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.CloseHRIS();
            }
            return dt;
        }


        public string JoiningEmailBody(string CandidateID)
        {
            DataTable dt = new DataTable();
            string returntxt = string.Empty;
            MySQLConnection con = new MySQLConnection();
            try
            {
                con.openHRIS();

                SqlCommand cmd = new SqlCommand("usp_joiningMail", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CandidateSelectedID", CandidateID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                    returntxt = Convert.ToString(dt.Rows[0]["EmailBody"]);
                }
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.CloseHRIS();
            }
            return returntxt;
        }


        public string OrientationEmailBody(string CandidateID)
        {
            DataTable dt = new DataTable();
            string returntxt = string.Empty;
            MySQLConnection con = new MySQLConnection();
            try
            {

                con.openHRIS();

                SqlCommand cmd = new SqlCommand("usp_OrientationMail", con.con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CandidateSelectedID", CandidateID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                    returntxt = Convert.ToString(dt.Rows[0]["EmailBody"]);
                }
                cmd.Dispose();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.CloseHRIS();
            }
            return returntxt;
        }

    }
}