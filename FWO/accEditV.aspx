<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accEditV.aspx.cs" Inherits="FRDP.accEditV" %>
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
                                        <span>Edit Voucher</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<%--=====================--%><br />
    <div style="margin-left: 10px; margin-top: 10px">

        <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Search between dates</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 250px">
                        <strong>Search between dates</strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 275px">From :<asp:TextBox ID="txFrom" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txFrom_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom">
                        </asp:CalendarExtender>
                    </td>
                    <td>To :<asp:TextBox ID="txTo" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txTo_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txTo">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 38px">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="Search vouchers" />
                    </td>
                    <td style="padding-left: 25px;">
                        <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>

        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Search Result List</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div id="xvcher" style="height: 150px; overflow: auto; max-width: 98%; padding: 5px; margin-top: 2px;">
            <asp:GridView ID="gvVList" runat="server" AutoGenerateColumns="False" DataKeyNames="VoucherID" DataSourceID="dsVlist" BorderStyle="None" GridLines="Horizontal" Width="100%" ShowHeader="False">
                <Columns>
                    <asp:TemplateField HeaderText="Voucher No." InsertVisible="False" SortExpression="VoucherID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("VoucherID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <img alt="" src='./images/<%# Eval("icon") %>' style="width: 16px; height: 16px" />
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("VoucherNo") %>' ToolTip='<%# Eval("VoucherID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" DataFormatString="{0:dd MMMM yyyy}" HeaderText="Date" SortExpression="EntryDate" />
                    <asp:BoundField DataField="Memo" HeaderText="Description" SortExpression="Memo">
                        <ItemStyle HorizontalAlign="Center" Width="60%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Full_Name" HeaderText="Full_Name" SortExpression="Full_Name">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle CssClass="btn btn-info" HorizontalAlign="Left" />
                <RowStyle CssClass="Grd vlist" />
            </asp:GridView>
        </div>
<%--        <asp:SqlDataSource ID="dsVlist" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT TblVoucherHDR.VoucherID, TblVoucherHDR.VoucherNo, TblVoucherHDR.EntryDate, TblVoucherHDR.Memo, TblVoucherHDR.Posted, CONVERT (varchar(2), TblVoucherHDR.VoucherNo) + '.png' AS icon, TblHResources.Full_Name FROM TblVoucherHDR INNER JOIN TblHResources ON TblVoucherHDR.Created = TblHResources.User_ID WHERE (TblVoucherHDR.CompanyID = @br) AND (TblVoucherHDR.EntryDate BETWEEN @d1 AND @d2) AND (TblVoucherHDR.Posted = 1) AND (format(TblVoucherHDR.EntryDate, 'MMMM yyyy') = @AMonth)">
            <SelectParameters>
                <asp:CookieParameter CookieName="br" Name="br" />
                <asp:ControlParameter ControlID="txFrom" Name="d1" PropertyName="Text" />
                <asp:ControlParameter ControlID="txTo" Name="d2" PropertyName="Text" />
                <asp:SessionParameter Name="AMonth" SessionField="ActMth" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
            <asp:SqlDataSource ID="dsVlist" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        TblVoucherHDR.VoucherID, TblVoucherHDR.VoucherNo, TblVoucherHDR.EntryDate, TblVoucherHDR.Memo, TblVoucherHDR.Posted, CONVERT(varchar(2), TblVoucherHDR.VoucherNo) + '.png' AS icon, 
                         Employees.Full_Name
FROM            TblVoucherHDR INNER JOIN
                         Login ON TblVoucherHDR.Created = Login.LoginID INNER JOIN
                             (SELECT        User_ID AS Emp_Id, 'TblHResources' AS TableName, Full_Name
                               FROM            TblHResources
                               UNION
                               SELECT        EmpID AS Emp_ID, 'tblEmployee' AS TableName, ISNULL(FName, '') + ' ' + ISNULL(LName, '') AS Expr1
                               FROM            tblEmployee) AS Employees ON Login.TableName = Employees.TableName AND Login.Emp_Id = Employees.Emp_Id
