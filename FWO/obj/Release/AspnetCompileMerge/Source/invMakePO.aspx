<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="invMakePO.aspx.cs" Inherits="FRDP.invMakePO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="plugins/misc/selectize/dist/js/standalone/selectize.js"></script>
    <link href="plugins/misc/selectize/dist/css/selectize.bootstrap3.css" rel="stylesheet" />
    <!-- Build page from here: -->
    <div class="row-fluid">

        <div class="span2">
            <div class="email-nav well">
                <div class="composeBtn">
                    <button href="#" class="btn btn-danger btn-block">Generate P.O</button>
                </div>
                <ul class="nav nav-list">
                    <li class="nav-header">P.Os</li>
                    <li class="sideBtns" prm="1"><a>Today</a></li>
                    <li class="sideBtns" prm="2"><a>Important</a></li>
                    <li class="sideBtns" prm="3"><a>Received</a></li>
                    <li class="sideBtns active" prm="4"><a>All P.Os...</a></li>
                    <li class="nav-header">Pending</li>
                    <li class="sideBtns" prm="5"><a>Finalize P.Os...</a></li>
                    <li class="divider"></li>
                    <li class="sideBtns" prm="6"><a>Drafts</a></li>
                    <li class="divider"></li>
                    <li class="sideBtns" prm="7"><a>Archive</a></li>
                </ul>
            </div>
            <!-- End .email-nav-->
        </div>
        <!-- End .span2-->

        <div class="span10">

            <div class="email-content">

                <div class="email-header">

                    <div class="btn-toolbar" style="margin: 0;">
                        <div class="btn-group">
                            <button class="btn tip" title="Refresh inbox"><span class="icon16 icomoon-icon-refresh"></span></button>
                        </div>
                        <div class="btn-group">
                            <button class="btn tip" title="Archive"><span class="icon16 icomoon-icon-box"></span></button>
                            <button class="btn tip" title="Mark as spam"><span class="icon16 icomoon-icon-blocked"></span></button>
                            <button class="btn tip" title="Delete"><span class="icon16 icomoon-icon-remove-5"></span></button>
                        </div>
                        <div class="btn-group">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                More
											<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Mark as unread</a></li>
                                <li><a href="#">Add star</a></li>
                                <li><a href="#">Filter message</a></li>
                                <li><a href="#">Mute</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <!-- End Email-header -->

                <div class="box plain">

                    <div class="title"></div>

                    <div class="content noPad clearfix">
                        <table id="reqlist" cellpadding="0" cellspacing="0" border="0" class="emailTable display table" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkAll">
                                        <input type="checkbox" id="selectall" value="all" class="nostyle tip" title="Select All" />
                                    </th>
                                    <th><span class="icon16 icomoon-icon-star-3"></span></th>
                                    <th style="text-align: left;">Purchase Order</th>
                                    <th style="text-align: left;">Subject</th>
                                    <th></th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>

                </div>
                <!-- End .box -->

                <div class="compose well">
                    <div class="page-header">
                        <h4>Generate P.O</h4>
                        <div class="actions">
                            <button id="btnsendt" r="0" st="2" class="btn btn-danger marginR10"><strong>Finalized P.O</strong></button>
                            <button id="btnsavet" r="0" st="1" class="btn marginR10">Save</button>
                            <button id="btndiscardt" class="btn marginR10">Discard</button>
                        </div>
                    </div>
                    <form class="compose form-horizontal">


                        <div class="form-row row-fluid">
                                   <div class="span1">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="to"></label>
                                    <%--<input class="span10" id="txtReqNo" name="txtReqNo" type="text" value="" readonly="readonly" />--%>
                                </div>
                            </div>
                            <div class="span11" style="margin-left: 0px;">
                                <div class="row-fluid">
                                    <div class="span5">
                                        <select id="ddlReqType" style="width: 167px;">
                                            <option>Purchase Order</option>
                                            <option>P.O With Quotation</option>
                                        </select>
                                        </div>
                                         <div class="span7" style="margin-left: 16px; text-align: right;">
                                        <strong>Approved Quotation#: </strong>
                                        <select id="ddlReq" style="width:265px;" disabled="disabled"></select>
                                             </div>
                                    </div>
                                </div>
                            </div>

                        <div class="form-row row-fluid">



                 

                            <div class="span1">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="to">P.O#:</label>
                                    <%--<input class="span10" id="txtReqNo" name="txtReqNo" type="text" value="" readonly="readonly" />--%>
                                </div>
                            </div>

                            
                            <div class="span11" style="margin-left: 0px;">
                                <div class="row-fluid">
                                    <div class="span5">
                                        <input id="txtReqNo" name="txtReqNo" type="text" value="" readonly="readonly" style="width: initial;" />
                                    </div>

                                    <div class="span7" style="margin-left: 16px; text-align: right;">
                                        <strong>Date: </strong>
                                        <input id="reqDated" name="txtReqNo" type="text" value="" readonly="readonly" style="width: 100px; text-align: right;" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1" for="to">To:</label>

                                    <div class="span11">
                                        <div class="dvAdd" tg="1">
                                            <select class="vlist" tg="1" style="margin-bottom: 10px;">
                                            </select>
