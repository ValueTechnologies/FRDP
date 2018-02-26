<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="CalendarAdmin.aspx.cs" Inherits="FRDP.CalendarAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="plugins/misc/spectrum/spectrum.css" rel="stylesheet" />
    <style type="text/css">
        @-moz-document url-prefix() {
            #tab-1 {
                margin-top: 100px;
            }
        }

        .fill:hover {
            font-weight: bold;
            color: red;
            /*background-color: rgb(245, 246, 197);*/
            background-color: rgb(240, 244, 251);
            /*border-radius:10px;*/
        }

        .fill {
            cursor: pointer;
            cursor: hand;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Yearly Events Organizer (Adminstration)</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad" style="padding-left: 10px; padding-right: 10px;">
                    <%--=====================--%><br />
                    <div>
                        Year:  
        <select id="ddlyear" style="width: 150px;">
            <option>2012</option>
            <option>2013</option>
            <option>2014</option>
            <option>2015</option>
            <option selected="selected">2016</option>
            <option>2017</option>
            <option>2018</option>
        </select>
                    </div>

                    <div class="row-fluid">
                        <div class="span12">

                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span id="ddlyearEvents"></span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <table class="table table-bordered" id="tblEvents">
                                        <thead>
                                            <tr>
                                                <th>Event</th>
                                                <th style="width: 30px;">Color</th>
                                                <th style="width: 30px;">Order</th>
                                                <th style="width: 30px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <input id="txtEvent" type="text" style="width: 98.6%;" /></th>
                                                <th>
                                                    <input id="txtColor" class="cp" type="text" clr="#FFF" style="width: 30px;" /></th>
                                                <th>
                                                    <input id="txtOrd" type="text" class="Integer" style="width: 30px;" /></th>
                                                <th>
                                                    <button id="btnAddEvent" class="btn btn-info marginB10">+</button></th>
                                            </tr>
                                        </thead>
                                    </table>
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
                                        <span id="titlepp"></span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <table id="pp" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="width: 150px;"></th>
                                                <th>Jan</th>
                                                <th>Feb</th>
                                                <th>Mar</th>
                                                <th>Apr</th>
                                                <th>May</th>
                                                <th>Jun</th>
                                                <th>Jul</th>
                                                <th>Aug</th>
                                                <th>Sep</th>
                                                <th>Oct</th>
                                                <th>Nov</th>
                                                <th>Dec</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>

                            </div>

                        </div>
                    </div>



                    <div id="CU" title="Add Event Dates">
                        <table>
                            <tr>

                                <td colspan="2">
                                    <table id="tblfdtd" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th style="width: 30px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <input id="dtfd" class="dtt" type="text" /></th>
                                                <th>
                                                    <input id="dttd" class="dtt" type="text" /></th>
                                                <th>
                                                    <button class="btn btn-info marginB10" id="btnfdtd">+</button></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </td>

                            </tr>
                            <tr id="dt2">

                                <td colspan="2">
                                    <table id="tblMultipleDates" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th style="width: 30px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <input id="dtMultipleDates" class="dtt" type="text" /></th>
                                                <th>
                                                    <button class="btn btn-info marginB10" id="btnMultipleDates">+</button></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </td>

                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: right;">
                                    <button id="btnCancelDV" class="btn btn-info">Close</button></td>

                            </tr>
                        </table>
                    </div>
                    <%--=============================--%><br />
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript" src="plugins/misc/spectrum/spectrum.js"></script>
    <script type="text/javascript">
        $(document).on('focusin', '.dtt', function () {




            var opt = '';
            if (parseInt($('#CU').attr('m')) < 10) {
                opt += '0' + $('#CU').attr('m');
            }
            else {
                opt += $('#CU').attr('m');
            }


            var date = new Date(opt + '/01/' + $('#ddlyear').val());
            var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);










            $(this).attr('readonly', 'true');


            $(this).datepicker({
                changeMonth: true,
                changeYear: true,
                showButtonPanel: false,
                dateFormat: 'dd/mm/yy',
                minDate: firstDay,
                maxDate: lastDay
            });

        });
        $(document).ready(function () {

            /////////////////////////////////////////////////////////////////


            $('#btnfdtd').live('click', function (e) {
                e.preventDefault();
                if ($.trim($('#dtfd').val()) == '' || $.trim($('#dttd').val()) == '') {
                    alertR('Select Valid Date');
                } else {
                    $.ajax({
                        type: "POST",
                        url: "exeData.ashx/?ID=146ǁ" + $('#CU').attr('eventtypemonthid') + "ǁ" + $('#dtfd').val() + "ǁ" + $('#dttd').val(),
                        success: function (response) {
                            Loadtbl1();
                        }
                    });
                }

            });
            function Loadtbl1() {
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=147ǁ" + $('#CU').attr('eventtypemonthid'),
                    success: function (response) {
                        var flg = true;
                        try {
                            var jjj = $.parseJSON(response);
                        } catch (e) {
                            // alert(e.message);
                            flg = false;
                        }

                        if (flg) {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '                            <tr>\
                                <th>\
                                    <input  class="dtt up" type="text" tg="dtEventStart" value="' + itm.dtEventStart + '" tg1="' + itm.EventEntryID + '" /></th>\
                                <th>\
                                    <input  class="dtt up" type="text" tg="dtEventEnd" value="' + itm.dtEventEnd + '" tg1="' + itm.EventEntryID + '" /></th>\
                                <th>\
                                    <button class="btn btn-danger marginB10 btnfdtd" tg1="' + itm.EventEntryID + '" >x</button></th>\
                            </tr>';
                            });
                            $('#tblfdtd tbody').html(opt);
                        }
                    }
                });
            }

            $('.btnfdtd').live('click', function (e) {
                e.preventDefault();
                var $ele = $(this);
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=148ǁ" + $ele.attr('tg1'),
                    success: function (response) {
                        $ele.parent().parent().remove();
                    }
                });
            });

            $('.up').live('change', function () {
                var $ele = $(this);
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=149ǁ" + $ele.attr('tg') + "ǁ" + $ele.val() + "ǁ" + $ele.attr('tg1'),
                    success: function (response) {

                    }
                });
            });

            function Loadtbl2() {
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=142ǁ" + $('#CU').attr('eventtypemonthid'),
                    success: function (response) {
                        var flg = true;
                        try {
                            var jjj = $.parseJSON(response);
                        } catch (e) {
                            // alert(e.message);
                            flg = false;
                        }

                        if (flg) {


                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<tr tg="' + itm.EventDatesID + '">\
                      <th>  <input class="dtMultipleDates dtt" tg="' + itm.EventDatesID + '" tg1="dtTate" flg="0" value="' + itm.dtTate + '" type="text" /></th>\
                    <th><button class="btnMultipleDates btn btn-danger marginB10" tg="' + itm.EventDatesID + '">x</button></th>\
                       </tr>';
                            });
                            $('#tblMultipleDates tbody').html(opt);
                        }

                    }
                });
            }

            function FillTowTables() {
                $('#CU').dialog('open');
                Loadtbl1();
                Loadtbl2();
                // DatesRanges($('#CU').attr('m'));
            }

            $('#btnMultipleDates').live('click', function (e) {
                e.preventDefault();

                if ($.trim($('#dtMultipleDates').val()) == '') {
                    alertR('Select Valid Date');
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "exeData.ashx/?ID=145ǁ" + $('#CU').attr('eventtypemonthid') + "ǁ" + $('#dtMultipleDates').val(),
                        success: function (response) {
                            Loadtbl2();
                        }
                    });
                }
            });

            function closeing() {
                var $ele = $('#CU');
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=139ǁ" + $ele.attr('e') + "ǁ" + $ele.attr('m'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += itm.Display + '<br>';
                        });
                        $('.fill[m=' + $ele.attr('m') + '][e=' + $ele.attr('e') + ']').html(opt);

                    }
                });
            }




            $('.dtMultipleDates').live('change', function () {
                var $ele = $(this);
                //$ele.attr('flg', '1');
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=144ǁ" + $ele.attr('tg1') + "ǁ" + $ele.val() + "ǁ" + $ele.attr('tg'),
                    success: function (response) {
                        ///  alert('sss');
                    }
                });
            });

            //$('.dtMultipleDates').live('focusout', function () {
            //    var $ele = $(this);
            //    if ($ele.attr('flg') == '1')
            //    {
            //        $.ajax({
            //            type: "POST",
            //            url: "exeData.ashx/?ID=144ǁ" + $ele.attr('tg1') + "ǁ" + $ele.val() +"ǁ" + $ele.attr('tg'),
            //            success: function (response) {
            //                alert('sss');
            //            }
            //        });
            //    }
            //});

            $('.btnMultipleDates').live('click', function (e) {
                e.preventDefault();
                var $ele = $(this);
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=143ǁ" + $ele.attr('tg'),
                    success: function (response) {
                        $ele.closest('tr').remove();
                    }
                });
            });
            $('#btnCancelDV').live('click', function (e) { e.preventDefault(); $('#CU').dialog('close'); });
            //$(function () {
            //    $('#dtfd').datepicker({ dateFormat: 'dd/mm/yy' });
            //    $('#dtfd').datepicker({ dateFormat: 'dd/mm/yy' });
            //    $('#dtMultipleDates').datepicker({ dateFormat: 'dd/mm/yy' });
            //});
            LoadPP();
            function LoadPP() {
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=138ǁ" + $('#ddlyear').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.EventTypeID + '">\
                                  <td style="background-color: ' + itm.EventTypeColor + ';">' + itm.EventType + '</td>\
                                  <td m="1" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="2" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="3" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="4" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="5" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="6" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="7" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="8" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="9" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="10" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="11" e="' + itm.EventTypeID + '" class="fill"></td>\
                                  <td m="12" e="' + itm.EventTypeID + '" class="fill"></td>\
                                    </tr>';
                        });
                        $('#pp tbody').html(opt);

                        FillFunc();
                    }
                });
            }

            function FillFunc() {

                //$('.fill').each(function (index, element) {
                //    var $ele = $(this);
                //    $.ajax({
                //        type: "POST",
                //        url: "exeData.ashx/?ID=139ǁ" + $ele.attr('e') + "ǁ" + $ele.attr('m'),
                //        success: function (response) {
                //            var jd = $.parseJSON(response), opt = '';
                //            $.each(jd, function (i, itm) {
                //                opt += itm.Display +'<br>';
                //            });
                //            if (opt != '') {

                //                $('.fill[m=' + $ele.attr('m') + '][e=' + $ele.attr('e') + ']').html(opt).attr('EventTypeMonthID', jd[0].EventTypeMonthID);
                //            }
                //        }
                //    });
                //});

                $('.fill').each(function (index, element) { $(this).html('') });

                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=140ǁ" + $('#ddlyear').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            //opt += '';
                            $('.fill[m=' + itm.Month + '][e=' + itm.EventTypeID + ']').append(itm.Display + '<br>').attr('EventTypeMonthID', itm.EventTypeMonthID).attr('EventEntryID', itm.EventEntryID);
                        });
                        $('#faqs').html(opt);
                    }
                });

            }
            $(function () {
                $('#CU').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 640,
                    width: 560,

                    show: {
                        effect: "clip",
                        duration: 500
                    },
                    hide: {
                        effect: "clip",
                        duration: 500
                    },
                    close: function () {
                        closeing();
                    }
                });
            });




            $('.fill').live('click', function () {
                var $ele = $(this);


                $('#tblfdtd tbody').html('');
                $('#tblMultipleDates tbody').html('');
                $('#dtfd').val('');
                $('#dttd').val('');
                $('#dtMultipleDates').val('');
                $('#CU').attr('eventtypemonthid', '0');

                $('#CU').attr('e', $ele.attr('e'))
                $('#CU').attr('m', $ele.attr('m'));
                if (typeof $ele.attr('eventtypemonthid') !== typeof undefined && $ele.attr('eventtypemonthid') !== false) {
                    //alertG('TRUE');
                    $('#CU').attr('eventtypemonthid', $ele.attr('eventtypemonthid'));
                }
                else {
                    //alertR('false');
                    $.ajax({
                        type: "POST",
                        url: "exeData.ashx/?ID=141ǁ" + $ele.attr('e') + "ǁ" + $ele.attr('m'),
                        success: function (response) {
                            $ele.attr('eventtypemonthid', response);
                            $('#CU').attr('eventtypemonthid', response);

                        }
                    });
                }


                FillTowTables();



            });







            $('#ddlyear').live('change', function () {
                ddlyearchanged();

            });
            ddlyearchanged();
            function ddlyearchanged() {
                $('#ddlyearEvents').html('Year ' + $('#ddlyear').val() + ' Events');
                $('#titlepp').html('Event Planner ' + $('#ddlyear').val());
                $('.cp').spectrum('destroy');
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=134ǁ" + $('#ddlyear').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.EventTypeID + '">\
                            <td><input class="txtEvent up"  type="text" style="width:98.6%;" value="' + itm.EventType + '" tg="' + itm.EventTypeID + '" tg1="EventType" flg="0"/></td>\
                            <td><input class="txtColor cp clsclr" type="text" style="width:30px;" value="' + itm.EventTypeColor + '" tg="' + itm.EventTypeID + '" tg1="EventTypeColor" flg="0" clr="' + itm.EventTypeColor + '"  /></td>\
                            <td><input class="txtOrd  up" type="text" style="width:30px;" value="' + itm.ord + '" tg="' + itm.EventTypeID + '" tg1="ord" flg="0" /></td>\
                            <td><button class="btnUpdateEvent btn btn-danger marginB10" tg="' + itm.EventTypeID + '">x</button></td>\
                            ';
                        });
                        $('#tblEvents tbody').html(opt);
                        $('#txtEvent').val('');
                        $('#txtColor').val('');
                        $('#txtOrd').val('');


                        $('.cp').each(function (index, element) {
                            var $ele = $(this);
                            if ($ele.val() == '') {
                                $ele.val('#FFF');
                            }
                            $ele.spectrum({
                                color: $ele.val(),
                                change: function (color) {
                                    $(this).attr('clr', color.toHexString());
                                }
                            });

                        });
                    },
                    error: function (er) {
                        alertR(er);
                    }
                });
                LoadPP();
            }

            $('#btnAddEvent').live('click', function (e) {
                e.preventDefault();
                var cl = encodeURIComponent($('#txtEvent').val() + "ǁ" + $('#txtColor').attr('clr') + "ǁ" + $('#ddlyear').val() + "ǁ" + $('#txtOrd').val());
                cl = cl.replace("#", "%23");
                //alert(cl);
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=135ǁ" + cl,
                    success: function (response) {
                        ddlyearchanged();
                    }
                });
            });

            $('.btnUpdateEvent').live('click', function (e) {
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=136ǁ" + $(this).attr('tg'),
                    success: function (response) {
                        ddlyearchanged();
                    }
                });
            });

            $('.clsclr').live('change', function () {
                var cl = $(this).attr('clr');
                cl = cl.replace("#", "%23");
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=137ǁ" + $(this).attr('tg1') + "ǁ" + cl + "ǁ" + $(this).attr('tg'),
                    success: function (response) {
                    }
                });

            });

            $('.up').live('change', function () {
                $(this).attr('flg', '1');
            });

            $('.up').live('focusout', function () {
                var $ele = $(this);

                var v = $ele.hasClass('txtOrd');
                if ($ele.attr('flg') == '1') {
                    $.ajax({
                        type: "POST",
                        url: "exeData.ashx/?ID=137ǁ" + $ele.attr('tg1') + "ǁ" + $ele.val() + "ǁ" + $ele.attr('tg'),
                        success: function (response) {
                            $ele.attr('flg', '0');
                            if (v) {
                                ddlyearchanged();

                            } LoadPP();
                        }
                    });
                }

            });
        });//END OF READY
    </script>
</asp:Content>

