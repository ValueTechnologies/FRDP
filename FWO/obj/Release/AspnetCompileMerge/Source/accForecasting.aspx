<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accForecasting.aspx.cs" Inherits="FRDP.accForecasting" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        table#tblBDtls input {
            border: none;
            width: 100px;
        }
    </style>

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Budget Forecasting</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<%--=====================--%><br />
  <div style="margin-left: 10px;">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Budget List</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div style="margin-top: 5px">
            <strong>Budgets</strong><asp:DropDownList ID="ddAYear" runat="server" DataSourceID="dsAYear" DataTextField="BudgetTitle" DataValueField="BudgetID" CssClass="vl" ClientIDMode="Static" Width="97%">
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsAYear" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT BudgetTitle, BudgetID FROM tblBudgetHDR WHERE (AccYearID = @fy)">
                <SelectParameters>
                    <asp:CookieParameter CookieName="fy" Name="fy" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="btnAddB GrdB cBtn">
                <div class="imgBtn">
                    <img alt="" src="./images/Add.png">
                </div>
                <div class="tBtn">Add New Account Head</div>
            </div>
        </div>
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Budget Forecasting Detils</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div id="frm" style="display: block;">
            <div id="btnmax" class="btn btn-info" style="margin-top: 3px; height: 10px; margin-bottom: 3px; text-align: center; line-height: 10px;">&nbsp;click to maximize/minimize</div>
            <div id="oResult scroll" style=" overflow: auto; padding-left: 0px; background-color: white;">
                <table id="tblBDtls" class="tb-css"></table>
            </div>
        </div>
        <div class="Dlg" title="Add New Account Budget">
            <table style="margin-top: 3px; margin-left: 5px; width: 100%;">
                <tr>
                    <td style="width: 100px"><strong>Account Title</strong></td>
                    <td>
                        <asp:DropDownList ID="ddAccounts" runat="server" ClientIDMode="Static" DataSourceID="dsAccount" DataTextField="AcName" DataValueField="AcID" CssClass="vl" Width="100%">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsAccount" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT AcName, AcID FROM tblChartAc WHERE (AcType = N'Expenses')"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>Budgeted Amount</td>
                    <td>
                        <input id="txtName" tag="0" type="text" class="vl numeric" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input id="btnSave" class="btn btn-info" type="button" value="Save Record" /></td>
                </tr>
            </table>
        </div>
    </div>
<%--=====================--%><br />
</div>

                            </div>

                        </div>
    </div>


    

    <script type="text/javascript">
        $(document).ready(function () {
            $('.Dlg').dialog({
                autoOpen: false,
                height: 180,
                width: 400,
                modal: true,
                show: {
                    effect: "clip",
                    duration: 500
                },
                hide: {
                    effect: "clip",
                    duration: 500
                }
            });
            $(".btnC").live('click', function (e) { $('.Dlg').dialog('close'); });
            $(".btnAddB").live('click', function (e) {
                $('.Dlg').dialog('open');
            });
            RectForm();
            $(".bgt").live('click', function (e) {
                $("#txtName").val($.trim($(this).text()));
                $("#txtName").attr('tag', $(this).attr('tag'));
                $("#btnSave").val('Update');
            });
            //$('.tab1:nth(0)').parent().next().hide();
            $("#btnSave").live('click', function (e) {
                if ($("#txtName").val() == "") {
                    alert("Please Enter Amount ...");
                    return false;
                }
                var Data = [];
                Data[0] = "86";
                $('.vl').each(function () {
                    Data.push($(this).val());
                });
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                    context: document.body,
                    success: function (responseText) {
                        if (responseText == '[{"rText":0}]') {
                            $("#txtName").val('');
                            $('.Dlg').dialog('close');
                            RectForm();
                        } else { alert('Already exists !!!'); }
                    }
                });
            });
            $("#btnmax").live('click', function (e) {
                if ($('#frm').attr('class') == 'maxi') {
                    $('#frm').removeClass('maxi');
                    //$('#frm').css('margin-left', '10px');
                } else { $('#frm').attr('class', 'maxi'); $('#frm').css('margin-left', '2px'); }
            });
            $(".mBgt").live('focusout', function (e) {
                var obj = $(this);
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=88ǁ" + obj.val() + "ǁ" + obj.attr('tag'),
                    context: document.body,
                    success: function (responseText) {

                    }
                });
            });
            function RectForm() {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=87ǁ" + $('#ddAYear').val(),
                    context: document.body,
                    success: function (responseText) {
                        $('#tblBDtls').html(responseText);
                        $('#tblBDtls tbody tr td:nth-child(1)').css('font-weight', 'bold');
                        $('.tb-css th:first').css('min-width', '150px');
                        $('.mBgt').each(function () { if ($.isNumeric($(this).val())) { $(this).val($.number($(this).val(), 0)); } });
                        $(".numeric").numeric({ negative: false });
                    }
                });
            }
        });
    </script>
</asp:Content>
