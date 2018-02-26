$(document).keypress(function (e) {
    if (e.keyCode === 13) {
        e.preventDefault();
        return false;
    }
});
$(document).ready(function () {
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
        if ($('#frm').attr('class') == 'maxi') {
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
            if ($($('#sortable2').children()[i]).attr('class') == 'ui-state-default grp ui-sortable-handle') {
                grps = grps + ',' + $($('#sortable2').children()[i]).attr('tag');
            }
        }
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
});