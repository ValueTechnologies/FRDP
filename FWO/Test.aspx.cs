using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.SessionState;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
namespace FRDP
{
    public partial class Test : System.Web.UI.Page
    {
        MyClass Fn = new MyClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ret = SchoolDetailedAssessment("10037½80½505½8020½13½64½24/02/2016½Wednesday½10:21:47½10:41:50½Faisal Anwer½03221½address½landmark½03222½03223½contactname½03224½email½null½Trust½ownername½03225½principalname½provide brief back½espondent name½Principal½specify other position½1½10½1½12½Morning½09:00½12:30½13:00½18:30½360½365½Yes½Both½Private½other type of school½1½school info she½1990½1991½home½workshop½hospital½null,Urdu Speaking,Pathan,Bengali½other provide ethnic½2½3½kas1½kas2½kas3½null,Urdu Speaking,Pathan,Bengali½other ethnic ½Sindh Text Book Board½other school info½Yes½Yes½Yes½Yes½Yes½Yes½Yes½Yes½No½Yes½Owned½other info abt sch building½1½2½3½4½5½6½7½8½9½10½Yes½11½Yes½No½Yes½Yes, completely½Yes½01:30½Yes½Yes½Yes½Yes½Yes½1½1½2½2½3½3½Yes½Yes½8½Yes½Yes½0½Yes½Yes½Yes½Yes½Yes½Yes½Yes½Yes½Yes¡¡teach name 1½Principal (Headmaster)½35½Male½BA/BCOM etc.½2014½5½null,Nursery,Prep II,Class 2,Class 6½Yes½null½Urdu½½6,001 to 7,500¼teacher name2½Regular Teacher½21½Female½Class 12½2013½9½null,Nursery,Prep II,Class 2,Class 4,Class 6,Class 9,Class 10½Yes½null½Social Science½½Below 3,500¼½Principal (Headmaster)½½Male½Below Class 10½½½null½Yes½null½Urdu½½Below 3,500¼¡¡Yes½Yes½111½Yes½Yes½Yes½Well lit naturally½Yes½Yes½Well lit naturally¡¡Room½Nursery½58½25½5½25½24½4½½½½5½5½5½5½6½5½6½300 to 500½150 to 299½Present½Blackboard½4-Seater½20¼Room½KG II½5½7½2½10½2½5½5½7½2½½½½5½7½5½9½150 to 299½150 to 299½Present½Blackboard½Single Chair½20¼»»»");
        }

