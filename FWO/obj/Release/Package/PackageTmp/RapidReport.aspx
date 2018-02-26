<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="RapidReport.aspx.cs" Inherits="FRDP.RapidReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #tblAnimals > tbody > tr > td {
            text-align: left !important;
        }
    </style>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Select UC</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 9%; margin-right: 10%;">
                        <tbody>
                            <tr style="display: none;">

                                <td>&nbsp;</td>
                                <td></td>
                                <td>Date</td>
                                <td>
                                    <input id="txtDate" type="text" class="frm" style="width: 238px;" value="" />
                                </td>

                            </tr>
                            <tr>
                                <td>Country</td>
                                <td>
                                    <select id="ddlGeoCountry" name="D1" style="width: 250px">
                                        <option value="1">Pakistan</option>
                                    </select></td>
                                <td>Province</td>
                                <td>
                                    <select id="ddlGeoProvince" name="D42" style="width: 250px">
                                        <option value="2">SINDH</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>District</td>
                                <td>
                                    <select id="ddlGeoRegion" name="D3" style="width: 250px; display: none;">
                                        <option value="2">SINDH</option>
                                    </select>
                                    <select id="ddlGeoDestrict" name="D4" style="width: 250px">
                                        <option value="65">KARACHI CENTRAL</option>
                                        <option value="51">KARACHI EAST</option>
                                        <option value="71">KARACHI MALIR</option>
                                        <option value="80">KARACHI SOUTH</option>
                                        <option value="97">KARACHI WEST</option>
                                    </select>
                                </td>

                                <td>Tehsil/Town/Taluka</td>
                                <td>
                                    <select id="ddlGeoTehsil" name="D5" style="width: 250px"></select>
                                </td>
                            </tr>
                            <tr>

                                <td>Union Council</td>
                                <td>
                                    <select id="ddlGeoFeildUnit" name="D6" style="width: 250px; display: none;"></select>
                                    <select id="ddlGeoUnionConcil" class="frm" name="D7" style="width: 250px"></select>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <input id="txtSlum" type="text" class="frm" style="width: 238px; display: none;" />
                                </td>

                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <button id="btnSave" value="0" class="btn btn-info frm" style="margin-left: 120px; display: none;">Save</button>
                                    <button id="btnCancel" class="btn btn-info" style="display: none;">Cancel</button>
                                </td>
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
                        <span>Rapid Assessment Report</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <br />
                        <table id="tblAnimals" class="responsive table table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                            <thead>
                                <tr>
                                    <th style="width: 30px;">Form No.</th>
                                    <th>Team</th>
                                    <th>District</th>
                                    <th>Town</th>
                                    <th>Union Council</th>
                                    <th>Name of the School</th>
                                    <th>School's Address</th>
                                    <th>Address Line 1</th>
                                    <th>Address Line 2</th>
                                    <th>Nearest Landmark</th>
                                    <th>School's Contact Number</th>
                                    <th>School Coordinates (Lat.)</th>
                                    <th>School Coordinates (Log.)</th>
                                    <th>Number of Students</th>
                                    <th>Average Monthly Fee</th>
                                    <th>Are you being funded by any Organization?</th>
                                    <th>Year Established</th>
                                    <th>Reasons for Rejection</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
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
            LoadGrid();
            function LoadGrid() {
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=20ǁ" + $('#ddlGeoUnionConcil').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '', clr='';
                        $.each(jd, function (i, itm) {

                            if (itm.Rejected == 1)
                            { clr = 'style="background: #ECECB1;"'; }
                            else {
                                clr = "";
                            }
                            opt += '<tr rj="' + itm.Rejected + '" '+clr+'>\
                                <td style="width: 30px;">'+ (parseInt(i) + 1).toString() + '</td>\
<td>--</td>\
<td>' + itm.District + '</td>\
<td>' + itm.Town + '</td>\
<td>' + itm.UC + '</td>\
<td>' + itm.strSchoolName + '</td>\
<td>--</td>\
<td>' + itm.strAddress1+'</td>\
<td>' + itm.strAddress2 + '</td>\
<td>' + itm.strNearestLandMark + '</td>\
<td>' + itm.strContactNoSchool + '</td>\
<td>' + itm.strSchoolLatLang.split(',')[0] + '</td>\
<td>' + itm.strSchoolLatLang.split(',')[1] + '</td>\
<td>' + itm.nStudents + '</td>\
<td>' + itm.Fee + '</td>\
<td>' + itm.Funded + '</td>\
<td>' + itm.yearEstablished + '</td>\
<td>' + itm.RejectionReason + '</td>\
                            </tr>';
                        });
                        var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                        $('#tblAnimals tbody').html(opt);
                        var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                        $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                        $('#tblAnimals').wrap('<div id="HChart" class="scroll" style="overflow-y: hidden; overflow-x:auto; margin:10px; padding-top:10px;width: 98%;"></div>');
                    }
                });
            }


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
                        LoadGrid();
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
                        LoadGrid();
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
                        LoadGrid();
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
                        LoadGrid();
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
                        LoadGrid();
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
                        LoadGrid();
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
                        LoadGrid();
                    }
                });
            }
            function BindVillage() {
                LoadGrid();

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

        });//END OF DOC READY
    </script>
</asp:Content>
