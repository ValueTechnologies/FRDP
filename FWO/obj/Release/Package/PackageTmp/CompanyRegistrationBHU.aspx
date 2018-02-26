<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="CompanyRegistrationBHU.aspx.cs" Inherits="FRDP.CompanyRegistrationBHU" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--==================--%>
    <style type="text/css">
        .form-row input, .form-row textarea, .form-row select {
            width: 86%;
        }

        .txtcs {
            width: 200px;
        }

        .auto-style1 {
            height: 30px;
        }
    </style>
    <div id="BE" class="modal hide fade" style="display: none;">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span class="icon12 minia-icon-close"></span></button>
            <h3 id="BEtitle">GPS MAP</h3>
        </div>
        <div class="modal-body">
            <div id="BEbody" class="paddingT15 paddingB15">
                <%--///////////////--%>

                <div id="dvlMap" title="MAP">
                    <div class="inner" style="margin: 0; background: #808080; padding: 10px; border: 0; zoom: 1; width: 501px; border-radius: 15px;">
                        <div id="mapCanvas" style="border-radius: 15px; width: 500px; height: 400px;"></div>
                    </div>
                    <div id="infoPanel">
                        <table style="line-height: 12px; border-width: thin; font-size: smaller; border-spacing: 0px; width: 501px; margin-left: 9px;">
                            <tr>
                                <td>Marker status:</td>
                                <td style="text-align: right;">
                                    <div id="markerStatus"><i>Click and drag the marker.</i></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Current position:</td>
                                <td style="text-align: right;">
                                    <div id="infoll"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Closest address:</td>
                                <td style="text-align: right;">
                                    <div id="address"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--/////////////////--%>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
        </div>
    </div>




    <%--*******************************************************--%>
    <%--*******************************************************--%>

    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Registration</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">

                                <table style="width: 95%; margin-left: 25px;">
                                    <tr>
                                        <td style="width: 20%;">DSU Office</td>
                                        <td>
                                            <select id="ddlServiceArea" style="width: 90%;">
                                            </select></td>
                                        <td rowspan="4" colspan="2" style="text-align: right;">
                                            <img id="imgprvw" src="Images/no-image-available-hi.png" class="image" style="width: 135px; height: 135px; margin-right: 40px;" /></td>
                                    </tr>
                                    <tr>
                                        <td>Office Name</td>
                                        <td>
                                            <input id="txtCompanyName" type="text" class="txtcs frmCtrl" title=" New Basic Health Unit Name " />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Abbreviation 
                                        </td>
                                        <td>
                                            <input id="txtAbbreviation" type="text" class="txtcs frmCtrl" title=" Abbreviation of the Basic Health Unit " />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone #
                                        </td>
                                        <td>
                                            <input id="txtPhone" type="text" class="txtcs frmCtrl" title=" Land line number of the Basic Health Unit " />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Email Address
                                        </td>
                                        <td>
                                            <input id="txtEmail" type="text" class="txtcs frmCtrl" title=" Official Email address of the Basic Health Unit " />
                                        </td>

                                        <td style="width: 20%;">Photo</td>
                                        <td>
                                            <input type="file" id="fileUpload" name="filUpload" style="width: 100%;" onchange="showimagepreview(this);" />
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Establishment Year</td>
                                        <td>
                                            <input id="txtEstablishmentYear" type="text" class="txtcs frmCtrl" title=" Establishment year of the Basic Health Unit " />
                                        </td>
                                        <td>Website URL</td>
                                        <td><input id="txtWebsite" type="text" class="txtcs frmCtrl" title="Basic Health Unit website address (if any) " /></td>
                                    </tr>

                                    <tr>
                                        <td>Tehsil</td>
                                        <td>
                                            <select id="ddlGeoTehsil"  style="width: 90%;">
                                                <option></option>
                                            </select>
                                        </td>
                                        <td>UC</td>
                                        <td>
                                            <select id="ddlGeoFeildUnit" name="D6" style="width: 250px; display: none;"></select>
                                            <select id="ddlGeoUnionConcil" name="D1" style="width: 89%;"></select>
                                        </td>
                                    </tr>
                                    <tr>
                                                                                <td>Village</td>
                                        <td>
                                            <select id="ddlGeoUnionVillage" class="vl frmCtrl" name="D1" style="width: 90%;"></select>
                                        </td>

                                                                                <td>GPS
                                        </td>
                                        <td>
                                            <input class="txtcs frmCtrl" id="txtGPS" type="text" title="Click on this and get Map" />
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>Address
                                        </td>
                                        <td colspan="3">
                                                <textarea id="txtAddress" title="Basic Health Unit address" cols="20" rows="2" class="txtcs frmCtrl" style="margin-bottom: 10px; height: 82px; width: 94%;"></textarea>
                                        </td>
                                    </tr>

                                    <tr>
