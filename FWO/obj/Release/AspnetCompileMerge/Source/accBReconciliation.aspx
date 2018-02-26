<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accBReconciliation.aspx.cs" Inherits="FRDP.accBReconciliation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><%:Session["fy"] %></div>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>General Ledgers</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <%--=====================--%><br />
                    <div style="margin-left: 10px; margin-top: 10px">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Search Parameters</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <table style="width: 100%;">
                                <tr>
                                    <td colspan="2">
                                        <strong>Dates between</strong></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">From :</td>
                                    <td>
                                        <asp:TextBox ID="txFrom" ClientIDMode="Static" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="txFrom_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom">
                                        </asp:CalendarExtender>
                                        To :<asp:TextBox ID="txTo" ClientIDMode="Static" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="txTo_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txTo">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Bank :</td>
                                    <td>
                                        <%--                                        <asp:DropDownList ID="ddLadgers" runat="server" DataSourceID="dsAccList" DataTextField="AcName" DataValueField="AcID" Width="322px">

                                        </asp:DropDownList>--%>
                                        <asp:DropDownList ID="ddLadgers" runat="server" Width="303px" DataSourceID="dsBanks" DataTextField="titl" DataValueField="AcID" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsBanks" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AcListwBls" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="16" Name="compID" Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="AcTyp" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnView" runat="server" CssClass="btn btn-info" Text="Select" OnClick="btnView_Click" />
                                        <asp:SqlDataSource ID="dsAccList" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT AcID, AcName FROM tblChartAc WHERE (CompID = 16) ORDER BY AcName"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab0"></div>
                        <br />
                        <div id="Parea" class="pcontant" style="width: 100%">
                            <table style="width: 100%;">
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
                                                            <div style="float: left; width: 70%; margin-top: 10px;">
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
                                        <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="display: none; float: right; margin-right: 6px; text-align: right; vertical-align: top;">
                                            Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                                            <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">Bank Reconciliation</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2" style="text-align: left; font-variant: small-caps; font-size: large; font-weight: bold;">
                                        <asp:Label ID="lblLadgerName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2">
                                        <asp:Label ID="lblDates" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <%--                                    <td>&nbsp;</td>
                                    <td colspan="2" style="text-align: right; padding-right: 135px;font-variant: small-caps; font-size: large; font-weight: bold;"><strong>Opening Balance as per Cashbook / Ledger: </strong><input id="spnOpeningBalance" class="Integer" value="0" type="text" /></td>
                                    --%>
                                    <td colspan="3">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td style="font-variant: small-caps; font-size: large; font-weight: bold;">&nbsp;</td>
                                                <td style="text-align: right; font-variant: small-caps; font-size: large; font-weight: bold; padding-right: 7.5%;">
                                                   Opening Balance as per Cashbook / Ledger:  <input id="spnOpeningBalance" style="width: 100px; font-size: small; text-align: center;"
                                                        class="Integer" value="0" type="text" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2">
                                        <div id="Lctnt">
                                            <%--///////////////////////--%>
                                            <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                                                &nbsp;<div class="tab1" style="float: left">&nbsp;<strong>Add</strong>:- Unpresented Cheques / Deposits</div>
                                                <div class="tab2">&nbsp;</div>
                                            </div>
                                            <div style="margin-bottom: 20px;">
                                                <table id="tblAdd" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4; border-top: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;">
                                                    <thead>
                                                        <tr>
                                                            <th style="text-align: center; width: 115px;">Date</th>
                                                            <th style="text-align: center; width: 115px;">Ch #/PO#/Ref #</th>
                                                            <th>Description</th>
                                                            <th style="text-align: center; width: 115px;">Amount</th>
                                                            <th class="NoPrnt"></th>
                                                        </tr>
                                                        <tr class="NoPrnt">
                                                            <th>
                                                                <input tg="add" type="text" class="txtDate clean" style="width: 100px;" value="" />
                                                            </th>
                                                            <th>
                                                                <input tg="add" type="text" class="txtChNo clean" style="width: 100px;" value="" />
                                                            </th>

                                                            <th>
                                                                <input tg="add" type="text" class="txtDesc clean" style="width: 96%;" value="" />
                                                            </th>
                                                            <th>
                                                                <input tg="add" type="text" class="Integer txtAmnt clean" style="width: 100px; font-size:small;" value="" />
                                                            </th>
                                                            <th style="width: 26px;">
                                                                <button tg="add" type="button" class="btn btn-info btnAdd" style="margin-bottom: 9px;">+ </button>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody tg="add"></tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th colspan="3" style="text-align: center"><strong>Total</strong></th>
                                                            <th class="hnumber" tg="add" style="text-align: center;">0</th>
                                                            <th class="NoPrnt"></th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                            <%--END OF tab0--%>
                                            <%--/////////////////////////////--%>

                                            <%--///////////////////////--%>
                                            <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                                                &nbsp;<div class="tab1" style="float: left">&nbsp;<strong>Less</strong>:- Uncredited Cheques / Bank Charges</div>
                                                <div class="tab2">&nbsp;</div>
                                            </div>
                                            <div style="margin-bottom: 20px;">
                                                <table id="tblLess" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4; border-top: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;">
                                                    <thead>
                                                        <tr>
                                                            <th style="text-align: center; width: 115px;">Date</th>
                                                            <th style="text-align: center; width: 115px;">Ch #/PO#/Ref #</th>
                                                            <th>Description</th>
                                                            <th style="text-align: center; width: 115px;">Amount</th>
                                                            <th class="NoPrnt"></th>
                                                        </tr>
                                                        <tr class="NoPrnt">
                                                            <th>
                                                                <input tg="less" type="text" class="txtDate clean" style="width: 100px;" value="" />
                                                            </th>
                                                            <th>
                                                                <input tg="less" type="text" class="txtChNo clean" style="width: 100px;" value="" />
                                                            </th>

                                                            <th>
                                                                <input tg="less" type="text" class="txtDesc clean" style="width: 96%;" value="" />
                                                            </th>
                                                            <th>
                                                                <input tg="less" type="text" class="Integer txtAmnt clean" style="width: 100px; font-size:small;" value="" />
                                                            </th>
                                                            <th style="width: 26px;">
                                                                <button tg="less" type="button" class="btn btn-info btnAdd" style="margin-bottom: 9px;">+ </button>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody tg="less"></tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th colspan="3" style="text-align: center"><strong>Total</strong></th>
                                                            <th class="hnumber" tg="less" style="text-align: center;">0</th>
                                                            <th class="NoPrnt"></th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                            <%--END OF tab0--%>
                                            <%--/////////////////////////////--%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td style="font-variant: small-caps; font-size: large; font-weight: bold;">&nbsp</td>
                                                <td style="text-align: right; font-variant: small-caps; font-size: large; font-weight: bold; padding-right: 10.5%;">End Balance as per Bank Statement : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="finalAmnt" class="hnumber">0</span></td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <div id="temp" style="display: none"></div>
                                    </td>
                                    <td style="text-align: right; margin-right: 100px; vertical-align: top;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2">
                                        <table class="showthis" style="display: none; width: 100%;">
                                            <tr>
                                                <td>
                                                    <%-- <br />
                                                    <div id="btomline">
                                                        Print By: <%:Session["username"]%>
                                                    </div>--%>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <div id="btomline">
                                                        Prepared By: <%:Session["username"] %>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        Checked By:_______________________<br />
                                                        <br />
                                                        <br />
                                                        Verified By:_______________________<br />
                                                        <br />
                                                        <br />
                                                        Approved By:_______________________
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <input type="button" id="btnSave" value="Save" class="btn btn-info" style="margin-right: 45px;" />
                            <input type="button" id="btnprtP" value="Print" class="showthis btn btn-info" style="display: none; margin-right: 45px;" />
                        </div>
                    </div>
                    <%--=====================--%><br />
                </div>

            </div>

        </div>
    </div>
    <script type="text/javascript" src="plugins/misc/jquery.PrintArea.js"></script>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {

            $(function () {
                if (true) {

                }
                $.ajax({
                    type: "POST",
                    url: "exeDataIMS.ashx/?ID=119ǁ" + $('#ddLadgers').val() + "ǁ" + $('#txFrom').val(),
                    success: function (response) {
                        try {
                            var jd = $.parseJSON(response);
                            $('#spnOpeningBalance').val(jd[0].bf);
                        } catch (e) {
                            $('#spnOpeningBalance').val("0");
                        }
                    }
                });

            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                //After Save
                $('.showthis').show();
                $(this).hide();

                $('.hnumber').each(function (index, element) {
                    var $this = $(this);
                    var num = $.number($this.html(), 0)
                    $this.html(num);
                });
                $('#spnOpeningBalance').val($.number($('#spnOpeningBalance').val(), 0));
            });
            $('#btnprtP').click(function () {
                ////////var printContents = $('#Parea').html().toString();
                ////////var originalContents = document.body.innerHTML;
                ////////document.body.innerHTM=printContents;
                ////////window.print();
                ////////document.body.innerHTML = originalContents;
                ////////$('#txCheqNo').attr("value", $('#txCheqNo').val());
                //////$('.ui-helper-hidden-accessible').html('');
                //////var content = $('#Parea').html().toString();
                //////var pwin = window.open('', 'print_content', 'width=900,height=700');
                //////pwin.document.open();
                //////pwin.document.write('<html><body onload="window.print()">' + content + '</body><style type="text/css">.hidden{display:none;} input:disabled {background: #fff;color: #000;} input {border-width: 0px;background-color: white;}</style></html>');
                //////pwin.document.close();
                //////setTimeout(function () { pwin.close(); }, 1000);
                $('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#Parea").printArea(options);
                $('.NoPrnt').show();
            });


            $('.txtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });
            $('.btnAdd').live('click', function (e) {
                e.preventDefault();
                var $tg = $(this).attr('tg');
                if ($($('.txtDate[tg=' + $tg + ']')[0]).val() == "") {

                    alertR('Enter Valid Date..!');
                    return false;
                }
                if ($($('.txtChNo[tg=' + $tg + ']')[0]).val() == "") {

                    alertR('Enter Valid Ch #/PO#/Ref #..!');
                    return false;
                }
                if ($($('.txtAmnt[tg=' + $tg + ']')[0]).val() == "") {

                    alertR('Enter Valid Amount..!');
                    return false;
                }
                var $tr = '<tr class="clsND" tg="' + $tg + '" vl="' + $($('.txtDate[tg=' + $tg + ']')[0]).val() + '¼' + $($('.txtChNo[tg=' + $tg + ']')[0]).val() + '¼' + $($('.txtDesc[tg=' + $tg + ']')[0]).val() + '¼' + $($('.txtAmnt[tg=' + $tg + ']')[0]).val() + '"><td>' + $($('.txtDate[tg=' + $tg + ']')[0]).val() + '</td><td>' + $($('.txtChNo[tg=' + $tg + ']')[0]).val() + '</td><td>' + $($('.txtDesc[tg=' + $tg + ']')[0]).val() + '</td><td class="hnumber">' + $($('.txtAmnt[tg=' + $tg + ']')[0]).val() + '</td><td class="NoPrnt"><button tg="' + $tg + '"   type="button" class="btn btn-danger btnRem" style="margin-bottom: 9px;"> X </button></td></tr>';
                $('tbody[tg=' + $tg + ']').append($tr);
                $($('.txtDate[tg=' + $tg + ']')[0]).val('');
                $($('.txtChNo[tg=' + $tg + ']')[0]).val('');
                $($('.txtDesc[tg=' + $tg + ']')[0]).val('');
                $($('.txtAmnt[tg=' + $tg + ']')[0]).val('');
                GetTotal($tg);
            });

            function GetTotal(obj) {
                var tot = 0;
                $('tbody tr[tg="' + obj + '"]').each(function (index, element) {
                    // element == this
                    tot += parseFloat($($(this).find('td')[3]).html());
                });
                $('tfoot tr th[tg="' + obj + '"]').html(tot);

                var total = parseFloat($('#spnOpeningBalance').val()) + parseFloat($('tfoot tr th[tg="add"]').html()) - parseFloat($('tfoot tr th[tg="less"]').html());
                $('#finalAmnt').html(total);
            }
            $('#btnRem').live('click', function (e) {
                e.preventDefault();
                var $tg = $(this).attr('tg');
                $(this).parent().parent().remove();
                GetTotal($tg);
            });
        });//End of Doc Ready
    </script>
</asp:Content>
