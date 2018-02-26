<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="SchoolRapidAssesment.aspx.cs" Inherits="FRDP.SchoolRapidAssesment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
                 #tblAnimals > tbody > tr > td   {
               text-align: left !important; 
            }
    </style>

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
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>

                                <td>Form Number</td>
                                <td>
                                    <input id="txtFormNo" type="text" class="frm clr" style="width: 90%;" value="" /></td>
                                <td>Date</td>
                                <td>
                                    <input id="txtDate" type="text" class="frm" style="width: 90%;" value="" />
                                </td>

                            </tr>
                            <tr>
                                <td>School Name</td>
                                <td>
                                    <input id="txtSchoolName" type="text" class="frm clr" style="width: 90%;" value="" /></td>
                                <td>School Contact</td>
                                <td>
                                    <input id="txtSchoolContact" type="text" class="frm clr" style="width: 90%;" value="" /></td>
                            </tr>
                            <tr>
                                <td>School Email</td>
                                <td>
                                    <input id="txtSchoolEmail" type="text" class="frm clr" style="width: 90%;" value="" />
                                </td>

                                <td>Owner Name</td>
                                <td>
                                    <input id="txtSchoolOwnerName" type="text" class="frm clr" style="width: 90%;" value="" />
                                </td>
                            </tr>
                            <tr>

                                <td>Owner Contact</td>
                                <td>
                                    <input id="txtSchoolOwnerContact" type="text" class="frm clr" style="width: 90%;" value="" />
                                </td>
                                <td>School Owner Email</td>
                                <td>
                                    <input id="txtSchoolOwnerEmail" type="text" class="frm clr" style="width: 90%;" value="" />
                                </td>

                            </tr>

                            <tr>
                                <td>Principal Name</td>
                                <td>
                                    <input id="txtPrincipalName" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Principal Contact</td>
                                <td>
                                    <input id="txtContact" class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>Principal Email </td>
                                <td>
                                    <input id="txtPrincipalEmail" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>School Address Line 1</td>
                                <td>
                                    <input id="txtSchoolAddressLine1" class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>School Address Line 2</td>
                                <td>
                                    <input id="txtSchoolAddressLine2" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td>Nearest Landmark</td>
                                <td>
                                    <input id="txtSchoolLandMark" class="frm clr" type="text" style="width: 90%;" /></td>
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
                        <span>SR. Sourcing Questions</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>

                            <tr>
                                <td>Country</td>
                                <td>
                                    <select id="ddlGeoCountry" name="D1" style="width: 93.5%;">
                                        <option value="1">Pakistan</option>
                                    </select></td>
                                <td>Province</td>
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
                                    <select id="ddlGeoDestrict" name="D4" style="width: 93.5%;">                                        <option value="65">KARACHI CENTRAL</option>
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
                                <td>Coordinates</td>
                                <td>
                                    <input id="txtCoordinates" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td></td>
                                <td></td>
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
                                <td>Start Time</td>
                                <td>
                                    <input id="txtStartTime" class="frm" type="text" style="width: 90%;" /></td>
                                <td>End Time</td>
                                <td>
                                    <input id="txtEndTime" class="frm" type="text" style="width: 90%;" /></td>
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
                        <span>SC. Screening Questions</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>

                            <tr>
                                <td style="width: 80%;"><b>SC1</b> Have you been provided with a letter from the efs?</td>
                                <td>
                                    <select id="ddQ1" class="frm">
                                        <option>Yes</option>
                                        <option>No (Provide Letter before proceeding)</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><b>SC1</b> Have you provided your written consent on the prescribed form provided by the enumerator on behalf of the EFS?</td>
                                <td>
                                    <select id="ddQ2" class="frm">
                                        <option>Yes</option>
                                        <option>No (Get signed concent before proceeding)</option>
                                    </select></td>
                            </tr>

                            <tr>
                                <td><b>SC2</b> Please state the total number of students in your school (Please discontinue this Interview if the less than 60 students)</td>
                                <td>
                                    <input id="txtQ3" class="Integer frm clr" type="text" /></td>
                            </tr>
                            <tr>
                                <td><b>SC3</b> Average monthly fee in primary classes? (Please discontinue interview if the fee is greater than PKR 700)</td>
                                <td>
                                    <input id="txtQ4" class="Integer frm clr" type="text" /></td>
                            </tr>
                            <tr>
                                <td><b>SC4</b> Are you been funded by any organization? (if yes, discontinue interview)</td>
                                <td>
                                   <select  class="frm">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><b>SC5</b> Year established (discontinue if has been functional for less than 1 year)</td>
                                <td>
                                    <input id="txtQ6" class="Integer frm clr" type="text" /></td>
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
                        <span>B. School Picture (Taken From Front)</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>

                            <tr>
                                <td style="width: 80%;">School Picture (Taken from Front)</td>
                                <td>
                                    <select id="ddQSchoolPhoto" class="frm">
                                        <option>Yes</option>
                                        <option>No (Not allowed to leave without picture)</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input id="fileUpload" type="file" /></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td>
                                    <button id="btnSave" value="0" class="btn btn-info frm">Save</button>
                                    <button id="btnCancel" value="0" class="btn btn-info">Cancel</button></td>
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
                        <span>Rapid Assesment Results</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <br />
                    <table id="tblAnimals" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th style="width: 30px;">#</th>
                                <th>School</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th style="width: 100px;">Date</th>
                                <th style="width: 60px;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>09/01/2016</td>
                                <td>
                                    <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                    <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                </td>
                            </tr>


                        </tbody>
                    </table>
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {


            $('#btnExcel').live('click', function (e) {
                e.preventDefault();
                $('#tblAnimals').tableExport({ type: 'excel', escape: 'false' });
                e.preventDefault();
            });
            $('#btnWord').live('click', function (e) {
                e.preventDefault();
                $('#tblAnimals').tableExport({ type: 'doc', escape: 'false' });
                e.preventDefault();
            });
            $('#btnPNG').live('click', function (e) {
                e.preventDefault();
                $('#tblAnimals').tableExport({ type: 'png', escape: 'false' });
                e.preventDefault();
            });
            $('#txtStartTime,#txtEndTime').timeEntry({
                show24Hours: true,
                spinnerImage: ''
            });
            $('#txtEndTime,#txtStartTime').timeEntry('setTime', '09:00');
            $('#txtDate').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    // Load22Graphs();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                $('.clr').val('');
                $('#btnSave').val('0').html('Save');
            });
            $('#btnSave').live('click', function (e)
            {
                e.preventDefault();
                
                if ($('#txtDate').val() == "") {
                    alertR("Please Enter Survey Date..!");
                    return false;
                }

                if ($('#txtQ3').val()=="") {
                    alertR("Please Enter total number of students..!");
                    return false;
                }
                if ($('#txtQ4').val() == "") {
                    alertR("Please Enter Fee of students..!");
                    return false;
                }
                if ($('#txtQ6').val() == "") {
                    alertR("Please Enter year School Established..!");
                    return false;
                }
                var uploadfiles = $("#fileUpload").get(0);
                var uploadedfiles = uploadfiles.files
                if ($('#ddQSchoolPhoto').val() == "Yes") {
                    if (uploadedfiles.length > 0) {

                        var ctrlVals = "";// $('#dvAnimalPics').attr('tg') + "½" + $('#ddlSide').val() + "½" + $('#txtCaption').val();
                        $('.frm').each(function (index, element) {
                            ctrlVals += $(this).val() + '½';
                        });

                        var fromdata = new FormData();
                        fromdata.append("vls", ctrlVals);
                        fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                        var ex = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
                        $('#dvAnimalPics').attr('ext', ex);
                        var choice = {};
                        choice.url = "SchoolRapidAssesmentGH.ashx";
                        choice.type = "POST";
                        choice.data = fromdata;
                        choice.contentType = false;
                        choice.processData = false;
                        choice.success = function (result) {
                            alertG(result);
                            //showimagepreview($('#fileUpload'));
                            $('#btnCancel').click();
                        };
                        choice.error = function (err) {
                            alertR(err.statusText);
                        };
                        $.ajax(choice);


                    }
                    else {
                        alertR('Attach Some Photo..!')
                    }
                }
                else {

                    var ctrlVals = "";// $('#dvAnimalPics').attr('tg') + "½" + $('#ddlSide').val() + "½" + $('#txtCaption').val();
                    $('.frm').each(function (index, element) {
                        ctrlVals += $(this).val() + '½';
                    });

                    var fromdata = new FormData();
                    fromdata.append("vls", ctrlVals);
                    //fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                    //var ex = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
                    //$('#dvAnimalPics').attr('ext', ex);
                    var choice = {};
                    choice.url = "SchoolRapidAssesmentGH.ashx";
                    choice.type = "POST";
                    choice.data = fromdata;
                    choice.contentType = false;
                    choice.processData = false;
                    choice.success = function (result) {
                        alertG(result);
                        //showimagepreview($('#fileUpload'));
                        $('#btnCancel').click();
                    };
                    choice.error = function (err) {
                        alertR(err.statusText);
                    };
                    $.ajax(choice);
                }
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
                        LoadGrid();
                    }
                });
            }
            $('#ddSlum').live('change', LoadGrid);
            function LoadGrid() {

                var slum = '0';
                if ($('#ddSlum').val() != "" || $('#ddSlum').val() != undefined) {
                    slum = $('#ddSlum').val()
                }
                if (slum == "0") {
                    var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                    $('#tblAnimals tbody').html('');
                    var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                    $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "ghEFS.ashx/?ID=8ǁ" + $('#ddlGeoUnionConcil').val() + "ǁ" + slum,
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<tr>\
                                <td style="width: 30px;">'+ (parseInt(i) + 1).toString() + '</td>\
                                <td>' + itm.strSchoolName + '</td>\
                                <td>' + itm.Contact + '</td>\
                                <td>' + itm.email + '</td>\
                                <td>' + itm.dtSurveyDate + '</td>\
                                <td style="width: 60px;">\
                                          <a tg=' + itm.tblAssesmentRapidID + ' class="tip grdEdit" oldtitle="Edit" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>\
                                          <a tg=' + itm.tblAssesmentRapidID + ' class="tip grdDelete" oldtitle="Remove" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>\
                                </td>\
                            </tr>';
                            });
                            var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                            $('#tblAnimals tbody').html(opt);
                            var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                            $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                        }
                    });
                }//End of Else
            }//END OF LOAD GRID
            $('.grdEdit').live('click', function (e) {
                e.preventDefault();
                var $id = $(this).attr('tg');
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=9ǁ" + $id,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $('#btnSave').val($id).html('Update');
                        var i = 0;
                        for (var key in jd[0]) {
                           // console.log("Key: " + key);
                            // console.log("Value: " + jd[0][key]);
                            $($('.frm')[i]).val(jd[0][key]);
                            i++;
                        }
                        //$($('.frm')[0]).val(jd[0][1]);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        //$($('.frm')[]).val(jd[0].);
                        $('#toTop').click();
                    }
                });
               
            });
            $('.grdDelete').live('click', function (e) {
                e.preventDefault();
                alertR('Delete is not allowed..!');
            });


        });//END OF DOC READY
    </script>
</asp:Content>
