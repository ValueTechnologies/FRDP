﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="GeneratorRegistration.aspx.cs" Inherits="FRDP.GeneratorRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <style type="text/css">

             .table thead th:first-child, .table tbody td:first-child {
  text-align: center;
}
      .card {
       
        height:250px;
        margin: 20px;
      }
      .front, .back {
        
        padding: 10px;
        width:100%
      }
      .front {
        background-color: transparent;
      }
      .back {
        background-color: transparent;
      }
    </style>
           <div id="genRegistration" class="row-fluid" style="display:none;">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Generator Information</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
        <tr>
            <td style="width: 100px;">
                                    <label>Office Type : &nbsp;</label></td>
                                <td style="text-align: left;">
                                    <select id="ddlCompanyType" class="pr" style=" width: 93.5%;">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>
            <td style="width: 100px;">
                                    <label class="form-label span3 clsHelper" for="normal" style="display: none;">Select DSU</label></td>
                                <td style="text-align: left;">
                                    <select id="ddlDSUList" class="pr clsHelper" style="display: none;width: 93.5%;"></select></td>
        </tr>
    <tr>
        <td style="width:100px;">Office</td>
        <td style="text-align:left; width: 40%;">
             <select id="LocationsID" class="gen" style="  width: 93.5%;">
                <option value="1">Chakri North</option>
</select></td>
        <td style="width:100px;">Generator Modal</td>
        <td style="text-align:left;">
            <input class="gen" type="text" style="width:90%;" /></td>
    </tr>
        <tr>
            <td>Brand Name</td>
            <td><input id="BrandName"  class="gen"  type="text" style="width:90%;" /></td>
            <td><label id="CNICORCompanyNTN">Capacity</label></td>
            <td><input id="txtCapacity" class="gen" type="text" style="width:90%;" /></td>
        </tr>


                <tr>
            <td>Fuel Tank Size</td>
            <td><input id="txtFuelTankSize"  class="gen"  type="text" style="width:90%;" /></td>
            <td>Fuel Filter Modal</td>
            <td><input id="txtFuelFilterModal" class="gen" type="text" style="width:90%;" /></td>
        </tr>


        <tr>
            <td>Oil Filter Modal</td>
            <td><input id="txtOilFilterModal"  class="gen"  type="text" style="width:90%;" /></td>
            <td>Water Filter Modal</td>
            <td><input id="txtWaterFilterModal" class="gen" type="text" style="width:90%;" /></td>
        </tr>

                <tr>
            <td>Air Filter Modal</td>
            <td><input id="txtAirFilterModal"  class="gen"  type="text" style="width:90%;" /></td>
            <td>Oil Quantity</td>
            <td><input id="txtOilQuantity" class="gen Integer" type="text" style="width:90%;" /></td>
        </tr>

                <tr>
            <td>Coolent Quantity</td>
            <td><input id="txtcoolentQuantity"  class="gen Integer"  type="text" style="width:90%;" /></td>
            <td>Service Duration (Hours)</td>
            <td><input id="txtServiceDurationHours" class="gen Integer" type="text" style="width:90%;" /></td>
        </tr>

                        <tr>
            <td>Min Fuel Level (Liter)</td>
            <td><input id="txtMinFuelLevelLiter"  class="gen Integer"  type="text" style="width:90%;" /></td>
            <td>Current Generator HRS</td>
            <td><input id="txtCurrentMeterReading" class="gen Integer" type="text" style="width:90%;" /></td>
        </tr>



        <tr>
            <td>Generator Life Hours</td>
            <td><input id="txtGeneratorLifeHours"  class="gen Integer"  type="text" style="width:90%;" /></td>
            <td>Battery Modal</td>
            <td><input id="txtGeneratorBatteryModal"  class="gen"  type="text" style="width:90%;" /></td>
        </tr>
         <tr>
            <td>Battery Acid Qty</td>
            <td><input id="txtGeneratorBatteryAcidQty"  class="gen Integer"  type="text" style="width:90%;" /></td>
            <td>Battery Acid Gravity</td>
            <td><input id="txtGeneratorBatteryAcidGravity"  class="gen"  type="text" style="width:90%;" /></td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><button id="btnSave" type="button" class="btn btn-info">Save</button></td>
        </tr>
    </tbody>
