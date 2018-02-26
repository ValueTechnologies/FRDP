<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="UCAnalysis.aspx.cs" Inherits="FRDP.UCAnalysis" %>
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
            font-size: 10px;
        }

        #ui-datepicker-div {
            z-index: 1000 !important;
        }
    </style>
       <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title min">

                    <h4>

                        <span class="box-form right" action="">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <span class="icon16 icomoon-icon-cog-2"></span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" style="margin-left: -114px;">
                                <li><a href="#" class="grphType" grph="5" tag="column"><span class="brocco-icon-pause"></span>Column Chart</a></li>
                                <li><a href="#" class="grphType" grph="5" tag="line"><span class="icomoon-icon-share"></span>Line Chart</a></li>
                                <li><a href="#" class="grphType" grph="5" tag="bar"><span class="icomoon-icon-paragraph-left"></span>Bar Chart</a></li>
                                <li><a href="#" class="grphType" grph="5" tag="pie" style="pointer-events: none; cursor: default;"><span class="wpzoom-support"></span>Pie Chart</a></li>
                                <li><a href="#" class="grphType" grph="5" tag="area"><span class="wpzoom-support"></span>Area Chart</a></li>
                                <li><a href="#" class="grphType" grph="5" tag="spline"><span class="icomoon-icon-share"></span>Spline Chart</a></li>
                                <li><a href="#" class="grphType" grph="5" tag="areaspline"><span class="icomoon-icon-share"></span>Area Spline</a></li>
                            </ul>
                        </span>
                        <span class="icon16 icomoon-icon-bars"></span>
                        <span>UC Analysis</span>
                    </h4>
                    <a href="#" class="minimize" style="display: block;">Minimize</a>
                </div>
                <div class="content noPad">
                    <table style="width: 98%;">
                        <tr class="chartRow">
                            <td style="width: 10%;">
                                <div id="sp_US_Analysis_DB1" dt="<%= Convert.ToString(DateTime.Now.Day) +"/"+Convert.ToString(DateTime.Now.Month)+"/"+ Convert.ToString(DateTime.Now.Year) %>"></div>
                            </td>

                        </tr>
                        <tr class="chartRow">
                            <td style="width: 10%;">
                                <div id="sp_US_Analysis_DB2" dt="<%= Convert.ToString(DateTime.Now.Day) +"/"+Convert.ToString(DateTime.Now.Month)+"/"+ Convert.ToString(DateTime.Now.Year) %>"></div>
                            </td>

                        </tr>
                        <tr class="chartRow">
                            <td style="width: 10%;">
                                <div id="sp_US_Analysis_DB3" dt="<%= Convert.ToString(DateTime.Now.Day) +"/"+Convert.ToString(DateTime.Now.Month)+"/"+ Convert.ToString(DateTime.Now.Year) %>"></div>
                            </td>

                        </tr>
                        <tr class="chartRow">
                            <td style="width: 10%;">
                                <div id="sp_US_Analysis_DB4" dt="<%= Convert.ToString(DateTime.Now.Day) +"/"+Convert.ToString(DateTime.Now.Month)+"/"+ Convert.ToString(DateTime.Now.Year) %>"></div>
                            </td>

                        </tr>
                    </table>
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            var grphType1 = 'column';
            var grphType2 = 'column';
            var grphType3 = 'column';
            var grphType4 = 'column';
            var grphType5 = 'column';
            sp_US_Analysis_DB();
            function sp_US_Analysis_DB() {


                var arr = [1, 2, 3, 4]
                $.each(arr, function (i, v) {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        url: "DB_Employee.aspx/sp_US_Analysis_DB",
                        data: "{'Q':'" + v + "','yr':'2014'}",
                        success: function (response) {

                            var dd = $.parseJSON(response.d);

                            var lmn = [];
                            $.each(dd.Series, function (i, itm) {
                                tmp = [];

                                $.each(itm.Mydata, function (a3, b3) {
                                    tmp.push(parseFloat(b3));
                                });
                                var s = { type: grphType5, name: itm.Myname, data: tmp };
                                lmn.push(s);
                            });




                            $('#sp_US_Analysis_DB' + v).highcharts({

                                title: {
                                    text: 'UC Analysis Graph'
                                },
                                subtitle: {
                                    text: $('#sp_US_Analysis_DB' + v).attr('dt')
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


                                                                                   //LoadEmp(this.category, this.y, this.series.name);
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

                });
            }

            $('.grphType').live('click', function (e) {
                e.preventDefault();
                var gtype = $(this).attr('tag');
                var forGraph = $(this).attr('grph');
                if (forGraph == "1") {
                    grphType1 = gtype;
                    Q1();
                }
                //if (forGraph == "2") {
                //    grphType2 = gtype;
                //    Q2();
                //    e.preventDefault();
                //}
                //if (forGraph == "3") {
                //    grphType3 = gtype;
                //    Q3();
                //}
                if (forGraph == "4") {
                    grphType4 = gtype;
                    Q4();
                }
                if (forGraph == "5") {
                    grphType5 = gtype;

                    sp_US_Analysis_DB();
                }
                if (forGraph == "12") {
                    grphType12 = gtype;
                    Q12();
                }
            });
            $('.leftbar').live('click', function (e) {
                e.preventDefault();
                $('#sp_US_Analysis_DB1,#sp_US_Analysis_DB2,#sp_US_Analysis_DB3,#sp_US_Analysis_DB4').html('');
                sp_US_Analysis_DB();
            });
        });
    </script>
</asp:Content>
