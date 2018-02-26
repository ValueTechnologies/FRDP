<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="StoreBalance.aspx.cs" Inherits="FRDP.StoreBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        select[name=tblStoreInv_length] {
            /* width: 150px; */
            width: 62px !important;


        }

    </style>
    <script type="text/javascript" src="plugins/misc/selectize/dist/js/standalone/selectize.js"></script>
    <link href="plugins/misc/selectize/dist/css/selectize.bootstrap3.css" rel="stylesheet" />

    

    <div class="row-fluid">
        <div class="span12">
            <%--START OF PAGE--%>
            <div class="row-fluid">
                <div class="span12">

                    <div class="box gradient">

                        <div class="title">

                            <h4>
                                <span class="icon16 icomoon-icon-equalizer-2"></span>
                                <span>Store Registration</span>
                            </h4>
                            <a href="#" class="minimize">Minimize</a>
                        </div>
                        <div class="content noPad">


                            <br />
                            <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                                <tbody>


                                                                                                            <tr>
                                        <td>Office Type</td>
                                        <td colspan="5" style="text-align: left;">
                                    <select id="ddlCompanyType"  style="width: 93.5%;">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>

                                     </tr><tr>
                                        <td><label class="form-label span3 clsHelper" for="normal">DSU</label></td>
                                        <td colspan="5" style="text-align: left;">
                                            <select id="ddlDSUList" class="clsHelper"  style="width: 93.5%;">
                                    </select></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px;">Office</td>
                                        <td colspan="5" style="text-align: left;">
                                            <select id="LocationsID" class="clsfrm" style="width: 93.5%;">
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Store</td>
                                        <td colspan="5">
                                            <select id="ddlStore" class="clsfrm" style="width: 93.5%;">
                                            </select></td>

                                    </tr>
                                    <tr>

                                        <td>Portion</td>
                                        <td colspan="5">
                                            <select id="ddlPortion" class="clsfrm" style="width: 93.5%;">
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Item</td>
                                        <td style="width: 62%;">
                                            <select id="ddlItem" class="clsfrm">
                                            </select></td>
                                        <td style="width: 50px;">Quantity</td>
                                        <td style="width: 75px;">
                                            <input id="txtQty" class="clsfrm" type="text" style="width: 65px;" /></td>
                                        <td><label id="lblUnit"></label>
                                            </td>
                                        <td>
                                            <button id="btnSave" class="btn btn-info marginB10" tg="0">Save</button>
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
                                <span>Registered Stores</span>
                            </h4>
                            <a href="#" class="minimize">Minimize</a>
                        </div>
                        <div class="content noPad">
                            <br />
                            <table id="tblStoreInv" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                                <thead>
                                    <tr>
                                        <th style="width: 25px;">#</th>
                                        <th>Store Portion</th>
                                        <th>Item</th>
                                        <th style="width:100px;">Quantity</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            <br /><br /><br />
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        //$.ajaxSetup({
        //    beforeSend: function () {
        //        // show image here
        //        $("#busy").show();
        //    },
        //    complete: function () {
        //        // hide image here
        //        $("#busy").hide();
        //    }
        //});

        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {




            $('#ddlDSUList').live('change', function () {
                LoadLocations();
            });
            $('#ddlCompanyType').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "3") {
                    $('.clsHelper').show();
                }
                else {
                    $('.clsHelper').hide();
                }

                LoadLocations();
            });
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=47ǁ",
                    success: function (response) {
                        //alert(response);
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlDSUList').html(opt);
                        $('.clsHelper').hide();
                        LoadLocations();
                    }
                });
            });
            function LoadLocations() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType').val() + "ǁ" + $('#ddlDSUList').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#LocationsID').html(opt);
                        if (opt != "") {
                            ddlStore_Bind();
                        }
                        else {
                            $('#ddlStore').html('');
                            $('#ddlPortion').html('');
                            LoadTbl();
                        }
                    }
                });
            }


            //---------------------------------
            //$(function () {
            //    $.ajax({
            //        type: "POST",
            //        url: "inv.ashx/?ID=17ǁ",
            //        success: function (response) {
            //            var jd = $.parseJSON(response), opt = '';
            //            $.each(jd, function (i, itm) {
            //                opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
            //            });
            //            $('#LocationsID').html(opt);
            //            if (opt != "") {
            //                ddlStore_Bind();
            //            }
            //            else {
            //                $('#ddlStore').html('');
            //                $('#ddlPortion').html('');
            //                LoadTbl();
            //            }
            //        }
            //    });
            //});
            $('#LocationsID').live('change', ddlStore_Bind);
            function ddlStore_Bind() {

                $('#ddlPortion').html('');
                if ($('#ddlPortion').hasClass('selectized')) {
                    $('#ddlPortion')[0].selectize.destroy();
                }
                

                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=28ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.ID + '">' + itm.Name + '</option>';
                        });
                        $('#ddlStore').html(opt);
                        if (opt != "") {

                            ddlPortion_Bind();
                            LoadTbl();
                        }
                        else {

                            if ($('#ddlPortion').hasClass('selectized')) {
                                $('#ddlPortion')[0].selectize.destroy();
                            }
                            $('#ddlPortion').html('');
                            LoadTbl();
                        }
                    }
                });
            }
            $('#ddlStore').live('change', ddlPortion_Bind);
            function ddlPortion_Bind() {

                LoadTbl();
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=29ǁ" + $('#ddlStore').val(),
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.tblinvStoreID + '">' + itm.fullCodeName + '</option>';
                        });
                        $('#ddlPortion').html(opt);
                        if ($('#ddlPortion').hasClass('selectized')) {
                            $('#ddlPortion')[0].selectize.destroy();
                        }
                        $("#ddlPortion").selectize();
                       
                    }
                });
            }
            var thisitms;
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=30ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        thisitms = jd;
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.tblInvItemsID + '">' + itm.fullCodeName + '</option>';
                        });
                        $('#ddlItem').html(opt);
                        if ($('#ddlItem').hasClass('selectized')) {
                            $('#ddlItem')[0].selectize.destroy();
                        }
                        $("#ddlItem").selectize();
                        FindUnit($("#ddlItem").val());
                    }
                });
            });
            $('#ddlItem').live('change', function () {
                FindUnit($(this).val());
            });
            function FindUnit(obj) {
                
                $.each(thisitms, function (i, itm) {
                    if (itm.tblInvItemsID == obj) {
                        $('#lblUnit').html(itm.Unit);
                        return false;
                    }
                });
            }

            $('#btnSave').live('click', function () {


                var PortionID = '0', PortionName = '';

                if ($('#ddlPortion').val() == "" || $('#ddlPortion').val()== null) {
                    PortionID = '0'
                    PortionName = "";
                }
                else {
                    PortionID = $('#ddlPortion').val();
                    PortionName = encodeURIComponent($('#ddlPortion option:selected').text());
                }
                var con = true, col = $('#LocationsID').val() + "ǁ" + $('#ddlStore').val() + "ǁ" + PortionID + "ǁ" + $('#ddlItem').val() + "ǁ" + $('#txtQty').val();

                //alert($('#LocationsID').val() + "= location|" + $('#ddlStore').val() + "= strore |" + $('#ddlPortion').val() + "= Portion ID |" + $('#ddlItem').val() + "=item id|" + $('#txtQty').val() + "=qty value|");
                if ($('#LocationsID').val() == "" || $('#LocationsID').val() == null || $('#ddlStore').val() == "" || $('#ddlStore').val() == null || $('#ddlItem').val() == "" || $('#ddlItem').val() == null || $('#txtQty').val() == "") {
                    con = false;
                }
                
                if (con) {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=31ǁ" + col + "ǁ" + encodeURIComponent($('#ddlStore option:selected').text()) + "ǁ" + PortionName + "ǁ" + encodeURIComponent($('#ddlItem option:selected').text()),
                        success: function (response) {
                            if (response == "-1") {
                                LoadTbl();
                                alertG('Record Saved');
                                $('#txtQty').val('');
                            }
                        }
                    });
                }
                else {
                    alertR('Please Enter Valid Values');
                }


            });

            function LoadTbl() {
                if ($('#ddlStore').val() == "" || $('#ddlStore').val() == null) {
                    if ($('#tblStoreInv').hasClass('dataTable')) {
                        $('#tblStoreInv').dataTable().fnDestroy();
                    }
                    $('#tblStoreInv tbody').html('');
                    tblStoreInvDynamiC();
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=32ǁ" + $('#ddlStore').val(),
                        success: function (response) {

                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<tr>\
              <td>' +  (parseInt(i) + 1).toString() + '</td>\
                <td style="text-align: left;">' + itm.txtStoreNameasPortionName + '</td>\
                <td style="text-align: left;">' + itm.txtItemName + '</td>\
                <td>' + itm.fQty + '</td>\
            </tr>'
                            });
                            if ($('#tblStoreInv').hasClass('dataTable')) {
                                $('#tblStoreInv').dataTable().fnDestroy();
                            }
                            $('#tblStoreInv tbody').html(opt);


                            tblStoreInvDynamiC();
                        }
                    });
                }
            }
            tblStoreInvDynamiC();
            function tblStoreInvDynamiC() {
                $('#tblStoreInv').addClass('dynamicTable');

                $('#tblStoreInv').dataTable({
                    "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
                    "iDisplayLength": 10,
                    "sPaginationType": "full_numbers",
                    "bJQueryUI": false,
                    "bAutoWidth": false,
                    "bLengthChange": true,
                    "fnInitComplete": function (oSettings, json) {
                        $('.dataTables_filter>label>input').attr('id', 'search');
                    }
                });
            };
        });///END OF DOC READY



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
