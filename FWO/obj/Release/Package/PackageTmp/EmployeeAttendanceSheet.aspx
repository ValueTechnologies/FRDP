<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeAttendanceSheet.aspx.cs" Inherits="FRDP.EmployeeAttendanceSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">







<%--    <script type="text/javascript" src="plugins/misc/jspdf/tableExport.js"></script>
    <script type="text/javascript" src="plugins/misc/jspdf/jquery.base64.js"></script>
    <script type="text/javascript" src="plugins/misc/jspdf/html2canvas.js"></script>
    <script type="text/javascript" src="plugins/misc/jspdf/jspdf/libs/sprintf.js"></script>
    <script type="text/javascript" src="plugins/misc/jspdf/jspdf/jspdf.js"></script>
    <script type="text/javascript" src="plugins/misc/jspdf/jspdf/libs/base64.js"></script>--%>










    <style type="text/css">
        select[name=tblatt_length] {
            /* width: 150px; */
            width: 62px !important;
        }
    </style>


    <table id="tblxyz" style="width:100%;">
        <thead>
            <tr>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Office / Month Selection</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <br />
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
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
        <td style="width:100px;">Office</td>
        <td style="text-align:left; width: 40%;">
            <asp:DropDownList name="<%= ddlLocation.ClientID %>" ID="ddlLocation" runat="server" Width="94%" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" ClientIDMode="Static" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListByEmpPPHI" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:CookieParameter CookieName="Emp_Id" Name="User_ID" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlOfficeTypes" DefaultValue="1" Name="lvl" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlDSU" DefaultValue="0" Name="ParentId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </td>
        <td style="width:100px;">Designation</td>
        <td style="text-align:left;">
            <asp:SqlDataSource ID="SDGenerator" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT '%' AS ID, 'All' AS NAME, 0 AS ord UNION SELECT CAST(ID AS VARCHAR(10)) AS Expr1, NAME, 1 AS ord FROM tblDesig ORDER BY ord, NAME">
            </asp:SqlDataSource>
            <asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="NAME" DataValueField="ID" Enabled="True" ClientIDMode="Static"></asp:DropDownList></td>
    </tr>
        <tr>
            <td>Month</td>
            <td>
                <asp:DropDownList ID="DropDownList_Month" runat="server"  Width="94%" ClientIDMode="Static">
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
            <td><asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Get Attendance" ClientIDMode="Static" OnClick="btnShowRpt_Click" /></td>
        </tr>
    </tbody>
</table><br />
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

                                                                                                    <span class="box-form right" action="">
                                    <h4>
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <span class="icon16 icomoon-icon-cog-2"></span>
                                <span class="caret"></span>
                            </a>

<ul class="dropdown-menu "  style="margin-left:-114px;">
								<li><a href="#" target="_blank" onclick="$('#tblatt').tableExport({type:'json',escape:'false'});"> <img src="images/icons/json.png" style="width:14px;"> JSON</a></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'json',escape:'false'});"> <img src="images/icons/json.png" style="width:14px;"> JSON (ignoreColumn)</a></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'json',escape:'true'});"> <img src="images/icons/json.png" style="width:14px;"> JSON (with Escape)</a></li>
								<li class="divider"></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'xml',escape:'false'});"> <img src="images/icons/xml.png" style="width:14px;"> XML</a></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'sql'});"> <img src="images/icons/sql.png" style="width:14px;"> SQL</a></li>
								<li class="divider"></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'csv',escape:'false'});"> <img src="images/icons/csv.png" style="width:14px;"> CSV</a></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'txt',escape:'false'});"> <img src="images/icons/txt.png" style="width:14px;"> TXT</a></li>
								<li class="divider"></li>				
								
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'excel',escape:'false'});"> <img src="images/icons/xls.png" style="width:14px;"> XLS</a></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'doc',escape:'false'});"> <img src="images/icons/word.png" style="width:14px;"> Word</a></li>
								<li><a href="#" target="_blank"  onclick="$('#tblatt').tableExport({type:'powerpoint',escape:'false'});"> <img src="images/icons/ppt.png" style="width:14px;"> PowerPoint</a></li>
								<li class="divider"></li>
								<li><a href="#" target="_blank" onclick="$('#tblxyz').tableExport({type:'png',escape:'false'});"> <img src="images/icons/png.png" style="width: 14px;"> PNG</a></li>
								<li><a href="#" target="_blank" onclick="$('#tblatt').tableExport({type:'pdf',pdfFontSize:'5',escape:'false'});"> <img src="images/icons/pdf.png" style="width:14px;"> PDF</a></li>
								
								
							</ul>
                        </span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>


                                </div>
                                <div class="content noPad">
                                    <br />

                                    <div id="atten" style="font-size: smaller;"></div><br /><br />

