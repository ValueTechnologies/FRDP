<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="FRDP.Calendar" %>

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
                        <span>Yearly Scheduled Events</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad"  style="padding-left: 10px; padding-right: 10px;">
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
                    <%--=====================--%><br />
                </div>

            </div>

        </div>
    </div>







    <script type="text/javascript">

        $(document).ready(function () {
            $('#ddlyear').live('change', function () {
                LoadPP();

            });
            LoadPP();
            function LoadPP() {
                $('#titlepp').html('Event Planner ' + $('#ddlyear').val());
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

        });//END OF READY
    </script>
</asp:Content>
