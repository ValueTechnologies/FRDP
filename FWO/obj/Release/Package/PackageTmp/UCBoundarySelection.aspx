<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="UCBoundarySelection.aspx.cs" Inherits="FRDP.UCBoundarySelection" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dvGPS" title="GPS Details" style="display: none;">
        <table class="responsive table table-bordered" style="border-top: 1px solid #c4c4c4;">
            <tbody>
                <tr class="info">
                    <td>
                        <h4 id="atag1" style="margin-bottom: 2px;"></h4>
                    </td>
                </tr>
            </tbody>
        </table>
        <table id="tblTempGPS" class="responsive table table-striped table-bordered table-condensed">
            <thead>
                <tr>
                    <th style="width: 200px;">Latitude</th>
                    <th style="width: 200px;">Longitude</th>
                    <th style="width: 40px;"></th>
                </tr>
            </thead>
            <tbody></tbody>
            <thead>
                <tr>
                    <th>
                        <input id="txtLat" type="text" /></th>
                    <th>
                        <input id="txtLng" type="text" /></th>
                    <th>
                        <button id="btnAddGPSTemp" class="btn btn-info" style="margin-bottom: 10px;">+ </button>
                    </th>
                </tr>
                <tr>
                    <th colspan="3">
                        <button id="btnSaveGPS" class="btn btn-info" style="width: 100%;">Save All</button></th>
                </tr>
            </thead>
        </table>
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

                                <td>Union Concil</td>
                                <td>
                                    <select id="ddlGeoFeildUnit" name="D6" style="width: 250px; display: none;"></select>
                                    <select id="ddlGeoUnionConcil" name="D7" style="width: 250px"></select>
                                </td>
                                <td></td>
                                <td>
                                    <button class="btn btn-info btnGPS" style="width: 250px; text-align: left;"><span class="icon16  icomoon-icon-location-2 white"></span>Add GPS Manually</button>
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
                        <span>UC Boundary Identification</span>
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

        /*#delete-button {
                margin-top: 5px;
            }*/
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

            var _$_89d9 = ["clip", "dialog", "#dvGPS", "click", "preventDefault", "POST", "ghEFS.ashx/?ID=15\u01c1", "val", "#ddlGeoUnionConcil", "parseJSON", "", "open", "#btnSaveGPS", "text", "#ddlGeoUnionConcil option:selected", "html", "#atag1", "#tblTempGPS tbody", "b", "-1", "½", "split", "<tr><td style=\"text-align:center;\">", ",", "</td><td>", "</td><td><button class=\"btn btn-danger rmo\"> X </button></td></tr>", "append", "each", "ajax", "live", ".btnGPS", "focusout", "°", "indexOf", "#txtLat", "trim", "'", "\"", "toString", "replace", "#txtLng", "n", "s", "e", "w", "Enter valid GPS..!", "#btnAddGPSTemp", "remove", "parent", ".rmo", "td", "find", "#tblTempGPS tbody tr", "¼", "½¼", "ghEFS.ashx/?ID=13\u01c1", "\u01c1", "Record Saved..!", "close", "#Save-button", "#FF0000", "#1E90FF", "#FF1493", "#32CD32", "#FF8C00", "#4B0082", "#FFEB3B", "setEditable", "fillColor", "get", "strokeColor", "setMap", "Please Select Shape...!", "getPath", "length", "lat", "getAt", "lng", "push", "Boundary Saved..!", "border", "style", "2px solid #789", "2px solid #fff", "polylineOptions", "set", "rectangleOptions", "circleOptions", "polygonOptions", "type", "POLYLINE", "OverlayType", "drawing", "maps", "span", "createElement", "className", "color-button", "backgroundColor", "addDomListener", "event", "#color-palette", "color-palette", "getElementById", "appendChild", "Geocoder", ", ", "30.3894007, 69.3532207", "#ddlGeoDestrict option:selected", " ", "#ddlGeoTehsil option:selected", " Pakistan", "no", "toLowerCase", "ok", "location", "geometry", "LatLng", "#ddlGeoRegion option:selected", "geocode", "map", "ROADMAP", "MapTypeId", "Map", "Polygon", "POLYGON", "DrawingManager", "overlaycomplete", "MARKER", "setDrawingMode", "overlay", "vertex", "path", "getPaths", "removeAt", "addListener", "drawingmode_changed", "#delete-button", "load", "change", "#ddlGeoCountry", "#ddlGeoProvince", "#ddlGeoRegion", "#ddlGeoDestrict", "#ddlGeoTehsil", "#ddlGeoFeildUnit", "application/json; charset=utf-8", "LocationNew.aspx/BindCountry", "{}", "d", "Country", "Province", "Region", "District", "Tehsil", "FU", "UC", "village", "#ddlGeoUnionVillage", "LocationNew.aspx/BindProvince", "{'ID':'", "'}", "LocationNew.aspx/BindRegion", "LocationNew.aspx/BindDistrict", "LocationNew.aspx/BindTehsil", "LocationNew.aspx/BindFU", "LocationNew.aspx/BindUC"];
            $(function () {
                $(_$_89d9[2])[_$_89d9[1]]({
                    autoOpen: false,
                    modal: true,
                    height: 630,
                    width: 555,
                    show: {
                        effect: _$_89d9[0],
                        duration: 500
                    },
                    hide: {
                        effect: _$_89d9[0],
                        duration: 500
                    }
                })
            });
            $(_$_89d9[30])[_$_89d9[29]](_$_89d9[3], function (a) {
                a[_$_89d9[4]]();
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    url: _$_89d9[6] + $(_$_89d9[8])[_$_89d9[7]](),
                    success: function (d) {
                        var b = $[_$_89d9[9]](d),
                            c = _$_89d9[10];
                        $(_$_89d9[2])[_$_89d9[1]](_$_89d9[11]);
                        $(_$_89d9[12])[_$_89d9[7]]($(_$_89d9[8])[_$_89d9[7]]());
                        $(_$_89d9[16])[_$_89d9[15]]($(_$_89d9[14])[_$_89d9[13]]());
                        $(_$_89d9[17])[_$_89d9[15]](_$_89d9[10]);
                        if ($[_$_89d9[9]](d)[0][_$_89d9[18]] != _$_89d9[19]) {
                            var f = $[_$_89d9[9]](d)[0][_$_89d9[18]][_$_89d9[21]](_$_89d9[20]);
                            $[_$_89d9[27]](f, function (g, h) {
                                $(_$_89d9[17])[_$_89d9[26]](_$_89d9[22] + h[_$_89d9[21]](_$_89d9[23])[0] + _$_89d9[24] + h[_$_89d9[21]](_$_89d9[23])[1] + _$_89d9[25])
                            })
                        }
                    }
                })
            });
            $(_$_89d9[34])[_$_89d9[29]](_$_89d9[31], function (a) {
                a[_$_89d9[4]]();
                if ($[_$_89d9[35]]($(_$_89d9[34])[_$_89d9[7]]())[_$_89d9[33]](_$_89d9[32]) >= 0 && $[_$_89d9[35]]($(_$_89d9[34])[_$_89d9[7]]())[_$_89d9[33]](_$_89d9[36]) >= 0 && $[_$_89d9[35]]($(_$_89d9[34])[_$_89d9[7]]())[_$_89d9[33]](_$_89d9[37]) >= 0) {
                    var k = $[_$_89d9[35]]($(_$_89d9[34])[_$_89d9[7]]())[_$_89d9[21]](_$_89d9[32])[0];
                    var l = $[_$_89d9[35]]($(_$_89d9[34])[_$_89d9[7]]())[_$_89d9[39]](k[_$_89d9[38]]() + _$_89d9[32], _$_89d9[10]);
                    var n = l[_$_89d9[21]](_$_89d9[36])[0];
                    var p = $[_$_89d9[35]]($(_$_89d9[34])[_$_89d9[7]]())[_$_89d9[39]](k[_$_89d9[38]]() + _$_89d9[32] + n[_$_89d9[38]]() + _$_89d9[36], _$_89d9[10]);
                    var q = p[_$_89d9[21]](_$_89d9[37])[0];
                    var o = parseFloat(k) + (parseFloat(n) / 60) + (parseFloat(q) / 3600);
                    $(_$_89d9[34])[_$_89d9[7]](o[_$_89d9[38]]())
                }
            });
            $(_$_89d9[40])[_$_89d9[29]](_$_89d9[31], function (a) {
                a[_$_89d9[4]]();
                if ($[_$_89d9[35]]($(_$_89d9[40])[_$_89d9[7]]())[_$_89d9[33]](_$_89d9[32]) >= 0 && $[_$_89d9[35]]($(_$_89d9[40])[_$_89d9[7]]())[_$_89d9[33]](_$_89d9[36]) >= 0 && $[_$_89d9[35]]($(_$_89d9[40])[_$_89d9[7]]())[_$_89d9[33]](_$_89d9[37]) >= 0) {
                    var k = $[_$_89d9[35]]($(_$_89d9[40])[_$_89d9[7]]())[_$_89d9[21]](_$_89d9[32])[0];
                    var l = $[_$_89d9[35]]($(_$_89d9[40])[_$_89d9[7]]())[_$_89d9[39]](k[_$_89d9[38]]() + _$_89d9[32], _$_89d9[10]);
                    var n = l[_$_89d9[21]](_$_89d9[36])[0];
                    var p = $[_$_89d9[35]]($(_$_89d9[40])[_$_89d9[7]]())[_$_89d9[39]](k[_$_89d9[38]]() + _$_89d9[32] + n[_$_89d9[38]]() + _$_89d9[36], _$_89d9[10]);
                    var q = p[_$_89d9[21]](_$_89d9[37])[0];
                    var o = parseFloat(k) + (parseFloat(n) / 60) + (parseFloat(q) / 3600);
                    $(_$_89d9[40])[_$_89d9[7]](o[_$_89d9[38]]())
                }
            });

            function DMS2Decimal($degrees, $minutes, $seconds, $direction) {
                $d = strtolower($direction);
                $ok = array(_$_89d9[41], _$_89d9[42], _$_89d9[43], _$_89d9[44]);
                if (!is_numeric($degrees) || $degrees < 0 || $degrees > 180) {
                    $decimal = false
                } else {
                    if (!is_numeric($minutes) || $minutes < 0 || $minutes > 59) {
                        $decimal = false
                    } else {
                        if (!is_numeric($seconds) || $seconds < 0 || $seconds > 59) {
                            $decimal = false
                        } else {
                            if (!in_array($d, $ok)) {
                                $decimal = false
                            } else {
                                $decimal = $degrees + ($minutes / 60) + ($seconds / 3600);
                                if ($d == _$_89d9[42] || $d == _$_89d9[44]) {
                                    $decimal *= -1
                                }
                            }
                        }
                    }
                };
                return $decimal
            }
            $(_$_89d9[46])[_$_89d9[29]](_$_89d9[3], function (a) {
                a[_$_89d9[4]]();
                if ($[_$_89d9[35]]($(_$_89d9[34])[_$_89d9[7]]()) == _$_89d9[10] || $[_$_89d9[35]]($(_$_89d9[40])[_$_89d9[7]]()) == _$_89d9[10]) {
                    alertR(_$_89d9[45]);
                    return false
                };
                $(_$_89d9[17])[_$_89d9[26]](_$_89d9[22] + $(_$_89d9[34])[_$_89d9[7]]() + _$_89d9[24] + $(_$_89d9[40])[_$_89d9[7]]() + _$_89d9[25]);
                $(_$_89d9[34])[_$_89d9[7]](_$_89d9[10]);
                $(_$_89d9[40])[_$_89d9[7]](_$_89d9[10])
            });
            $(_$_89d9[49])[_$_89d9[29]](_$_89d9[3], function (a) {
                a[_$_89d9[4]]();
                $(this)[_$_89d9[48]]()[_$_89d9[48]]()[_$_89d9[47]]()
            });
            $(_$_89d9[12])[_$_89d9[29]](_$_89d9[3], function (a) {
                a[_$_89d9[4]]();
                var r = _$_89d9[10];
                $(_$_89d9[52])[_$_89d9[27]](function (u, t) {
                    r += $($(this)[_$_89d9[51]](_$_89d9[50])[0])[_$_89d9[15]]() + _$_89d9[23] + $($(this)[_$_89d9[51]](_$_89d9[50])[1])[_$_89d9[15]]() + _$_89d9[20]
                });
                r += _$_89d9[53];
                r = r[_$_89d9[39]](_$_89d9[54], _$_89d9[10]);
                r = r[_$_89d9[39]](_$_89d9[53], _$_89d9[10]);
                if ($[_$_89d9[35]](r) == _$_89d9[10]) {
                    r = _$_89d9[19]
                };
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    url: _$_89d9[55] + r + _$_89d9[56] + $(_$_89d9[12])[_$_89d9[7]](),
                    success: function (d) {
                        alertG(_$_89d9[57]);
                        $(_$_89d9[2])[_$_89d9[1]](_$_89d9[58]);
                        initialize()
                    }
                })
            });
            $(_$_89d9[59])[_$_89d9[29]](_$_89d9[3], function (a) {
                a[_$_89d9[4]]()
            });
            BindTehsil();
            var drawingManager;
            var selectedShape;
            var colors = [_$_89d9[60], _$_89d9[61], _$_89d9[62], _$_89d9[63], _$_89d9[64], _$_89d9[65], _$_89d9[66]];
            var selectedColor;
            var colorButtons = {};

            function clearSelection() {
                if (selectedShape) {
                    selectedShape[_$_89d9[67]](false);
                    selectedShape = null
                }
            }

            function setSelection(bh) {
                clearSelection();
                selectedShape = bh;
                bh[_$_89d9[67]](true);
                selectColor(bh[_$_89d9[69]](_$_89d9[68]) || bh[_$_89d9[69]](_$_89d9[70]))
            }

            function deleteSelectedShape() {
                if (selectedShape) {
                    selectedShape[_$_89d9[71]](null)
                } else {
                    alertR(_$_89d9[72])
                }
            }

            function SaveselectedShape() {
                if (selectedShape) {
                    var bc = selectedShape[_$_89d9[73]]();
                    var bb = [];
                    var ba = _$_89d9[10];
                    for (var g = 0; g < bc[_$_89d9[74]]; g++) {
                        bb[_$_89d9[78]](bc[_$_89d9[76]](g)[_$_89d9[75]](), bc[_$_89d9[76]](g)[_$_89d9[77]]());
                        ba += (bc[_$_89d9[76]](g)[_$_89d9[75]]())[_$_89d9[38]]() + _$_89d9[23] + (bc[_$_89d9[76]](g)[_$_89d9[77]]())[_$_89d9[38]]() + _$_89d9[20]
                    };
                    ba += _$_89d9[53];
                    ba = ba[_$_89d9[39]](_$_89d9[54], _$_89d9[10]);
                    $[_$_89d9[28]]({
                        type: _$_89d9[5],
                        url: _$_89d9[55] + ba + _$_89d9[56] + $(_$_89d9[8])[_$_89d9[7]](),
                        success: function (d) {
                            alertG(_$_89d9[79])
                        }
                    })
                } else {
                    alertR(_$_89d9[72])
                }
            }

            function selectColor(Z) {
                selectedColor = Z;
                for (var g = 0; g < colors[_$_89d9[74]]; ++g) {
                    var A = colors[g];
                    colorButtons[A][_$_89d9[81]][_$_89d9[80]] = A == Z ? _$_89d9[82] : _$_89d9[83]
                };
                var bf = drawingManager[_$_89d9[69]](_$_89d9[84]);
                bf[_$_89d9[70]] = Z;
                drawingManager[_$_89d9[85]](_$_89d9[84], bf);
                var bg = drawingManager[_$_89d9[69]](_$_89d9[86]);
                bg[_$_89d9[68]] = Z;
                drawingManager[_$_89d9[85]](_$_89d9[86], bg);
                var bd = drawingManager[_$_89d9[69]](_$_89d9[87]);
                bd[_$_89d9[68]] = Z;
                drawingManager[_$_89d9[85]](_$_89d9[87], bd);
                var be = drawingManager[_$_89d9[69]](_$_89d9[88]);
                be[_$_89d9[68]] = Z;
                drawingManager[_$_89d9[85]](_$_89d9[88], be)
            }

            function setSelectedShapeColor(Z) {
                if (selectedShape) {
                    if (selectedShape[_$_89d9[89]] == google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[90]]) {
                        selectedShape[_$_89d9[85]](_$_89d9[70], Z)
                    } else {
                        selectedShape[_$_89d9[85]](_$_89d9[68], Z)
                    }
                }
            }

            function makeColorButton(Z) {
                var Y = document[_$_89d9[95]](_$_89d9[94]);
                Y[_$_89d9[96]] = _$_89d9[97];
                Y[_$_89d9[81]][_$_89d9[98]] = Z;
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[99]](Y, _$_89d9[3], function () {
                    selectColor(Z);
                    setSelectedShapeColor(Z)
                });
                return Y
            }

            function buildColorPalette() {
                if ($(_$_89d9[101])[_$_89d9[15]]() != _$_89d9[10]) {
                    return false
                };
                var z = document[_$_89d9[103]](_$_89d9[102]);
                for (var g = 0; g < colors[_$_89d9[74]]; ++g) {
                    var A = colors[g];
                    var y = makeColorButton(A);
                    z[_$_89d9[104]](y);
                    colorButtons[A] = y
                };
                selectColor(colors[0])
            }
            var geocoder = new google[_$_89d9[93]][_$_89d9[105]]();

            function initialize() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    url: _$_89d9[6] + $(_$_89d9[8])[_$_89d9[7]](),
                    success: function (d) {
                        var b = $[_$_89d9[9]](d);
                        if (b[0][_$_89d9[18]] == _$_89d9[19]) {
                            var G = _$_89d9[107][_$_89d9[21]](_$_89d9[106]);
                            geocoder[_$_89d9[119]]({
                                address: $(_$_89d9[108])[_$_89d9[13]]() + _$_89d9[109] + $(_$_89d9[110])[_$_89d9[13]]() + _$_89d9[111],
                                region: _$_89d9[112]
                            }, function (I, J) {
                                if (J[_$_89d9[113]]() == _$_89d9[114]) {
                                    G = [];
                                    var H = new google[_$_89d9[93]][_$_89d9[117]](I[0][_$_89d9[116]][_$_89d9[115]][_$_89d9[75]](), I[0][_$_89d9[116]][_$_89d9[115]][_$_89d9[77]]());
                                    G[_$_89d9[78]](H[_$_89d9[75]]());
                                    G[_$_89d9[78]](H[_$_89d9[77]]());
                                    LoadTargetMap(G)
                                } else {
                                    geocoder[_$_89d9[119]]({
                                        address: $(_$_89d9[118])[_$_89d9[13]]() + _$_89d9[109] + $(_$_89d9[108])[_$_89d9[13]]() + _$_89d9[111],
                                        region: _$_89d9[112]
                                    }, function (I, J) {
                                        if (J[_$_89d9[113]]() == _$_89d9[114]) {
                                            G = [];
                                            var H = new google[_$_89d9[93]][_$_89d9[117]](I[0][_$_89d9[116]][_$_89d9[115]][_$_89d9[75]](), I[0][_$_89d9[116]][_$_89d9[115]][_$_89d9[77]]());
                                            G[_$_89d9[78]](H[_$_89d9[75]]());
                                            G[_$_89d9[78]](H[_$_89d9[77]]());
                                            LoadTargetMap(G)
                                        } else {
                                            G = _$_89d9[107][_$_89d9[21]](_$_89d9[106]);
                                            LoadTargetMap(G)
                                        }
                                    })
                                }
                            })
                        } else {
                            LoadTargetMapWithShape(b[0][_$_89d9[18]])
                        }
                    }
                })
            }

            function LoadTargetMapWithShape(L) {
                var V = [];
                V = L[_$_89d9[21]](_$_89d9[20]);
                var T = 0.0,
                    U = 0.0,
                    R = 0,
                    W = [];
                $[_$_89d9[27]](V, function (g, h) {
                    R++;
                    T += parseFloat(h[_$_89d9[21]](_$_89d9[23])[0]);
                    U += parseFloat(h[_$_89d9[21]](_$_89d9[23])[1]);
                    var X = {
                        lat: parseFloat(h[_$_89d9[21]](_$_89d9[23])[0]),
                        lng: parseFloat(h[_$_89d9[21]](_$_89d9[23])[1])
                    };
                    W[_$_89d9[78]](X)
                });
                var K = new google[_$_89d9[93]][_$_89d9[123]](document[_$_89d9[103]](_$_89d9[120]), {
                    zoom: 16,
                    center: new google[_$_89d9[93]][_$_89d9[117]](T / R, U / R),
                    mapTypeId: google[_$_89d9[93]][_$_89d9[122]][_$_89d9[121]],
                    disableDefaultUI: true,
                    zoomControl: true
                });
                var Q = new google[_$_89d9[93]][_$_89d9[124]]({
                    paths: W,
                    strokeColor: _$_89d9[60],
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillOpacity: 0.15
                });
                Q[_$_89d9[71]](K);
                var N = {
                    strokeWeight: 2,
                    fillOpacity: 0.45,
                    editable: true,
                    draggable: true
                };
                drawingManager = new google[_$_89d9[93]][_$_89d9[92]][_$_89d9[126]]({
                    drawingMode: google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[125]],
                    markerOptions: {
                        draggable: true
                    },
                    polylineOptions: {
                        editable: true,
                        draggable: true
                    },
                    rectangleOptions: N,
                    circleOptions: N,
                    polygonOptions: N,
                    map: K
                });
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](drawingManager, _$_89d9[127], function (a) {
                    if (a[_$_89d9[89]] !== google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[128]]) {
                        drawingManager[_$_89d9[129]](null);
                        var O = a[_$_89d9[130]];
                        O[_$_89d9[89]] = a[_$_89d9[89]];
                        google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](O, _$_89d9[3], function (a) {
                            if (a[_$_89d9[131]] !== undefined) {
                                if (O[_$_89d9[89]] === google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[125]]) {
                                    var P = O[_$_89d9[133]]()[_$_89d9[76]](a[_$_89d9[132]]);
                                    P[_$_89d9[134]](a[_$_89d9[131]]);
                                    if (P[_$_89d9[74]] < 3) {
                                        O[_$_89d9[71]](null)
                                    }
                                };
                                if (O[_$_89d9[89]] === google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[90]]) {
                                    var P = O[_$_89d9[73]]();
                                    P[_$_89d9[134]](a[_$_89d9[131]]);
                                    if (P[_$_89d9[74]] < 2) {
                                        O[_$_89d9[71]](null)
                                    }
                                }
                            };
                            setSelection(O)
                        });
                        setSelection(O)
                    }
                });
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](drawingManager, _$_89d9[136], clearSelection);
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](K, _$_89d9[3], clearSelection);
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[99]]($(_$_89d9[137])[_$_89d9[29]](_$_89d9[3], function (a) {
                    a[_$_89d9[4]]();
                    deleteSelectedShape()
                }));
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[99]]($(_$_89d9[59])[_$_89d9[29]](_$_89d9[3], function (a) {
                    a[_$_89d9[4]]();
                    SaveselectedShape()
                }));
                buildColorPalette()
            }

            function LoadTargetMap(L) {
                var K = new google[_$_89d9[93]][_$_89d9[123]](document[_$_89d9[103]](_$_89d9[120]), {
                    zoom: 16,
                    center: new google[_$_89d9[93]][_$_89d9[117]](L[0], L[1]),
                    mapTypeId: google[_$_89d9[93]][_$_89d9[122]][_$_89d9[121]],
                    disableDefaultUI: true,
                    zoomControl: true
                });
                var N = {
                    strokeWeight: 2,
                    fillOpacity: 0.45,
                    editable: true,
                    draggable: true
                };
                drawingManager = new google[_$_89d9[93]][_$_89d9[92]][_$_89d9[126]]({
                    drawingMode: google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[125]],
                    markerOptions: {
                        draggable: true
                    },
                    polylineOptions: {
                        editable: true,
                        draggable: true
                    },
                    rectangleOptions: N,
                    circleOptions: N,
                    polygonOptions: N,
                    map: K
                });
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](drawingManager, _$_89d9[127], function (a) {
                    if (a[_$_89d9[89]] !== google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[128]]) {
                        drawingManager[_$_89d9[129]](null);
                        var O = a[_$_89d9[130]];
                        O[_$_89d9[89]] = a[_$_89d9[89]];
                        google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](O, _$_89d9[3], function (a) {
                            if (a[_$_89d9[131]] !== undefined) {
                                if (O[_$_89d9[89]] === google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[125]]) {
                                    var P = O[_$_89d9[133]]()[_$_89d9[76]](a[_$_89d9[132]]);
                                    P[_$_89d9[134]](a[_$_89d9[131]]);
                                    if (P[_$_89d9[74]] < 3) {
                                        O[_$_89d9[71]](null)
                                    }
                                };
                                if (O[_$_89d9[89]] === google[_$_89d9[93]][_$_89d9[92]][_$_89d9[91]][_$_89d9[90]]) {
                                    var P = O[_$_89d9[73]]();
                                    P[_$_89d9[134]](a[_$_89d9[131]]);
                                    if (P[_$_89d9[74]] < 2) {
                                        O[_$_89d9[71]](null)
                                    }
                                }
                            };
                            setSelection(O)
                        });
                        setSelection(O)
                    }
                });
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](drawingManager, _$_89d9[136], clearSelection);
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[135]](K, _$_89d9[3], clearSelection);
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[99]]($(_$_89d9[137])[_$_89d9[29]](_$_89d9[3], function (a) {
                    a[_$_89d9[4]]();
                    deleteSelectedShape()
                }));
                google[_$_89d9[93]][_$_89d9[100]][_$_89d9[99]]($(_$_89d9[59])[_$_89d9[29]](_$_89d9[3], function (a) {
                    a[_$_89d9[4]]();
                    SaveselectedShape()
                }));
                buildColorPalette()
            }
            google[_$_89d9[93]][_$_89d9[100]][_$_89d9[99]](window, _$_89d9[138], initialize);
            $(_$_89d9[140])[_$_89d9[29]](_$_89d9[139], BindProvince);
            $(_$_89d9[141])[_$_89d9[29]](_$_89d9[139], BindRegion);
            $(_$_89d9[142])[_$_89d9[29]](_$_89d9[139], BindDistrict);
            $(_$_89d9[143])[_$_89d9[29]](_$_89d9[139], BindTehsil);
            $(_$_89d9[144])[_$_89d9[29]](_$_89d9[139], BindFU);
            $(_$_89d9[145])[_$_89d9[29]](_$_89d9[139], BindUC);
            $(_$_89d9[8])[_$_89d9[29]](_$_89d9[139], BindVillage);

            function BindCountry() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    contentType: _$_89d9[146],
                    url: _$_89d9[147],
                    data: _$_89d9[148],
                    async: false,
                    success: function (w) {
                        var v = $[_$_89d9[9]](w[_$_89d9[149]]);
                        $(_$_89d9[140])[_$_89d9[15]](v[_$_89d9[150]]);
                        $(_$_89d9[141])[_$_89d9[15]](v[_$_89d9[151]]);
                        $(_$_89d9[142])[_$_89d9[15]](v[_$_89d9[152]]);
                        $(_$_89d9[143])[_$_89d9[15]](v[_$_89d9[153]]);
                        $(_$_89d9[144])[_$_89d9[15]](v[_$_89d9[154]]);
                        $(_$_89d9[145])[_$_89d9[15]](v[_$_89d9[155]]);
                        $(_$_89d9[8])[_$_89d9[15]](v[_$_89d9[156]]);
                        $(_$_89d9[158])[_$_89d9[15]](v[_$_89d9[157]])
                    }
                })
            }

            function BindProvince() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    contentType: _$_89d9[146],
                    url: _$_89d9[159],
                    data: _$_89d9[160] + $(_$_89d9[140])[_$_89d9[7]]() + _$_89d9[161],
                    async: false,
                    success: function (w) {
                        var v = $[_$_89d9[9]](w[_$_89d9[149]]),
                            x = _$_89d9[10];
                        $(_$_89d9[141])[_$_89d9[15]](v[_$_89d9[151]]);
                        $(_$_89d9[142])[_$_89d9[15]](v[_$_89d9[152]]);
                        $(_$_89d9[143])[_$_89d9[15]](v[_$_89d9[153]]);
                        $(_$_89d9[144])[_$_89d9[15]](v[_$_89d9[154]]);
                        $(_$_89d9[145])[_$_89d9[15]](v[_$_89d9[155]]);
                        $(_$_89d9[8])[_$_89d9[15]](v[_$_89d9[156]]);
                        $(_$_89d9[158])[_$_89d9[15]](v[_$_89d9[157]]);
                        initialize()
                    }
                })
            }

            function BindRegion() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    contentType: _$_89d9[146],
                    url: _$_89d9[162],
                    data: _$_89d9[160] + $(_$_89d9[141])[_$_89d9[7]]() + _$_89d9[161],
                    async: false,
                    success: function (w) {
                        var v = $[_$_89d9[9]](w[_$_89d9[149]]),
                            x = _$_89d9[10];
                        $(_$_89d9[142])[_$_89d9[15]](v[_$_89d9[152]]);
                        $(_$_89d9[143])[_$_89d9[15]](v[_$_89d9[153]]);
                        $(_$_89d9[144])[_$_89d9[15]](v[_$_89d9[154]]);
                        $(_$_89d9[145])[_$_89d9[15]](v[_$_89d9[155]]);
                        $(_$_89d9[8])[_$_89d9[15]](v[_$_89d9[156]]);
                        $(_$_89d9[158])[_$_89d9[15]](v[_$_89d9[157]]);
                        initialize()
                    }
                })
            }

            function BindDistrict() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    contentType: _$_89d9[146],
                    url: _$_89d9[163],
                    data: _$_89d9[160] + $(_$_89d9[142])[_$_89d9[7]]() + _$_89d9[161],
                    async: false,
                    success: function (w) {
                        var v = $[_$_89d9[9]](w[_$_89d9[149]]),
                            x = _$_89d9[10];
                        $(_$_89d9[143])[_$_89d9[15]](v[_$_89d9[153]]);
                        $(_$_89d9[144])[_$_89d9[15]](v[_$_89d9[154]]);
                        $(_$_89d9[145])[_$_89d9[15]](v[_$_89d9[155]]);
                        $(_$_89d9[8])[_$_89d9[15]](v[_$_89d9[156]]);
                        $(_$_89d9[158])[_$_89d9[15]](v[_$_89d9[157]]);
                        initialize()
                    }
                })
            }

            function BindTehsil() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    contentType: _$_89d9[146],
                    url: _$_89d9[164],
                    data: _$_89d9[160] + $(_$_89d9[143])[_$_89d9[7]]() + _$_89d9[161],
                    async: false,
                    success: function (w) {
                        var v = $[_$_89d9[9]](w[_$_89d9[149]]),
                            x = _$_89d9[10];
                        $(_$_89d9[144])[_$_89d9[15]](v[_$_89d9[154]]);
                        $(_$_89d9[145])[_$_89d9[15]](v[_$_89d9[155]]);
                        $(_$_89d9[8])[_$_89d9[15]](v[_$_89d9[156]]);
                        $(_$_89d9[158])[_$_89d9[15]](v[_$_89d9[157]]);
                        initialize()
                    }
                })
            }

            function BindFU() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    contentType: _$_89d9[146],
                    url: _$_89d9[165],
                    data: _$_89d9[160] + $(_$_89d9[144])[_$_89d9[7]]() + _$_89d9[161],
                    async: false,
                    success: function (w) {
                        var v = $[_$_89d9[9]](w[_$_89d9[149]]),
                            x = _$_89d9[10];
                        $(_$_89d9[145])[_$_89d9[15]](v[_$_89d9[155]]);
                        $(_$_89d9[8])[_$_89d9[15]](v[_$_89d9[156]]);
                        $(_$_89d9[158])[_$_89d9[15]](v[_$_89d9[157]]);
                        initialize()
                    }
                })
            }

            function BindUC() {
                $[_$_89d9[28]]({
                    type: _$_89d9[5],
                    contentType: _$_89d9[146],
                    url: _$_89d9[166],
                    data: _$_89d9[160] + $(_$_89d9[145])[_$_89d9[7]]() + _$_89d9[161],
                    async: false,
                    success: function (w) {
                        var v = $[_$_89d9[9]](w[_$_89d9[149]]),
                            x = _$_89d9[10];
                        $(_$_89d9[8])[_$_89d9[15]](v[_$_89d9[156]]);
                        $(_$_89d9[158])[_$_89d9[15]](v[_$_89d9[157]]);
                        initialize()
                    }
                })
            }

            function BindVillage() {
                initialize()
            }
        });////End Doc Of Ready

        /////////////////////////BIND LOCATION END
    </script>
</asp:Content>
