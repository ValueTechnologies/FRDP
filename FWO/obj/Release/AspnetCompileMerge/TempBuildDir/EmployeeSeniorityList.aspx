<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeSeniorityList.aspx.cs" Inherits="FRDP.EmployeeSeniorityList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span id="btnprtP" class="icon16 icomoon-icon-printer-2" title="Click To Print"></span>
                                        <span>Employee Seniority List</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div id="PrintArea"  class="content noPad">
<br />
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
                                    Employee Seniority List Report</td>
                            </tr>
                    </table><hr />
<div style="margin-left:5px;margin-right:5px;" id="dvSeniorityList"></div>
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
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=71ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">\
                            &nbsp;<div class="tab1" style="float: left">&nbsp;' + itm.NAME + '</div>\
                            <div class="tab2">&nbsp;</div>\
                        </div>\
                        <div class="sldtl" tg="' + itm.ID + '" style="margin-bottom: 20px;    margin-left: 5px;    margin-right: 5px;"></div>';
                        });
                        $('#dvSeniorityList').html(opt);

                        $('.sldtl').each(function (index, element) {
                            // element == this
                            var $tg = $(this).attr('tg');
                            LoadDtl($tg);
                        });
                    }
                });
            });

            function LoadDtl(tg)
            {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=72ǁ"+tg,
                    success: function (response) {
                        $('.sldtl[tg=' + tg + ']').html(response).show();
                    }
                });
            }
        });//End of Doc Ready//
    </script>
</asp:Content>