<br /><br />

</div>

                            </div>

                        </div>
    </div>

</td>
            </tr>
        </tbody>
    </table>

    <script type="text/javascript">

        $(document).ready(function () {

            var a, b, c, tblatt_length = 10;
            $('#<%= DropDownList_Month.ClientID %>').live('change', function () {
                a = $(this).find("option:selected").val();
            });

            $('#<%= DropDownList_year.ClientID %>').live('change', function () {
                b=$(this).find("option:selected").val();
            });
            $('#<%= ddlLocation.ClientID %>').live('change', function () {
                c = $(this).find("option:selected").val();
            });
 
            var _$_4828 = ["click", ".leftbar", "val", "option:selected", "find", "POST", "EmpReg.ashx/?ID=33ǁ", "ǁ", "html", "#atten", "dynamicTable", "addClass", "#tblatt", "All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", ".dynamicTable", "ajax"]; $(function () { $(_$_4828[1])[_$_4828[0]](); a = $('#<%= DropDownList_Month.ClientID %>')[_$_4828[4]](_$_4828[3])[_$_4828[2]](); b = $('#<%= DropDownList_year.ClientID %>')[_$_4828[4]](_$_4828[3])[_$_4828[2]](); c = $('#<%= ddlLocation.ClientID %>')[_$_4828[4]](_$_4828[3])[_$_4828[2]](); $[_$_4828[21]]({ type: _$_4828[5], url: _$_4828[6] + $('#<%= DropDownList_Month.ClientID %>  option:selected')[_$_4828[2]]() + _$_4828[7] + $('#<%= DropDownList_year.ClientID %>  option:selected')[_$_4828[2]]() + _$_4828[7] + $('#<%= ddlLocation.ClientID %>  option:selected')[_$_4828[2]](), success: function (d) { $(_$_4828[9])[_$_4828[8]](d); $(_$_4828[12])[_$_4828[11]](_$_4828[10]); $(_$_4828[20])[_$_4828[19]]({ "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, _$_4828[13]]], "iDisplayLength": tblatt_length, "sPaginationType": _$_4828[14], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (f, e) { $(_$_4828[18])[_$_4828[17]](_$_4828[15], _$_4828[16]) } }); } }); });
            $('select[name=tblatt_length]').live('change', function () {
                tblatt_length = $(this).val();
            });
            var _$_5533 = ["click", "POST", "EmpReg.ashx/?ID=33ǁ", "ǁ", "html", "#atten", "dynamicTable", "addClass", "#tblatt", "All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", ".dynamicTable", "ajax", "preventDefault", "live"]; $('#<%= btnShowRpt.ClientID %>')[_$_5533[19]](_$_5533[0], function (d) { $[_$_5533[17]]({ type: _$_5533[1], url: _$_5533[2] + a + _$_5533[3] + b + _$_5533[3] + c, success: function (f) { $(_$_5533[5])[_$_5533[4]](f); $(_$_5533[8])[_$_5533[7]](_$_5533[6]); $(_$_5533[16])[_$_5533[15]]({ "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, _$_5533[9]]], "iDisplayLength": tblatt_length, "sPaginationType": _$_5533[10], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (h, g) { $(_$_5533[14])[_$_5533[13]](_$_5533[11], _$_5533[12]) } }); } }); d[_$_5533[18]](); });

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

                var _$_ea02 = ["mouseover", "val", "option:selected", "find", "rel", "attr", "", "offset", "width", "left", "px", "top", "css", "&nbsp;", "html", "#clsShowMonthlyAttendanceContent", "GET", "EmpReg.ashx/?ID=39ǁ", "ǁ", "<table class=\"table\">\r           <tbody>\r               <tr class=\"success\">\r                   <td rowspan=\"3\" style=\"width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;\">\r                   <img id=\"imgEmpPhotot\" src=\"Uploads/EmployeePhoto/0.png\" alt=\"\" style=\"width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;\" class=\"marginR10\" /></td>\r                   <td style=\"text-align: left; width: 80px;\"><strong>Emp#</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt1\"></td>\r                   <td style=\"text-align: left; width: 90px;\"><strong>Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt2\"></td>\r               </tr>\r               <tr class=\"error\">\r                   <td style=\"text-align: left;\"><strong>CNIC</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt3\"></td>\r                   <td style=\"text-align: left;\"><strong>Father Name</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt4\"></td>\r               </tr>\r               <tr class=\"info\">\r                   <td style=\"text-align: left;\"><strong>Designation</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt5\"></td>\r                   <td style=\"text-align: left;\"><strong>Appointed At</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt6\"></td>\r               </tr>\r                <tr class=\"error\">\r                <td>&nbsp;</td>\r                   <td style=\"text-align: left;\"><strong>Shift</strong></td>\r                   <td style=\"text-align: left;\" id=\"tt7\"></td>\r                   <td style=\"text-align: left;\"><strong>Contact</strong></td>\r                   <td style=\"text-align: left; border-right: 1px solid #c4c4c4;\" id=\"tt8\"></td>\r               </tr>\r           </tbody>\r       </table>", "parseJSON", "src", "Uploads/EmployeePhoto/", "PhotoExtension", "#imgEmpPhotot", "EmpNo", "#tt1", "Full_Name", "#tt2", "CNIC", "#tt3", "FatherName", "#tt4", "Designations", "#tt5", "Area", "#tt6", "Shift", "#tt7", "ContactNos", "#tt8", "ajax", "POST", "EmpReg.ashx/?ID=38ǁ", "#clsShowMonthlyAttendanceAttendance", "display", "block", "live", ".clsShowMonthlyAttendance"]; $(_$_ea02[48])[_$_ea02[47]](_$_ea02[0], function () { var a = $('#<%= DropDownList_Month.ClientID%>')[_$_ea02[3]](_$_ea02[2])[_$_ea02[1]](); var b = $('#<%= DropDownList_year.ClientID%>')[_$_ea02[3]](_$_ea02[2])[_$_ea02[1]](); currentID = $(this)[_$_ea02[5]](_$_ea02[4]); if (currentID == _$_ea02[6]) { return }; if (hideTimer) { clearTimeout(hideTimer) }; var c = $(this)[_$_ea02[7]](); var d = $(this)[_$_ea02[8]](); container[_$_ea02[12]]({ left: (c[_$_ea02[9]] + d) + _$_ea02[10], top: c[_$_ea02[11]] - 5 + _$_ea02[10] }); $(_$_ea02[15])[_$_ea02[14]](_$_ea02[13]); $[_$_ea02[41]]({ type: _$_ea02[16], url: _$_ea02[17] + currentID + _$_ea02[18] + a, success: function (e) { var g = _$_ea02[19]; var f = $[_$_ea02[20]](e); $(_$_ea02[15])[_$_ea02[14]](g); $(_$_ea02[24])[_$_ea02[5]](_$_ea02[21], _$_ea02[22] + f[0][_$_ea02[23]]); $(_$_ea02[26])[_$_ea02[14]](f[0][_$_ea02[25]]); $(_$_ea02[28])[_$_ea02[14]](f[0][_$_ea02[27]]); $(_$_ea02[30])[_$_ea02[14]](f[0][_$_ea02[29]]); $(_$_ea02[32])[_$_ea02[14]](f[0][_$_ea02[31]]); $(_$_ea02[34])[_$_ea02[14]](f[0][_$_ea02[33]]); $(_$_ea02[36])[_$_ea02[14]](f[0][_$_ea02[35]]); $(_$_ea02[38])[_$_ea02[14]](f[0][_$_ea02[37]]); $(_$_ea02[40])[_$_ea02[14]](f[0][_$_ea02[39]]); } }); $[_$_ea02[41]]({ type: _$_ea02[42], url: _$_ea02[43] + currentID + _$_ea02[18] + a + _$_ea02[18] + b, success: function (h) { $(_$_ea02[44])[_$_ea02[14]](h) } }); container[_$_ea02[12]](_$_ea02[45], _$_ea02[46]); });
                var _$_a01f = ["mouseout", "display", "none", "css", "live", ".clsShowMonthlyAttendance"]; $(_$_a01f[5])[_$_a01f[4]](_$_a01f[0], function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_a01f[3]](_$_a01f[1], _$_a01f[2]) }, hideDelay); });

                // Allow mouse over of details without hiding details
                var _$_cb25 = ["mouseover", "#clsShowMonthlyAttendanceContainer"]; $(_$_cb25[1])[_$_cb25[0]](function () { if (hideTimer) { clearTimeout(hideTimer) } });

                // Hide after mouseout
                var _$_b070 = ["display", "none", "css", "mouseout", "#clsShowMonthlyAttendanceContainer"]; $(_$_b070[4])[_$_b070[3]](function () { if (hideTimer) { clearTimeout(hideTimer) }; hideTimer = setTimeout(function () { container[_$_b070[2]](_$_b070[0], _$_b070[1]) }, hideDelay); });
            });
            ///////////////////////////////////////////
        });//END OF READY FUNC
    </script>
</asp:Content>
