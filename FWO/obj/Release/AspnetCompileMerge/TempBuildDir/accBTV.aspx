<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accBTV.aspx.cs" Inherits="FRDP.accBTV" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Bank Transfer Voucher</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <div id="Parea" class="pcontant">
                        <table style="width: 98%;">
                            <tr>
                                <td style="width: 25px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 25px"></td>
                                <td>
                                    <asp:DetailsView ID="dvCompany" runat="server" AutoGenerateRows="False" BorderStyle="None" DataSourceID="dsComp" GridLines="None" Height="50px" Width="98%">
                                        <Fields>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <div>
                                                        <div id="CompID" style="float: left; text-align: center; width: 90px; height: 80px;">
                                                            <img alt='<%# Eval("InstName") %>' src="<%# Eval("Logo")%>" style="width: auto; height: auto; max-height: 100%; max-width: 100%;" />
                                                        </div>
                                                        <div style="float: left; width: 65%;margin-top: 10px;">
                                                            <b style="font-size: large;"><%# Eval("InstName") %></b>
                                                            <br />
                                                            <%# Eval("Addressline") %>
                                                            <br />
                                                            <%# Eval("Phs") %>
                                                        </div>
                                                        <br />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                </td>
                                <td style="vertical-align: top">
                                    <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="float: right; margin-right: 45px; text-align: right; vertical-align: top;">
                                        <asp:DropDownList ID="ddAYear" runat="server" DataSourceID="dsAYear" DataTextField="SessionName" DataValueField="Session_ID" CssClass="bless hidden" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsAYear" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Session_ID, SessionName FROM tblED_Sessions WHERE (Session_ID = @fy)">
                                            <SelectParameters>
                                                <asp:CookieParameter CookieName="fy" Name="fy" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>


                                        Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                                        <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                    <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                                    Bank Transfer Voucher</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="text-align:center">
                                    <%--<select id="ddCampus" style="font-weight: bold;margin-left: 27px;"><option value="16">PPHI Head Office</option></select>--%>
                                                                            <asp:DropDownList ID="ddCampus" runat="server" DataSourceID="dsCampus" DataTextField="CampusName" DataValueField="CampusID" CssClass="bless" style="font-weight: bold;margin-left: 27px;" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsCampus" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CampusID, CampusName FROM tblCampus WHERE (CampusID IN (SELECT DISTINCT LocID FROM TblHResourcesLocations WHERE (User_ID = @User_ID))) AND (lvl &lt; 3) ORDER BY lvl, CampusName">
                                            <SelectParameters>
                                                <asp:CookieParameter CookieName="Emp_Id" Name="User_ID" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td style="text-align: right; margin-right: 100px; vertical-align: top;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 25px">&nbsp;</td>
                                <td colspan="2">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <%--<div id="JVNO" title="JV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Request.Cookies["br"].Value+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'JV%')")[0] %>" style="float: left; font-weight: bold; margin-left: 5px;">Voucher No. JV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Request.Cookies["br"].Value+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'JV%')")[0] %></div>--%>
                                                <%--<div id="JVNO" title="JV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Request.Cookies["br"].Value+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'JV%')")[0] %>" style="float: left; font-weight: bold; margin-left: 5px;">Voucher No. JV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Request.Cookies["br"].Value+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'JV%')")[0] %></div>--%>
                                                <div id="JVNO"  style="float: left; font-weight: bold; margin-left: 5px;"></div>
                                            </td>
                                            <td style="text-align: right">
                                                <strong>Date</strong> :<asp:TextBox ID="txDate" runat="server" Font-Size="11px" BorderStyle="None" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>
                                                <asp:CalendarExtender ID="txDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txDate" Format="dd MMMM yyyy">
                                                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style="text-align: right">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table style="border-collapse: collapse; table-layout: auto; border-bottom-style: solid; border-top-style: solid;" class="responsive table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="font-weight: 700; width: 579px;">Particulars</td>
                                                            <td style="width: 80px; text-align: right;">
                                                                <strong>Transfer To</strong></td>
                                                            <td style="width: 80px; text-align: right;"><strong>Transfer From</strong></td>
                                                            <td style="width: 20px; text-align: right;" class="hid">&nbsp;</td>
                                                            <td style="width: 20px; text-align: right;" class="hid">&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table id="test-table" style="border-collapse: collapse;" class="responsive table">
                                                    <tr>
                                                        <td style="width: 579px">
                                                            <input class="AcName" placeholder="Account Head" type="text" style="border-width: thin; width: 100%;  font-weight: bold;" />
                                                            <input class="Dsc" placeholder="description" type="text" value="" style="border-width: thin; width: 100%; font-size: x-small; " />
                                                            
                                                        </td>
                                                        <td style="width: 80px;vertical-align:top;">
                                                            <input class="Dr" type="text" style="width: 100%; text-align: right; border-width: thin;" /></td>
                                                        <td style="width: 80px;vertical-align:top;">
                                                            <input class="Cr" type="text" style="width: 100%; text-align: right; border-width: thin;" /></td>
                                                        <td style="width: 20px;" class="hid">
                                                            <input class="btAdd" type="button" style="background-image: url('./images/AdR.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;" /></td>
                                                        <td style="width: 20px;" class="hid">
                                                            <input class="btnrm" type="button" style="background-image: url('./images/close.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-top-style: dotted; border-top-width: thin;" colspan="2">
                                                <table id="test-table0" style="border-collapse: collapse;" class="responsive table">
                                                    <tr>
                                                        <td style="width: 189px">&nbsp;</td>
                                                        <td style="width: 390px">
                                                            <strong>Totals</strong></td>
                                                        <td style="width: 80px;vertical-align:top;">
                                                            <input id="txDrT" type="text" style="width: 100%; text-align: right; font-weight: bold;font-size: smaller;" readonly="readonly" /></td>
                                                        <td style="width: 80px;vertical-align:top;">
                                                            <input id="txCrT" type="text" style="width: 100%; text-align: right; font-weight: bold;font-size: smaller;" readonly="readonly" /></td>
                                                        <td style="width: 20px;" class="hid">&nbsp;</td>
                                                        <td style="width: 20px;" class="hid">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Voucher Description
                                <br />
                                                <input id="txJMemo" style="width: 98%" type="text" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                                <br />
                                                <br />
                                                <div id="btomline" style="display: none; text-align:right;">Prepared By: <%:Session["username"] %> <br /><br /><br />Checked By:_______________________<br /><br /><br />
  Verified By:_______________________<br /><br /><br />Approved By:_______________________</div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <table style="width: 84%; margin-left: 8px;">
                        <tr>
                            <td>
                                <div id="UpFiles" style="display: none; margin-right: 55px;">
                                    <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" OnUploadComplete="AjaxFileUpload1_UploadComplete" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnNewVoucher" runat="server" ClientIDMode="Static" CssClass="btn btn-info hidden" OnClick="btnNewVoucher_Click" Text="Add New Voucher" /><input type="button" id="btnSaveV" value="Save Voucher" class="btn btn-info" />&nbsp;<input type="button" id="btnprtP" value="Print Voucher" class="btn btn-info" style="display: none" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>

            </div>

        </div>
    </div>


    <%--<script type="text/javascript" src="JV.js"></script>--%>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        }); var xList, xList1;
        $(document).ready(function () {
            //Auto Fill Accounts
            var xList2;
            $.ajax({
                url: "accAccountsListBanks.ashx/?ID=" + $('#ddCampus').val() + "," + $('#AcYearID').attr("class"),
                context: document.body,
                success: function (responseText) {
                    //alert(xList[1]);
                    try {
                        xList = responseText.split('|');
                    } catch (e) {

                    }
                    try {
                        xList1 = xList[1].split('¦');
                    } catch (e) {

                    }
                    try {
                        xList2 = xList[0].split('¦');
                    } catch (e) {

                    }
                    //
                    //
                    //
                }
            });
            //auto compleate group
            $('.AcName').live('keypress', function (e) {
                $(".AcName").autocomplete({
                    source: function (request, response) {
                        var matches = $.map(xList2, function (tag) {
                            if (tag.toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                                return tag;
                            }
                        });
                        response(matches);
                    }
                });
            });
            //Dr. Cr. check
            $('.Dr').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
                if ($(this).val() == 0 || $(this).val() == "") {
                    $($(this).parent().next()[0].children[0]).removeAttr('readonly');
                } else { $($(this).parent().next()[0].children[0]).attr('readonly', 'readonly'); }
                SumUp();
            });
            $('.Cr').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
                if ($(this).val() == 0 || $(this).val() == "") {
                    $($(this).parent().prev()[0].children).removeAttr('readonly');
                } else { $($(this).parent().prev()[0].children).attr('readonly', 'readonly'); }
                SumUp();
            });
            $('#txDate').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
            });
            $('.Dsc').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
            });
            $('#txJMemo').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
            });
            //get account id

            $('.AcName').live('focusout', function (e) {
                var obj = $(this);
                $(this).attr("value", $(this).val());
                $(this).attr("tag", xList1[jQuery.inArray($(this).val(), xList2)])
                if ($(this).attr("tag") == "") { alertR("Invalid Account !"); }
            }); //end keypress
            $(".Cr").live('keypress paste', function (e) {
                if ((e.which == 46 && $(this).val().indexOf('.') == -1) || e.which == 0 || e.which == 8) {
                } else {
                    if (isNaN(String.fromCharCode(e.which))) {
                        return false;
                    }
                }
            });
            $(".Dr").live('keypress paste', function (e) {
                //alert(e.which);
                if ((e.which == 46 && $(this).val().indexOf('.') == -1) || e.which == 0 || e.which == 8) {
                } else {
                    if (isNaN(String.fromCharCode(e.which))) {
                        return false;
                    }
                }
            });
            $('.Cr:last').live('keypress', function (e) {
                if (e.which == 13) {
                    var row = '<tr>' + $('#test-table tr:last').html() + '</tr>';
                    $('#btnRmv').removeAttr('id');
                    $('#test-table tr:last').after(row);
                    $('#test-table tr:last td input').val('')
                    $('.AcName:last').focus();
                    $('.AcName:last').attr('tag', '');
                }
            });

            $('.btAdd:last').live('click keypress', function () {
                var row = '<tr>' + $('#test-table tr:last').html() + '</tr>';
                $('#btAd').hide();
                $('#btAd').removeAttr('id');

                $('#test-table tr:last').after(row);
                $('#test-table tr:last td input').val('');
                $('.AcName:last').focus();
                $('.AcName:last').attr('tag', '');
            });
            $('.btnrm').live('click', function () {
                if ($('#test-table tr').length > 1) {
                    $(this).parent().parent().remove()
                }
            });
            function SumUp() {
                var dataDr = 0;
                var dataCr = 0;
                $('.AcName').each(function () {
                    if ($(this).attr("tag") != "") {
                        var dd = $(this).parent().next().children(1).val().replace(/ /g, "");
                        var cc = $(this).parent().next().next().children(1).val().replace(/ /g, "");
                        if (cc == "") {
                            cc = 0;
                        }
                        if (dd == "") {
                            dd = 0;
                        }
                        dataDr = dataDr + parseFloat(dd);

                        dataCr = dataCr + parseFloat(cc);
                    }
                });
                $('#txCrT').val(dataCr);
                $('#txDrT').val(dataDr);
                $('#txDrT').attr("value", dataDr);
                $('#txCrT').attr("value", dataCr);
            }
            $('#btnprtP').click(function () {
                //var printContents = $('#Parea').html().toString();
                //var originalContents = document.body.innerHTML;
                //document.body.innerHTM=printContents;
                //window.print();
                //document.body.innerHTML = originalContents;
                $('#AcYearID').hide();
                $('.ui-helper-hidden-accessible').html('');
                //var content = $('#Parea').html().toString();
                //var pwin = window.open('', 'print_content', 'width=900,height=700');

                //pwin.document.open();

                //pwin.document.write('<html><body onload="window.print()">' + content + '</body><style type="text/css">.hidden{display:none;} input:disabled {background: #fff;color: #000;} input {border-width: 0px;background-color: white;}</style></html>');
                //pwin.document.close();

                //setTimeout(function () { pwin.close(); }, 1000);

                $('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#Parea").printArea(options);
                $('.NoPrnt').show();
                $('#AcYearID').show();
            });

            $('#btnSaveV').live('click',function () { //get data from table
                if (vdcheck()) {
                    SumUp();
                    var dataIN = '';
                    var dataDr = 0;
                    var dataCr = 0;
                    $('.AcName').each(function () {
                        if ($(this).attr("tag") != "") {
                            if ($(this).parent().next().children(1).val() == "") {
                                $(this).parent().next().children(1).val(0);
                            }
                            if ($(this).parent().next().next().children(1).val() == "") {
                                $(this).parent().next().next().children(1).val(0);
                            }
                            if ($($(this).parent().children('input')[1]).val() == "") {
                                $($(this).parent().children('input')[1]).val(' ');
                            }
                            dataDr = dataDr + parseFloat($(this).parent().next().children(1).val().replace(/ /g, ""));
                            dataCr = dataCr + parseFloat($(this).parent().next().next().children(1).val().replace(/ /g, ""));
                            dataIN = dataIN + "Ï" + $(this).attr("tag") + ',\'' + $($(this).parent().children('input')[1]).val().replace(/'/g, "‘") + '\',' + $(this).parent().next().children(1).val().replace(/ /g, "") + ',' + $(this).parent().next().next().children(1).val().replace(/ /g, "") + "," + $.cookie('UserID') + "Î";
                           // dataIN = dataIN + "Ï" + $(this).attr("tag") + ',\'' + $($(this).parent().children('.Dsc')[0]).val().replace(/'/g, "‘") + '\',' + $(this).parent().next().children(1).val().replace(/ /g, "") + ',' + $(this).parent().next().next().children(1).val().replace(/ /g, "") + "," + $.cookie('UserID') + "Î";
                            
                        }
                    });
                    if (dataDr != dataCr || dataCr == 0) {
                        alertR("Debit(" + dataDr + ") and Credit(" + dataCr + ") side are not equal …");
                        return false;
                    }
                    $.ajax({
                        url: "accpostJV.ashx/?ID=" + encodeURIComponent(dataIN + "¦" + $('#txDate').val() + "¦" + $('#JVNO').attr("title") + "¦" + $.cookie('UserID') + "¦" + $('#ddCampus').val() + "¦" + $('#txJMemo').val() + "¦" + $('#ddAYear').val() + "¦NULL¦"),
                        context: document.body,
                        success: function (responseText) {
                            if (responseText != "[]") {
                                var jdata = $.parseJSON(responseText);

                                $('#JVNO').attr('tag', jdata[0].Rid);
                                $.cookie("VID", jdata[0].Rid);
                                $('#UpFiles').show();
                                $('#JVNO').html('Voucher No. ' + jdata[0].vn);
                                $('#btomline').show();
                                $('#btnprtP').show();
                                $('.btAdd').hide();
                                $('.btnrm').hide();
                                $('#btnNewVoucher').removeClass('hidden');
                                $('#Parea').addClass("print-contant")
                                $('#Parea input').attr("disabled", true)
                                $('.ui-helper-hidden-accessible').html('');
                                $('.ajax__fileupload_selectFileButton').attr("class", "ButtonClass");
                                $('.ajax__fileupload_dropzone').html("Upload Supporting Documents");
                                $('#btnSaveV').hide();
                                $('input').each(function () { $(this).attr('placeholder', '') });
                                $('.Cr').each(function () {
                                    $(this).val($.number($(this).val(), 0));
                                    $(this).attr('value', $(this).val());
                                });



                                $('.Dr').each(function () {
                                    $(this).val($.number($(this).val(), 0));
                                    $(this).attr('value', $(this).val());
                                });
                                $('#txDrT').val($.number($('#txDrT').val(), 0));
                                $('#txDrT').attr('value', $('#txDrT').val());
                                $('#txCrT').val($.number($('#txCrT').val(), 0));
                                $('#txCrT').attr('value', $('#txCrT').val());
                                //$('.hid').hide();
                                alertG("Successfully Saved!");
                            }
                        }
                    });
                }
            });



            function GetVoucherNo() {
                $.ajax({
                    type: "POST",
                    url: "exeDataIMS.ashx/?ID=118ǁ" + $('#ddCampus').val(),
                    success: function (response) {
                        var jData = $.parseJSON(response), out = "";
                        $('#JVNO').attr('title', 'BT/' + jData[0].VNo);
                        $('#JVNO').html('Voucher No. BT/' + jData[0].VNo);
                    }
                });
            }
            GetVoucherNo();
            $('#ddCampus').live('change', function (e) {
                e.preventDefault();
                GetVoucherNo();
            });




        });//END OF DOC READY
        function vdcheck() {
            var chk = true;
            if ($('#txDate').val().substring(3) != $('#AcYearID').attr("tag")) {
                chk = false;
                alertR("Please select a valid date");
                $('#txDate').focus();
                return false;
            }

            $('.AcName').each(function () {
                if ($(this).attr("tag") == "") {
                    chk = false
                    alertR("Please enter account title ...");
                }
            });
            return chk;
        }
    </script>
</asp:Content>