</table>
                                    <br />
</div>

                            </div>

                        </div>
    </div>
    <%--==========================================--%>
    <div id="geninfo" tg="0" class="row-fluid" style="display:none;">

                    <div class="span12">

                        <div class="box gradient invoice">

                            <div class="title clearfix">

                                <h3 class="left" style="margin-top: 12px;  margin-left: 10px;">
                                    <span id="location">Chakri North</span>
                                </h3>
                                <div class="print">
                                    <a href="#" class="tip" title="Print Generator Information"><span class="icon24 icomoon-icon-printer-2"></span></a>
                                </div>
                                 <div class="invoice-info" style="width:175px;">
                                    <span class="number">Generator HRS <strong class="red" id="CurrentMeterReading">582544</strong></span>
                                    <span class="data red" id="nextservicedate">August 25, 2015</span>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="content">
                                <div class="you">
                                    <ul class="unstyled">
                                        <li><h3 id="Modal">Generator Modal No</h3></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Generator Brand: <strong class="red"><span id="Brand">Generator Brand</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Capacity: <strong class="red"><span id="Capacity">Generator Capacity</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Fuel Tank Size: <strong class="red"><span id="FuelTankSize">Fuel Tank Size</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Fuel Filter Modal: <strong class="red"><span id="FuelFilterModal">Fuel Filter Modal</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Oil Filter Modal: <strong class="red"><span id="OilFilterModal">Oil Filter Modal</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Bettery Modal: <strong class="red"><span id="BatteryModal">Bettery Modal</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Battery Acid Quantity: <strong class="red"><span id="BatteryAcidQty">Bettery Acid Qty</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Water Filter Modal: <strong class="red"><span id="WaterFilterModal">Water filter Modal</span></strong></li>
                                    </ul>
                                </div>
                                <div class="client">
                                    <ul class="unstyled">
                                        <li><h3></h3>&nbsp;</li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Air Filter Modal: <strong class="red"><span id="AirFilterModal">Air Filter Modal</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Oil Quantity: <strong class="red"><span id="OilQuantity">Oil Quantity</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Coolent Quantity: <strong class="red"><span id="coolentQuantity">coolent Quantity</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Service Duration Hours: <strong class="red"><span id="ServiceDurationHours">Service Duration Hours</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Min FuelLevel Liter: <strong class="red"><span id="MinFuelLevelLiter">Min Fuel Level Liter</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Battery Acid Gravity: <strong class="red"><span id="BatteryAcidGravity">Battery Acid Gravity</span></strong></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Generator Life Hours: <strong class="red"><span id="GeneratorLifeHours">Generator Life Hours</span></strong></li>

                                    </ul>
                                </div>
                                <div class="clearfix"></div>
<div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h4>Daily ON/OFF Entry</h4>
                    </div>


                                <table id="tblOnOff" class="responsive table table-bordered">
                                    <thead>
                                      <tr>
                                        <th style="width: 100px;">Date</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Duration(HH:MM:SS)</th>
                                        <th>Starting HRS</th>
                                        <th>Ending HRS</th>
                                        <th>Starting (KWH)</th>
                                        <th>Ending (KWH)</th>
                                        <th>Gage Value</th>
                                        <th>Reason</th>
                                          <th>&nbsp;</th>
                                      </tr>
                                    </thead>

                                    <tbody></tbody>
                                   <tfoot>
                                      <tr>
                                        <th style="width: 100px;"><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th>&nbsp;</th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th><input class="onoff" type="text" style="width:90%;" /></th>
                                        <th style="width:26px;"><button class="btn btn-info" id="btnonoff" type="button" style="margin-top: 6px;">+</button></th>
                                      </tr>
                                    </tfoot>
                                </table>
                                <button id="btndvOnOff" type="button" class="btn btn-info" style="float:right;display:none;">+</button>

                                                                <div class="clearfix"></div>
