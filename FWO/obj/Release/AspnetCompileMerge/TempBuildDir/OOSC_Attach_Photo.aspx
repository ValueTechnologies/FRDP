<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="OOSC_Attach_Photo.aspx.cs" Inherits="FRDP.OOSC_Attach_Photo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
         .btnKMZD[ext="0"] {
           display:none;
        }
         #tblAnimals > tbody > tr > td {
            text-align: left !important;
        }
</style>
    <div id="dvKMZUP" title="Attach OOSC Photo" style="display:none;">
        <div id="dvOOSCDisplay"><table class="table">
           <tbody>
               <tr class="success">
                   <td rowspan="3" style="width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;">
                   <img id="imgEmpPhotot" src="Uploads/EmployeePhoto/0.png" alt="" style="width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;" class="marginR10"></td>
                   <td style="text-align: left; width: 110px;"><strong>OOSC Name</strong></td>
                   <td style="text-align: left;" class="clstt" id="tt1"></td>
                   <td style="text-align: left; width: 90px;"><strong>Gender</strong></td>
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" class="clstt"  id="tt2"></td>
               </tr>
               <tr class="error">
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>D.O.B</strong></td>
                   <td style="text-align: left;" class="clstt"  id="tt3"></td>
                   <td style="text-align: left;"><strong>Survey Date</strong></td>
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" class="clstt"  id="tt4"></td>
               </tr>
               <tr class="info">
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>Father Name</strong></td>
                   <td style="text-align: left;" class="clstt"  id="tt5"></td>
                   <td style="text-align: left;"><strong>Father CNIC</strong></td>
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" class="clstt"  id="tt6"></td>
               </tr>
                <tr class="error">
                <td style="border-left: 1px solid #c4c4c4;">&nbsp; </td>
                   <td style="text-align: left;"><strong>Mother Name</strong></td>
                   <td style="text-align: left;" class="clstt"  id="tt7"></td>
                   <td style="text-align: left;"><strong>Mother CNIC</strong></td>
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" class="clstt"  id="tt8"></td>
               </tr>
                               <tr class="info">
                <td style="border-left: 1px solid #c4c4c4;">&nbsp; </td>
                   <td style="text-align: left;"><strong>Contact Name 1</strong></td>
                   <td style="text-align: left;" class="clstt"  id="tt9"></td>
                   <td style="text-align: left;"><strong>Contact No</strong></td>
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" class="clstt"  id="tt10"></td>
               </tr>
                               <tr class="success">
                <td style="border-left: 1px solid #c4c4c4;">&nbsp; </td>
                   <td style="text-align: left;"><strong>Contact Name 2</strong></td>
                   <td style="text-align: left;" class="clstt"  id="tt11"></td>
                   <td style="text-align: left;"><strong>Contact No</strong></td>
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" class="clstt"  id="tt12"></td>
               </tr>
           </tbody>
       </table></div>
        <table style="width:100%;"><tr><td>Attach Photo file:</td><td>
            <input id="FileKMZ" type="file" /></td><td><button  style="width:100%;" id="Upload-KMZ" value="0" class="btn btn-info">Upload Photo</button></td></tr></table>
        </div>
   
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
                            <tr style="display:none;">

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
                                    <input id="txtSlum" type="text" class="frm" style="width: 238px;  display: none;" />
                                </td>

                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <button id="btnSave" value="0" class="btn btn-info frm" style="margin-left: 120px; display: none;">Save</button>
                                    <button id="btnCancel" class="btn btn-info" style="display:none;">Cancel</button>
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


    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {


            $(function () {
                $(document).tooltip({
                    show: {
                        effect: "slideDown",
                        delay: 200
                    },
                    track: true,
                    items: "[title]",
                    content: function () {
                        var element = $(this);
                        if (element.is("[title]")) {
                            return element.attr("title");
                        }
                    }
                });
            });

            $('#txtDate').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    // Load22Graphs();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

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
            function showimagepreview(obj) {
                var input = obj.get(0);
                if (input.files && input.files[0]) {
                    var filerdr = new FileReader();
                    filerdr.onload = function (e) {
                        if ($('#ddlSide').val() == "1") {
                            $('#photo1').attr('src', e.target.result);
                            $('#photo1').show();
                            $('.btnImage[tag=' + $('#dvAnimalPics').attr('tg') + ']').attr('ph1', "." + $('#dvAnimalPics').attr('ext'))
                        }
                        if ($('#ddlSide').val() == "2") {
                            $('#photo2').attr('src', e.target.result);
                            $('#photo2').show();
                            $('.btnImage[tag=' + $('#dvAnimalPics').attr('tg') + ']').attr('ph2', "." + $('#dvAnimalPics').attr('ext'))
                        }
                        if ($('#ddlSide').val() == "3") {
                            $('#photo3').attr('src', e.target.result);
                            $('#photo3').show();
                            $('.btnImage[tag=' + $('#dvAnimalPics').attr('tg') + ']').attr('ph3', "." + $('#dvAnimalPics').attr('ext'))
                        }
                        if ($('#ddlSide').val() == "4") {
                            $('#photo4').attr('src', e.target.result);
                            $('#photo4').show();
                            $('.btnImage[tag=' + $('#dvAnimalPics').attr('tg') + ']').attr('ph4', "." + $('#dvAnimalPics').attr('ext'))
                        }
                        if ($('#ddlSide').val() == "5") {
                            $('#photo5').attr('src', e.target.result);
                            $('#photo5').show();
                            $('.btnImage[tag=' + $('#dvAnimalPics').attr('tg') + ']').attr('ph5', "." + $('#dvAnimalPics').attr('ext'))
                        }
                        LoadGrid();
                    }
                    filerdr.readAsDataURL(input.files[0]);
                }
            }
            $('#btnUploadPhoto').live('click', function (e) {
                e.preventDefault();
                var uploadfiles = $("#fileUpload").get(0);
                var uploadedfiles = uploadfiles.files
                if (uploadedfiles.length > 0) {

                    var ctrlVals = $('#dvAnimalPics').attr('tg') + "½" + $('#ddlSide').val() + "½" + $('#txtCaption').val();

                    var fromdata = new FormData();
                    fromdata.append("vls", ctrlVals);
                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                    var ex = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
                    $('#dvAnimalPics').attr('ext', ex);
                    var choice = {};
                    choice.url = "UploadSlumPics.ashx";
                    choice.type = "POST";
                    choice.data = fromdata;
                    choice.contentType = false;
                    choice.processData = false;
                    choice.success = function (result) {
                        alertG(result);
                        showimagepreview($('#fileUpload'));
                        $('#c' + $('#ddlSide').val()).html($('#txtCaption').val());
                        $('#txtCaption').val('');
                    };
                    choice.error = function (err) {
                        alertR(err.statusText);
                    };
                    $.ajax(choice);


                }
                else {
                    alertR('Attach Some Photo..!')
                }
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
                                <td><button nm="' + itm.Name + '" tag="' + itm.tblOOSC_Form_FamilyID + '" class="btn btn-info btnImage"><span class="icon16 icomoon-icon-camera-2 white"></span>Attach</button></td>\
                            </tr>';
                        });
                        var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                        $('#tblAnimals tbody').html(opt);
                        var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                        $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                    }
                });
            }

            $('#btnSaveGPS').live('click', function (e) {
                e.preventDefault();
                var gp = '';
                $('#tblTempGPS tbody tr').each(function (index, element) {
                    gp += $($(this).find('td')[0]).html() + ',' + $($(this).find('td')[1]).html() + '½';

                });
                gp += '¼';
                gp = gp.replace('½¼', '');
                gp = gp.replace('¼', '');
                if ($.trim(gp) == "") {
                    gp = "0";

                }
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=14ǁ" + gp + "ǁ" + $('#btnSaveGPS').val(),
                    success: function (response) {
                        alertG('Record Saved..!');
                        $('.btnGPS[tag=' + $('#btnSaveGPS').val() + ']').attr('boun', gp);
                        $('#dvGPS').dialog('close');
                    }
                });

            });
            $('.btnGPS').live('click', function (e) {
                e.preventDefault();
                $('#dvGPS').dialog('open');
                $('#btnSaveGPS').val($(this).attr('tag'));
                $('#atag1').html($($(this).parent().parent().find('td')[1]).html());
                $('#tblTempGPS tbody').html('');
                if ($(this).attr('boun') != "0") {
                    var vs = $(this).attr('boun').split('½');
                    $.each(vs, function (i, j) {
                        $('#tblTempGPS tbody').append('<tr><td style="text-align:center;">' + j.split(',')[0] + '</td><td>' + j.split(',')[1] + '</td><td><button class="btn btn-danger rmo"> X </button></td></tr>');
                    });
                }


            });



            $('#txtLat').live('focusout', function (e) {
                e.preventDefault();
                if ($.trim($('#txtLat').val()).indexOf('°') >= 0 && $.trim($('#txtLat').val()).indexOf("'") >= 0 && $.trim($('#txtLat').val()).indexOf('"') >= 0) {
                    var D = $.trim($('#txtLat').val()).split('°')[0];
                    var m = $.trim($('#txtLat').val()).replace(D.toString() + '°', '');
                    var M = m.split("'")[0];
                    var s = $.trim($('#txtLat').val()).replace(D.toString() + '°' + M.toString() + "'", '')
                    var S = s.split('"')[0];

                    //alertG(D + '° ' + M + "' " + S + '"');
                    var res = parseFloat(D) + (parseFloat(M) / 60) + (parseFloat(S) / 3600);
                    $('#txtLat').val(res.toString());
                }
            });


            $('#txtLng').live('focusout', function (e) {
                e.preventDefault();
                if ($.trim($('#txtLng').val()).indexOf('°') >= 0 && $.trim($('#txtLng').val()).indexOf("'") >= 0 && $.trim($('#txtLng').val()).indexOf('"') >= 0) {
                    var D = $.trim($('#txtLng').val()).split('°')[0];
                    var m = $.trim($('#txtLng').val()).replace(D.toString() + '°', '');
                    var M = m.split("'")[0];
                    var s = $.trim($('#txtLng').val()).replace(D.toString() + '°' + M.toString() + "'", '')
                    var S = s.split('"')[0];

                    //alertG(D + '° ' + M + "' " + S + '"');
                    var res = parseFloat(D) + (parseFloat(M) / 60) + (parseFloat(S) / 3600);
                    $('#txtLng').val(res.toString());
                }
            });

            $('#btnAddGPSTemp').live('click', function (e) {
                e.preventDefault();
                if ($.trim($('#txtLat').val()) == "" || $.trim($('#txtLng').val()) == "") {
                    alertR('Enter valid GPS..!');
                    return false;
                }
                $('#tblTempGPS tbody').append('<tr><td style="text-align:center;">' + $('#txtLat').val() + '</td><td>' + $('#txtLng').val() + '</td><td><button class="btn btn-danger rmo"> X </button></td></tr>');
                $('#txtLat').val('');
                $('#txtLng').val('');
            });
            $('.rmo').live('click', function (e) {
                e.preventDefault();
                //alertB('ASDF');
                $(this).parent().parent().remove();
            });

            $(function () {
                $('#dvGPS').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 630,
                    width: 555,

                    show: {
                        effect: "clip",
                        duration: 500
                    },
                    hide: {
                        effect: "clip",
                        duration: 500
                    }
                });
            });
            $('.btnImage').live('click', function (e) {
                e.preventDefault();
                $('#Upload-KMZ').val($(this).attr('tag'));
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=29ǁ" + $(this).attr('tag'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $('#dvOOSCDisplay').html(jd[0].oosc);
                        $('#dvKMZUP').dialog('open');
                    }
                });

               
                
                //$('#atag2').html($(this).attr('nm'));
                
            });
       
            $('.clsEdit').live('click', function (e) {
                e.preventDefault();
                var $this = $(this);
                $('#btnSave').val($this.attr('tg')).html('Update');


                $('#txtDate').val($this.attr('dt'));
                $('#txtSlum').val($this.attr('vl'));
                $('#toTop').click();

            });
            $('.clsDelete').live('click', function (e) {
                e.preventDefault();
                alertR('Dont have permission to delete..!');
            });
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                $('#btnSave').val('0').html('Save');
                $('#txtSlum').val('');



            });
            $(function () {
                $('#dvKMZUP').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 340,
                    width: 700,

                    show: {
                        effect: "clip",
                        duration: 500
                    },
                    hide: {
                        effect: "clip",
                        duration: 500
                    }
                });
            });
            //$('.btnKMZ').live('click', function (e) {
            //    e.preventDefault();
            //    $('#dvKMZUP').dialog('open');
            //    $('#Upload-KMZ').val($(this).attr('tag'));
            //    $('#atag2').html($($(this).parent().parent().find('td')[1]).html());
            //});
            $('#Upload-KMZ').live('click', function (e) {
                e.preventDefault();
                var uploadfiles = $("#FileKMZ").get(0);
                var uploadedfiles = uploadfiles.files
                if (uploadedfiles.length > 0) {

                    var ctrlVals = $('#Upload-KMZ').val();

                    var fromdata = new FormData();
                    fromdata.append("vls", ctrlVals);
                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                    var ex = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
                    $('.btnKMZD[tag=' + $('#Upload-KMZ').val() + ']').attr('ext', "." + ex);
                    var choice = {};
                    choice.url = "UploadOOSC_Photo.ashx";
                    choice.type = "POST";
                    choice.data = fromdata;
                    choice.contentType = false;
                    choice.processData = false;
                    choice.success = function (result) {
                        alertG(result);
                        $('#dvKMZUP').dialog('close');
                    };
                    choice.error = function (err) {
                        alertR(err.statusText);
                    };
                    $.ajax(choice);


                }
                else {
                    alertR('Attach Photo file..!')
                }


            });


            $('.imgD').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr('b') != "0") {
                    window.location = "ghEFS.ashx/?ID=18ǁ" + $(this).attr('ext');

                }
                else {
                    alertR("No Image Attached..!");
                }
            });
            $('.btnKMZD').live('click', function (e) {
                e.preventDefault();
                window.location = "ghEFS.ashx/?ID=17ǁ" + $(this).attr('tag') + $(this).attr('ext');
            });
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
