<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accNewBudget.aspx.cs" Inherits="FRDP.accNewBudget" %>
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
                                        <span>New Budget</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<%--=====================--%><br />
 <div style="margin-left: 10px;">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Financial Year &amp; Cmpus</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="margin-left: 5px; margin-top: 3px;">
                <tr>
                    <td>Academic Year</td>
                    <td>
                        <asp:DropDownList ID="ddAYear" runat="server" DataSourceID="dsAYear" DataTextField="SessionName" DataValueField="Session_ID" CssClass="vl" ClientIDMode="Static">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsAYear" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Session_ID, SessionName FROM tblAC_Year WHERE (Session_ID = @fy)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="fy" Name="fy" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td style="width: 5%">&nbsp;</td>
                    <td>Campus</td>
                    <td>
                        <asp:DropDownList ID="ddCampus" runat="server" DataSourceID="dsCampus" DataTextField="CampusName" DataValueField="CampusID" CssClass="vl">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCampus" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CampusID, CampusName FROM tblCampus WHERE (CampusID = @br)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="br" Name="br" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Add New</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="margin-top: 3px; margin-left: 5px">
                <tr>
                    <td><strong>Budget Title</strong></td>
                    <td>
                        <input id="txtName" tag="0" type="text" style="width: 190px" class="vl" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input id="btnSave" class="btn btn-info" type="button" value="Add New" /><input id="btnCancel" class="btn" type="button" value="Cancel" style="margin-left: 5px;" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">
                &nbsp;Created Budgets
            </div>
            <div class="tab2">
                &nbsp;
            </div>
        </div>
        <div>

            <div id="rcList"
                style="margin-top: 5px;">
            </div>
        </div>
    </div>
<%--=====================--%><br /><br /><br />
</div>

                            </div>

                        </div>
    </div>
       
    <script type="text/javascript">

        $(document).ready(function () {
            RectForm();
            $('.tab1:nth(0)').parent().next().hide();
            $(".bgt").live('click', function (e) {
                $("#txtName").val($.trim($(this).text()));
                $("#txtName").attr('tag', $(this).attr('tag'));
                $("#btnSave").val('Update');
            });
            //$('.tab1:nth(0)').parent().next().hide();

            
            $("#btnCancel").live('click', function (e) {
                e.preventDefault();
                $("#btnSave").val('Save').attr('tag', '0');
                $('#txtName').val('');
            });
            $("#btnSave").live('click', function (e) {

                if ($("#txtName").val() == "") {
                    alert("Please Enter budget title ...");
                    return false;
                }

                var Data = [];
                if ($("#txtName").attr('tag') == "0") {
                    Data[0] = "56";
                    $('.vl').each(function () {
                        Data.push($(this).val());
                    });

                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                        context: document.body,
                        success: function (responseText) {
                            //$("#txtName").attr('tag', responseText);
                            $("#txtName").val('');
                            RectForm();
                        }
                    });
                } else {
                    Data[0] = "68";
                    $('.vl').each(function () {
                        Data.push($(this).val());
                    });
                    Data.push($("#txtName").attr('tag'));
                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                        context: document.body,
                        success: function (responseText) {
                            $("#txtName").attr('tag', 0);
                            $("#txtName").val('');
                            $("#btnSave").val('Add New');
                            RectForm();
                        }
                    });
                }

            });
            function RectForm() {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=85ǁ" + $('#ddAYear').val(),
                    context: document.body,
                    success: function (responseText) {

                        var jdata = $.parseJSON(responseText), optOdd = "", optEven = "";
                        $.each(jdata, function (i, item) {
                            if (i & 1) {
                                optOdd = optOdd + '<div class="Grd bgt" tag="' + item.BudgetID + '" style="vertical-align: top;" ><img src="./images/Comp.png" alt="" style="width: 13px;" />&nbsp;&nbsp;&nbsp;' + item.BudgetTitle + '</div>';
                            }
                            else {
                                optEven = optEven + '<div class="Grd bgt" tag="' + item.BudgetID + '" style="vertical-align: top;" ><img src="./images/Comp.png" alt=""  style="width: 13px;" />&nbsp;&nbsp;&nbsp;' + item.BudgetTitle + '</div>';
                            }
                        });

                        $('#rcList').html('<div style="width: 47%; float:left">' + optEven + '</div><div style="width: 47%; float:right">' + optOdd + '</div>');
                    }
                });
            }

        });
    </script>
</asp:Content>
