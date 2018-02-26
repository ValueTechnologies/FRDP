<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="OOSC_Profile.aspx.cs" Inherits="FRDP.OOSC_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .btnKMZD[ext="0"] {
            display: none;
        }

        #tblAnimals > tbody > tr > td {
            text-align: left !important;
        }

    </style>


    <style type="text\css" media="print">
  #myFooter, #myHeader
  {
    display: none;
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
                        <span>OOSC Information</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table id="tblAnimals" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th style="width: 30px;">Sr#</th>
                                <th>Name</th>
                                <th style="width: 80px;">DOB</th>
                                <th style="width: 70px;">Gender</th>
                                <th style="width: 130px;">Father Name</th>
                                <th style="width: 130px;">Mother Name</th>
                                <th style="width: 130px;">Contact 1</th>
                                <th style="width: 130px;">Contact 2</th>
                                <th style="width: 60px;">Picture</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <br />
                    <br />
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
                        <span>EVS Enrollment Form</span>
                        <span id="btnPrint" style="float: right;margin-right: 40px;" title="Click to print" aria-hidden="true" class="icomoon-icon-printer"></span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div id="dvContents"  class="content noPad">
                    <br />
                    <table style="width: 98%; margin-left: 20px; margin-right: 20px;">
                        <tr>
                            <td colspan="4" style="text-align: center; font-size: larger;">
                                <h4 style="margin: 0px;">EVS Enrollment Form</h4>
                                <h4>Education Fund for Sindh (EFS)</h4>
                            </td>
                            <td style="width: 90px; vertical-align: top;">
                                <img id="imglogo" src="Images/EG.png" alt="" style="width: 65px; padding: 5px; border: 1px solid #c4c4c4; border-radius: 2px; -webkit-border-radius: 2px; -moz-border-radius: 2px;" class="marginR10"></td>
                        </tr>
                        <tr>
                            <td style="width: 170px;">Date:</td>
                            <td colspan="3" id="id1"></td>
                            <td rowspan="4" style="width: 170px; vertical-align: top;">
                                <img id="id2" src="Uploads/EmployeePhoto/0.png" alt="" style="width: 65px; padding: 5px; border: 1px solid #c4c4c4; border-radius: 2px; -webkit-border-radius: 2px; -moz-border-radius: 2px;" class="marginR10"></td>
                        </tr>
                        <tr>
                            <td>School ID:</td>
                            <td id="id3" style="width: 340px;"></td>
                            <td style="width: 100px;">Grid Code:</td>
                            <td id="id4"></td>
                        </tr>
                        <tr>
                            <td>School Name:</td>
                            <td colspan="3" id="id5"></td>
                        </tr>
                        <tr>
                            <td>Child ID:</td>
                            <td colspan="3" id="id6"></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <h3>Applicant Information :</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>Name of the Student :</td>
                            <td colspan="4" id="id7"></td>
                        </tr>
                        <tr>
                            <td>Father's/Guardian's Name:</td>
                            <td colspan="4" id="id8"></td>
                        </tr>
                        <tr>
                            <td>Father's/Guardian's CNIC:</td>
                            <td colspan="4" id="id9"></td>
                        </tr>
                        <tr>
                            <td>Date of Birth:</td>
                            <td colspan="4" id="id10"></td>
                        </tr>
                        <tr>
                            <td>Age:</td>
                            <td id="id11"></td>
                            <td>Gender:</td>
                            <td id="id12" colspan="2"></td>
                        </tr>

                        <tr>
                            <td colspan="5">
                                <h3>Applicant Contact Details :</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td id="id13" colspan="4"></td>
                        </tr>
                        <tr>
                            <td>Union Council No:</td>
                            <td id="id14"></td>
                            <td>Union Council Name:</td>
                            <td colspan="2" id="id15"></td>
                        </tr>
                        <tr>
                            <td>Town/Tehsil No:</td>
                            <td id="id16"></td>
                            <td>Town/Tehsil Name:</td>
                            <td colspan="2" id="id17"></td>
                        </tr>
                        <tr>
                            <td>District No:</td>
                            <td id="id18"></td>
                            <td>District Name:</td>
                            <td colspan="2" id="id19"></td>
                        </tr>
                        <tr>
                            <td>Contact No: 1</td>
                            <td id="id20"></td>
                            <td>Contact No: 2</td>
                            <td colspan="2" id="id21"></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <h3>To be Filled by School :</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>Admission in Class:</td>
                            <td>______________</td>
                            <td>Section :</td>
                            <td colspan="2">______________</td>
                        </tr>
                        <tr>
                            <td>Shift:</td>
                            <td>
                                <input id="Checkbox1" type="checkbox" />Morning&nbsp;&nbsp;&nbsp;<input id="Checkbox2" type="checkbox" />Afternoon/Evening </td>
                            <td>GR Number :</td>
                            <td colspan="2">______________</td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <h3>Signatures Stamp :</h3>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <table style="width: 95%;">
                                    <tr>
                                        <td style="width: 100px;">Parents Signature/Thumb Impression</td>
                                        <td style="border: 1px solid; width: 150px;">&nbsp;</td>
                                        <td style="width: 100px;">School Principal Signature</td>
                                        <td style="border: 1px solid; width: 150px;">&nbsp;</td>
                                        <td style="width: 100px;">School Stamp</td>
                                        <td style="border: 1px solid; width: 150px;">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

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

            $('#btnPrint').live('click', function (e) {
                e.preventDefault();
                var contents = $("#dvContents").html();
                var frame1 = $('<iframe id="helloworld" />');
                frame1[0].name = "frame1";
                frame1.css({ "position": "absolute", "top": "-1000000px" });
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                //Create a new HTML document.
                frameDoc.document.write('<html><head><title>&nbsp;</title>');
                frameDoc.document.write('</head><body>');
                //Append the external CSS file.
                frameDoc.document.write('<link href="style.css" rel="stylesheet" type="text/css" />');
                //Append the DIV contents.
                frameDoc.document.write(contents);
                frameDoc.document.write('</body></html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                }, 500);
            });
            $('.btnImage').live('click', function (e) {
                e.preventDefault();

                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=30ǁ" + $(this).attr('tag'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $('#id1').html(jd[0].SurveyDate);
                        $('#id2').attr('src',jd[0].Photo);
                        //$('#id3').html(jd[0].);
                        //$('#id4').html(jd[0].);
                        //$('#id5').html(jd[0].);
                        $('#id6').html(jd[0].ChildID);
                        $('#id7').html(jd[0].Name);
                        $('#id8').html(jd[0].FatherName);
                        $('#id9').html(jd[0].FatherCNIC);
                        $('#id10').html(jd[0].DOB);
                        $('#id11').html(jd[0].AgeAtSuervey);
                        $('#id12').html(jd[0].Gender);
                        $('#id13').html(jd[0].Addresss);
                        $('#id14').html(jd[0].UCCode);
                        $('#id15').html(jd[0].UCName);
                        $('#id16').html(jd[0].TownCode);
                        $('#id17').html(jd[0].TownName);
                        $('#id18').html(jd[0].DistrictCode);
                        $('#id19').html(jd[0].DistrictName);
                        $('#id20').html(jd[0].ContactNo1);
                        $('#id21').html(jd[0].ContactNo2);
                    }
                });



                //$('#atag2').html($(this).attr('nm'));

            });



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


            function LoadGrid() {
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=26ǁ" + $('#ddlGeoUnionConcil').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {


                            opt += '<tr tag="' + itm.tblOOSC_Form_FamilyID + '">\
                                <td style="width: 30px;">'+ (parseInt(i) + 1).toString() + '</td>\
                                <td>' + itm.Name + '</td>\
                                <td>' + itm.DOB + '</td>\
                                <td>' + itm.Gender + '</td>\
                                <td>' + itm.Father_Name + '</td>\
                                <td>' + itm.Mother_Name + '</td>\
                                <td>' + itm.Contact_Nmae_1 + ' : ' + itm.Contact_Number_1 + '</td>\
                                <td>' + itm.Contact_Name_2 + ' : ' + itm.Contact_Number_2 + '</td>\
                                <td><button nm="' + itm.Name + '" tag="' + itm.tblOOSC_Form_FamilyID + '" class="btn btn-info btnImage"><span class="icon16 icomoon-icon-camera-2 white"></span>Profile</button></td>\
                            </tr>';
                        });
                        var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                        $('#tblAnimals tbody').html(opt);
                        var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                        $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                    }
                });
            }



            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                var opt = '';
                $('.frm').each(function (index, element) {
                    opt += $(this).val() + "½";
                });

                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=3ǁ" + opt,
                    success: function (response) {
                        alertG('Record Saved');
                        LoadGrid();
                        $('#btnCancel').click();

                    }
                });
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
        });//END OF Doc Ready
    </script>
</asp:Content>
