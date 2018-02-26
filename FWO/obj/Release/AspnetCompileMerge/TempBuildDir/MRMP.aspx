<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="MRMP.aspx.cs" Inherits="FRDP.MRMP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .ttbl tr td{
            border: 1px solid #c4c4c4;
        }
        
    </style>
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Select Monthly Review Meeting</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<table style="width:99%; margin-left:20px;">
    <tr>
        <td style="width:200px;">Select Monthly Review Meeting</td>
        <td>
            <asp:DropDownList ID="ddlMRM" runat="server" ClientIDMode="Static" DataSourceID="SDMRM" DataTextField="Meeting" DataValueField="tblMonthlyReviewMeetingID"></asp:DropDownList><asp:SqlDataSource ID="SDMRM" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        Convert(varchar(50),dtMeetingDate,103) +' ' + ISNULL(Venue,'')  AS Meeting, tblMonthlyReviewMeetingID
FROM            tblMonthlyReviewMeeting"></asp:SqlDataSource>
        </td>
    </tr>
</table>
<br /></div>

                            </div>

                        </div>
    </div>

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span id="btnprtP" class="icon16 icomoon-icon-printer-2" title="Click To Print"></span>
                                        <span>Monthly Review Meeting Report</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div  id="PrintArea" class="content noPad"><br />

                   <table style="width:99%;margin-top: 10px;">
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

                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                    <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                                    Monthly Review Meeting Report</td>
                            </tr>
                    </table>
                                    <br />
                                    <table class="ttbl" style="width:96%; margin-left:20px;margin-right:20px;">
                                        <tr>
                                            <td style="width:130px;vertical-align:top;"><strong>Meeting Date</strong></td>
                                            <td class="frm"></td>
                                            <td style="width:130px;vertical-align:top;"><strong>Venue</strong></td>
                                            <td class="frm"></td>
                                        </tr>
                                                                                <tr>
                                            <td style="width:130px;vertical-align:top;"><strong>Chaired By</strong></td>
                                            <td class="frm"></td>
                                            <td style="width:130px;vertical-align:top;"><strong>Agenda</strong></td>
                                            <td class="frm"></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align:top;"><strong>Members</strong></td>
                                            <td colspan="3" class="frm"></td>
                                        </tr>
                                           <tr>
                                            <td style="vertical-align:top;"><strong>Discussion</strong></td>
                                            <td colspan="3" class="frm"></td>
                                        </tr>
                                                                                   <tr>
                                            <td style="vertical-align:top;"><strong>Responsibilities</strong></td>
                                            <td colspan="3" class="frm"></td>
                                        </tr>
                                    </table>

<br /></div>

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
            $('#btnprtP').click(function () {
                $('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#PrintArea").printArea(options);
                $('.NoPrnt').show();
            });
            $('#ddlMRM').live('change', function (e) {
                e.preventDefault();
                LoadReportData();
            });
            LoadReportData();
            function LoadReportData() {
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=16ǁ" + $('#ddlMRM').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response);

                        $($('.frm')[0]).html(jd[0].dtMeetingDate);
                        $($('.frm')[1]).html(jd[0].Venue);
                        $($('.frm')[2]).html(jd[0].ChairedBy);
                        $($('.frm')[3]).html(jd[0].Agenda);
                        $($('.frm')[4]).html(jd[0].Members);
                        $($('.frm')[5]).html(jd[0].Discussion);
                        $($('.frm')[6]).html(jd[0].Responsiblities);

                        $($('.frm')[4]).html($('<div />').html($($('.frm')[4]).html()).text());
                        $($('.frm')[5]).html($('<div />').html($($('.frm')[5]).html()).text());
                        $($('.frm')[6]).html($('<div />').html($($('.frm')[6]).html()).text());
                    }
                });
            }
        });
    </script>
</asp:Content>
