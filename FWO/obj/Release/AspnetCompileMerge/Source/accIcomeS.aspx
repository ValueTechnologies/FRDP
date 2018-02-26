<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accIcomeS.aspx.cs" Inherits="FRDP.accIcomeS" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="plugins/misc/jquery.PrintArea.js"></script>
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Income Statement</span>
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
                    <td colspan="2" class="tdTitle">
                        <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <strong>Dates between</strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: right;">From :</td>
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
                    <td style="width: 100px">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnView" runat="server" CssClass="btn btn-info" Text="Income Statement" OnClick="btnView_Click" ClientIDMode="Static" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <div id="Parea" class="pcontant" style="width: 99%;">
            <table style="width: 99%;">
                <tr>
                    <td>
                        <asp:DetailsView ID="dvCompany" runat="server" AutoGenerateRows="False" BorderStyle="None" DataSourceID="dsComp" GridLines="None" Height="50px" Width="100%">
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
                        <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="float: right; margin-right: 6px; text-align: right; vertical-align: top;">
                            Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                            <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">Income Statement</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblDates" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="border-top-style: solid; border-width: thin; border-color: #333333">&nbsp;</td>
                    <td style="border-top-style: solid; border-width: thin; border-color: #333333">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvHeads" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsHeads" GridLines="None" ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="HeadName" SortExpression="HeadName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HeadName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <h3>
                                            <asp:Label ID="lblAcHead" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>
                                        </h3>
                                        <div style="margin-left: 21px; margin-top: 5px; margin-bottom: 3px;">
                                            <asp:GridView ID="gvGrpHeads" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsGrpHeads" GridLines="None" ShowHeader="False" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="AcGroup" SortExpression="AcGroup">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AcGroup") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblGrpH" runat="server" Style="font-weight: 700" Text='<%# Bind("AcGroup") %>'></asp:Label>
                                                            <div style="margin-left: 18px; margin-top: 4px; margin-bottom: 4px;">
                                                                <asp:GridView ID="gvAccounts" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsAccounts" GridLines="None" ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="Acc" HeaderText="Acc" SortExpression="Acc" />
                                                                        <asp:BoundField DataField="Amount" DataFormatString="{0:#,#.00;(#,#.00)}" HeaderText="Amount" SortExpression="Amount">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <div style="text-align: right;">
                                                                <strong>Total </strong>
                                                                <asp:Label ID="lblGrpH0" runat="server" Style="font-weight: 700" Text='<%# Bind("AcGroup") %>'></asp:Label>
                                                                &nbsp;:&nbsp;
                                                        <asp:Label ID="lblGrpH1" runat="server" Font-Overline="True" Style="font-weight: 700" Text='<%# Bind("Amount", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                                            </div>
                                                            <asp:SqlDataSource ID="dsAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcCode + ' ' + tblChartAc.AcName AS Acc, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount, tblChartAc.AcGroup FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID WHERE (tblChartAc.AcType = @AcType) AND (tblChartAc.AcGroup = @AcGroup) AND (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate BETWEEN @DT1 AND @DT2) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcCode + ' ' + tblChartAc.AcName, tblChartAc.AcGroup">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblAcHead" Name="AcType" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="lblGrpH" Name="AcGroup" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="txFrom" Name="DT1" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="txTo" Name="DT2" PropertyName="Text" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <h3 style="text-align: right;">Total
                                        <asp:Label ID="lblAcHead0" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>
                                            &nbsp;:
                                        <asp:Label ID="lblAcHead1" CssClass="G_Totals1"  runat="server" Text='<%# Eval("Amount", "{0:#,#.00;(#,#.00)}") %>' Font-Overline="True"></asp:Label>
                                        </h3>
                                        <asp:SqlDataSource ID="dsGrpHeads" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcGroup, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID WHERE (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate BETWEEN @DT1 AND @DT2) AND (tblChartAc.AcType = @AcType) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcGroup">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txFrom" Name="DT1" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txTo" Name="DT2" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="lblAcHead" Name="AcType" PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsHeads0" GridLines="None" ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <ItemTemplate>
                                        <h3 style="text-align: right; text-decoration: overline;">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Display") %>'></asp:Label>
                                            &nbsp;:
                                        <asp:Label ID="Label1" runat="server" see="G_Totals"   Text='<%# Bind("Amount", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                        </h3>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle HorizontalAlign="Right" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsHeads" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcType, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN tblCOA ON tblChartAc.AcType = tblCOA.HeadName WHERE (tblChartAc.CompID = 16) AND (tblCOA.HeadID = 3 OR tblCOA.HeadID = 4) AND (vwVoucherHDR.EntryDate BETWEEN @DT1 AND @DT2) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcType ORDER BY tblChartAc.AcType DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT1" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txTo" Name="DT2" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <%--SELECT        SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) - SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) AS Amount  FROM            tblChartAc INNER JOIN                           vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN                           vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN                           tblCOA ON tblChartAc.AcType = tblCOA.HeadName  WHERE        (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate BETWEEN @DT1 AND @DT2) AND (tblCOA.HeadID = 3 OR                           tblCOA.HeadID = 4) AND (vwVoucherHDR.Posted = 1)--%>
                        <asp:SqlDataSource ID="dsHeads0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="Select Amount , Display= Case when Amount &lt; 0 Then 'Loss' Else 'Profit' End from (
Select Amount =Case when Y.Expense &gt; Y.Revenue THEN (Y.Expense + Y.Revenue) * -1 ELSE Y.Expense + Y.Revenue END  from (
SELECT        (SELECT        Amount
                          FROM            (SELECT        tblChartAc.AcType, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount
                                                    FROM            tblChartAc INNER JOIN
                                                                              vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN
                                                                              vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN
                                                                              tblCOA ON tblChartAc.AcType = tblCOA.HeadName
                                                    WHERE        (tblChartAc.CompID = 16) AND (tblCOA.HeadID = 3 OR
                                                                              tblCOA.HeadID = 4) AND (vwVoucherHDR.EntryDate BETWEEN @DT1 AND @DT2) AND (vwVoucherHDR.Posted = 1)
                                                    GROUP BY tblChartAc.AcType) AS xx
                          WHERE        (AcType = 'Expenses')) AS Expense,
                             (SELECT        Amount
                               FROM            (SELECT        tblChartAc.AcType, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount
                                                         FROM            tblChartAc INNER JOIN
                                                                                   vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN
                                                                                   vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN
                                                                                   tblCOA ON tblChartAc.AcType = tblCOA.HeadName
                                                         WHERE        (tblChartAc.CompID = 16) AND (tblCOA.HeadID = 3 OR
                                                                                   tblCOA.HeadID = 4) AND (vwVoucherHDR.EntryDate BETWEEN @DT1 AND @DT2) AND (vwVoucherHDR.Posted = 1)
                                                         GROUP BY tblChartAc.AcType) AS xx
                               WHERE        (AcType = 'Revenue')) AS Revenue) as Y) z">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT1" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txTo" Name="DT2" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td id="gTotal" style="text-align: right; margin-right: 100px; vertical-align: top;">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <br />
                                    <div id="btomline">
                                        Print By: <%: Session["username"] %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <table style="width: 99%;">
            <tr>
                <td style="text-align:right;">
                    <br />
                    <input type="button" id="btnprtP" value="Print Report" class="btn btn-info" style="margin-right: 10px;" />
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

                  $('#btnView').click(function () {
                      $('#Parea').show('slow');
                  });
                  $('#btnprtP').click(function () {
                      //var content = $('#Parea').html().toString();
                      //var pwin = window.open('', 'print_content', 'width=900,height=700');

                      //pwin.document.open();

                      //pwin.document.write('<html><body onload="window.print()"><div style="width:122%;">' + content + '</div></body><style type="text/css"> input {border-width: 0px;background-color: white;}</style></html>');
                      //pwin.document.close();

                      //setTimeout(function () { pwin.close(); }, 1000);

                      $('.NoPrnt').hide();
                      var mode = 'iframe'; // popup
                      var close = mode == "popup";
                      var options = { mode: mode, popClose: close };
                      $("#Parea").printArea(options);
                      $('.NoPrnt').show();
                  });

                  //$(function () {

                  //    var flt1 = 0.00;
                  //    var flt2 = 0.00;
                  //    var v1 = $($('.G_Totals1')[1]).html();
                  //    var v2 = $('[see=G_Totals]').html();
                  //    if ( v1.indexOf('(') !== -1 ) { 
                  //        v1 = v1.replace('(', '');
                  //        v1 = v1.replace(')', '');
                  //        v1 = v1.replace(',', '');
                          
                  //        flt1 =  parseFloat(v1) * -1;
                  //    }
                  //    else {
                  //        v1 = v1.replace(',', '');
                  //        flt1 = parseFloat(v1);
                  //    }
                  //    if (v2.indexOf('(') !== -1) {
                  //        v2 = v2.replace('(', '');
                  //        v2 = v2.replace(')', '');
                  //        v2 = v2.replace(',', '');
                  //        flt2 = parseFloat(v2) * -1;
                  //    }
                  //    else {
                  //        v2 = v2.replace(',', '');
                  //        flt2 = parseFloat(v2);
                  //    }
                  //    var tot = flt1 + flt2;
                  //    //$('#gTotal').html('Total : ' + tot);



                  //    $('#gTotal').html('<h3 style="text-align: right;">Total : <span style="text-decoration: overline;">'+$.number(tot,2)+'</span></h3>');

                  //})



              });//END OF DOC READY
    </script>
</asp:Content>
