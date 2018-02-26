<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="SlumAreaReg.aspx.cs" Inherits="FRDP.SlumAreaReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
         .btnKMZD[ext="0"] {
           display:none;
        }
         #tblAnimals > tbody > tr > td   {
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
                    <th><button id="btnAddGPSTemp" class="btn btn-info" style="margin-bottom:10px;"> + </button></th>
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
                            <tr>

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
                                    <select id="ddlGeoUnionConcil" class="frm" name="D7" style="width: 250px"></select>
                                </td>
                                <td>Slum Name</td>
                                <td>
                                    <input id="txtSlum" type="text" class="frm" style="width: 238px;" />
                                </td>

                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <button id="btnSave" value="0" class="btn btn-info frm" style="margin-left: 120px;">Save</button>
                                    <button id="btnCancel" class="btn btn-info">Cancel</button>
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
                                <th style="width: 60px;">Action</th>
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
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {
            $('#txtDate').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    // Load22Graphs();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

            var _$_18af = ["click", "preventDefault", "excel", "false", "tableExport", "#tblAnimals", "live", "#btnExcel", "doc", "#btnWord", "png", "#btnPNG", "get", "files", "onload", "val", "#ddlSide", "1", "src", "result", "target", "attr", "#photo1", "show", "ph1", ".", "ext", "#dvAnimalPics", ".btnImage[tag=", "tg", "]", "2", "#photo2", "ph2", "3", "#photo3", "ph3", "4", "#photo4", "ph4", "5", "#photo5", "ph5", "readAsDataURL", "#fileUpload", "length", "½", "#txtCaption", "vls", "append", "name", "lastIndexOf", "substr", "url", "UploadSlumPics.ashx", "type", "POST", "data", "contentType", "processData", "success", "html", "#c", "", "error", "statusText", "ajax", "Attach Some Photo..!", "#btnUploadPhoto", "ghEFS.ashx/?ID=6\u01c1", "#ddlGeoUnionConcil", "parseJSON", "photoA", "0", "images/No_image_available.png", "Uploads/SlumPhotos/1B", "tblSlumID", "split", "photoB", "Uploads/SlumPhotos/2B", "photoC", "Uploads/SlumPhotos/3B", "photoD", "Uploads/SlumPhotos/4B", "photoE", "Uploads/SlumPhotos/5B", "<tr>\r                                <td style=\"width: 30px;\">", "toString", "</td>\r                                <td>", "strSlumName", "dtSlumSurveyDate", "</td>\r                                <td><div b=\"", "\" ext=\"1_", "\" style=\"width: 60px; height: 60px\" class=\"Grd\" title=\"", "Caption1", "\"><img alt=\"User Registration\" src=\"", "\" width=\"54\" height=\"54\"></div></td>\r                                <td><div b=\"", "\" ext=\"2_", "\" style=\"width: 60px; height: 60px\" class=\"Grd imgD\" title=\"", "Caption2", "\" ext=\"3_", "Caption3", "\" ext=\"4_", "Caption4", "\" ext=\"5_", "Caption5", "\" width=\"54\" height=\"54\"></div></td>\r                                <td><button tag=\"", "\" ph1=\"", "\" ph2=\"", "\" ph3=\"", "\" ph4=\"", "\" ph5=\"", "\" c1=\"", "\" c2=\"", "\" c3=\"", "\" c4=\"", "\" c5=\"", "\" class=\"btn btn-info btnImage\"><span class=\"icon16 icomoon-icon-camera-2 white\"></span>Attach</button></td>\r                                <td><button tag=\"", "\"  class=\"btn btn-info btnKMZ\" style=\"width: 110.1px;\"><span class=\"icon16 icomoon-icon-map white\"></span>Attach</button>\r                                <button tag=\"", "\"  ext=\"", "KMZFileExtention", "\" class=\"btn btn-success btnKMZD\" style=\"margin-top:2px;\" style=\"width: 110.1px;\"><span class=\"icon16 icomoon-icon-file-download white\"></span>Download</button></td>\r                                <td><button tag=\"", "\" boun=\"", "SlumBoundary", "\" class=\"btn btn-info btnGPS\" style=\"width: 110.1px;\"><span class=\"icon16  icomoon-icon-location-2 white\"></span>Add GPS</button>\r                                </td>\r<td>\r                                          <a tg=", " vl=", " dt=", " class=\"tip clsEdit\" oldtitle=\"Edit\" title=\"\" aria-describedby=\"ui-tooltip-13\"><span class=\"icon12 icomoon-icon-pencil\"></span></a>\r                                          <a tg=", " class=\"tip clsDelete\" oldtitle=\"Remove\" title=\"\" aria-describedby=\"ui-tooltip-14\"><span class=\"icon12 icomoon-icon-remove\"></span></a>\r</td>\r                            </tr>", "each", "dataTable", "hasClass", "fnDestroy", "#tblAnimals tbody", "All", "full_numbers", "id", "search", ".dataTables_filter>label>input", "<input type=\"image\" name=\"btnExcel\" id=\"btnExcel\" title=\"Export to Excel\" class=\"Grd\" src=\"images/xcel.png\" style=\"border-width:0px;\">&nbsp;<input type=\"image\" name=\"btnWord\" id=\"btnWord\" title=\"Export to Word\" class=\"Grd\" src=\"images/wrd.png\" style=\"border-width:0px;\">&nbsp;<input type=\"image\" name=\"btnPNG\" id=\"btnPNG\" title=\"Export to PNG\" class=\"Grd\" src=\"images/png.png\" style=\"width: 16px;border-width:0px;\">", "#tblAnimals_filter label", "td", "find", ",", "#tblTempGPS tbody tr", "¼", "½¼", "replace", "trim", "ghEFS.ashx/?ID=14\u01c1", "\u01c1", "#btnSaveGPS", "Record Saved..!", "boun", ".btnGPS[tag=", "close", "dialog", "#dvGPS", "open", "tag", "parent", "#atag1", "#tblTempGPS tbody", "<tr><td style=\"text-align:center;\">", "</td><td>", "</td><td><button class=\"btn btn-danger rmo\"> X </button></td></tr>", ".btnGPS", "focusout", "°", "indexOf", "#txtLat", "'", "\"", "#txtLng", "Enter valid GPS..!", "#btnAddGPSTemp", "remove", ".rmo", "clip", "tr", "closest", "#atag", "Uploads/SlumPhotos/1_", "Uploads/SlumPhotos/2_", "Uploads/SlumPhotos/3_", "Uploads/SlumPhotos/4_", "Uploads/SlumPhotos/5_", "c1", "#c1", "c2", "#c2", "c3", "#c3", "c4", "#c4", "c5", "#c5", ".btnImage", "Update", "#btnSave", "dt", "#txtDate", "vl", "#txtSlum", "#toTop", ".clsEdit", "Dont have permission to delete..!", ".clsDelete", "Save", "#btnCancel", "#dvKMZUP", "#Upload-KMZ", "#atag2", ".btnKMZ", "#FileKMZ", ".btnKMZD[tag=", "UploadKMZ.ashx", "Attach KMZ file..!", "b", "location", "ghEFS.ashx/?ID=18\u01c1", "No Image Attached..!", ".imgD", "ghEFS.ashx/?ID=17\u01c1", ".btnKMZD", ".frm", "ghEFS.ashx/?ID=3\u01c1", "Record Saved", "change", "#ddlGeoCountry", "#ddlGeoProvince", "#ddlGeoRegion", "#ddlGeoDestrict", "#ddlGeoTehsil", "#ddlGeoFeildUnit", "application/json; charset=utf-8", "LocationNew.aspx/BindCountry", "{}", "d", "Country", "Province", "Region", "District", "Tehsil", "FU", "UC", "village", "#ddlGeoUnionVillage", "LocationNew.aspx/BindProvince", "{'ID':'", "'}", "LocationNew.aspx/BindRegion", "LocationNew.aspx/BindDistrict", "LocationNew.aspx/BindTehsil", "LocationNew.aspx/BindFU", "LocationNew.aspx/BindUC"];
            $(_$_18af[7])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                $(_$_18af[5])[_$_18af[4]]({
                    type: _$_18af[2],
                    escape: _$_18af[3]
                });
                a[_$_18af[1]]()
            });
            $(_$_18af[9])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                $(_$_18af[5])[_$_18af[4]]({
                    type: _$_18af[8],
                    escape: _$_18af[3]
                });
                a[_$_18af[1]]()
            });
            $(_$_18af[11])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                $(_$_18af[5])[_$_18af[4]]({
                    type: _$_18af[10],
                    escape: _$_18af[3]
                });
                a[_$_18af[1]]()
            });

            function showimagepreview(T) {
                var R = T[_$_18af[12]](0);
                if (R[_$_18af[13]] && R[_$_18af[13]][0]) {
                    var Q = new FileReader();
                    Q[_$_18af[14]] = function (a) {
                        if ($(_$_18af[16])[_$_18af[15]]() == _$_18af[17]) {
                            $(_$_18af[22])[_$_18af[21]](_$_18af[18], a[_$_18af[20]][_$_18af[19]]);
                            $(_$_18af[22])[_$_18af[23]]();
                            $(_$_18af[28] + $(_$_18af[27])[_$_18af[21]](_$_18af[29]) + _$_18af[30])[_$_18af[21]](_$_18af[24], _$_18af[25] + $(_$_18af[27])[_$_18af[21]](_$_18af[26]))
                        };
                        if ($(_$_18af[16])[_$_18af[15]]() == _$_18af[31]) {
                            $(_$_18af[32])[_$_18af[21]](_$_18af[18], a[_$_18af[20]][_$_18af[19]]);
                            $(_$_18af[32])[_$_18af[23]]();
                            $(_$_18af[28] + $(_$_18af[27])[_$_18af[21]](_$_18af[29]) + _$_18af[30])[_$_18af[21]](_$_18af[33], _$_18af[25] + $(_$_18af[27])[_$_18af[21]](_$_18af[26]))
                        };
                        if ($(_$_18af[16])[_$_18af[15]]() == _$_18af[34]) {
                            $(_$_18af[35])[_$_18af[21]](_$_18af[18], a[_$_18af[20]][_$_18af[19]]);
                            $(_$_18af[35])[_$_18af[23]]();
                            $(_$_18af[28] + $(_$_18af[27])[_$_18af[21]](_$_18af[29]) + _$_18af[30])[_$_18af[21]](_$_18af[36], _$_18af[25] + $(_$_18af[27])[_$_18af[21]](_$_18af[26]))
                        };
                        if ($(_$_18af[16])[_$_18af[15]]() == _$_18af[37]) {
                            $(_$_18af[38])[_$_18af[21]](_$_18af[18], a[_$_18af[20]][_$_18af[19]]);
                            $(_$_18af[38])[_$_18af[23]]();
                            $(_$_18af[28] + $(_$_18af[27])[_$_18af[21]](_$_18af[29]) + _$_18af[30])[_$_18af[21]](_$_18af[39], _$_18af[25] + $(_$_18af[27])[_$_18af[21]](_$_18af[26]))
                        };
                        if ($(_$_18af[16])[_$_18af[15]]() == _$_18af[40]) {
                            $(_$_18af[41])[_$_18af[21]](_$_18af[18], a[_$_18af[20]][_$_18af[19]]);
                            $(_$_18af[41])[_$_18af[23]]();
                            $(_$_18af[28] + $(_$_18af[27])[_$_18af[21]](_$_18af[29]) + _$_18af[30])[_$_18af[21]](_$_18af[42], _$_18af[25] + $(_$_18af[27])[_$_18af[21]](_$_18af[26]))
                        };
                        LoadGrid()
                    };
                    Q[_$_18af[43]](R[_$_18af[13]][0])
                }
            }
            $(_$_18af[68])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                var h = $(_$_18af[44])[_$_18af[12]](0);
                var g = h[_$_18af[13]];
                if (g[_$_18af[45]] > 0) {
                    var c = $(_$_18af[27])[_$_18af[21]](_$_18af[29]) + _$_18af[46] + $(_$_18af[16])[_$_18af[15]]() + _$_18af[46] + $(_$_18af[47])[_$_18af[15]]();
                    var f = new FormData();
                    f[_$_18af[49]](_$_18af[48], c);
                    f[_$_18af[49]](g[0][_$_18af[50]], g[0]);
                    var d = g[0][_$_18af[50]][_$_18af[52]]((g[0][_$_18af[50]][_$_18af[51]](_$_18af[25]) + 1));
                    $(_$_18af[27])[_$_18af[21]](_$_18af[26], d);
                    var b = {};
                    b[_$_18af[53]] = _$_18af[54];
                    b[_$_18af[55]] = _$_18af[56];
                    b[_$_18af[57]] = f;
                    b[_$_18af[58]] = false;
                    b[_$_18af[59]] = false;
                    b[_$_18af[60]] = function (i) {
                        alertG(i);
                        showimagepreview($(_$_18af[44]));
                        $(_$_18af[62] + $(_$_18af[16])[_$_18af[15]]())[_$_18af[61]]($(_$_18af[47])[_$_18af[15]]());
                        $(_$_18af[47])[_$_18af[15]](_$_18af[63])
                    };
                    b[_$_18af[64]] = function (j) {
                        alertR(j[_$_18af[65]])
                    };
                    $[_$_18af[66]](b)
                } else {
                    alertR(_$_18af[67])
                }
            });

            function LoadGrid() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    url: _$_18af[69] + $(_$_18af[70])[_$_18af[15]](),
                    success: function (n) {
                        var L = $[_$_18af[71]](n),
                            F = _$_18af[63];
                        $[_$_18af[129]](L, function (p, N) {
                            var y = N[_$_18af[72]] == _$_18af[73] ? _$_18af[74] : _$_18af[75] + N[_$_18af[76]] + N[_$_18af[72]][_$_18af[77]](_$_18af[46])[0];
                            var z = N[_$_18af[78]] == _$_18af[73] ? _$_18af[74] : _$_18af[79] + N[_$_18af[76]] + N[_$_18af[78]][_$_18af[77]](_$_18af[46])[0];
                            var A = N[_$_18af[80]] == _$_18af[73] ? _$_18af[74] : _$_18af[81] + N[_$_18af[76]] + N[_$_18af[80]][_$_18af[77]](_$_18af[46])[0];
                            var B = N[_$_18af[82]] == _$_18af[73] ? _$_18af[74] : _$_18af[83] + N[_$_18af[76]] + N[_$_18af[82]][_$_18af[77]](_$_18af[46])[0];
                            var C = N[_$_18af[84]] == _$_18af[73] ? _$_18af[74] : _$_18af[85] + N[_$_18af[76]] + N[_$_18af[84]][_$_18af[77]](_$_18af[46])[0];
                            F += _$_18af[86] + (parseInt(p) + 1)[_$_18af[87]]() + _$_18af[88] + N[_$_18af[89]] + _$_18af[88] + N[_$_18af[90]] + _$_18af[91] + N[_$_18af[72]] + _$_18af[92] + N[_$_18af[76]] + N[_$_18af[72]][_$_18af[77]](_$_18af[46])[0] + _$_18af[93] + N[_$_18af[94]] + _$_18af[95] + y + _$_18af[96] + N[_$_18af[78]] + _$_18af[97] + N[_$_18af[76]] + N[_$_18af[78]][_$_18af[77]](_$_18af[46])[0] + _$_18af[98] + N[_$_18af[99]] + _$_18af[95] + z + _$_18af[96] + N[_$_18af[80]] + _$_18af[100] + N[_$_18af[76]] + N[_$_18af[80]][_$_18af[77]](_$_18af[46])[0] + _$_18af[98] + N[_$_18af[101]] + _$_18af[95] + A + _$_18af[96] + N[_$_18af[82]] + _$_18af[102] + N[_$_18af[76]] + N[_$_18af[82]][_$_18af[77]](_$_18af[46])[0] + _$_18af[98] + N[_$_18af[103]] + _$_18af[95] + B + _$_18af[96] + N[_$_18af[84]] + _$_18af[104] + N[_$_18af[76]] + N[_$_18af[84]][_$_18af[77]](_$_18af[46])[0] + _$_18af[98] + N[_$_18af[105]] + _$_18af[95] + C + _$_18af[106] + N[_$_18af[76]] + _$_18af[107] + N[_$_18af[72]] + _$_18af[108] + N[_$_18af[78]] + _$_18af[109] + N[_$_18af[80]] + _$_18af[110] + N[_$_18af[82]] + _$_18af[111] + N[_$_18af[84]] + _$_18af[112] + N[_$_18af[94]] + _$_18af[113] + N[_$_18af[99]] + _$_18af[114] + N[_$_18af[101]] + _$_18af[115] + N[_$_18af[103]] + _$_18af[116] + N[_$_18af[105]] + _$_18af[117] + N[_$_18af[76]] + _$_18af[118] + N[_$_18af[76]] + _$_18af[119] + N[_$_18af[120]] + _$_18af[121] + N[_$_18af[76]] + _$_18af[122] + N[_$_18af[123]] + _$_18af[124] + N[_$_18af[76]] + _$_18af[125] + N[_$_18af[89]] + _$_18af[126] + N[_$_18af[90]] + _$_18af[127] + N[_$_18af[76]] + _$_18af[128]
                        });
                        var J = [_$_18af[130], _$_18af[131], _$_18af[5], _$_18af[132]];
                        if ($(J[2])[J[1]](J[0])) {
                            $(J[2])[J[0]]()[J[3]]()
                        };
                        $(_$_18af[133])[_$_18af[61]](F);
                        var K = [_$_18af[134], _$_18af[135], _$_18af[136], _$_18af[137], _$_18af[21], _$_18af[138], _$_18af[130], _$_18af[5]];
                        $(K[7])[K[6]]({
                            "aLengthMenu": [
                                [5, 10, 25, 50, 100, 150, 250, 500, -1],
                                [5, 10, 25, 50, 100, 150, 250, 500, K[0]]
                            ],
                            "iDisplayLength": 5,
                            "sPaginationType": K[1],
                            "bJQueryUI": false,
                            "bAutoWidth": false,
                            "bLengthChange": true,
                            "fnInitComplete": function (P, O) {
                                $(K[5])[K[4]](K[2], K[3])
                            }
                        });
                        $(_$_18af[140])[_$_18af[49]](_$_18af[139])
                    }
                })
            }
            $(_$_18af[151])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                var k = _$_18af[63];
                $(_$_18af[144])[_$_18af[129]](function (m, l) {
                    k += $($(this)[_$_18af[142]](_$_18af[141])[0])[_$_18af[61]]() + _$_18af[143] + $($(this)[_$_18af[142]](_$_18af[141])[1])[_$_18af[61]]() + _$_18af[46]
                });
                k += _$_18af[145];
                k = k[_$_18af[147]](_$_18af[146], _$_18af[63]);
                k = k[_$_18af[147]](_$_18af[145], _$_18af[63]);
                if ($[_$_18af[148]](k) == _$_18af[63]) {
                    k = _$_18af[73]
                };
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    url: _$_18af[149] + k + _$_18af[150] + $(_$_18af[151])[_$_18af[15]](),
                    success: function (n) {
                        alertG(_$_18af[152]);
                        $(_$_18af[154] + $(_$_18af[151])[_$_18af[15]]() + _$_18af[30])[_$_18af[21]](_$_18af[153], k);
                        $(_$_18af[157])[_$_18af[156]](_$_18af[155])
                    }
                })
            });
            $(_$_18af[166])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                $(_$_18af[157])[_$_18af[156]](_$_18af[158]);
                $(_$_18af[151])[_$_18af[15]]($(this)[_$_18af[21]](_$_18af[159]));
                $(_$_18af[161])[_$_18af[61]]($($(this)[_$_18af[160]]()[_$_18af[160]]()[_$_18af[142]](_$_18af[141])[1])[_$_18af[61]]());
                $(_$_18af[162])[_$_18af[61]](_$_18af[63]);
                if ($(this)[_$_18af[21]](_$_18af[153]) != _$_18af[73]) {
                    var o = $(this)[_$_18af[21]](_$_18af[153])[_$_18af[77]](_$_18af[46]);
                    $[_$_18af[129]](o, function (p, q) {
                        $(_$_18af[162])[_$_18af[49]](_$_18af[163] + q[_$_18af[77]](_$_18af[143])[0] + _$_18af[164] + q[_$_18af[77]](_$_18af[143])[1] + _$_18af[165])
                    })
                }
            });
            $(_$_18af[170])[_$_18af[6]](_$_18af[167], function (a) {
                a[_$_18af[1]]();
                if ($[_$_18af[148]]($(_$_18af[170])[_$_18af[15]]())[_$_18af[169]](_$_18af[168]) >= 0 && $[_$_18af[148]]($(_$_18af[170])[_$_18af[15]]())[_$_18af[169]](_$_18af[171]) >= 0 && $[_$_18af[148]]($(_$_18af[170])[_$_18af[15]]())[_$_18af[169]](_$_18af[172]) >= 0) {
                    var r = $[_$_18af[148]]($(_$_18af[170])[_$_18af[15]]())[_$_18af[77]](_$_18af[168])[0];
                    var s = $[_$_18af[148]]($(_$_18af[170])[_$_18af[15]]())[_$_18af[147]](r[_$_18af[87]]() + _$_18af[168], _$_18af[63]);
                    var t = s[_$_18af[77]](_$_18af[171])[0];
                    var v = $[_$_18af[148]]($(_$_18af[170])[_$_18af[15]]())[_$_18af[147]](r[_$_18af[87]]() + _$_18af[168] + t[_$_18af[87]]() + _$_18af[171], _$_18af[63]);
                    var w = v[_$_18af[77]](_$_18af[172])[0];
                    var u = parseFloat(r) + (parseFloat(t) / 60) + (parseFloat(w) / 3600);
                    $(_$_18af[170])[_$_18af[15]](u[_$_18af[87]]())
                }
            });
            $(_$_18af[173])[_$_18af[6]](_$_18af[167], function (a) {
                a[_$_18af[1]]();
                if ($[_$_18af[148]]($(_$_18af[173])[_$_18af[15]]())[_$_18af[169]](_$_18af[168]) >= 0 && $[_$_18af[148]]($(_$_18af[173])[_$_18af[15]]())[_$_18af[169]](_$_18af[171]) >= 0 && $[_$_18af[148]]($(_$_18af[173])[_$_18af[15]]())[_$_18af[169]](_$_18af[172]) >= 0) {
                    var r = $[_$_18af[148]]($(_$_18af[173])[_$_18af[15]]())[_$_18af[77]](_$_18af[168])[0];
                    var s = $[_$_18af[148]]($(_$_18af[173])[_$_18af[15]]())[_$_18af[147]](r[_$_18af[87]]() + _$_18af[168], _$_18af[63]);
                    var t = s[_$_18af[77]](_$_18af[171])[0];
                    var v = $[_$_18af[148]]($(_$_18af[173])[_$_18af[15]]())[_$_18af[147]](r[_$_18af[87]]() + _$_18af[168] + t[_$_18af[87]]() + _$_18af[171], _$_18af[63]);
                    var w = v[_$_18af[77]](_$_18af[172])[0];
                    var u = parseFloat(r) + (parseFloat(t) / 60) + (parseFloat(w) / 3600);
                    $(_$_18af[173])[_$_18af[15]](u[_$_18af[87]]())
                }
            });
            $(_$_18af[175])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                if ($[_$_18af[148]]($(_$_18af[170])[_$_18af[15]]()) == _$_18af[63] || $[_$_18af[148]]($(_$_18af[173])[_$_18af[15]]()) == _$_18af[63]) {
                    alertR(_$_18af[174]);
                    return false
                };
                $(_$_18af[162])[_$_18af[49]](_$_18af[163] + $(_$_18af[170])[_$_18af[15]]() + _$_18af[164] + $(_$_18af[173])[_$_18af[15]]() + _$_18af[165]);
                $(_$_18af[170])[_$_18af[15]](_$_18af[63]);
                $(_$_18af[173])[_$_18af[15]](_$_18af[63])
            });
            $(_$_18af[177])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                $(this)[_$_18af[160]]()[_$_18af[160]]()[_$_18af[176]]()
            });
            $(function () {
                $(_$_18af[157])[_$_18af[156]]({
                    autoOpen: false,
                    modal: true,
                    height: 630,
                    width: 555,
                    show: {
                        effect: _$_18af[178],
                        duration: 500
                    },
                    hide: {
                        effect: _$_18af[178],
                        duration: 500
                    }
                })
            });
            $(_$_18af[197])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                var x = $(this)[_$_18af[180]](_$_18af[179]);
                $(_$_18af[181])[_$_18af[61]]($($(_$_18af[141], x)[1])[_$_18af[61]]());
                $(_$_18af[27])[_$_18af[21]](_$_18af[29], $(this)[_$_18af[21]](_$_18af[159]));
                var y = $(this)[_$_18af[21]](_$_18af[24]) == _$_18af[73] ? _$_18af[74] : _$_18af[182] + $(this)[_$_18af[21]](_$_18af[159]) + $(this)[_$_18af[21]](_$_18af[24])[_$_18af[77]](_$_18af[46])[0];
                $(_$_18af[22])[_$_18af[21]](_$_18af[18], y);
                var z = $(this)[_$_18af[21]](_$_18af[33]) == _$_18af[73] ? _$_18af[74] : _$_18af[183] + $(this)[_$_18af[21]](_$_18af[159]) + $(this)[_$_18af[21]](_$_18af[33])[_$_18af[77]](_$_18af[46])[0];
                $(_$_18af[32])[_$_18af[21]](_$_18af[18], z);
                var A = $(this)[_$_18af[21]](_$_18af[36]) == _$_18af[73] ? _$_18af[74] : _$_18af[184] + $(this)[_$_18af[21]](_$_18af[159]) + $(this)[_$_18af[21]](_$_18af[36])[_$_18af[77]](_$_18af[46])[0];
                $(_$_18af[35])[_$_18af[21]](_$_18af[18], A);
                var B = $(this)[_$_18af[21]](_$_18af[39]) == _$_18af[73] ? _$_18af[74] : _$_18af[185] + $(this)[_$_18af[21]](_$_18af[159]) + $(this)[_$_18af[21]](_$_18af[39])[_$_18af[77]](_$_18af[46])[0];
                $(_$_18af[38])[_$_18af[21]](_$_18af[18], B);
                var C = $(this)[_$_18af[21]](_$_18af[42]) == _$_18af[73] ? _$_18af[74] : _$_18af[186] + $(this)[_$_18af[21]](_$_18af[159]) + $(this)[_$_18af[21]](_$_18af[42])[_$_18af[77]](_$_18af[46])[0];
                $(_$_18af[41])[_$_18af[21]](_$_18af[18], C);
                $(_$_18af[188])[_$_18af[61]]($(this)[_$_18af[21]](_$_18af[187]));
                $(_$_18af[190])[_$_18af[61]]($(this)[_$_18af[21]](_$_18af[189]));
                $(_$_18af[192])[_$_18af[61]]($(this)[_$_18af[21]](_$_18af[191]));
                $(_$_18af[194])[_$_18af[61]]($(this)[_$_18af[21]](_$_18af[193]));
                $(_$_18af[196])[_$_18af[61]]($(this)[_$_18af[21]](_$_18af[195]));
                $(_$_18af[27])[_$_18af[156]](_$_18af[158])
            });
            $(function () {
                $(_$_18af[27])[_$_18af[156]]({
                    autoOpen: false,
                    modal: true,
                    height: 530,
                    width: 800,
                    show: {
                        effect: _$_18af[178],
                        duration: 500
                    },
                    hide: {
                        effect: _$_18af[178],
                        duration: 500
                    }
                })
            });
            $(_$_18af[205])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                var E = $(this);
                $(_$_18af[199])[_$_18af[15]](E[_$_18af[21]](_$_18af[29]))[_$_18af[61]](_$_18af[198]);
                $(_$_18af[201])[_$_18af[15]](E[_$_18af[21]](_$_18af[200]));
                $(_$_18af[203])[_$_18af[15]](E[_$_18af[21]](_$_18af[202]));
                $(_$_18af[204])[_$_18af[0]]()
            });
            $(_$_18af[207])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                alertR(_$_18af[206])
            });
            $(_$_18af[209])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                $(_$_18af[199])[_$_18af[15]](_$_18af[73])[_$_18af[61]](_$_18af[208]);
                $(_$_18af[203])[_$_18af[15]](_$_18af[63])
            });
            $(function () {
                $(_$_18af[210])[_$_18af[156]]({
                    autoOpen: false,
                    modal: true,
                    height: 200,
                    width: 400,
                    show: {
                        effect: _$_18af[178],
                        duration: 500
                    },
                    hide: {
                        effect: _$_18af[178],
                        duration: 500
                    }
                })
            });
            $(_$_18af[213])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                $(_$_18af[210])[_$_18af[156]](_$_18af[158]);
                $(_$_18af[211])[_$_18af[15]]($(this)[_$_18af[21]](_$_18af[159]));
                $(_$_18af[212])[_$_18af[61]]($($(this)[_$_18af[160]]()[_$_18af[160]]()[_$_18af[142]](_$_18af[141])[1])[_$_18af[61]]())
            });
            $(_$_18af[211])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                var h = $(_$_18af[214])[_$_18af[12]](0);
                var g = h[_$_18af[13]];
                if (g[_$_18af[45]] > 0) {
                    var c = $(_$_18af[211])[_$_18af[15]]();
                    var f = new FormData();
                    f[_$_18af[49]](_$_18af[48], c);
                    f[_$_18af[49]](g[0][_$_18af[50]], g[0]);
                    var d = g[0][_$_18af[50]][_$_18af[52]]((g[0][_$_18af[50]][_$_18af[51]](_$_18af[25]) + 1));
                    $(_$_18af[215] + $(_$_18af[211])[_$_18af[15]]() + _$_18af[30])[_$_18af[21]](_$_18af[26], _$_18af[25] + d);
                    var b = {};
                    b[_$_18af[53]] = _$_18af[216];
                    b[_$_18af[55]] = _$_18af[56];
                    b[_$_18af[57]] = f;
                    b[_$_18af[58]] = false;
                    b[_$_18af[59]] = false;
                    b[_$_18af[60]] = function (i) {
                        alertG(i);
                        $(_$_18af[210])[_$_18af[156]](_$_18af[155])
                    };
                    b[_$_18af[64]] = function (j) {
                        alertR(j[_$_18af[65]])
                    };
                    $[_$_18af[66]](b)
                } else {
                    alertR(_$_18af[217])
                }
            });
            $(_$_18af[222])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                if ($(this)[_$_18af[21]](_$_18af[218]) != _$_18af[73]) {
                    window[_$_18af[219]] = _$_18af[220] + $(this)[_$_18af[21]](_$_18af[26])
                } else {
                    alertR(_$_18af[221])
                }
            });
            $(_$_18af[224])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                window[_$_18af[219]] = _$_18af[223] + $(this)[_$_18af[21]](_$_18af[159]) + $(this)[_$_18af[21]](_$_18af[26])
            });
            $(_$_18af[199])[_$_18af[6]](_$_18af[0], function (a) {
                a[_$_18af[1]]();
                var F = _$_18af[63];
                $(_$_18af[225])[_$_18af[129]](function (m, l) {
                    F += $(this)[_$_18af[15]]() + _$_18af[46]
                });
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    url: _$_18af[226] + F,
                    success: function (n) {
                        alertG(_$_18af[227]);
                        LoadGrid();
                        $(_$_18af[209])[_$_18af[0]]()
                    }
                })
            });
            BindTehsil();
            $(_$_18af[229])[_$_18af[6]](_$_18af[228], BindProvince);
            $(_$_18af[230])[_$_18af[6]](_$_18af[228], BindRegion);
            $(_$_18af[231])[_$_18af[6]](_$_18af[228], BindDistrict);
            $(_$_18af[232])[_$_18af[6]](_$_18af[228], BindTehsil);
            $(_$_18af[233])[_$_18af[6]](_$_18af[228], BindFU);
            $(_$_18af[234])[_$_18af[6]](_$_18af[228], BindUC);
            $(_$_18af[70])[_$_18af[6]](_$_18af[228], BindVillage);

            function BindCountry() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    contentType: _$_18af[235],
                    url: _$_18af[236],
                    data: _$_18af[237],
                    async: false,
                    success: function (H) {
                        var G = $[_$_18af[71]](H[_$_18af[238]]);
                        $(_$_18af[229])[_$_18af[61]](G[_$_18af[239]]);
                        $(_$_18af[230])[_$_18af[61]](G[_$_18af[240]]);
                        $(_$_18af[231])[_$_18af[61]](G[_$_18af[241]]);
                        $(_$_18af[232])[_$_18af[61]](G[_$_18af[242]]);
                        $(_$_18af[233])[_$_18af[61]](G[_$_18af[243]]);
                        $(_$_18af[234])[_$_18af[61]](G[_$_18af[244]]);
                        $(_$_18af[70])[_$_18af[61]](G[_$_18af[245]]);
                        $(_$_18af[247])[_$_18af[61]](G[_$_18af[246]]);
                        LoadGrid()
                    }
                })
            }

            function BindProvince() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    contentType: _$_18af[235],
                    url: _$_18af[248],
                    data: _$_18af[249] + $(_$_18af[229])[_$_18af[15]]() + _$_18af[250],
                    async: false,
                    success: function (H) {
                        var G = $[_$_18af[71]](H[_$_18af[238]]),
                            I = _$_18af[63];
                        $(_$_18af[230])[_$_18af[61]](G[_$_18af[240]]);
                        $(_$_18af[231])[_$_18af[61]](G[_$_18af[241]]);
                        $(_$_18af[232])[_$_18af[61]](G[_$_18af[242]]);
                        $(_$_18af[233])[_$_18af[61]](G[_$_18af[243]]);
                        $(_$_18af[234])[_$_18af[61]](G[_$_18af[244]]);
                        $(_$_18af[70])[_$_18af[61]](G[_$_18af[245]]);
                        $(_$_18af[247])[_$_18af[61]](G[_$_18af[246]]);
                        LoadGrid()
                    }
                })
            }

            function BindRegion() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    contentType: _$_18af[235],
                    url: _$_18af[251],
                    data: _$_18af[249] + $(_$_18af[230])[_$_18af[15]]() + _$_18af[250],
                    async: false,
                    success: function (H) {
                        var G = $[_$_18af[71]](H[_$_18af[238]]),
                            I = _$_18af[63];
                        $(_$_18af[231])[_$_18af[61]](G[_$_18af[241]]);
                        $(_$_18af[232])[_$_18af[61]](G[_$_18af[242]]);
                        $(_$_18af[233])[_$_18af[61]](G[_$_18af[243]]);
                        $(_$_18af[234])[_$_18af[61]](G[_$_18af[244]]);
                        $(_$_18af[70])[_$_18af[61]](G[_$_18af[245]]);
                        $(_$_18af[247])[_$_18af[61]](G[_$_18af[246]]);
                        LoadGrid()
                    }
                })
            }

            function BindDistrict() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    contentType: _$_18af[235],
                    url: _$_18af[252],
                    data: _$_18af[249] + $(_$_18af[231])[_$_18af[15]]() + _$_18af[250],
                    async: false,
                    success: function (H) {
                        var G = $[_$_18af[71]](H[_$_18af[238]]),
                            I = _$_18af[63];
                        $(_$_18af[232])[_$_18af[61]](G[_$_18af[242]]);
                        $(_$_18af[233])[_$_18af[61]](G[_$_18af[243]]);
                        $(_$_18af[234])[_$_18af[61]](G[_$_18af[244]]);
                        $(_$_18af[70])[_$_18af[61]](G[_$_18af[245]]);
                        $(_$_18af[247])[_$_18af[61]](G[_$_18af[246]]);
                        LoadGrid()
                    }
                })
            }

            function BindTehsil() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    contentType: _$_18af[235],
                    url: _$_18af[253],
                    data: _$_18af[249] + $(_$_18af[232])[_$_18af[15]]() + _$_18af[250],
                    async: false,
                    success: function (H) {
                        var G = $[_$_18af[71]](H[_$_18af[238]]),
                            I = _$_18af[63];
                        $(_$_18af[233])[_$_18af[61]](G[_$_18af[243]]);
                        $(_$_18af[234])[_$_18af[61]](G[_$_18af[244]]);
                        $(_$_18af[70])[_$_18af[61]](G[_$_18af[245]]);
                        $(_$_18af[247])[_$_18af[61]](G[_$_18af[246]]);
                        LoadGrid()
                    }
                })
            }

            function BindFU() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    contentType: _$_18af[235],
                    url: _$_18af[254],
                    data: _$_18af[249] + $(_$_18af[233])[_$_18af[15]]() + _$_18af[250],
                    async: false,
                    success: function (H) {
                        var G = $[_$_18af[71]](H[_$_18af[238]]),
                            I = _$_18af[63];
                        $(_$_18af[234])[_$_18af[61]](G[_$_18af[244]]);
                        $(_$_18af[70])[_$_18af[61]](G[_$_18af[245]]);
                        $(_$_18af[247])[_$_18af[61]](G[_$_18af[246]]);
                        LoadGrid()
                    }
                })
            }

            function BindUC() {
                $[_$_18af[66]]({
                    type: _$_18af[56],
                    contentType: _$_18af[235],
                    url: _$_18af[255],
                    data: _$_18af[249] + $(_$_18af[234])[_$_18af[15]]() + _$_18af[250],
                    async: false,
                    success: function (H) {
                        var G = $[_$_18af[71]](H[_$_18af[238]]),
                            I = _$_18af[63];
                        $(_$_18af[70])[_$_18af[61]](G[_$_18af[245]]);
                        $(_$_18af[247])[_$_18af[61]](G[_$_18af[246]]);
                        LoadGrid()
                    }
                })
            }

            function BindVillage() {
                LoadGrid()
            }
        });//END OF Doc Ready
    </script>
</asp:Content>
