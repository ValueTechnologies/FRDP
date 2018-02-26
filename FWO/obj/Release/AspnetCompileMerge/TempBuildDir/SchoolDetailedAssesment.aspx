<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="SchoolDetailedAssesment.aspx.cs" Inherits="FRDP.SchoolDetailedAssesment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .noPad .table {
            margin-left: 0px;
            padding-bottom: 0px;
            margin-top: 0px;
            margin-bottom: 0px;
            border-bottom-width: 0px;
            border-top-width: 0px;
            border-left-width: 0px;
            border-right-width: 0px;
        }

        .table thead th, .table tbody td {
            text-align: left;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Detailed Assessment Questionnaire</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <table class="responsive table table-striped table-bordered table-condensed">
                        <tbody>
                            <tr>


                                <td style="width: 100px;">Date</td>
                                <td>
                                    <input id="txtDate" type="text" class="frm" style="width: 90%;" value="" />
                                </td>
                                <td style="width: 100px;"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Start Time</td>
                                <td>
                                    <input id="txtStartTime" class="frm" type="text" style="width: 90%;" /></td>
                                <td>End Time</td>
                                <td>
                                    <input id="txtEndTime" class="frm" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>Surveyor 1 Name</td>
                                <td>
                                    <input id="txtSurveyor1" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Surveyor 2 Name</td>
                                <td>
                                    <input id="txtSurveyor2" class="frm clr" type="text" style="width: 90%;" /></td>

                            </tr>
                            <tr>
                                <td>Surveyor 1 Contact</td>
                                <td>
                                    <input id="txtSurveyor1Contact" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Surveyor 2 Contact</td>
                                <td>
                                    <input id="txtSurveyor2Contact" class="frm clr" type="text" style="width: 90%;" /></td>

                            </tr>


                        </tbody>
                    </table>

                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>A. School Information</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <table class="responsive table table-striped table-bordered table-condensed">
                        <tbody>

                            <tr>
                                <td style="width: 100px;">Country</td>
                                <td>
                                    <select id="ddlGeoCountry" name="D1" style="width: 93.5%;">
                                        <option value="1">Pakistan</option>
                                    </select></td>
                                <td style="width: 100px;">Province</td>
                                <td style="width: 40%;">
                                    <select id="ddlGeoProvince" name="D42" style="width: 93.5%;">
                                        <option value="2">SINDH</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>District</td>
                                <td>
                                    <select id="ddlGeoRegion" name="D3" style="width: 93.5%; display: none;">
                                    </select>
                                    <select id="ddlGeoDestrict" name="D4" style="width: 93.5%;">
                                                                                <option value="51">KARACHI EAST</option>
                                        <option value="71">KARACHI MALIR</option>
                                        <option value="80">KARACHI SOUTH</option>
                                        <option value="97">KARACHI WEST</option>
                                    </select>
                                </td>

                                <td>Tehsil/Town/Taluka</td>
                                <td>
                                    <select id="ddlGeoTehsil" name="D5" style="width: 93.5%;"></select>
                                </td>
                            </tr>
                            <tr>

                                <td>Union Concil</td>
                                <td>
                                    <select id="ddlGeoFeildUnit" name="D6" style="width: 93.5%; display: none;"></select>
                                    <select id="ddlGeoUnionConcil" class="frm" name="D7" style="width: 93.5%;"></select>
                                </td>
                                <td>Slum Name</td>
                                <td>
                                    <select id="ddSlum" class="frm" style="width: 93.5%;">
                                    </select>
                                </td>

                            </tr>

                            <tr>
                                <td>School</td>
                                <td>
                                    <select id="ddlSchool" name="D6" style="width: 93.5%;" class="frm"></select></td>
                                <td>Nearest Landmark</td>
                                <td>
                                    <input id="txtSchoolLandMark" class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>School Address Line 1</td>
                                <td>
                                    <input id="txtSchoolAddressLine1" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>School Address Line 2</td>
                                <td>
                                    <input id="txtSchoolAddressLine2" class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>



                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span><b>S13 </b>School's Contacts</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <table class="responsive table table-striped table-bordered table-condensed">
                        <tbody>

                            <tr>
                                <td style="width: 100px;">PTCL Number</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" />
                                </td>
                                <td style="width: 100px;">Name Of The Contact</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>

                            <tr>
                                <td style="width: 100px;">Cell Phone</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" />
                                </td>
                                <td style="width: 100px;">Email</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">GPS Coordinates</td>
                                <td style="width: 40%;">
                                    <input id="txtgps1" class="frm clr" type="text" style="width: 42.9%;" />
                                    <input id="txtgps2" class="clr" type="text" style="width: 42.9%;" />
                                </td>
                                <td style="width: 100px;"></td>
                                <td style="width: 40%;"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>S14. School Ownership Information</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <table class="responsive table table-striped table-bordered table-condensed">
                        <tbody>

                            <tr>
                                <td style="width: 100px;">School Owned By</td>
                                <td style="width: 40%;">
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Trust</option>
                                        <option>Individual</option>
                                        <option>Organization</option>
                                    </select>
                                </td>
                                <td style="width: 100px;">Owner's Name</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>

                            <tr>
                                <td style="width: 100px;">Owner's Contact Number</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" />
                                </td>
                                <td style="width: 100px;">Email</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>

                        </tbody>
                    </table>

                </div>

            </div>

        </div>
    </div>


    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>S15 Information about the principal</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <table class="responsive table table-striped table-bordered table-condensed">
                        <tbody>

                            <tr>
                                <td style="width: 100px;">Principal Name</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 39.5%;" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">Provide Brief Background of Principal</td>
                                <td>
                                    <textarea id="TextArea1" cols="20" rows="3" style="width: 95.5%;" class="frm clr"></textarea>
                                </td>
                            </tr>


                        </tbody>
                    </table>

                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>S16. Information about the Respondent</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <table class="responsive table table-striped table-bordered table-condensed">
                        <tbody>

                            <tr>
                                <td style="width: 100px;">Respondents Name</td>
                                <td style="width: 40%;">
                                    <input class="frm clr" type="text" style="width: 90%;" />

                                </td>
                                <td style="width: 100px;">Position of the Respondent</td>
                                <td style="width: 40%;">
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Principal</option>
                                        <option>Manager</option>
                                        <option>Senior Teacher</option>
                                        <option>Other</option>
                                    </select></td>
                            </tr>


                        </tbody>
                    </table>

                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Academic Information Required</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <table class="responsive table table-striped table-bordered table-condensed">
                        <tbody>
                            <tr>
                                <td colspan="4">Code for A1 and A2
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 100px;">Lowest Class</td>
                                <td style="width: 40%;">
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>0. Kachi-Paki/ECE/Nursery/KG/Prep</option>
                                        <option>1. Class 1</option>
                                        <option>2. Class 2</option>
                                        <option>3. Class 3</option>
                                        <option>4. Class 4</option>
                                        <option>5. Class 5</option>
                                        <option>6. Class 6</option>
                                        <option>7. Class 7</option>
                                        <option>8. Class 8</option>
                                        <option>9. Class 9</option>
                                        <option>10. Class 10</option>
                                    </select>

                                </td>
                                <td style="width: 100px;">Highest Class</td>
                                <td style="width: 40%;">
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>0. Kachi-Paki/ECE/Nursery/KG/Prep</option>
                                        <option>1. Class 1</option>
                                        <option>2. Class 2</option>
                                        <option>3. Class 3</option>
                                        <option>4. Class 4</option>
                                        <option>5. Class 5</option>
                                        <option>6. Class 6</option>
                                        <option>7. Class 7</option>
                                        <option>8. Class 8</option>
                                        <option>9. Class 9</option>
                                        <option>10. Class 10</option>
                                    </select>

                                </td>
                            </tr>
                            <tr>
                                <td>School Year Begins</td>
                                <td>
                                    <input class="frm clr" placeholder="MM" type="text" style="width: 90%;" /></td>
                                <td>School Year Ends</td>
                                <td>
                                    <input class="frm clr" placeholder="MM" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>Shift Offered in the School</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Morning Only</option>
                                        <option>Afternoon Only</option>
                                        <option>Both Morning and Afternoon</option>
                                    </select></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Start Time (Morning Shift)</td>
                                <td>
                                    <input id="STM" class="frm" type="text" style="width: 90%;" /></td>
                                <td>End Time (Morning Shift)</td>
                                <td>
                                    <input id="ETM" class="frm" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>Start Time (Afternoon Shift)</td>
                                <td>
                                    <input id="STA" class="frm" type="text" style="width: 90%;" /></td>
                                <td>End Time (Afternoon Shift)</td>
                                <td>
                                    <input id="ETA" class="frm" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="3">In the last school year, report how many days was the school open? </td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="3">In the last school year, report how many days was the school should have been open? </td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>

                            <tr>
                                <td>Is the school registered?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                        <option>Expired</option>
                                        <option>Applied</option>
                                    </select></td>
                                <td>Sections Registration Type</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Boys</option>
                                        <option>Girls</option>
                                        <option>Both</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Type of School</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Private</option>
                                        <option>Trust/Aided</option>
                                        <option>Foundation Affiliated</option>
                                        <option>Other</option>
                                    </select></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">What is the main language used for communication between teachers and students?
                                </td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">Code for A15 : 1. Urdu. 2. Sindhi. 3. Punjabi. 4.Baluchi. 5.Pashto. 6.English. 7.Other(Name it)</td>
                            </tr>
                            <tr>
                                <td>Language Code:</td>
                                <td>
                                    <select id="ddlol" name="D1" style="width: 93.5%;" class="frm">
                                        <option>Urdu</option>
                                        <option>Sindhi</option>
                                        <option>Punjabi</option>
                                        <option>Baluchi</option>
                                        <option>Pashto</option>
                                        <option>English</option>
                                        <option>Other(Name it)</option>
                                    </select></td>
                                <td>Other Language</td>
                                <td><input id="txtol2" class="frm clr" type="text" style="width: 90%;" disabled="disabled" /></td>
                            </tr>
                            <tr>
                                <td>Year School Established</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Year School Registered</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">Where do you get most of your students from (Name Areas)</td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">1</td>
                                <td colspan="3">
                                    <input class="frm clr" type="text" style="width: 95.5%;" /></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">2</td>
                                <td colspan="3">
                                    <input class="frm clr" type="text" style="width: 95.5%;" /></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">3</td>
                                <td colspan="3">
                                    <input class="frm clr" type="text" style="width: 95.5%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">Predominant ethnic community of the children enrolled in the school (you may choose more than one if required)</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Urdu Speaking" class="chk frm" />Urdu Speaking</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Afghani" class="chk frm" />Afghani
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Punjabi/Siraiki" class="chk frm" />Punjabi/Siraiki</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Bengali" class="chk frm" />Bengali
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Pathan" class="chk frm" />Pathan</td>
                                <td></td>
                                <td style="text-align: left;">

                                    <input type="checkbox" value="Burmi" class="chk frm" />Burmi
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="checkbox" value="Baluchi" class="chk frm" />Baluchi</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Other" class="chk frm" />Other
                                    <input class="frm clr" type="text" style="width: 77%;" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Other" class="chk frm" />Other
                                    <input class="frm clr" type="text" style="width: 77%;" /></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">Number of schools in 500 meters</td>
                            </tr>
                            <tr>
                                <td>Government</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Private</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">Names of katchi abaadis/Slums located nearby 
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">1</td>
                                <td colspan="3">
                                    <input class="frm clr" type="text" style="width: 95.5%;" /></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">2</td>
                                <td colspan="3">
                                    <input class="frm clr" type="text" style="width: 95.5%;" /></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">3</td>
                                <td colspan="3">
                                    <input class="frm clr" type="text" style="width: 95.5%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">Ethnic communities residing within 1 km</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Urdu Speaking" class="chk frm" />Urdu Speaking</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Afghani" class="chk frm" />Afghani
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Punjabi/Siraiki" class="chk frm" />Punjabi/Siraiki</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Bengali" class="chk frm" />Bengali
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Pathan" class="chk frm" />Pathan</td>
                                <td></td>
                                <td style="text-align: left;">

                                    <input type="checkbox" value="Burmi" class="chk frm" />Burmi
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Baluchi" class="chk frm" />Baluchi</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Other" class="chk frm" />Other
                                    <input class="frm clr" type="text" style="width: 77%;" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Other" class="chk frm" />Other
                                    <input class="frm clr" type="text" style="width: 77%;" /></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">Name of the publisher whose books are followed in the earlier classes</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="OUP" class="chk frm" />OUP</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Gaba" class="chk frm" />Gaba
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="AFAQ" class="chk frm" />AFAQ</td>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Other" class="chk frm" />Other
                                    <input class="frm clr" type="text" style="width: 77%;" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">
                                    <input type="checkbox" value="Sindh Text Book Board" class="chk frm" />Sindh Text Book Board</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Check if up-to-date attendance record is available?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>

                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Are the attendance records computerized?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Is the record of tuition fee receipt available?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Is the record of tuition fee receipt  computerized?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Is the record of teacher&apos;s salaries available?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Is the record of teacher&apos;s salaries computerized?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Does the school maintain a bank account?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Is the account maintained on school name?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">If the school is partnered with EFS, will it open an account on school name?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">In case of non-registered school, will the school apply for registration if successfully partnered with EFS?</td>
                                <td>
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>


                        </tbody>
                    </table>

                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Information about the School's Building</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad" style="background: #FAFAFA;">

                    <table>
                        <tbody>
                            <tr>
                                <td colspan="4">Please Observe if the following facilities exist. Try using them if needed.
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <tr>

                                <td style="width: 140px;">School Building is </td>
                                <td style="width: 40%;">
                                    <select name="D1" style="width: 93.5%;" class="frm">
                                        <option>Owned</option>
                                        <option>Rented</option>
                                        <option>Leased</option>
                                        <option>Other</option>
                                    </select>
                                </td>
                                <td style="width: 100px;"></td>
                                <td style="width: 40%;"></td>
                            </tr>
                            <tr>
                                <td colspan="4" style="padding: 0px;">
                                    <table class="responsive table table-striped table-bordered table-condensed">
                                        <tr style="border: 1px solid #C4C4C4; text-align: center; font-size: large; background: #F7F7F7;">
                                            <td style="padding: 20px;"></td>
                                            <td>Building-1</td>
                                            <td>Building-2</td>
                                        </tr>
                                        <tr>
                                            <td>Size of the plot (sq yard)</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                        </tr>
                                        <tr>
                                            <td>Number of floors</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                        </tr>
                                        <tr>
                                            <td>Total Rooms</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                        </tr>
                                        <tr>
                                            <td>Unused Rooms (Morning)</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                        </tr>
                                        <tr>
                                            <td>Unused Rooms (Afternoon)</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">Is there any hall available?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">If yes, How many?</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>

                                        <tr>
                                            <td colspan="2">Is the hall(s) used as classrooms?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Is there a dedicated space for library?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">if no, is there a box or bookshelf where books are kept and shared from?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>

                                        <tr>
                                            <td colspan="2">Does the school have electricity?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes Completely</option>
                                                    <option>Yes Partially</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">At the time of survey was there electricity?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Average hours of load-shedding per day?</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" accept="frm clr" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Electricity generator available?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Is there a source of drinking water in the school boundary?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">If yes, is the water drinkable?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                    <option>Tap/Pump was dysfunctional</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Is there a water cooler/piture/bucket for drinking water?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Does the school have an adequate boundary wall?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>

                                        <tr>
                                            <td colspan="3">
                                                <div class="well"><b>State of toilets?</b></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Number Available</td>
                                            <td colspan="2">
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Number functional?</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Teacher's Toilets</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Teacher's Toilets Functional</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Male Student's Toilets</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Male Student's Toilets Functional</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Female Student's Toilets</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Female Student's Toilets Functional</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Is there a playground in the school?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Is there a computer lab in the school?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Number of computers in the lab</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" accept="frm clr" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Is the lab being used?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">Is school's transportation facility available for students?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Number of vans available (owned/rented/third party)</td>
                                            <td>
                                                <input class="frm clr" type="text" style="width: 77%;" /></td>

                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <div class="well"><b>Hygienic environment</b></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Do the classrooms appear regularly cleaned?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Are playing facilities/common areas clean?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Do the students have clean eating area?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Do the students have clean uniforms?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Do their nails/hair appear neatly cut/trimmed?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Is there a proper dustbin easily accessible?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Do you observe a garbage deposit nearby the school?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <div class="well"><b>Fee Structure/Student's Information/Fixtures</b></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Is the school willing to enroll students throughout the academic year</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2">Is the school willing to enroll students who are older than the recommended age for a class?</td>
                                            <td>
                                                <select name="D1" style="width: 81%;" class="frm">
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select></td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <div style="text-align: right; margin-right: 10px;">
                        <button type="button" id="btnSave" value="0" class="btn btn-info">Save</button>
                        <button type="button" id="btnCancel" class="btn btn-info">Cancel</button>
                    </div>
                    <br />
                </div>

            </div>

        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {

            $('#ddlol').live('change', function () {
                if ($(this).val() == "Other(Name it)") {
                    $('#txtol2').text('').removeAttr('disabled');
                }
                else {
                    $('#txtol2').text('').attr('disabled', 'disabled');
                }
            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                //alertG($('.frm').length);
                if ($.trim($('#txtgps1').val()) == "" || $.trim($('#txtgps2').val())=="") {
                    alertR("Enter GPS coordinates plz..!");
                }
                else {
                    var gpscord = $('#txtgps1').val() + "," + $('#txtgps2').val();
                    $('#txtgps2').val('');
                    $('#txtgps1').val(gpscord);
                }

                var $str = "";
                $('.frm').each(function (index, element) {
                    var $ele = $(this);
                    if ($ele.hasClass('chk')) {
                        if ($ele.prop('checked')) {
                            $str += 'Yes' + "½";
                        }
                        else {
                            $str += 'No' + "½";
                        }
                    }
                    else {
                        $str += $ele.val() + "½";
                    }
                });
                $str += '¼';
                $str = $str.replace('½¼','');
                if ($('#btnSave').val() == "0") {
                    $.ajax({
                        type: "POST",
                        url: "ghEFS.ashx/?ID=21ǁ" + encodeURIComponent($str),
                        success: function (response) {
                            $('#btnCancel').click();
                            alertG('Record Saved..!');
                        }
                    });
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "ghEFS.ashx/?ID=22ǁ" + encodeURIComponent($str) + "ǁ" + $('#btnSave').val(),
                        success: function (response) {
                            $('#btnCancel').click();
                            alertG('Record Updated..!');
                        }
                    });
                }
            });
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                $('.clr').val('');
                $('#btnSave').val('0').html('Save');
                $('.chk').removeAttr('checked');
                //$('.chk').each(function (index, element) {
                //    $(this).removeAttr('checked');

                //});
                //alertR('Cancel');
            });
            $('#txtDate').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    // Load22Graphs();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");
            $('#txtStartTime,#txtEndTime,#STM,#ETM,#STA,#ETA').timeEntry({
                show24Hours: true,
                spinnerImage: ''
            });
            $('#txtEndTime,#txtStartTime,#STM,#ETM,#STA,#ETA').timeEntry('setTime', '09:00');

            //BindCountry();
            BindTehsil();
            ////////////////////////BIND LOCATION
            ////////////////////////////////////////////////////////////////////
            $("#ddlGeoCountry").live("change", BindProvince);
            $("#ddlGeoProvince").live("change", BindRegion);
            $("#ddlGeoRegion").live("change", BindDistrict);
            $("#ddlGeoDestrict").live("change", BindTehsil);
            $("#ddlGeoTehsil").live("change", BindFU);
            $("#ddlGeoFeildUnit").live("change", BindUC);
            $("#ddlGeoUnionConcil").live("change", BindVillage);
            function BindCountry() {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/BindCountry",
                    data: "{}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d);
                        $("#ddlGeoCountry").html(jdata.Country);
                        $("#ddlGeoProvince").html(jdata.Province);
                        $("#ddlGeoRegion").html(jdata.Region);
                        $("#ddlGeoDestrict").html(jdata.District);
                        $("#ddlGeoTehsil").html(jdata.Tehsil);
                        $("#ddlGeoFeildUnit").html(jdata.FU);
                        $("#ddlGeoUnionConcil").html(jdata.UC);
                        $("#ddlGeoUnionVillage").html(jdata.village);
                        BindSlum();
                    }
                });
            }
            function BindProvince() {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/BindProvince",
                    data: "{'ID':'" + $("#ddlGeoCountry").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";
                        $("#ddlGeoProvince").html(jdata.Province);
                        $("#ddlGeoRegion").html(jdata.Region);
                        $("#ddlGeoDestrict").html(jdata.District);
                        $("#ddlGeoTehsil").html(jdata.Tehsil);
                        $("#ddlGeoFeildUnit").html(jdata.FU);
                        $("#ddlGeoUnionConcil").html(jdata.UC);
                        $("#ddlGeoUnionVillage").html(jdata.village);
                        BindSlum();
                    }
                });
            }
            function BindRegion() {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/BindRegion",
                    data: "{'ID':'" + $("#ddlGeoProvince").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";
                        $("#ddlGeoRegion").html(jdata.Region);
                        $("#ddlGeoDestrict").html(jdata.District);
                        $("#ddlGeoTehsil").html(jdata.Tehsil);
                        $("#ddlGeoFeildUnit").html(jdata.FU);
                        $("#ddlGeoUnionConcil").html(jdata.UC);
                        $("#ddlGeoUnionVillage").html(jdata.village);
                        BindSlum();
                    }
                });
            }
            function BindDistrict() {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/BindDistrict",
                    data: "{'ID':'" + $("#ddlGeoRegion").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";
                        $("#ddlGeoDestrict").html(jdata.District);
                        $("#ddlGeoTehsil").html(jdata.Tehsil);
                        $("#ddlGeoFeildUnit").html(jdata.FU);
                        $("#ddlGeoUnionConcil").html(jdata.UC);
                        $("#ddlGeoUnionVillage").html(jdata.village);
                        BindSlum();
                    }
                });
            }
            function BindTehsil() {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/BindTehsil",
                    data: "{'ID':'" + $("#ddlGeoDestrict").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";
                        $("#ddlGeoTehsil").html(jdata.Tehsil);
                        $("#ddlGeoFeildUnit").html(jdata.FU);
                        $("#ddlGeoUnionConcil").html(jdata.UC);
                        $("#ddlGeoUnionVillage").html(jdata.village);
                        BindSlum();
                    }
                });
            }
            function BindFU() {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/BindFU",
                    data: "{'ID':'" + $("#ddlGeoTehsil").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";
                        $("#ddlGeoFeildUnit").html(jdata.FU);
                        $("#ddlGeoUnionConcil").html(jdata.UC);
                        $("#ddlGeoUnionVillage").html(jdata.village);
                        BindSlum();
                    }
                });
            }
            function BindUC() {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/BindUC",
                    data: "{'ID':'" + $("#ddlGeoFeildUnit").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";
                        $("#ddlGeoUnionConcil").html(jdata.UC);
                        $("#ddlGeoUnionVillage").html(jdata.village);
                        BindSlum();
                    }
                });
            }
            function BindVillage() {
                BindSlum();

                //initialize();
                //$.ajax({
                //    type: 'POST',
                //    contentType: "application/json; charset=utf-8",
                //    url: "LocationNew.aspx/BindVillage",
                //    data: "{'ID':'" + $("#ddlGeoUnionConcil").val() + "'}",
                //    async: false,
                //    success: function (responseText) {
                //        var jdata = $.parseJSON(responseText.d), output = "";
                //        $("#ddlGeoUnionVillage").html(jdata.village);
                //        initialize();
                //    }
                //});

            }

            function BindSlum() {

                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=4ǁ" + $('#ddlGeoUnionConcil').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.tblSlumID + '">' + itm.strSlumName + '</option>';
                        });
                        $('#ddSlum').html(opt);
                        BindSchools();
                    }
                });
            }

            function BindSchools() {
                var slum = '0';
                if ($('#ddSlum').val() != "" || $('#ddSlum').val() != undefined || $('#ddSlum').val() != null) {
                    slum = $('#ddSlum').val()
                }
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=10ǁ" + $('#ddlGeoUnionConcil').val() + "ǁ" + slum,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.tblAssesmentRapidID + '">' + itm.strSchoolName + '</option>';
                        });

                        $('#ddlSchool').html(opt);

                    }
                });

            }
        });//END OF READY FUNCTION
    </script>
</asp:Content>
