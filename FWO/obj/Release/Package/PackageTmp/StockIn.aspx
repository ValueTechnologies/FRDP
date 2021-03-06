﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="StockIn.aspx.cs" Inherits="FRDP.StockIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="page-header">
                <h4>User profile</h4>
            </div>

            <form class="form-horizontal seperator">
                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="name">Full name</label>
                            <div class="span2" style="width: 90px;">
                                <select id="ddlPrefix" class="hm">
                                    <option>Mr.</option>
                                    <option>Mrs.</option>
                                    <option>Miss</option>
                                    <option>Dr.</option>
                                    <option>Ms.</option>
                                    <option>Prof.</option>
                                    <option>Rev.</option>
                                    <option>Lady</option>
                                    <option>Sir</option>
                                    <option>Capt.</option>
                                    <option>Major</option>
                                    <option>Lt.-Col.</option>
                                    <option>Col.</option>
                                    <option>Lady</option>
                                    <option>Lt.-Cmdr.</option>
                                    <option>The Hon.</option>
                                    <option>Cmdr.</option>
                                    <option>Flt. Lt.</option>
                                    <option>Brgdr.</option>
                                    <option>Judge</option>
                                    <option>Lord</option>
                                    <option>The Hon. Mrs</option>
                                    <option>Wng. Cmdr.</option>
                                    <option>Group Capt.</option>
                                    <option>Rt. Hon. Lord</option>
                                    <option>Revd. Father</option>
                                    <option>Revd Canon</option>
                                    <option>Maj.-Gen.</option>
                                    <option>Air Cdre.</option>
                                    <option>Viscount</option>
                                    <option>Dame</option>
                                    <option>Rear Admrl.</option>
                                </select>
                            </div>
                            <input class="span3 hm marginL10" id="name" type="text" value="" />
                        </div>
                    </div>
                </div>
                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid" style="vertical-align: top;">
                            <label class="form-label span3" for="username">Picture</label>
                            <img src="Uploads/EmployeePhoto/0.png" alt="" style="width: 75px;" id="imgprvw" class="image marginR10" />
                            <input id="fileUpload" type="file" name="fileinput" onchange="showimagepreview(this);" style="margin-left: 23%;" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="name">Contact No</label>
                            <input class="span4 hm" id="Contact" type="text" value="" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="name">Designation</label>
                            <input class="span4 hm" id="txtDesignation" type="text" value="" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="email">User Role</label>
                            <div class="span4">
                                <select id="ddlDesignation" class="hm">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                 <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="email">Allowed Areas</label>
                            <div class="span4">
                                <select id="ddlAllowedAreas" style="width: 344px;">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="email">Email</label>
                            <input class="span4 hm" id="email" type="email" value="" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="normal">Password</label>
                            <div class="span4 controls">
                                <input class="span12 hm" id="password" name="password" type="password" placeholder="Enter your password" value="" />
                                <input class="span12" id="passwordConfirm" name="confirm_password" type="password" placeholder="Enter your password again" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row row-fluid">
                    <div class="span12">
                        <div id="genderradios" class="row-fluid">
                            <label class="form-label span3" for="email">Gender</label>
                            <div class="left marginT5 marginR10">
                                <input type="radio" name="gender" id="optionsRadios1" value="Male" checked="checked" />
                                Male
                            </div>
                            <div class="left marginT5 marginR10">
                                <input type="radio" name="gender" id="optionsRadios2" value="Female" />
                                Female
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="textarea">More info</label>
                            <textarea class="span4 limit elastic hm" id="textarea2" rows="3" cols="5"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="email">User Status</label>
                            <div class="span4 controls">
                                <div class="left marginR10">
                                    <input type="checkbox" id="inlineCheckbox4" checked="checked" class="ibuttonCheck nostyle" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <div class="form-actions">
                                <div class="span3"></div>
                                <div class="span4 controls">
                                    <button id="btnSave" type="button" class="btn btn-info marginR10">Save changes</button>
                                    <button id="btnCancel" type="button" class="btn btn-danger">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </form>

        </div>
        <!-- End .span12 -->

    </div>
    <!-- End .row-fluid -->

    <div class="modal fade hide" id="myModal1">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span class="icon12 minia-icon-close"></span></button>
            <h3>Chat layout</h3>
        </div>
        <div class="modal-body">
            <ul class="messages">
                <li class="user clearfix">
                    <a href="#" class="avatar">
                        <img src="images/avatar2.jpeg" alt="" />
                    </a>
                    <div class="message">
                        <div class="head clearfix">
                            <span class="name"><strong>Lazar</strong> says:</span>
                            <span class="time">25 seconds ago</span>
                        </div>
                        <p>
                            Time to go i call you tomorrow.
                        </p>
                    </div>
                </li>
                <li class="admin clearfix">
                    <a href="#" class="avatar">
                        <img src="images/avatar3.jpeg" alt="" />
                    </a>
                    <div class="message">
                        <div class="head clearfix">
                            <span class="name"><strong>Sugge</strong> says:</span>
                            <span class="time">just now</span>
                        </div>
                        <p>
                            OK, have a nice day.
                        </p>
                    </div>
                </li>

                <li class="sendMsg">
                    <form class="form-horizontal" action="#">
                        <textarea class="elastic" id="textarea1" rows="1" placeholder="Enter your message ..." style="width: 98%;"></textarea>
                        <button type="submit" class="btn btn-info marginT10">Send message</button>
                    </form>
                </li>

            </ul>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
        </div>
    </div>


    <script type="text/javascript">

        var _$_eee2 = ["files", "onload", "src", "result", "target", "attr", "#imgprvw", "show", "readAsDataURL", "User Registration", "html", ".heading\x09h3", "POST", "inv.ashx/?ID=17\u01c1", "parseJSON", "", "<option value=\"", "CompanyID", "\">", "CompanyName", "</option>", "each", "#ddlAllowedAreas", "Select Province!", "clip", "multiselect", "ajax", "<span class='icon16 icomoon-icon-checkmark-2 white'></span>", "<span class='icon16 icomoon-icon-cancel-3 white'></span>", "iButton", ".ibuttonCheck", "test", "click", "val", "#passwordConfirm", "#password", "Please Enter Password", "#email", "Enter Valid Email Address...!", "Password not matched", "½", ".hm", "checked", "#inlineCheckbox4", "1", "0", "input[name=gender]:checked", "#genderradios", "get", "#fileUpload", "[name=\"multiselect_ddlAllowedAreas\"][type=\"checkbox\"][aria-selected=\"true\"]", "¼", "½¼", "replace", "Province", "append", "vls", "length", "name", "url", "AddUsersGH.ashx", "type", "data", "contentType", "processData", "success", "images/users/default.png", "msie", "browser", "clone", "replaceWith", ".filename", "error", "statusText", "preventDefault", "live", "#btnSave", "#btnCancel", "blur", "trim", "exeData.ashx/?ID=23\u01c1", "body", "text", "#ddlDesignation option:selected", "prev", "#ddlDesignation", "ready"];

        function showimagepreview(w) {
            if (w[_$_eee2[0]] && w[_$_eee2[0]][0]) {
                var v = new FileReader();
                v[_$_eee2[1]] = function (x) {
                    $(_$_eee2[6])[_$_eee2[5]](_$_eee2[2], x[_$_eee2[4]][_$_eee2[3]]);
                    $(_$_eee2[6])[_$_eee2[7]]()
                };
                v[_$_eee2[8]](w[_$_eee2[0]][0])
            }
        }
        $(document)[_$_eee2[86]](function () {
            $(function () {
                $(_$_eee2[11])[_$_eee2[10]](_$_eee2[9])
            });
            $(function () {
                $[_$_eee2[26]]({
                    type: _$_eee2[12],
                    url: _$_eee2[13],
                    success: function (d) {
                        var b = $[_$_eee2[14]](d),
                            c = _$_eee2[15];
                        $[_$_eee2[21]](b, function (e, f) {
                            c += _$_eee2[16] + f[_$_eee2[17]] + _$_eee2[18] + f[_$_eee2[19]] + _$_eee2[20]
                        });
                        $(_$_eee2[22])[_$_eee2[10]](c);
                        $(_$_eee2[22])[_$_eee2[25]]({
                            header: _$_eee2[23],
                            show: [_$_eee2[24], 500],
                            hide: [_$_eee2[24], 500]
                        })
                    }
                })
            });
            $(_$_eee2[30])[_$_eee2[29]]({
                labelOn: _$_eee2[27],
                labelOff: _$_eee2[28],
                enableDrag: false
            });

            function a(t) {
                var u = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
                return u[_$_eee2[31]](t)
            }
            $(_$_eee2[76])[_$_eee2[75]](_$_eee2[32], function () {
                if (($(_$_eee2[34])[_$_eee2[33]]() == _$_eee2[15] || $(_$_eee2[35])[_$_eee2[33]]() == _$_eee2[15])) {
                    alertR(_$_eee2[36]);
                    return false
                };
                if (!a($(_$_eee2[37])[_$_eee2[33]]())) {
                    alertR(_$_eee2[38]);
                    return false
                };
                if ($(_$_eee2[34])[_$_eee2[33]]() != $(_$_eee2[35])[_$_eee2[33]]()) {
                    alerRt(_$_eee2[39]);
                    return false
                };
                var h = _$_eee2[15];
                $(_$_eee2[41])[_$_eee2[21]](function (o, n) {
                    h += $(this)[_$_eee2[33]]() + _$_eee2[40]
                });
                if ($(_$_eee2[43])[_$_eee2[5]](_$_eee2[42]) == _$_eee2[42]) {
                    h += _$_eee2[44]
                } else {
                    h += _$_eee2[45]
                };
                h += _$_eee2[40] + $(_$_eee2[46], _$_eee2[47])[_$_eee2[33]]();
                var m = $(_$_eee2[49])[_$_eee2[48]](0);
                var l = m[_$_eee2[0]];
                var k = _$_eee2[15];
                $(_$_eee2[50])[_$_eee2[21]](function (e, p) {
                    k += $(this)[_$_eee2[33]]() + _$_eee2[40]
                });
                if (k != _$_eee2[15]) {
                    k += _$_eee2[51];
                    k = k[_$_eee2[53]](_$_eee2[52], _$_eee2[15])
                };
                var j = new FormData();
                j[_$_eee2[55]](_$_eee2[54], k);
                j[_$_eee2[55]](_$_eee2[56], h);
                for (var e = 0; e < l[_$_eee2[57]]; e++) {
                    j[_$_eee2[55]](l[e][_$_eee2[58]], l[e])
                };
                var g = {};
                g[_$_eee2[59]] = _$_eee2[60];
                g[_$_eee2[61]] = _$_eee2[12];
                g[_$_eee2[62]] = j;
                g[_$_eee2[63]] = false;
                g[_$_eee2[64]] = false;
                g[_$_eee2[65]] = function (q) {
                    alertG(q);
                    $(_$_eee2[6])[_$_eee2[5]](_$_eee2[2], _$_eee2[66]);
                    $(_$_eee2[41])[_$_eee2[21]](function (o, n) {
                        $(this)[_$_eee2[33]](_$_eee2[15])
                    });
                    $(_$_eee2[34])[_$_eee2[33]](_$_eee2[15]);
                    if ($[_$_eee2[68]][_$_eee2[67]]) {
                        $(_$_eee2[49])[_$_eee2[70]]($(_$_eee2[49])[_$_eee2[69]]())
                    } else {
                        $(_$_eee2[49])[_$_eee2[33]](_$_eee2[15])
                    };
                    $(_$_eee2[71])[_$_eee2[10]](_$_eee2[15])
                };
                g[_$_eee2[72]] = function (r) {
                    alertR(r[_$_eee2[73]])
                };
                $[_$_eee2[26]](g);
                event[_$_eee2[74]]()
            });
            $(_$_eee2[77])[_$_eee2[75]](_$_eee2[32], function () {
                $(_$_eee2[41])[_$_eee2[21]](function (o, n) {
                    $(this)[_$_eee2[33]](_$_eee2[15])
                });
                $(_$_eee2[6])[_$_eee2[5]](_$_eee2[2], _$_eee2[66]);
                if ($[_$_eee2[68]][_$_eee2[67]]) {
                    $(_$_eee2[49])[_$_eee2[70]]($(_$_eee2[49])[_$_eee2[69]]())
                } else {
                    $(_$_eee2[49])[_$_eee2[33]](_$_eee2[15])
                };
                $(_$_eee2[71])[_$_eee2[10]](_$_eee2[15])
            });
            $(_$_eee2[35])[_$_eee2[75]](_$_eee2[78], function () {
                if ($[_$_eee2[79]]($(this)[_$_eee2[33]]()) != _$_eee2[15] && $[_$_eee2[79]]($(_$_eee2[34])[_$_eee2[33]]()) != _$_eee2[15]) {
                    if ($(this)[_$_eee2[33]]() != $(_$_eee2[34])[_$_eee2[33]]()) {
                        alert(_$_eee2[39])
                    }
                }
            });
            $(_$_eee2[34])[_$_eee2[75]](_$_eee2[78], function () {
                if ($[_$_eee2[79]]($(this)[_$_eee2[33]]()) != _$_eee2[15] && $[_$_eee2[79]]($(_$_eee2[35])[_$_eee2[33]]()) != _$_eee2[15]) {
                    if ($(this)[_$_eee2[33]]() != $(_$_eee2[35])[_$_eee2[33]]()) {
                        alert(_$_eee2[39])
                    }
                }
            });
            $[_$_eee2[26]]({
                url: _$_eee2[80],
                context: document[_$_eee2[81]],
                success: function (s) {
                    $(_$_eee2[85])[_$_eee2[10]](s)[_$_eee2[84]]()[_$_eee2[10]]($(_$_eee2[83])[_$_eee2[82]]())
                }
            })
        })
    </script>
</asp:Content>