        public string SchoolDetailedAssessment(string input)
        {
            string ret = "1";
            using (DBDataContext db = new DBDataContext())
            {
                SchoolDetailedAssessmentWebService obj = new SchoolDetailedAssessmentWebService();
                obj.input = input;
                db.SchoolDetailedAssessmentWebServices.InsertOnSubmit(obj);
                db.SubmitChanges();
            }
            //string[] inp = new string[116];
            string[] i = input.Split(new[] { "»»»" }, StringSplitOptions.None);
            foreach (string item in i)
            {
                string[] ii = item.Split(new[] { "¡¡" }, StringSplitOptions.None);
                string[] inp = ii[0].Split('½');
                string[] inp1 = ii[2].Split('½');
                string tblAssesmentDetailedID = Fn.ExenID(@"INSERT INTO tblAssesmentDetailed
                         (TblUnionConcilID, tblSlumID, tblAssesmentRapidID, dtDate, dtStartTime, dtEndTime, Surveyor1, Surveyor1Contact, SchoolAddressLine1, NearestLandMark, PtclNumber, OtherContact, NameOfContact, CellPhone, 
                         email, GPS, SchoolOwnedBy, OwnersName, OwnersContactNo, PrincipalName, PrincipalBackground, RespondentsName, PositionRespondent, PositionRespondentOther, LowestClass, HighestClass, 
                         SchoolYearlyMonth, SchoolYealyEnd, ShiftOffered, dtStartTimeMorning, dtEndTimeMorning, dtStartTimeAfternoon, dtEndTimeAfternoon, QA10, QA11, IsTheSchoolRegistered, Sections, TypeOfSchool, 
                         TypeOfSchoolOther, LanguageCode, OtherLanguage, YearSchoolEstablished, YearSchoolRegistered, StudentArea1, StudentArea2, StudentArea3, UrduSpeeking, Other, Govt, Private, Slum1Near, Slum2Near, 
                         Slum3Near, EthnicUrdu, EthnicOther, PubOUP, PubOtherTxt, Attendance, AttendanceComputerized, TuitionFeeReceipt, TuitionFeeReceiptComputerized, TeachSalaries, TeacherSalariesComputerized, BankAccount,
                          AccountOnSchoolName, EFSPartned, ApplyRegistration, SchoolBuilding, SchoolBuildingOther, SizePlot1, SizePlot2, Floors1, Floors2, TotalRooms1, TotalRooms2, UnUsedRooms1Morning, 
                         UnUsedRooms2Morning, UnUsedRooms1Afternoon, UnUsedRooms2Afternoon, HallAvailable, HowMany, HallUsedClassRoom, Library, bookshelf, electricity, electricityAvailable, LoadShedding, generator, water, 
                         WaterDrinkable, Pitcher, BoundaryWall, TeachersToilets, TeachersToiletsFunctional, MaleStudentToilets, MaleStudentToiletsFunctional, FemaleStudentToilets, FemaleStudentToiletsFunctional, Playground, 
                         ComputerLab, NuberOfComputer, isBeingUsed, Transportation, NumberOfVans, ClassroomClean, CommonAreasClean, EatingAreaClean, CleanUniforms, NailsHairCut, DustbinAccessible, GarbageDeposit, Enroll, 
                         EnrollOlder,EnterByEmpID,dtEnterDateTime,QE13,QE14,QE15,QF2,QF1a_Class1,QF1b_Class1,QF1c_Class1,QF1a_Class3,QF1b_Class3,QF1c_Class3)
VALUES        ('" + inp[3] + @"','" + inp[4] + @"','" + inp[5] + @"','" + inp[6] + @"','" + inp[8] + @"','" + inp[9] + @"','" + inp[10] + @"','" + inp[11] + @"','" + inp[12] + @"','" + inp[13] + @"','" + inp[14] + @"','" + inp[15] + @"','" + inp[16] + @"','" + inp[17] + @"','" + inp[18] + @"','" + inp[19] + @"','" + inp[20] + @"','" + inp[21] + @"','" + inp[22] + @"','" + inp[23] + @"','" + inp[24] + @"','" + inp[25] + @"','" + inp[26] + @"','" + inp[27] + @"','" + inp[28] + @"','" + inp[29] + @"','" + inp[30] + @"','" + inp[31] + @"','" + inp[32] + @"','" + inp[33] + @"','" + inp[34] + @"','" + inp[35] + @"','" + inp[36] + @"','" + inp[37] + @"','" + inp[38] + @"','" + inp[39] + @"','" + inp[40] + @"','" + inp[41] + @"','" + inp[42] + @"','" + inp[43] + @"','" + inp[44] + @"','" + inp[45] + @"','" + inp[46] + @"','" + inp[47] + @"','" + inp[48] + @"','" + inp[49] + @"','" + inp[50] + @"','" + inp[51] + @"','" + inp[52] + @"','" + inp[53] + @"','" + inp[54] + @"','" + inp[55] + @"','" + inp[56] + @"','" + inp[57] + @"','" + inp[58] + @"','" + inp[59] + @"','" + inp[60] + @"','" + inp[61] + @"','" + inp[62] + @"','" + inp[63] + @"','" + inp[64] + @"','" + inp[65] + @"','" + inp[66] + @"','" + inp[67] + @"','" + inp[68] + @"','" + inp[69] + @"','" + inp[70] + @"','" + inp[71] + @"','" + inp[72] + @"','" + inp[73] + @"','" + inp[74] + @"','" + inp[75] + @"','" + inp[76] + @"','" + inp[77] + @"','" + inp[78] + @"','" + inp[79] + @"','" + inp[80] + @"','" + inp[81] + @"','" + inp[82] + @"','" + inp[83] + @"','" + inp[84] + @"','" + inp[85] + @"','" + inp[86] + @"','" + inp[87] + @"','" + inp[88] + @"','" + inp[89] + @"','" + inp[90] + @"','" + inp[91] + @"','" + inp[92] + @"','" + inp[93] + @"','" + inp[94] + @"','" + inp[95] + @"','" + inp[96] + @"','" + inp[97] + @"','" + inp[98] + @"','" + inp[99] + @"','" + inp[100] + @"','" + inp[101] + @"','" + inp[102] + @"','" + inp[103] + @"','" + inp[104] + @"','" + inp[105] + @"','" + inp[106] + @"','" + inp[107] + @"','" + inp[108] + @"','" + inp[109] + @"','" + inp[110] + @"','" + inp[111] + @"','" + inp[112] + @"','" + inp[113] + @"','" + inp[114] + @"','" + inp[115] + @"','" + inp[116] + @"','" + inp[0] + @"',GETDATE() , '"+inp1[0]+"' , '"+inp1[1]+"' , '"+inp1[2]+"' , '"+inp1[3]+"' , '"+inp1[4]+"' , '"+inp1[5]+"' , '"+inp1[6]+"' , '"+inp1[7]+"' , '"+inp1[8]+"' , '"+inp1[9]+"') ; select SCOPE_IDENTITY()  ");

                foreach (string tchr in ii[1].Split('¼'))
                {
                    string[] t = tchr.Split('½');
                    if (t.Length==13)
                    {
                        Fn.Exec(@"INSERT INTO tblAssesmentDetailedTeacherInfo
                         (tblAssesmentDetailedID, E1_Name, E2_Type, E3_Age, E4_Gender, E5_Education, E6_YearAppointed, E7_Experience, E8_GradeTaught, E9_Is_Present, E10_If_No_Why, E11_Subject_Taught, E12_SalaryRange)
VALUES        ('"+tblAssesmentDetailedID+"','"+t[0]+"','"+t[1]+"','"+t[2]+"','"+t[3]+"','"+t[4]+"','"+t[5]+"','"+t[6]+"','"+t[7]+"','"+t[8]+"','"+t[9]+"','"+t[10]+"','"+t[12]+"')");
                    }

                }


                foreach (string tchr in ii[3].Split('¼'))
                {
                    string[] t = tchr.Split('½');
                    if (t.Length > 0)
                    {
                        Fn.Exec(@"INSERT INTO tblAssesmentDetailedClassInfo
                         (tblAssesmentDetailedID, Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15, Col16, Col18, Col19, Col21, Col22, Col23, Col24, Col25, Col26, Col27)
                          VALUES        ('" + tblAssesmentDetailedID + "', '"+t[0]+"', '"+t[1]+"', '"+t[2]+"', '"+t[3]+"', '"+t[4]+"', '"+t[5]+"', '"+t[6]+"', '"+t[7]+"', '"+t[8]+"', '"+t[9]+"', '"+t[10]+"', '"+t[11]+"', '"+t[12]+"', '"+t[13]+"', '"+t[14]+"', '"+t[15]+"', '"+t[16]+"', '"+t[17]+"', '"+t[18]+"', '"+t[19]+"', '"+t[20]+"', '"+t[21]+"', '"+t[22]+"', '"+t[23]+"', '"+t[24]+"')");
                    }

                }
            }






            return ret;
        }
        public string OOSC_Family(string generalInfo)
        {
            string rt = "1";
            using (DBDataContext db = new DBDataContext())
            {
                tblOOSC_Temp obj = new tblOOSC_Temp();
                //obj.below5above10Info = below5above10Info;
                //obj.fatherInfo = fatherInfo;
                obj.generalInfo = generalInfo;
                //obj.motherInfo = motherInfo;
                //obj.notstudying = notstudying;
                //obj.studying = studying;
                db.tblOOSC_Temps.InsertOnSubmit(obj);
                db.SubmitChanges();
            }

            string[] tokens = generalInfo.Split(new[] { "ííí" }, StringSplitOptions.None);
            foreach (var item in tokens)
            {
                if (item != "")
                {
                    //GET 6 STRING here OF EACH ITEM BY »»»
                    string[] str6 = item.Split(new[] { "»»»" }, StringSplitOptions.None);

                    string[] strFamilyInfo = str6[1].Split('½');
                    string str24frmID = "";

                    try
                    {
                        str24frmID = Fn.ExenID(@"INSERT INTO tblOOSC_Form
                         (Date, SurveyorName, RespondentName, FamilyHeadName, RespondentRetlation, FamilyHeadMaritalStatus, FamilyHeadMotherToung,FamilyHeadMotherToungOther, FamilyHeadReligion, IfOtherReligion, MonthlyIncome, ResidentialStatus,  HouseNo, Street, TblUnionConcilID, tblSlumID, SlumDivision, LandMark, ContactName1, ContactNumber1, ContactName2, ContactNumber2)
                        VALUES        ('" + strFamilyInfo[0] + "','" + strFamilyInfo[1] + "','" + strFamilyInfo[2] + "','" + strFamilyInfo[3] + "','" + strFamilyInfo[4] + "','" + strFamilyInfo[5] + "','" + strFamilyInfo[6] + "','" + strFamilyInfo[7] + "','" + strFamilyInfo[8] + "','" + strFamilyInfo[9] + "','" + strFamilyInfo[10] + "','" + strFamilyInfo[11] + "','" + strFamilyInfo[12] + "','" + strFamilyInfo[13] + "','" + strFamilyInfo[16] + "','" + strFamilyInfo[17] + "','" + strFamilyInfo[18] + "','" + strFamilyInfo[19] + "','" + strFamilyInfo[20] + "','" + strFamilyInfo[21] + "','" + strFamilyInfo[22] + "','" + strFamilyInfo[23] + "') ;select SCOPE_IDENTITY() ");

                    }
                    catch (Exception)
                    {
                        rt = "-1";
                    }


                    try
                    {
                        Fn.Exec(@"INSERT INTO tblOOSC_Form_School (tblOOSC_FormID, tblAssesmentRapidID) VALUES (" + str24frmID + @",'" + strFamilyInfo[28] + "')");
                    }
                    catch (Exception)
                    {
                        rt = "-1";
                    }


                    string[] FatherInfo = str6[2].Split('½');
                    try
                    {
                        Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, CNIC_BISP, AGE, Gender, ReceivedEducation, EducationInstitute, HighestClass, ReadNewsPaper, WriteName, AddSubtract, Occupation,tblOOSC_FormID)
                        VALUES('Father','" + FatherInfo[1] + "','" + FatherInfo[2] + "','" + FatherInfo[3] + "','" + FatherInfo[4] + "','" + FatherInfo[5] + "','" + FatherInfo[6] + "','" + FatherInfo[7] + "','" + FatherInfo[8] + "','" + FatherInfo[9] + "','" + FatherInfo[10] + "','" + FatherInfo[11] + "','" + str24frmID + "')");

                    }
                    catch (Exception)
                    {
                        rt = "-1";
                    }
                    string[] MotherInfo = str6[3].Split('½');
                    try
                    {
                        Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, CNIC_BISP, AGE, Gender, ReceivedEducation, EducationInstitute, HighestClass, ReadNewsPaper, WriteName, AddSubtract, Occupation,tblOOSC_FormID)
                        VALUES('Mother','" + MotherInfo[1] + "','" + MotherInfo[2] + "','" + MotherInfo[3] + "','" + MotherInfo[4] + "','" + MotherInfo[5] + "','" + MotherInfo[6] + "','" + MotherInfo[7] + "','" + MotherInfo[8] + "','" + MotherInfo[9] + "','" + MotherInfo[10] + "','" + MotherInfo[11] + "','" + str24frmID + "')");


                    }
                    catch (Exception)
                    {
                        rt = "-1";
                    }
                    string[] OffspringInfo = str6[4].Split('¼');
                    foreach (var os in OffspringInfo)
                    {
                        string[] strData = os.Split('½');
                        try
                        {
                            Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, CNIC_BISP, AGE, Gender, ReceivedEducation, EducationInstitute, HighestClass, ReadNewsPaper, WriteName, AddSubtract, Occupation,tblOOSC_FormID)
                        VALUES('Offspring','" + strData[0] + "','" + strData[1] + "','" + strData[2] + "','" + strData[3] + "','" + strData[4] + "','" + strData[5] + "','" + strData[6] + "','" + strData[7] + "','" + strData[8] + "','" + strData[9] + "','" + strData[10] + "', '" + str24frmID + "')");

                        }
                        catch (Exception)
                        {
                            rt = "-1";
                        }
                    }



                    string[] OffspringInfo1 = str6[5].Split('¼');
                    foreach (var os in OffspringInfo1)
                    {
                        string[] strData = os.Split('½');
                        try
                        {
                            Fn.Exec(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name,DOB,  Gender, CurrentlyStudingSchoolName, CurrentlyStudingChildClass, CurrentlyStudingChildSchoolingYear, CurrentlyStudingChildEmployed, CurrentlyStudingChildWork, CurrentlyStudingChildWorkHours, 
                         CurrentlyStudingChildDisability,tblOOSC_FormID, EducationStatus)
                        VALUES('Offspring','" + strData[0] + "','" + strData[1] + "','" + strData[2] + "','" + strData[3] + "','" + strData[4] + "','" + strData[5] + "','" + strData[6] + "','" + strData[7] + "','" + strData[8] + "','" + strData[9] + "','" + str24frmID + "','Currently Studying')");

                        }
                        catch (Exception)
                        {
                            rt = "-1";
                        }
                    }


                    string[] OffspringInfo2 = str6[6].Split('¼');
                    foreach (var os in OffspringInfo2)
                    {
                        if (os != "")
                        {
                            string[] strData = os.Split('½');
                            try
                            {
                                string thisOOSC = Fn.ExenID(@"INSERT INTO tblOOSC_Form_Family
                         (MemberType, Name, DOB, Gender, OOSC_Disability, OOSC_BeenToSchool, OOSC_WhenLeavSchool, OOSC_WhyLeaveSchool, OOSC_SchoolName, OOSC_ClassWhenLeftSchool, OOSC_TotalSchoolingYear, OOSC_CanReadStory, 
                         OOSC_CanWriteLetter, OOSC_CanChildAddSubtract, OOSC_IsChilEmployeed, OOSC_ChildWork, OOSC_ChildWorkHours,tblOOSC_FormID, EducationStatus)
                        VALUES('Offspring','" + strData[0] + "','" + strData[1] + "','" + strData[2] + "','" + strData[3] + "','" + strData[4] + "','" + strData[5] + "','" + strData[6] + "','" + strData[7] + "','" + strData[8] + "','" + strData[9] + "','" + strData[10] + "','" + strData[11] + "','" + strData[12] + "','" + strData[13] + "','" + strData[14] + "','" + strData[15] + "','" + str24frmID + "','Out of School');  ;select SCOPE_IDENTITY() ");
                                string gt = strData[16];
                                // string sss = "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAoHBwgHBgoICAgLCgoLDhgQDg0NDh0VFhEYIx8lJCIfIiEmKzcvJik0KSEiMEExNDk7Pj4+JS5ESUM8SDc9Pjv/2wBDAQoLCw4NDhwQEBw7KCIoOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozv/wAARCADIAJYDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDx+iikqRB2ooooAKKKKACiiigAopKWgAooooAKKSloAKKKKAClpKKAFopKKAFpKWkoEFFFFAwooooASiiloASiiigBaSiigApaSigApaSloAKM0UUAFFFFAErQSjqh/KmbWHUGu6a2Rh8yA/hUL6dbP1iX8qzUzT2ZxNFde+jWrf8ALPH0qtJ4fgYfKSKfOhcjOZorefw4f4JfzqB/D1wv3WBp8yFyMyKK0G0W8T+DP0qu9hdJ96Fvyp3QrMr0lSGGReqEfhTCCOopiEooooAKKKKACiiigApaSloAKKKKAPSsDFJsU9qfjikNYHUR+WvpSGFfU1JiikOxD5PvSeSfap6MUgsV/JPpSGH1WrIpaVh2KLWsT5DRg/UVXfSrR+sK/hWrgelGxT2ouxcqMN9BtGBwpH0qtJ4biP3XI/Cuk8paTyR6/pT5mLkRyj+GpP4JBVeTw/dJ0w30rsvJPqKTyj6U1UkL2aOFfSbxOsR/KojZXK9Ym/Ku9MR/u0ghBzlaaqsXskcAbeVesbflTCjDqCPwr0E2yHrGD+FMbT4H6wKfwp+1F7E4DFFd0mj2RmYNAmNvcUU/aIn2TNUrxTDT3ubU4CzxknoNwppFDTRommMopaKgoSilopDEFFLiikMUUUd6WgAFJS0UhiUtFFABilAFJ2p6jNAxAKXHNPxRjjPekMpSyiOU5zyP7uaKsvGCeRRRcVjQ8eeBIPD2kRXkF08zNLsIKAY4J/pWJpkjTWEbOckcZr1L4oQCbwnnGSk6n9CK8t0gYsiv91zXoVNYJnDTdptFkim4qQimGuQ6kJiijtRUlC0UUCkMWgUDpS0gEpKdSGgBKM0UooAOlMa7iicRsSW9AM0STBAaoxHdK8h6k00hOVjRN3Hjo2fpQLqP1P5VTz+dJmnyk87J5r+OPGFd/ZVoqpNcR26hpDjJxRRyoOaT2PZ/H0Xm+Ebr/ZKt+teR6UMQyr6PXs/i2PzfC1+v/TPP5EGvGtLGGnX3BrvetM44/wAQnYUw1K461Ga42dqG9qKWkqGUFLSUopAAFKKKWkAlJTqbzigdhKjeTbwKc7bRVZ26mhEtkU8hxjNRwNhT9TUcr5Y+1R/M1sQBkmrRkXg2e9Lms23ZxMFZJMH3yBRd3EqRuvl4B4DUwsQanP8AaJQqH5U7+tFUlfHBopammh9P65H5uhXyesD/AMq8SsBi6nX2/rXut6nmWNwn96Jh+hrwy2G3U5V9j/Ou9fw2cP8Ay8RO45qI1O4qEjrXEzuQyilOKTNQUFFNLqOrAfjTDcRL1kX86kCYUZqv9shzwxP0FRvqMCnG4D6kCgC5nimM2BUUMsty22CMOcZ4NTrFOiP9ptZM/wAOxS38s0LUGys7E5qtO4VTkj8TVOVr2K9Z5POEGeFMLg/+g0G5s3kUy7tuDkMrdfyq+UyuMaQDqf1qNNaktgYvJjZR7YNLcz6WrjY4wVPY8Gsa8lCplerdK0hHuZzlbY2Dr0ZB3W5/DFQTagt3HtVSuOTWEJ2781YiuwikbeT3zTcV0JjJ31LJIWioDMGOTmipsXzI+t2G5CPUYrwaZjBrUgx0LDFe914J4hQw6/doByJXH6muyHwtHNLSSY6S4cdFA+tV2uJPUD8KofamhBykh+vP9agkvpm+7Hj/AHiB/jXLKJ1RmX2lkP8Ay0P54qNmz1c/ia5q8u5TdMJSWUdFDkCreisZ4XTcSVOQDzgVDhZXGp3djWLRjksKaZkHSkFuB1OKXyol6tWehpcja5CqTtzioIWh1B9qhS/91mwankjiZTtJB9qzDYskolgcq4OQaaSE2zsPD1jJbySu6bBgAAGtphjua5vTdea2g8u7hIJ6unStJdYhlTKgsD3Ug1VhF6RWKnJ61UlSTBAj3fhTW1MEcRMR9aUalFnJWRf+A09QMi+t4ZI2M1rGAvJO3FcLeSrNcuyKFTOFA7Cus8W66PIFhbs37wZkJGOPSuMrSK0MJtXCl4+lKqZ5PApzJgZFUQAcqOaKaDiikI+xa8L8W7U8YXi9vtDfzrdvfiVq7qRCYYfdEz/PNcNf6jNf6ibq4cySyPuZsYya6lFxTuZuSk1YuSLCOTj8arSGIghRRIxPRMe5NRBGbkuAPYVxM7EZF7poklaQMR+FVLS5ksbnYPuk4IPGa1ry6htWMciSs3XDfKKzxFNqEyskIjjHUjjNNPTUlpX0NoOrDK7m+gowx6Jj6mlUBEALZwKaXHOATWJsG3jBcD8KTy1A+8x/QU3cQey0wtzxzQBLiMdAD+tRP8uSjGNvUHFJu684/GmGRenJ+go2AVb29VSpk3AdDTje3brtabA9FGP1qu0o9qqz3gXgEsfTtVq7J0Rn3ztLdyEkk5xyc1EqY5PWpCQWJ9eTSVqjmYlFFFADCMGilYZ5opgdm8FxIMeWR7nimR2LLKGcjjsK1rq90u1dleWR2HUKMfzqlca1aW8u1bEvnkF3PIreTZnFJC+WueTTJUyFZHdGVgyspwQR3rRMUV5aJcW2IweozkCqerRjSZQksUsg4JdSAuD6VzSi7nVGSsUrmEXF01zdSvczN1klYsT+dKozwiE/QZrZht4po1lttOwpwQ05xuH410Iv9PtIgnm26AfwxqM/pWdu5dzhJBJHw6lP97ioTIPXJ9q6bX9X067snhRWkl/gZgBj6VybKf4nA+lTYdx5kHsPc1E027uT9KQmMdAW+tNMuPQCmAHe3QYHvTXwoy8nAqrNe4JVOT6mqbySS53MTVKLZm5pE893uysY2r69zVXdmjbjvSVolYxbbFzSUGgelAAKWk+tLQAlFLnFFAjqNQDyJDMAuXXa3HQiqdx+8tFfOXiO1iD27VbAW4sJokUvsIkBcc+/WqlsQ0hicbElXbxzz2roZmjX8K367mspfusOKk1vVLqxuRA8QcIP3bnHT64rmreWSzvVkXOYm5x6V2WpxJq+jpdRgM8YzWTV1Y1izmZdZv7jOCB+v86rPJdy/wCtnYD03f4VYWCRgc8U5bZByxzWFzZIrRgDqzNUoV2+6u0VLKY4IN4wD6EdvWh722NsiRcsepxg1Fxpq9iExE/eaq0zLuMaZJH3j6U6eZlQ469qo7mwVXnJ5PrWkY9WROXRCMqAn5qYWHQZAp3lNg5/WmkAZ5rQyQ3K9zRketN603aRSAlxxSYqMMRTg470AOopc56UGgBKKWigLo6O2uMXaLLhUYbGC981RuN8Nw6Bv9W3AY0UVtJmcSS5sri7dJreBmEq5OOADXSaGJ9PsGiuSDkYCA5ooqVvc0Mu/UwTZA+V+RVeIGZ+T8o5JoornmrM2u7FO9cXEjYYgL0SmRRH77HrRRSREe4jx7xluF/nUEkiRjCAUUVvsZLVlZpGbOTTTz3ooqSgGKXFFFADGUYpmMUUUAOVqkNFFAAKKKKQj//Z";
                                //byte[] image_byte = System.Convert.FromBase64String(strData[16]);

                                //if (sss==gt)
                                //{
                                byte[] image_byte = System.Convert.FromBase64String(gt);
                                System.Drawing.Image convertedImage = byteArrayToImage(image_byte);
                                try
                                {
                                    string path = Server.MapPath("~/Uploads/OOSC_Photos/");
                                    convertedImage.Save(path + thisOOSC + ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);

                                    //if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                                    //{
                                    Bitmap ThumbnailA = CreateThumbnail(path + Convert.ToString(thisOOSC) + ".jpg", 32, 32);
                                        string SaveAsThumbnailA = System.IO.Path.Combine(Server.MapPath("~") + "/Uploads/OOSC_Photos/",  "A" + Convert.ToString(thisOOSC) +".jpg");
                                        ThumbnailA.Save(SaveAsThumbnailA);
                                    //}

                                    //if (fi.Extension.ToUpper() == ".JPEG" || fi.Extension.ToUpper() == ".JPG" || fi.Extension.ToUpper() == ".BMP" || fi.Extension.ToUpper() == ".PNG" || fi.Extension.ToUpper() == ".GIF")
                                    //{
                                        Bitmap ThumbnailB = CreateThumbnail(path + Convert.ToString(thisOOSC) + ".jpg", 75, 75);
                                        string SaveAsThumbnailB = System.IO.Path.Combine(Server.MapPath("~") + "/Uploads/OOSC_Photos/", "B" +Convert.ToString(thisOOSC) +  ".jpg");
                                        ThumbnailB.Save(SaveAsThumbnailB);
                                    //}
                                }
                                catch (Exception e)
                                {
                                    return e.Message;
                                }
                                //}



                            }
                            catch (Exception)
                            {
                                rt = "-1";
                            }
                        }
                    }
                }
            }
            return rt;
        } //end of method
        public Bitmap CreateThumbnail(string ImagePath, int ThumbnailWidth, int ThumbnailHeight)
        {
            System.Drawing.Bitmap Thumbnail = null;
            try
            {
                Bitmap ImageBMP = new Bitmap(ImagePath);
                ImageFormat loFormat = ImageBMP.RawFormat;

                decimal lengthRatio;
                int ThumbnailNewWidth = 0;
                int ThumbnailNewHeight = 0;
                decimal ThumbnailRatioWidth;
                decimal ThumbnailRatioHeight;

                // If the uploaded image is smaller than a thumbnail size the just return it
                if (ImageBMP.Width <= ThumbnailWidth && ImageBMP.Height <= ThumbnailHeight)
                    return ImageBMP;

                // Compute best ratio to scale entire image based on larger dimension.
                if (ImageBMP.Width > ImageBMP.Height)
                {
                    ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                    ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                    lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                    ThumbnailNewWidth = ThumbnailWidth;
                    decimal lengthTemp = ImageBMP.Height * lengthRatio;
                    ThumbnailNewHeight = (int)lengthTemp;
                }
                else
                {
                    ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                    ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                    lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                    ThumbnailNewHeight = ThumbnailHeight;
                    decimal lengthTemp = ImageBMP.Width * lengthRatio;
                    ThumbnailNewWidth = (int)lengthTemp;
                }
                Thumbnail = new Bitmap(ThumbnailNewWidth, ThumbnailNewHeight);
                Graphics g = Graphics.FromImage(Thumbnail);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.FillRectangle(Brushes.White, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);
                g.DrawImage(ImageBMP, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);

                ImageBMP.Dispose();
            }
            catch
            {
                return null;
            }

            return Thumbnail;
        }
        public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {

            //try
            //{
            //    MemoryStream ms = new MemoryStream(byteArrayIn);
            //    Image returnImage = Image.FromStream(ms);
            //    return returnImage;
            //}
            //catch (Exception ex)
            //{

            //    string str = ex.Message;
            //    return null;
            //}

            Stream tempstream;
            System.Drawing.Image tempimage = null;
            try
            {
                tempstream = new MemoryStream(byteArrayIn);
                tempimage = System.Drawing.Image.FromStream(tempstream);
            }
            catch (Exception ex)
            {
                string s1 = "Errormessage 100: \n " + ex.Message;
                string s2 = "Errorsource 100: \n " + ex.Source;
                string s3 = "Errorstacktrace 100: \n " + ex.StackTrace;
                string s4 = "Errortargetsite 100: \n " + ex.TargetSite;


            }
            return tempimage;
        }

    }
}