<div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h4>Daily Refueling Entry</h4>
                    </div>
                                <table id="tblRefueling" class="responsive table table-bordered">
                                    <thead>
                                      <tr>
                                        <th style="width: 100px;">Date</th>
                                        <th style="width: 100px;">Time</th>
                                        <th>Generator HRS</th>
                                        <th>Meter (KWH)</th>
                                        <th>In Tank Fuel(Litters)</th>
                                        <th>Input Fuel(Litters)</th>
                                        <th>Gage Before</th>
                                        <th>Gage Aafter</th>
                                        <th>Fuel Slip No</th>
                                        <th>Fuel Price</th>
                                        <th>&nbsp;</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                      <tfoot>
                                        <tr>
                                           
                                            <th><input class="dre" type="text" style="width:90%;" /></th>
                                             <th>
                                                <input class="dre" type="text" style="width:90%;" /></th>
                                            <th>
                                                <input class="dre Integer" type="text" style="width:90%;" /></th>
                                            <th>
                                                <input class="dre Integer" type="text" style="width:90%;" /></th>
                                            <th><input class="dre Integer" type="text" style="width:90%;" /></th>
                                           
                                            <th><input class="dre Integer" type="text" style="width:90%;" /></th>
                                            <th>
                                            <input class="dre"  type="text" style="width:90%;" /></th>
                                            <th><input class="dre" type="text" style="width:90%;" /></th>
                                            <th>
                                                <input class="dre" type="text" style="width:90%;" /></th>
                                            <th>
                                                <input class="dre" type="text" style="width:90%;" /></th>
                                            <th style="width:26px;"><button class="btn btn-info" id="btnDailyEntry" type="button" style="margin-top: 6px;">+</button></th>
                                        </tr>
                                    </tfoot>
                                </table>

                                <div class="clearfix"></div>
<div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h4>Service Entry</h4>
                    </div>
<%--                                <table id="tblclsSE" class="responsive table table-bordered">
                                    <thead>
                                      <tr>
                                        <th style="width:100px;">Date</th>
                                        <th>Generator HRS</th>
                                        <th>Meter (KWH)</th>
                                        <th>Description (if any)</th>
                                        <th style="width: 26px;">&nbsp;</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td style="width: 35px;"><input class="clsSE" type="text" style="width:90%;" /></td>
                                            <td><input class="clsSE Integer" type="text" style="width:95%;" /></td>
                                            <td><input class="clsSE Integer" type="text" style="width:95%;" /></td>
                                            <td><input class="clsSE" type="text" style="width:95%;" /></td>
                                            <td><button class="btn btn-info" id="btnSE" type="button" style="margin-top: 6px;">+</button></td>
                                        </tr>
                                    </tfoot>
                                </table>--%>
                                                                <table id="tblclsSE" class="responsive table table-bordered">
                                    <thead>
                                      <tr>
                                        <th style="width:100px;">Date</th>
                                        <th>Generator HRS</th>
                                        <th>Meter (KWH)</th>
                                          <th>Next Service HRS</th>
                                          <th>Oil Filter</th>
                                          <th>Fuel Filter</th>
                                          <th>Fuel/Water Septr Filter</th>
                                          <th>Air Filter</th>
                                          <th>Bettery</th>
                                          <th>Radiator</th>
                                          <th>Oil Ltrs</th>
                                        <th>Description (if any)</th>
                                        <th style="width: 26px;">&nbsp;</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td style="width: 35px;"><input class="clsSE" type="text" style="width:90%;" /></td>
                                            <td><input class="clsSE Integer" type="text" style="width:90%;" /></td>
                                            <td><input class="clsSE Integer" type="text" style="width:90%;" /></td>
                                            <td><input class="clsSE" type="text" style="width:90%;" /></td>
                                            <td>
                                                <select class="clsSE" style="margin-top: 7px;">
                                                    <option>Cleaned</option>
                                                    <option>Changed</option>
                                                    <option>NILL</option>
                                                </select></td>
                                                                                        <td>
                                                <select class="clsSE" style="margin-top: 7px;">
                                                    <option>Cleaned</option>
                                                    <option>Changed</option>
                                                    <option>NILL</option>
                                                </select></td>
                                                                                        <td>
                                                <select class="clsSE" style="margin-top: 7px;">
                                                    <option>Cleaned</option>
                                                    <option>Changed</option>
                                                    <option>NILL</option>
                                                </select></td>
                                                                                        <td>
                                                <select class="clsSE" style="margin-top: 7px;">
                                                    <option>Cleaned</option>
                                                    <option>Changed</option>
                                                    <option>NILL</option>
                                                </select></td>
                                                                                        <td>
                                                <select class="clsSE" style="margin-top: 7px;">
                                                    <option>Cleaned</option>
                                                    <option>Changed</option>
                                                    <option>NILL</option>
                                                </select></td>
                                                                                        <td>
                                                <select class="clsSE" style="margin-top: 7px;">
                                                    <option>Cleaned</option>
                                                    <option>Changed</option>
                                                    <option>NILL</option>
                                                </select></td>
                                                                                        <td>
                                                <input class="clsSE" type="text" style="width:90%;" />
                                                </td>
                                            <td><input class="clsSE" type="text" style="width:90%;" /></td>
                                            <td><button class="btn btn-info" id="btnSE" type="button" style="margin-top: 6px;">+</button></td>
                                        </tr>
                                    </tfoot>
                                </table>
                                     <div class="clearfix"></div>
