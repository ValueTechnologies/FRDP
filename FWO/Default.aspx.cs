using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class Default : System.Web.UI.Page
    {
        private MyClass Fn = new MyClass();

        private bool ValidateControls()
        {
            bool validate = true;
            lblMsg.Visible = false;
            if (string.IsNullOrEmpty(txtUser.Text))
            {
                lblMsg.Text = "Please enter a user name ...";
                lblMsg.Visible = true;
                return validate == false;
            }
            if (string.IsNullOrEmpty(txtPass.Text))
            {
                lblMsg.Text = "Please enter a password ...";
                lblMsg.Visible = true;
                return validate == false;
            }
            return (validate);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.Form.DefaultButton = btnLogin.UniqueID;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (ValidateControls())
            {
                try
                {
                    string ssssssssssss = Encryptor.Encrypt(txtPass.Text);
                    DataTable DT = Fn.FillDSet("sp_Login '" + txtUser.Text + "','" + Encryptor.Encrypt(txtPass.Text) + "'").Tables[0];

                    if (txtPass.Text == Encryptor.Decrypt(DT.Rows[0]["Password"].ToString()))
                    {
                        //string EN = "";
                        //int? EID = 0, UGID = 0;
                        //bool? IsAllowed = false;
                        //using (DBDataContext db = new DBDataContext())
                        //{
                        //    db.User_Login(txtUser.Text, ssssssssssss, ref EN, ref EID, ref UGID, "", ref IsAllowed);
                        //}
                        //if (Convert.ToBoolean(IsAllowed) && Convert.ToInt32(EID) > 0)
                        //{

                        Session.Add("EmpName", Convert.ToString(DT.Rows[0]["EmpName"]));
                        Response.Cookies["EmpName"].Value = Convert.ToString(DT.Rows[0]["EmpName"]);
                            Response.Cookies["EmpName"].Expires = DateTime.Now.AddDays(1);

                            Session.Add("bIsEmployee", Convert.ToString(DT.Rows[0]["bIsEmployee"]));
                            Response.Cookies["bIsEmployee"].Value = Convert.ToString(DT.Rows[0]["bIsEmployee"]);
                            Response.Cookies["bIsEmployee"].Expires = DateTime.Now.AddDays(1);


                            Session.Add("Emp_Id", Convert.ToString(DT.Rows[0]["Emp_Id"]));
                            Response.Cookies["Emp_Id"].Value = Convert.ToString(DT.Rows[0]["Emp_Id"]);
                            Response.Cookies["Emp_Id"].Expires = DateTime.Now.AddDays(1);
                            //READ Cookie in c#
                            //Convert.ToString(HttpContext.Current.Session["Emp_Id"]);

                            Session.Add("User_Group_ID", Convert.ToString(DT.Rows[0]["User_Group_ID"]));
                            Response.Cookies["User_Group_ID"].Value = Convert.ToString(DT.Rows[0]["User_Group_ID"]);
                            Response.Cookies["User_Group_ID"].Expires = DateTime.Now.AddDays(1);


                            Session.Add("UserID", Convert.ToString(DT.Rows[0]["UserID"]));
                            Response.Cookies["UserID"].Value = Convert.ToString(DT.Rows[0]["UserID"]);
                            Response.Cookies["UserID"].Expires = DateTime.Now.AddDays(1);


                            Session.Add("username", Convert.ToString(DT.Rows[0]["UserName"]));
                            Response.Cookies["username"].Value = Convert.ToString(DT.Rows[0]["UserName"]);
                            Response.Cookies["username"].Expires = DateTime.Now.AddDays(1);


                            Session.Add("onlyname", Convert.ToString(DT.Rows[0]["onlyname"]));
                            Response.Cookies["onlyname"].Value = Convert.ToString(DT.Rows[0]["onlyname"]);
                            Response.Cookies["onlyname"].Expires = DateTime.Now.AddDays(1);


                            Session.Add("GroupID", Convert.ToString(DT.Rows[0]["GroupID"]));
                            Response.Cookies["GroupID"].Value = Convert.ToString(DT.Rows[0]["GroupID"]);
                            Response.Cookies["GroupID"].Expires = DateTime.Now.AddDays(1);


                            //Session.Add("PRD", DT.Rows[0][5]);
                            Session.Add("ContactNo", Convert.ToString(DT.Rows[0]["ContactNo"]));
                            Response.Cookies["ContactNo"].Value = Convert.ToString(DT.Rows[0]["ContactNo"]);
                            Response.Cookies["ContactNo"].Expires = DateTime.Now.AddDays(1);

                            Session.Add("email", Convert.ToString(DT.Rows[0]["Email"]));
                            Response.Cookies["email"].Value = Convert.ToString(DT.Rows[0]["Email"]);
                            Response.Cookies["email"].Expires = DateTime.Now.AddDays(1);

                            Session.Add("designation", Convert.ToString(DT.Rows[0]["designation"]));
                            Response.Cookies["designation"].Value = Convert.ToString(DT.Rows[0]["designation"]);
                            Response.Cookies["designation"].Expires = DateTime.Now.AddDays(1);



                            Session.Add("picExt", Convert.ToString(DT.Rows[0]["picExt"]));
                            Response.Cookies["picExt"].Value = Convert.ToString(DT.Rows[0]["picExt"]);
                            Response.Cookies["picExt"].Expires = DateTime.Now.AddDays(1);

                            Session.Add("CompanyID", Convert.ToString(DT.Rows[0]["CompanyID"]));
                            Response.Cookies["CompanyID"].Value = Convert.ToString(DT.Rows[0]["CompanyID"]);
                            Response.Cookies["CompanyID"].Expires = DateTime.Now.AddDays(1);


                            //Response.Cookies["theme"].Value = DT.Rows[0][3].ToString();
                            //Response.Cookies["theme"].Expires = DateTime.Now.AddDays(1);







                            //Response.Cookies["PRD"].Value = HttpUtility.UrlEncode(DT.Rows[0][5].ToString());
                            //Response.Cookies["PRD"].Expires = DateTime.Now.AddDays(1);



                            Response.Cookies["FirstRun"].Value = "1";
                            Response.Cookies["FirstRun"].Expires = DateTime.Now.AddDays(1);


                            string S = Fn.ExenID("select TOP(1) Format(AMonth, 'MM')+Format(AMonth, 'yyy') AMonth from tblMonthCloseing");
                            Session.Add("Amonth", S);


                            Session.Add("OfficeId", 16);
                            Response.Cookies["OfficeId"].Value = "16";
                            Response.Cookies["OfficeId"].Expires = DateTime.Now.AddDays(1);
                            //
                            string[] info = Fn.GetRecords("SELECT AccYear, AccYear2, CodeSt, AMonth, AcYrID FROM tblSetup WHERE (CompID = 16)");
                             Session.Add("ActYr", Fn.FirstDayOfMonthFromDateTime(Convert.ToDateTime(info[0])));
                             Response.Cookies["ActYr"].Value = Convert.ToString(Fn.FirstDayOfMonthFromDateTime(Convert.ToDateTime(info[0])));
                             Response.Cookies["ActYr"].Expires = DateTime.Now.AddDays(1);

                             Session.Add("ActYr2", Fn.LastDayOfMonthFromDateTime(Convert.ToDateTime(info[1])));
                             Response.Cookies["ActYr2"].Value = Convert.ToString(Fn.LastDayOfMonthFromDateTime(Convert.ToDateTime(info[1])));
                             Response.Cookies["ActYr2"].Expires = DateTime.Now.AddDays(1);

                             Session.Add("ActMth", Convert.ToDateTime(info[3]).ToString("MMMM yyyy"));
                             Response.Cookies["ActMth"].Value = Convert.ToString(Convert.ToDateTime(info[3]).ToString("MMMM yyyy"));
                             Response.Cookies["ActMth"].Expires = DateTime.Now.AddDays(1);

                             Session.Add("CodeSt", info[2]);
                             Response.Cookies["CodeSt"].Value = Convert.ToString(info[2]);
                             Response.Cookies["CodeSt"].Expires = DateTime.Now.AddDays(1);

                             Session.Add("br", "16");
                             Response.Cookies["br"].Value = "16";
                             Response.Cookies["br"].Expires = DateTime.Now.AddDays(1);

                             Session.Add("fy", Convert.ToString(info[4]) );
                             Response.Cookies["fy"].Value = Convert.ToString(info[4]);
                             Response.Cookies["fy"].Expires = DateTime.Now.AddDays(1);
                             
                            //$.cookie('fy', $('#ddYear').val());
                            //$.cookie('ey', $('#ddey').val());

                            string S1 = Fn.ExenID("select TOP(1) Format(AMonth, 'MM')+Format(AMonth, 'yyy') AMonth from tblMonthCloseing");
                            //Session.Add("ActMth", S1);
                            Session.Add("OfficeId", 16);

                            Fn.Exec("INSERT INTO tblUserLog(UserID) VALUES (" + Convert.ToString(DT.Rows[0]["UserID"]) + ")");
                            Response.Cookies["xx"].Value = S;
                            Response.Cookies["xx"].Expires = DateTime.Now.AddDays(1);
                            Response.Cookies["yy"].Value = "16";
                            Response.Cookies["yy"].Expires = DateTime.Now.AddDays(1);
                            Response.Redirect(DT.Rows[0]["MP"].ToString());
                        //}

                    }
                    else
                    {
                        lblMsg.Text = "The username or password you entered is incorrect.";
                        lblMsg.Visible = true;
                    }
                }
                catch(Exception ex)
                {
                    lblMsg.Text = "The username or password you entered is incorrect...";
                    lblMsg.Visible = true;
                }
            }
        }
    }
}