WHERE        (TblVoucherHDR.CompanyID = @br) AND (TblVoucherHDR.EntryDate BETWEEN @d1 AND @d2) AND (TblVoucherHDR.Posted = 0) AND (format(TblVoucherHDR.EntryDate, 'MMMM yyyy') = @AMonth)">
            <SelectParameters>
                <asp:CookieParameter CookieName="br" Name="br" />
                <asp:ControlParameter ControlID="txFrom" Name="d1" PropertyName="Text" />
                <asp:ControlParameter ControlID="txTo" Name="d2" PropertyName="Text" />
                <asp:CookieParameter CookieName="ActMth" Name="AMonth" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div id="Parea" class="pcontant" style="width: 99%">
            <table style="width: 99%;">
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
                        <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="float: right; margin-right: 45px; text-align: right; vertical-align: top;">
                            <asp:DropDownList ID="ddCampus" runat="server" DataSourceID="dsCampus" DataTextField="CampusName" DataValueField="CampusID" CssClass="bless hidden" BorderStyle="None" ClientIDMode="Static">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsCampus" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CampusID, CampusName FROM tblCampus WHERE (CampusID = @br)">
                                <SelectParameters>
                                    <asp:CookieParameter CookieName="br" Name="br" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="ddAYear" runat="server" DataSourceID="dsAYear" DataTextField="SessionName" DataValueField="Session_ID" CssClass="bless hidden" ClientIDMode="Static">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsAYear" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Session_ID, SessionName FROM tblED_Sessions WHERE (Session_ID = @fy)">
                                <SelectParameters>
                                    <asp:CookieParameter CookieName="fy" Name="fy" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                            <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                        <div id="htd">Journal Voucher</div>
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
                                    <div id="JVNO" title="JV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Session["CompID"]+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'JV%')")[0] %>" style="float: left; font-weight: bold; margin-left: 5px;">Voucher No. JV/<%:Fn.GetRecords("SELECT COUNT(isnull(VoucherID,0))+1 AS VNo FROM TblVoucherHDR WHERE (CompanyID = "+Session["CompID"]+") AND ({ fn MONTHNAME(EntryDate) } + ' ' + CONVERT(varchar, YEAR(EntryDate)) = '"+Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy")+"') AND (VoucherNo LIKE N'JV%')")[0] %></div>
                                </td>
                                <td style="text-align: right">
                                    <strong>Date</strong> :<asp:TextBox ID="txDate" runat="server" Font-Size="11px" BorderStyle="None" ClientIDMode="Static"></asp:TextBox>
                                    <asp:CalendarExtender ID="txDate_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txDate">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="text-align: right">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table style="border-collapse: collapse; table-layout: auto; border-bottom-style: solid; border-top-style: solid; width: 100%;" class="responsive table">
                                        <tbody>
                                            <tr>
                                                <td style="font-weight: 700; width: 189px;">Account Head</td>
                                                <td style="width: 390px">
                                                    <strong>Narration</strong></td>
                                                <td style="width: 80px; text-align: right;">
                                                    <strong>Dr.</strong></td>
                                                <td style="width: 80px; text-align: right;"><strong>Cr.</strong></td>
                                                <td style="width: 20px; text-align: right;">&nbsp;</td>
                                                <td style="width: 20px; text-align: right;">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table id="test-table" style="border-collapse: collapse; width: 100%;" class="responsive table">
                                        <tr>
                                            <td style="width: 189px">
                                                <input class="AcName" type="text" style="width: 100%" /></td>
                                            <td style="width: 390px">
                                                <input class="Dsc" type="text" value="" style="width: 100%" /></td>
                                            <td style="width: 80px;">
                                                <input class="Dr" type="text" style="width: 100%; text-align: right;" /></td>
                                            <td style="width: 80px;">
                                                <input class="Cr" type="text" style="width: 100%; text-align: right;" /></td>
                                            <td style="width: 20px;">
                                                <input class="btAdd" type="button" style="background-image: url('./images/AdR.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;" /></td>
                                            <td style="width: 20px;">
                                                <input class="btnrm" type="button" style="background-image: url('./images/close.ico'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top-style: dotted; border-top-width: thin;" colspan="2">
                                    <table id="test-table0" style="border-collapse: collapse; width: 100%;" class="responsive table">
                                        <tr>
                                            <td style="width: 189px">&nbsp;</td>
                                            <td style="width: 390px">
                                                <strong>Totals</strong></td>
                                            <td style="width: 80px;">
                                                <input id="txDrT" type="text" style="width: 100%; text-align: right; font-weight: bold;" readonly="readonly" /></td>
                                            <td style="width: 80px;">
                                                <input id="txCrT" type="text" style="width: 100%; text-align: right; font-weight: bold;" readonly="readonly" /></td>
                                            <td style="width: 20px;">&nbsp;</td>
                                            <td style="width: 20px;">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input id="txJMemo" style="width: 98.5%" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="upfilesList">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <br />
                                    <br />
                                    <div id="btomline" style="display: none;">Prepared By: <%:Session["username"] %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Checked By&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved By&nbsp;&nbsp;&nbsp; </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
        <table style="width: 100%;">
            <tr>
                <td>
                    <div id="UpFiles" style="display: none; margin-right: 55px;">
                        <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" OnUploadComplete="AjaxFileUpload1_UploadComplete" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnNewVoucher" runat="server" ClientIDMode="Static" CssClass="btn btn-info hidden" Text="Add New Voucher" /><input type="button" id="btnSaveV" value="Save Voucher" class="btn btn-info" />&nbsp;<input type="button" id="btnprtP" value="Print Voucher" class="btn btn-info" style="display: none" />
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
        }); var xList, xList1, VouID, dels;
        $(document).ready(function () {
            $('#Parea').hide();
            $('#btnSaveV').hide();
            $("#VSearchList").live('click', function (e) { $('#xvcher').slideToggle('slow'); });
            $(".vlist").live('click', function (e) {
                VouID = $(this).children().children()[1].title;
                dels = "";
                $.ajax({
                    url: "accVSearchList.ashx/?ID=" + $(this).children().children()[1].title,
                    context: document.body,
                    success: function (responseText) {
                        var VData = responseText.split('|');
                        $('#JVNO')[0].innerHTML = "Voucher No. " + VData[0];
                        $('#JVNO').attr("title", VData[0]);
                        $('#txDate').val($.datepicker.formatDate('dd MM yy', new Date(VData[1])));
                        $('#txDate').attr("value", $('#txDate').val());
                        $('#htd')[0].innerHTML = VData[5];
                        $('#txJMemo').attr("value", VData[2]);
                        $('#txJMemo').val(VData[2]);
                        $('#xvcher').slideToggle('slow');
                        $('#Parea').show();
                        $('#btnSaveV').show();
                        $('#btnprtP').show();
                        $('#UpFiles').show();
                        $('#btomline').show();
                        //$('#Parea').addClass("print-contant")
                        $.cookie("VID", $(this).children().children()[1].title);
                        $('.ajax__fileupload_selectFileButton').attr("class", "ButtonClass");
                        $('.ajax__fileupload_dropzone').html("Upload Supporting Documents");
                    }
                });
                $.ajax({
                    url: "accFillVdtl.ashx/?ID=" + $(this).children().children()[1].title,
                    context: document.body,
                    success: function (responseText) {
                        var VData = responseText.split('¦');
                        var tblVr = "";
                        for (var i = 0; i < VData.length - 1; ++i) {
                            var col = VData[i].split("|");
                            tblVr = tblVr + '<tr> <td style="width: 189px"> <input class="AcName ui-autocomplete-input" type="text" style="width: 100%" autocomplete="off" value="' + col[0] + '" tag="' + col[4] + '"><span role="status" aria-live="polite" class="ui-helper-hidden-accessible">2 results are available, use up and down arrow keys to navigate.</span></td> <td style="width: 390px"> <input class="Dsc" type="text" value="' + col[1] + '" tag="' + col[5] + '" style="width: 100%"></td> <td style="width: 80px;"> <input class="Dr" type="text" style="width: 100%; text-align: right;" value="' + col[2] + '"></td> <td style="width: 80px;"> <input class="Cr" type="text" style="width: 100%; text-align: right;" readonly="readonly" value="' + col[3] + '"></td> <td style="width: 20px;"> <input class="btAdd" type="button" style="background-image: url(\'./images/AdR.ico\'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;"></td> <td style="width: 20px;"> <input class="btnrm" type="button" style="background-image: url(\'./images/close.ico\'); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;"></td> </tr> ';
                        }
                        //tblVr = tblVr + '<tr>  <td style="width: 189px">  <input class="AcName" type="text" style="width: 100%" value="" tag=""></td>  <td style="width: 390px">  <input class="Dsc" type="text" value="" style="width: 100%"></td>  <td style="width: 80px;">  <input class="Dr" type="text" style="width: 100%; text-align: right;"></td>  <td style="width: 80px;">  <input class="Cr" type="text" style="width: 100%; text-align: right;"></td>  <td style="width: 20px;">  <input class="btAdd" type="button" style="background-image: url("./images/AdR.ico"); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;"></td>  <td style="width: 20px;">  <input class="btnrm" type="button" style="background-image: url("./images/close.ico"); background-repeat: no-repeat; width: 20px; height: 20px; background-color: #FFFFFF;"></td>  </tr>';
                        $('#test-table').html("<tbody>" + tblVr + "</tbody>");
                        SumUp();
                    }
                });
                $.ajax({
                    url: "accSupportDocList.ashx/?ID=" + $(this).children().children()[1].title,
                    context: document.body,
                    success: function (responseText) {
                        $('#upfilesList').html(responseText);
                    }
                });
            });
            //Auto Fill Accounts
            var xList2;
            $.ajax({
                url: "accAccountsList.ashx/?ID=16," + $('#AcYearID').attr("class"),
                context: document.body,
                success: function (responseText) {
                    xList = responseText.split('|');
                    xList1 = xList[1].split('¦');
                    xList2 = xList[0].split('¦');
                }
            });
            //auto compleate group
            $('.AcName').live('keypress', function (e) {
                $(".AcName").autocomplete({
                    source: function (request, response) {
                        var matches = $.map(xList2, function (tag) {
                            if (tag.toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                                return tag;
                            }
                        });
                        response(matches);
                    }
                });
            });
            //Dr. Cr. check
            $('.Dr').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
                if ($(this).val() == 0 || $(this).val() == "") {
                    $($(this).parent().next()[0].children[0]).removeAttr('readonly');
                } else { $($(this).parent().next()[0].children[0]).attr('readonly', 'readonly'); }
                SumUp();
            });
            $('.Cr').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
                if ($(this).val() == 0 || $(this).val() == "") {
                    $($(this).parent().prev()[0].children).removeAttr('readonly');
                } else { $($(this).parent().prev()[0].children).attr('readonly', 'readonly'); }
                SumUp();
            });
            $('#txDate').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
            });
            $('.Dsc').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
            });
            $('#txJMemo').live('focusout', function (e) {
                $(this).attr("value", $(this).val());
            });
            //get account id

            $('.AcName').live('focusout', function (e) {
                var obj = $(this);
                $(this).attr("value", $(this).val());
                $(this).attr("tag", xList1[jQuery.inArray($(this).val(), xList2)])
                if ($(this).attr("tag") == "") { alertR("Invalid Account !"); }
            }); //end keypress
            $(".Cr").live('keypress paste', function (e) {
                if ((e.which == 46 && $(this).val().indexOf('.') == -1) || e.which == 0 || e.which == 8) {
                } else {
                    if (isNaN(String.fromCharCode(e.which))) {
                        return false;
                    }
                }
            });
            $(".Dr").live('keypress paste', function (e) {
                //alert(e.which);
                if ((e.which == 46 && $(this).val().indexOf('.') == -1) || e.which == 0 || e.which == 8) {
                } else {
                    if (isNaN(String.fromCharCode(e.which))) {
                        return false;
                    }
                }
            });
            $('.Cr:last').live('keypress', function (e) {
                if (e.which == 13) {
                    var row = '<tr>' + $('#test-table tr:last').html() + '</tr>';
                    $('#btnRmv').removeAttr('id');
                    $('#test-table tr:last').after(row);
                    $('#test-table tr:last td input').val('')
                    $('.AcName:last').focus();
                    $('.AcName:last').attr('tag', '');
                }
            });

            $('.btAdd:last').live('click keypress', function () {
                var row = '<tr>' + $('#test-table tr:last').html() + '</tr>';
                $('#btAd').hide();
                $('#btAd').removeAttr('id');

                $('#test-table tr:last').after(row);
                $('#test-table tr:last td input').val('');
                $('.AcName:last').focus();
                $('.AcName:last').attr('tag', '');
                $('.Dsc:last').attr('tag', '');
            });
            $('.btnrm').live('click', function () {
                if ($('#test-table tr').length > 1) {
                    $(this).parent().parent().remove()
                    dels = "," + $(this).parent().prev().prev().prev().prev().children(1).attr("tag") + dels;
                }
            });
            function SumUp() {
                var dataDr = 0;
                var dataCr = 0;
                $('.AcName').each(function () {
                    if ($(this).attr("tag") != "") {
                        var dd = $(this).parent().next().next().children(1).val().replace(/ /g, "");
                        var cc = $(this).parent().next().next().next().children(1).val().replace(/ /g, "");
                        if (cc == "") {
                            cc = 0;
                        }
                        if (dd == "") {
                            dd = 0;
                        }
                        dataDr = dataDr + parseFloat(dd);

                        dataCr = dataCr + parseFloat(cc);
                    }
                });
                $('#txCrT').val(dataCr);
                $('#txDrT').val(dataDr);
                $('#txDrT').attr("value", dataDr);
                $('#txCrT').attr("value", dataCr);
            }
            $('#btnprtP').click(function () {
                //var printContents = $('#Parea').html().toString();
                //var originalContents = document.body.innerHTML;
                //document.body.innerHTM=printContents;
                //window.print();
                //document.body.innerHTML = originalContents;
                $('.btAdd').hide();
                $('.btnrm').hide();
                //$('#Parea input').attr("disabled", true)
                $('.ui-helper-hidden-accessible').html('');
                $('.ui-helper-hidden-accessible').html('');
                var content = $('#Parea').html().toString();
                var pwin = window.open('', 'print_content', 'width=900,height=700');

                pwin.document.open();

                pwin.document.write('<html><body onload="window.print()">' + content + '</body><style type="text/css">.hidden{display:none;} input:disabled {background: #fff;color: #000;} input {border-width: 0px;background-color: white;}</style></html>');
                pwin.document.close();

                setTimeout(function () { pwin.close(); }, 1000);
            });

            $('#btnSaveV').click(function () { //get data from table
                if (vdcheck()) {
                    SumUp();
                    var dataIN = ''; var dataUP = '';
                    var dataDr = 0;
                    var dataCr = 0;
                    $('.AcName').each(function () {
                        if ($(this).attr("tag") != "") {
                            if ($(this).parent().next().next().children(1).val() == "") {
                                $(this).parent().next().next().children(1).val(0);
                            }
                            if ($(this).parent().next().next().next().children(1).val() == "") {
                                $(this).parent().next().next().next().children(1).val(0);
                            }
                            if ($(this).parent().next().children(1).val() == "") {
                                $(this).parent().next().children(1).val(' ');
                            }
                            dataDr = dataDr + parseFloat($(this).parent().next().next().children(1).val().replace(/ /g, ""));
                            dataCr = dataCr + parseFloat($(this).parent().next().next().next().children(1).val().replace(/ /g, ""));
                            if ($(this).parent().next().children(1).attr("tag") == "") {
                                dataIN = dataIN + "Ï" + $(this).attr("tag") + ',\'' + $(this).parent().next().children(1).val().replace(/'/g, "‘") + '\',' + $(this).parent().next().next().children(1).val().replace(/ /g, "") + ',' + $(this).parent().next().next().next().children(1).val().replace(/ /g, "") + "," + $.cookie('UserID') + "Î";
                            }
                            else {
                                dataUP = dataUP + "UPDATE TblVoucherDTL SET AccEntryID=" + $(this).attr("tag") + ',Description=\'' + $(this).parent().next().children(1).val().replace(/'/g, "‘") + '\',AmountDeb=' + $(this).parent().next().next().children(1).val().replace(/ /g, "") + ',AmountCre=' + $(this).parent().next().next().next().children(1).val().replace(/ /g, "") + ",LMB=" + $.cookie('UserID') + " WHERE ID=" + $(this).parent().next().children(1).attr("tag") + ";";
                            }
                        }
                    });
                    if (dataDr != dataCr || dataCr == 0) {
                        alertR("Debit(" + dataDr + ") and Credit(" + dataCr + ") side are not equal …");
                        return false;
                    }
                    $.ajax({
                        url: "accupdateJV.ashx/?ID=" + dataIN + "¦" + $('#txDate').val() + "¦" + dataUP + "¦" + $.cookie('UserID') + "¦" + dels + "¦" + $('#txJMemo').val() + "¦" + VouID + "¦0",
                        context: document.body,
                        success: function (responseText) {
                            if (responseText != "0") {
                                $('#JVNO').attr('tag', responseText);
                                $('.Cr').each(function () {
                                    $(this).val($.number($(this).val(), 0));
                                    $(this).attr('value', $(this).val());
                                });

                                $('.Dr').each(function () {
                                    $(this).val($.number($(this).val(), 0));
                                    $(this).attr('value', $(this).val());
                                });
                                $('#txDrT').val($.number($('#txDrT').val(), 0));
                                $('#txDrT').attr('value', $('#txDrT').val());
                                $('#txCrT').val($.number($('#txCrT').val(), 0));
                                $('#txCrT').attr('value', $('#txCrT').val());
                                $('#Parea input').attr('disabled', 'disabled');
                                alertG("Successfully Saved!");
                            }
                        }
                    });
                }
            });
        });
        function vdcheck() {
            var chk = true;
            if ($('#txDate').val().substring(3) != $('#AcYearID').attr("tag")) {
                chk = false;
                alertR("Please select a valid date");
                $('#txDate').focus();
                return false;
            }

            $('.AcName').each(function () {
                if ($(this).attr("tag") == "") {
                    chk = false
                    alertR("Please enter account title ...");
                }
            });
            return chk;
        }
    </script>
</asp:Content>