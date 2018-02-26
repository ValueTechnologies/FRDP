<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accSearchV.aspx.cs" Inherits="FRDP.accSearchV" %>
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
                                        <span>Search Created Voucher</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<%--=====================--%><br />
<div style="margin-left: 10px; margin-top: 10px">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Search between dates</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 250px">
                        <strong>Search between dates</strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 275px"><strong>From</strong> :
                        <asp:TextBox ID="txFrom" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txFrom_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom">
                        </asp:CalendarExtender>
                    </td>
                    <td><strong>To</strong> :
                        <asp:TextBox ID="txTo" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txTo_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txTo">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="Search vouchers" />
                    </td>
                    <td style="padding-left: 25px;">
                        <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="tab0"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="lstV" style="height: 150px; overflow: auto; border: 1px solid gainsboro; max-width: 720px; padding: 5px;">
                            <asp:GridView ID="gvVList" runat="server" AutoGenerateColumns="False" DataKeyNames="VoucherID" DataSourceID="dsVlist" BorderStyle="None" GridLines="None" OnRowDataBound="gvVList_RowDataBound" ShowHeader="False" Width="100%" Height="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="VoucherID" InsertVisible="False" SortExpression="VoucherID">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("VoucherID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <img alt="" src='./images/<%# Eval("icon") %>' style="width: 16px; height: 16px" />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("VoucherNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="Memo" />
                                    <asp:BoundField DataField="EntryDate" DataFormatString="{0:dd MMMM yyyy}" HeaderText="EntryDate" SortExpression="EntryDate" />
                                </Columns>
                                <RowStyle CssClass="Grd" />
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="dsVlist" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT VoucherID, VoucherNo, EntryDate, Memo, Posted, CONVERT (varchar(2), VoucherNo) + '.png' AS icon FROM vwVoucherHDR WHERE (EntryDate BETWEEN @d1 AND @d2) AND (CompanyID = @comp)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="d1" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txTo" Name="d2" PropertyName="Text" />
                                <asp:CookieParameter CookieName="br" DefaultValue="1" Name="comp" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <div id="Parea" class="pcontant" style="width: 100%">
            <asp:FormView ID="frmVoucher" runat="server" DataKeyNames="VoucherID" DataSourceID="dsVoucherHDR" ClientIDMode="Static" Width="100%">

                <ItemTemplate>
                    <table>
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
                                <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="float: right; margin-right: 6px; text-align: right; vertical-align: top;">
                                    Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                                    <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="xyz123" colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                <%# Eval("VHeader") %></td>
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
                                            <div id="JVNO"><strong>Voucher No</strong>. <%# Eval("VoucherNo") %></div>
                                        </td>
                                        <td style="text-align: right">
                                            <strong>Date</strong> :<%# Eval("EntryDate", "{0:dd MMMM yyyy}") %></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td style="text-align: right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td style="text-align: right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsVoucherDTL" GridLines="Horizontal" ShowFooter="True">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Particulars" SortExpression="AcCode">
                                                        <FooterTemplate>
                                                            <strong>Totals</strong>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("AcTitle") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label2" runat="server" Style="font-size: x-small" Text='<%# Eval("Description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="500px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dr." SortExpression="AmountDeb">
                                                        <FooterTemplate>
                                                            <div id="txDrT" style="font-weight: bold; text-align: right;">
                                                            </div>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("AmountDeb", "{0:#,#.00}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterStyle BackColor="#CCCCCC" />
                                                        <HeaderStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                        <ItemStyle BackColor="#CCCCCC" CssClass="drR" Width="100px" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cr." SortExpression="AmountCre">
                                                        <FooterTemplate>
                                                            <div id="txCrT" style="font-weight: bold; text-align: right;">
                                                            </div>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("AmountCre", "{0:#,#.00}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="crR" Width="100px" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BorderStyle="Solid" BackColor="Silver" BorderWidth="1px" />
                                                <HeaderStyle BorderStyle="Solid" HorizontalAlign="Left" BackColor="#CCCCCC" BorderWidth="1px" Font-Bold="True" />
                                                <RowStyle Height="26px" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="dsVoucherDTL" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcCode + ' ' + tblChartAc.AcName AS AcTitle, vwVoucherDTL.Description, vwVoucherDTL.AmountDeb, vwVoucherDTL.AmountCre FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID WHERE (vwVoucherDTL.VoucherID = @VoucherID) ORDER BY vwVoucherDTL.AmountDeb DESC">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="gvVList" Name="VoucherID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <%# Eval("Memo") %></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <br />
                                            <br />
                                            <br />
                                            <%--<div id="btomline">Prepared By: <%# Eval("Full_Name") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Checked By&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved By</div>--%>
                                            <div id="btomline" style="display: none;text-align:right;">Prepared By: <%# Eval("Full_Name") %> <br /><br /><br />Checked By:_______________________<br /><br /><br />
  Verified By:_______________________<br /><br /><br />Approved By:_______________________<br /></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="dsVoucherHDR" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_Voucher_SearchList" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvVList" Name="VID" PropertyName="SelectedValue" Type="String" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
        <table style="width: 715px;">

            <tr>

                <td style="text-align: right">
                    <br />
                    <input type="button" id="btnprtP" value="Print Voucher" class="btn btn-info" style="display: none" />
                </td>
            </tr>
        </table>
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
             if ($.trim($('#frmVoucher').html()).replace("\n", "") == "") {
                 $('.tab1:nth(0)').parent().next().show('slow');
                 $('#btnprtP').hide();
             } else {
                 $('.tab1:nth(0)').parent().next().hide('slow');
                 $('#btnprtP').show();
             }

             var dataDr = 0;
             var dataCr = 0;
             $('.drR').each(function () {
                 var dd = $(this).children()[0].innerHTML.replace(',', '');
                 var cc = $(this).next().children()[0].innerHTML.replace(',', '');
                 if (cc == ".00") {
                     cc = 0;
                     $(this).next().children()[0].innerHTML = "";
                 }
                 if (dd == ".00") {
                     dd = 0;
                     $(this).children()[0].innerHTML = "";
                 }
                 dataDr = dataDr + parseFloat(dd);
                 dataCr = dataCr + parseFloat(cc);
                 $('#txCrT')[0].innerHTML = $.number(dataCr, 2);
                 $('#txDrT')[0].innerHTML = $.number(dataDr, 2);
             });

             $('#btnprtP').click(function () {
                 //var content = $('#Parea').html().toString();
                 //var pwin = window.open('', 'print_content', 'width=800,height=700');

                 //pwin.document.open();

                 //pwin.document.write('<html><body onload="window.print()"><div style="width:125%;">' + content + '</div></body><link rel="stylesheet" href="/style.css" type="text/Css" /><style type="text/css"> input {border-width: 0px;background-color: white;}</style></html>');
                 //pwin.document.close();

                 //setTimeout(function () { pwin.close(); }, 1000);


                 $('#AcYearID').hide();
                 $('.ui-helper-hidden-accessible').html('');
                 $('.NoPrnt').hide();
                 $('#btomline').show();
                 var mode = 'iframe'; // popup
                 var close = mode == "popup";
                 var options = { mode: mode, popClose: close };
                 $("#Parea").printArea(options);
                 $('#btomline').hide();
                 $('.NoPrnt').show();
                 $('#AcYearID').show();
             });
         });
     </script>
</asp:Content>
