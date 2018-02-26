<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accChrtAcc.aspx.cs" Inherits="FRDP.accChrtAcc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
        .AcGroup {
            color: #000000;
            margin-left: 20px;
            font-weight: 700;
            padding: 2px;
        }

        .AcSubG {
            margin-left: 70px;
            font-weight: 700;
            color: #2F07BE;
            padding: 2px;
        }

        .AcCode {
            margin-left: 85px;
            font-size: 14px;
            padding: 2px;
            padding-left: 10px;
        }

            .AcCode:hover {
                cursor: pointer !important;
                -moz-box-shadow: 0 0 5px #999999;
                -webkit-box-shadow: 0 0 5px #999999;
                box-shadow: 0 0 5px #999999;
                color: #29166F;
                font-weight: bold;
                opacity: 1;
            }

        .AcHead {
            font-size: medium;
            color: #29166F;
            margin-top: 15px;
            font-weight: 700;
            border-top-width: 2px;
            border-top-style: dotted;
        }

        .container div {
            padding: 5px;
        }
    </style>

       <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Chart of Account Definition</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<%--=====================--%><br />
<div style="margin-left: 10px; margin-top: 10px">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;FRDP Project</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="margin-left: 5px; margin-top: 3px;">
                <tr>
                    <td><strong>Select : </strong></td>
                    <td>
                        <asp:DropDownList ID="ddCampus" runat="server" DataSourceID="dsCampus" DataTextField="CampusName" DataValueField="CampusID" CssClass="vl" ClientIDMode="Static">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCampus" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CampusID, CampusName FROM tblCampus"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <div id="AddNew" class="btnAddB GrdB cBtn" style="margin-top: 5px">
            <div class="imgBtn">
                <img alt="" src="images/Add.png" />
            </div>
            <div class="tBtn">Add New Account</div>
        </div>
        <br />
        <br />
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Chart of Account</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <div id="Content" style="margin-right: 10px;"></div>
        </div>
    </div>
    <div id="dialog0" title="Add New Account" class="Dlg">
        <div class="container">
            <div class="table-row">
                <div class="col lt"><strong>Account Head</strong></div>
                <div class="col lt">
                    <asp:DropDownList ID="ddHead0" runat="server" DataSourceID="dsHeads0" DataTextField="HeadName" DataValueField="HeadName" ClientIDMode="Static" Width="80%">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsHeads0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT [HeadID], [HeadName] FROM [tblCOA]"></asp:SqlDataSource>
                </div>
            </div>
            <div class="table-row">
                <div class="col lt"><strong>Account Group</strong></div>
                <div id="txtGrp0" class="col lt">
                    <select id="txGroup0" name="D3" style="width: 80%"><option></option></select>
                </div>
            </div>
            <div class="table-row">
                <div class="col lt">Sub-Group</div>
                <div id="txtSubGrp0" class="col lt">
                    <select id="txSubG0" name="D4" style="width: 80%"><option></option></select>
                </div>
            </div>
            <div class="table-row">
                <div class="col lt"><strong>Account Code</strong></div>
                <div class="col lt">
                    <input id="txCode0" type="text" style="width: 79%" />
                </div>
            </div>
            <div class="table-row">
                <div class="col lt"><strong>Entery Account</strong></div>
                <div class="col lt">
                    <input id="txTitle0" type="text" style="width: 79%" />
                </div>
            </div>
            <div class="table-row">
                <div class="col lt"><strong>Account Type</strong></div>
                <div class="col lt">
                    <select id="ddType0" name="D2" style="width: 80%">
                        <option value="0">General Account</option>
                        <option value="1">Bank</option>
                        <option value="2">Cash</option>
                    </select>
                </div>
            </div>
            <div class="table-row">
                <div class="col lt"></div>
                <div class="col rt">
                    <input id="btnSave0" tag="0" class="ButtonClass btn btn-info" type="button" value="Create Account" />&nbsp;&nbsp;<input class="ButtonClass btnC btn" type="button" value="Cancel" style="margin-right: 80px" />
                </div>
            </div>
        </div>
    </div>
