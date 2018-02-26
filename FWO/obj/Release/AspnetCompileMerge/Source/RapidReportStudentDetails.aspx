<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="RapidReportStudentDetails.aspx.cs" Inherits="FRDP.RapidReportStudentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>School Selection</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                    <br />
                    <table  style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>

                            <tr>
                                <td style="width:150px;">Country</td>
                                <td>
                                    <select id="ddlGeoCountry" name="D1" style="width: 93.5%;">
                                        <option value="1">Pakistan</option>
                                    </select></td>
                                <td  style="width:150px;">Province</td>
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
                                <td>School</td>
                                <td>
                                    <select id="ddlSchool" name="D6" style="width: 93.5%;"></select></td>
                                <td></td>
                                <td></td>
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
                                        <span>Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
                                    <div class="page-header"  style="margin-left: 20px;margin-right: 20px;margin-bottom: 10px;">
                                <h4>School Information</h4>
                            </div>
<div id="schInfo" class="well" style="margin-left: 20px;margin-right: 20px;padding-top: 10px;    padding-bottom: 10px;    padding-right: 10px;    padding-left: 10px;">
                                <table id="tblSchoolInfo" class="responsive table table-bordered" style="border-right: 1px solid #c4c4c4;border-top: 1px solid #c4c4c4;">
                                <tbody>
                                  <tr>
                                    <td style="text-align:left; width:100px;">School Name</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;width:170px;">School Contact Number</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;width:100px;">School Email</td>
                                    <td style="text-align:left;"></td>
                                  </tr>
                                  <tr>
                                    <td style="text-align:left;">Owner Name</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;">Owner Contact Number</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;">Owner Email</td>
                                    <td style="text-align:left;"></td>
                                  </tr>
                                  <tr>
                                    <td style="text-align:left; ">Principal Name</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;">Principal Contact Number</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;">Principal Email</td>
                                    <td style="text-align:left;"></td>
                                  </tr>
                              <tr>
                                    <td style="text-align:left;">School Address</td>
                                    <td colspan="5"  style="text-align:left;"></td>
                                  </tr>
                                                                      <tr>
                                    <td style="text-align:left;">District</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;">Town</td>
                                    <td style="text-align:left;"></td>
                                    <td style="text-align:left;">UC</td>
                                    <td style="text-align:left;"></td>
                                  </tr>
                                </tbody>
                            </table>
                                    </div>
                                    <div class="page-header" style="margin-left: 20px;margin-right: 20px;margin-bottom: 10px;">
                                <h4>Class wise Student Information</h4>
                            </div>
<table id="tblAnimals" class="responsive table table-striped table-bordered table-condensed" style="width: 96.4%; margin-left: 20px; margin-right: 20px;border-top: 1px solid #c4c4c4; border-right: 1px solid #c4c4c4;">
                        <thead>

<tr>
    <th rowspan="3" style="border-bottom: 1px solid #c4c4c4;vertical-align: top; text-align:center;">Class</th>
    <th colspan="3">Morning Shift</th>
    <th  colspan="3">Afternoon Shift</th>
    <th  colspan="3">Total</th>
</tr>
                            <tr>
                                <th colspan="3" style="text-align: center;">Students</th>
                                <th colspan="3">Students</th>
                                <th colspan="3">Students</th>
                            </tr>
                            <tr  style="border-bottom: 1px solid #c4c4c4;">
                                <th style="text-align: center;">Boys</th>
                                <th>Girls</th>
                                <th>Total</th>
                                <th>Boys</th>
                                <th>Girls</th>
                                <th>Total</th>
                                <th>Total Boys</th>
                                <th>Total Girls</th>
                                <th>Grand Total</th>
                            </tr>
    </thead>
<tbody></tbody>
    </table>
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
                        if (opt == "") {
                            $('#tblAnimals tbody').html('');
                            $('#schInfo').html('');
                        }
                        else {
                            BindGrid();
                            SchoolInfo();
                        }
                    }
                });
           
        }
        $('#ddlSchool').live('change', BindGrid);
        function BindGrid() {
            //if ($('#ddlSchool').val() != "" || $('#ddlSchool').val() != undefined || $('#ddlSchool').val() != null)
            //{
            //    alert($('#ddlSchool').val());
            SchoolInfo();
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=11ǁ" + $('#ddlSchool').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.tblAssesmentRapidBID + '" >\
        <td style="text-align:center; padding-top: 10px;">' + itm.strClass + '</td>\
        <td style="padding-top: 7px;">' + itm.nboysMorning + '</td>\
        <td style="padding-top: 7px;">' + itm.ngirlsMorning + '</td>\
                <td style="padding-top: 7px;font-family: fantasy; font-size: larger;">' + (parseInt(itm.nboysMorning) + parseInt(itm.ngirlsMorning)).toString() + '</td>\
        <td style="padding-top: 7px;">' + itm.nboysAfternoon + '</td>\
        <td style="padding-top: 7px;">' + itm.ngirlsAfternoon + '</td>\
                <td style="padding-top: 7px;font-family: fantasy; font-size: larger;">' + (parseInt(itm.nboysAfternoon) + parseInt(itm.ngirlsAfternoon)).toString() + '</td>\
<td>' + (parseInt(itm.nboysAfternoon) + parseInt(itm.nboysMorning)).toString() + '</td>\
<td>' + (parseInt(itm.ngirlsMorning) + parseInt(itm.ngirlsAfternoon)).toString() + '</td>\
<td style="font-family: fantasy; font-size: larger;">' + (parseInt(itm.nboysAfternoon) + parseInt(itm.ngirlsAfternoon) + parseInt(itm.ngirlsMorning) + parseInt(itm.nboysMorning)).toString() + '</td>\
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

        function SchoolInfo() {
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=27ǁ" + $('#ddlSchool').val(),
                    success: function (response) {
                        
                        var jd = $.parseJSON(response), opt = '';
                        $('#schInfo').html(jd[0].School);
                    }
                });
            
                
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

        });//END OF DOC READY
    </script>
</asp:Content>