<td></td><td></td>
                                        <td></td>
                                        <td style="text-align:right;"><button id="btnSave" type="button" value="0" class="btn btn-info frmCtrl" style="margin-right: 2px;">Save</button><button id="btnCancel" type="button" value="Cancel" class="btn" style="margin-right: 8%;">Cancel</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>All Registered Basic Health Units</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">

                                <div class="form-row row-fluid">
                                    <div class="span12">
                                        <table id="tbCompanies" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                                            <thead>
                                                <tr>
                                                    <td>Name
                                                    </td>
                                                    <td>Abbreviation
                                                    </td>
                                                    <td>Phone No
                                                    </td>
                                                    <td>Email
                                                    </td>
                                                    <td>Establishment Year
                                                    </td>
                                                    <td>Address
                                                    </td><td>GPS
                                                    </td><td></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%--*******************************************************--%>
    <%--*******************************************************--%>


            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript">

            $(document).keypress(function (e) {
                if (e.keyCode === 13) {
                    e.preventDefault();
                    return false;
                }
            });
            function showimagepreview(input) {
                if (input.files && input.files[0]) {
                    var filerdr = new FileReader();
                    filerdr.onload = function (e) {
                        $('#imgprvw').attr('src', e.target.result);
                        $('#imgprvw').show();
                    }
                    filerdr.readAsDataURL(input.files[0]);
                }
            }

            var geocoder = new google.maps.Geocoder();

            $(document).ready(function () {


                $(function () {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=47ǁ",
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                            });
                            $('#ddlServiceArea').html(opt);
                            LoadAllCompanies();
                            BindTehsil();
                        }
                    });
                });
                $('#ddlServiceArea').live('change', function () {
                    LoadAllCompanies();
                    BindTehsil();
                });
                $('.heading h3').html('Basic Health Unit Registration');
                //$('#BE').dialog({ autoOpen: false, modal: true, show: "blind", hide: "blind" });

                //getRegion();

               



                

               




                //$('#txtEstablishmentYear').mask('0000');
                

                $('#btnSave').bind('click', function (e) {
                    e.preventDefault();
                    if ($.trim($('#txtCompanyName').val()) == "") {
                        alertR('Enter Name ...!');
                        return false;
                    }
                    var ctrlVals = "";
                    $('.frmCtrl').each(function (index, element) {
                        ctrlVals += $(this).val() + '½';
                    });


                    var uploadfiles = $("#fileUpload").get(0);
                    var Is_FileUpload = "";
                    var uploadedfiles = uploadfiles.files;
                    var fromdata = new FormData();
                    fromdata.append("vls", ctrlVals);
                    fromdata.append('areas', $('#ddlServiceArea').val());

                    for (var i = 0; i < uploadedfiles.length; i++) {
                        fromdata.append(uploadedfiles[i].name, uploadedfiles[i]);
                        Is_FileUpload = "1";
                    }

                    var choice = {};
                    choice.url = "CompanyRegBHUCS.ashx";
                    choice.type = "POST";
                    choice.data = fromdata;
                    choice.contentType = false;
                    choice.processData = false;
                    choice.success = function (result) {
                        alertG(result);
                        LoadAllCompanies();
                        $('.txtcs').val('');
                        if ($.browser.msie) {
                            $('#fileUpload').replaceWith($('#fileUpload').clone());
                        }
                        else {
                            $('#fileUpload').val('');
                        }
                        $('#fileUpload').html('');
                        $('#btnSave').val('0');
                        $('#btnSave').html('Save');
                        $('#imgprvw').attr('src', 'Images/no-image-available-hi.png');
                    };
                    choice.error = function (err) {
                        alertR(err.statusText);
                    };
                    $.ajax(choice);

                });

                $('#btnCancel').live('click', function (e) {
                    e.preventDefault();
                    $('.txtcs').val('');
                    if ($.browser.msie) {
                        $('#fileUpload').replaceWith($('#fileUpload').clone());
                    }
                    else {
                        $('#fileUpload').val('');
                    }
                    $('#fileUpload').html('');
                    $('#btnSave').val('0');
                    $('#btnSave').html('Save');
                    $('#imgprvw').attr('src', 'Images/no-image-available-hi.png');
                });

                function LoadAllCompanies() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "CompanyRegistrationBHU.aspx/AllCompaniesList",
                        data: "{'DSU':'" + $('#ddlServiceArea').val() + "'}",
                        async: false,
                        success: function (responseText) {
                            var jData = $.parseJSON(responseText.d), out = "";
                            $.each(jData, function (i, item) {
                                out = out + '<tr><td style="text-align:left;">' + item.CompanyName + ' </td> <td style="text-align:left;"> ' + item.CompanyAbbrivation + '</td> <td style="text-align:left;"> ' + item.CompanyPhoneNo + '</td> <td style="text-align:left;">' + item.CompanyEmail + ' </td> <td style="text-align:right;">' + item.CompanyEstablishmentYear + ' </td><td style="text-align:left;">' + item.CompanyAddress + ' </td><td style="text-align:left;">' + item.GPS + ' </td>\
<td>\
                                          <a tg="' + item.CompanyID + '" class="tip edt" title="Edit DSU"><span class="icon12 icomoon-icon-pencil"></span></a>\
                                          <a tg="' + item.CompanyID + '" class="tip del" title="Remove DSU"><span class="icon12 icomoon-icon-remove"></span></a>\
                                      </td></tr>';
                            });
                            $("#tbCompanies tbody").html(out);
                            $("#tbCompanies").show();
                        }
                    });
                }


                $().mask("a*@a*.a*");

                $('#txtGPS').live('click', function () {
                    //alert("Getting GPS...");
                    if ($.trim($(this).val()) == "") {
                        $('#BE').modal("toggle");
                        initialize();
                    }
                });

                $('.del').live('click', function (e) {
                    e.preventDefault();
                    alertR('Access Denied..!');
                })
                $('.edt').live('click', function (e) {
                    e.preventDefault();

                    var cmpid = $(this).attr('tg');
                    $('#btnSave').val(cmpid);
                    $('#btnSave').html('Update');
                    $.ajax({
                        type: "POST",
                        url: "EmpReg.ashx/?ID=52ǁ" + cmpid,
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $('#txtCompanyName').val(jd[0].CompanyName);
                            $('#txtAbbreviation').val(jd[0].CompanyAbbrivation);
                            $('#txtPhone').val(jd[0].CompanyPhoneNo);
                            $('#txtEmail').val(jd[0].CompanyEmail);
                            $('#txtEstablishmentYear').val(jd[0].CompanyEstablishmentYear);
                            $('#txtWebsite').val(jd[0].CompanyWebsite);
                            $('#txtAddress').val(jd[0].CompanyAddress);
                            $('#txtGPS').val(jd[0].GPS);
                            $('#imgprvw').attr('src', jd[0].CompanyLogo);

                            //$('#ddlGeoTehsil').val(jd[0].TehsilID);
                            //SETBindFU(jd[0].FeildUnitID, jd[0].UnionConcilID, jd[0].TblVillageCity);

                            $('#toTop').click();
                            //alertR('Access Denied..!');
                        }
                    });
                });

                function SETBindFU(obj, obj1, obj2) {
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
                            $("#ddlGeoFeildUnit").val(obj)
                            SETBindUC(obj1, obj2);
                        }
                    });
                }

                function SETBindUC(obj, obj1) {
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
                            $("#ddlGeoUnionConcil").val(obj);
                            SETBindVillage(obj1)
                        }
                    });
                }
                function SETBindVillage(obj) {
                    $.ajax({
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        url: "LocationNew.aspx/BindVillage",
                        data: "{'ID':'" + $("#ddlGeoUnionConcil").val() + "'}",
                        async: false,
                        success: function (responseText) {
                            var jdata = $.parseJSON(responseText.d), output = "";
                            $("#ddlGeoUnionVillage").html(jdata.village);
                            $("#ddlGeoUnionVillage").val(obj);
                        }
                    });

                }


                //////////////////////////GET GPS
                //////////////////////////GET GPS
                function geocodePosition(pos) {
                    geocoder.geocode({
                        latLng: pos
                    }, function (responses) {
                        if (responses && responses.length > 0) {
                            updateMarkerAddress(responses[0].formatted_address);
                        } else {
                            updateMarkerAddress('Cannot determine address at this location.');
                        }
                    });
                }

                function updateMarkerStatus(str) {
                    $('#markerStatus').html(str);
                }

                function updateMarkerPosition(latLng) {
                    var posi = [latLng.lat(), latLng.lng()].join(', ');
                    $('#txtGPS').val(posi);
                    $('#infoll').html(posi);
                    //UploaderVisibility();
                }

                function updateMarkerAddress(str) {
                    $('#address').html(str);
                    //   $(".gmnoprint[title]").attr('title', str);
                }


                function LoadTargetMap(obj) {

                    var latLng = new google.maps.LatLng(obj[0], obj[1]);
                    //var latLng = new google.maps.LatLng(33.6686934, 72.9986465);
                    var map = new google.maps.Map($('#mapCanvas')[0], {
                        zoom: 16,
                        center: latLng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    });
                    var marker = new google.maps.Marker({
                        position: latLng,
                        title: 'Click the marker and drag it to exact position to get actual GPS',
                        map: map,
                        draggable: true,
                        icon: 'Images/gmap-markerUNDP.png'
                    });

                    // Update current position info.
                    updateMarkerPosition(latLng);
                    geocodePosition(latLng);

                    // Add dragging event listeners.
                    google.maps.event.addListener(marker, 'dragstart', function () {
                        updateMarkerAddress('Dragging...');
                    });

                    google.maps.event.addListener(marker, 'drag', function () {
                        updateMarkerStatus('Dragging...');
                        updateMarkerPosition(marker.getPosition());
                    });

                    google.maps.event.addListener(marker, 'dragend', function () {
                        updateMarkerStatus('Drag ended');
                        geocodePosition(marker.getPosition());
                    });
                }

                function initialize() {

                    //alert('1');
                    var ss = "30.214570, 66.990085".split(', ');

                    //----------------------------------


                    geocoder.geocode({
                        address: $("#ddlGeoTehsil option:selected").text() + ' ' + $("#ddlGeoUnionConcil option:selected").text() + ' Pakistan',

                        region: 'no'
                    },
                        function (results, status) {
                            //alert($("#ddlGeoUnionConcil option:selected").text() + ' Pakistan');

                            if (status.toLowerCase() == 'ok') {
                                ss = [];
                                var coords = new google.maps.LatLng(
                                    results[0]['geometry']['location'].lat(),
                                    results[0]['geometry']['location'].lng()
                                );


                                ss.push(coords.lat());
                                ss.push(coords.lng());
                                LoadTargetMap(ss);

                            }
                            else {
                                //******************************
                                geocoder.geocode({
                                    address: $("#ddlGeoTehsil option:selected").text() + ' ' + $("#ddlGeoUnionConcil option:selected").text() + ' Pakistan',
                                    region: 'no'
                                },
                       function (results, status) {
                           if (status.toLowerCase() == 'ok') {
                               ss = [];
                               var coords = new google.maps.LatLng(
                                   results[0]['geometry']['location'].lat(),
                                   results[0]['geometry']['location'].lng()
                               );


                               ss.push(coords.lat());
                               ss.push(coords.lng());
                               LoadTargetMap(ss);
                           }
                           else {
                               ss = "30.3894007, 69.3532207".split(', ');
                               LoadTargetMap(ss);
                           }
                       });
                                //******************************
                            }
                        });
                }
                ///////////////////////////////////////////////////////////End Get GPS
                //////////////////////////GET GPS END


                
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
                        }
                    });
                }
                function BindTehsil() {
                    $.ajax({
                        type: "POST",
                        url: "EmpReg.ashx/?ID=51ǁ" + $("#ddlServiceArea").val(),
                        success: function (response) {
                            var jdata = $.parseJSON(response), output = "";
                            $("#ddlGeoTehsil").html(jdata.Tehsil);
                            $("#ddlGeoFeildUnit").html(jdata.FU);
                            $("#ddlGeoUnionConcil").html(jdata.UC);
                            $("#ddlGeoUnionVillage").html(jdata.village);
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
                        }
                    });
                }
                function BindVillage() {
                    $.ajax({
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        url: "LocationNew.aspx/BindVillage",
                        data: "{'ID':'" + $("#ddlGeoUnionConcil").val() + "'}",
                        async: false,
                        success: function (responseText) {
                            var jdata = $.parseJSON(responseText.d), output = "";
                            $("#ddlGeoUnionVillage").html(jdata.village);
                        }
                    });

                }



            });
    </script>
</asp:Content>
