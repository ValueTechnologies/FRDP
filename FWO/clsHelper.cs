using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ThoughtWorks.QRCode.Codec;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Text;
using System.IO;
namespace FRDP
{
    public class clsHelper
    {

        public string ddlBind()
        {
            return "";
        }
    }

    public class Employee
    {
        public int Emp_Id { get; set; }

        public string EmpName { get; set; }

        public string username { get; set; }
        public string password { get; set; }
        public string onlyname { get; set; }
        public string ContactNo { get; set; }
        public string email { get; set; }
        public string designation { get; set; }
        public string PhotoPath { get; set; }
        public int CompanyID { get; set; }
    }
    public class HealthChartDashboardContainer
    {
        public List<ddl<float>> Cleanliness { get; set; }
        public List<ddl<float>> Activeness { get; set; }

        public List<ddl<float>> PredominantOutgrowth { get; set; }


        public List<ddl<float>> Temprature { get; set; }
        public List<ddl<float>> ThanFR { get; set; }
        public List<ddl<float>> ThanFL { get; set; }
        public List<ddl<float>> ThanBR { get; set; }
        public List<ddl<float>> ThanBL { get; set; }
        public List<ddl<float>> Udder { get; set; }
        public List<ddl<float>> Ticks { get; set; }
        public List<ddl<float>> Horns { get; set; }
        public List<ddl<float>> Head { get; set; }
        public List<ddl<float>> LegFR { get; set; }
        public List<ddl<float>> LegFL { get; set; }
        public List<ddl<float>> LegBR { get; set; }
        public List<ddl<float>> LegBL { get; set; }
        public List<ddl<float>> Tail { get; set; }
        public List<ddl<float>> FeetNail { get; set; }
        public List<ddl<float>> Body { get; set; }
        public List<ddl<float>> Urine { get; set; }
        public List<ddl<float>> Gobar { get; set; }
        public List<ddl<float>> GenitalSecretion { get; set; }

        public List<ddl<int>> Sorting { get; set; }
    }
    public class ddl<T>
    {
        public T ID { get; set; }
        public string Display { get; set; }

        public string other { get; set; }
    }

    public class Seris
    {
        public string Myname { get; set; }
        public List<string> Mydata { get; set; }
    }
    public class Charting
    {
        public List<string> categories { get; set; }
        public List<Seris> Series { get; set; }
    }

