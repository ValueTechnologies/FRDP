<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="ComparativeStatement.aspx.cs" Inherits="FRDP.ComparativeStatement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span id="btnprtP" class="icon16 icomoon-icon-printer-2" title="Click To Print"></span>
                        <span>Comparative Statement</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div id="PrintArea" style="width: 99%">
                        <table style="width: 99%; margin-top: 10px;">
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
                                <td style="vertical-align: top"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                    <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                                    Comparative Statement of Quotations</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                     <asp:DropDownList ID="ddRFQs" ClientIDMode="Static" runat="server" DataSourceID="SDRFQs" DataTextField="tblInvReqNo" DataValueField="tblInvReqMainID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SDRFQs" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblInvReqMainID, 'RFQ' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT ('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo FROM tblInvReqMain WHERE (Type = 'RFQ') ORDER BY EnteryDateTime DESC"></asp:SqlDataSource>
                                    </td>
                            </tr>
                        </table>
                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Unit Price against RFQ</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
                            <div id="tblContainer" style="margin-left: 20px; margin-right: 20px;"></div>
                        </div>
                        <%--END OF tab0--%>

                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Total Price against RFQ</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
                            <div id="tblContainer1" style="margin-left: 20px; margin-right: 20px;"></div>
                        </div>
                        <%--END OF tab0--%>
                        <br />
                                         <table style="width:100%">
                        <tr style="font-weight: 700;">
                            <td style="width:33%;text-align:center;">
                                <!-- ( HAROON RASHEED KASI )<br /> -->
                                Manager (Admin)<br />Head Office, Demo Company
                            </td>
                            <td style="width:33%;text-align:center;">
                                <!--( ARIF TAREEN )<br />-->
                                Manager (Finance)<br />Head Office, Demo Company
                            </td>
                            <td style="width:33%;text-align:center;">
                                 <!--( Dr. MUKHTAR ALI ZEHRI )<br />-->
                                Public Health Specialist<br />Head Office, Demo Company
                            </td>
                        </tr>
                                             <tr>
                                                 <td colspan="3"><br />
                                                     <br />
                                                 </td>
                                             </tr>
                                                                     <tr  style="font-weight: 700;">
                            <td style="width:33%;text-align:center;">&nbsp;</td>
                            <td style="width:33%;text-align:center;">
                                <!-- ( MUHAMMAD RAFIQ RAISANI. )<br /> -->
                                <br />Head Office, FRDP -B</td>
                            <td style="width:33%;text-align:center;">&nbsp</td>
                        </tr>
                    </table>
                    </div>
                    <%-- END OF PRINT DIVE--%>

   

                    <br />
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#btnprtP').click(function () {
                $('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#PrintArea").printArea(options);
                $('.NoPrnt').show();
            });
            $('#ddRFQs').live('change', function (e) {
                e.preventDefault();
                LoadTABLES();

            });
            LoadTABLES();
            function LoadTABLES() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=79ǁ" + $('#ddRFQs').val(),
                    success: function (response) {
                        $('#tblContainer').html(response);
                        $('#tblJl tbody tr').each(function (index, element) {
                            $($(this).find('td')[0]).html(parseInt(index) + 1);
                        });
                        $('#tblJl').append('<tfoot style="border-bottom: 1px solid #c4c4c4;"><tr><th colspan="3" style="text-align:center;"><strong>Total</strong></th></tr></tfoot>');

                        for (var i = 0; i < $('#tblJl thead th').length -3 ; i++) {
                            $($('#tblJl tfoot tr')[0]).append('<th>0</th>');
                        }

                        for (var i = 0; i < $('#tblJl thead tr th').length; i++) {
                            if (i > 2) {
                                var totals = 0;
                                $('#tblJl tbody tr').each(function (index, element) {
                                    totals += parseFloat($($(this).find('td')[i]).html());
                                });
                                $($('#tblJl tfoot tr th')[i - 2]).html(totals);
                            }
                        }

                    }
                });


                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=80ǁ" + $('#ddRFQs').val(),
                    success: function (response) {
                        $('#tblContainer1').html(response);
                        $('#tblJ2 tbody tr').each(function (index, element) {
                            $($(this).find('td')[0]).html(parseInt(index) + 1);
                        });
                        $('#tblJ2').append('<tfoot style="border-bottom: 1px solid #c4c4c4;"><tr><th colspan="3" style="text-align:center;"><strong>Total</strong></th></tr></tfoot>');

                        
                        for (var i = 0; i < $('#tblJ2 thead tr th').length - 3 ; i++) {
                            var total = 0;

                            $($('#tblJ2 tfoot tr')[0]).append('<th>0</th>');
                        }

                        for (var i = 0; i < $('#tblJ2 thead tr th').length; i++) {
                            if (i>2) {
                                var totals = 0;
                                $('#tblJ2 tbody tr').each(function (index, element) {
                                    totals += parseFloat($($(this).find('td')[i]).html());
                                    });
                                $($('#tblJ2 tfoot tr th')[i - 2]).html(totals);
                            }
                        }


                    }
                });
            }
        });//END OF DOC READY
    </script>
</asp:Content>
