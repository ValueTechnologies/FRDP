<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accTB.aspx.cs" Inherits="FRDP.accTB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Trial.css" rel="stylesheet" />
    <style type="text/css">
        .oDr, .oCr, .cDr, .cCr, .tDr, .tCr
{
font-size: smaller;
}

    </style>

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Trial Balance Report</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<%--=====================--%>
    <div style="margin-left: 10px; margin-top: 10px">

        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Search Parameters</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan="3">
                        <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <strong>Dates between</strong></td>
                </tr>
                <tr>
                    <td style="width: 50px">From :</td>
                    <td colspan="2">
                        <asp:TextBox ID="txFrom" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <asp:CalendarExtender ID="txFrom_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom">
                        </asp:CalendarExtender>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    To :
                        <asp:TextBox ID="txTo" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <asp:CalendarExtender ID="txTo_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txTo">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2">
                        <input id="btnView" class="btn btn-info" type="button" value="Show Trial" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr id="custChks" style="display: none">
                    <td></td>
                    <td style="width: 150px">
                        <input id="chkHead" type="checkbox" checked="checked" /><label for="chkHead">Level-I</label>
                        <input id="chkGrp" type="checkbox" checked="checked" /><label for="chkGrp">Level-II</label>
                    </td>
                    <td>
                        <input id="chkSubG" type="checkbox" checked="checked" /><label for="chkSubG">Level-III</label>
                        <input id="chkAcc" type="checkbox" checked="checked" /><label for="chkAcc">Level-IV</label></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="tab0"></div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div id="Parea" class="pcontant" style="width: 100%">
            <table style="width: 100%;">
                <tr>
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
                    <td>
                        <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="float: right; margin-right: 6px; text-align: right; vertical-align: top;">
                            Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                            <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">Trial Balance</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="btwDates" style="text-align: left">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table class="tbl" style="font-weight: bold; border-right-width: thin; border-bottom-width: thin; border-left-width: thin; background-color: #FFFFFF; width: 100%; border-collapse: collapse;" id="tdTop">
                            <tbody>
                                <tr class="AcCode">
                                    <th class="Ac-Code" rowspan="2" style="border: thin solid #000000; background-color: #C0C0C0;">Ac Code</th>
                                    <th class="Ac-Name" rowspan="2" style="border: thin solid #000000; background-color: #C0C0C0; width: 233px;">Account Title</th>
                                    <th colspan="2" style="border: thin solid #000000; text-align: center; background-color: #C0C0C0;">Opening Balance</th>
                                    <th colspan="2" style="border: thin solid #000000; text-align: center; background-color: #C0C0C0;">Currant Priod</th>
                                    <th colspan="2" style="border: thin solid #000000; text-align: center; background-color: #C0C0C0;">Closing Balance</th>
                                </tr>
                                <tr class="AcCode">
                                    <th style="border: thin solid #000000; text-align: center; width: 80px; background-color: #C0C0C0;">Debit</th>
                                    <th style="border: thin solid #000000; text-align: center; width: 80px; background-color: #C0C0C0;">Credit</th>
                                    <th style="border: thin solid #000000; text-align: center; width: 80px; background-color: #C0C0C0;">Debit</th>
                                    <th style="border: thin solid #000000; text-align: center; width: 80px; background-color: #C0C0C0;">Credit</th>
                                    <th style="border: thin solid #000000; text-align: center; width: 80px; background-color: #C0C0C0;">Debit</th>
                                    <th style="border: thin solid #000000; text-align: center; width: 80px; background-color: #C0C0C0;">Credit</th>
                                </tr>
                                <tr>
                                    <td colspan="8">
                                        <div id="trialsheet"></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: right; margin-right: 100px; vertical-align: top;">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <br />
                                    <div id="btomline">
                                        Print By: <%:Session["username"]%>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div style="margin-left: 6px;">
            <input type="button" id="btnprtP" value="Print Report" class="btn btn-info" />
        </div>
    </div>
    <div id="temp" style="display: none"></div><br />