<%--=====================--%><br />
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
            getCOA();
            $('.tab1:nth(0)').parent().next().hide('slow');
            var grouplist, subglist;
            $.ajax({
                url: "accAutoLists.ashx/?ID=" + $('#ddCampus').val(),
                context: document.body,
                success: function (responseText) {
                    var xdata = responseText.split('¦');
                    grouplist = xdata[1].split(',');
                    subglist = xdata[0].split(',');
                }
            });
            $("#ddCampus").live('change', function (e) { getCOA(); });

            function getCOA() {
                $.ajax({
                    url: "accCOA.ashx/?ID=" + $('#ddCampus').val(),
                    context: document.body,
                    success: function (responseText) {
                        $('#Content')[0].innerHTML = responseText;
                        $('#Content').show("fade", {}, 1000);
                    }
                });
            }

            function getGrp(vl, sg) {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("30ǁ" + $('#ddHead0').val()),
                    context: document.body,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText), output = "";
                        $.each(jdata, function (i, item) {
                            output = output + '<option value="' + item.AcGroup + '">' + item.AcGroup + '</option>';
                        });
                        $('#txtGrp0').html('<select id="txGroup0" name="D3" style="width: 80%"><option></option></select>')
                        $('#txGroup0').html(output);
                        $('#txGroup0').eComboBox();
                        $('#txGroup0').val(vl);
                        getSGrp(sg);
                        //auto compleate group
                        $($("#txGroup0").prev()).autocomplete({
                            source: function (request, response) {
                                var matches = $.map(grouplist, function (tag) {
                                    if (tag.toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                                        return tag;
                                    }
                                });
                                response(matches);
                            }
                        });
                    }
                });
            }
            //$("#ddHead0").live('change', function (e) { if ($(this).val() == 'Assets') { $("#ddType0").html('<option value="0">General Account</option><option value="1">Bank</option><option value="2">Cash</option>'); } else { $("#ddType0").html('<option value="0">General Account</option>'); } });
            $("#ddHead0").live('change', function (e) { getGrp(0); });
            function getSGrp(vl) {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("65ǁ" + $('#ddHead0').val() + "ǁ" + $('#txGroup0').val()),
                    context: document.body,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText), output = "";
                        $.each(jdata, function (i, item) {
                            output = output + '<option value="' + item.AcSubGroup + '">' + item.AcSubGroup + '</option>';
                        });

                        $('#txtSubGrp0').html('<select id="txSubG0" name="D4" style="width: 80%"><option></option></select>');
                        $('#txSubG0').html(output);
                        $('#txSubG0').eComboBox();
                        $('#txSubG0').val(vl);
                        //auto compleate sub-group
                        $($("#txSubG0").prev()).autocomplete({
                            source: function (request, response) {
                                var matches = $.map(subglist, function (tag) {
                                    if (tag.toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                                        return tag;
                                    }
                                });
                                response(matches);
                            }
                        });
                    }
                });
            }
            $("#txGroup0").live('change', function (e) { getSGrp(0); });
            $(".btnC").live('click', function (e) { $('.Dlg').dialog('close'); });

            $('.AcCode').live('click', function (e) {
                var coaid = $(this);
                $('#btnSave0').attr("tag", coaid[0].id);
                $('#btnSave0').val('Update Account');
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("66ǁ" + coaid[0].id),
                    context: document.body,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText);
                        $('#ddType0').val(jdata[0].TypeAc);
                        $('#ddHead0').val(jdata[0].AcType);
                        getGrp(jdata[0].AcGroup, jdata[0].AcSubGroup);
                        $('#txCode0').val(jdata[0].AcCode); $('#txTitle0').val(jdata[0].AcName);
                        $('#dialog0').dialog("open");
                    }
                });
            });
            //Add new account box
            $(function () {
                $('#dialog0').dialog({
                    autoOpen: false,
                    height: 440,
                    width: 700,
                    modal: true,
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
            $('#AddNew').live('click', function (e) {
                getGrp(0, 0);
                $('#btnSave0').attr("tag", 0);
                $('#btnSave0').val('Create Account');
                $('#txCode0').val(''); $('#txTitle0').val('');
                $('#dialog0').dialog("open");
            });
            $('#btnSave0').live('click', function (e) {
                var sgrp = "";
                if (($('#txGroup0').val() == "") || ($('#txGroup0').val() == "{NEW ELEMENT}")) {
                    alert("Please write a account group");
                    return false;
                }
                if (($('#txSubG0').val() == "{NEW ELEMENT}") || ($('#txSubG0').val() == "null") || ($('#txSubG0').val() == "")) {
                    sgrp = '';
                } else { sgrp = $('#txSubG0').val(); }
                if ($('#txTitle0').val() == "") {
                    alert("Please write a account title");
                    return false;
                }
                if ($('#btnSave0').attr('tag') == "0") {
                    $.ajax({
                        url: "accpostCOA.ashx/?ID=0|" + encodeURIComponent($('#txGroup0').val() + "|" + sgrp + "|" + $('#txCode0').val() + "|" + $('#txTitle0').val() + "|" + $('#ddHead0').val() + "|" + $('#ddType0').val() + "|" + $('#ddCampus').val()),
                        context: document.body,
                        success: function (responseText) {
                            $('#dialog0').dialog("close");
                            getCOA();
                        }
                    });
                } else {
                    $.ajax({
                        url: "accpostCOA.ashx/?ID=" + encodeURIComponent($('#btnSave0').attr('tag') + "|" + $('#txGroup0').val() + "|" + sgrp + "|" + $('#txCode0').val() + "|" + $('#txTitle0').val() + "|" + $('#ddHead0').val() + "|" + $('#ddType0').val() + "|" + $('#ddCampus').val()),
                        context: document.body,
                        success: function (responseText) {
                            $('#dialog0').dialog("close");
                            getCOA();
                        }
                    });
                }
            });
        });
    </script>

</asp:Content>
