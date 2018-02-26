<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeTransferIMS.aspx.cs" Inherits="FRDP.EmployeeTransferIMS" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #AjaxUploadAttech {
            margin-left: 5px;
            margin-right: 5px;
        }

        #AjaxUploadAttech_FileStatusContainer {
            margin-right: 100px;
        }

        .ajax__fileupload_selectFileButton {
            background-color: #175DAD;
            color: #FFFFFF;
        }

        .box .dataTables_filter {
            margin-left: 65px;
        }

        select[name=tblEmpList_length] {
            /* width: 150px; */
            width: 62px !important;
        }

        #tblEmpList_length {
            margin-right: 32px;
        }

        #tblEmpList_filter {
            margin-left: 65px;
        }

        .table tfoot th {
            background: rgb(255,255,255);
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJod…EiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, rgba(255,255,255,1) 1%, rgba(243,243,243,1) 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(1%,rgba(255,255,255,1)), color-stop(100%,rgba(243,243,243,1)));
            background: -webkit-linear-gradient(top, rgba(255,255,255,1) 1%,rgba(243,243,243,1) 100%);
            background: -o-linear-gradient(top, rgba(255,255,255,1) 1%,rgba(243,243,243,1) 100%);
            background: -ms-linear-gradient(top, rgba(255,255,255,1) 1%,rgba(243,243,243,1) 100%);
            background: linear-gradient(top, rgba(255,255,255,1) 1%,rgba(243,243,243,1) 100%);
            -moz-box-shadow: 0 1px 0px rgba(255, 255, 255, 1);
            -webkit-box-shadow: 0 1px 0px rgba(255, 255, 255, 1);
            box-shadow: 0 1px 0px rgba(255, 255, 255, 1);
        }

            .table tfoot th input {
                margin-bottom: 2px;
                margin-top: 2px;
            }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Search Employee</span>
                    </h4>
                    <a id="SearchMinimizer" href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 100px;">
                                    <label style="text-align: right;">Office Type : &nbsp;</label></td>
                                <td style="text-align: left; width: 40%;">
                                    <select id="ddlCompanyType" class="pr">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>
                                <td style="width: 100px; text-align: right;">
                                    <label class="form-label span3 clsHelper" for="normal" style="display: none;">Select DSU</label></td>
                                <td style="text-align: left;">
                                    <select id="ddlDSUList" class="pr clsHelper" style="display: none;"></select></td>
                            </tr>
                            <tr>
                                <td>Office </td>
                                <td>
                                    <select id="ddlCompany" class="pr"></select></td>
                                <td>Group</td>
                                <td>
                                    <select id="ddlGroup" class="pr">
                                        <option></option>

                                    </select></td>
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td>
                                    <select id="ddlDept" class="pr"></select></td>
                                <td>Designation</td>
                                <td>
                                    <select id="ddlDesignation" class="pr"></select></td>
                            </tr>
                        </tbody>
                    </table>
                    <table id="tblEmpList" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th>Employee No</th>
                                <th>Name</th>
                                <th>CNIC</th>
                                <th>Cell#</th>
                                <th>Office</th>
                                <th>Department</th>
                                <th>Designation</th>
                                <th style="width: 52px;"></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr style="border-bottom: 1px solid #c4c4c4;">
                                <th>Employee No</th>
                                <th>Name</th>
                                <th>CNIC</th>
                                <th>Cell#</th>
                                <th>Office</th>
                                <th>Department</th>
                                <th>Designation</th>
                                <th style="width: 52px;"></th>
                            </tr>
                        </tfoot>
                        <tbody></tbody>
                    </table>
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>

    <div id="dvdtl" class="row-fluid" style="display: none;">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span id="btnprtP" class="icon16 icomoon-icon-printer-2" title="Click To Print"></span>
                        <span>Details :- </span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div id="PrintArea" class="content noPad" style="padding: 1px;">
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
                                    Employee Transfer Report</td>
                            </tr>
                    </table><hr />
                    <div id="EmpDisplay" tg="0" style="margin: 5px;"></div>
                    <%-- End of div EmpDisplay--%>

                    <div class="tab0 NoPrnt" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Employee Transfer</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="NoPrnt" style="margin-bottom: 20px;">
                        <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                            <tbody>
                                <tr>
                                    <td style="width: 100px;">Office Type</td>
                                    <td style="text-align: left; width: 40%;">
                                        <select id="ddlCompanyType1" style="width: 93.5%;">
                                            <option value="1">Head Office</option>
                                            <option value="2">District Support Office</option>
                                            <option value="3">Basic Health Unit</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <label class="form-label span3 clsHelper clsHelper1" for="normal" style="display: none;">Select DSU</label></td>
                                    <td style="text-align: left;">
                                        <select id="ddlDSUList1" class="clsHelper clsHelper1" style="width: 93.5%; display: none;">
                                        </select></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px;">Office</td>
                                    <td style="text-align: left; width: 40%;">
                                        <select id="ddlCompany1" class="frm" style="width: 93.5%;">
                                        </select>
                                    </td>
                                    <td style="width: 100px;">Date </td>
                                    <td style="text-align: left;">
                                        <input id="txtDate" type="text" class="frm" style="width: 90%;" />
                                        <%--                                        <select id="ddlDept" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select>--%></td>
                                </tr>
                                <tr>
                                    <td>Department</td>
                                    <td>
                                        <select id="ddlDept1" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select></td>
                                    <td>Designation</td>
                                    <td>
                                        <select id="ddlDesignation1" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Group</td>
                                    <td>
                                        <select id="ddlGroup1" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select></td>
                                    <td>Basic Pay</td>
                                    <td>
                                        <input id="txtSalary" class="Integer frm" type="text" style="width: 90%;" /></td>
                                </tr>
                                <tr>
                                    <td>BPS</td>
                                    <td>
                                        <select id="ddlBPS1" class="frm" style="width: 93.5%;">
                                            <option value="1">BPS-1</option>
                                            <option value="2">BPS-2</option>
                                            <option value="3">BPS-3</option>
                                            <option value="4">BPS-4</option>
                                            <option value="5">BPS-5</option>
                                            <option value="6">BPS-6</option>
                                            <option value="7">BPS-7</option>
                                            <option value="8">BPS-8</option>
                                            <option value="9">BPS-9</option>
                                            <option value="10">BPS-10</option>
                                            <option value="11">BPS-11</option>
                                            <option value="12">BPS-12</option>
                                            <option value="13">BPS-13</option>
                                            <option value="14">BPS-14</option>
                                            <option value="15">BPS-15</option>
                                            <option value="16">BPS-16</option>
                                            <option value="17">BPS-17</option>
                                            <option value="18">BPS-18</option>
                                            <option value="19">BPS-19</option>
                                            <option value="20">BPS-20</option>
                                            <option value="21">BPS-21</option>
                                            <option value="22">BPS-22</option>
                                            <option value="0">N/A</option>
                                        </select></td>
                                    <td>Shift</td>
                                    <td>
                                        <select id="ddlShift" class="frm" style="width: 93.5%;">
                                            <option value="1">Morning Shift</option>
                                            <option value="2">Evening Shift</option>
                                            <option value="3">Night Shift</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <button id="btnTranferSave" class="btn btn-info">Save</button>&nbsp;
                                        <button id="btnCancel" class="btn">Cancel</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Transfer History</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <table id="tblTransferHistory" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>&nbsp;</th>
                                    <th>Office</th>
                                    <th>Department</th>
                                    <th>Designation</th>
                                    <th>Group</th>
                                    <th>Salary</th>
                                    <th>BPS</th>
                                    <th>Shift</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>

                    <div class="tab0 NoPrnt" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attach Documents</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="NoPrnt" style="margin-bottom: 20px;">
                        <asp:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                    </div>
                    <%--END OF tab0--%>

                    <div class="tab0 NoPrnt" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attached Documents</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="NoPrnt" id="Docs" style="margin-left: 5px; margin-right: 5px;">
                    </div>
                    <%--END OF tab0--%>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <%--END OF content noPad--%>
            </div>

        </div>
    </div>
    <script type="text/javascript">

        function getVals(sender, args) { $.cookie("asp_act", $("#EmpDisplay").attr('tg') + "|1"); }
        function getVal(sender, args) { $.cookie("asp_act", $("#EmpDisplay").attr('tg') + "|2"); }
        function getDocs(sender, args) { Docs(); }
        function getPic(sender, args) { emp($("#EmpDisplay").attr('tg')); }
        function Docs() {
            $.ajax({
                url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + $("#EmpDisplay").attr('tg') + "ǁ" + "Transfer"),
                context: document.body,
                success: function (responseText) {
                    var jdata = $.parseJSON(responseText), optOdd = "", optEven = "";
                    $.each(jdata, function (i, item) {
                        if (i & 1) {
                            optOdd = optOdd + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt=""  style="width:24px;" />&nbsp;' + item.FileTitle + '</div>';
                        }
                        else {
                            optEven = optEven + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt="" style="width:24px;" />&nbsp;' + item.FileTitle + '</div>';
                        }
                    });
                    $('#Docs').html('<div style="width: 47%; float:left">' + optEven + '</div><div style="width: 47%; float:right">' + optOdd + '</div>');
                }
            });//end ajax
        }

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
            ///////////////////////////////////////////////SEARCH START
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=47ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlDSUList,#ddlDSUList1').html(opt);
                        $('.clsHelper').hide();
                        LoadAllCompanies();
                    }
                });
            });
            $('#ddlDSUList').live('change', function () {
                $('#ddlDSUList1').val($(this).val());
                LoadAllCompanies();
            });
            $('#ddlDSUList1').live('change', function () {
                LoadAllCompanies1();
            });
            $('#ddlCompanyType').live('change', function (e) {
                e.preventDefault();

                $('#ddlCompanyType1').val($(this).val());
                if ($(this).val() == "3") {
                    $('.clsHelper').show();
                }
                else {
                    $('.clsHelper').hide();
                }

                LoadAllCompanies();
            });
            $('#ddlCompanyType1').live('change', function (e) {
                e.preventDefault();


                if ($(this).val() == "3") {
                    $('.clsHelper1').show();
                }
                else {
                    $('.clsHelper1').hide();
                }

                LoadAllCompanies1();
            });
            function LoadAllCompanies() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType').val() + "ǁ" + $('#ddlDSUList').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlCompany,#ddlCompany1').html(opt);
                        if (opt != '') {
                            LoadEmpList();
                        }
                    }
                });
            }
            function LoadAllCompanies1() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType1').val() + "ǁ" + $('#ddlDSUList1').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlCompany1').html(opt);
                    }
                });
            }
            $('#ddlCompany').live('change', function () {
                $('#ddlCompany1').val($(this).val());
                LoadEmpList();
            });
            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllGroups",
                    data: "{'CompanyID' : '0' }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out1 = '', out = '<option value="0">All</option>';
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.User_Group_Id + '"> ' + item.User_Group_Name + '</option>';
                            out1 = out1 + '<option value="' + item.User_Group_Id + '"> ' + item.User_Group_Name + '</option>';
                        });
                        $('#ddlGroup').html(out);
                        $('#ddlGroup1').html(out1);
                    }
                });
            });


            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllDepartments",
                    data: "{ 'CompanyID' : '" + $("#ddlCompany").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out1 = '', out = '<option value="0">All</option>';
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.DepartmentID + '"> ' + item.DepartmentName + '</option>';
                            out1 = out1 + '<option value="' + item.DepartmentID + '"> ' + item.DepartmentName + '</option>';
                        });
                        $('#ddlDept').html(out);
                        $('#ddlDept1').html(out1);
                    }
                });
            });

            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllDesignation",
                    data: "{'CompanyID' : '" + $("#ddlCompany").val() + "' }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out1 = '', out = '<option value="0">All</option>';
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.DesignationID + '"> ' + item.Designation + '</option>';
                            out1 = out1 + '<option value="' + item.DesignationID + '"> ' + item.Designation + '</option>';
                        });
                        $('#ddlDesignation').html(out);
                        $('#ddlDesignation1').html(out1);
                    }
                });
            });
            $('#ddlGroup').live('change', LoadEmpList);
            $('#ddlDept').live('change', LoadEmpList);
            $('#ddlDesignation').live('change', LoadEmpList);
            function LoadEmpList() {

                var where = $('#ddlCompany').val();
                if ($('#ddlGroup').val() != "0") {
                    where += ' AND tblEmployee.User_Group_Id =' + $('#ddlGroup').val()
                }
                if ($('#ddlDept').val() != "0") {
                    where += ' AND tblEmployee.tblDept =' + $('#ddlDept').val()
                }
                if ($('#ddlDesignation').val() != "0") {
                    where += ' AND tblEmployee.tblDesigID =' + $('#ddlDesignation').val()
                }

                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=54ǁ" + where,
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.tblEmployeeID + '"><td>' + itm.EmpNo + '</td>\
                                    <td>' + itm.NAME + '</td>\
                                    <td>' + itm.CNIC + '</td>\
                                    <td>' + itm.ContactNos + '</td>\
                                    <td>' + itm.CompanyName + '</td>\
                                    <td>' + itm.DeptName + '</td>\
                                    <td>' + itm.Designamtion + '</td>\
                                    <td><button tg="' + itm.tblEmployeeID + '" title="Select Employee" class="btnEdit btn btn-info">s</button></td>\
                                    </tr>';
                        });

                        if ($('#tblEmpList').hasClass('dataTable')) {
                            $('#tblEmpList').dataTable().fnDestroy();
                        }

                        $('#tblEmpList tbody').html(opt);

                        $('#tblEmpList').addClass('dynamicTable');

                        // Setup - add a text input to each footer cell
                        $('#tblEmpList tfoot th').each(function () {
                            var title = $(this).text();
                            if ($.trim(title) != "") {
                                $(this).html('<input type="text" placeholder="' + title + '" style="width: 90%;" />');
                            }

                        });

                        var table = $('#tblEmpList').DataTable({
                            "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
                            "iDisplayLength": 10,
                            "sPaginationType": "full_numbers",
                            "bJQueryUI": false,
                            "bAutoWidth": false,
                            "bLengthChange": true,
                            "fnInitComplete": function (oSettings, json) {
                                $('.dataTables_filter>label>input').attr('id', 'search');
                            }
                        });
                        table.columns().every(function () {
                            var that = this;

                            $('input', this.footer()).live('keyup change', function () {
                                if (that.search() !== this.value) {
                                    that
                                        .search(this.value)
                                        .draw();
                                }
                            });
                        });

                        $('#tblEmpList_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');


                    }
                });
            }

            $('#btnExcel').live('click', function (e) {
                e.preventDefault();
                $('#tblEmpList').tableExport({ type: 'excel', escape: 'false' });
                e.preventDefault();
            });
            $('#btnWord').live('click', function (e) {
                e.preventDefault();
                $('#tblEmpList').tableExport({ type: 'doc', escape: 'false' });
                e.preventDefault();
            });
            $('#btnPNG').live('click', function (e) {
                e.preventDefault();
                $('#tblEmpList').tableExport({ type: 'png', escape: 'false' });
                e.preventDefault();
            });
            $('.btnEdit').live('click', function (e) {
                e.preventDefault();
                var tg = $(this).attr('tg');
                $('#SearchMinimizer,#toTop').click();
                $('#EmpDisplay').attr('tg', tg).html('');
                EmpDisplayFunc(tg);
                getEmpDtl(tg);
                getDocs(tg)
                tblTransferHistoryLoad(tg);
            });
            function getEmpDtl(emp) {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=56ǁ" + emp,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText);

                        $('#ddlDept1').val(jData[0].tblDept);
                        $('#ddlDesignation1').val(jData[0].tblDesigID);
                        $('#ddlGroup1').val(jData[0].User_Group_Id);
                        $('#txtSalary').val(jData[0].BPay);
                        $('#ddlBPS1').val(jData[0].BPS);
                        $('#ddlShift').val(jData[0].tblEmpShiftIDs);
                    }
                });
            }
            function getDocs(emp) {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + emp + "ǁ" + "Transfer"),
                    context: document.body,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText), optOdd = "", optEven = "";
                        $.each(jdata, function (i, item) {
                            if (i & 1) {
                                optOdd = optOdd + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt="" style="width:24px;" />&nbsp;' + item.FileTitle + '</div>';
                            }
                            else {
                                optEven = optEven + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt="" style="width:24px;" />&nbsp;' + item.FileTitle + '</div>';
                            }
                        });
                        $('#Docs').html('<div style="width: 47%; float:left">' + optEven + '</div><div style="width: 47%; float:right">' + optOdd + '</div>');
                    }
                });//end ajax
            }
            function EmpDisplayFunc(emp) {

                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=55ǁ" + emp,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText);
                        $('#EmpDisplay').html(jData[0].EmpDisplay);

                        $('#dvdtl').show({
                            effect: "clip",
                            duration: 500
                        });

                    }
                });
            }
            ////////////////////SEARCH START
            function tblTransferHistoryLoad(obj) {


                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=58ǁ" + obj,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr>\
                                    <td rowspan="2" style="border-bottom: 1px solid #c4c4c4;">' + itm.TDT + '</td>\
                                     <td><strong>Before</strong></td>\
                                      <td>'+ itm.CompanyNameA + '</td>\
                                      <td>' + itm.DeptNameA + '</td>\
                                      <td>' + itm.DesigA + '</td>\
                                      <td>' + itm.GroupA + '</td>\
                                      <td>' + itm.SalaryA + '</td>\
                                      <td> ' + itm.tblBPSIDA + ' </td>\
                                      <td> ' + itm.ShiftA + ' </td>\
                                  </tr>\
                                  <tr>\
                                    <td style="text-align:center;"><strong>After</strong></td>\
                                      <td>' + itm.CompanyNameB + '</td>\
                                      <td>' + itm.DeptNameB + '</td>\
                                      <td>' + itm.DesigB + '</td>\
                                      <td>' + itm.GroupB + '</td>\
                                      <td>' + itm.SalaryB + '</td>\
                                      <td>' + itm.tblBPSIDB + '</td>\
                                      <td>' + itm.ShiftB + '</td>\
                                  </tr>';
                        });
                        $('#tblTransferHistory tbody').html(opt);


                    }
                });

            }

            $('#txtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });



            $('#btnTranferSave').live('click', function (e) {
                e.preventDefault();
                if ($('#txtDate').val() == "") {
                    alertR('Please Select Valid Date..!');
                    return false;
                }

                if ($('#txtSalary').val() == "") {
                    alertR('Please Select Valid Date..!');
                    return false;
                }

                if ($('#ddlCompany1').val()== "" || $('#ddlCompany1').val()== null || $('#ddlCompany1').val()== undefined) {
                    alertR('Please Select Valid Office..!');
                    return false;
                }
                var f = '';
            $('.frm').each(function (i, et) {
                // element == this
                f += encodeURIComponent($(this).val()) + 'ǁ';
            });
            if (f != "") {
                f += '¼';
                f = f.replace("ǁ¼", "");
            }

            var Province = "";
            //$('[name="multiselect_ddlAllowedAreas"][type="checkbox"][aria-selected="true"]').each(function (i, item) {
            //    Province += $(this).val() + '½';
            //});
            //if (Province != "") {
            //    Province += '¼';
            //    Province = Province.replace("½¼", "");
            //}
            $.ajax({
                type: "POST",
                url: "EmpReg.ashx/?ID=57ǁ" + $('#EmpDisplay').attr('tg') + "ǁ" + f + "ǁ" + Province,
                success: function (response) {
                    $('#txtDate').val('');
                    $('#txtSalary').val('')
                    alertG('Rrecord Saved');
                    tblTransferHistoryLoad($('#EmpDisplay').attr('tg'));
                    LoadEmpList();
                }
            });

        });

            $('#btnCancel').live('click', function (e) {

                e.preventDefault();
                $('#txtDate').val('');
                $('#txtSalary').val('');
            //$('#min').click();
        });
        $(".trDoc").live('click', function (e) {
            document.location = "exeDataIMS.ashx/?ID=" + encodeURIComponent("114ǁ" + $(this).text() + "ǁEmp/" + $(this).attr('tag'));
        });
        });//END OF DOC READY
    </script>
</asp:Content>
