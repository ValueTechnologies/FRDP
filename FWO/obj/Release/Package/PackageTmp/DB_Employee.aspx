<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="DB_Employee.aspx.cs" Inherits="FRDP.DB_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        select[name=tblEmpSearch_length] {
            /* width: 150px; */
            width: 62px !important;
        }

        select[name=tblattx_length] {
            /* width: 150px; */
            width: 62px !important;
        }

        .bigBtnIcon li a .txt {
            line-height: 12px;
            text-align: center;
            font-size: 14px;
        }

        #ui-datepicker-div {
            z-index: 1000 !important;
        }
    </style>

        <%--=======================================================================--%>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Office Locations</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <div id="OfficesMAP" style="width: 100%; height: 500px;"></div>
                </div>

            </div>

        </div>
    </div>
    <%--=======================================================================--%>


    <%--=========Total Chart grphType1========--%>
    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient chart">

                <div class="title min">

                    <h4>

                        <span class="box-form right" action="">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <span class="icon16 icomoon-icon-cog-2"></span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" style="margin-left: -114px;">
                                <li><a href="#" class="grphType" grph="1" tag="column"><span class="brocco-icon-pause"></span>Column Chart</a></li>
                                <li><a href="#" class="grphType" grph="1" tag="line"><span class="icomoon-icon-share"></span>Line Chart</a></li>
                                <li><a href="#" class="grphType" grph="1" tag="bar"><span class="icomoon-icon-paragraph-left"></span>Bar Chart</a></li>
                                <li><a href="#" class="grphType" grph="1" tag="pie" style="pointer-events: none; cursor: default;"><span class="wpzoom-support"></span>Pie Chart</a></li>
                                <li><a href="#" class="grphType" grph="1" tag="area"><span class="wpzoom-support"></span>Area Chart</a></li>
                                <li><a href="#" class="grphType" grph="1" tag="spline"><span class="icomoon-icon-share"></span>Spline Chart</a></li>
                                <li><a href="#" class="grphType" grph="1" tag="areaspline"><span class="icomoon-icon-share"></span>Area Spline</a></li>
                            </ul>
                        </span>
                        <span class="icon16 icomoon-icon-bars"></span>
                        <span>Employees</span>
                    </h4>
                    <a href="#" class="minimize" style="display: block;">Minimize</a>
                </div>

                <div class="content">

                    <table style="width: 98%;">
                        <tr class="chartRow">
                            <td style="width: 10%;">
                                <div id="container1"></div>
                            </td>

                        </tr>
                    </table>
                    <%------Click Details-------%>
                    <div id="dtlof1" class="box gradient" style="display: none;">

                        <div class="title">

                            <h4>
                                <span id="id1area"></span>
                                <span class="badge badge-important" id="id1badg">0</span>
                            </h4>

                            <a href="#" class="minimize">Minimize</a>
                        </div>
                        <div class="content">
                            <br />
                            <table id="tblEmpSearch" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                                <thead>
                                    <tr>
                                        <th>EMP#</th>
                                        <th>Name</th>
                                        <th>Father Name</th>
                                        <th>Contact</th>
                                        <th>CNIC</th>
                                        <th>Area</th>
                                        <th>Designation</th>
                                        <th>Salary</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>

                    </div>
                    <%------Click Details End-------%>

                    <%--------Over all attendance--------%>
                    <div class="row-fluid">
                        <div class="span12">

                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Todays Attendance</span>
                                    </h4>
                                    <a href="#" id="btnMinmizeAttendance" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <%--=====================--%>
                                    <br />
                                    <div class="row-fluid">

                                        <div class="span12" style="margin-left: 20px;">
                                            Date :
                                            <input id="txtTodayAttendance" type="text" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row-fluid">
                                        <div class="span12">
                                            <div class="centerContent" id="todayAreaAttendance">
                                            </div>

                                        </div>
                                        <!-- End .span8 -->
                                    </div>
                                    <br />
                                    <%--=====================--%>
                                </div>

                            </div>

                        </div>
                    </div>

                    <%--------Attendance Display//--%>
                    <div class="row-fluid" id="attSheetdISPLAY" style="display: none;">
                        <div class="span12">

                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span id="areaName"></span>
                                        <span id="forMonth"></span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">

                                    <div id="atten"></div>
                                    <br />
                                    <br />
                                    <br />

                                </div>

                            </div>

                        </div>
                    </div>
                    <%--------Attendance Display End//--%>
                    <%--------Over all attendance end--------%>
                </div>

            </div>
        </div>
    </div>
    <%-- ========End Total Chart======--%>





    <%--===========Login Status grphType4============--%>
    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient chart">

                <div class="title min">

                    <h4>

                        <span class="box-form right" action="">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <span class="icon16 icomoon-icon-cog-2"></span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" style="margin-left: -114px;">
                                <li><a href="#" class="grphType" grph="4" tag="column"><span class="brocco-icon-pause"></span>Column Chart</a></li>
                                <li><a href="#" class="grphType" grph="4" tag="line"><span class="icomoon-icon-share"></span>Line Chart</a></li>
                                <li><a href="#" class="grphType" grph="4" tag="bar"><span class="icomoon-icon-paragraph-left"></span>Bar Chart</a></li>
                                <li><a href="#" class="grphType" grph="4" tag="pie" style="pointer-events: none; cursor: default;"><span class="wpzoom-support"></span>Pie Chart</a></li>
                                <li><a href="#" class="grphType" grph="4" tag="area"><span class="wpzoom-support"></span>Area Chart</a></li>
                                <li><a href="#" class="grphType" grph="4" tag="spline"><span class="icomoon-icon-share"></span>Spline Chart</a></li>
                                <li><a href="#" class="grphType" grph="4" tag="areaspline"><span class="icomoon-icon-share"></span>Area Spline</a></li>
                            </ul>
                        </span>
                        <span class="icon16 icomoon-icon-bars"></span>
                        <span>User Login Status</span>
                    </h4>
                    <a href="#" class="minimize" style="display: block;">Minimize</a>
                </div>

                <div class="content">

                    <table style="width: 100%;">
                        <tr>
                            <td>From Date</td>
                            <td>
                                <input id="txtFDate4" type="text" value="" /></td>
                            <td>To Date</td>
                            <td>
                                <input id="txtTDate4" type="text" value="" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="width: 10%;">
                                <div id="container4"></div>
                                <div id="container4aMain" style="display: none;"></div>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--===========Login Status End============--%>

            <%--===========FUEL CONSUMPTION grphType2============--%>
    <div class="row-fluid" style="display:none;">
        <div class="span12">
            <div class="box gradient chart">

                <div class="title min">

                    <h4>


                        <span class="icon16 icomoon-icon-bars"></span>
                        <span>Office Wise Generator Fuel Consumption</span>
                        <span class="box-form right" action="">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <span class="icon16 icomoon-icon-cog-2"></span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" style="margin-left: -114px;">
                                <li><a href="#" class="grphType" grph="2" tag="column"><span class="brocco-icon-pause"></span>Column Chart</a></li>
                                <li><a href="#" class="grphType" grph="2" tag="line"><span class="icomoon-icon-share"></span>Line Chart</a></li>
                                <li><a href="#" class="grphType" grph="2" tag="bar"><span class="icomoon-icon-paragraph-left"></span>Bar Chart</a></li>
                                <li><a href="#" class="grphType" grph="2" tag="pie" style="pointer-events: none; cursor: default;"><span class="wpzoom-support"></span>Pie Chart</a></li>
                                <li><a href="#" class="grphType" grph="2" tag="area"><span class="wpzoom-support"></span>Area Chart</a></li>
                                <li><a href="#" class="grphType" grph="2" tag="spline"><span class="icomoon-icon-share"></span>Spline Chart</a></li>
                                <li><a href="#" class="grphType" grph="2" tag="areaspline"><span class="icomoon-icon-share"></span>Area Spline</a></li>
                            </ul>
                        </span>
                    </h4>
                    <a href="#" class="minimize" style="display: block;">Minimize</a>
                </div>

                <div class="content">

                    <table style="width: 100%;">
                        <tr>
                            <td>From Date</td>
                            <td>
                                <%--<%=   "01\\"+Convert.ToString(DateTime.Now.Month)+"\\"+ Convert.ToString(DateTime.Now.Year) %>--%>
                                <input id="txtFDate2" type="text" value="" /></td>
                            <td>To Date</td>
                            <td>
                                <%--<%=   "30\\"+Convert.ToString(DateTime.Now.Month)+"\\"+ Convert.ToString(DateTime.Now.Year) %>--%>
                                <input id="txtTDate2" type="text" value="" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="width: 10%;">
                                <div id="container2"></div>
                                <br />
                                <div id="container2aMain"></div>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--===========End Fuel Consumption=========--%>
    <%--===========Vehicle Countdown grphType3============--%>
    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient chart">

                <div class="title min">

                    <h4>

                        <span class="box-form right" action="">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <span class="icon16 icomoon-icon-cog-2"></span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" style="margin-left: -114px;">
                                <li><a href="#" class="grphType" grph="3" tag="column"><span class="brocco-icon-pause"></span>Column Chart</a></li>
                                <li><a href="#" class="grphType" grph="3" tag="line"><span class="icomoon-icon-share"></span>Line Chart</a></li>
                                <li><a href="#" class="grphType" grph="3" tag="bar"><span class="icomoon-icon-paragraph-left"></span>Bar Chart</a></li>
                                <li><a href="#" class="grphType" grph="3" tag="pie" style="pointer-events: none; cursor: default;"><span class="wpzoom-support"></span>Pie Chart</a></li>
                                <li><a href="#" class="grphType" grph="3" tag="area"><span class="wpzoom-support"></span>Area Chart</a></li>
                                <li><a href="#" class="grphType" grph="3" tag="spline"><span class="icomoon-icon-share"></span>Spline Chart</a></li>
                                <li><a href="#" class="grphType" grph="3" tag="areaspline"><span class="icomoon-icon-share"></span>Area Spline</a></li>
                            </ul>
                        </span>
                        <span class="icon16 icomoon-icon-bars"></span>
                        <span>Area Wise Vehicle Countdown</span>
                    </h4>
                    <a href="#" class="minimize" style="display: block;">Minimize</a>
                </div>

                <div class="content">

                    <table style="width: 100%;">
                        <tr>
                            <td>From Date</td>
                            <td>
                                <input id="txtFDate3" type="text" value="" /></td>
                            <td>To Date</td>
                            <td>
                                <input id="txtTDate3" type="text" value="" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="width: 10%;">
                                <div id="container3"></div>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--===========Vehicle Countdown End============--%>
    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    <script type="text/javascript">
        var grphType1 = 'column';
        var grphType2 = 'column';
        var grphType3 = 'column';
        var grphType4 = 'column';
        $(document).ready(function () {
            $('.heading h3').html('Dashboard');
            //$('.leftbar').click();
            $('.title h4').live('click', function (e) {
                if ($(e.target).context.nodeName == "H4") {
                    $(this).next().click();
                }
            });

            ////////////////////////////////////////////Offices MAP

            loadMap();
            function loadMap() {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=49ǁ",
                    success: function (response) {
                        var locations = $.parseJSON(response);
                        var geocoder;
                        geocoder = new google.maps.Geocoder();
                        var myLatlng = new google.maps.LatLng(30.214570, 66.990085);
                        var myOptions = {
                            zoom: 6,
                            center: myLatlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        }

                        map2 = new google.maps.Map(document.getElementById("OfficesMAP"), myOptions);

                        $.each(locations, function (i, j) {
                            var image = new google.maps.MarkerImage('Images/GMAP_ICONS/'+j.lvl+'.png',
               new google.maps.Size(32, 32),
               new google.maps.Point(0, 0),
               new google.maps.Point(18, 42)
               );

                            myLatlng = new google.maps.LatLng(j.strSchoolLatLang.split(',')[0], j.strSchoolLatLang.split(',')[1]);
                            var infowindow = new google.maps.InfoWindow();
                            marker = new google.maps.Marker({
                                position: myLatlng,
                                map: map2,
                                icon: image
                            });
                            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                return function () {
                                    infowindow.setContent(j.School);
                                    infowindow.open(map2, marker);
                                }
                            })(marker, i));
                        });//End of Each


                    }
                });

            }
            ////////////////////////////////////////////Offices MAP END
            /////////////////Today Attendance/////////////////
            var tblattx_length = 5;
            $('#txtTodayAttendance').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    TodaysAttendance();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day) +"/"+Convert.ToString(DateTime.Now.Month)+"/"+ Convert.ToString(DateTime.Now.Year) %>");
            TodaysAttendance();
            function TodaysAttendance() {
                $('#todayAreaAttendance').html('<ul class="bigBtnIcon"></div>');
                $('#attSheetdISPLAY').hide();
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=37ǁ" + $('#txtTodayAttendance').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        var coll = 'GREEN', col = 0;

                        $.each(jd, function (i, itm) {
                            if (col == 6) {
                                col = 0;

                            }
                            if (col < 2) {
                                coll = 'green';
                            }
                            if (col >= 2 && col < 4) {
                                coll = 'red';
                            }
                            if (col >= 4 && col < 6) {
                                coll = 'blue';
                            }


                            col++;

                            opt += '<li>\
                                    <a title="' + itm.CompanyName + '" class="tipB areaAttx" lid="' + itm.CompanyID + '">\
                                        <span class="icon icomoon-icon-history"></span>\
                                        <span class="txt">' + itm.CompanyName + '</span>\
                                        <span class="notification ' + coll + '">' + itm.Present + '/' + itm.Total + '</span>\
                                    </a>\
                                </li>';
                        });
                        $('#todayAreaAttendance').html('<ul class="bigBtnIcon">' + opt + '</div>');
                        $('#todayAreaAttendance .tipB').qtip({
                            content: false,
                            position: {
                                my: 'top center',
                                at: 'bottom center',
                                viewport: $(window)
                            },
                            style: {
                                classes: 'ui-tooltip-tipsy'
                            }
                        });
                    }
                });
            }
            var _$_7bf6 = ["click", "lid", "attr", "oldtitle", "html", "#areaName", "/", "split", "val", "#txtTodayAttendance", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "Attendance For ", " ", "#forMonth", "POST", "EmpReg.ashx/?ID=34ǁ", "ǁ", "#atten", "dynamicTable", "addClass", "#tblattx", "All", "full_numbers", "id", "search", ".dataTables_filter>label>input", "dataTable", "ajax", "show", "#attSheetdISPLAY", "live", ".areaAttx"]; $(_$_7bf6[42])[_$_7bf6[41]](_$_7bf6[0], function () { var a = $(this)[_$_7bf6[2]](_$_7bf6[1]); var b = $(this)[_$_7bf6[2]](_$_7bf6[3]); $(_$_7bf6[5])[_$_7bf6[4]](b); var c = $(_$_7bf6[9])[_$_7bf6[8]]()[_$_7bf6[7]](_$_7bf6[6]); var d = [_$_7bf6[10], _$_7bf6[11], _$_7bf6[12], _$_7bf6[13], _$_7bf6[14], _$_7bf6[15], _$_7bf6[16], _$_7bf6[17], _$_7bf6[18], _$_7bf6[19], _$_7bf6[20], _$_7bf6[21]]; $(_$_7bf6[24])[_$_7bf6[4]](_$_7bf6[22] + d[parseInt(c[1]) - 1] + _$_7bf6[23] + c[2]); $[_$_7bf6[38]]({ type: _$_7bf6[25], url: _$_7bf6[26] + a + _$_7bf6[27] + $(_$_7bf6[9])[_$_7bf6[8]](), success: function (e) { $(_$_7bf6[28])[_$_7bf6[4]](e); $(_$_7bf6[31])[_$_7bf6[30]](_$_7bf6[29]); $(_$_7bf6[31])[_$_7bf6[37]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_7bf6[32]]], "iDisplayLength": -1, "sPaginationType": _$_7bf6[33], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (g, f) { $(_$_7bf6[36])[_$_7bf6[2]](_$_7bf6[34], _$_7bf6[35]) } }); } }); $(_$_7bf6[40])[_$_7bf6[39]](); });
            
            $('select[name=tblattx_length]').live('change', function () {
                console.log($(this).val());
                tblattx_length = $(this).val();
            });
            /////////////////Today Attendance END/////////////////


            var _$_a371 = ["click", "live", ".leftbar"]; $(_$_a371[2])[_$_a371[1]](_$_a371[0], function () { Q1(); Q2(); Q3(); Q4(); });


            $('#txtFDate2').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {

                    Q2();
                }
            }).datepicker("setDate", "<%= "01/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

            $('#txtTDate2').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {

                    Q2();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

            $('#txtFDate3').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    Q3();
                }
            }).datepicker("setDate", "10/06/2015");

            $('#txtTDate3').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    Q3();
                }
            }).datepicker("setDate", "31/07/2015");


            $('#txtFDate4').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    Q4();
                }
            }).datepicker("setDate", "<%= "01/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

            $('#txtTDate4').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
                onSelect: function () {
                    Q4();
                }
            }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day)+"/"+Convert.ToString(DateTime.Now.Month)+"/"+Convert.ToString(DateTime.Now.Year) %>");

            $('.grphType').live('click', function (e) {
                e.preventDefault();
                var gtype = $(this).attr('tag');
                var forGraph = $(this).attr('grph');
                if (forGraph == "1") {
                    grphType1 = gtype;
                    Q1();
                }
                if (forGraph == "2") {
                    grphType2 = gtype;
                    Q2();
                    e.preventDefault();
                }
                if (forGraph == "3") {
                    grphType3 = gtype;
                    Q3();
                }
                if (forGraph == "4") {
                    grphType4 = gtype;
                    Q4();
                }
                if (forGraph == "12") {
                    grphType12 = gtype;
                    Q12();
                }
            });
            Q1();
            function Q1() {

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "DB_Employee.aspx/EmpChart",
                    data: "{'Q':'12','yr':'2014'}",
                    success: function (response) {

                        var dd = $.parseJSON(response.d);

                        var lmn = [];
                        $.each(dd.Series, function (i, itm) {
                            tmp = [];

                            $.each(itm.Mydata, function (a3, b3) {
                                tmp.push(parseFloat(b3));
                            });
                            var s = { type: grphType1, name: itm.Myname, data: tmp };
                            lmn.push(s);
                        });




                        $('#container1').highcharts({

                            title: {
                                text: 'Office Wise Employees'
                            },
                            subtitle: {
                                text: 'Designations'
                            },
                            xAxis: {
                                categories: dd.categories,
                                rotation: -45,
                                title: {
                                    text: null
                                }




                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Total Count',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                },
                                allowDecimals: false
                            },
                            tooltip: {
                                valueSuffix: ' '
                            },
                            plotOptions: {
                                bar: {
                                    dataLabels: {
                                        enabled: true
                                    }
                                }


                                                               , series: {
                                                                   cursor: 'pointer',
                                                                   point: {
                                                                       events: {
                                                                           click: function () {


                                                                               LoadEmp(this.category, this.y, this.series.name);
                                                                           }
                                                                       }
                                                                   }
                                                               }


                            },

                            credits: {
                                enabled: false
                            },
                            series: lmn
                        });


                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
            }

            Q2();
            function Q2() {
                $('#container2aMain').hide();
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "DB_Employee.aspx/GenChart",
                    data: "{'Q':'" + $('#txtFDate2').val() + "','yr':'" + $('#txtTDate2').val() + "'}",
                    success: function (response) {
                        var dd = $.parseJSON(response.d);
                        var lmn = [];
                        $.each(dd.Series, function (i, itm) {
                            tmp = [];

                            $.each(itm.Mydata, function (a3, b3) {
                                tmp.push(parseFloat(b3));
                            });
                            var s = { type: grphType2, name: itm.Myname, data: tmp };
                            lmn.push(s);
                        });




                        $('#container2').highcharts({

                            title: {
                                text: 'Office Wise Generator Fuel Consumption Duration and Fuel Cost'
                            },
                            subtitle: {
                                text: $('#txtFDate2').val() + ' to ' + $('#txtTDate2').val()
                            },
                            xAxis: {
                                categories: dd.categories,
                                title: {
                                    text: null
                                }
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Total Count',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                }
                            },
                            tooltip: {
                                valueSuffix: ' '
                            },
                            plotOptions: {
                                bar: {
                                    dataLabels: {
                                        enabled: true
                                    }
                                }

                                                                                               , series: {
                                                                                                   cursor: 'pointer',
                                                                                                   point: {
                                                                                                       events: {
                                                                                                           click: function () {

                                                                                                               //alert('Category: ' + this.category + ', value: ' + this.y + ', Name: ' + this.series.name);
                                                                                                               Q2A(this.category, this.y, this.series.name);
                                                                                                           }
                                                                                                       }
                                                                                                   }
                                                                                               }
                            },

                            credits: {
                                enabled: false
                            },
                            series: lmn
                        });


                    },
                    error: function (Result) {
                        alert(Result.error);
                    }
                });

            }

            function Q2A(obj1, obj2, obj3) {
                if (obj3 == "Fuel Cost (Rs.) Hundred(s)") {
                    //console.log(obj1);// LOCATION NAME
                    //console.log(obj2);// VALUE
                    //console.log('Fuel Cost'); //Title
                    Q2A1(obj1, obj2, obj3);
                }
                if (obj3 == "Fuel Input (Litters)") {
                    //console.log(obj1);
                    //console.log(obj2);
                    //console.log(obj3);
                    Q2A1(obj1, obj2, obj3);
                }
                if (obj3 == "Generator Working Duration(HH)") {
                    //console.log(obj1);
                    //console.log(obj2);
                    //console.log(obj3);
                    Q2A1(obj1, obj2, obj3);
                }

            }
            function Q2A1(obj1, obj2, obj3) {
                $('#container2aMain').show();
                $('#container2aMain').html('<div id="conQ2A1"></div>');

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "DB_Employee.aspx/Q2A1Web",
                    data: "{'obj1':'" + $('#txtFDate2').val() + "','obj2':'" + $('#txtTDate2').val() + "','obj3':'" + obj1 + "'}",
                    success: function (response) {
                        // alert(response.d);
                        var dd = $.parseJSON(response.d);
                        //alert(response.d);
                        var lmn = [];
                        $.each(dd.Series, function (i, itm) {
                            tmp = [];

                            $.each(itm.Mydata, function (a3, b3) {
                                tmp.push(parseFloat(b3));
                            });
                            var s = { type: grphType2, name: itm.Myname, data: tmp };
                            lmn.push(s);
                        });


                        ////////        }
                        ////////    });

                        ////////}
                        $('#conQ2A1').highcharts({

                            title: {
                                text: 'Office Wise Generator Fuel Consumption and Fuel Cost'
                            },
                            subtitle: {
                                text: $('#txtFDate2').val() + ' to ' + $('#txtTDate2').val()
                            },
                            xAxis: {
                                categories: dd.categories,
                                title: {
                                    text: null
                                }

                                , labels: {
                                    rotation: -45
                                }
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Total Count',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                }
                            },
                            tooltip: {
                                valueSuffix: ' '
                            },
                            plotOptions: {
                                bar: {
                                    dataLabels: {
                                        enabled: true
                                    }
                                }


                            },

                            credits: {
                                enabled: false
                            },
                            series: lmn
                        });


                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });

            }
            function Q2A2(obj1, obj2, obj3) {
                $('#container2aMain').html('<div id="conQ2A2"></div>');
            }
            function Q2A3(obj1, obj2, obj3) {
                $('#container2aMain').html('<div id="conQ2A3"></div>');
            }
            Q3();
            function Q3() {

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "DB_Employee.aspx/Q3",
                    data: "{'Q':'" + $('#txtFDate3').val() + "','yr':'" + $('#txtTDate3').val() + "'}",
                    success: function (response) {
                        // alert(response.d);
                        var dd = $.parseJSON(response.d);
                        //alert(response.d);
                        var lmn = [];
                        $.each(dd.Series, function (i, itm) {
                            tmp = [];

                            $.each(itm.Mydata, function (a3, b3) {
                                tmp.push(parseFloat(b3));
                            });
                            var s = { type: grphType3, name: itm.Myname, data: tmp };
                            lmn.push(s);
                        });




                        $('#container3').highcharts({

                            title: {
                                text: 'Office Wise Vehicle Countdown'
                            },
                            subtitle: {
                                text: $('#txtFDate3').val() + ' to ' + $('#txtTDate3').val()
                            },
                            xAxis: {
                                categories: dd.categories,
                                title: {
                                    text: null
                                }
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Total Count',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                }
                            },
                            tooltip: {
                                valueSuffix: ' '
                            },
                            plotOptions: {
                                bar: {
                                    dataLabels: {
                                        enabled: true
                                    }
                                }
                            },

                            credits: {
                                enabled: false
                            },
                            series: lmn
                        });


                    },
                    error: function (Result) {
                        alert(Result.Message);
                    }
                });

            }


            Q4();
            function Q4() {
                $('#container4aMain').hide();
                $('#container4aMain').html('<div id="dvpersonDet"></div><div id="dvloginDet"></div>');
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "DB_Employee.aspx/Q4",
                    data: "{'Q':'" + $('#txtFDate4').val() + "','yr':'" + $('#txtTDate4').val() + "'}",
                    success: function (response) {
                        //alert(response.d);
                        var dd = $.parseJSON(response.d);
                        //alert(response.d);
                        var lmn = [];
                        var xx = [];
                        $.each(dd.Series, function (i, itm) {
                            tmp = [];

                            $.each(itm.Mydata, function (a3, b3) {
                                tmp.push(parseFloat(b3));
                            });
                            xx.push(itm.Myname);
                            var s = { type: grphType4, name: itm.Myname, data: tmp };
                            lmn.push(s);
                        });


                        // alert(xx);

                        $('#container4').highcharts({

                            title: {
                                text: 'Users Login Status'
                            },
                            subtitle: {
                                text: $('#txtFDate4').val() + ' to ' + $('#txtTDate4').val()
                            },
                            xAxis: {

                                categories: ['Login Count'],// dd.categories,//['Login Count'],
                                title: {
                                    text: null
                                }

                                //, labels: {
                                //    rotation: -45
                                //}
                            },
                            yAxis: {

                                min: 0,
                                title: {
                                    text: 'Total Count',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                },
                                allowDecimals: false
                            },
                            tooltip: {
                                valueSuffix: ' '
                            },
                            //plotOptions: {
                            //    bar: {
                            //        dataLabels: {
                            //            enabled: true
                            //        }
                            //    }
                            //},

                            plotOptions: {
                                bar: {
                                    dataLabels: {
                                        enabled: true
                                    }
                                }

                                                                   , series: {
                                                                       cursor: 'pointer',
                                                                       point: {
                                                                           events: {
                                                                               click: function () {

                                                                                   //alert('Category: ' + this.category + ', value: ' + this.y + ', Name: ' + this.series.name);
                                                                                   Q4A1(this.category, this.y, this.series.name);
                                                                               }
                                                                           }
                                                                       }
                                                                   }
                            },

                            credits: {
                                enabled: false
                            },
                            series: lmn
                        });

                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });

            }
            function Q4A1(obj1, obj2, obj3) {
                $('#container4aMain').show();

                $.ajax({
                    type: 'GET',
                    url: "EmpReg.ashx/?ID=40ǁ" + $('#txtFDate4').val() + "ǁ" + $('#txtTDate4').val() + "ǁ" + obj2 + "ǁ" + obj3 + "ǁ",
                    success: function (data) {




                        var txt = '<table class="table">\
           <tbody>\
               <tr class="success">\
                   <td rowspan="3" style="width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;">\
                       <img id="imgEmpPhoto" src="Uploads/EmployeePhoto/0.png" alt="" style="width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;" class="marginR10" /></td>\
                   <td style="text-align: left; width: 80px;"><strong>Emp#</strong></td>\
                   <td style="text-align: left;" id="tL1"></td>\
                   <td style="text-align: left; width: 90px;"><strong>Name</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL2"></td>\
               </tr>\
               <tr class="error">\
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>CNIC</strong></td>\
                   <td style="text-align: left;" id="tL3"></td>\
                   <td style="text-align: left;"><strong>Father Name</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL4"></td>\
               </tr>\
               <tr class="info">\
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>Designation</strong></td>\
                   <td style="text-align: left;" id="tL5"></td>\
                   <td style="text-align: left;"><strong>Appointed At</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL6"></td>\
               </tr>\
                <tr class="error">\
                <td style="border-left: 1px solid #c4c4c4;">&nbsp;</td>\
                   <td style="text-align: left;"><strong>Shift</strong></td>\
                   <td style="text-align: left;" id="tL7"></td>\
                   <td style="text-align: left;"><strong>Contact</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL8"></td>\
               </tr>\
           </tbody>\
       </table>';
                        var jd = $.parseJSON(data);
                        $('#dvpersonDet').html(txt);
                        
                        $('#imgEmpPhoto').attr('src', jd[0].PhotoExtension);
                        $('#tL1').html(jd[0].EmpNo);
                        $('#tL2').html(jd[0].Full_Name);
                        $('#tL3').html(jd[0].CNIC);
                        $('#tL4').html(jd[0].FatherName);
                        $('#tL5').html(jd[0].Designations);
                        $('#tL6').html(jd[0].Area);
                        $('#tL7').html(jd[0].Shift);
                        $('#tL8').html(jd[0].ContactNos);
                        //var uid = jd[0].User_ID;
                        var uid = jd[0].LoginID;
                        console.log(uid);
                        $.ajax({
                            type: "POST",
                            url: "EmpReg.ashx/?ID=41ǁ" + uid + "ǁ" + $('#txtFDate4').val() + "ǁ" + $('#txtTDate4').val(),
                            success: function (response) {
                                $('#dvloginDet').html(response);
                            }
                        });
                    }
                });


            }

            var tblEmpSearch_length = 5;
            var _$_110e = ["½", "POST", "application/json; charset=utf-8", "json", "DB_Employee.aspx/GetEmpList", "{'vals':'", "'}", "d", "parseJSON", "", "<tr><td class=\"personPopupTrigger\" rel=\"26,", "User_ID", "\">", "EmpNo", "</td>\r                                    <td>", "Full_Name", "FatherName", "</td>\r                                      <td>", "ContactNos", "CNIC", "Area", "Designations", "Salary", "</td>\r                                      </tr>", "each", "dataTable", "hasClass", "#tblEmpSearch", "fnDestroy", "html", "#tblEmpSearch tbody", "dynamicTable", "addClass", "All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "#id1area", "#id1badg", "show", "#dtlof1", "ajax"]; function LoadEmp(a, b, c) { var d = a + _$_110e[0] + c + _$_110e[0] + b; $[_$_110e[43]]({ type: _$_110e[1], contentType: _$_110e[2], dataType: _$_110e[3], url: _$_110e[4], data: _$_110e[5] + d + _$_110e[6], success: function (g) { var e = $[_$_110e[8]](g[_$_110e[7]]), f = _$_110e[9]; $[_$_110e[24]](e, function (h, j) { f += _$_110e[10] + j[_$_110e[11]] + _$_110e[12] + j[_$_110e[13]] + _$_110e[14] + j[_$_110e[15]] + _$_110e[14] + j[_$_110e[16]] + _$_110e[17] + j[_$_110e[18]] + _$_110e[17] + j[_$_110e[19]] + _$_110e[17] + j[_$_110e[20]] + _$_110e[17] + j[_$_110e[21]] + _$_110e[17] + j[_$_110e[22]] + _$_110e[23] }); if ($(_$_110e[27])[_$_110e[26]](_$_110e[25])) { $(_$_110e[27])[_$_110e[25]]()[_$_110e[28]]() }; $(_$_110e[30])[_$_110e[29]](f); $(_$_110e[27])[_$_110e[32]](_$_110e[31]); $(_$_110e[27])[_$_110e[25]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_110e[33]]], "iDisplayLength": tblEmpSearch_length, "sPaginationType": _$_110e[34], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (l, k) { $(_$_110e[38])[_$_110e[37]](_$_110e[35], _$_110e[36]) } }); $(_$_110e[39])[_$_110e[29]](a); $(_$_110e[40])[_$_110e[29]](b); $(_$_110e[42])[_$_110e[41]](); } }); }
            $('select[name=tblEmpSearch_length]').live('change', function () {
                tblEmpSearch_length = $(this).val();
            });
            /////////////////////////////

            $(function () {
                var hideDelay = 500;
                var currentID;
                var hideTimer = null;

                // One instance that's reused to show info for the current person
                var container = $('<div id="personPopupContainer">'
                    + '<table width="" border="0" cellspacing="0" cellpadding="0" align="center" class="personPopupPopup">'
                    + '<tr>'
                    + '   <td class="corner topLeft"></td>'
                    + '   <td class="top"></td>'
                    + '   <td class="corner topRight"></td>'
                    + '</tr>'
                    + '<tr>'
                    + '   <td class="left">&nbsp;</td>'
                    + '   <td style="background-color: white;"><div id="personPopupContent"></div><div id="personAttendance"></div></td>'
                    + '   <td class="right">&nbsp;</td>'
                    + '</tr>'
                    + '<tr>'
                    + '   <td class="corner bottomLeft">&nbsp;</td>'
                    + '   <td class="bottom">&nbsp;</td>'
                    + '   <td class="corner bottomRight"></td>'
                    + '</tr>'
                    + '</table>'
                    + '</div>');

                $('body').append(container);

                var _$_3e19 = ["mouseover", ",", "split", "rel", "attr", "", "offset", "width", "left", "px", "top", "css", "&nbsp;", "html", "#personPopupContent", "GET", "EmpReg.ashx/?ID=39ǁ", "<table class=\"table\">\r           <tbody>\r               <tr class=\"success\">\r                   <td rowspan=\"3\" style=\"width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;\">\r                       <img id=\"imgEmpPhoto\" src=\"Uploads/EmployeePhoto/0.png\" alt=\"\" style=\"width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;\" class=\"marginR10\" /></td>\r                   <td style=\"text-align: left; width: 80px;\"><strong>Emp#</strong></td>\r                   <td style=\"text-align: left;\" id=\"t1\"></td>\r                   <td style=\"text-align: left; width: 90px;\"><strong>Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"t2\"></td>\r               </tr>\r               <tr class=\"error\">\r                   <td style=\"text-align: left;    border-left: 1px solid #c4c4c4;\"><strong>CNIC</strong></td>\r                   <td style=\"text-align: left;\" id=\"t3\"></td>\r                   <td style=\"text-align: left;\"><strong>Father Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"t4\"></td>\r               </tr>\r               <tr class=\"info\">\r                   <td style=\"text-align: left;    border-left: 1px solid #c4c4c4;\"><strong>Designation</strong></td>\r                   <td style=\"text-align: left;\" id=\"t5\"></td>\r                   <td style=\"text-align: left;\"><strong>Appointed At</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"t6\"></td>\r               </tr>\r                <tr class=\"error\">\r                <td style=\"border-left: 1px solid #c4c4c4;\">&nbsp;</td>\r                   <td style=\"text-align: left;\"><strong>Shift</strong></td>\r                   <td style=\"text-align: left;\" id=\"t7\"></td>\r                   <td style=\"text-align: left;\"><strong>Contact</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"t8\"></td>\r               </tr>\r           </tbody>\r       </table>", "parseJSON", "src", "Uploads/EmployeePhoto/", "PhotoExtension", "#imgEmpPhoto", "EmpNo", "#t1", "Full_Name", "#t2", "CNIC", "#t3", "FatherName", "#t4", "Designations", "#t5", "Area", "#t6", "Shift", "#t7", "ContactNos", "#t8", "ajax", "POST", "EmpReg.ashx/?ID=32ǁ", "#personAttendance", "display", "block", "live", ".personPopupTrigger"]; $(_$_3e19[46])[_$_3e19[45]](_$_3e19[0], function () { var c = $(this)[_$_3e19[4]](_$_3e19[3])[_$_3e19[2]](_$_3e19[1]); var a = c[0]; currentID = c[1]; if (currentID == _$_3e19[5]) { return }; if (hideTimer) { clearTimeout(hideTimer) }; var b = $(this)[_$_3e19[6]](); var d = $(this)[_$_3e19[7]](); container[_$_3e19[11]]({ left: (b[_$_3e19[8]] + d) + _$_3e19[9], top: b[_$_3e19[10]] - 5 + _$_3e19[9] }); $(_$_3e19[14])[_$_3e19[13]](_$_3e19[12]); $[_$_3e19[39]]({ type: _$_3e19[15], url: _$_3e19[16] + currentID, success: function (e) { var g = _$_3e19[17]; var f = $[_$_3e19[18]](e); $(_$_3e19[14])[_$_3e19[13]](g); $(_$_3e19[22])[_$_3e19[4]](_$_3e19[19], _$_3e19[20] + f[0][_$_3e19[21]]); $(_$_3e19[24])[_$_3e19[13]](f[0][_$_3e19[23]]); $(_$_3e19[26])[_$_3e19[13]](f[0][_$_3e19[25]]); $(_$_3e19[28])[_$_3e19[13]](f[0][_$_3e19[27]]); $(_$_3e19[30])[_$_3e19[13]](f[0][_$_3e19[29]]); $(_$_3e19[32])[_$_3e19[13]](f[0][_$_3e19[31]]); $(_$_3e19[34])[_$_3e19[13]](f[0][_$_3e19[33]]); $(_$_3e19[36])[_$_3e19[13]](f[0][_$_3e19[35]]); $(_$_3e19[38])[_$_3e19[13]](f[0][_$_3e19[37]]); } }); $[_$_3e19[39]]({ type: _$_3e19[40], url: _$_3e19[41] + currentID, success: function (h) { $(_$_3e19[42])[_$_3e19[13]](h) } }); container[_$_3e19[11]](_$_3e19[43], _$_3e19[44]); });

                var _$_abfe = ["mouseout", "display", "none", "css", "live", ".personPopupTrigger"]; $(_$_abfe[5])[_$_abfe[4]](_$_abfe[0], function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_abfe[3]](_$_abfe[1], _$_abfe[2]) }, hideDelay); });

                // Allow mouse over of details without hiding details
                var _$_f5ff = ["mouseover", "#personPopupContainer"]; $(_$_f5ff[1])[_$_f5ff[0]](function () { if (hideTimer) { clearTimeout(hideTimer) } });

                // Hide after mouseout
                var _$_b1a7 = ["display", "none", "css", "mouseout", "#personPopupContainer"]; $(_$_b1a7[4])[_$_b1a7[3]](function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_b1a7[2]](_$_b1a7[0], _$_b1a7[1]) }, hideDelay); });
            });
            /////////////////////////////
            $(function () {
                var hideDelay = 500;
                var currentID;
                var hideTimer = null;

                // One instance that's reused to show info for the current person
                var container = $('<div id="clsShowMonthlyAttendanceContainer">'
                    + '<table width="" border="0" cellspacing="0" cellpadding="0" align="center" class="clsShowMonthlyAttendancePopup">'
                    + '<tr>'
                    + '   <td class="corner topLeft"></td>'
                    + '   <td class="top"></td>'
                    + '   <td class="corner topRight"></td>'
                    + '</tr>'
                    + '<tr>'
                    + '   <td class="left">&nbsp;</td>'
                    + '   <td style="background-color: white;"><div id="clsShowMonthlyAttendanceContent"></div><div id="clsShowMonthlyAttendanceAttendance"></div></td>'
                    + '   <td class="right">&nbsp;</td>'
                    + '</tr>'
                    + '<tr>'
                    + '   <td class="corner bottomLeft">&nbsp;</td>'
                    + '   <td class="bottom">&nbsp;</td>'
                    + '   <td class="corner bottomRight"></td>'
                    + '</tr>'
                    + '</table>'
                    + '</div>');

                $('body').append(container);

                var _$_ce89 = ["mouseover", "/", "split", "val", "#txtTodayAttendance", "rel", "attr", "", "offset", "width", "left", "px", "top", "css", "&nbsp;", "html", "#clsShowMonthlyAttendanceContent", "GET", "EmpReg.ashx/?ID=39ǁ", "ǁ", "<table class=\"table\">\r           <tbody>\r               <tr class=\"success\">\r                   <td rowspan=\"3\" style=\"width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;\">\r                   <img id=\"imgEmpPhotot\" src=\"Uploads/EmployeePhoto/0.png\" alt=\"\" style=\"width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;\" class=\"marginR10\" /></td>\r                   <td style=\"text-align: left; width: 80px;\"><strong>Emp#</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt1\"></td>\r                   <td style=\"text-align: left; width: 90px;\"><strong>Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt2\"></td>\r               </tr>\r               <tr class=\"error\">\r                   <td style=\"text-align: left;    border-left: 1px solid #c4c4c4;\"><strong>CNIC</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt3\"></td>\r                   <td style=\"text-align: left;\"><strong>Father Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt4\"></td>\r               </tr>\r               <tr class=\"info\">\r                   <td style=\"text-align: left;    border-left: 1px solid #c4c4c4;\"><strong>Designation</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt5\"></td>\r                   <td style=\"text-align: left;\"><strong>Appointed At</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt6\"></td>\r               </tr>\r                <tr class=\"error\">\r                <td style=\"border-left: 1px solid #c4c4c4;\">&nbsp; </td>\r                   <td style=\"text-align: left;\"><strong>Shift</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt7\"></td>\r                   <td style=\"text-align: left;\"><strong>Contact</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt8\"></td>\r               </tr>\r           </tbody>\r       </table>", "parseJSON", "src", "Uploads/EmployeePhoto/", "PhotoExtension", "#imgEmpPhotot", "EmpNo", "#tt1", "Full_Name", "#tt2", "CNIC", "#tt3", "FatherName", "#tt4", "Designations", "#tt5", "Area", "#tt6", "Shift", "#tt7", "ContactNos", "#tt8", "ajax", "POST", "EmpReg.ashx/?ID=38ǁ", "#clsShowMonthlyAttendanceAttendance", "display", "block", "live", ".clsShowMonthlyAttendance"]; $(_$_ce89[49])[_$_ce89[48]](_$_ce89[0], function () { var d = $(_$_ce89[4])[_$_ce89[3]]()[_$_ce89[2]](_$_ce89[1]); var a = d[1]; var b = d[2]; currentID = $(this)[_$_ce89[6]](_$_ce89[5]); if (currentID == _$_ce89[7]) { return }; if (hideTimer) { clearTimeout(hideTimer) }; var c = $(this)[_$_ce89[8]](); var e = $(this)[_$_ce89[9]](); container[_$_ce89[13]]({ left: (c[_$_ce89[10]] + e) + _$_ce89[11], top: c[_$_ce89[12]] - 5 + _$_ce89[11] }); $(_$_ce89[16])[_$_ce89[15]](_$_ce89[14]); $[_$_ce89[42]]({ type: _$_ce89[17], url: _$_ce89[18] + currentID + _$_ce89[19] + a, success: function (f) { var h = _$_ce89[20]; var g = $[_$_ce89[21]](f); $(_$_ce89[16])[_$_ce89[15]](h); $(_$_ce89[25])[_$_ce89[6]](_$_ce89[22], _$_ce89[23] + g[0][_$_ce89[24]]); $(_$_ce89[27])[_$_ce89[15]](g[0][_$_ce89[26]]); $(_$_ce89[29])[_$_ce89[15]](g[0][_$_ce89[28]]); $(_$_ce89[31])[_$_ce89[15]](g[0][_$_ce89[30]]); $(_$_ce89[33])[_$_ce89[15]](g[0][_$_ce89[32]]); $(_$_ce89[35])[_$_ce89[15]](g[0][_$_ce89[34]]); $(_$_ce89[37])[_$_ce89[15]](g[0][_$_ce89[36]]); $(_$_ce89[39])[_$_ce89[15]](g[0][_$_ce89[38]]); $(_$_ce89[41])[_$_ce89[15]](g[0][_$_ce89[40]]); } }); $[_$_ce89[42]]({ type: _$_ce89[43], url: _$_ce89[44] + currentID + _$_ce89[19] + a + _$_ce89[19] + b, success: function (i) { $(_$_ce89[45])[_$_ce89[15]](i) } }); container[_$_ce89[13]](_$_ce89[46], _$_ce89[47]); });

                var _$_ff58 = ["mouseout", "display", "none", "css", "live", ".clsShowMonthlyAttendance"]; $(_$_ff58[5])[_$_ff58[4]](_$_ff58[0], function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_ff58[3]](_$_ff58[1], _$_ff58[2]) }, hideDelay); });

                var _$_ed8c = ["mouseover", "#clsShowMonthlyAttendanceContainer"]; $(_$_ed8c[1])[_$_ed8c[0]](function () { if (hideTimer) { clearTimeout(hideTimer) } });


                var _$_afb4 = ["display", "none", "css", "mouseout", "#clsShowMonthlyAttendanceContainer"]; $(_$_afb4[4])[_$_afb4[3]](function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_afb4[2]](_$_afb4[0], _$_afb4[1]) }, hideDelay); });
            });
            ///////////////////////////////////////////




        });//END OF READY FUNCTION
    </script>
</asp:Content>
