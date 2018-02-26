<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="GridMaping.aspx.cs" Inherits="FRDP.GridMaping" %>

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
    <div id="dvKMZUP" title="GPS Details" style="display:none;">
        <table class="responsive table table-bordered" style="border-top: 1px solid #c4c4c4;">
            <tbody>
                <tr class="info">
                    <td>
                        <h4 id="atag2" style="margin-bottom: 2px;"></h4>
                    </td>
                </tr>
            </tbody>
        </table>
        <table style="width:100%;"><tr><td>Attach KMZ file:</td><td>
            <input id="FileKMZ" type="file" /></td></tr><tr><td colspan="2"><button  style="width:100%;" id="Upload-KMZ" value="0" class="btn btn-info">Upload KMZ</button></td></tr></table>
        </div>
    <div id="dvGPS" title="GPS Details" style="display:none;">
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
            <thead><tr>
                <th style="width:200px;">Latitude</th>
                <th style="width:200px;">Longitude</th>
                <th  style="width:40px;"></th>
                   </tr></thead>
            <tbody></tbody>
            <thead>
                <tr>
                    <th>
                    <input id="txtLat" type="text" /></th>
                    <th><input id="txtLng" type="text" /></th>
                    <th><button id="btnAddGPSTemp" class="btn btn-info"> + </button></th>
                </tr>
                <tr><th colspan="3"><button id="btnSaveGPS" class="btn btn-info" style="width: 100%;">Save All</button></th></tr>
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
                        <span>Registered Slum Areas</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table id="tblAnimals" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th style="width: 30px;">Sr#</th>
                                <th>Slum Name</th>
                                <th style="width: 70px;">Date</th>
                                <th style="width: 70px;">Photo I</th>
                                <th style="width: 70px;">Photo II</th>
                                <th style="width: 70px;">Photo III</th>
                                <th style="width: 70px;">Photo IV</th>
                                <th style="width: 70px;">Photo V</th>
                                <th style="width: 60px;">Picture</th>
                                <th style="width: 60px;">KMZ</th>
                                <th style="width: 60px;">GPS</th>
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

    <div id="dvAnimalPics" title="Slum Pictures" style="display: none;">
        <table class="responsive table table-bordered" style="border-top: 1px solid #c4c4c4;">
            <tbody>
                <tr class="info">
                    <td>
                        <h4 id="atag" style="margin-bottom: 2px;"></h4>
                    </td>
                </tr>
            </tbody>
        </table>



        <table class="responsive table table-bordered" style="border-top: 1px solid #c4c4c4;">
            <tr>
                <td style="text-align: center">Photo I</td>
                <td style="text-align: center">Photo II</td>
                <td style="text-align: center">Photo III</td>
                <td style="text-align: center">Photo IV</td>
                <td style="text-align: center">Photo V</td>
            </tr>
            <tr>
                <td style="text-align: center" id="pA">
                    <img id="photo1" alt="" src="images/No_image_available.png" style="width: 150px;" /></td>
                <td style="text-align: center" id="pB">
                    <img id="photo2" alt="" src="images/No_image_available.png" style="width: 150px;" /></td>
                <td style="text-align: center" id="pC">
                    <img id="photo3" alt="" src="images/No_image_available.png" style="width: 150px;" /></td>
                <td style="text-align: center" id="pD">
                    <img id="photo4" alt="" src="images/No_image_available.png" style="width: 150px;" /></td>
                <td style="text-align: center" id="pE">
                    <img id="photo5" alt="" src="images/No_image_available.png" style="width: 150px;" /></td>
            </tr>
            <tr>
                <td style="text-align: center" id="c1"></td>
                <td style="text-align: center" id="c2"></td>
                <td style="text-align: center" id="c3"></td>
                <td style="text-align: center" id="c4"></td>
                <td style="text-align: center" id="c5"></td>
            </tr>
        </table>
        <div class="well">
            <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                <tr>
                    <td>Photo Number</td>
                    <td>
                        <select id="ddlSide">
                            <option value="1">Photo I</option>
                            <option value="2">Photo II</option>
                            <option value="3">Photo III</option>
                            <option value="4">Photo IV</option>
                            <option value="5">Photo V</option>
                        </select></td>
                    <td>Photo</td>
                    <td>
                        <input id="fileUpload" type="file" /></td>
                </tr>
                <tr>
                    <td>Caption</td>
                    <td>
                        <textarea id="txtCaption" cols="20" rows="2"></textarea></td>
                    <td>&nbsp;</td>
                    <td style="vertical-align: bottom;">
                        <button id="btnUploadPhoto" tg="0" class="btn btn-info" style="margin-bottom: 10px;"><span class="icon16 icomoon-icon-folder-upload white"></span>Upload Photo</button></td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        var _$_a7f8 = ["keyCode", "preventDefault", "keypress", "setDate", "<%= Convert.ToString(DateTime.Now.Day)+", "+Convert.ToString(DateTime.Now.Month)+", "+Convert.ToString(DateTime.Now.Year) %>", "datepicker", "dd/mm/yy", "#txtDate", "click", "excel", "false", "tableExport", "#tblAnimals", "live", "#btnExcel", "doc", "#btnWord", "png", "#btnPNG", "get", "files", "onload", "val", "#ddlSide", "1", "src", "result", "target", "attr", "#photo1", "show", "ph1", ".", "ext", "#dvAnimalPics", ".btnImage[tag=", "tg", "]", "2", "#photo2", "ph2", "3", "#photo3", "ph3", "4", "#photo4", "ph4", "5", "#photo5", "ph5", "readAsDataURL", "#fileUpload", "length", "½", "#txtCaption", "vls", "append", "name", "lastIndexOf", "substr", "url", "UploadSlumPics.ashx", "type", "POST", "data", "contentType", "processData", "success", "html", "#c", "", "error", "statusText", "ajax", "Attach Some Photo..!", "#btnUploadPhoto", "ghEFS.ashx/?ID=6\u01c1", "#ddlGeoUnionConcil", "parseJSON", "photoA", "0", "images/No_image_available.png", "Uploads/SlumPhotos/1B", "tblSlumID", "split", "photoB", "Uploads/SlumPhotos/2B", "photoC", "Uploads/SlumPhotos/3B", "photoD", "Uploads/SlumPhotos/4B", "photoE", "Uploads/SlumPhotos/5B", "<tr>\r                                <td style=\"width: 30px;\">", "toString", "</td>\r                                <td>", "strSlumName", "dtSlumSurveyDate", "</td>\r                                <td><div b=\"", "\" ext=\"1_", "\" style=\"width: 60px; height: 60px\" class=\"Grd\" title=\"", "Caption1", "\"><img alt=\"User Registration\" src=\"", "\" width=\"54\" height=\"54\"></div></td>\r                                <td><div b=\"", "\" ext=\"2_", "\" style=\"width: 60px; height: 60px\" class=\"Grd imgD\" title=\"", "Caption2", "\" ext=\"3_", "Caption3", "\" ext=\"4_", "Caption4", "\" ext=\"5_", "Caption5", "\" width=\"54\" height=\"54\"></div></td>\r                                <td><button tag=\"", "\" ph1=\"", "\" ph2=\"", "\" ph3=\"", "\" ph4=\"", "\" ph5=\"", "\" c1=\"", "\" c2=\"", "\" c3=\"", "\" c4=\"", "\" c5=\"", "\" class=\"btn btn-info btnImage\"><span class=\"icon16 icomoon-icon-camera-2 white\"></span>Attach</button></td>\r                                <td><button tag=\"", "\"  class=\"btn btn-info btnKMZ\" style=\"width: 110.1px;\"><span class=\"icon16 icomoon-icon-map white\"></span>Attach</button>\r                                <button tag=\"", "\"  ext=\"", "KMZFileExtention", "\" class=\"btn btn-success btnKMZD\" style=\"margin-top:2px;\" style=\"width: 110.1px;\"><span class=\"icon16 icomoon-icon-file-download white\"></span>Download</button></td>\r                                <td><button tag=\"", "\" boun=\"", "SlumBoundary", "\" class=\"btn btn-info btnGPS\" style=\"width: 110.1px;\"><span class=\"icon16  icomoon-icon-location-2 white\"></span>Add GPS</button>\r                                </td>\r                            </tr>", "each", "dataTable", "hasClass", "fnDestroy", "#tblAnimals tbody", "All", "full_numbers", "id", "search", ".dataTables_filter>label>input", "<input type=\"image\" name=\"btnExcel\" id=\"btnExcel\" title=\"Export to Excel\" class=\"Grd\" src=\"images/xcel.png\" style=\"border-width:0px;\">&nbsp;<input type=\"image\" name=\"btnWord\" id=\"btnWord\" title=\"Export to Word\" class=\"Grd\" src=\"images/wrd.png\" style=\"border-width:0px;\">&nbsp;<input type=\"image\" name=\"btnPNG\" id=\"btnPNG\" title=\"Export to PNG\" class=\"Grd\" src=\"images/png.png\" style=\"width: 16px;border-width:0px;\">", "#tblAnimals_filter label", "td", "find", ",", "#tblTempGPS tbody tr", "¼", "½¼", "replace", "trim", "ghEFS.ashx/?ID=14\u01c1", "\u01c1", "#btnSaveGPS", "Record Saved..!", "boun", ".btnGPS[tag=", "close", "dialog", "#dvGPS", "open", "tag", "parent", "#atag1", "#tblTempGPS tbody", "<tr><td style=\"text-align:center;\">", "</td><td>", "</td><td><button class=\"btn btn-danger rmo\"> X </button></td></tr>", ".btnGPS", "#txtLat", "#txtLng", "Enter valid GPS..!", "#btnAddGPSTemp", "remove", ".rmo", "clip", "tr", "closest", "#atag", "Uploads/SlumPhotos/1_", "Uploads/SlumPhotos/2_", "Uploads/SlumPhotos/3_", "Uploads/SlumPhotos/4_", "Uploads/SlumPhotos/5_", "c1", "#c1", "c2", "#c2", "c3", "#c3", "c4", "#c4", "c5", "#c5", ".btnImage", "Update", "#btnSave", "dt", "vl", "#txtSlum", "#toTop", ".clsEdit", "Dont have permission to delete..!", ".clsDelete", "Save", "#btnCancel", "#dvKMZUP", "#Upload-KMZ", "#atag2", ".btnKMZ", "#FileKMZ", ".btnKMZD[tag=", "UploadKMZ.ashx", "Attach KMZ file..!", "b", "location", "ghEFS.ashx/?ID=18\u01c1", "No Image Attached..!", ".imgD", "ghEFS.ashx/?ID=17\u01c1", ".btnKMZD", ".frm", "ghEFS.ashx/?ID=3\u01c1", "Record Saved", "change", "#ddlGeoCountry", "#ddlGeoProvince", "#ddlGeoRegion", "#ddlGeoDestrict", "#ddlGeoTehsil", "#ddlGeoFeildUnit", "application/json; charset=utf-8", "LocationNew.aspx/BindCountry", "{}", "d", "Country", "Province", "Region", "District", "Tehsil", "FU", "UC", "village", "#ddlGeoUnionVillage", "LocationNew.aspx/BindProvince", "{'ID':'", "'}", "LocationNew.aspx/BindRegion", "LocationNew.aspx/BindDistrict", "LocationNew.aspx/BindTehsil", "LocationNew.aspx/BindFU", "LocationNew.aspx/BindUC", "ready"];
        $(document)[_$_a7f8[2]](function (a) {
            if (a[_$_a7f8[0]] === 13) {
                a[_$_a7f8[1]]();
                return false
            }
        });
        $(document)[_$_a7f8[255]](function () {
            $(_$_a7f8[9])[_$_a7f8[7]]({
                dateFormat: _$_a7f8[8],
                changeMonth: true,
                changeYear: true,
                onSelect: function () { }
            })[_$_a7f8[7]](_$_a7f8[3], _$_a7f8[4] / _$_a7f8[5] / _$_a7f8[6]);
            $(_$_a7f8[16])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                $(_$_a7f8[14])[_$_a7f8[13]]({
                    type: _$_a7f8[11],
                    escape: _$_a7f8[12]
                });
                a[_$_a7f8[1]]()
            });
            $(_$_a7f8[18])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                $(_$_a7f8[14])[_$_a7f8[13]]({
                    type: _$_a7f8[17],
                    escape: _$_a7f8[12]
                });
                a[_$_a7f8[1]]()
            });
            $(_$_a7f8[20])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                $(_$_a7f8[14])[_$_a7f8[13]]({
                    type: _$_a7f8[19],
                    escape: _$_a7f8[12]
                });
                a[_$_a7f8[1]]()
            });

            function l(U) {
                var T = U[_$_a7f8[21]](0);
                if (T[_$_a7f8[22]] && T[_$_a7f8[22]][0]) {
                    var S = new FileReader();
                    S[_$_a7f8[23]] = function (a) {
                        if ($(_$_a7f8[25])[_$_a7f8[24]]() == _$_a7f8[26]) {
                            $(_$_a7f8[31])[_$_a7f8[30]](_$_a7f8[27], a[_$_a7f8[29]][_$_a7f8[28]]);
                            $(_$_a7f8[31])[_$_a7f8[32]]();
                            $(_$_a7f8[37] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[38]) + _$_a7f8[39])[_$_a7f8[30]](_$_a7f8[33], _$_a7f8[34] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[35]))
                        };
                        if ($(_$_a7f8[25])[_$_a7f8[24]]() == _$_a7f8[40]) {
                            $(_$_a7f8[41])[_$_a7f8[30]](_$_a7f8[27], a[_$_a7f8[29]][_$_a7f8[28]]);
                            $(_$_a7f8[41])[_$_a7f8[32]]();
                            $(_$_a7f8[37] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[38]) + _$_a7f8[39])[_$_a7f8[30]](_$_a7f8[42], _$_a7f8[34] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[35]))
                        };
                        if ($(_$_a7f8[25])[_$_a7f8[24]]() == _$_a7f8[43]) {
                            $(_$_a7f8[44])[_$_a7f8[30]](_$_a7f8[27], a[_$_a7f8[29]][_$_a7f8[28]]);
                            $(_$_a7f8[44])[_$_a7f8[32]]();
                            $(_$_a7f8[37] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[38]) + _$_a7f8[39])[_$_a7f8[30]](_$_a7f8[45], _$_a7f8[34] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[35]))
                        };
                        if ($(_$_a7f8[25])[_$_a7f8[24]]() == _$_a7f8[46]) {
                            $(_$_a7f8[47])[_$_a7f8[30]](_$_a7f8[27], a[_$_a7f8[29]][_$_a7f8[28]]);
                            $(_$_a7f8[47])[_$_a7f8[32]]();
                            $(_$_a7f8[37] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[38]) + _$_a7f8[39])[_$_a7f8[30]](_$_a7f8[48], _$_a7f8[34] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[35]))
                        };
                        if ($(_$_a7f8[25])[_$_a7f8[24]]() == _$_a7f8[49]) {
                            $(_$_a7f8[50])[_$_a7f8[30]](_$_a7f8[27], a[_$_a7f8[29]][_$_a7f8[28]]);
                            $(_$_a7f8[50])[_$_a7f8[32]]();
                            $(_$_a7f8[37] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[38]) + _$_a7f8[39])[_$_a7f8[30]](_$_a7f8[51], _$_a7f8[34] + $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[35]))
                        };
                        k()
                    };
                    S[_$_a7f8[52]](T[_$_a7f8[22]][0])
                }
            }
            $(_$_a7f8[77])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                var r = $(_$_a7f8[53])[_$_a7f8[21]](0);
                var q = r[_$_a7f8[22]];
                if (q[_$_a7f8[54]] > 0) {
                    var n = $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[38]) + _$_a7f8[55] + $(_$_a7f8[25])[_$_a7f8[24]]() + _$_a7f8[55] + $(_$_a7f8[56])[_$_a7f8[24]]();
                    var p = new FormData();
                    p[_$_a7f8[58]](_$_a7f8[57], n);
                    p[_$_a7f8[58]](q[0][_$_a7f8[59]], q[0]);
                    var o = q[0][_$_a7f8[59]][_$_a7f8[61]]((q[0][_$_a7f8[59]][_$_a7f8[60]](_$_a7f8[34]) + 1));
                    $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[35], o);
                    var m = {};
                    m[_$_a7f8[62]] = _$_a7f8[63];
                    m[_$_a7f8[64]] = _$_a7f8[65];
                    m[_$_a7f8[66]] = p;
                    m[_$_a7f8[67]] = false;
                    m[_$_a7f8[68]] = false;
                    m[_$_a7f8[69]] = function (s) {
                        alertG(s);
                        l($(_$_a7f8[53]));
                        $(_$_a7f8[71] + $(_$_a7f8[25])[_$_a7f8[24]]())[_$_a7f8[70]]($(_$_a7f8[56])[_$_a7f8[24]]());
                        $(_$_a7f8[56])[_$_a7f8[24]](_$_a7f8[72])
                    };
                    m[_$_a7f8[73]] = function (t) {
                        alertR(t[_$_a7f8[74]])
                    };
                    $[_$_a7f8[75]](m)
                } else {
                    alertR(_$_a7f8[76])
                }
            });

            function k() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    url: _$_a7f8[78] + $(_$_a7f8[79])[_$_a7f8[24]](),
                    success: function (x) {
                        var O = $[_$_a7f8[80]](x),
                            I = _$_a7f8[72];
                        $[_$_a7f8[134]](O, function (z, P) {
                            var C = P[_$_a7f8[81]] == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[84] + P[_$_a7f8[85]] + P[_$_a7f8[81]][_$_a7f8[86]](_$_a7f8[55])[0];
                            var D = P[_$_a7f8[87]] == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[88] + P[_$_a7f8[85]] + P[_$_a7f8[87]][_$_a7f8[86]](_$_a7f8[55])[0];
                            var E = P[_$_a7f8[89]] == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[90] + P[_$_a7f8[85]] + P[_$_a7f8[89]][_$_a7f8[86]](_$_a7f8[55])[0];
                            var F = P[_$_a7f8[91]] == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[92] + P[_$_a7f8[85]] + P[_$_a7f8[91]][_$_a7f8[86]](_$_a7f8[55])[0];
                            var G = P[_$_a7f8[93]] == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[94] + P[_$_a7f8[85]] + P[_$_a7f8[93]][_$_a7f8[86]](_$_a7f8[55])[0];
                            I += _$_a7f8[95] + (parseInt(z) + 1)[_$_a7f8[96]]() + _$_a7f8[97] + P[_$_a7f8[98]] + _$_a7f8[97] + P[_$_a7f8[99]] + _$_a7f8[100] + P[_$_a7f8[81]] + _$_a7f8[101] + P[_$_a7f8[85]] + P[_$_a7f8[81]][_$_a7f8[86]](_$_a7f8[55])[0] + _$_a7f8[102] + P[_$_a7f8[103]] + _$_a7f8[104] + C + _$_a7f8[105] + P[_$_a7f8[87]] + _$_a7f8[106] + P[_$_a7f8[85]] + P[_$_a7f8[87]][_$_a7f8[86]](_$_a7f8[55])[0] + _$_a7f8[107] + P[_$_a7f8[108]] + _$_a7f8[104] + D + _$_a7f8[105] + P[_$_a7f8[89]] + _$_a7f8[109] + P[_$_a7f8[85]] + P[_$_a7f8[89]][_$_a7f8[86]](_$_a7f8[55])[0] + _$_a7f8[107] + P[_$_a7f8[110]] + _$_a7f8[104] + E + _$_a7f8[105] + P[_$_a7f8[91]] + _$_a7f8[111] + P[_$_a7f8[85]] + P[_$_a7f8[91]][_$_a7f8[86]](_$_a7f8[55])[0] + _$_a7f8[107] + P[_$_a7f8[112]] + _$_a7f8[104] + F + _$_a7f8[105] + P[_$_a7f8[93]] + _$_a7f8[113] + P[_$_a7f8[85]] + P[_$_a7f8[93]][_$_a7f8[86]](_$_a7f8[55])[0] + _$_a7f8[107] + P[_$_a7f8[114]] + _$_a7f8[104] + G + _$_a7f8[115] + P[_$_a7f8[85]] + _$_a7f8[116] + P[_$_a7f8[81]] + _$_a7f8[117] + P[_$_a7f8[87]] + _$_a7f8[118] + P[_$_a7f8[89]] + _$_a7f8[119] + P[_$_a7f8[91]] + _$_a7f8[120] + P[_$_a7f8[93]] + _$_a7f8[121] + P[_$_a7f8[103]] + _$_a7f8[122] + P[_$_a7f8[108]] + _$_a7f8[123] + P[_$_a7f8[110]] + _$_a7f8[124] + P[_$_a7f8[112]] + _$_a7f8[125] + P[_$_a7f8[114]] + _$_a7f8[126] + P[_$_a7f8[85]] + _$_a7f8[127] + P[_$_a7f8[85]] + _$_a7f8[128] + P[_$_a7f8[129]] + _$_a7f8[130] + P[_$_a7f8[85]] + _$_a7f8[131] + P[_$_a7f8[132]] + _$_a7f8[133]
                        });
                        var M = [_$_a7f8[135], _$_a7f8[136], _$_a7f8[14], _$_a7f8[137]];
                        if ($(M[2])[M[1]](M[0])) {
                            $(M[2])[M[0]]()[M[3]]()
                        };
                        $(_$_a7f8[138])[_$_a7f8[70]](I);
                        var N = [_$_a7f8[139], _$_a7f8[140], _$_a7f8[141], _$_a7f8[142], _$_a7f8[30], _$_a7f8[143], _$_a7f8[135], _$_a7f8[14]];
                        $(N[7])[N[6]]({
                            "aLengthMenu": [
                                [5, 10, 25, 50, 100, 150, 250, 500, -1],
                                [5, 10, 25, 50, 100, 150, 250, 500, N[0]]
                            ],
                            "iDisplayLength": 5,
                            "sPaginationType": N[1],
                            "bJQueryUI": false,
                            "bAutoWidth": false,
                            "bLengthChange": true,
                            "fnInitComplete": function (R, Q) {
                                $(N[5])[N[4]](N[2], N[3])
                            }
                        });
                        $(_$_a7f8[145])[_$_a7f8[58]](_$_a7f8[144])
                    }
                })
            }
            $(_$_a7f8[156])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                var u = _$_a7f8[72];
                $(_$_a7f8[149])[_$_a7f8[134]](function (w, v) {
                    u += $($(this)[_$_a7f8[147]](_$_a7f8[146])[0])[_$_a7f8[70]]() + _$_a7f8[148] + $($(this)[_$_a7f8[147]](_$_a7f8[146])[1])[_$_a7f8[70]]() + _$_a7f8[55]
                });
                u += _$_a7f8[150];
                u = u[_$_a7f8[152]](_$_a7f8[151], _$_a7f8[72]);
                u = u[_$_a7f8[152]](_$_a7f8[150], _$_a7f8[72]);
                if ($[_$_a7f8[153]](u) == _$_a7f8[72]) {
                    u = _$_a7f8[82]
                };
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    url: _$_a7f8[154] + u + _$_a7f8[155] + $(_$_a7f8[156])[_$_a7f8[24]](),
                    success: function (x) {
                        alertG(_$_a7f8[157]);
                        $(_$_a7f8[159] + $(_$_a7f8[156])[_$_a7f8[24]]() + _$_a7f8[39])[_$_a7f8[30]](_$_a7f8[158], u);
                        $(_$_a7f8[162])[_$_a7f8[161]](_$_a7f8[160])
                    }
                })
            });
            $(_$_a7f8[171])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                $(_$_a7f8[162])[_$_a7f8[161]](_$_a7f8[163]);
                $(_$_a7f8[156])[_$_a7f8[24]]($(this)[_$_a7f8[30]](_$_a7f8[164]));
                $(_$_a7f8[166])[_$_a7f8[70]]($($(this)[_$_a7f8[165]]()[_$_a7f8[165]]()[_$_a7f8[147]](_$_a7f8[146])[1])[_$_a7f8[70]]());
                $(_$_a7f8[167])[_$_a7f8[70]](_$_a7f8[72]);
                if ($(this)[_$_a7f8[30]](_$_a7f8[158]) != _$_a7f8[82]) {
                    var y = $(this)[_$_a7f8[30]](_$_a7f8[158])[_$_a7f8[86]](_$_a7f8[55]);
                    $[_$_a7f8[134]](y, function (z, A) {
                        $(_$_a7f8[167])[_$_a7f8[58]](_$_a7f8[168] + A[_$_a7f8[86]](_$_a7f8[148])[0] + _$_a7f8[169] + A[_$_a7f8[86]](_$_a7f8[148])[1] + _$_a7f8[170])
                    })
                }
            });
            $(_$_a7f8[175])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                if ($[_$_a7f8[153]]($(_$_a7f8[172])[_$_a7f8[24]]()) == _$_a7f8[72] || $[_$_a7f8[153]]($(_$_a7f8[173])[_$_a7f8[24]]()) == _$_a7f8[72]) {
                    alertR(_$_a7f8[174]);
                    return false
                };
                $(_$_a7f8[167])[_$_a7f8[58]](_$_a7f8[168] + $(_$_a7f8[172])[_$_a7f8[24]]() + _$_a7f8[169] + $(_$_a7f8[173])[_$_a7f8[24]]() + _$_a7f8[170]);
                $(_$_a7f8[172])[_$_a7f8[24]](_$_a7f8[72]);
                $(_$_a7f8[173])[_$_a7f8[24]](_$_a7f8[72])
            });
            $(_$_a7f8[177])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                $(this)[_$_a7f8[165]]()[_$_a7f8[165]]()[_$_a7f8[176]]()
            });
            $(function () {
                $(_$_a7f8[162])[_$_a7f8[161]]({
                    autoOpen: false,
                    modal: true,
                    height: 630,
                    width: 555,
                    show: {
                        effect: _$_a7f8[178],
                        duration: 500
                    },
                    hide: {
                        effect: _$_a7f8[178],
                        duration: 500
                    }
                })
            });
            $(_$_a7f8[197])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                var B = $(this)[_$_a7f8[180]](_$_a7f8[179]);
                $(_$_a7f8[181])[_$_a7f8[70]]($($(_$_a7f8[146], B)[1])[_$_a7f8[70]]());
                $(_$_a7f8[36])[_$_a7f8[30]](_$_a7f8[38], $(this)[_$_a7f8[30]](_$_a7f8[164]));
                var C = $(this)[_$_a7f8[30]](_$_a7f8[33]) == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[182] + $(this)[_$_a7f8[30]](_$_a7f8[164]) + $(this)[_$_a7f8[30]](_$_a7f8[33])[_$_a7f8[86]](_$_a7f8[55])[0];
                $(_$_a7f8[31])[_$_a7f8[30]](_$_a7f8[27], C);
                var D = $(this)[_$_a7f8[30]](_$_a7f8[42]) == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[183] + $(this)[_$_a7f8[30]](_$_a7f8[164]) + $(this)[_$_a7f8[30]](_$_a7f8[42])[_$_a7f8[86]](_$_a7f8[55])[0];
                $(_$_a7f8[41])[_$_a7f8[30]](_$_a7f8[27], D);
                var E = $(this)[_$_a7f8[30]](_$_a7f8[45]) == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[184] + $(this)[_$_a7f8[30]](_$_a7f8[164]) + $(this)[_$_a7f8[30]](_$_a7f8[45])[_$_a7f8[86]](_$_a7f8[55])[0];
                $(_$_a7f8[44])[_$_a7f8[30]](_$_a7f8[27], E);
                var F = $(this)[_$_a7f8[30]](_$_a7f8[48]) == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[185] + $(this)[_$_a7f8[30]](_$_a7f8[164]) + $(this)[_$_a7f8[30]](_$_a7f8[48])[_$_a7f8[86]](_$_a7f8[55])[0];
                $(_$_a7f8[47])[_$_a7f8[30]](_$_a7f8[27], F);
                var G = $(this)[_$_a7f8[30]](_$_a7f8[51]) == _$_a7f8[82] ? _$_a7f8[83] : _$_a7f8[186] + $(this)[_$_a7f8[30]](_$_a7f8[164]) + $(this)[_$_a7f8[30]](_$_a7f8[51])[_$_a7f8[86]](_$_a7f8[55])[0];
                $(_$_a7f8[50])[_$_a7f8[30]](_$_a7f8[27], G);
                $(_$_a7f8[188])[_$_a7f8[70]]($(this)[_$_a7f8[30]](_$_a7f8[187]));
                $(_$_a7f8[190])[_$_a7f8[70]]($(this)[_$_a7f8[30]](_$_a7f8[189]));
                $(_$_a7f8[192])[_$_a7f8[70]]($(this)[_$_a7f8[30]](_$_a7f8[191]));
                $(_$_a7f8[194])[_$_a7f8[70]]($(this)[_$_a7f8[30]](_$_a7f8[193]));
                $(_$_a7f8[196])[_$_a7f8[70]]($(this)[_$_a7f8[30]](_$_a7f8[195]));
                $(_$_a7f8[36])[_$_a7f8[161]](_$_a7f8[163])
            });
            $(function () {
                $(_$_a7f8[36])[_$_a7f8[161]]({
                    autoOpen: false,
                    modal: true,
                    height: 530,
                    width: 800,
                    show: {
                        effect: _$_a7f8[178],
                        duration: 500
                    },
                    hide: {
                        effect: _$_a7f8[178],
                        duration: 500
                    }
                })
            });
            $(_$_a7f8[204])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                var H = $(this);
                $(_$_a7f8[199])[_$_a7f8[24]](H[_$_a7f8[30]](_$_a7f8[38]))[_$_a7f8[70]](_$_a7f8[198]);
                $(_$_a7f8[9])[_$_a7f8[24]](H[_$_a7f8[30]](_$_a7f8[200]));
                $(_$_a7f8[202])[_$_a7f8[24]](H[_$_a7f8[30]](_$_a7f8[201]));
                $(_$_a7f8[203])[_$_a7f8[10]]()
            });
            $(_$_a7f8[206])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                alertR(_$_a7f8[205])
            });
            $(_$_a7f8[208])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                $(_$_a7f8[199])[_$_a7f8[24]](_$_a7f8[82])[_$_a7f8[70]](_$_a7f8[207]);
                $(_$_a7f8[202])[_$_a7f8[24]](_$_a7f8[72])
            });
            $(function () {
                $(_$_a7f8[209])[_$_a7f8[161]]({
                    autoOpen: false,
                    modal: true,
                    height: 200,
                    width: 400,
                    show: {
                        effect: _$_a7f8[178],
                        duration: 500
                    },
                    hide: {
                        effect: _$_a7f8[178],
                        duration: 500
                    }
                })
            });
            $(_$_a7f8[212])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                $(_$_a7f8[209])[_$_a7f8[161]](_$_a7f8[163]);
                $(_$_a7f8[210])[_$_a7f8[24]]($(this)[_$_a7f8[30]](_$_a7f8[164]));
                $(_$_a7f8[211])[_$_a7f8[70]]($($(this)[_$_a7f8[165]]()[_$_a7f8[165]]()[_$_a7f8[147]](_$_a7f8[146])[1])[_$_a7f8[70]]())
            });
            $(_$_a7f8[210])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                var r = $(_$_a7f8[213])[_$_a7f8[21]](0);
                var q = r[_$_a7f8[22]];
                if (q[_$_a7f8[54]] > 0) {
                    var n = $(_$_a7f8[210])[_$_a7f8[24]]();
                    var p = new FormData();
                    p[_$_a7f8[58]](_$_a7f8[57], n);
                    p[_$_a7f8[58]](q[0][_$_a7f8[59]], q[0]);
                    var o = q[0][_$_a7f8[59]][_$_a7f8[61]]((q[0][_$_a7f8[59]][_$_a7f8[60]](_$_a7f8[34]) + 1));
                    $(_$_a7f8[214] + $(_$_a7f8[210])[_$_a7f8[24]]() + _$_a7f8[39])[_$_a7f8[30]](_$_a7f8[35], _$_a7f8[34] + o);
                    var m = {};
                    m[_$_a7f8[62]] = _$_a7f8[215];
                    m[_$_a7f8[64]] = _$_a7f8[65];
                    m[_$_a7f8[66]] = p;
                    m[_$_a7f8[67]] = false;
                    m[_$_a7f8[68]] = false;
                    m[_$_a7f8[69]] = function (s) {
                        alertG(s);
                        $(_$_a7f8[209])[_$_a7f8[161]](_$_a7f8[160])
                    };
                    m[_$_a7f8[73]] = function (t) {
                        alertR(t[_$_a7f8[74]])
                    };
                    $[_$_a7f8[75]](m)
                } else {
                    alertR(_$_a7f8[216])
                }
            });
            $(_$_a7f8[221])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                if ($(this)[_$_a7f8[30]](_$_a7f8[217]) != _$_a7f8[82]) {
                    window[_$_a7f8[218]] = _$_a7f8[219] + $(this)[_$_a7f8[30]](_$_a7f8[35])
                } else {
                    alertR(_$_a7f8[220])
                }
            });
            $(_$_a7f8[223])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                window[_$_a7f8[218]] = _$_a7f8[222] + $(this)[_$_a7f8[30]](_$_a7f8[164]) + $(this)[_$_a7f8[30]](_$_a7f8[35])
            });
            $(_$_a7f8[199])[_$_a7f8[15]](_$_a7f8[10], function (a) {
                a[_$_a7f8[1]]();
                var I = _$_a7f8[72];
                $(_$_a7f8[224])[_$_a7f8[134]](function (w, v) {
                    I += $(this)[_$_a7f8[24]]() + _$_a7f8[55]
                });
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    url: _$_a7f8[225] + I,
                    success: function (x) {
                        alertG(_$_a7f8[226]);
                        k();
                        $(_$_a7f8[208])[_$_a7f8[10]]()
                    }
                })
            });
            h();
            $(_$_a7f8[228])[_$_a7f8[15]](_$_a7f8[227], f);
            $(_$_a7f8[229])[_$_a7f8[15]](_$_a7f8[227], g);
            $(_$_a7f8[230])[_$_a7f8[15]](_$_a7f8[227], c);
            $(_$_a7f8[231])[_$_a7f8[15]](_$_a7f8[227], h);
            $(_$_a7f8[232])[_$_a7f8[15]](_$_a7f8[227], d);
            $(_$_a7f8[233])[_$_a7f8[15]](_$_a7f8[227], i);
            $(_$_a7f8[79])[_$_a7f8[15]](_$_a7f8[227], j);

            function b() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    contentType: _$_a7f8[234],
                    url: _$_a7f8[235],
                    data: _$_a7f8[236],
                    async: false,
                    success: function (K) {
                        var J = $[_$_a7f8[80]](K[_$_a7f8[237]]);
                        $(_$_a7f8[228])[_$_a7f8[70]](J[_$_a7f8[238]]);
                        $(_$_a7f8[229])[_$_a7f8[70]](J[_$_a7f8[239]]);
                        $(_$_a7f8[230])[_$_a7f8[70]](J[_$_a7f8[240]]);
                        $(_$_a7f8[231])[_$_a7f8[70]](J[_$_a7f8[241]]);
                        $(_$_a7f8[232])[_$_a7f8[70]](J[_$_a7f8[242]]);
                        $(_$_a7f8[233])[_$_a7f8[70]](J[_$_a7f8[243]]);
                        $(_$_a7f8[79])[_$_a7f8[70]](J[_$_a7f8[244]]);
                        $(_$_a7f8[246])[_$_a7f8[70]](J[_$_a7f8[245]]);
                        k()
                    }
                })
            }

            function f() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    contentType: _$_a7f8[234],
                    url: _$_a7f8[247],
                    data: _$_a7f8[248] + $(_$_a7f8[228])[_$_a7f8[24]]() + _$_a7f8[249],
                    async: false,
                    success: function (K) {
                        var J = $[_$_a7f8[80]](K[_$_a7f8[237]]),
                            L = _$_a7f8[72];
                        $(_$_a7f8[229])[_$_a7f8[70]](J[_$_a7f8[239]]);
                        $(_$_a7f8[230])[_$_a7f8[70]](J[_$_a7f8[240]]);
                        $(_$_a7f8[231])[_$_a7f8[70]](J[_$_a7f8[241]]);
                        $(_$_a7f8[232])[_$_a7f8[70]](J[_$_a7f8[242]]);
                        $(_$_a7f8[233])[_$_a7f8[70]](J[_$_a7f8[243]]);
                        $(_$_a7f8[79])[_$_a7f8[70]](J[_$_a7f8[244]]);
                        $(_$_a7f8[246])[_$_a7f8[70]](J[_$_a7f8[245]]);
                        k()
                    }
                })
            }

            function g() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    contentType: _$_a7f8[234],
                    url: _$_a7f8[250],
                    data: _$_a7f8[248] + $(_$_a7f8[229])[_$_a7f8[24]]() + _$_a7f8[249],
                    async: false,
                    success: function (K) {
                        var J = $[_$_a7f8[80]](K[_$_a7f8[237]]),
                            L = _$_a7f8[72];
                        $(_$_a7f8[230])[_$_a7f8[70]](J[_$_a7f8[240]]);
                        $(_$_a7f8[231])[_$_a7f8[70]](J[_$_a7f8[241]]);
                        $(_$_a7f8[232])[_$_a7f8[70]](J[_$_a7f8[242]]);
                        $(_$_a7f8[233])[_$_a7f8[70]](J[_$_a7f8[243]]);
                        $(_$_a7f8[79])[_$_a7f8[70]](J[_$_a7f8[244]]);
                        $(_$_a7f8[246])[_$_a7f8[70]](J[_$_a7f8[245]]);
                        k()
                    }
                })
            }

            function c() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    contentType: _$_a7f8[234],
                    url: _$_a7f8[251],
                    data: _$_a7f8[248] + $(_$_a7f8[230])[_$_a7f8[24]]() + _$_a7f8[249],
                    async: false,
                    success: function (K) {
                        var J = $[_$_a7f8[80]](K[_$_a7f8[237]]),
                            L = _$_a7f8[72];
                        $(_$_a7f8[231])[_$_a7f8[70]](J[_$_a7f8[241]]);
                        $(_$_a7f8[232])[_$_a7f8[70]](J[_$_a7f8[242]]);
                        $(_$_a7f8[233])[_$_a7f8[70]](J[_$_a7f8[243]]);
                        $(_$_a7f8[79])[_$_a7f8[70]](J[_$_a7f8[244]]);
                        $(_$_a7f8[246])[_$_a7f8[70]](J[_$_a7f8[245]]);
                        k()
                    }
                })
            }

            function h() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    contentType: _$_a7f8[234],
                    url: _$_a7f8[252],
                    data: _$_a7f8[248] + $(_$_a7f8[231])[_$_a7f8[24]]() + _$_a7f8[249],
                    async: false,
                    success: function (K) {
                        var J = $[_$_a7f8[80]](K[_$_a7f8[237]]),
                            L = _$_a7f8[72];
                        $(_$_a7f8[232])[_$_a7f8[70]](J[_$_a7f8[242]]);
                        $(_$_a7f8[233])[_$_a7f8[70]](J[_$_a7f8[243]]);
                        $(_$_a7f8[79])[_$_a7f8[70]](J[_$_a7f8[244]]);
                        $(_$_a7f8[246])[_$_a7f8[70]](J[_$_a7f8[245]]);
                        k()
                    }
                })
            }

            function d() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    contentType: _$_a7f8[234],
                    url: _$_a7f8[253],
                    data: _$_a7f8[248] + $(_$_a7f8[232])[_$_a7f8[24]]() + _$_a7f8[249],
                    async: false,
                    success: function (K) {
                        var J = $[_$_a7f8[80]](K[_$_a7f8[237]]),
                            L = _$_a7f8[72];
                        $(_$_a7f8[233])[_$_a7f8[70]](J[_$_a7f8[243]]);
                        $(_$_a7f8[79])[_$_a7f8[70]](J[_$_a7f8[244]]);
                        $(_$_a7f8[246])[_$_a7f8[70]](J[_$_a7f8[245]]);
                        k()
                    }
                })
            }

            function i() {
                $[_$_a7f8[75]]({
                    type: _$_a7f8[65],
                    contentType: _$_a7f8[234],
                    url: _$_a7f8[254],
                    data: _$_a7f8[248] + $(_$_a7f8[233])[_$_a7f8[24]]() + _$_a7f8[249],
                    async: false,
                    success: function (K) {
                        var J = $[_$_a7f8[80]](K[_$_a7f8[237]]),
                            L = _$_a7f8[72];
                        $(_$_a7f8[79])[_$_a7f8[70]](J[_$_a7f8[244]]);
                        $(_$_a7f8[246])[_$_a7f8[70]](J[_$_a7f8[245]]);
                        k()
                    }
                })
            }

            function j() {
                k()
            }
        })
    </script>
</asp:Content>