<div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h4>Generator Maintenance Entry</h4>
                    </div>
                                 <table id="tblclsME" class="responsive table table-bordered">
                                    <thead>
                                      <tr>
                                        <th style="width: 100px;">Date</th>
                                        <th>Generator HRS</th>
                                        <th>Hours Value</th>
                                          <th>Parts</th>
                                        <th>Description (if any)</th>
                                        <th style="width: 26px;">&nbsp;</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td><input class="clsME" type="text" style="width:90%;" /></td>
                                            <td><input class="clsME Integer" type="text" style="width:95%;" /></td>
                                            <td><input class="clsME Integer" type="text" style="width:95%;" /></td>
                                            <td><input class="clsME" type="text" style="width:95%;" /></td>
                                            <td><input class="clsME" type="text" style="width:95%;" /></td>
                                            <td><button class="btn btn-info" id="btnME" type="button" style="margin-top: 6px;">+</button></td>
                                        </tr>
                                    </tfoot>
                                </table>
                             <%--   <div class="payment">
                                    <ul class="unstyled">
                                        <li><h3>Payment method: <span class="red">Pay Pal</span></h3></li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Bank account #</li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>SWIFT code</li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>IBAN</li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Billing address</li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Name</li>
                                        <li><span class="icon16 icomoon-icon-arrow-right-2"></span>Email: <strong class="red">some@info.com</strong></li>
                                    </ul>
                                </div>--%>

                               <%-- <div class="total">
                                    <h4>Total amount:<span class="red"> $1250.00</span></h4>
                                </div>--%>


                                <div class="clearfix"></div>

                                <div class="invoice-footer">
                                   <%-- <p>Thank you for your order, you will receive <strong class="green">5%</strong> discount in next order.</p>--%>
                                    &nbsp;
                                </div>
                               
                            </div>

                        </div><!-- End .box -->

                    </div>

                </div>


    <div id="dvOnOff" style="display:none;" title="ON/OFF Entry">
           <table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody style="width:400px">
        <tr>
        <td style="width:100px;">Date</td>
        <td style="text-align:left; width: 150px;">
            <input id="txtDate" type="text" class="clsonoff" style="width:125px;" /></td>
        <td style="width:100px;">Gage Value</td>
        <td style="text-align:left;"><input id="txtDipValue" class="clsonoff Integer" type="text" style="width:125px;" /></td>
        </tr>
        <tr>
            <td>Start Time</td>
            <td><input id="txtStartTime"  class="clsonoff" type="text" style="width:125px;" /></td>
            <td>End Time</td>
            <td><input id="txtEndTime"  class="clsonoff" type="text" style="width:125px;" /></td>
        </tr>
        <tr>
           <td>Generator HRS</td>
            <td><input id="txtMeterReading"  class="clsonoff" type="text" style="width:125px;" /></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="vertical-align:top;">Reason</td>
            <td colspan="3">
                <textarea  class="clsonoff" id="txtReason" cols="20" rows="2" style="width:380px;"></textarea></td>
        </tr>
        <tr><td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="text-align:right"><button id="btnonoffsave" type="button" class="btn btn-info">Save</button>&nbsp;<button id="btnonoffcancel" type="button" class="btn">Cancel</button></td>
            
        </tr>

    </tbody>

          </table>
    </div>


           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Registered Generators</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<table id="tblGens" class="responsive table table-striped table-bordered table-condensed" style="  width: 96%;  margin-left: 20px;  margin-right: 20px;  border-right: 1px solid #c4c4c4;">
                                <thead>
                                  <tr>
                                    <th>Generator Modal</th>
                                    <th>Brand Name</th>
                                    <th>Capacity(KVA)</th>
                                    <th>Current Generator HRS</th>
                                  </tr>
                                </thead>
                                <tbody></tbody>
                            </table><br />