<%--===========================--%>
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
            });
            $(document).ready(function () {
                $('.tbl').fixedtableheader({
                    headerrowsize: 2
                });
                $("#chkGrp").live('click', function (e) { $('.tAcGroup').slideToggle('slow'); });
                $("#chkSubG").live('click', function (e) { $('.tAcSubG').slideToggle('slow'); });
                $("#chkAcc").live('click', function (e) { $('.tblAc').slideToggle('slow'); });
                $("#chkHead").live('click', function (e) { $('.tAcHead').slideToggle('slow'); });

                $(".tAcHead").live('click', function (e) { $($(this).next()).slideToggle('slow'); });
                $(".tAcGroup").live('click', function (e) { $($(this).next()).slideToggle('slow'); });
                $(".tAcSubG").live('click', function (e) {
                    $($(this).next()).slideToggle('slow');
                });

                $('#custChks').hide();
                $('#Parea').hide();
                $('#btnprtP').hide();
                $('#btnView').click(function () {
                    $.ajax({
                        url: "accTrilB.ashx/?ID=" + $.cookie('br') + "|" + $('#txFrom').val() + "|" + $('#txTo').val() + "|" + $.cookie('fy'),
                        context: document.body,
                        success: function (responseText) {
                            $('#custChks').show();
                            $('#Parea').show('slow');
                            $('#btnprtP').show();
                            $('#trialsheet').html(responseText);
                            for (var i = 0; i < $('.oDr').length; i++) {
                                if ($('.oDr')[i].innerHTML != "0") {
                                    $('.oDr')[i].innerHTML = $.number($('.oDr')[i].innerHTML, 0);
                                } else { $('.oDr')[i].innerHTML = ""; }

                                if ($('.oCr')[i].innerHTML != "0") {
                                    $('.oCr')[i].innerHTML = $.number($('.oCr')[i].innerHTML, 0);
                                } else { $('.oCr')[i].innerHTML = ""; }

                                if ($('.cDr')[i].innerHTML != "0") {
                                    $('.cDr')[i].innerHTML = $.number($('.cDr')[i].innerHTML, 0);
                                } else { $('.cDr')[i].innerHTML = ""; }

                                if ($('.cCr')[i].innerHTML != "0") {
                                    $('.cCr')[i].innerHTML = $.number($('.cCr')[i].innerHTML, 0);
                                } else { $('.cCr')[i].innerHTML = ""; }

                                if ($('.tDr')[i].innerHTML != "0") {
                                    $('.tDr')[i].innerHTML = $.number($('.tDr')[i].innerHTML, 0);
                                } else { $('.tDr')[i].innerHTML = ""; }

                                if ($('.tCr')[i].innerHTML != "0") {
                                    $('.tCr')[i].innerHTML = $.number($('.tCr')[i].innerHTML, 0);
                                } else { $('.tCr')[i].innerHTML = ""; }
                            }
                            $($('.tAcSubG').next()).hide();
                            $($('.tAcGroup').next()).hide();
                            $('#btwDates').html("Dates between " + $('#txFrom').val() + " and " + $('#txTo').val());
                        }
                    });

                    $('#Parea').show();
                    $('#btnprtP').show();
                });
                
                $('#btnprtP').click(function () {
                    var content = $('#Parea').html().toString();
                    var pwin = window.open('', 'print_content', 'width=1000,height=700');

                    pwin.document.open();

                    pwin.document.write('<html><link href="Trial.css" rel="stylesheet" /><body onload="window.print()"><div style="width:125%;">' + content + '</div></body><style type="text/css"> input {border-width: 0px;background-color: white;}</style></html>');
                    pwin.document.close();

                    setTimeout(function () { pwin.close(); }, 1000);
                });
                $('.V').live('click', function (e) {
                    if ($(this).attr('id') != "0") {
                        $.cookie("VoucherID", $(this)[0].id.toString());
                        //$('.temp').empty();
                        $('#temp').load("/DrillThV.aspx #Parea", function () {
                            ///////////////////////////////////////////////
                            var dataDr = 0;
                            var dataCr = 0;
                            $('.drR').each(function () {
                                var dd = $(this).children()[0].innerHTML.replace(',', '');
                                var cc = $(this).next().children()[0].innerHTML.replace(',', '');
                                if ((cc == ".00") || (cc == "")) {
                                    cc = 0;
                                    $(this).next().children()[0].innerHTML = "";
                                }
                                if ((dd == ".00") || (dd == "")) {
                                    dd = 0;
                                    $(this).children()[0].innerHTML = "";
                                }
                                dataDr = dataDr + parseFloat(dd);
                                dataCr = dataCr + parseFloat(cc);
                            });
                            $('#txCrT')[0].innerHTML = $.number(dataCr, 0);
                            $('#txDrT')[0].innerHTML = $.number(dataDr, 0);
                            ////////////////////////////////////////////////
                            $("<div class='temp' title='Institute-MIS'>" + $('#temp').html() + "</div>").dialog({
                                modal: true,
                                width: 600,
                                show: {
                                    effect: "drop",
                                    duration: 500,
                                    direction: "up"
                                },
                                hide: {
                                    effect: "drop",
                                    duration: 500,
                                    direction: "up"
                                },
                                buttons: {
                                    Close: function () {
                                        $(this).dialog("close");
                                    }
                                }
                            });
                        });

                        //window.open("/DrillThV.aspx");
                    }
                });
            });
            runat();
            function runat() {
                ////////////////////////Stoped for PPHI Presentation by xxx
                $('.AcCodexxx').live('click', function (e) {
                    if ($(this).attr('id') > 0) {
                        $.cookie("LgId", $(this).attr('id'));
                        decodeURIComponent($.cookie("lgNam", $(this).find('.Ac-Name').text()));
                        decodeURIComponent($.cookie("dt1", $('#txFrom').val()));
                        decodeURIComponent($.cookie("dt2", $('#txTo').val()));
                        $('.temp').empty();
                        $('#temp').load("./accGL.aspx #Parea", function () {
                            $("<div class='temp' title='FRDP-MIS'>" + $('#temp').html() + "</div>").dialog({
                                modal: true,
                                width: 800,
                                show: {
                                    effect: "drop",
                                    duration: 500,
                                    direction: "up"
                                },
                                hide: {
                                    effect: "drop",
                                    duration: 500,
                                    direction: "up"
                                },
                                buttons: {
                                    Close: function () {
                                        $(this).dialog("close");
                                        $.cookie("LgId", 0);
                                    }
                                }
                            });
                        });
                    }
                });
            }
        </script>
   
</asp:Content>