<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeTrainingsReport.aspx.cs" Inherits="FRDP.EmployeeTrainingsReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
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
                                    Employee Trainings Report</td>
                            </tr>
                    </table><hr />
                    <div id="EmpDisplay" tg="0" style="margin: 5px;"></div>

                    <%-- End of div EmpDisplay--%>
                    <div class="tab0 NoPrnt" style="margin-left: 5px; margin-bottom: 20px;display:none;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Employee Trainings</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="NoPrnt" style="display:none;">
                        <table style="width: 90%; margin-top: 3px; margin-left: 65px;">
                            <tr>
                                <td style="width: 120px">Training Title</td>
                                <td>
                                    <input id="txtTrn" type="text" style="width: 200px" class="trn" /></td>

                                <td style="width: 120px">Duration(Days)</td>
                                <td>
                                    <input id="txtDuration" class="numeric trn" type="number" style="width: 80px" /></td>
                            </tr>
                            <tr>
                                <td style="width: 120px">From Date</td>
                                <td>
                                    <asp:TextBox ID="dpFrm" runat="server" ClientIDMode="Static" Width="190px" placeholder="dd MMMM yyyy" CssClass="trn"></asp:TextBox>
                        <asp:CalendarExtender ID="dpFrm_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="dpFrm">
                        </asp:CalendarExtender>
                                </td>

                                <td style="width: 120px">Training Area</td>
                                <td>
                                    <input type="text" style="width: 200px" class="trn" /></td>
                            </tr>
                            <tr>
                                <td style="width: 120px">Training Agency</td>
                                <td>
                                    <input type="text" style="width: 200px" class="trn" /></td>

                                <td style="width: 120px">Venue</td>
                                <td>
                                    <input type="text" style="width: 200px" class="trn" /></td>
                            </tr>
                            <tr>
                                <td style="width: 120px">City</td>
                                <td>
                                    <input type="text" style="width: 200px" class="trn" /></td>

                                <td style="width: 120px">Country</td>
                                <td>
                                    <input type="text" style="width: 200px" class="trn" /></td>
                            </tr>


                            <tr>
                                <td colspan="4" style="text-align: right;">
                                    <%--<input tag="1" class="btn btn-info btnDegree" type="button" value="Save Degree" />--%>
                                    <input id="btnSvTrnP" style="margin-right: 15.5%;" class="btn btn-info" type="button" value="Save Record" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <%--END OF tab0--%>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Employee Trainings Details</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <div class="container dvTrain">
                            <div class="table-row head">
                                <div class="col">Training Title</div>
                                <div class="col">From Date </div>
                                <div class="col">Duration(Days)</div>
                                <div class="col">Training Area</div>
                                <div class="col">Training Agency</div>
                                <div class="col">Venue</div>
                                <div class="col">City</div>
                                <div class="col">Country</div>
                            </div>
                        </div>
                    </div>
                    <%--END OF tab0--%>
                    <div class="tab0 NoPrnt" style="margin-left: 5px; margin-bottom: 20px;display:none;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attach Documents</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="NoPrnt" style="margin-bottom: 20px;display:none;">
                        <asp:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                    </div>
                    <%--END OF tab0--%>
                    <div class="tab0 NoPrnt" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attached Documents</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="NoPrnt" style="margin-bottom: 20px;">
                        <div id="Docs" style="margin-left: 5px; margin-right: 5px;">
                        </div>
                        <%--END OF tab0--%><br />
                        <br />
                        <br />
                        <br />
                    </div>

                </div>

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
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + $("#EmpDisplay").attr('tg') + "ǁ" + "EmpTrainings"),
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
                            $('#ddlDSUList').html(opt);
                            $('.clsHelper').hide();
                            LoadAllCompanies();
                        }
                    });
                });
                $('#ddlDSUList').live('change', function () {
                    LoadAllCompanies();
                });
                $('#ddlCompanyType').live('change', function (e) {
                    e.preventDefault();
                    if ($(this).val() == "3") {
                        $('.clsHelper').show();
                    }
                    else {
                        $('.clsHelper').hide();
                    }

                    LoadAllCompanies();
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
                            $('#ddlCompany').html(opt);

                            if (opt != '') {
                                LoadEmpList();
                            }
                        }
                    });
                }

                $('#ddlCompany').live('change', LoadEmpList);
                $(function () {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "EmployeeRegistration.aspx/AllGroups",
                        data: "{'CompanyID' : '0' }",
                        async: false,
                        success: function (responseText) {
                            var jData = $.parseJSON(responseText.d), out = '<option value="0">All</option>';
                            $.each(jData, function (i, item) {
                                out = out + '<option value="' + item.User_Group_Id + '"> ' + item.User_Group_Name + '</option>';
                            });
                            $('#ddlGroup').html(out);
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
                            var jData = $.parseJSON(responseText.d), out = '<option value="0">All</option>';
                            $.each(jData, function (i, item) {
                                out = out + '<option value="' + item.DepartmentID + '"> ' + item.DepartmentName + '</option>';
                            });
                            $('#ddlDept').html(out);
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
                            var jData = $.parseJSON(responseText.d), out = '<option value="0">All</option>';
                            $.each(jData, function (i, item) {
                                out = out + '<option value="' + item.DesignationID + '"> ' + item.Designation + '</option>';
                            });
                            $('#ddlDesignation').html(out);
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
                    //$('#dvdtl').hide();
                    $('#EmpDisplay').attr('tg', tg).html('');
                    EmpDisplayFunc(tg);
                    $('#SearchMinimizer').click();
                    $('#toTop').click();
                    //getAwards(tg);
                    LoadEmployeeTrainings();
                    getDocs(tg);
                });
                function EmpDisplayFunc(emp) {

                    $.ajax({
                        type: "POST",
                        url: "EmpReg.ashx/?ID=55ǁ" + emp,
                        success: function (responseText) {
                            var jData = $.parseJSON(responseText);
                            $('#EmpDisplay').html(jData[0].EmpDisplay);
                            //getAwards(emp);
                            //getDocs(emp);
                            $('#dvdtl').show('slow');

                        }
                    });
                }


                ////////////////////SEARCH START

                function LoadEmployeeTrainings() {

                    $('.dvTrain').html('<div class="table-row head">\
                                <div class="col">Training Title</div>\
                                <div class="col">From Date </div>\
                                <div class="col">Duration(Days)</div>\
                                <div class="col">Training Area</div>\
                                <div class="col">Training Agency</div>\
                                <div class="col">Venue</div>\
                                <div class="col">City</div>\
                                <div class="col">Country</div>\
                            </div>');
                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=41ǁ" + encodeURIComponent($('#EmpDisplay').attr('tg')),
                        context: document.body,
                        success: function (responseText) {
                            var jdata = $.parseJSON(responseText);
                            $.each(jdata, function (i, item) {

                                $('.dvTrain').append('<div class="table-row Grd"><div class="col">' + item.Training + '</div><div class="col">' + item.FDate + '</div><div class="col">' + item.Duration + '</div><div class="col">' + item.TrainArea + '</div><div class="col">' + item.Agency + '</div><div class="col">' + item.Venue + '</div><div class="col">' + item.City + '</div><div class="col">' + item.Country + '</div></div>');
                            });
                        }
                    });
                }
                $("#btnSvTrnP").live('click', function (e) {
                    var Data = [];
                    Data[0] = "37";
                    $('.trn').each(function () {
                        Data.push($(this).val());
                    });
                    Data.push($('#EmpDisplay').attr('tg'));
                    //$('#TB_overlay').show();
                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                        context: document.body,
                        success: function (responseText) {
                            //$('#TB_overlay').hide();
                            $('.dvTrain').append('<div class="table-row Grd"><div class="col">' + Data[1] + '</div><div class="col">' + Data[3] + '</div><div class="col">' + Data[2] + '</div><div class="col">' + Data[4] + '</div><div class="col">' + Data[5] + '</div><div class="col">' + Data[6] + '</div><div class="col">' + Data[7] + '</div><div class="col">' + Data[8] + '</div></div>');
                            $('.trn').each(function () {
                                $(this).val('');
                            });
                        }
                    });
                });
                function getDocs(emp) {
                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + emp + "ǁ" + "EmpTrainings"),
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

                function getAwards(tg) {
                    $.ajax({
                        type: "POST",
                        url: "EmpReg.ashx/?ID=60ǁ" + tg,
                        success: function (response) {
                            $('#dvawards').html(response)

                        }
                    });
                }
                function loadQf(typ) {

                    $('.AcQ1').html('<div class="table-row head">\
    <div class="col">Degree/Certificate </div>\
    <div class="col">Majors</div>\
    <div class="col">Date of Completion</div>\
    <div class="col">Board/University</div>\
    <div class="col">Division/Grade/CGPA</div>\
</div>');
                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=39ǁ" + encodeURIComponent($("#EmpDisplay").attr('tg') + "ǁ" + typ),
                        context: document.body,
                        success: function (responseText) {
                            var jdata = $.parseJSON(responseText);
                            $.each(jdata, function (i, item) {
                                //   $('.AcQ' + typ).append('<div class="table-row Grd"><div class="col">' + item.Degree + '</div><div class="col">' + item.Subject1 + '</div><div class="col">' + item.Subject2 + '</div><div class="col">' + item.Subject3 + '</div><div class="col">' + item.Completion + '</div><div class="col">' + item.Board + '</div><div class="col">' + item.CGPA + '</div></div>');
                                $('.AcQ' + typ).append('<div class="table-row Grd"><div class="col">' + item.Degree + '</div><div class="col">' + item.Subject1 + '</div><div class="col">' + item.Completion + '</div><div class="col">' + item.Board + '</div><div class="col">' + item.CGPA + '</div></div>');
                            });
                        }
                    });
                }
                $(".trDoc").live('click', function (e) {
                    document.location = "exeDataIMS.ashx/?ID=" + encodeURIComponent("114ǁ" + $(this).text() + "ǁEmp/" + $(this).attr('tag'));
                });

                $(".btnDegree").live('click', function (e) {
                    if ($('#ddBoard').val() == "" || $('#ddBoard').val() == undefined || $('#ddBoard').val() == null || $('#ddBoard').val() == "{NEW ELEMENT}") {
                        alertR('Select Board/University...!');
                        return false;
                    }
                    svDegree($(this).attr('tag'));
                });
                function svDegree(typ) {


                    var Data = [];
                    Data[0] = "35";
                    $('.dg' + typ).each(function () {
                        Data.push($(this).val());
                    });
                    Data.push(typ);
                    Data.push($("#EmpDisplay").attr('tg'));
                    //$('#TB_overlay').show();
                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                        context: document.body,
                        success: function (responseText) {
                            //$('#TB_overlay').hide();
                            $('.AcQ' + typ).append('<div class="table-row Grd"><div class="col">' + Data[1] + '</div><div class="col">' + Data[4] + '</div><div class="col">' + Data[2] + '</div><div class="col">' + Data[3] + '</div><div class="col">' + Data[7] + '</div></div>');
                            $('.dg' + typ).each(function () {
                                $(this).val('');
                            });
                        }
                    });
                }
            });//END OF DOC READY
        </script>
</asp:Content>
