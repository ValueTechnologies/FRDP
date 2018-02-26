<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accCV.aspx.cs" Inherits="FRDP.accCV" %>

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
                        <span>Cash Voucher</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table id="rdBtn" style="width: 100%;">
                        <tr>
                            <td></td>
                            <td colspan="2" class="tdTitle">
                                <%--<asp:SqlDataSource ID="dsCampus" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT [CampusID], [CampusName] FROM [tblCampus]"></asp:SqlDataSource>--%>
                                <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr id="AcYearIDx">
                            <td>&nbsp;</td>
                            <td style="width: 250px">
                                <input name="typ" id="rdPay" type="radio" checked="checked" /><label for="rdPay">Cash Payment Voucher</label></td>
                            <td>
                                <input name="typ" id="rdRec" type="radio" /><label for="rdRec">Cash Receipt Voucher</label></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <div id="Parea" class="pcontant">
                        <table style="width: 98%;">
                            <tr>
                                <td></td>
                                <td>
                                    <asp:DetailsView ID="dvCompany" runat="server" AutoGenerateRows="False" BorderStyle="None" DataSourceID="dsComp" GridLines="None" Height="50px" Width="98%">
                                        <Fields>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <div>
                                                        <div id="CompID" style="float: left; text-align: center; width: 90px; height: 80px;">
                                                            <img alt='<%# Eval("InstName") %>' src="<%# Eval("Logo")%>" style="width: auto; height: auto; max-height: 100%; max-width: 100%;" />
                                                        </div>
                                                        <div style="float: left; width: 65%; margin-top: 10px;">
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
                                <td>
                                    <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="float: right; margin-right: 45px; text-align: right; vertical-align: top;">
                                        <asp:DropDownList ID="ddAYear" runat="server" DataSourceID="dsAYear" DataTextField="SessionName" DataValueField="Session_ID" CssClass="bless hidden" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsAYear" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Session_ID, SessionName FROM tblED_Sessions WHERE (Session_ID = @fy)">
                                            <SelectParameters>
                                                <asp:CookieParameter CookieName="fy" Name="fy" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <%--<asp:DropDownList ID="ddCampus" runat="server" DataSourceID="dsCampus" DataTextField="CampusName" DataValueField="CampusID" CssClass="bless hidden" BorderStyle="None" ClientIDMode="Static"></asp:DropDownList>--%>
                        Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                                        <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">Cash Voucher</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                    <%--<select id="ddCampus" style="font-weight: bold;margin-left: 27px;"><option value="16">PPHI Head Office</option></select>--%>
                                    <asp:DropDownList ID="ddCampus" runat="server" DataSourceID="dsCampus" DataTextField="CampusName" DataValueField="CampusID" CssClass="bless" Style="font-weight: bold; margin-left: 27px;" ClientIDMode="Static">
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
                                <td>&nbsp;</td>
                                <td colspan="2">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <div id="JVNO" title="CPV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Request.Cookies["br"].Value+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'CPV%')")[0] %>" style="float: left; font-weight: bold;">Voucher No. CPV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Request.Cookies["br"].Value+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'CPV%')")[0] %></div>
                                            </td>
                                            <td style="text-align: right">
                                                <strong>Date</strong> :<asp:TextBox ID="txDate" runat="server" Font-Size="11px" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>
                                                <asp:CalendarExtender ID="txDate_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txDate">
                                                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style="text-align: right">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>Cash Account<strong>:</strong>
                                                <asp:DropDownList ID="ddBanks" runat="server" Width="384px" DataSourceID="dsBanks" DataTextField="titl" DataValueField="AcID" ClientIDMode="Static">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="dsBanks" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AcListwBls" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="16" Name="compID" Type="Int32" />
                                                        <asp:Parameter DefaultValue="2" Name="AcTyp" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td style="text-align: right">
                                                <strong>
                                                    <asp:TextBox ID="txCheqNo" runat="server" CssClass="hidden" ClientIDMode="Static"></asp:TextBox>
                                                </strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span id="psource">Payee :</span>
                                                <input id="txPayee" type="text" style="width: 81.5%;" /></td>
                                            <td style="text-align: right">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table style="border-collapse: collapse; table-layout: auto; border-bottom-style: solid; border-top-style: solid;" class="responsive table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="font-weight: 700; width: 189px;">Account Head</td>
                                                            <td style="width: 390px">
                                                                <strong>Narration</strong></td>
                                                            <td style="width: 80px; text-align: center;"><strong>
                                                                <div id="drcr">Amount</div>
                                                            </strong></td>
                                                            <td style="width: 20px; text-align: right;">&nbsp;</td>
                                                            <td style="width: 20px; text-align: center;">&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table id="test-table" style="border-collapse: collapse;" class="responsive table">
                                                    <tr>
                                                        <td style="width: 189px">
                                                            <input class="AcName" type="text" style="width: 100%" /></td>
                                                        <td style="width: 390px">
                                                            <input class="Dsc" type="text" value="" style="width: 100%" /></td>
                                                        <td style="width: 80px;">
                                                            <input class="Cr" type="text" style="width: 100%; text-align: right;" /></td>
                                                        <td style="width: 20px;">
                                                            <input class="btAdd" type="button" style="background-image: url('./images/AdR.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;" /></td>
                                                        <td style="width: 20px;">
                                                            <input class="btnrm" type="button" style="background-image: url('./images/close.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table id="test-table0" style="border-collapse: collapse; border-top-style: dotted;" class="responsive table">
                                                    <tr>
                                                        <td style="width: 189px">&nbsp;</td>
                                                        <td style="width: 390px">
                                                            <strong>Totals</strong></td>
                                                        <td style="width: 80px;">
                                                            <input id="txDrT" type="text" style="width: 100%; text-align: right; font-weight: bold;font-size: smaller;" readonly="readonly" /></td>
                                                        <td style="width: 20px;">&nbsp;</td>
                                                        <td style="width: 20px;">&nbsp;</td>
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
                                                <div id="btomline" style="display: none;text-align:right;">Prepared By: <%:Session["username"] %> <br /><br /><br />Checked By:_______________________<br /><br /><br />
  Verified By:_______________________<br /><br /><br />Approved By:_______________________</div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <table style="width: 100%; margin-left: 15px;">
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


    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        }); var xList, xList1;
        $(document).ready(function () {
            $.ajax({
                url: "accContactList.ashx/?ID=" + $('#ddCampus').val(),
                context: document.body,
                success: function (responseText) {
                    $('#txPayee').live('keypress', function (e) {
                        $("#txPayee").autocomplete({
                            source: function (request, response) {
                                var matches = $.map(responseText.split('|'), function (tag) {
                                    if (tag.toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                                        return tag;
                                    }
                                });
                                response(matches);
                            }
                        });
                    });
                }
            });
            $('#rdPay').change(function () {
                if ($('#rdPay').attr("checked") == "checked") {
                    $.ajax({
                        url: "accgetVNo.ashx/?ID=" + $('#ddCampus').val() + "|" + $('#AcYearID').attr("tag") + "|CPV",
                        context: document.body,
                        success: function (responseText) {
                            $('#JVNO')[0].innerHTML = "Voucher No. " + responseText;
                            $('#JVNO')[0].title = responseText;
                            $('#drcr')[0].innerHTML = "Dr.";
                            $('#psource').html('Payee :');
                            $('.art-content').css('background', 'none');
                        }
                    });
                }
            });
            $('#rdRec').change(function () {
                if ($('#rdRec').attr("checked") == "checked") {
                    $.ajax({
                        url: "accgetVNo.ashx/?ID=" + $('#ddCampus').val() + "|" + $('#AcYearID').attr("tag") + "|CRV",
                        context: document.body,
                        success: function (responseText) {
                            $('#JVNO')[0].innerHTML = "Voucher No. " + responseText;
                            $('#JVNO')[0].title = responseText;
                            $('#drcr')[0].innerHTML = "Cr.";
                            $('#psource').html('Source:');
                            $('.art-content').css('background', 'rgba(0, 255, 3, 0.09)').css('border-radius', '0 220px 0 0');
                        }
                    });
                }
            });
            //Auto Fill Accounts
            var xList2;
            $.ajax({
                url: "accAccountsList.ashx/?ID=" + $('#ddCampus').val() + "," + $('#AcYearID').attr("class"),
                context: document.body,
                success: function (responseText) {
                    xList = responseText.split('|');
                    xList1 = xList[1].split('¦');
                    xList2 = xList[0].split('¦');
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
            //$('.Dr').live('focusout', function (e) {
            //    $(this).attr("value", $(this).val());
            //    if ($(this).val() == 0 || $(this).val() == "") {
            //        $($(this).parent().next()[0].children[0]).removeAttr('readonly');
            //    } else { $($(this).parent().next()[0].children[0]).attr('readonly', 'readonly'); }
            //    SumUp();
            //});
            $('.Cr').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
                //if ($(this).val() == 0 || $(this).val() == "") {
                //    $($(this).parent().prev()[0].children).removeAttr('readonly');
                //} else { $($(this).parent().prev()[0].children).attr('readonly', 'readonly'); }
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
            //$(".Dr").live('keypress paste', function (e) {
            //    //alert(e.which);
            //    if ((e.which == 46 && $(this).val().indexOf('.') == -1) || e.which == 0 || e.which == 8) {
            //    } else {
            //        if (isNaN(String.fromCharCode(e.which))) {
            //            return false;
            //        }
            //    }
            //});
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
                        var dd = $(this).parent().next().next().children(1).val().replace(/ /g, "");
                        //var cc = $(this).parent().next().next().next().children(1).val().replace(/ /g, "");
                        //if (cc == "") {
                        //    cc = 0;
                        //}
                        if (dd == "") {
                            dd = 0;
                        }
                        dataDr = dataDr + parseFloat(dd);

                        //$('#txCrT').attr("value", dataCr);
                        //dataCr = dataCr + parseFloat(cc);
                    }
                });
                //$('#txCrT').val(dataCr);
                $('#txDrT').val(dataDr);
                $('#txDrT').attr("value", dataDr);
            }
            $('#btnprtP').click(function () {
                //var printContents = $('#Parea').html().toString();
                //var originalContents = document.body.innerHTML;
                //document.body.innerHTM=printContents;
                //window.print();
                //document.body.innerHTML = originalContents;
                $('#AcYearID').hide();
                $('#AcYearIDx').hide();


                $('#txCheqNo').attr("value", $('#txCheqNo').val());
                $('.ui-helper-hidden-accessible').html('');
                var content = $('#Parea').html().toString();
                var pwin = window.open('', 'print_content', 'width=900,height=700');

                pwin.document.open();

                pwin.document.write('<html><body onload="window.print()">' + content + '</body><style type="text/css">.hidden{display:none;} input:disabled {background: #fff;color: #000;} input {border-width: 0px;background-color: white;}</style></html>');
                pwin.document.close();

                setTimeout(function () { pwin.close(); }, 1000);
            });

            $('#btnSaveV').click(function () { //get data from table
                if (vdcheck()) {
                    SumUp();
                    var dataIN = '';
                    var dataDr = 0;
                    var Decs = '';
                    var dataCr = 0;
                    $('.AcName').each(function () {
                        if ($(this).attr("tag") != "") {
                            //if ($(this).parent().next().next().children(1).val() == "") {
                            //    $(this).parent().next().next().children(1).val(0);
                            //}
                            if ($('#rdPay').attr("checked") == "checked") {
                                dataIN = dataIN + "Ï" + $(this).attr("tag") + ',\'' + $(this).parent().next().children(1).val().replace(/'/g, "‘") + '\',' + $(this).parent().next().next().children(1).val().replace(/ /g, "") + ',0,' + $.cookie('UserID') + 'Î';
                            }
                            if ($('#rdRec').attr("checked") == "checked") {
                                dataIN = dataIN + "Ï" + $(this).attr("tag") + ',\'' + $(this).parent().next().children(1).val().replace(/'/g, "‘") + '\',0,' + $(this).parent().next().next().children(1).val().replace(/ /g, "") + ',' + $.cookie('UserID') + 'Î';
                            }
                            //if ($(this).parent().next().next().next().children(1).val() == "") {
                            //    $(this).parent().next().next().next().children(1).val(0);
                            //}
                            if ($(this).parent().next().children(1).val() == "") {
                                $(this).parent().next().children(1).val(' ');
                            }
                            $('#txPayee').attr("value", $('#txPayee').val());
                            Decs = Decs + $(this).parent().next().children(1).val().replace(/'/g, "‘") + ',';
                            dataDr = dataDr + parseFloat($(this).parent().next().next().children(1).val().replace(/ /g, ""));
                            //dataCr = dataCr + parseFloat($(this).parent().next().next().next().children(1).val().replace(/ /g, ""));
                        }
                    });

                    //if (dataDr != dataCr || dataCr == 0) {
                    //    alert("Debit(" + dataDr + ") and Credit(" + dataCr + ") side are not equal …");
                    //    return false;
                    //}
                    if ($('#rdPay').attr("checked") == "checked") {
                        dataIN = dataIN + "Ï" + $('#ddBanks').val() + ',\'' + Decs + '\',0,' + dataDr + "," + $.cookie('UserID') + "Î";
                    }
                    if ($('#rdRec').attr("checked") == "checked") {
                        dataIN = dataIN + "Ï" + $('#ddBanks').val() + ',\'' + Decs + '\',' + dataDr + ",0," + $.cookie('UserID') + "Î";
                    }
                    $.ajax({
                        url: "accpostJV.ashx/?ID=" + dataIN + "¦" + $('#txDate').val() + "¦" + $('#JVNO').attr("title") + "¦" + $.cookie('UserID') + "¦" + $('#ddCampus').val() + "¦" + $('#txJMemo').val() + "¦" + $.cookie('fy') + "¦" + $('#txCheqNo').val() + "¦" + $('#txPayee').val(),
                        context: document.body,
                        success: function (responseText) {
                            if (responseText != "[]") {
                                $('#ddBanks').parent().html('<strong style="font-size: 16px;">Cash Account : ' + document.getElementById("ddBanks").options[document.getElementById('ddBanks').selectedIndex].text) + '</strong>';
                                var jdata = $.parseJSON(responseText);
                                $.cookie("VID", jdata[0].Rid);
                                $('#JVNO').attr('tag', jdata[0].Rid);
                                $('#JVNO').html('Voucher No. ' + jdata[0].vn);
                                $('#UpFiles').show();
                                $('#btomline').show();
                                $('#btnprtP').show();
                                $('.btAdd').hide();
                                $('.btnrm').hide();
                                $('#btnNewVoucher').removeClass('hidden');
                                $('#Parea').addClass("print-contant")
                                $('#Parea input').attr("disabled", true)
                                $('.ui-helper-hidden-accessible').html('');
                                $('.ajax__fileupload_selectFileButton').attr("class", "ButtonClass");
                                $('#rdBtn').hide();
                                $('.ajax__fileupload_dropzone')[0].innerHTML = "Upload Supporting Documents";
                                $('#btnSaveV').hide();
                                $('.Cr').each(function () {
                                    $(this).val($.number($(this).val(), 0));
                                    $(this).attr('value', $(this).val());
                                });
                                $('#txDrT').val($.number($('#txDrT').val(), 0));
                                $('#txDrT').attr('value', $('#txDrT').val());
                                //alert("Successfully Saved!");
                            }
                        }
                    });
                }
            });
            function GetVoucherNo() {
                if ($('#rdPay').attr("checked") == "checked") {
                    $.ajax({
                        url: "accgetVNo.ashx/?ID=" + $('#ddCampus').val() + "|" + $('#AcYearID').attr("tag") + "|CPV",
                        context: document.body,
                        success: function (responseText) {
                            $('#JVNO')[0].innerHTML = "Voucher No. " + responseText;
                            $('#JVNO')[0].title = responseText;
                            $('#drcr')[0].innerHTML = "Dr.";
                            $('#psource').html('Payee :');
                            $('.art-content').css('background', 'none');
                        }
                    });
                }
                if ($('#rdRec').attr("checked") == "checked") {
                    $.ajax({
                        url: "accgetVNo.ashx/?ID=" + $('#ddCampus').val() + "|" + $('#AcYearID').attr("tag") + "|CRV",
                        context: document.body,
                        success: function (responseText) {
                            $('#JVNO')[0].innerHTML = "Voucher No. " + responseText;
                            $('#JVNO')[0].title = responseText;
                            $('#drcr')[0].innerHTML = "Cr.";
                            $('#psource').html('Source:');
                            $('.art-content').css('background', 'rgba(0, 255, 3, 0.09)').css('border-radius', '0 220px 0 0');
                        }
                    });
                }
            }
            GetVoucherNo();
            $('#ddCampus').live('change', function (e) {
                e.preventDefault();
                GetVoucherNo();
            });
        });// END OF DOC READY
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