</div>

                            </div>

                        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {



                function groupTable($rows, startIndex, total) {
                    if (total === 0) {
                        return;
                    }
                    var i, currentIndex = startIndex, count = 1, lst = [];
                    var tds = $rows.find('td:eq(' + currentIndex + ')');
                    var ctrl = $(tds[0]);
                    lst.push($rows[0]);
                    for (i = 1; i <= tds.length; i++) {
                        if (ctrl.text() == $(tds[i]).text()) {
                            count++;
                            $(tds[i]).addClass('deleted');
                            lst.push($rows[i]);
                        }
                        else {
                            if (count > 1) {
                                ctrl.attr('rowspan', count);
                                groupTable($(lst), startIndex + 1, total - 1)
                            }
                            count = 1;
                            lst = [];
                            ctrl = $(tds[i]);
                            lst.push($rows[i]);
                        }
                    }
                }
                



            function LoadNow() {
                tblOnOffLoad();
                tblRefuelingLoad();
                tblclsSELoad();
                tblclsMELoad();
            }
            //////////////////////////////////Service Entry
            $($('.clsME')[0]).datepicker({ dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true });
            $('#btnME').live('click', function () {
                var v = '';
                $('.clsME').each(function (index, element) {
                    v += encodeURIComponent($(this).val()) + 'ǁ';
                });

                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=8ǁ" + v + $('#geninfo').attr('tg'),
                    success: function (response) {
                        //$('#dvOnOff').dialog('close');
                        alertG('Record Saved');
                        tblclsMELoad();
                    }
                });
            });










            function tblclsMELoad() {
                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=9ǁ" + $('#geninfo').attr('tg'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        //alert(response);
                        $.each(jd, function (i, itm) {
                            //dtDateTime, MeterReading, , IntankOil, InputOil, DipBefore, DipAfter, tblGeneratorID
                            opt += '<tr>\
                                        <td style="vertical-align:top;">' + itm.dtDateTime + '</td>\
                                        <td>' + itm.MeterReading + '</td>\
                                        <td>' + itm.HoursValue + '</td>\
                                        <td>' + itm.Parts + '</td>\
                                        <td>' + itm.Description + '</td>\
                                        <td>&nbsp;</td>\
                                      </tr>';
                        });
                        $('#tblclsME tbody').html(opt);
                        groupTable($('#tblclsME tr:has(td)'), 0, 1);
                        $('#tblclsME .deleted').remove();
                    }
                });
            }
            //////////////////////////////////Mantinance Entry
            //////////////////////////////////Service Entry
            $($('.clsSE')[0]).datepicker({ dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true });
            $('#btnSE').live('click', function () {
                var v = '';
                $('.clsSE').each(function (index, element) {
                    v += encodeURIComponent($(this).val()) + 'ǁ';
                });

                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=6ǁ" + v + $('#geninfo').attr('tg'),
                    success: function (response) {
                        //$('#dvOnOff').dialog('close');
                        alertG('Record Saved');
                        tblclsSELoad();
                    }
                });
            });
            function tblclsSELoad() {
                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=7ǁ" + $('#geninfo').attr('tg'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        //alert(response);
                        $.each(jd, function (i, itm) {
                            //dtDateTime, MeterReading, , IntankOil, InputOil, DipBefore, DipAfter, tblGeneratorID
                            opt += '<tr>\
                                        <td style="vertical-align:top;">' + itm.dtDateTime + '</td>\
                                        <td>' + itm.MeterReading + '</td>\
\
<td>' + itm.HoursValue + '</td>\
<td>' + itm.NextServiceHRS + '</td>\
<td>' + itm.OilFilter + '</td>\
<td>' + itm.FuelFilter + '</td>\
<td>' + itm.Fuel_Water_Septr_Filter + '</td>\
<td>' + itm.Air_Filter + '</td>\
<td>' + itm.Bettery + '</td>\
<td>' + itm.Radiator + '</td>\
<td>' + itm.OilLtrs + '</td>\
                                        <td>' + itm.Description + '</td>\
                                        <td>&nbsp;</td>\
                                      </tr>';
                        });
                        $('#tblclsSE tbody').html(opt);
                        groupTable($('#tblclsSE tr:has(td)'), 0, 1);
                        $('#tblclsSE .deleted').remove();
                    }
                });
            }
            //////////////////////////////////Service Entry
            //////////////////////////////////Daily Refueling Entry
            $($('.dre')[0]).datepicker({ dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true });
            $($('.dre')[1]).timeEntry({
                show24Hours: true,
                spinnerImage: ''
            });
            $($('.dre')[1]).timeEntry('setTime', '00:00');
            $('#btnDailyEntry').live('click', function () {
                var v = '';
                $('.dre').each(function (index, element) {
                    v += encodeURIComponent($(this).val()) + 'ǁ';
                });

                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=4ǁ" + v + $('#geninfo').attr('tg'),
                    success: function (response) {
                        //$('#dvOnOff').dialog('close');
                        alertG('Record Saved');
                        tblRefuelingLoad();
                    }
                });
            });
            function tblRefuelingLoad() {
                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=5ǁ" + $('#geninfo').attr('tg'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        //alert(response);
                        $.each(jd, function (i, itm) {
                            //dtDateTime, MeterReading, , IntankOil, InputOil, DipBefore, DipAfter, tblGeneratorID
                            opt += '<tr>\
                                        <td style="vertical-align:top;">' + itm.dtDateTime + '</td>\
                                        <td> ' + itm.FuelingTime + ' </td>\
                                        <td>' + itm.MeterReading + '</td>\
                                        <td>' + itm.HoursValue + '</td>\
                                        <td>' + itm.IntankOil + '</td>\
                                        <td>' + itm.InputOil + '</td>\
                                        <td>' + itm.DipBefore + '</td>\
                                        <td>' + itm.DipAfter + '</td>\
                                        <td>' + itm.FuelSlipNo + '</td>\
                                        <td>' + itm.FuelPrice + '</td>\
                                        <td>&nbsp;</td>\
                                      </tr>';
                        });
                        $('#tblRefueling tbody').html(opt);
                        groupTable($('#tblRefueling tr:has(td)'), 0, 1);
                        $('#tblRefueling .deleted').remove();
                    }
                });
            }

            ///////////////////////////////////Daily Refueling Entry end
            ///////////////////////////////////ON OF ALL CALCULATIONS   
            $('#txtDate').datepicker({ dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true });
            $($('.onoff')[0]).datepicker({ dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true });
            $('#txtStartTime,#txtEndTime').timeEntry({
                show24Hours: true,
                spinnerImage: ''
            });
            $($('.onoff')[1]).timeEntry({
                show24Hours: true,
                spinnerImage: ''
            });
            $($('.onoff')[2]).timeEntry({
                show24Hours: true,
                spinnerImage: ''
            });
            $('#txtEndTime,#txtStartTime').timeEntry('setTime', '00:00');
            $($('.onoff')[1]).timeEntry('setTime', '00:00');
            $($('.onoff')[2]).timeEntry('setTime', '00:00');
            $(function () {
                $('#dvOnOff').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 280,
                    width: 530,

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
            $('#btndvOnOff').live('click', function () { $('#dvOnOff').dialog('open'); });
            $('#btnonoffcancel').live('click', function () { $('#dvOnOff').dialog('close'); });
            
            $('#btnonoff').live('click', function () {
                var v = '';
                $('.onoff').each(function (index, element) {
                    v += encodeURIComponent($(this).val()) + 'ǁ';
                });

                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=10ǁ" + v + $('#geninfo').attr('tg'),
                    success: function (response) {
                        $('#dvOnOff').dialog('close');
                        alertG('Record Saved');
                        tblOnOffLoad();
                    }
                });

            });
            $('#btnonoffsave').live('click', function () {
                var v = '';
                $('.clsonoff').each(function (index, element) {
                    v +=encodeURIComponent($(this).val()) + 'ǁ';
                });

                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=2ǁ" + v + $('#geninfo').attr('tg'),
                    success: function (response) {
                        $('#dvOnOff').dialog('close');
                        alertG('Record Saved');
                        tblOnOffLoad();
                    }
                });
                
            });
            
            function tblOnOffLoad() {
                //alert($('#geninfo').attr('tg'));
                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=3ǁ" + $('#geninfo').attr('tg'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        //alert(response);
                        $.each(jd, function (i, itm) {
                            //var text = .replace('/', '-');
                            opt += '<tr>\
                                        <td style="vertical-align:top;">' + itm.dtDate + '</td>\
                                        <td>' + itm.OnTime + '</td>\
                                        <td>' + itm.OffTime + '</td>\
                                        <td>' + itm.Duration + '</td>\
                                        <td>' + itm.MeterReading + '</td>\
<td> ' + itm.MeterReadingEnd + ' </td>\
                                        <td>' + itm.MeterKWH + '</td>\
<td>' + itm.MeterKWHEnd + '</td>\
                                        <td>' + itm.DipVlue + '</td>\
                                        <td>' + itm.Description + '</td>\
                                        <td>&nbsp;</td>\
                                      </tr>';
                        });
                        $('#tblOnOff tbody').html(opt);
                        groupTable($('#tblOnOff tr:has(td)'), 0, 1);
                        $('#tblOnOff .deleted').remove();
                    }
                });
            }
            ///////////////////////////////////ON OF ALL CALCULATIONS   END
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
            //            tblGensLoad();
            //        }
            //    });
            //});




            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=47ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlDSUList').html(opt);
                        $('.clsHelper').hide();
                        LoadAllCompanies();
                    }
                });
            });
            $('#ddlDSUList').live('change', function () {
                LoadAllCompanies();
            });
            $('#ddlCompanyType').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "3") {
                    $('.clsHelper').show();
                }
                else {
                    $('.clsHelper').hide();
                }

                LoadAllCompanies();
            });
            function LoadAllCompanies() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType').val() + "ǁ" + $('#ddlDSUList').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#LocationsID').html(opt);

                        if (opt != '') {
                            tblGensLoad();
                        }
                        else {
                            $('#tblGens tbody').html('');
                        }
                    }
                });
            }
            $('#LocationsID').live('change', tblGensLoad);
            

            function FillData(obj)
            {
                $('#location').html(obj[0].LocationName);
                $('#Modal').html(obj[0].Modal);
                $('#Brand').html(obj[0].Brand);
                $('#Capacity').html(obj[0].Capacity);
                $('#FuelTankSize').html(obj[0].FuelTankSize);
                $('#FuelFilterModal').html(obj[0].FuelFilterModal);
                $('#OilFilterModal').html(obj[0].OilFilterModal) ;
                $('#WaterFilterModal').html(obj[0].WaterFilterModal);
                $('#AirFilterModal').html(obj[0].AirFilterModal);
                $('#OilQuantity').html(obj[0].OilQuantity);
                $('#coolentQuantity').html(obj[0].coolentQuantity);
                $('#ServiceDurationHours').html(obj[0].ServiceDurationHours);
                $('#MinFuelLevelLiter').html(obj[0].MinFuelLevelLiter);
                $('#CurrentMeterReading').html(obj[0].CurrentMeterReading);
                $('#GeneratorLifeHours').html(obj[0].GeneratorLifeHours);
                $('#BatteryModal').html(obj[0].BatteryModal);
                $('#BatteryAcidQty').html(obj[0].BatteryAcidQty);
                $('#BatteryAcidGravity').html(obj[0].BatteryAcidGravity);
            }
            LoadData();
            function LoadData() {

                            $('#genRegistration').show({
                                effect: "clip",
                                duration: 500
                            });
                            $('#geninfo').hide({
                                effect: "clip",
                                duration: 500
                            })
                        }

            //function LoadData() {
            //    $.ajax({
            //        type: "POST",
            //        url: "gen.ashx/?ID=1ǁ",
            //        success: function (response) {
            //            try {
            //                var jd = $.parseJSON(response)
            //                $('#geninfo').attr('tg', jd[0].tblGeneratorID);
            //                LoadNow();
            //                $('#genRegistration').hide({
            //                    effect: "clip",
            //                    duration: 500
            //                });
            //                $('#geninfo').show({
            //                    effect: "clip",
            //                    duration: 500
            //                })
            //                FillData(jd);
            //            } catch (e) {
            //                $('#genRegistration').show({
            //                    effect: "clip",
            //                    duration: 500
            //                });
            //                $('#geninfo').hide({
            //                    effect: "clip",
            //                    duration: 500
            //                })
            //            }
            //        }
            //    });
            //} 
            
            function tblGensLoad() {
                //alert($('#LocationsID').val());
               // if ($('#LocationsID').val() != null) {
                    
                $.ajax({
                    type: "POST",
                    url: "gen.ashx/?ID=21ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr gid="' + itm.tblGeneratorID + '"><td>' + itm.Modal + '</td>\
                                    <td>'+itm.Brand+'</td>\
                                    <td>'+itm.Capacity+'</td>\
                                    <td>' + itm.CurrentMeterReading + '</td>';
                        });
                        $('#tblGens tbody').html(opt);
                    }
                });
                //}
                //else {
                //    $('#tblGens tbody').html('');
                //}
            }
            $('#btnSave').live('click', function () {
                var $gen = '', $true=true;
                $('.gen').each(function (index, element) {
                    if ($(this).val() == null || $(this).val()=='') {
                        $true = false;
                    }
                    $gen += encodeURIComponent($(this).val()) + '½';
                });
                if ($true) {
                    $.ajax({
                        type: "POST",
                        url: "gen.ashx/?ID=0ǁ" + $gen,
                        success: function (response) {
                            if (response==1) {
                                alertG('Record Saved')
                                //LoadData();
                                tblGensLoad();
                            }
                            else {
                                alertR(response);
                            }
                        }
                    });
                }
                else {
                    alertR('Enter all information..!');
                }


                
            });


            $('.heading h3').html('Generator Management');
            $('.leftbar').click();
        });//END OF READY FUNCTION
    </script>
</asp:Content>
