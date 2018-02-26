<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accrptBudgets.aspx.cs" Inherits="FRDP.accrptBudgets" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .ui-sortable > li {
            background: #369DBB;
            border-radius: 5px;
            padding-left: 15px;
        }
    </style>
    <div id="spName" tag="sp_rptBudgets" data-sp1="sp_rptBudgets" data-sp2="sp_rptBudgets2" data-typ="0" ctn="sp_rptBudgetsCT" xls="sp_rptBudgetsXLS" class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Budget Data Dynamic Reports</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <%--+++++++++++++++++--%>
                    <br />
                    <div class="tab0" style="margin-left: 10px">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Report Parameters </div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div>
                        <table id="tb-parm" class="tb-css" style="margin-left: 10px; width: 97%; max-width: 97%; border-collapse: collapse;">
                            <thead>
                                <tr>
                                    <th>&nbsp;</th>
                                    <th>Column Name</th>
                                    <th>Operator</th>
                                    <th>Value</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select class="ddAR" name="D1">
                                            <option>AND</option>
                                            <option>OR</option>
                                        </select></td>
                                    <td>
                                        <select class="ddColumn" style="width: 150px">
                                            <option value="BudgetTitle">Budget Title</option>
                                            <option value="SessionName">Financial Year</option>
                                            <option value="AcName">Account Name</option>
                                            <option value="AcType">Head Type</option>
                                            <option value="AcGroup">Account Head</option>
                                            <option value="AcSubGroup">Account Group</option>
                                            <option value="Mth">Month</option>
                                        </select></td>
                                    <td valign="top">
                                        <select class="ddOperator">
                                            <option value="=">Equal to</option>
                                            <option value="<">Less than</option>
                                            <option value=">">Greater than</option>
                                            <option value="<=">Less than & equal</option>
                                            <option value=">=">Greater than & equal</option>
                                            <option value="<>">Not equal</option>
                                            <option value=" like">Contains</option>
                                        </select></td>
                                    <td valign="top">
                                        <select class="ddVlaue" style="min-width: 200px;">
                                            <option></option>
                                        </select></td>
                                    <td valign="top">
                                        <input class="btAd" title="add new row" tag="" type="button" style="background-image: url('./images/AdR.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF; border: none;" /></td>
                                    <td valign="top">
                                        <input class="btnr" title="remove row" tag="" type="button" style="background-image: url('./images/close.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF; border: none;" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <table style="width: 100%; padding-left: 10px;">
                            <tbody>
                                <tr>
                                    <td valign="top" colspan="4" style="text-align: right; padding-right: 20px;">
                                        <input class="btn btn-info" id="btnShRpt" type="button" value="Run Report" /></td>

                                </tr>
                                <tr>
                                    <td valign="top">&nbsp;</td>
                                    <td valign="top">&nbsp;</td>
                                    <td valign="top">&nbsp;</td>
                                    <td valign="top">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top" colspan="4" style="text-align: right; padding-right: 20px;">
                                        <input class="chk" id="optSmpl" type="radio" name="chr" checked="checked" style="margin-bottom: 6px;" />Chart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="chk" id="optPivot" name="chr" type="radio" style="margin-bottom: 6px;" />Pivot Chart</td>
                                </tr>
                                <tr>
                                    <td valign="top" colspan="4">&nbsp;</td>
                                </tr>
                                <tr id="trpovt">
                                    <td valign="top" colspan="2">
                                        <span style="margin-top: 0px; margin-bottom: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Columns Field:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <select id="ddRows" style="width: 200px">
                        <option value="BudgetTitle">Budget Title</option>
                        <option value="SessionName">Financial Year</option>
                        <option value="AcName">Account Name</option>
                        <option value="AcType">Head Type</option>
                        <option value="AcGroup">Account Head</option>
                        <option value="AcSubGroup">Account Group</option>
                        <option value="Mth">Month</option>
                    </select>
                                        </span>
                                        <span style="margin-top: 0px; margin-bottom: 4px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </span>
                                        <br />
                                        <span style="margin-top: 0px; margin-bottom: 0px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Values Field:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <select id="ddData" style="width: 200px">
                        <option value="sum(Bdg_Amount)[ Budget]">Budget</option>
                        <option value="sum(am)[ Actual]">Actual</option>
                    </select>
                                        </span>
                                        <input class="btAdd" type="button" style="background-image: url('./images/AdR.ico'); background-repeat: no-repeat; width: 20px; height: 19px; background-color: #FFFFFF;" />
                                        <div style="margin-left: 30px; margin-top: 5px">
                                            <table id="vArea" style="width: 300px">
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                    <td valign="top" colspan="2">
                                        <span><strong>Rows Field:</strong>&nbsp;&nbsp;&nbsp;&nbsp;
                    <select id="ddCol" style="width: 200px" name="D2">
                        <option value="BudgetTitle">Budget Title</option>
                        <option value="SessionName">Financial Year</option>
                        <option value="AcName">Account Name</option>
                        <option value="AcType">Head Type</option>
                        <option value="AcGroup">Account Head</option>
                        <option value="AcSubGroup">Account Group</option>
                        <option value="Mth">Month</option>
                    </select>
                                            <input class="btAdd0" type="button" style="background-image: url('./images/AdR.ico'); background-repeat: no-repeat; width: 20px; height: 19px; background-color: #FFFFFF;" /></span><div style="margin-left: 30px; margin-top: 5px">
                                                <table id="vArea0" style="width: 300px">
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                    </td>
                                </tr>
                                <tr class="trChart">
                                    <%--<td style="font-weight: 700;" valign="top" colspan="4">Report Columns&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Others Columns</td>--%>
                                    <td valign="top" colspan="2" style="text-align: center; background: #D3D3D3; border-radius: 5px; padding-left: 15px; width: 50%;">Report Columns
                                    </td>
                                    <td valign="top" colspan="2" style="text-align: center; background: #D3D3D3; border-radius: 5px; padding-left: 15px; width: 50%;">Others Columns</td>
                                </tr>
                                <tr class="trChart">
                                    <td valign="top" colspan="2" style="padding: 20px; border-right: 1px solid lightgrey;">

                                        <ul id="sortable2" class="droptrue" style="background: rgba(207, 207, 207, 0.18); min-height: 100px;">
                                            <li class="ui-state-default grp" tag="SessionName">Financial Year</li>
                                            <li class="ui-state-default grp" tag="AcGroup">Account Head</li>
                                            <li class="ui-state-default" tag="sum(Bdg_Amount)">Budget</li>
                                            <li class="ui-state-default" tag="sum(am)">Actual</li>
                                        </ul>
                                    </td>
                                    <td valign="top" colspan="2" style="padding: 20px;">

                                        <ul id="sortable1" class="dropfalse" style="background: rgba(207, 207, 207, 0.18); min-height: 100px;">
                                            <li class="ui-state-default grp" tag="BudgetTitle">Budget Title</li>
                                            <li class="ui-state-default grp" tag="AcName">Account Name</li>
                                            <li class="ui-state-default grp" tag="AcType">Head Type</li>
                                            <li class="ui-state-default grp" tag="AcSubGroup">Account Group</li>
                                            <li class="ui-state-default grp" tag="Mth">Month</li>
                                        </ul>
                                        <br style="clear: both;" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab0" style="margin-left: 10px">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Report Result </div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div id="frm" style="margin-left: 10px">
                        <div id="btnmax" class="btn btn-info" style="margin-top: 3px; height: 10px; margin-bottom: 3px; text-align: center; line-height: 10px;">&nbsp;click to maximize</div>
                        <div style="background: rgb(252, 252, 252);">
                            <asp:ImageButton ID="btnExcel" runat="server" CssClass="Grd" ImageUrl="./images/xls1.png" OnClick="btnExcel_Click" ToolTip="Export to Excel" ClientIDMode="Static" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img id="btnPrv" title="Next Previous" class="Grd" style="margin-left: 10px;" alt="E" src="./images/previous.png" /><img id="btnNxt" title="Next Page" class="Grd" style="margin-left: 10px;" alt="E" src="./images/next.png" /><p id="tpages" style="float: left; width: 200px">Records 100 of 5000</p>
                        </div>
                        <div id="oResult" style="overflow: auto; height: 400px; background-color: white; padding-left: 85px;">
                        </div>
                        <div>
                            Remarks :
            <input id="txtRemars" type="text" maxlength="250" style="width: 90%" value="Remarks" />
                        </div>
                        <br />
                        <div>
                            <div id="cRow" class="btn btn-info" style="float: left">Rows</div>
                            <div class="btn btn-info" id="cColumn" style="float: left; margin-left: 5px;">Column</div>
                            <div class="btn btn-info" id="cbar" style="float: left; margin-left: 5px;">Bar Chart</div>
                            <div class="btn btn-info" id="cpie" style="float: left; margin-left: 5px;">Pie Chart</div>
                            <div class="btn btn-info" id="cline" style="float: left; margin-left: 5px;">Line Chart</div>
                            <div class="btn btn-info" id="ctable" style="float: left; margin-left: 5px;">Table View</div>
                            <div class="btn btn-info" id="cchrt" style="float: left; margin-left: 5px;">Chart View</div>
                            <br />
                            &nbsp;<br />
                            <div class="btn btn-info" id="svReport" style="float: left;">Save as Report</div>
                        </div>
                        <br />
                        <br />
                    </div>
                    <div id="dialog" title="&nbsp;&nbsp; Save Report">
                        <table style="width: 100%;">
                            <tr>
                                <td style="height: 22px;" valign="top">
                                    <input class="chkc" id="ys" type="radio" name="opt" checked="checked" /><label for="ys"><strong>New Report</strong></label></td>
                                <td valign="top">
                                    <input class="chkc" id="na" name="opt" type="radio" /><label for="na"><strong>Add New Section to Report</strong></label></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="newRpt">
                                        Report Title :
                        <input id="txtTitle" type="text" maxlength="250" style="width: 300px" /><br />
                                        Attach to Dashbord :
                        <input id="chkdshb" type="checkbox" />
                                    </div>
                                    <div id="adSec">
                                        Report :
                        <select id="ddRpts">
                            <option></option>
                        </select>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        &nbsp;<input style="float: right;" class="btn btn-info" id="btnclos" type="button" value="Cancel" />&nbsp; &nbsp;<input style="float: right; margin-right: 5px;" class="btn btn-info" id="btnSaveRpt" type="button" value="Save Report" />&nbsp;
                    </div>
                    <div title="Please Wait Loading ...." id="TB_overlay" class="TB_overlayBG" style="background-image: url('./images/sve.gif'); background-repeat: no-repeat; background-position: center center"></div>
                    <%--+++++++++++++++++--%><br />
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
            $('#sortable1 li').live('click', function () {
                $(this).appendTo('#sortable2');
            });
            $('#sortable2 li').live('click', function () {
                $(this).appendTo('#sortable1');
            });
            var ddData;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "accrptBudgets.aspx/Lists",
                data: "{}",
                context: document.body,
                success: function (responseText) {
                    ddData = $.parseJSON(responseText.d);
                }
            });
            $(".ddColumn").live('change', function (e) {
                var opts = "";
                if (ddData[$(this).val()] != undefined) {
                    $.each(ddData[$(this).val()], function (i, item) {
                        opts = opts + '<option>' + item.txt + '</option>';
                    });
                    $(this).parent().parent().find('.ddVlaue').html(opts);
                    $(this).parent().parent().find('.ddVlaue').eComboBox();
                    $(this).parent().parent().find('.ddVlaue option:contains({NEW ELEMENT})').remove();
                } else { $(this).parent().parent().find('.ddVlaue').html('<option>0</option>'); }
            });


            //<script type="text/javascript" src="GraphReports.js">
            //$('#TB_overlay').hide();
            $('.art-sidebar2').hide();
            $('.ddAR:first').val('---');
            $('.tab1:nth(1)').parent().next().hide();
            $('#trpovt').hide();
            $('.btAd:last').live('click keypress', function () {
                var row = '<tr>' + $('#tb-parm tr:last').html() + '</tr>';
                $('#tb-parm tr:last').after(row);
                $(".ddVlaue:last").eComboBox();
                $(".ddVlaue:last").html('<option></option>');
            });
            $('.btnr').live('click', function () {
                if ($('#tb-parm tr').length > 2) {
                    $(this).parent().parent().remove();
                }
            });
            $(function () {
                $('#dialog').dialog({
                    autoOpen: false,
                    height: 170,
                    width: 450,
                    modal: true,
                    show: {
                        effect: "clip",
                        duration: 500
                    },
                    hide: {
                        effect: "slide",
                        duration: 1000
                    }
                });
            });
            $("#adSec").hide();
            $(".ddVlaue").eComboBox();
            $('.ddVlaue option:contains({NEW ELEMENT})').remove();
            $(".chkc").click(function () {
                if ($('#ys').is(':checked')) { $("#newRpt").show(); $("#adSec").hide(); $("#btnSaveRpt").val('Save Report'); } else {
                    $("#newRpt").hide(); $("#adSec").show(); $("#btnSaveRpt").val('Add Section');
                    $.ajax({
                        url: "accCustomRpt.ashx/?ID=10:" + $.cookie('UserID'),
                        context: document.body,
                        success: function (responseText) {
                            $('#ddRpts').html(responseText);
                        }
                    });
                }
            });
            $("#btnclos").live('click', function (e) {
                $('#dialog').dialog("close");
            });
            $("#btnSaveRpt").live('click', function (e) {
                var tbv = 0, chrt = 0;
                if ($("#chrt-tb").css("display") == "table") {
                    tbv = 1;
                } else { tbv = 0; }
                if ($('.visualize-info').text() == "") {
                    chrt = 0;
                } else { chrt = 1; }
                if ($("#btnSaveRpt").val() == "Save Report") {
                    if ($('#txtTitle').val() == "") {
                        msgbox("Please enter Report Title ");
                        return false;
                    }
                    var dataIN = "Ï''" + $('#spName').attr('tag') + "'',''" + grps.substring(1).replace(/'/g, "''") + "'',''" + colmns.substring(1).replace(/'/g, "''''") + "'',''" + $("#txtRemars").val() + "'',''0'',''" + Wheres.replace(/'/g, '\'\'') + "'',''" + tbv + "'',''0'',''" + xy + "'',''" + ctyp + "'',''0'',''" + chrt + "''Î:" + $("#txtTitle").val() + ":" + $('#chkdshb').prop('checked') + ":0:" + $.cookie("UserID");
                    $.ajax({
                        url: "accCustomRpt.ashx/?ID=14:" + encodeURIComponent(dataIN),
                        context: document.body,
                        success: function (responseText) {
                            $('#dialog').dialog("close");
                        }
                    });
                } else {
                    if ($('#ddRpts').val() == null) {
                        msgbox("Please select Report Title ");
                        return false;
                    }
                    var dataIN = "'" + $('#spName').attr('tag') + "','" + grps.substring(1).replace(/'/g, "''") + "','" + colmns.substring(1) + "','" + $("#txtRemars").val() + "','0','" + Wheres.replace(/'/g, '\'\'') + "','" + tbv + "','0','" + xy + "','" + ctyp + "','0'," + $("#ddRpts").val() + ",'" + chrt + "')";
                    $.ajax({
                        url: "accCustomRpt.ashx/?ID=11:" + encodeURIComponent(dataIN),
                        context: document.body,
                        success: function (responseText) {
                            $('#dialog').dialog("close");
                        }
                    });
                }
            });
            $("#svReport").live('click', function (e) {
                $('#dialog').dialog("open");
            });
            $(function () {
                $("ul.droptrue").sortable({
                    connectWith: "ul"
                });
                $("ul.dropfalse").sortable({
                    connectWith: "ul"
                });
                $("#sortable1, #sortable2, #sortable3").disableSelection();
            });
            $("#btnmax").live('click', function (e) {
                if ($('#frm').hasClass('maxi')) {
                    $('#frm').removeClass('maxi');
                    $('#frm').css('margin-left', '10px');
                } else { $('#frm').attr('class', 'maxi'); $('#frm').css('margin-left', '2px'); }
            });
            var tbdata, xy = 'y', ctyp = 'bar';
            var colmns = '', grps = '', PvtValues = '', Wheres = ""; PvtValues0 = ''
            $("#btnShRpt").live('click', function (e) {
                PvtValues = ''; Wheres = ""; PvtValues0 = '';
                //$('#TB_overlay').show();
                colmns = ''; grps = '';
                for (i = 0; i < $('#sortable2').children().length; i++) {
                    colmns = colmns + ',' + $($('#sortable2').children()[i]).attr('tag') + ' as [' + $('#sortable2').children()[i].innerHTML + ']';

                    //if ($($('#sortable2').children()[i]).attr('class') == 'ui-state-default grp ui-sortable-handle') {
                    //    grps = grps + ',' + $($('#sortable2').children()[i]).attr('tag');
                    //}

                    if ($($('#sortable2').children()[i]).hasClass('grp')) {
                        grps = grps + ',' + $($('#sortable2').children()[i]).attr('tag');
                    }
                }
                //console.log(grps);
                $('#vArea tr').each(function () {
                    PvtValues = PvtValues + "," + $(this).attr('tag');
                });


                $('#vArea0 tr').each(function () {
                    PvtValues0 = PvtValues0 + "," + $(this).attr('tag');
                });


                $('#tb-parm tbody tr').each(function () {
                    if ($(this).children().find('.ddVlaue').val() != "") {
                        if ($(this).children().find('.ddVlaue').val() != null) {
                            Wheres = Wheres + $(this).children().find('.ddAR').val() + "  " + $(this).children().find('.ddColumn').val() + (($(this).children().find('.ddOperator').val() == " like") ? ($(this).children().find('.ddOperator').val() + "''%" + $(this).children().find('.ddVlaue').val() + "%''") : ($(this).children().find('.ddOperator').val() + "''" + $(this).children().find('.ddVlaue').val() + "''"));
                        }
                    }
                });
                if (Wheres != "") {
                    Wheres = "WHERE " + Wheres.substring(4);
                }

                if ($('#spName').attr('data-typ') == "1") {
                    grps = "0" + $('#ddRows').val() + "'',''" + (PvtValues == "" ? $('#ddData').val() : PvtValues.substring(1));
                    colmns = "1" + (PvtValues0 == "" ? $('#ddCol').val() : PvtValues0.substring(1));
                    Wheres = Wheres.replace(/'/g, '\'\'');
                }
                //console.log($('#spName').attr('ctn'));
                //console.log(grps);
                //console.log(colmns.substring(1));
                //console.log(Wheres);
                $('.tab1:nth(0)').parent().next().hide('slow');
                $.ajax({
                    url: "accCustomRpt.ashx/?ID=16:" + encodeURIComponent($('#spName').attr('ctn') + ":" + grps.substring(1) + ":" + colmns.substring(1) + ":" + Wheres),
                    context: document.body,
                    success: function (responseText) {
                        tpages = responseText;
                        str = 100;
                        if (tpages < 100) { str = tpages; }
                        ofset = 0;
                        runrpt();
                    }
                });
                $('.tab1:nth(1)').parent().next().show('slow');
            });
            function runrpt() {
                $.ajax({
                    url: "accCustomRpt.ashx/?ID=12:" + encodeURIComponent($('#spName').attr('tag') + ":" + grps.substring(1) + ":" + colmns.substring(1) + ":" + Wheres + ":" + ofset),
                    context: document.body,
                    success: function (responseText) {
                        //$('#TB_overlay').hide();
                        tbdata = responseText;
                        $('#frm').show();
                        $("#oResult").html(responseText);
                        $('.tb-css td').each(function () { if ($.isNumeric($(this).html())) { $(this).html($.number($(this).html(), 0)); $(this).css('text-align', 'right'); } });
                        $('#tpages').html("Records " + (parseInt(ofset) + 1) + " ~ " + str + " of " + tpages);
                        $("#oResult").css('padding-left', '0');
                    }
                });
            }
            $("#cRow").live('click', function (e) {
                xy = 'x';
                $("#chrt-tb").css('margin-left', '-80px');
                cChart();
            });
            $("#cColumn").live('click', function (e) {
                xy = 'y';
                cChart();
            });
            $("#cpie").live('click', function (e) {
                ctyp = 'pie';
                cChart();
            });
            $("#cbar").live('click', function (e) {
                ctyp = 'bar';
                cChart();
            });
            $("#cline").live('click', function (e) {
                ctyp = 'line';
                cChart();
            });
            $("#ctable").live('click', function (e) {
                if ($("#chrt-tb").is(":visible")) { $('.visualize-info').css('top', '280px'); } else { $('.visualize-info').css('top', '0px'); }
                $("#chrt-tb").slideToggle('slow');
                $('.tb-css td').each(function () { if ($.isNumeric($(this).html())) { $(this).html($.number($(this).html(), 0)); $(this).css('text-align', 'right'); } });
            });
            $("#cchrt").live('click', function (e) {
                if ($(".visualize-info").is(":visible")) { $("#oResult").html(tbdata); $("#oResult").css('padding-left', '0'); } else { cChart(); }
            });
            function cChart() {
                $("#oResult").html(tbdata);
                var tb = $("#chrt-tb");
                tb.css('margin-left', '-70px');
                tb.visualize({
                    type: ctyp, height: '200px', width: '500px', parseDirection: xy
                });
                $("#oResult").css('padding-left', '75px');
                sumTable('chrt-tb');
                $('.visualize-info').css('top', '280px');
                //$('.tb-css td :first').css("width", "200px");
                //tb.hide();
                $('.tb-css td').each(function () { if ($.isNumeric($(this).html())) { $(this).html($.number($(this).html(), 0)); $(this).css('text-align', 'right'); } });
                $('.label').each(function () { if ($.isNumeric($(this).html())) { $(this).html($.number($(this).html(), 0)); $(this).css('text-align', 'right'); } });
            }
            $("#btnExcel").click(function (e) {
                $.cookie('str', $('#spName').attr('xls') + "|" + grps.substring(1) + "|" + colmns.substring(1) + "|" + Wheres + "|" + $('#spName').attr('data-typ'));
            });
            $(".chk").click(function () {
                if ($('#optSmpl').is(':checked')) { $('#trpovt').hide(); $('.trChart').show("slow"); $('#spName').attr('tag', $('#spName').attr('data-sp1')); $('#spName').attr('data-typ', 0); } else {
                    $('#trpovt').show("slow"); $('.trChart').hide(); $('#spName').attr('tag', $('#spName').attr('data-sp2')); $('#spName').attr('data-typ', 1);
                }
            });
            $('.btAdd').live('click', function (e) {
                var row = '<tr tag="' + $("#ddData").val() + '"><td>' + $("#ddData :selected").text() + '</td><td><div class="Grd delR" style="background-image: url(\'images/close.ico\'); background-repeat: no-repeat">&nbsp;&nbsp;</div></td></tr>';
                $('#vArea tbody').html($('#vArea tbody').html() + row);
            });
            $('.delR').live('click', function (e) {
                $(this).parent().parent().remove();
            });
            ///new changes
            $('.btAdd0').live('click', function (e) {
                var row = '<tr tag="' + $("#ddCol").val() + '"><td>' + $("#ddCol :selected").text() + '</td><td><div class="Grd delR0" style="background-image: url(\'images/close.ico\'); background-repeat: no-repeat">&nbsp;&nbsp;</div></td></tr>';
                $('#vArea0 tbody').html($('#vArea0 tbody').html() + row);
            });
            $('.delR0').live('click', function (e) {
                $(this).parent().parent().remove();
            });
            ///end
            $('#btnNxt').click(function () { pages(0); });
            $('#btnPrv').click(function () { pages(1); });
            var tpages;
            var str = 100;
            var ofset = 0;
            function pages(prm) {
                if ((parseInt(prm) == 1) && (parseInt(str) > 100)) {
                    if (parseInt(str) == tpages) {
                        str = ofset;
                        ofset = ofset - 100;
                    } else {
                        str -= 100;
                        ofset -= 100;
                    }
                    runrpt();
                } if ((parseInt(prm) == 1) && (parseInt(str) < 100)) {
                    ofset = 0;
                    runrpt();
                }
                else if ((parseInt(prm) == 0) && (parseInt(str) < tpages)) {
                    if ((tpages - parseInt(str)) < 100) {
                        ofset = str;
                        str += (tpages - parseInt(str));
                    } else {
                        str += 100;
                        ofset += 100;
                    }
                    runrpt();
                }
            }
            //<script type="text/javascript" src="GraphReports.js">
        });//END OF Doc Ready


    </script>
    <%--<script type="text/javascript" src="GraphReports.js"></script>--%>
</asp:Content>
