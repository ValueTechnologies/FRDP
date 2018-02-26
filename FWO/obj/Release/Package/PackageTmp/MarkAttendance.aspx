<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="MarkAttendance.aspx.cs" Inherits="FRDP.MarkAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        select[name=tblatt_length] {
            /* width: 150px; */
            width: 62px !important;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Area / Month Selection</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                                            <tr>
            <td>Office Type</td>
            <td>
                <asp:DropDownList ID="ddlOfficeTypes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOfficeTypes_SelectedIndexChanged" Width="94%">
                    <asp:ListItem Value="1">Head Office</asp:ListItem>
                    <asp:ListItem Value="2">Co-Ordinatiton Office</asp:ListItem>
                    <asp:ListItem Value="3">Field Office</asp:ListItem>
                    <asp:ListItem Value="6">School</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lblDsu" runat="server" Text="DSU" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDSU" runat="server" AutoPostBack="True" DataSourceID="sdDSU" DataTextField="CompanyName" DataValueField="CompanyID" Visible="False" Width="94%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdDSU" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT [CompanyID], [CompanyName] FROM [tbl_Company] WHERE ([lvl] = @lvl) ORDER BY [CompanyName]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="lvl" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
                            <tr>
                                <td style="width: 100px;">Office</td>
                                <td style="text-align: left; width: 40%;">
                                    <asp:DropDownList name="<%= ddlLocation.ClientID %>" ID="ddlLocation" runat="server" Width="94%" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" ClientIDMode="Static"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListByEmpPPHI" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:CookieParameter CookieName="Emp_Id" Name="User_ID" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlOfficeTypes" DefaultValue="1" Name="lvl" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlDSU" DefaultValue="0" Name="ParentId" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 100px;">Designation</td>
                                <td style="text-align: left;">
                                    <asp:SqlDataSource ID="SDGenerator" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT '%' AS ID, 'All' AS NAME, 1 AS ord UNION SELECT CAST(ID AS VARCHAR(10)) AS Expr1, NAME, 1 AS ord FROM tblDesig ORDER BY ord, NAME"></asp:SqlDataSource>
                                    <asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="NAME" DataValueField="ID" Enabled="True" ClientIDMode="Static"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>Month</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_Month" runat="server" Width="94%" ClientIDMode="Static">
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td>Year</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_year" runat="server" Width="94%" ClientIDMode="Static">
                                        <asp:ListItem Selected="True">2015</asp:ListItem>
                                        <asp:ListItem>2016</asp:ListItem>
                                        <asp:ListItem>2017</asp:ListItem>
                                        <asp:ListItem>2018</asp:ListItem>
                                        <asp:ListItem>2019</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Get Attendance" ClientIDMode="Static" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                </div>

            </div>

        </div>
    </div>


    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Attendance</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />

                    <div id="atten" style="font-size: smaller;"></div>
                    <br />
                    <br />

                    <br />
                    <br />

                </div>

            </div>

        </div>
    </div>

    <div id="dvMark" style="display: none;" title="Mark Attendance">
        <div id="dved"></div>
        <table>
            <tr>
                <td style="width:55px;">Time In</td>
                <td>
                    <input id="txtStartDate" type="text" disabled="disabled" style="width: 90%;" /></td>
                <td>
                    <input id="txtStartTime" type="text" style="width: 50%;" /></td>
                <td style="width:55px;">Time Out</td>
                <td>
                    <input id="txtEndDate" type="text" style="width: 90%;" /></td>
                <td>
                    <input id="txtEndTime" type="text" style="width: 50%;" /></td>
            </tr>
            <tr>

                <td colspan="6" style="text-align:right;">
                    <button class="btn btn-info" id="btnPresent">Present</button>
                    <button class="btn btn-danger" id="btnAbsent">Absent</button></td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            function showEmpDetails() {
                $('#dved').html('');
                $.ajax({
                    type: 'GET',
                    url: "EmpReg.ashx/?ID=39ǁ" + $('#dvMark').attr('eid') + "ǁ" + $('#dvMark').attr('eid'),
                    success: function (data) {
                        var txt = '<table class="table">\
           <tbody>\
               <tr class="success">\
                   <td rowspan="3" style="width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;">\
                   <img id="ttximgEmpPhotot" src="Uploads/EmployeePhoto/0.png" alt="" style="width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;" class="marginR10" /></td>\
                   <td style="text-align: left; width: 80px;"><strong>Emp#</strong></td>\
                   <td style="text-align: left;" id="ttx1"></td>\
                   <td style="text-align: left; width: 90px;"><strong>Name</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="ttx2"></td>\
               </tr>\
               <tr class="error">\
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>CNIC</strong></td>\
                   <td style="text-align: left;" id="ttx3"></td>\
                   <td style="text-align: left;"><strong>Father Name</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="ttx4"></td>\
               </tr>\
               <tr class="info">\
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>Designation</strong></td>\
                   <td style="text-align: left;" id="ttx5"></td>\
                   <td style="text-align: left;"><strong>Appointed At</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="ttx6"></td>\
               </tr>\
                <tr class="error">\
                <td style="border-left: 1px solid #c4c4c4;">&nbsp; </td>\
                   <td style="text-align: left;"><strong>Shift</strong></td>\
                   <td style="text-align: left;" id="ttx7"></td>\
                   <td style="text-align: left;"><strong>Contact</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="ttx8"></td>\
               </tr>\
           </tbody>\
       </table>';
                        var jd = $.parseJSON(data);
                        $('#dved').html(txt);
                        $('#ttximgEmpPhotot').attr('src', 'Uploads/EmployeePhoto/' + jd[0].PhotoExtension);
                        $('#ttx1').html(jd[0].EmpNo);
                        $('#ttx2').html(jd[0].Full_Name);
                        $('#ttx3').html(jd[0].CNIC);
                        $('#ttx4').html(jd[0].FatherName);
                        $('#ttx5').html(jd[0].Designations);
                        $('#ttx6').html(jd[0].Area);
                        //$('#ttx7').html(jd[0].Shift);
                        if (jd[0].Shift == "Morning Shift") {
                            $('#ttx7').html('<select id="ddlshift123" style="width: 95px; margin-bottom: -5px;margin-top: -5px;border: none;background: transparent;"><option value="1" selected="">Morning Shift</option><option value="2">Evening Shift</option><option value="3">Night Shift</option></select>');
                        }
                        if (jd[0].Shift == "Evening Shift") {
                            $('#ttx7').html('<select id="ddlshift123" style="width: 95px; margin-bottom: -5px;margin-top: -5px;border: none;background: transparent;"><option value="1">Morning Shift</option><option value="2" selected="">Evening Shift</option><option value="3">Night Shift</option></select>');
                        }
                        if (jd[0].Shift == "Night Shift") {
                            $('#ttx7').html('<select id="ddlshift123" style="width: 95px; margin-bottom: -5px;margin-top: -5px;border: none;background: transparent;"><option value="1">Morning Shift</option><option value="2">Evening Shift</option><option value="3" selected="">Night Shift</option></select>');
                        }
                        $('#ttx8').html(jd[0].ContactNos);

                    }
                });

            }

            $('#ddlshift123').live('change', function () {

                $('#btnPresent').attr('Disabled', 'Disabled')
                $('#btnAbsent').attr('Disabled', 'Disabled')
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=30ǁ" + $('#dvMark').attr('eid') + "ǁ" + $('#ddlshift123').val(),
                    success: function (response) {
                        if (response == "1") {
                            $('#btnPresent').removeAttr('Disabled');
                            $('#btnAbsent').removeAttr('Disabled');
                            alertG('Record Updated..!');
                        }
                    }
                });
            });

            $('#txtStartDate').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
            });
            $('#txtEndDate').datepicker({
                dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,
            });
            $('#txtStartTime,#txtEndTime').timeEntry({
                show24Hours: true,
                spinnerImage: ''
            });
            $('#txtStartTime,#txtEndTime').timeEntry('setTime', '00:00');
            var $thistd;
            var _$_e0ca = ["click", "html", "A", "hide", "#btnAbsent", "show", "setDate", "dd", "attr", "/", "val", "datepicker", "#txtStartDate", "#txtEndDate", "eid", "#dvMark", "open", "dialog", "live", ".clsTdMark"]; $(_$_e0ca[19])[_$_e0ca[18]](_$_e0ca[0], function () { $thistd = $(this); if ($thistd[_$_e0ca[1]]() == _$_e0ca[2]) { $(_$_e0ca[4])[_$_e0ca[3]]() } else { $(_$_e0ca[4])[_$_e0ca[5]]() }; $(_$_e0ca[12])[_$_e0ca[11]](_$_e0ca[6], $thistd[_$_e0ca[8]](_$_e0ca[7]) + _$_e0ca[9] + $('#<%= DropDownList_Month.ClientID %>')[_$_e0ca[10]]() + _$_e0ca[9] + $('#<%= DropDownList_year.ClientID %>')[_$_e0ca[10]]()); $(_$_e0ca[13])[_$_e0ca[11]](_$_e0ca[6], $thistd[_$_e0ca[8]](_$_e0ca[7]) + _$_e0ca[9] + $('#<%= DropDownList_Month.ClientID %>')[_$_e0ca[10]]() + _$_e0ca[9] + $('#<%= DropDownList_year.ClientID %>')[_$_e0ca[10]]()); $(_$_e0ca[15])[_$_e0ca[8]](_$_e0ca[14], $thistd[_$_e0ca[8]](_$_e0ca[14])); $(_$_e0ca[15])[_$_e0ca[8]](_$_e0ca[7], $thistd[_$_e0ca[8]](_$_e0ca[7])); $(_$_e0ca[15])[_$_e0ca[17]](_$_e0ca[16]); showEmpDetails(); });
            var _$_9a8e = ["click", "POST", "EmpReg.ashx/?ID=36ǁ", "eid", "attr", "#dvMark", "ǁ", "dd", "/", "val", "option:selected", "find", "#txtStartTime", "#txtEndTime", "1", "background-color", "rgba(252, 0, 0, 0.24)", "css", "A", "html", "close", "dialog", "ajax", "live", "#btnAbsent"]; $(_$_9a8e[24])[_$_9a8e[23]](_$_9a8e[0], function () { $[_$_9a8e[22]]({ type: _$_9a8e[1], url: _$_9a8e[2] + $(_$_9a8e[5])[_$_9a8e[4]](_$_9a8e[3]) + _$_9a8e[6] + $(_$_9a8e[5])[_$_9a8e[4]](_$_9a8e[7]) + _$_9a8e[8] + $('#<%= DropDownList_Month.ClientID %>')[_$_9a8e[11]](_$_9a8e[10])[_$_9a8e[9]]() + _$_9a8e[8] + $('#<%= DropDownList_year.ClientID %>  option:selected')[_$_9a8e[9]]() + _$_9a8e[6] + $(_$_9a8e[12])[_$_9a8e[9]]() + _$_9a8e[6] + $(_$_9a8e[13])[_$_9a8e[9]](), success: function (a) { if (a == _$_9a8e[14]) { $thistd[_$_9a8e[17]](_$_9a8e[15], _$_9a8e[16]); $thistd[_$_9a8e[19]](_$_9a8e[18]); $(_$_9a8e[5])[_$_9a8e[21]](_$_9a8e[20]); } } }) });
            var _$_c3b9 = ["click", "POST", "EmpReg.ashx/?ID=35ǁ", "eid", "attr", "#dvMark", "ǁ", "dd", "/", "val", "option:selected", "find", "#txtStartTime", "#txtEndTime", "#txtEndDate", "background-color", "White", "css", "P", "html", "close", "dialog", "ajax", "live", "#btnPresent"]; $(_$_c3b9[24])[_$_c3b9[23]](_$_c3b9[0], function () { $[_$_c3b9[22]]({ type: _$_c3b9[1], url: _$_c3b9[2] + $(_$_c3b9[5])[_$_c3b9[4]](_$_c3b9[3]) + _$_c3b9[6] + $(_$_c3b9[5])[_$_c3b9[4]](_$_c3b9[7]) + _$_c3b9[8] + $('#<%= DropDownList_Month.ClientID %>')[_$_c3b9[11]](_$_c3b9[10])[_$_c3b9[9]]() + _$_c3b9[8] + $('#<%= DropDownList_year.ClientID %>  option:selected')[_$_c3b9[9]]() + _$_c3b9[6] + $(_$_c3b9[12])[_$_c3b9[9]]() + _$_c3b9[6] + $(_$_c3b9[13])[_$_c3b9[9]]() + _$_c3b9[6] + $(_$_c3b9[14])[_$_c3b9[9]](), success: function (a) { $thistd[_$_c3b9[17]](_$_c3b9[15], _$_c3b9[16]); $thistd[_$_c3b9[19]](_$_c3b9[18]); $(_$_c3b9[5])[_$_c3b9[21]](_$_c3b9[20]); } }) });
            $(function () {
                $('#dvMark').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 320,
                    width: 630,

                    show: {
                        effect: "clip",
                        duration: 500
                    },
                    hide: {
                        effect: "clip",
                        duration: 500
                    }
                });
            });

            var a, b, c;
            $('#<%= DropDownList_Month.ClientID %>').live('change', function () {
                a = $(this).find("option:selected").val();
            });

            $('#<%= DropDownList_year.ClientID %>').live('change', function () {
                b = $(this).find("option:selected").val();
            });
            $('#<%= ddlLocation.ClientID %>').live('change', function () {
                c = $(this).find("option:selected").val();
            });
            $(function () {
                $('.leftbar').click();

                a = $('#<%= DropDownList_Month.ClientID %>').find("option:selected").val();
                b = $('#<%= DropDownList_year.ClientID %>').find("option:selected").val();
                c = $('#<%= ddlLocation.ClientID %>').find("option:selected").val();
                if (c == null || c == undefined) {
                    $('#atten').html('<span style="margin-left: 45%;">Select Office to Mark Attendance</span>');
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=33ǁ" + $('#<%= DropDownList_Month.ClientID %>  option:selected').val() + "ǁ" + $('#<%= DropDownList_year.ClientID %>  option:selected').val() + "ǁ" + $('#<%= ddlLocation.ClientID %>  option:selected').val(),
                    success: function (response) {
                        $('#atten').html(response);
                        $('#tblatt').addClass('dynamicTable');
                        $('.dynamicTable').dataTable({
                            "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
                            "iDisplayLength": tblatt_length,
                            "sPaginationType": "full_numbers",
                            "bJQueryUI": false,
                            "bAutoWidth": false,
                            "bLengthChange": true,
                            "fnInitComplete": function (oSettings, json) {
                                $('.dataTables_filter>label>input').attr('id', 'search');
                            }
                        });
                    }
                });
            });
            var tblatt_length = 10;
            $('#<%= btnShowRpt.ClientID %>').live('click', function (e) {

                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=33ǁ" + a + "ǁ" + b + "ǁ" + c,
                    success: function (response) {
                        $('#atten').html(response);
                        $('#tblatt').addClass('dynamicTable');
                        $('.dynamicTable').dataTable({
                            "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
                            "iDisplayLength": tblatt_length,
                            "sPaginationType": "full_numbers",
                            "bJQueryUI": false,
                            "bAutoWidth": false,
                            "bLengthChange": true,
                            "fnInitComplete": function (oSettings, json) {
                                $('.dataTables_filter>label>input').attr('id', 'search');
                            }
                        });
                    }
                });
                e.preventDefault();
            });
            $('select[name=tblatt_length]').live('change', function () {
                tblatt_length = $(this).val();
            });
            /////////////////////////////
            $(function () {
                var hideDelay = 500;
                var currentID;
                var hideTimer = null;

                // One instance that's reused to show info for the current person
                var container = $('<div id="clsShowMonthlyAttendanceContainer">'
                    + '<table width="" border="0" cellspacing="0" cellpadding="0" align="center" class="clsShowMonthlyAttendancePopup">'
                    + '<tr>'
                    + '   <td class="corner topLeft"></td>'
                    + '   <td class="top"></td>'
                    + '   <td class="corner topRight"></td>'
                    + '</tr>'
                    + '<tr>'
                    + '   <td class="left">&nbsp;</td>'
                    + '   <td style="background-color: white;"><div id="clsShowMonthlyAttendanceContent"></div><div id="clsShowMonthlyAttendanceAttendance"></div></td>'
                    + '   <td class="right">&nbsp;</td>'
                    + '</tr>'
                    + '<tr>'
                    + '   <td class="corner bottomLeft">&nbsp;</td>'
                    + '   <td class="bottom">&nbsp;</td>'
                    + '   <td class="corner bottomRight"></td>'
                    + '</tr>'
                    + '</table>'
                    + '</div>');

                $('body').append(container);

                var _$_177e = ["mouseover", "val", "option:selected", "find", "rel", "attr", "", "offset", "width", "left", "px", "top", "css", "&nbsp;", "html", "#clsShowMonthlyAttendanceContent", "GET", "EmpReg.ashx/?ID=39ǁ", "ǁ", "<table class=\"table\">\r           <tbody>\r               <tr class=\"success\">\r                   <td rowspan=\"3\" style=\"width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;\">\r                   <img id=\"imgEmpPhotot\" src=\"Uploads/EmployeePhoto/0.png\" alt=\"\" style=\"width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;\" class=\"marginR10\" /></td>\r                   <td style=\"text-align: left; width: 80px;\"><strong>Emp#</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt1\"></td>\r                   <td style=\"text-align: left; width: 90px;\"><strong>Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt2\"></td>\r               </tr>\r               <tr class=\"error\">\r                   <td style=\"text-align: left;    border-left: 1px solid #c4c4c4;\"><strong>CNIC</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt3\"></td>\r                   <td style=\"text-align: left;\"><strong>Father Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt4\"></td>\r               </tr>\r               <tr class=\"info\">\r                   <td style=\"text-align: left;    border-left: 1px solid #c4c4c4;\"><strong>Designation</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt5\"></td>\r                   <td style=\"text-align: left;\"><strong>Appointed At</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt6\"></td>\r               </tr>\r                <tr class=\"error\">\r                <td style=\"border-left: 1px solid #c4c4c4;\">&nbsp; </td>\r                   <td style=\"text-align: left;\"><strong>Shift</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt7\"></td>\r                   <td style=\"text-align: left;\"><strong>Contact</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt8\"></td>\r               </tr>\r           </tbody>\r       </table>", "parseJSON", "src", "Uploads/EmployeePhoto/", "PhotoExtension", "#imgEmpPhotot", "EmpNo", "#tt1", "Full_Name", "#tt2", "CNIC", "#tt3", "FatherName", "#tt4", "Designations", "#tt5", "Area", "#tt6", "Shift", "#tt7", "ContactNos", "#tt8", "ajax", "POST", "EmpReg.ashx/?ID=38ǁ", "#clsShowMonthlyAttendanceAttendance", "display", "block", "live", ".clsShowMonthlyAttendance"];
                $(_$_177e[48])[_$_177e[47]](_$_177e[0],
                    function () {
                        var a = $('#<%= DropDownList_Month.ClientID %>')[_$_177e[3]](_$_177e[2])[_$_177e[1]]();
                        var b = $('#<%= DropDownList_year.ClientID %>')[_$_177e[3]](_$_177e[2])[_$_177e[1]](); currentID = $(this)[_$_177e[5]](_$_177e[4]);
                        if (currentID == _$_177e[6]) { return };
                        if (hideTimer) { clearTimeout(hideTimer) };
                        var c = $(this)[_$_177e[7]]();
                        var d = $(this)[_$_177e[8]]();
                        container[_$_177e[12]]({ left: (c[_$_177e[9]] + d) + _$_177e[10], top: c[_$_177e[11]] - 5 + _$_177e[10] });
                        $(_$_177e[15])[_$_177e[14]](_$_177e[13]);
                        $[_$_177e[41]]({
                            type: _$_177e[16], url: _$_177e[17] + currentID + _$_177e[18] + a,
                            success: function (e)
                            {
                                var g = _$_177e[19];
                                var f = $[_$_177e[20]](e);
                                $(_$_177e[15])[_$_177e[14]](g);
                                $(_$_177e[24])[_$_177e[5]](_$_177e[21], _$_177e[22] + f[0][_$_177e[23]]); $(_$_177e[26])[_$_177e[14]](f[0][_$_177e[25]]);
                                $(_$_177e[28])[_$_177e[14]](f[0][_$_177e[27]]);
                                $(_$_177e[30])[_$_177e[14]](f[0][_$_177e[29]]);
                                $(_$_177e[32])[_$_177e[14]](f[0][_$_177e[31]]);
                                $(_$_177e[34])[_$_177e[14]](f[0][_$_177e[33]]);
                                $(_$_177e[36])[_$_177e[14]](f[0][_$_177e[35]]);
                                $(_$_177e[38])[_$_177e[14]](f[0][_$_177e[37]]);
                                $(_$_177e[40])[_$_177e[14]](f[0][_$_177e[39]]);
                            }
                        });
                        $[_$_177e[41]]({
                            type: _$_177e[42],
                            url: _$_177e[43] + currentID + _$_177e[18] + a + _$_177e[18] + b,
                            success:
                                function (h)
                                {
                                    $(_$_177e[44])[_$_177e[14]](h)
                                }
                        });
                        container[_$_177e[12]](_$_177e[45], _$_177e[46]);
                    });

                var _$_42e8 = ["mouseout", "display", "none", "css", "live", ".clsShowMonthlyAttendance"]; $(_$_42e8[5])[_$_42e8[4]](_$_42e8[0], function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_42e8[3]](_$_42e8[1], _$_42e8[2]) }, hideDelay); });

                // Allow mouse over of details without hiding details
                var _$_469c = ["mouseover", "#clsShowMonthlyAttendanceContainer"]; $(_$_469c[1])[_$_469c[0]](function () { if (hideTimer) { clearTimeout(hideTimer) } });

                // Hide after mouseout
                var _$_f665 = ["display", "none", "css", "mouseout", "#clsShowMonthlyAttendanceContainer"]; $(_$_f665[4])[_$_f665[3]](function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_f665[2]](_$_f665[0], _$_f665[1]) }, hideDelay); });
            });
            ///////////////////////////////////////////
        });//END OF READY FUNC
    </script>
</asp:Content>