    public static class SetMenue //: IRequiresSessionState
    {
        public static void SET()
        {
            if (Convert.ToString(HttpContext.Current.Session["cssmenue"]) != "")
            {
            }
            else
            {
                try
                {
                    if (Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)) != "")
                    {
                        string em = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value));
                        cssMenu cssmenue = new cssMenu(Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
                        HttpContext.Current.Session.Add("cssmenue", cssmenue.main());
                    }
                    else
                    {
                        try
                        {
                            HttpContext.Current.Session.Add("Emp_Id", Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value)));
                            string em = Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value));
                            cssMenu cssmenue = new cssMenu(Convert.ToInt32(Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["Emp_Id"]).Value))));
                            HttpContext.Current.Session.Add("cssmenue", cssmenue.main());
                        }
                        catch (Exception)
                        {

                            HttpContext.Current.Response.Redirect("LogOut.aspx");
                        }

                    }
                }
                catch (Exception)
                {

                    HttpContext.Current.Response.Redirect("LogOut.aspx");
                }
                
            }

        }



    }

    public class Words
    {

        public String changeNumericToWords(double numb)
        {

            String num = numb.ToString();

            return changeToWords(num, false);

        }

        public String changeCurrencyToWords(String numb)
        {

            return changeToWords(numb, true);

        }

        public String changeNumericToWords(String numb)
        {

            return changeToWords(numb, false);

        }

        public String changeCurrencyToWords(double numb)
        {

            return changeToWords(numb.ToString(), true);

        }

        private String changeToWords(String numb, bool isCurrency)
        {

            String val = "", wholeNo = numb, points = "", andStr = "", pointStr = "";

            String endStr = (isCurrency) ? ("Only") : ("");

            try
            {

                int decimalPlace = numb.IndexOf(".");

                if (decimalPlace > 0)
                {

                    wholeNo = numb.Substring(0, decimalPlace);

                    points = numb.Substring(decimalPlace + 1);

                    if (Convert.ToInt32(points) > 0)
                    {

                        andStr = (isCurrency) ? ("Rupees and") : ("point");// just to separate whole numbers from points/cents

                        endStr = (isCurrency) ? ("paisa " + endStr) : ("");

                        pointStr = translateCents(points);

                    }

                }

                val = String.Format("{0} {1}{2} {3}", translateWholeNumber(wholeNo).Trim(), andStr, pointStr, endStr);

            }

            catch { ;}

            return val;

        }
      
        private String translateWholeNumber(String number)
        {

            string word = "";

            try
            {

                bool beginsZero = false;//tests for 0XX

                bool isDone = false;//test if already translated

                double dblAmt = (Convert.ToDouble(number));

                //if ((dblAmt > 0) && number.StartsWith("0"))

                if (dblAmt > 0)
                {//test for zero or digit zero in a nuemric

                    beginsZero = number.StartsWith("0");

                    int numDigits = number.Length;

                    int pos = 0;//store digit grouping

                    String place = "";//digit grouping name:hundres,thousand,etc...

                    switch (numDigits)
                    {

                        case 1://ones' range

                            word = ones(number);

                            isDone = true;

                            break;

                        case 2://tens' range

                            word = tens(number);

                            isDone = true;

                            break;

                        case 3://hundreds' range

                            pos = (numDigits % 3) + 1;

                            place = " Hundred ";

                            break;

                        case 4:



                        case 5:

                            pos = (numDigits % 4) + 1;

                            place = " Thousand ";

                            break;

                        case 6:



                        case 7:



                            pos = (numDigits % 6) + 1;

                            place = " Laks ";

                            break;

                        case 8:



                        case 9:

                            pos = (numDigits % 8) + 1;

                            place = " Crore ";

                            break;

                        case 10://Billions's range

                            pos = (numDigits % 10) + 1;

                            place = " Billion ";

                            break;

                        //add extra case options for anything above Billion...

                        default:

                            isDone = true;

                            break;

                    }

                    if (!isDone)
                    {//if transalation is not done, continue...(Recursion comes in now!!)

                        word = translateWholeNumber(number.Substring(0, pos)) + place + translateWholeNumber(number.Substring(pos));

                        //check for trailing zeros

                        if (beginsZero) word = " and " + word.Trim();

                    }

                    //ignore digit grouping names

                    if (word.Trim().Equals(place.Trim())) word = "";

                }

            }

            catch { ;}

            return word.Trim();

        }

        private String tens(String digit)
        {

            int digt = Convert.ToInt32(digit);

            String name = null;

            switch (digt)
            {

                case 10:

                    name = "Ten";

                    break;

                case 11:

                    name = "Eleven";

                    break;

                case 12:

                    name = "Twelve";

                    break;

                case 13:

                    name = "Thirteen";

                    break;

                case 14:

                    name = "Fourteen";

                    break;

                case 15:

                    name = "Fifteen";

                    break;

                case 16:

                    name = "Sixteen";

                    break;

                case 17:

                    name = "Seventeen";

                    break;

                case 18:

                    name = "Eighteen";

                    break;

                case 19:

                    name = "Nineteen";

                    break;

                case 20:

                    name = "Twenty";

                    break;

                case 30:

                    name = "Thirty";

                    break;

                case 40:

                    name = "Fourty";

                    break;

                case 50:

                    name = "Fifty";

                    break;

                case 60:

                    name = "Sixty";

                    break;

                case 70:

                    name = "Seventy";

                    break;

                case 80:

                    name = "Eighty";

                    break;

                case 90:

                    name = "Ninety";

                    break;

                default:

                    if (digt > 0)
                    {

                        name = tens(digit.Substring(0, 1) + "0") + " " + ones(digit.Substring(1));

                    }

                    break;

            }

            return name;

        }

        private String ones(String digit)
        {

            int digt = Convert.ToInt32(digit);

            String name = "";

            switch (digt)
            {

                case 1:

                    name = "One";

                    break;

                case 2:

                    name = "Two";

                    break;

                case 3:

                    name = "Three";

                    break;

                case 4:

                    name = "Four";

                    break;

                case 5:

                    name = "Five";

                    break;

                case 6:

                    name = "Six";

                    break;

                case 7:

                    name = "Seven";

                    break;

                case 8:

                    name = "Eight";

                    break;

                case 9:

                    name = "Nine";

                    break;

            }

            return name;

        }

        private String translateCents(String cents)
        {

            String cts = "", digit = "", engOne = "";

            for (int i = 0; i < cents.Length; i++)
            {

                digit = cents[i].ToString();

                if (digit.Equals("0"))
                {

                    engOne = "Zero";

                }

                else
                {

                    engOne = ones(digit);

                }

                cts += " " + engOne;

            }

            return cts;

        }

    }

    public class QR
    {
        public string QrGenerate(string str, string tbl, string id)
        {
            QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
            qrCodeEncoder.QRCodeScale = 6;
            qrCodeEncoder.QRCodeVersion = 4;

            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.L;

            System.Drawing.Image image;
            String data = Encryptor.Encrypt(str + "½" + tbl);
            image = qrCodeEncoder.Encode(data);
            string filepath = HttpContext.Current.Server.MapPath("") + "\\QrCodes\\" + tbl + "\\";
            //string fileName = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Millisecond + ".bmp";
            string fileName = id + ".bmp";
            using (MemoryStream ms = new MemoryStream())
            {
                image.Save(filepath + fileName, System.Drawing.Imaging.ImageFormat.Bmp);
                ms.WriteTo(HttpContext.Current.Response.OutputStream);
            }
            //picEncode.Visible = true;
            //picEncode.ImageUrl = "~/QrCodes/" + fileName;
            return fileName;
        }
    }



}