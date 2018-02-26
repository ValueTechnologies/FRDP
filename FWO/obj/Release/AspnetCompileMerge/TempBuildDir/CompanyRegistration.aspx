<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="CompanyRegistration.aspx.cs" Inherits="FRDP.CompanyRegistration" %>

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
                        <span>Office Registration</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">

                                <table style="width: 95%; margin-left: 25px;">
                                    <tr>
                                        <td style="width: 20%;">Head Office</td>
                                        <td>
                                            <select id="ddlServiceArea" style="width: 90%;">
                                            </select></td>
                                        <td rowspan="4" colspan="2" style="text-align: right;">
                                            <img id="imgprvw" src="Images/no-image-available-hi.png" class="image" style="width: 135px; height: 135px; margin-right: 40px;" /></td>
                                    </tr>
                                    <tr>
                                        <td>Office Name</td>
                                        <td>
                                            <input id="txtCompanyName" type="text" class="txtcs frmCtrl" title=" New District Support Unit Name " />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Abbreviation 
                                        </td>
                                        <td>
                                            <input id="txtAbbreviation" type="text" class="txtcs frmCtrl" title=" Abbreviation of the District Support Unit " />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone #
                                        </td>
                                        <td>
                                            <input id="txtPhone" type="text" class="txtcs frmCtrl" title=" Landline number of the District Support Unit " />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Email Address
                                        </td>
                                        <td>
                                            <input id="txtEmail" type="text" class="txtcs frmCtrl" title=" Official Email address of the District Support Unit " />
                                        </td>

                                        <td style="width: 20%;">Photo</td>
                                        <td>
                                            <input type="file" id="fileUpload" name="filUpload" style="width: 100%;" onchange="showimagepreview(this);" />
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Establishment Year</td>
                                        <td>
                                            <input id="txtEstablishmentYear" type="text" class="txtcs frmCtrl" title=" Establishment year of the District Support Unit " />
                                        </td>
                                        <td>Website URL</td>
                                        <td><input id="txtWebsite" type="text" class="txtcs frmCtrl" title="District Support Unit website address (if any) " /></td>
                                    </tr>

                                    <tr>
                                        <td>Region</td>
                                        <td>
                                            <select id="ddReg" class="vl frmCtrl"  style="width: 90%;">
                                                <option></option>
                                            </select>
                                        </td>
                                        <td>District</td>
                                        <td>
                                            <select id="ddDistt" class="vl frmCtrl" name="D1" style="width: 90%;"></select>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>Address
                                        </td>
                                        <td colspan="3">
                                                <textarea id="txtAddress" title="Company head Office address" cols="20" rows="2" class="txtcs frmCtrl" style="margin: 0px; height: 82px; width: 94.5%;"></textarea>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>GPS
                                        </td>
                                        <td>
                                            <input class="txtcs frmCtrl" id="txtGPS" type="text" title="Click on this and get Map" />
                                        </td>
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
                        <span>All Registered Offices</span>
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
                                                    <td>Office Name
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
                                                    </td>
                                                    <td>Type
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
            $('#txtAddress').keydown(function (e) {
                if (e.keyCode == 222)
                    e.preventDefault();
                e.stopPropagation();
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
                        url: "inv.ashx/?ID=16ǁ",
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<option value="' + itm.CompanyID + '" lvl="' + itm.lvl + '">' + itm.CompanyName + '</option>';
                            });
                            $('#ddlServiceArea').html(opt);
                        }
                    });
                });

                $('.heading h3').html('Office Registration');
                //$('#BE').dialog({ autoOpen: false, modal: true, show: "blind", hide: "blind" });

                getRegion();

                function getRegion() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "CompanyRegistration.aspx/getlocRegion",
                        data: "{}",
                        async: false,
                        success: function (responseText) {
                            var jData = $.parseJSON(responseText.d), out = "";
                            $.each(jData, function (i, item) {
                                out = out + '<option value="' + item.LocID + '">' + item.LocName + '</option>';
                            });
                            $('#ddReg').html(out);
                            $('#ddReg').prev().html($('#ddReg option:selected').text());
                            getDistt();
                        }
                    });
                }



                function getDistt() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "CompanyRegistration.aspx/getlocDistrict",
                        data: "{'TypeID':'" + $('#ddReg').val() + "'}",
                        async: false,
                        success: function (responseText) {
                            var jData = $.parseJSON(responseText.d), out = "";
                            $.each(jData, function (i, item) {
                                out = out + '<option value="' + item.LocID + '">' + item.LocName + '</option>';
                            });
                            $('#ddDistt').html(out);
                            //$('#ddDistt').prev().html($('#ddDistt option:selected').text());
                        }
                    });
                }

                function setDistt(obj) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "CompanyRegistration.aspx/getlocDistrict",
                        data: "{'TypeID':'" + $('#ddReg').val() + "'}",
                        async: false,
                        success: function (responseText) {
                            var jData = $.parseJSON(responseText.d), out = "";
                            $.each(jData, function (i, item) {
                                out = out + '<option value="' + item.LocID + '">' + item.LocName + '</option>';
                            });
                            $('#ddDistt').html(out);
                            $('#ddDistt').val(obj);

                        }
                    });
                }


                $('#ddReg').bind('change', function () {
                    getDistt();
                });

                //$('#txtEstablishmentYear').mask('0000');
                LoadAllCompanies();

                $('#btnSave').bind('click', function (e) {
                    e.preventDefault();
                    if ($.trim($('#txtCompanyName').val())=="") {
                        alertR('Enter Office Name ...!');
                        return false;
                    }
                    if ($.trim($('#txtAbbreviation').val()) == "") {
                        alertR('Enter Office Abbreviation ...!');
                        return false;
                    }
                    if ($.trim($('#txtPhone').val()) == "") {
                        alertR('Enter Phone # ...!');
                        return false;
                    }
                    if ($.trim($('#txtEmail').val()) == "") {
                        alertR('Enter Email Address ...!');
                        return false;
                    }
                    if ($.trim($('#txtEstablishmentYear').val()) == "") {
                        alertR('Enter Establishment Year ...!');
                        return false;
                    }
                    if ($.trim($('#txtAddress').val()) == "") {
                        alertR('Enter Address ...!');
                        return false;
                    }
                    if ($.trim($('#txtGPS').val()) == "") {
                        alertR('Enter GPS ...!');
                        return false;
                    }

                    var ctrlVals = "";
                    $('.frmCtrl').each(function (index, element) {
                        ctrlVals += $(this).val() + '½';
                    });
                    ctrlVals += $('option:selected', '#ddlServiceArea').attr('lvl') + '½';
                    ctrlVals += $('option:selected', '#ddlServiceArea').text() + '½';

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
                    choice.url = "CompanyRegCS.ashx";
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
                        url: "CompanyRegistration.aspx/AllCompaniesList",
                        data: "{}",
                        async: false,
                        success: function (responseText) {
                            var jData = $.parseJSON(responseText.d), out = "";
                            $.each(jData, function (i, item) {
                                out = out + '<tr><td style="text-align:left;">' + item.CompanyName + ' </td> <td style="text-align:left;"> ' + item.CompanyAbbrivation + '</td> <td style="text-align:left;"> ' + item.CompanyPhoneNo + '</td> <td style="text-align:left;">' + item.CompanyEmail + ' </td> <td style="text-align:right;">' + item.CompanyEstablishmentYear + ' </td><td style="text-align:left;">' + item.CompanyAddress + ' </td><td style="text-align:left;">' + item.Type + ' </td>\
<td>\
                                          <a tg="' + item.CompanyID + '" class="tip edt" title="Edit"><span class="icon12 icomoon-icon-pencil"></span></a>\
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

                //$('.del').live('click', function (e) {
                //    e.preventDefault();
                //    alertR('Access Denied..!');
                //});

                $('.edt').live('click', function (e) {
                    e.preventDefault();

                    var cmpid = $(this).attr('tg');
                    $('#btnSave').val(cmpid);
                    $('#btnSave').html('Update');
                    $.ajax({
                        type: "POST",
                        url: "EmpReg.ashx/?ID=50ǁ"+cmpid,
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
                            $('#ddReg').val(jd[0].RegionID);
                            setDistt(jd[0].RegionID);
                            $('#toTop').click();
                            //alertR('Access Denied..!');
                        }
                    });
                })
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
                        address: $("#ddReg option:selected").text() + ' ' + $("#ddDistt option:selected").text() + ' Pakistan',

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
                                    address: $("#ddReg option:selected").text() + ' ' + $("#ddDistt option:selected").text() + ' Pakistan',
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






            });
    </script>
</asp:Content>
