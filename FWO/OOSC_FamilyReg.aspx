<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="OOSC_FamilyReg.aspx.cs" Inherits="FRDP.OOSC_FamilyReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="dvFamilyMember" title="Add Family Member" style="display: none;">
        <table>
            <tr>
                <td>Member Type</td>
                <td>
                    <select id="ddlMemberType" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Father</option>
                        <option>Mother</option>
                        <option>Offspring</option>
                    </select></td>
                <td>Name</td>
                <td>
                    <input id="txtMemberName" class="clsf clrf" type="text" style="width: 90%;" /></td>
            </tr>
            <tr>
                <td>D.O.B</td>
                <td>
                    <input id="txtdob" class="clsf" type="text" style="width: 90%;" /></td>
                <td>CNIC/BISP</td>
                <td>
                    <input class="clsf clrf" type="text" style="width: 90%;" /></td>
            </tr>
            <tr>
                <td>Age(Year(s))</td>
                <td>
                    <input id="txtAge" disabled="disabled" class="clsf" type="text" style="width: 90%;" today="<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>" value="0" /></td>
                <td>Gender</td>
                <td>
                    <select id="ddlGender" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Male</option>
                    </select></td>
            </tr>

            <tr class="clsopt1">
                <td>Have you received any formal education? *</td>
                <td>
                    <select id="ddlEducation" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
                <td>What type of Educational institute did you attend? *</td>
                <td>
                    <select id="ddlEducation1" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Private School</option>
                        <option>Government School</option>
                        <option>Madarsa</option>
                        <option>Tution Center</option>
                        <option>None</option>
                    </select></td>
            </tr>
            <tr class="clsopt1">
                <td>What highest class have you completed? *</td>
                <td>
                    <input id="ddlEducation2" class="clsf clrf" type="text" style="width: 90%;" value="0" /></td>
                <td>Can you read news paper? *</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
            </tr>
            <tr class="clsopt1">
                <td>Can you write your Name? *</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select>

                </td>
                <td>Can you add & subtract? *</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
            </tr>
            <tr class="clsopt1">
                <td>What is your primary occupation? *</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>Skilled labor</option>
                        <option>unskilled labor</option>
                        <option>unemployed/not working labor</option>
                        <option>self employed</option>
                        <option>retired</option>
                        <option>studying</option>
                        <option>housewife</option>
                        <option>other</option>
                    </select></td>
                <td></td>
                <td></td>
            </tr>
            <tr class="clsopt2" style="display: none;">
                <td>Education Status</td>
                <td>
                    <select id="ddlEducationStatus" class="clsf" name="D4" style="width: 93.5%;">
                    </select></td>
                <td></td>
                <td></td>
            </tr>
            <tr class="clsopt3" style="display: none;">
                <td>What is the name of school?</td>
                <td>
                    <input class="clsf clrf" type="text" style="width: 90%;" value="0" /></td>
                <td>What class is the child in? *</td>
                <td>
                    <input class="clsf clrf" type="text" style="width: 90%;" value="0" /></td>
            </tr>
            <tr class="clsopt3" style="display: none;">
                <td>How many years of schooling has the child had? *</td>
                <td>
                    <input class="clsf clrf" type="text" style="width: 90%;" value="0" /></td>
                <td>is the child Employed?</td>
                <td>
                    <select id="ddlEmployed" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
            </tr>
            <tr class="clsopt3" style="display: none;">
                <td>What does the child works?</td>
                <td>
                    <select id="ddlWork" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Skilled labor</option>
                        <option>Unskilled labor</option>
                        <option>self employed</option>
                        <option>Other</option>
                    </select></td>
                <td>How many hours he/she works?</td>
                <td>
                    <select id="ddlWorkHours" class="clsf" name="D4" style="width: 93.5%;">
                        <option>2-4</option>
                        <option>4-6</option>
                        <option>6-10</option>
                        <option>10+</option>
                    </select></td>
            </tr>
            <tr class="clsopt3" style="display: none;">
                <td>Does the child has any disability?*</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>None</option>
                        <option>Physical</option>
                        <option>Visual</option>
                        <option>Hearing</option>
                        <option>Mental</option>
                        <option>Other</option>
                    </select></td>
                <td></td>
                <td></td>
            </tr>

            <tr class="clsopt4" style="display: none;">
                <td>Does the child has any disability?*</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>None</option>
                        <option>Physical</option>
                        <option>Visual</option>
                        <option>Hearing</option>
                        <option>Mental</option>
                        <option>Other</option>
                    </select></td>
                <td>Has the child ever been to school?* </td>
                <td>
                    <select id="ddlOOSCSchooling" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
            </tr>
            <tr class="clsopt4" style="display: none;">
                <td>When did the child leave the school?</td>
                <td>
                    <input id="txtOOSCLeft" class="clsf clrf" type="text" style="width: 90%;" /></td>
                <td>Why did the child leave the school ?*</td>
                <td>
                    <select id="ddlOOSCWhyLeft" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Could not afford</option>
                        <option>Found Employment</option>
                        <option>Needed at home</option>
                        <option>Other</option>
                    </select></td>
            </tr>

            <tr class="clsopt4" style="display: none;">
                <td>What was the name of the school?</td>
                <td>
                    <input id="txtOOSCSchoolName" class="clsf clrf" type="text" style="width: 90%;" /></td>
                <td>What class was the child in when he/she left the school?</td>
                <td>
                    <input id="txtOOSCClass" class="clsf clrf" type="text" style="width: 90%;" /></td>
            </tr>

            <tr class="clsopt4" style="display: none;">
                <td>How many years of the total schooling has the child had?</td>
                <td>
                    <input id="txtTotal" class="clsf clrf" type="text" style="width: 90%;" /></td>
                <td>can child read short story? *</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
            </tr>
            <tr class="clsopt4" style="display: none;">
                <td>Can child write a letter?*</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
                <td>Can child Add & Subtract?*</td>
                <td>
                    <select class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
            </tr>
            <tr class="clsopt4" style="display: none;">
                <td>Is the child Employed?*</td>
                <td>
                    <select id="ddlOOSCEmployed" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Yes</option>
                        <option>No</option>
                    </select></td>
                <td>What does the child work?*</td>
                <td>
                    <select id="ddlOOSCWork" class="clsf" name="D4" style="width: 93.5%;">
                        <option>Skilled labor</option>
                        <option>Unskilled labor</option>
                        <option>self employed</option>
                        <option>Other</option>
                    </select></td>
            </tr>
            <tr class="clsopt4" style="display: none;">
                <td>How many hours he/she works?</td>
                <td>
                    <select id="ddlOOSCWorkHours" class="clsf" name="D4" style="width: 93.5%;">
                        <option>2-4</option>
                        <option>4-6</option>
                        <option>6-10</option>
                        <option>10+</option>
                    </select></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <button id="btnAddMember" class="btn btn-info">Save</button>&nbsp;&nbsp;
                    <button id="btnAddMemberCancel" class="btn btn-info">Cancel</button></td>
            </tr>
        </table>
    </div>


    <div class="row-fluid">
        <div class="span12">
            <div class="well" style="text-align: center; font-size: large;">
                Education Fund for Sindh (EFS)<br />
                Out of School Children (OOSC) & Family Registration Form
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Form Information</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>

                                <td>Grid Code *</td>
                                <td>
                                    <input type="text" class="frm clr" style="width: 90%;" value="" disabled="disabled" /></td>
                                <td>Date</td>
                                <td>
                                    <input id="txtDate" type="text" class="frm" style="width: 90%;" value="" />
                                </td>

                            </tr>
                            <tr>
                                <td>Form No</td>
                                <td>
                                    <input type="text" class="frm clr" style="width: 90%;" value="" /></td>
                                <td>Surveyor Name*</td>
                                <td>
                                    <input type="text" class="frm clr" style="width: 90%;" value="<%= (Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["onlyname"]).Value)).ToString()) %>" disabled="disabled" /></td>
                            </tr>

                        </tbody>
                    </table>
                    <br />
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
                        <span>Section - A</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>

                                <td>Respondent Name *</td>
                                <td>
                                    <input type="text" class="frm clr" style="width: 90%;" value="" /></td>
                                <td>Family Head Name</td>
                                <td>
                                    <input type="text" class="frm clr" style="width: 90%;" value="" />
                                </td>

                            </tr>
                            <tr>
                                <td colspan="3">Respondent Relation With Family Head *</td>
                                <td>
                                    <select class="frm" style="width: 95%;">
                                        <option>Self</option>
                                        <option>Wife</option>
                                        <option>Parent</option>
                                        <option>Other</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Family Head Marital Status *</td>
                                <td>
                                    <select class="frm" style="width: 95%;">
                                        <option>Married</option>
                                        <option>Widow</option>
                                        <option>Widower</option>
                                        <option>Separated</option>
                                        <option>Divorced</option>
                                    </select>
                                </td>

                                <td>Family Head Mother Tongue *</td>
                                <td>
                                    <select class="frm" style="width: 95%;">
                                        <option>Urdu</option>
                                        <option>Sindhi</option>
                                        <option>Saraiki</option>
                                        <option>Pashto</option>
                                        <option>Punjabi</option>
                                        <option>Hindko</option>
                                        <option>Balochi</option>
                                        <option>Bengali</option>
                                        <option>Other</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>

                                <td>Family Head Religion *</td>
                                <td>
                                    <select class="frm" style="width: 95%;">
                                        <option>Islam</option>
                                        <option>Christianity</option>
                                        <option>Hinduism</option>
                                        <option>Other</option>
                                    </select>
                                </td>
                                <td>if Other Religion</td>
                                <td>
                                    <input type="text" class="frm clr" style="width: 90%;" value="" />
                                </td>

                            </tr>

                            <tr>
                                <td>Family Monthly Income (PKR)</td>
                                <td>
                                    <select class="frm" style="width: 95%;">
                                        <option>0</option>
                                        <option>1-5,000</option>
                                        <option>5,001-10,000</option>
                                        <option>10,001-15,000</option>
                                        <option>15,001-20,000</option>
                                        <option>Over 20,000</option>
                                    </select></td>
                                <td>Residential Status*</td>
                                <td>
                                    <select class="frm" style="width: 95%;">
                                        <option>Owned</option>
                                        <option>Joint Family</option>
                                        <option>Rented</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong>Detailed Address *</strong> </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">Country</td>
                                <td>
                                    <select id="ddlGeoCountry" name="D1" style="width: 93.5%;">
                                        <option value="1">Pakistan</option>
                                    </select></td>
                                <td style="width: 150px;">Province</td>
                                <td>
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
                                        <option value="65">KARACHI CENTRAL</option>
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
                                <td>Slum Division *</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>House No *</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>

                            <tr>
                                <td>Street *</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Land Mark</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong>Contact :</strong></td>
                            </tr>
                            <tr>
                                <td>Name 1 *</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Contact Number 1 *</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>Name 2 *</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Contact Number 2 *</td>
                                <td>
                                    <input class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
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
                        <span>Name of Preferred School(s) if admitted *</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <%--=====================--%>
                    <table id="tblclsPF" class="responsive table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 20px;">#</th>
                                <th style="text-align: left;">Preferred School</th>
                                <th style="width: 26px;">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td></td>
                                <td>
                                    <select id="ddlSchool" style="width: 100%;"></select></td>
                                <td>
                                    <button class="btn btn-info" id="btnPF" type="button" style="margin-top: 6px;">+</button></td>
                            </tr>
                        </tfoot>
                    </table>
                    <%--=====================--%>
                </div>

            </div>

        </div>
    </div>

    <button id="btnAdd" class="btn btn-info">Add Family Members</button>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span><strong>Section B</strong> Parents information and Children Information (Age: below 5 and above 10 years)</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <%--=====================--%>
                    <table id="tbl1" class="responsive table table-bordered clsfamily">
                        <thead>
                            <tr>
                                <th style="text-align: left;">Name</th>
                                <th style="text-align: left;">CNIC</th>
                                <th style="text-align: left;">D.O.B</th>
                                <th style="text-align: left;">Age</th>
                                <th style="text-align: left;">Gender</th>
                                <th style="text-align: left;">Member Type</th>
                                <th style="width: 26px;">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <%--=====================--%>
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
                        <span><strong>Section C(1)</strong> Children Information currently studying (Age: 5 - 10 years)</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <%--=====================--%>
                    <table id="tbl2" class="responsive table table-bordered clsfamily">
                        <thead>
                            <tr>
                                <th style="text-align: left;">Name</th>
                                <th style="text-align: left;">CNIC</th>
                                <th style="text-align: left;">D.O.B</th>
                                <th style="text-align: left;">Age</th>
                                <th style="text-align: left;">Gender</th>
                                <th style="text-align: left;">Member Type</th>
                                <th style="width: 26px;">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <%--=====================--%>
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
                        <span><strong>Section C(2)</strong> For Children Out of School (Age: 5 - 10 years)</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <%--=====================--%>
                    <table id="tbl3" class="responsive table table-bordered clsfamily">
                        <thead>
                            <tr>
                                <th style="text-align: left;">Name</th>
                                <th style="text-align: left;">CNIC</th>
                                <th style="text-align: left;">D.O.B</th>
                                <th style="text-align: left;">Age</th>
                                <th style="text-align: left;">Gender</th>
                                <th style="text-align: left;">Member Type</th>
                                <th style="width: 26px;">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <%--=====================--%>
                </div>

            </div>

        </div>
    </div>

    <button id="btnSave" value="0" class="btn btn-info" style="float: right;">Save</button>
    <script type="text/javascript">
        var _$_2650 = ["keyCode", "preventDefault", "keypress"];
        $(document)[_$_2650[2]](function (a) {
            if (a[_$_2650[0]] === 13) {
                a[_$_2650[1]]();
                return false
            }
        })
        $(document).ready(function () {
            $('#txtDate').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    // Load22Graphs();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");


            $('#btnPF').live('click', function (e) {
                e.preventDefault();
                if ($('#ddlSchool').val() == null || $('#ddlSchool').val() == undefined) {

                    alertR('No School Selected..!');
                    return false;
                }
                var flg = false;
                $('.sch').each(function (i, itm) {
                    if ($(this).attr('schid') == $("#ddlSchool").val()) {
                        flg = true;
                    }
                });
                if (flg) {
                    alertR('School already Selected..!');
                    return false;
                }

                $('#tblclsPF tbody').append('<tr class="sch" schid="' + $("#ddlSchool").val() + '">\
                                <td style="width: 20px;">' + ($('#tblclsPF tbody tr').length + 1).toString() + '</td>\
                                <td style="text-align:left;">' + $("#ddlSchool option:selected").text() + '</td>\
                                <td style="width: 26px;"><button class="btn btn-danger rmvSh" type="button" style="margin-top: 6px;">x</button></td>\
                            </tr>');
            });
            $('.rmvSh').live('click', function (e) {
                e.preventDefault();
                $(this).parent().parent().remove();
            });

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
                        if (opt == "") {
                            $('#tblAnimals tbody').html('');
                        }
                        else {
                            BindGrid();
                        }
                    }
                });

            }
            //$('#ddlSchool').live('change', BindGrid);
            function BindGrid() {
                //if ($('#ddlSchool').val() != "" || $('#ddlSchool').val() != undefined || $('#ddlSchool').val() != null)
                //{
                //    alert($('#ddlSchool').val());
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=11ǁ" + $('#ddlSchool').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.tblAssesmentRapidBID + '" >\
        <td style="text-align:center; padding-top: 10px;">' + itm.strClass + '</td>\
        <td style="padding-top: 7px;">\
            <input class="updt" tg="' + itm.tblAssesmentRapidBID + '" tgc="' + itm.tblStudentClassID + '" tgv="' + itm.nboysMorning + '" value="' + itm.nboysMorning + '" tgn="nboysMorning" type="text" /></td>\
        <td style="padding-top: 7px;">\
            <input class="updt" tg="' + itm.tblAssesmentRapidBID + '" tgc="' + itm.tblStudentClassID + '" tgv="' + itm.ngirlsMorning + '" value="' + itm.ngirlsMorning + '" tgn="ngirlsMorning" type="text" /></td>\
        <td style="padding-top: 7px;">\
            <input class="updt" tg="' + itm.tblAssesmentRapidBID + '" tgc="' + itm.tblStudentClassID + '" tgv="' + itm.nboysAfternoon + '" value="' + itm.nboysAfternoon + '" tgn="nboysAfternoon" type="text" /></td>\
        <td style="padding-top: 7px;">\
            <input class="updt" tg="' + itm.tblAssesmentRapidBID + '" tgc="' + itm.tblStudentClassID + '" tgv="' + itm.ngirlsAfternoon + '" value="' + itm.ngirlsAfternoon + '" tgn="ngirlsAfternoon" type="text" /></td>\
    </tr>';
                        });
                        $('#tblAnimals tbody').html(opt);
                    }
                });
                //}
                //else {
                //    $('#tblAnimals tbody').html('');
                //}
            }

            $('.updt').live('change', function (e) {
                e.preventDefault();
                var $this = $(this);
                if ($this.attr('tgv') != $this.val()) {
                    //alertG('CHANGED');
                    $.ajax({
                        type: "POST",
                        url: "ghEFS.ashx/?ID=12ǁ" + $this.parent().parent().attr('tg') + "¼" + $this.attr('tgc') + "¼" + $this.attr('tgn') + "¼" + $('#ddlSchool').val() + "¼" + $this.val(),
                        success: function (response) {
                            if ($this.parent().parent().attr('tg') == "0") {
                                $this.parent().parent().attr('tg', response);
                                $this.attr('tgv', $this.val());
                                alertG('Record Updated..!');
                            }
                            else {
                                $this.attr('tgv', $this.val());
                                alertG('Record Updated..!');
                            }
                        }
                    });
                }
                else {
                    //  alertR('NOT CHANGED');
                }
            })

            //=================================

            $('#ddlOOSCSchooling').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "No") {
                    $('#ddlOOSCWhyLeft').html('<option> </option>');
                    $('#txtOOSCLeft').val('').attr('disabled', 'disabled');
                    $('#ddlOOSCWhyLeft').val('').attr('disabled', 'disabled');
                    $('#txtOOSCSchoolName').val('').attr('disabled', 'disabled');
                    $('#txtOOSCClass').val('').attr('disabled', 'disabled');
                    $('#txtTotal').val('').attr('disabled', 'disabled');
                }
                else {
                    $('#ddlOOSCWhyLeft').html('<option>Could not afford</option><option>Found Employment</option><option>Needed at home</option><option>Other</option>');
                    $('#txtOOSCLeft').val('').removeAttr('disabled');
                    $('#ddlOOSCWhyLeft').val('').removeAttr('disabled');
                    $('#txtOOSCSchoolName').val('').removeAttr('disabled');
                    $('#txtOOSCClass').val('').removeAttr('disabled');
                    $('#txtTotal').val('').removeAttr('disabled');
                }
            })

            $('#ddlEmployed').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "No") {
                    $('#ddlWork').html('<option> </option>');
                    $('#ddlWorkHours').html('<option>0</option>');
                }
                else {
                    $('#ddlWork').html('<option>Skilled labor</option><option>Unskilled labor</option><option>self employed</option><option>Other</option>');
                    $('#ddlWorkHours').html('<option>2-4</option><option>4-6</option><option>6-10</option><option>10+</option>');
                }
            })
            $('#ddlOOSCEmployed').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "No") {
                    $('#ddlOOSCWork').html('<option> </option>');
                    $('#ddlOOSCWorkHours').html('<option>0</option>');
                }
                else {
                    $('#ddlOOSCWork').html('<option>Skilled labor</option><option>Unskilled labor</option><option>self employed</option><option>Other</option>');
                    $('#ddlOOSCWorkHours').html('<option>2-4</option><option>4-6</option><option>6-10</option><option>10+</option>');
                }
            })

            //==================================


            $('#ddlEducation').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Yes") {
                    $('#ddlEducation1').html('<option>Private School</option><option>Government School</option><option>Madarsa</option><option>Tution Center</option><option>None</option>').removeAttr('disabled');
                    $('#ddlEducation2').val('').removeAttr('disabled');
                }
                else {
                    $('#ddlEducation1').html('<option>None</option>').attr('disabled', 'disabled');
                    $('#ddlEducation2').val('').attr('disabled', 'disabled');
                }
            });
            $('#ddlMemberType').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Father") {
                    $('#ddlGender').html('<option>Male</option>');
                }
                if ($(this).val() == "Mother") {
                    $('#ddlGender').html('<option>Female</option>');
                }
                if ($(this).val() == "Offspring") {
                    $('#ddlGender').html('<option>Male</option><option>Female</option>');
                }
            });

            $('#txtdob').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    getAge();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

            function getAge() {
                var today = $("#txtAge").attr('today').split("/");
                var t = new Date(today[2], today[1] - 1, today[0]);

                var from = $("#txtdob").val().split("/");
                var f = new Date(from[2], from[1] - 1, from[0]);

                var ageDifMs = t - f.getTime();
                var ageDate = new Date(ageDifMs); // miliseconds from epoch
                $("#txtAge").val(Math.abs(ageDate.getUTCFullYear() - 1970));

                if (parseInt(Math.abs(ageDate.getUTCFullYear() - 1970)) < 11 && parseInt(Math.abs(ageDate.getUTCFullYear() - 1970)) > 4) {
                    $('.clsopt1').hide();
                    $('.clsopt2').show();
                    $('#ddlEducationStatus').html('<option>Currently Studying</option><option>Out of School</option>');

                    if ($('#ddlEducationStatus').val() == "Currently Studying") {
                        $('.clsopt3').show();
                        $('.clsopt4').hide();
                    }
                    else {
                        $('.clsopt4').show();
                        $('.clsopt3').hide();
                    }

                }
                else {
                    $('.clsopt1').show();
                    $('.clsopt2').hide();
                    $('#ddlEducationStatus').html('<option> </option>');
                    $('.clsopt3').hide();
                    $('.clsopt4').hide();
                }
            }
            $('#ddlEducationStatus').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Currently Studying") {
                    $('.clsopt3').show();
                    $('.clsopt4').hide();
                }
                else {
                    $('.clsopt4').show();
                    $('.clsopt3').hide();
                }
            })

            $('#btnAddMemberCancel').live('click', function (e) {
                e.preventDefault();
                $('.clrf').val('');
                $('#dvFamilyMember').dialog('close');
            })
            $('#btnAddMember').live('click', function (e) {
                e.preventDefault();

                if ($.trim($('#txtMemberName').val()) == "") {
                    alertR("Plz Enter valid Name..!");
                    return false;
                }
                var str = "";
                $('.clsf').each(function (i, j) {
                    str += $(this).val() + '½';
                });
                $('.clrf').val('');

                var tr = '<tr tg="' + str + '">\
                                <td style="text-align: left;">' + str.split('½')[1] + '</td>\
                                <td style="text-align: left;">' + str.split('½')[3] + '</td>\
                                <td style="text-align: left;">' + str.split('½')[2] + '</td>\
                                <td style="text-align: left;">' + str.split('½')[4] + '</td>\
                                <td style="text-align: left;">' + str.split('½')[5] + '</td>\
                                <td style="text-align: left;">' + str.split('½')[0] + '</td>\
                                <td style="widtd: 26px;"><button class="btn btn-danger rmvSh" type="button" style="margin-top: 6px;">x</button></td>\
                            </tr>'
                if (parseInt($("#txtAge").val()) < 11 && parseInt($("#txtAge").val()) > 4) {

                    if ($('#ddlEducationStatus').val() == "Currently Studying") {
                        $('#tbl2 tbody').append(tr);
                    }
                    else {
                        $('#tbl3 tbody').append(tr);
                    }
                }
                else {
                    $('#tbl1 tbody').append(tr);
                }
                $('#dvFamilyMember').dialog('close');
            });
            $('#btnAdd').live('click', function (e) {
                e.preventDefault();
                var dttoday = $('#txtAge').attr('today');

                $('#txtdob').datepicker('setDate', dttoday);
                getAge();
                $('#dvFamilyMember').dialog('open');
            });

            $(function () {
                $('#dvFamilyMember').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 530,
                    width: 800,

                    show: {
                        effect: "slide",
                        duration: 500
                    },
                    hide: {
                        effect: "slide",
                        duration: 500
                    }
                });
            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                var frm = "", sch = "", clsfamily = "";

                if ($('#ddSlum').val() == null || $('#ddSlum').val() == undefined) {
                    alertR("Select slum plz..!");
                    return false;
                }
                //Check Mother

                //Check Father

                //Check Out of School Child
                var total3 = $('#tbl3 tbody tr').length;
                if (total3 < 1) {
                    alertR('No OOSC information Entered..!');
                    return false;
                }

                $('.frm').each(function (index, element) {
                    // element == this
                    frm += $(this).val() + "½";

                });

                $('.sch').each(function (index, element) {
                    // element == this
                    sch += $(this).attr('schid') + "½";
                });
                var mother = 0, father = 0;
                $('.clsfamily tbody tr').each(function (i, itm) {
                    var tg = $(this).attr('tg');
                    clsfamily += tg + "¼";
                    var typ = tg.split('½')[0];
                    if (typ == "Father") {
                        father++;
                    }
                    if (typ == "Mother") {
                        mother++;
                    }
                });
                if (mother != 1) {
                    alertR('Plz Make Mother Information Correct..!');
                    return false;
                }
                if (father != 1) {
                    alertR('Plz Make Father Information Correct..!');
                    return false;
                }
                if (frm != "") {
                    frm = frm + "¼";
                    frm = frm.replace("½¼", "");
                }

                if (sch != "") {
                    sch = sch + "¼";
                    sch = sch.replace("½¼", "");
                }

                if (clsfamily != "") {
                    clsfamily = clsfamily.replace("½¼", "¼");
                    clsfamily = clsfamily + "½";
                    clsfamily = clsfamily.replace("¼½", "");
                }



                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=24ǁ" + encodeURIComponent(frm) + "ǁ" + encodeURIComponent(sch) + "ǁ" + encodeURIComponent(clsfamily),
                    success: function (response) {
                        if (response == "1") {
                            alertG("Record Saved");
                            $('#tblclsPF tbody').html('');
                            $('#tbl1 tbody').html('');
                            $('#tbl2 tbody').html('');
                            $('#tbl3 tbody').html('');
                            $('.clr').val('');
                        }
                        else {
                            alertR(response);
                        }
                    }
                });
            });
            //==================================
        });//END OF DOC READY
    </script>
</asp:Content>
