<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="AssetAssignment.aspx.cs" Inherits="FRDP.AssetAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="plugins/misc/selectize/dist/js/standalone/selectize.js"></script>
    <link href="plugins/misc/selectize/dist/css/selectize.bootstrap3.css" rel="stylesheet" />
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Fixed Asset Item Placement</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 125px;">
                                    <label>Office Type : &nbsp;</label></td>
                                <td style="text-align: left; width: 40%;">
                                    <select id="ddlCompanyType" class="pr frm">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>
                                <td style="width: 125px; text-align: right;">
                                    <label class="form-label span3 clsHelper" for="normal" style="display: none;">DSU</label></td>
                                <td style="text-align: left;">
                                    <select id="ddlDSUList" class="pr clsHelper frm" style="display: none;"></select></td>
                            </tr>

                            <tr>
                                <td>Office </td>
                                <td>
                                    <select id="ddlCompany" class="pr frm"></select></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">Date</td>
                                <td style="text-align: left; width: 40%;">
                                    <input id="dtDate" class="frm clr" type="text" /></td>
                                <td style="width: 100px;">PO#</td>
                                <td style="text-align: left;">
                                    <input id="txtPO" class="frm clr" type="text" />
                                    <%--<select id="Type" style="  WIDTH: 93.5%;">
                <option>Company</option>
                <option>Individual</option>
            </select>--%></td>
                            </tr>
                            <tr>
                                <td>Asset Category</td>
                                <td colspan="3">
                                    <select id="ddlItemCategory" class="frm" style="width: 83.5%;">
                                    </select></td>
                               
                            </tr>
                            <tr>
                                <td>Depreciation Method</td>
                                <td>
                                    <select id="ddlddlMethod" class="frm">
                                        <option>Straight Line Method</option>
                                        <option>Decline Method</option>
                                        <option>Double Decline Method</option>
                                    </select></td>
                                <td>Depreciation Rate(%)
                                </td>
                                <td>
                                    <input id="txtDepRate" class="frm Integer clr" title="Depreciation Rate(%)" type="text" />
                                </td>
                            </tr>

                            <tr>
                                <td>Select Item</td>
                                <td>
                                    <select id="ddlItem" class="frm"></select>
                                </td>
                                 <td>Purchased Value</td>
                                <td><input id="txtPVal" class="frm Integer clr" title="Depreciation Rate(%)" type="text" /></td>
                            </tr>
                            <tr>
                                <td>Life (Year) :</td>
                                <td>
                                    <input id="txtAddLife" class="Integer frm clr" type="text" /></td>
                                <td>Salvage Value</td>
                                <td>
                                    <input id="txtSalvage" class="frm Integer clr" title="Salvage Value" type="text" /></td>
                            </tr>
                            <tr>
                                <td>Serial #
                                </td>
                                <td>
                                    <input id="txtSerial" class="frm clr" title="Serial Number of Item if Any" type="text" />
                                </td>
                                <td>Product #
                                </td>
                                <td>
                                    <input id="txtProduct" class="frm clr" title="Product Number of Item if Any" type="text" /></td>
                            </tr>
                            <tr>
                                <td>Insurance</td>
                                <td>
                                    <input id="txtInsurance" class="frm clr" title="Include any details regarding the insurance policy for the asset, including broker name and company." type="text" /></td>
                                <td>Warranty</td>
                                <td>
                                    <input id="txtWarranty" class="frm clr" title="If applicable, including contact information for warranty provider." type="text" /></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Description</td>
                                <td colspan="3">
                                    <textarea id="txtDetails" class="frm clr" cols="20" rows="2" style="width: 82%;"></textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" value="0" id="btnSave" class="btn btn-info frm">Save</button>
                                    <button type="button" id="btnCancel" class="btn btn" style="margin-left: 5px;">Cancel</button></td>
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
                        <span>Asset Details</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table id="tblItemList" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th style="width: 30px;">#</th>
                                <th>Item Code</th>
                                <th>Item</th>
                                <th>Date</th>
                                <th style="width: 100px;">PO#</th>
                                <th style="width: 100px;">Serial#</th>
                                <th style="width: 100px;">Product#</th>
                                <th style="width: 30px;"></th>
                                <th>Last Checked</th>
                                <th style="width: 60px;">Action</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr style="border-bottom: 1px solid #C4C4C4;">
                                <td colspan="9" style="text-align: center; font-weight: bold;">Total Items</td>
                                <td id="totalItems" style="text-align: center; font-weight: bold;">3</td>
                            </tr>
                        </tfoot>
                    </table>
                    <br />
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                var input = "officeType, DSUID, tblCompanyID, displayDate, PO#, tblInvItemsIDAssetCategoryID, DepriciationMethod, DepriciationRate, tblInvItemsID, fPurchaseValue, LifeYear, Salvage, SerialNo, ProductNo, Insurance,  Warranty, Note, tblFixedAssetItemsID".split(',');
                var str = "";
                $('.frm').each(function (index, element) {
                    if ($(this).hasClass('hasDatepicker')) {
                        str += "CASE WHEN CONVERT(VARCHAR(50)," + input[index] + ",103) = '01/01/1900' THEN '' ELSE CONVERT(VARCHAR(50)," + input[index] + ",103) END AS " + input[index] + ", ";
                    }
                    else {
                        str += input[index] + ", ";
                    }
                });
                alert("Select " + str);
            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#dtDate').val() == "" || $('#dtDate').val() == undefined) {
                    alertR("Enter Date DD/MM/YYYY");
                    return false;
                }
                var vals = "";
                $('.frm').each(function (i, j) {
                    // element == this
                    //$(this).css('background', 'red');
                    vals += $(this).val() + "ǁ";
                });
                vals += $('#ddlItem').val();

                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=62ǁ" + encodeURIComponent(vals),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        LoadItemList();
                    }
                });

            });

            function LoadItemList() {
                alertR("Loading...");

                var total = 0;
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=63ǁ" + $('#ddlCompany').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            total = i;
                            opt += '<tr>\
                                    <td>'+ (i + 1) + '</td>\
                                    <td><img alt="" src="images/QRCode.png" style="width: 50px; margin-bottom:10px; margin-top:5px;box-shadow: 0 3px 5px -1px rgba(0,0,0,.2),0 6px 10px 0 rgba(0,0,0,.14),0 1px 18px 0 rgba(0,0,0,.12);">&nbsp;&nbsp;<span style="vertical-align:top;">'+ itm.Code + '</span></td>\
                                      <td>'+ itm.Name + '</td>\
                                    <td>' + itm.displayDate + '</td>\
                                      <td>' + itm.PO + '</td>\
                                      <td>' + itm.SerialNo + '</td>\
                                      <td>' + itm.ProductNo + '</td>\
                                      <td><span class="icon12 icomoon-icon-flag-4" style="vertical-align:top;"></span></td>\
                                    <td></td>\
                                      <td>\
                                          <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>\
                                          <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>\
                                      </td>\
                                  </tr>';
                        });
                        $('#tblItemList tbody').html(opt);
                        $('#totalItems').html((total + 1));
                    }
                });

            }

            $(function () {
                //
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=90ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        thisitms = jd;
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.tblInvItemsID + '">' + itm.fullCodeName + '</option>';
                        });
                        $('#ddlItemCategory').html(opt);
                        LoadItems();
                        //if ($('#ddlItem').hasClass('selectized')) {
                        //    $('#ddlItem')[0].selectize.destroy();
                        //}
                        //$("#ddlItem").selectize();
                        //FindUnit($("#ddlItem").val());

                    }
                });
            });

            $('#ddlItemCategory').live('change', function () {
                LoadItems();

            });
            function LoadItems() {

                if ($('#ddlItemCategory').val() == "" || $('#ddlItemCategory').val() == null || $('#ddlItemCategory').val() == undefined) {
                    $('#ddlItem').html("");
                    //if ($('#ddlItem').hasClass('selectized')) {
                    //    $('#ddlItem')[0].selectize.destroy();
                    //}
                    //$("#ddlItem").selectize();
                }
                else {


                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=91ǁ" + $('#ddlItemCategory').val(),
                        success: function (response) {

                            try {
                                var jd = $.parseJSON(response), opt = '';
                                thisitms = jd;
                                $.each(jd, function (i, itm) {
                                    opt += '<option value="' + itm.tblInvItemsID + '">' + itm.fullCodeName + '</option>';
                                });
                                $('#ddlItem').html(opt);
                            } catch (e) {
                                $('#ddlItem').html('');
                            }

                            //alert(opt);
                            //if ($('#ddlItem').hasClass('selectized')) {
                            //    $('#ddlItem')[0].selectize.destroy();
                            //}
                            //$("#ddlItem").selectize();
                            //FindUnit($("#ddlItem").val());

                        }
                    });
                }
            }



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

            $('#dtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
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
                        $('#ddlCompany').html(opt);

                        if (opt != '') {
                            // LoadEmpList();
                           // LoadItemList();
                        }
                    }
                });
            }
            //$('#ddlCompany').live('change', LoadEmpList);
        });//End of Doc Ready
    </script>
</asp:Content>
