<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="SlumBoundarySelection.aspx.cs" Inherits="FRDP.SlumBoundarySelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Select Slum</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 9%; margin-right: 10%;">
                        <tbody>
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
                                        <%--                                        <option value="2">SINDH</option>--%>
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

                                <td>Union Concil</td>
                                <td>
                                    <select id="ddlGeoFeildUnit" name="D6" style="width: 250px; display: none;"></select>
                                    <select id="ddlGeoUnionConcil" name="D7" style="width: 250px"></select>
                                </td>
                                <td>Slum Name</td>
                                <td>
                                    <select id="ddSlum" class="frm" style="width: 250px;">
                                    </select>
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
                        <span>Slum Boundary Identification</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <div class="panel">
                        <div id="color-palette"></div>

                    </div>
                    <div id="map"></div>
                    <div class="panel">
                        <div style="float: right;">

                            <button id="delete-button" class="btn btn-info">Reset Map</button>&nbsp;
                            <button id="Save-button" class="btn btn-info">Save Boundary</button>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>
    <style type="text/css">
        #map {
            padding: 0px;
            margin: 4px;
            width: 99%;
            height: 700px;
            border: 2px solid #C4C4C4;
        }

        .panel {
            width: 98%;
            font-family: Arial, sans-serif;
            font-size: 13px;
            float: right;
            margin: 10px;
        }

        #color-palette {
            clear: both;
        }

        .color-button {
            width: 14px;
            height: 14px;
            font-size: 0;
            margin: 5px;
            float: left;
            cursor: pointer;
        }

        #tblAnimals > tbody > tr > td {
            text-align: left !important;
        }
    </style>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=drawing"></script>
    <script type="text/javascript">




        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {

            $('#Save-button').live('click', function (e) {
                e.preventDefault();

            })

            //******************************************
            var drawingManager;
            var selectedShape;
            var colors = ['#FF0000', '#1E90FF', '#FF1493', '#32CD32', '#FF8C00', '#4B0082', '#FFEB3B'];
            var selectedColor;
            var colorButtons = {};

            function clearSelection() {
                if (selectedShape) {
                    selectedShape.setEditable(false);
                    selectedShape = null;
                }
            }

            function setSelection(shape) {
                clearSelection();
                selectedShape = shape;
                shape.setEditable(true);
                selectColor(shape.get('fillColor') || shape.get('strokeColor'));
            }

            function deleteSelectedShape() {
                if (selectedShape) {
                    selectedShape.setMap(null);
                }
                else {
                    alertR("Please Select Shape...!");
                }
            }
            function SaveselectedShape() {
                if ($('#ddSlum').val() == "" || $('#ddSlum').val() == undefined || $('#ddSlum').val() == null) {
                    alertR('Select Slum plz..!');
                    return false;
                }
                if (selectedShape) {
                    var polygonBounds = selectedShape.getPath();
                    var coordinates = [];
                    var $vari = "";
                    for (var i = 0 ; i < polygonBounds.length ; i++) {
                        coordinates.push(polygonBounds.getAt(i).lat(), polygonBounds.getAt(i).lng());
                        $vari += (polygonBounds.getAt(i).lat()).toString() + "," + (polygonBounds.getAt(i).lng()).toString() + "½";
                    }
                    $vari += "¼";
                    $vari = $vari.replace('½¼', '');
                    //console.log($vari);
                    $.ajax({
                        type: "POST",
                        url: "ghEFS.ashx/?ID=14ǁ" + $vari + "ǁ" + $('#ddSlum').val(),
                        success: function (response) {
                            alertG('Boundary Saved..!');
                        }
                    });
                }
                else {
                    alertR("Please Select Shape...!");
                }
            }
            function selectColor(color) {
                selectedColor = color;
                for (var i = 0; i < colors.length; ++i) {
                    var currColor = colors[i];
                    colorButtons[currColor].style.border = currColor == color ? '2px solid #789' : '2px solid #fff';
                }

                // Retrieves the current options from the drawing manager and replaces the
                // stroke or fill color as appropriate.
                var polylineOptions = drawingManager.get('polylineOptions');
                polylineOptions.strokeColor = color;
                drawingManager.set('polylineOptions', polylineOptions);

                var rectangleOptions = drawingManager.get('rectangleOptions');
                rectangleOptions.fillColor = color;
                drawingManager.set('rectangleOptions', rectangleOptions);

                var circleOptions = drawingManager.get('circleOptions');
                circleOptions.fillColor = color;
                drawingManager.set('circleOptions', circleOptions);

                var polygonOptions = drawingManager.get('polygonOptions');
                polygonOptions.fillColor = color;
                drawingManager.set('polygonOptions', polygonOptions);
            }

            function setSelectedShapeColor(color) {
                if (selectedShape) {
                    if (selectedShape.type == google.maps.drawing.OverlayType.POLYLINE) {
                        selectedShape.set('strokeColor', color);
                    } else {
                        selectedShape.set('fillColor', color);
                    }
                }
            }

            function makeColorButton(color) {
                var button = document.createElement('span');
                button.className = 'color-button';
                button.style.backgroundColor = color;
                google.maps.event.addDomListener(button, 'click', function () {
                    selectColor(color);
                    setSelectedShapeColor(color);
                });

                return button;
            }

            function buildColorPalette() {
                if ($('#color-palette').html() != "") {
                    return false;
                }
                var colorPalette = document.getElementById('color-palette');
                for (var i = 0; i < colors.length; ++i) {
                    var currColor = colors[i];
                    var colorButton = makeColorButton(currColor);
                    colorPalette.appendChild(colorButton);
                    colorButtons[currColor] = colorButton;
                }
                selectColor(colors[0]);
            }

            var geocoder = new google.maps.Geocoder();
            function initialize() {

                //var ss = "30.3894007, 69.3532207".split(', ');
                //geocoder.geocode({
                //    address: $("#ddlGeoRegion option:selected").text() + ' ' + $("#ddlGeoUnionConcil option:selected").text() + ' Pakistan',

                //    region: 'no'
                //},
                //    function (results, status) {
                //        if (status.toLowerCase() == 'ok') {
                //            ss = [];
                //            var coords = new google.maps.LatLng(
                //                results[0]['geometry']['location'].lat(),
                //                results[0]['geometry']['location'].lng()
                //            );


                //            ss.push(coords.lat());
                //            ss.push(coords.lng());
                //            LoadTargetMap(ss);

                //        }
                //        else {
                //            geocoder.geocode({
                //                address: $("#ddlGeoRegion option:selected").text() + ' ' + $("#ddlGeoDestrict option:selected").text() + ' Pakistan',
                //                region: 'no'
                //            },
                //   function (results, status) {
                //       if (status.toLowerCase() == 'ok') {
                //           ss = [];
                //           var coords = new google.maps.LatLng(
                //               results[0]['geometry']['location'].lat(),
                //               results[0]['geometry']['location'].lng()
                //           );


                //           ss.push(coords.lat());
                //           ss.push(coords.lng());
                //           LoadTargetMap(ss);
                //       }
                //       else {
                //           ss = "30.3894007, 69.3532207".split(', ');
                //           LoadTargetMap(ss);
                //       }
                //   });

                //        }
                //    });

                var slm = "0";
                if ($('#ddSlum').val() != null || $('#ddSlum').val() != undefined) {
                    slm = $('#ddSlum').val();
                }
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=16ǁ" + slm,
                    success: function (response) {
                        var jd = $.parseJSON(response);
                        var x11 = "-1", y11 = "-1";
                        try {
                            x11 = jd[0].b;
                            y11 = jd[0].s;
                        } catch (e) {
                            x11 = "-1";
                            y11 = "-1";
                        }

                        if (x11 == "-1" && y11 == "-1") {
                            //**************************************************************************************
                            var ss = "30.3894007, 69.3532207".split(', ');

                            //----------------------------------


                            geocoder.geocode({
                                address: $("#ddlGeoDestrict option:selected").text() + ' ' + $("#ddlGeoTehsil option:selected").text() + ' Pakistan',

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
                                            address: $("#ddlGeoRegion option:selected").text() + ' ' + $("#ddlGeoDestrict option:selected").text() + ' Pakistan',
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
                            //**************************************************************************************
                        }
                        else {

                            //console.log(jd[0].b);
                            LoadTargetMapWithShape(jd[0]);
                        }

                    }
                });
            }

            function LoadTargetMapWithShape(obj) {
                var map;
                if (obj.b != "-1") {


                    var pnts = [];
                    pnts = obj.b.split('½');
                    var latxx = 0.0, lngxx = 0.0, cnt = 0, triangleCoords = [];

                    $.each(pnts, function (i, j) {
                        cnt++;
                        latxx += parseFloat(j.split(',')[0]);
                        lngxx += parseFloat(j.split(',')[1]);
                        var coo = { lat: parseFloat(j.split(',')[0]), lng: parseFloat(j.split(',')[1]) };
                        triangleCoords.push(coo);
                    });
                    //return false;
                    map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 16,
                        center: new google.maps.LatLng(latxx / cnt, lngxx / cnt),
                        mapTypeId: google.maps.MapTypeId.ROADMAP,//.HYBRID,
                        disableDefaultUI: true,
                        zoomControl: true
                    });

                    var ucbound = new google.maps.Polygon({
                        paths: triangleCoords,
                        strokeColor: '#FF0000',
                        strokeOpacity: 0.8,
                        strokeWeight: 2,
                        //fillColor: '#FF0000',
                        fillOpacity: 0.15
                    });
                    ucbound.setMap(map);

                    if (obj.s != "-1") {
                        var pnts = [];
                        pnts = obj.s.split('½');
                        var latxx = 0.0, lngxx = 0.0, cnt = 0, triangleCoords = [];

                        $.each(pnts, function (i, j) {
                            cnt++;
                            latxx += parseFloat(j.split(',')[0]);
                            lngxx += parseFloat(j.split(',')[1]);
                            var coo = { lat: parseFloat(j.split(',')[0]), lng: parseFloat(j.split(',')[1]) };
                            triangleCoords.push(coo);
                        });

                        var slumbound = new google.maps.Polygon({
                            paths: triangleCoords,
                            strokeColor: '#FFFF00',
                            strokeOpacity: 0.8,
                            strokeWeight: 2,
                            fillColor: '#FFFF00',
                            fillOpacity: 0.05
                        });
                        slumbound.setMap(map);

                    }


                }
                else {
                    var pnts = [];
                    pnts = obj.s.split('½');
                    var latxx = 0.0, lngxx = 0.0, cnt = 0, triangleCoords = [];

                    $.each(pnts, function (i, j) {
                        cnt++;
                        latxx += parseFloat(j.split(',')[0]);
                        lngxx += parseFloat(j.split(',')[1]);
                        var coo = { lat: parseFloat(j.split(',')[0]), lng: parseFloat(j.split(',')[1]) };
                        triangleCoords.push(coo);
                    });
                    //return false;
                    map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 16,
                        center: new google.maps.LatLng(latxx / cnt, lngxx / cnt),
                        mapTypeId: google.maps.MapTypeId.ROADMAP,//.HYBRID,
                        disableDefaultUI: true,
                        zoomControl: true
                    });

                    var slumbound = new google.maps.Polygon({
                        paths: triangleCoords,
                        strokeColor: '#FFFF00',
                        strokeOpacity: 0.8,
                        strokeWeight: 2,
                        fillColor: '#FFFF0000',
                        fillOpacity: 0.15
                    });
                    slumbound.setMap(map);
                }




                var polyOptions = {
                    strokeWeight: 2,
                    fillOpacity: 0.45,
                    editable: true,
                    draggable: true
                };
                // Creates a drawing manager attached to the map that allows the user to draw
                // markers, lines, and shapes.
                drawingManager = new google.maps.drawing.DrawingManager({
                    drawingMode: google.maps.drawing.OverlayType.POLYGON,
                    markerOptions: {
                        draggable: true
                    },
                    polylineOptions: {
                        editable: true,
                        draggable: true
                    },
                    rectangleOptions: polyOptions,
                    circleOptions: polyOptions,
                    polygonOptions: polyOptions,
                    map: map
                });

                google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
                    if (e.type !== google.maps.drawing.OverlayType.MARKER) {
                        // Switch back to non-drawing mode after drawing a shape.
                        drawingManager.setDrawingMode(null);

                        // Add an event listener that selects the newly-drawn shape when the user
                        // mouses down on it.
                        var newShape = e.overlay;
                        newShape.type = e.type;
                        google.maps.event.addListener(newShape, 'click', function (e) {
                            if (e.vertex !== undefined) {
                                if (newShape.type === google.maps.drawing.OverlayType.POLYGON) {
                                    var path = newShape.getPaths().getAt(e.path);
                                    path.removeAt(e.vertex);
                                    if (path.length < 3) {
                                        newShape.setMap(null);
                                    }
                                }
                                if (newShape.type === google.maps.drawing.OverlayType.POLYLINE) {
                                    var path = newShape.getPath();
                                    path.removeAt(e.vertex);
                                    if (path.length < 2) {
                                        newShape.setMap(null);
                                    }
                                }
                            }
                            setSelection(newShape);
                        });
                        setSelection(newShape);
                    }
                });

                // Clear the current selection when the drawing mode is changed, or when the
                // map is clicked.
                google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);
                google.maps.event.addListener(map, 'click', clearSelection);
                //google.maps.event.addDomListener(document.getElementById('delete-button'), 'click', deleteSelectedShape);
                google.maps.event.addDomListener($('#delete-button').live('click', function (e) {
                    e.preventDefault();
                    deleteSelectedShape();
                }));
                google.maps.event.addDomListener($('#Save-button').live('click', function (e) {
                    e.preventDefault();
                    SaveselectedShape();
                }));
                buildColorPalette();
            }
            function LoadTargetMap(obj) {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 16,
                    center: new google.maps.LatLng(obj[0], obj[1]),
                    mapTypeId: google.maps.MapTypeId.ROADMAP,//.HYBRID,
                    disableDefaultUI: true,
                    zoomControl: true
                });

                var polyOptions = {
                    strokeWeight: 2,
                    fillOpacity: 0.45,
                    editable: true,
                    draggable: true
                };
                // Creates a drawing manager attached to the map that allows the user to draw
                // markers, lines, and shapes.
                drawingManager = new google.maps.drawing.DrawingManager({
                    drawingMode: google.maps.drawing.OverlayType.POLYGON,
                    markerOptions: {
                        draggable: true
                    },
                    polylineOptions: {
                        editable: true,
                        draggable: true
                    },
                    rectangleOptions: polyOptions,
                    circleOptions: polyOptions,
                    polygonOptions: polyOptions,
                    map: map
                });

                google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
                    if (e.type !== google.maps.drawing.OverlayType.MARKER) {
                        // Switch back to non-drawing mode after drawing a shape.
                        drawingManager.setDrawingMode(null);

                        // Add an event listener that selects the newly-drawn shape when the user
                        // mouses down on it.
                        var newShape = e.overlay;
                        newShape.type = e.type;
                        google.maps.event.addListener(newShape, 'click', function (e) {
                            if (e.vertex !== undefined) {
                                if (newShape.type === google.maps.drawing.OverlayType.POLYGON) {
                                    var path = newShape.getPaths().getAt(e.path);
                                    path.removeAt(e.vertex);
                                    if (path.length < 3) {
                                        newShape.setMap(null);
                                    }
                                }
                                if (newShape.type === google.maps.drawing.OverlayType.POLYLINE) {
                                    var path = newShape.getPath();
                                    path.removeAt(e.vertex);
                                    if (path.length < 2) {
                                        newShape.setMap(null);
                                    }
                                }
                            }
                            setSelection(newShape);
                        });
                        setSelection(newShape);
                    }
                });

                // Clear the current selection when the drawing mode is changed, or when the
                // map is clicked.
                google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);
                google.maps.event.addListener(map, 'click', clearSelection);
                //google.maps.event.addDomListener(document.getElementById('delete-button'), 'click', deleteSelectedShape);
                google.maps.event.addDomListener($('#delete-button').live('click', function (e) {
                    e.preventDefault();
                    deleteSelectedShape();
                }));
                google.maps.event.addDomListener($('#Save-button').live('click', function (e) {
                    e.preventDefault();
                    SaveselectedShape();
                }));
                buildColorPalette();
            }
            google.maps.event.addDomListener(window, 'load', initialize);

            //****************************************
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
                //alertR('read');
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=4ǁ" + $('#ddlGeoUnionConcil').val(),
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';

                        if (response != "[]") {
                            $.each(jd, function (i, itm) {
                                opt += '<option value="' + itm.tblSlumID + '">' + itm.strSlumName + '</option>';
                            });
                            $('#ddSlum').html(opt);
                            if (opt != '') {
                                initialize();
                            }
                        }
                        else {
                            $('#ddSlum').html("");
                        }
                    }
                });
            }

            $('#ddSlum').live('change', function (e) {
                e.preventDefault();
                initialize();
            });
        });////End Doc Of Ready

        /////////////////////////BIND LOCATION END
    </script>
</asp:Content>