<%--                                            <button type="button" class="addSupplierToList btn btn-info marginB10 marginL5" title="Add Supplier to the RFQ" tg="1">Add Supplier To the RFQ</button>
                                            <button type="button" class="addClose btn btn-info marginB10 marginL5" title="Close" tg="1">Close</button>--%>
                                        </div>
                                        <%--<table id="tblvvenders" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                                            <thead>
                                                <tr style="border-bottom: 1px solid #c4c4c4;">
                                                    <th style="padding-top: 0px; padding-bottom: 9px;">Supplier(s)</th>

                                                    <th style="width: 26px;">
                                                        <button type="button" class="addVender btn btn-info" title="Add Supplier to the Segment" tg="1">+</button></th>
                                                </tr>
                                            </thead>
                                            <tbody class="dtl" tg="1"></tbody>
                                        </table>--%>
                                        <%--<select id="tblvvenders" ></select>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1" for="subject">Subject:</label>
                                    <div>
                                        <input class="span11 clsfrm" id="subjectR" name="subject" type="text" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1">Item:</label>

                                    <%-- <input class="span10" id="subject" name="subject" type="text" />--%>
                                    <select id="ddlItem" class="span11 clsfrm">
                                    </select>

                                </div>
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1">Quality:</label>
                                    <div class="span7">
                                        <input class="clsfrm" id="txtQuality" name="txtQuality" type="text" style="width: 95%;" />
                                    </div>
                                    <label class="span1 form-label">Quantity:</label>
                                    <div class="span2">
                                        <input class="clsfrm Integer" id="txtQuantity" name="txtQuantity" type="text" style="width: 75%; margin-left: 10px;" />
                                    </div>

                                    <label id="lblUnit" class="form-label span1"></label>
                                    <div class="span1" style="width: 7.55%; text-align: right;">
                                        <button id="btnRAdd" forupdate="0" class="btn btn-info">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <table id="tblitsms" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                                        <thead>
                                            <tr>
                                                <th style="width: 30px;">#</th>
                                                <th>Item</th>
                                                <th>Quality</th>
                                                <th style="width: 100px;">Quantity</th>
                                                <th style="width: 50px;">Unit</th>
                                                <th style="width: 60px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%--                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>PC</td>
                                                <td>
                                                    <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                                    <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <td>PC</td>
                                                <td>
                                                    <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                                    <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                                </td>
                                            </tr>--%>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="3" style="text-align: center; font-weight: bold;">Total</td>
                                                <td id="totalitems" style="text-align: center; font-weight: bold;"></td>
                                                <td colspan="2"></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid" style="margin-top: 0px !important;">
                            <div class="span12">
                                <div class="row-fluid">
                                    <h4>Brief  Description of (P.O) <a href="#" class="icon tip"><span class="icon16 icomoon-icon-cog-2"></span></a></h4>
                                    <textarea title="Enter brief Description of (RFQ)Request for Quotation (if any).." class="span12 elastic" id="textareaRdescription" rows="8"></textarea>
                                </div>
                            </div>
                        </div>

                           <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <h4>Receiving Location <a href="#" class="icon tip" style="width: 400px;"><span>
                                        <select id="ddlLocation"></select></span></a></h4>
                                    <textarea title="Enter Address " style="margin-top:10px;" class="span12 elastic" id="textareaRAddress" rows="8"></textarea>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div style="text-align: right;">
                        <div class="actions">
                            <button id="btnsendf" r="0" st="2" class="btn btn-danger marginR10"><strong>Finalized P.O</strong></button>
                            <button id="btnsavef" r="0" st="1" class="btn marginR10">Save</button>
                            <button id="btndiscardf" class="btn marginR10">Discard</button>
                        </div>
                    </div>
                </div>
                <!-- End .compose -->

                <div class="read-email well">

                    <div class="page-header">
                        <div class="actions">
                            <button id="backToInbox" class="btn marginR10 tip" title="Back to inbox"><span class="icon16 icomoon-icon-arrow-left-3"></span></button>
                            <button id="save" class="btn marginR10 tip" title="Reply"><span class="icon16 icomoon-icon-reply"></span></button>
                            <button id="discard" class="right btn btn-danger marginR10 tip" title="Delete"><span class="icon16 icomoon-icon-remove-5 white"></span></button>
                        </div>
                    </div>
                    <form class="readmail form-horizontal">
                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="to">Subject:</label>
                                    <input class="span10" id="to" name="to" type="text" value="Hello my friend" readonly="readonly" />
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="subject">Sender:</label>
                                    <div>
                                        <input class="span10" id="subject" name="subject" type="text" value="storm@gmail.com" readonly="readonly" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="subject">Date:</label>
                                    <div style="margin-top: 7px;">
                                        <span>26 August 2012 3:00 pm</span>
                                        <span class="span10 help-block">
                                            <dl class="attach">
                                                <dd><a href="#" class="icon12 icomoon-icon-file-pdf">&nbsp;main.pdf</a></dd>
                                                <dd><a href="#" class="icon12 icomoon-icon-file-zip">&nbsp;package.zip</a></dd>
                                                <dd><a href="#" class="icon12 icomoon-icon-file-css">&nbsp;layout.css</a></dd>
                                            </dl>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <textarea class="span12 elastic" id="textarea" rows="8">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.                                              
                                                </textarea>
                                </div>
                            </div>
                        </div>

                    </form>

                </div>
                <!-- End .read-email -->

            </div>
            <!-- End .email-content -->

        </div>
        <!-- End .span2-->

    </div>
    <!-- End .row-fluid -->
    <!--End page -->
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        // document ready function
        $(document).ready(function () {

            $('#ddlReqType').live('change', function (e) {

                e.preventDefault();
                if ($(this).val() == "Purchase Order") {
                    $('#ddlReq').html('');
                    $('#ddlReq').attr('disabled', 'disabled')
                    $('.vlist').removeAttr('disabled');
                   }
                else {

                
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=87ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option  value="' + itm.tblInvReqMainVendersID + '" tg="' + itm.tblInvReqMainID + '" tag="' + itm.tblVenderID + '">' + itm.POTitle + '</option>';
                        });
                        $('#ddlReq').html(opt);
                        $('#ddlReq').removeAttr('disabled');
                        if ($('#ddlReq').val() == "" || $('#ddlReq').val() == null || $('#ddlReq').val() == undefined ) {
                            alertR('No items to select..!');

                        }
                        else {
                            $('.vlist').val($('#ddlReq option:selected').attr('tag'));
                            $('.vlist').attr('disabled', 'disabled');
                            LoadItemsByReqId($('#ddlReq option:selected').attr('tg'));
                        }
                    }
                });
                }

            });

            $('#ddlReq').live('change', function () {
                $('.vlist').val($('#ddlReq option:selected').attr('tag'));
                LoadItemsByReqId($('#ddlReq option:selected').attr('tg'));
            });
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=55ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option ad="' + itm.CompanyAddress + '" value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlLocation').html(opt);
                        getLocationAddress();
                    }
                });
            });
            $('#ddlLocation').live('change', getLocationAddress);
            function getLocationAddress() {
                $('#textareaRAddress').val($('option:selected', $('#ddlLocation')).attr('ad'));
            }
            LoadVTable();
            function LoadVTable() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=14ǁ where CategoryVenderContractor=▓Vendor▓ ǁ order by CategoryVenderContractor, VenderNo ",
                    success: function (response) {
                        try {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<option value="' + itm.tblVenderID + '">VND' + itm.VenderNo + ' ' + itm.Name + '</option>';
                            });
                            $('.vlist').html(opt);
                        } catch (e) {
                            $('.vlist').html('');
                        }

                    }
                });
            }
            $('.addClose').live('click', function (e) { e.preventDefault(); $(this).parent().hide('slow'); });
            $('.addVender').live('click', function (e) {
                e.preventDefault();
                $('.dvAdd[tg=' + $(this).attr('tg') + ']').show('slow');
                //$(this).parent().hide();
            });

            $('.addSupplierToList').live('click', function (e) {
                e.preventDefault();
                var $tg = $(this).attr('tg');
                var valu = $('.vlist[tg=' + $tg + ']').val();
                var txt = $('.vlist[tg=' + $tg + '] option:selected').text();
                var flg = true
                $('.vndrs').each(function (i, j) {
                    // element == this
                    if ($(this).attr('vl') == valu) {
                        flg = false;
                    }
                });
                if (flg) {
                    $('.dtl[tg=' + $tg + ']').append('<tr class="vndrs" vl=' + valu + '><td>' + txt + '</td><td><button type="button" class="delVender btn btn-danger" title="Delete Supplier from the Segment" tv="1002" tg="1" customtooltip="Delete Supplier from the Segment">x</button></td></tr>')
                }
                else {
                    alertR('Supplier already selected..!');
                }

                //$.ajax({
                //    type: "POST",
                //    url: "venderGH.ashx/?ID=2ǁ" + $tg + "ǁ" + $('.vlist[tg=' + $tg + ']').val(),
                //    success: function (response) {
                //        LoadBody($tg);
                //    }
                //});
            });
            $('.delVender').live('click', function (e) {
                e.preventDefault();
                var $tr = $(this);
                $tr.parent().parent().remove();
                //$.ajax({
                //    type: "POST",
                //    url: "venderGH.ashx/?ID=4ǁ" + $tr.attr('tg') + "ǁ" + $tr.attr('tv'),
                //    success: function (response) {
                //        $tr.parent().parent().remove();
                //    }
                //});

            });
            ///////////////////////////////////////////////////
            //$('#ddlDSUList').live('change', function () {
            //    LoadLocations();
            //});
            //$('#ddlCompanyType').live('change', function (e) {
            //    e.preventDefault();
            //    if ($(this).val() == "3") {
            //        $('.clsHelper').show();
            //    }
            //    else {
            //        $('.clsHelper').hide();
            //    }

            //    LoadLocations();
            //});
            //$(function () {
            //    $.ajax({
            //        type: "POST",
            //        url: "inv.ashx/?ID=47ǁ",
            //        success: function (response) {
            //            //alert(response);
            //            var jd = $.parseJSON(response), opt = '';
            //            $.each(jd, function (i, itm) {
            //                opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
            //            });
            //            $('#ddlDSUList').html(opt);
            //            $('.clsHelper').hide();
            //            LoadLocations();
            //        }
            //    });
            //});

            //function LoadLocations() {
            //    $.ajax({
            //        type: "POST",
            //        url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType').val() + "ǁ" + $('#ddlDSUList').val(),
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
            //                //$('#ddlPortion').html('');
            //                //LoadTbl();
            //            }
            //        }
            //    });
            //}

            //------------- Email page  -------------//

            var emailTable = $('.emailTable');
            var emailStar = emailTable.find('td.star>span.icon16');

            //setup the star in click
            emailStar.live('click', function () {
                var status = 0;
                if ($(this).hasClass('icomoon-icon-star-3')) {
                    $(this).removeClass('icomoon-icon-star-3').addClass('icomoon-icon-star');
                    //make callback here
                    status = 0
                } else {
                    $(this).removeClass('icomoon-icon-star').addClass('icomoon-icon-star-3');
                    //make callback here
                    status = 1;
                }
                console.log(status);
                var $this = $(this).parent();
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=34ǁ" + $this.attr('rid') + "ǁ" + status,
                    success: function (response) {
                    }
                });
            });

            //auto complete for compose To form field
            //$('#to').typeahead({
            //    source: ['jonh@yahoo.com', 'silva@yahoo.com', 'carlos@gmail.com', 'sugge@gmail.com']
            //})

            //check all checkboxes in email table
            $(".checkAll").live('click', function () {
                var $this = $(this);
                var checkedStatus = $this.find('span').hasClass('checked');
                $(".emailTable tr .check input:checkbox").each(function () {
                    this.checked = checkedStatus;
                    if (checkedStatus == this.checked) {
                        $(this).closest('.checker > span').removeClass('checked');
                    }
                    if (this.checked) {
                        $(this).closest('.checker > span').addClass('checked');
                    }
                });
            });

            //show compose form
            $('.composeBtn>.btn').click(function () {
                $('.email-content>.box.plain').fadeOut(200);
                $('.read-email').fadeOut();
                $('.compose').fadeIn();
                ClearCompose();
            });

            //close compose form on discard click
            $('#btndiscardt, #btndiscardf').click(function () {
                ClearCompose();
                //$($('.sideBtns')[3]).addClass('active');
                $('.compose').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);
                $('#toTop').click();
            });

            //save click event
            $('#btnsavet, #btnsavef, #btnsendt, #btnsendf').live('click', function () {
                var $this = $(this);
                if ($.trim($('#tblitsms tbody').html()) == "") {
                    alertR('Enter some items please...!');
                    return false;
                }
                if ($this.attr('st') == "1" && ($('.vndrs').length == 0)) {
                    alertR('Select Some Supplier Please..');
                    return false;
                }
                var headd = [];
                header = {};

                //var vnderslist = "";
                //$('.vndrs').each(function (i, j) {
                //    // element == this
                //    vnderslist += $(this).attr('vl') + '½';
                //});

                //vnderslist += '¼';
                //vnderslist = vnderslist.replace(/½¼/g, '');



                //header["vnderslist"] = vnderslist;
                header["Subject"] = $('#subjectR').val();
                header["Description"] = $('#textareaRdescription').val();
                header["Location"] = $('#textareaRAddress').val();
                header["LocationID"] = $('#ddlLocation').val();
                header["StoreID"] = $($('.vlist')[0]).val();
                header["StoreName"] = $($('.vlist')[0]).find("option:selected").text();
                headd.push(header);
                var hh = JSON.stringify({ Head: header });
                var ii = JSON.stringify({ Items: items });
                var reqID = 0;
                if ($('#ddlReq').val()=="" || $('#ddlReq').val()==null || $('#ddlReq').val()== undefined ) {
                    reqID=0
                }
                else {
                    reqID = $('#ddlReq').val();
                }


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "invMakePO.aspx/MakeRFQ",
                    data: "{'h':'" + hh + "','i':'" + ii + "','con':'" + $this.attr('st') + "','thisid':'" + $this.attr('r') + "','reqID':'" + reqID + "'}",
                    success: function (response) {
                        if ($this.attr('st') == "0") {
                            $('#btnsendt').attr('r', response.d);
                            $('#btnsavet').attr('r', response.d);
                            $('#btnsendf').attr('r', response.d);
                            $('#btnsavef').attr('r', response.d);
                            alertG('Recoard Saved');
                            Loadreqlist();
                        }
                        else {
                            Loadreqlist();
                            $('.compose').fadeOut(200);
                            $('.email-content>.box.plain').fadeIn(300);
                            ClearCompose();
                            $.pnotify({
                                type: 'success',
                                title: 'Done',
                                text: 'RFQ sent successfull',
                                icon: 'picon icon16 iconic-icon-check-alt white',
                                opacity: 0.95,
                                history: false,
                                sticker: false
                            });
                        }
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
                //save callback here
            });


            $('.sideBtns').live('click', function () {
                var $this = $(this);
                $('.sideBtns').removeClass('active');
                $this.addClass('active');
                ClearCompose();
                $('.compose').fadeOut(200);
                $('.read-email').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);

                Loadreqlist();
            });

            Loadreqlist();

            function Loadreqlist() {
                var _$_ee61 = ["prm", "attr", ".sideBtns.active", "POST", "inv.ashx/?ID=89ǁ", "parseJSON", "", "icon16 icomoon-icon-star", "bIsImportantForSender", "icon16 icomoon-icon-star-3", "icon16 icomoon-icon-alarm", "Status", "icon16 icomoon-icon-redo-2", "icon16 icomoon-icon-undo-2", "<tr rid=\"", "tblInvReqMainID", "\">\r                                    <td class=\"check\">\r                                        <input type=\"checkbox\" id=\"checkbox\" class=\"nostyle\" value=\"1\" /></td>\r                                    <td class=\"star\" rid=\"", "\"><span class=\"", "\"></span></td>\r                                    <td class=\"from\">\r                                        <a  rid=\"", "\" rno=\"", "tblInvReqNo", "\" sender=\"", "EnterByEmpID", "\" sbjct=\"", "Subject", "\" dated=\"", "Dated", "\" descript=\"", "Description", "\" st=\"", "\" class=\"unread link\"><span class=\"label\">", "</span></a>\r                                    </td>\r                                    <td class=\"subject\">\r                                        <a   rid=\"", "\"  class=\"unread link\">", "  <span>- ", "subDescription", " ...</span></a>\r                                    </td>\r                                    <td class=\"attachment\">\r                                        <a>\r                                            <span class=\"", "\"></span>\r                                        </a>\r                                    </td>\r                                    <td class=\"date\">", "</td>\r                                </tr>", "each", "dataTable", "hasClass", "#reqlist", "fnDestroy", ".emailTable", "html", "#reqlist tbody", "emailTable", "Got a total of _TOTAL_ emails to show (_START_ to _END_)", "uniform", "input[type=checkbox]", "10px", "20px", "80px", "ajax"]; var searchparam = $(_$_ee61[2])[_$_ee61[1]](_$_ee61[0]); $[_$_ee61[53]]({ type: _$_ee61[3], url: _$_ee61[4] + searchparam, success: function (c) { var a = $[_$_ee61[5]](c), b = _$_ee61[6]; $[_$_ee61[38]](a, function (d, e) { var f = _$_ee61[7]; if (e[_$_ee61[8]] == true) { f = _$_ee61[9] }; var g = _$_ee61[10]; if (parseInt(e[_$_ee61[11]]) == 1) { g = _$_ee61[12] }; if (parseInt(e[_$_ee61[11]]) == 2) { g = _$_ee61[13] }; b += _$_ee61[14] + e[_$_ee61[15]] + _$_ee61[16] + e[_$_ee61[15]] + _$_ee61[17] + f + _$_ee61[18] + e[_$_ee61[15]] + _$_ee61[19] + e[_$_ee61[20]] + _$_ee61[21] + e[_$_ee61[22]] + _$_ee61[23] + e[_$_ee61[24]] + _$_ee61[25] + e[_$_ee61[26]] + _$_ee61[27] + e[_$_ee61[28]] + _$_ee61[29] + e[_$_ee61[11]] + _$_ee61[30] + e[_$_ee61[20]] + _$_ee61[31] + e[_$_ee61[15]] + _$_ee61[19] + e[_$_ee61[20]] + _$_ee61[21] + e[_$_ee61[22]] + _$_ee61[23] + e[_$_ee61[24]] + _$_ee61[25] + e[_$_ee61[26]] + _$_ee61[27] + e[_$_ee61[28]] + _$_ee61[29] + e[_$_ee61[11]] + _$_ee61[32] + e[_$_ee61[24]] + _$_ee61[33] + e[_$_ee61[34]] + _$_ee61[35] + g + _$_ee61[36] + e[_$_ee61[26]] + _$_ee61[37]; }); if ($(_$_ee61[41])[_$_ee61[40]](_$_ee61[39])) { $(_$_ee61[43])[_$_ee61[39]]()[_$_ee61[42]]() }; $(_$_ee61[45])[_$_ee61[44]](b); if ($(_$_ee61[41])[_$_ee61[40]](_$_ee61[46])) { $(_$_ee61[43])[_$_ee61[39]]({ "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": false, "oLanguage": { "sSearch": _$_ee61[6], "sInfo": _$_ee61[47] }, "fnDrawCallback": function () { $(_$_ee61[49])[_$_ee61[48]]() }, "aoColumns": [{ "sWidth": _$_ee61[50], "bSortable": false }, { "sWidth": _$_ee61[50], "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "sWidth": _$_ee61[51], "bSortable": false }, { "sWidth": _$_ee61[52], "bSortable": false }] }) }; } });
            }


          

            function ClearCompose() {
                header = {};
                items = [];
                $('#btnsendt').attr('r', '0');
                $('#btnsavet').attr('r', '0');
                $('#btnsendf').attr('r', '0');
                $('#btnsavef').attr('r', '0');
                $('#tblitsms tbody').html('');
                $('#txtReqNo').val('');
                $('#reqDated').val('');
                $('#subjectR').val('');
                $('#txtQuality').val('');
                $('#txtQuantity').val('');
                $('#totalitems').html('');
                $('#textareaRdescription').val('');

                $('#btnsendt').removeAttr('readonly');
                $('#btnsendt').removeAttr('disabled');
                $('#btnsendf').removeAttr('readonly');
                $('#btnsendf').removeAttr('disabled');
                $('#btnsavet').removeAttr('readonly');
                $('#btnsavet').removeAttr('disabled');
                $('#btnsavef').removeAttr('readonly');
                $('#btnsavef').removeAttr('disabled');




            }
            $('#backToInbox').click(function () {
                $('.read-email').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);

            });

            emailTable.find('td a.link').live('click', function () {
                var $this = $(this);
                ClearCompose();
                $('#txtReqNo').val($(this).attr('rno'));
                $('#subjectR').val($(this).attr('sbjct'));
                $('#reqDated').val($(this).attr('dated'));
                $('#textareaRdescription').val($(this).attr('descript'));
                $('#btnsendt').attr('r', $(this).attr('rid') + '½' + $(this).attr('rno'));
                $('#btnsendf').attr('r', $(this).attr('rid') + '½' + $(this).attr('rno'));
                $('#btnsavet').attr('r', $(this).attr('rid') + '½' + $(this).attr('rno'));
                $('#btnsavef').attr('r', $(this).attr('rid') + '½' + $(this).attr('rno'));
                if (parseInt($this.attr('st')) > 0) {
                    $('#btnsendt').attr('readonly', 'readonly');
                    $('#btnsendt').attr('disabled', 'disabled');
                    $('#btnsendf').attr('readonly', 'readonly');
                    $('#btnsendf').attr('disabled', 'disabled');
                    $('#btnsavet').attr('readonly', 'readonly');
                    $('#btnsavet').attr('disabled', 'disabled');
                    $('#btnsavef').attr('readonly', 'readonly');
                    $('#btnsavef').attr('disabled', 'disabled');
                }
                LoadItemsByReqId($(this).attr('rid'));
                $('.email-content>.box.plain').fadeOut(200);
                $('.read-email').fadeOut();
                $('.compose').fadeIn();
            });


            //Boostrap modal
            $('#myModal').modal({ show: false });

            //add event to modal after closed
            $('#myModal').on('hidden', function () {
                console.log('modal is closed');
            })



            //0000000000000000000000000000000000000000000000000000000000000000000000000











            $('#LocationsID').live('change', ddlStore_Bind);
            function ddlStore_Bind() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=28ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.ID + '">' + itm.Name + '</option>';
                        });
                        $('#ddlStore').html(opt);

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
            var items = [];
            var header;
            $('#btnRAdd').live('click', function (e) {
                e.preventDefault();
                if ($('#ddlItem').val() == "" || $('#ddlItem').val() == null) {
                    alertR('Select Valid Item');
                    return false;
                }

                if ($('#txtQuantity').val() == "") {
                    alertR('Select Valid Item Quantity..!');
                    return false;
                }

                var $tr = $('#tblitsms tbody tr[iid=' + $('#ddlItem').val() + ']');
                var qty = $('#txtQuantity').val();
                if ($tr.length > 0) {
                    qty = parseInt(qty) + parseInt($tr.attr('qty'));
                    items.splice($tr.attr('ar'), 1);
                }

                item = {}

                item["ItemID"] = $('#ddlItem').val();
                item["ItemName"] = $('#ddlItem option:selected:').text();
                item["Quality"] = $('#txtQuality').val();
                item["Quantity"] = qty;
                item["Unit"] = $('#lblUnit').html();
                items.push(item);
                $('#txtQuality').val('');
                $('#txtQuantity').val('');

                LoadItsms(items);
            });

            function LoadItemsByReqId(obj) {
                //alert(obj);
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=88ǁ" + obj,
                    success: function (response) {
                        items = $.parseJSON(response);
                        LoadItsms(items);
                        //if (items[0].LocationID != "0") {
                        //    //$('#LocationsID').val(items[0].LocationID);
                        //    BindStoreAndSetId(items[0].StoreID);
                        //}
                    }
                });
            }

            function BindStoreAndSetId(obj) {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=28ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.ID + '">' + itm.Name + '</option>';
                        });
                        $('#ddlStore').html(opt);
                        $('#ddlStore').val(obj);
                    }
                });
            }

            $('.clsitemdelete').live('click', function () {
                $this = $(this);
                items.splice($this.attr('ar'), 1);
                LoadItsms(items);
            });

            $('.clsitemedit').live('click', function () {

                $this = $(this).parent().parent();

                if ($('#ddlItem').hasClass('selectized')) {
                    $('#ddlItem')[0].selectize.destroy();
                }
                $('#ddlItem').val($this.attr('iid'));
                $("#ddlItem").selectize();
                $('#txtQuality').val($this.attr('qly'));
                $('#txtQuantity').val($this.attr('qty'));
                items.splice($this.attr('ar'), 1);
                LoadItsms(items);
            });
            function LoadItsms(obj) {
                var opt = "", ttl = 0;
                $.each(obj, function (i, j) {
                    ttl += parseInt(j.Quantity);
                    opt += '<tr iid="' + j.ItemID + '" ar="' + (parseInt(i)).toString() + '" qty="' + j.Quantity + '" qly="' + j.Quality + '">\
                                                <td>'+ (parseInt(i) + 1).toString() + '</td>\
                                                <td>' + j.ItemName + '</td>\
                                                <td>' + j.Quality + '</td>\
                                                <td>' + j.Quantity + '</td>\
                                                <td>' + j.Unit + '</td>\
                                                <td>\
                                                    <a ar="' + (parseInt(i)).toString() + '" class="clsitemedit tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>\
                                                    <a ar="' + (parseInt(i)).toString() + '" class="clsitemdelete tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>\
                                                </td>\
                                            </tr>'
                });
                $('#tblitsms tbody').html(opt);
                $('#totalitems').html(ttl);
            }
            //ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
        });//End document ready functions

        //sparkline in sidebar area
        var positive = [1, 5, 3, 7, 8, 6, 10];
        var negative = [10, 6, 8, 7, 3, 5, 1]
        var negative1 = [7, 6, 8, 7, 6, 5, 4]

        $('#stat1').sparkline(positive, {
            height: 15,
            spotRadius: 0,
            barColor: '#9FC569',
            type: 'bar'
        });
        $('#stat2').sparkline(negative, {
            height: 15,
            spotRadius: 0,
            barColor: '#ED7A53',
            type: 'bar'
        });
        $('#stat3').sparkline(negative1, {
            height: 15,
            spotRadius: 0,
            barColor: '#ED7A53',
            type: 'bar'
        });
        $('#stat4').sparkline(positive, {
            height: 15,
            spotRadius: 0,
            barColor: '#9FC569',
            type: 'bar'
        });
        //sparkline in widget
        $('#stat5').sparkline(positive, {
            height: 15,
            spotRadius: 0,
            barColor: '#9FC569',
            type: 'bar'
        });

        $('#stat6').sparkline(positive, {
            width: 70,//Width of the chart - Defaults to 'auto' - May be any valid css width - 1.5em, 20px, etc (using a number without a unit specifier won't do what you want) - This option does nothing for bar and tristate chars (see barWidth)
            height: 20,//Height of the chart - Defaults to 'auto' (line height of the containing tag)
            lineColor: '#88bbc8',//Used by line and discrete charts to specify the colour of the line drawn as a CSS values string
            fillColor: '#f2f7f9',//Specify the colour used to fill the area under the graph as a CSS value. Set to false to disable fill
            spotColor: '#e72828',//The CSS colour of the final value marker. Set to false or an empty string to hide it
            maxSpotColor: '#005e20',//The CSS colour of the marker displayed for the maximum value. Set to false or an empty string to hide it
            minSpotColor: '#f7941d',//The CSS colour of the marker displayed for the mimum value. Set to false or an empty string to hide it
            spotRadius: 3,//Radius of all spot markers, In pixels (default: 1.5) - Integer
            lineWidth: 2//In pixels (default: 1) - Integer
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
