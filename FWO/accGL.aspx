<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accGL.aspx.cs" Inherits="FRDP.accGL" %>

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
                                        <asp:TextBox ID="txFrom" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="txFrom_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom">
                                        </asp:CalendarExtender>
                                        To :<asp:TextBox ID="txTo" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="txTo_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txTo">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>GL Accounts :</td>
                                    <td>
                                        <asp:DropDownList ID="ddLadgers" runat="server" DataSourceID="dsAccList" DataTextField="AcName" DataValueField="AcID" Width="322px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnView" runat="server" CssClass="btn btn-info" Text="View Ledger" OnClick="btnView_Click" />
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
                                                            <div style="float: left; width: 70%;margin-top: 10px;">
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
                                        <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="display:none;float: right; margin-right: 6px; text-align: right; vertical-align: top;">
                                            Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                                            <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">Ledger Report</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2" style="text-align: left; font-variant: small-caps; font-size: x-large; font-weight: bold;">
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
                                    <td>&nbsp;</td>
                                    <td colspan="2">
                                        <div id="Lctnt">
                                            <asp:GridView ID="gvLadger" runat="server" AutoGenerateColumns="False" DataSourceID="dsLadger" Width="96%" OnRowDataBound="gvLadger_RowDataBound" BorderStyle="None" GridLines="Horizontal" ShowFooter="True" DataKeyNames="VoucherID">
                                                <Columns>
                                                    <asp:BoundField DataField="EntryDate" HeaderText="Date" ReadOnly="True" SortExpression="EntryDate" DataFormatString="{0:dd MMMM yyyy}">
                                                        <ItemStyle Width="120px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="VoucherNo" HeaderText="Voucher" ReadOnly="True" SortExpression="VoucherNo">
                                                        <ItemStyle Width="80px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True" SortExpression="Description" />
                                                    <asp:TemplateField HeaderText="Debit" SortExpression="dr">
                                                        <EditItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("dr", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblDr" runat="server" Text="0"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("dr", "{0:#,#;(#,#)}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterStyle BackColor="#CCCCCC" />
                                                        <ItemStyle BackColor="#CCCCCC" Width="100px" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" SortExpression="cr">
                                                        <EditItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("cr", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblCr" runat="server" Text="0"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("cr", "{0:#,#;(#,#)}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="100px" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Balance">
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblnet" at="lblnet" runat="server" Text="0"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotal" CssClass="blnc" runat="server" Text="0"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="100px" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" Font-Bold="True" Height="20px" HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="fHead" HorizontalAlign="Left" BackColor="Silver" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" />
                                                <RowStyle CssClass="Grd V" />
                                            </asp:GridView>
                                        </div>
                                        <asp:SqlDataSource ID="dsLadger" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_LadgerRpt" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddLadgers" Name="AcID" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="txFrom" DbType="Date" Name="fdate" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txTo" DbType="Date" Name="ldate" PropertyName="Text" />
                                                <asp:CookieParameter CookieName="fy" Name="fy" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
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
                        <div style="text-align: right">
                            <input type="button" id="btnprtP" value="Print Ledger" class="btn btn-info" style="margin-right: 45px;" />
                        </div>
                    </div>
                    <%--=====================--%><br />
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
            if ($.trim($('#Lctnt div').html()).replace("\n", "") == "") {
                $('.tab1:nth(0)').parent().next().show('slow');
                $('#btnprtP').hide();
                $('#Parea').hide();
            } else {
                $('.tab1:nth(0)').parent().next().hide('slow');
                $('#btnprtP').show(); $('#Parea').show();
            }

            $('.blnc').each(function (index, element) {
                $('[at=lblnet]').html($(this).text());

            });
            $('#SheetContentPlaceHolder_gvLadger').fixedtableheader();
            $('.V').live('click', function (e) {
                if ($(this).attr('id') != "0") {
                    $.cookie("VoucherID", $(this)[0].id.toString());
                    $('.temp').empty();
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
            $('#SheetContentPlaceHolder_btnView').click(function () {
                $('#Parea').show();
                $('#btnprtP').show();
            });
            $('#btnprtP').click(function () {
                var content = $('#Parea').html().toString();
                var pwin = window.open('', 'print_content', 'width=800,height=700');

                pwin.document.open();

                pwin.document.write('<html><body onload="window.print()"><div style="width:115%;">' + content + '</div></body><style type="text/css"> input {border-width: 0px;background-color: white;}</style></html>');
                pwin.document.close();

                setTimeout(function () { pwin.close(); }, 1000);
            });
        });
    </script>
</asp:Content>
