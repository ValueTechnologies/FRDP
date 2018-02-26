<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeAttendanceHistory.aspx.cs" Inherits="FRDP.EmployeeAttendanceHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="container" style="height: 400px; min-width: 310px"></div>
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                var data = [];
                var arr = [];
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=46ǁ",
                    success: function (response) {
                        
                        var jd = $.parseJSON(response), opt = '';
                        
                        $.each(jd, function (i, itm) {
                            arr = [];
                            var ddd = itm.Actualdate.substr(6);
                            arr.push(parseInt(ddd));
                            arr.push(parseFloat(itm.Hours));
                            data.push(arr);
                        });
                        console.log(data);
                        $('#container').highcharts('StockChart', {


                            chart: {
                                alignTicks: false
                            },

                            rangeSelector: {
                                selected: 1
                            },

                            title: {
                                text: 'Employee Attendance History'
                            },

                            series: [{
                                type: 'column',
                                name: 'Employee Name',
                                lineWidth: 0,
                                marker: {
                                    enabled: true,
                                    radius: 2
                                },
                                data: data,
                                tooltip: {
                                    valueDecimals: 2
                                }
                            }]
                        });
                    }
                });





                //$.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=?', function (data) {
                //$.getJSON('EmpReg.ashx/?ID=46ǁ', function (data) {
                    //console.log(data);

                    //var dta = [];
                    //var arr = [];
                    //arr.push(1220486400000);
                    //arr.push(21.03);
                    //dta.push(arr);
                    //arr = [];
                    //arr.push(1220572800000);
                    //arr.push(22.03);
                    //dta.push(arr);
                    //arr = [];
                    //arr.push(1220832000000);
                    //arr.push(23.03);
                    //dta.push(arr);
                    //arr = [];
                    //arr.push(1220918400000);
                    //arr.push(24.03);
                    //dta.push(arr);
                    //console.log(dta);
                    //$('#container').highcharts('StockChart', {


                    //    //rangeSelector: {
                    //    //    selected: 1
                    //    //},

                    //    title: {
                    //        text: 'Employee Attendance History'
                    //    },

                    //    series: [{
                    //        name: 'Employee Name',
                    //        data: dta,
                    //        tooltip: {
                    //            valueDecimals: 2
                    //        }
                    //    }]
                    //});
                //});






            });
        });
    </script>

</asp:Content>
