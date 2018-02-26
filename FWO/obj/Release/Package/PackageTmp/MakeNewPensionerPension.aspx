<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="MakeNewPensionerPension.aspx.cs" Inherits="FRDP.MakeNewPensionerPension" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                        <span>Search Employee to Edit Pension Basic Record</span>
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
                                <th>File No</th>
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
                                <th>File No</th>
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
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Details :- </span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad" style="padding: 1px;">
                    <div id="EmpDisplay" tg="0" style="margin: 5px;"></div>
                    <%-- End of div EmpDisplay--%>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Make Employee Pension</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">


                        <%--////////////////////////START OF FORM///////////////////////////--%>
                        <form class="form-horizontal" action="#">




                                                    <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Bank / Branch</label>
                                <input id="txtBankBranchName" type="text" class="txtcs  span7" disabled="disabled" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">A / C #.</label>
                                <input id="txtAcountNo" type="text" class="txtcs  span7" disabled="disabled" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Date Of Appointment</label>
                                <input id="txtDOA" type="text" class="txtcs  span7" disabled="disabled" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Date Of Birth.</label>
                                <input id="txtDOB" type="text" class="txtcs  span7" disabled="disabled" />
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Date Of Retirement.</label>
                                <input id="txtDOR" type="text" class="txtcs  span7" disabled="disabled" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Total Age</label>
                                <input id="txtTotalAgeY" type="text" class="txtcs  span2" disabled="disabled" />Y&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="txtTotalAgeM" type="text" class="txtcs  span2" disabled="disabled" />M&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="txtTotalAgeD" type="text" class="txtcs  span2" disabled="disabled" />D
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Total Services</label>
                                <input id="txtTotalServicesY" type="text" class="txtcs  span2" disabled="disabled" />Y&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="txtTotalServicesM" type="text" class="txtcs  span2" disabled="disabled" />M&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="txtTotalServicesD" type="text" class="txtcs  span2" disabled="disabled" />D
                            </div>

                            <div class="span6">
                                <label class="form-label span5" for="normal">Total Holidays (in Days)</label>
                                <input id="txtTotalHolidaysInService" type="text" class="txtcs  span7" disabled="disabled" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Net Qualifying Service</label>
                                <input id="txtNetQualifyingServiceY" type="text" class="txtcs  span2" disabled="disabled" />Y&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="txtNetQualifyingServiceM" type="text" class="txtcs  span2" disabled="disabled" />M&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="txtNetQualifyingServiceD" type="text" class="txtcs  span2" disabled="disabled" />D
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Age Next Birthday</label>
                                <input id="txtAgeNextBirthday" type="text" class="txtcs  span7" disabled="disabled" />
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Rate Of Commutation</label>
                                <input id="txtAgeRate" type="text" class="txtcs frmCtrl span7" disabled="disabled" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Last Basic Pay</label>
                                <input id="txtBasicPay" type="text" class="txtcs frmCtrl span7" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Gross Pension</label>
                                <input id="txtGrossPension" type="text" class="txtcs span7  frmCtrl" />
                            </div>
                            <div class="span6">
                                <label class="form-label span12" for="normal" style="text-align: left;">Gross Pension = BasicPay x Service Years x 7 / 300</label>
                            </div>
                        </div>





                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Total Gross Pension</label>
                                <input id="txtTotalGrossPension" type="text" class="txtcs frmCtrl span7" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Monthly Pension</label>
                                <input id="txtMonthlyPension" type="text" class="txtcs frmCtrl span7" />
                            </div>
                            <div class="span6">
                                <label class="form-label span12" for="normal" style="text-align: left;">Monthly Pension = Gross Pension x 65%</label>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Time To Time Increment</label>
                                <input id="txtTimeToTimeGrossPension" type="text" class="txtcs span7 frmCtrl" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Medical Allowance</label>
                                <input id="txtMedicalAllowance" type="text" class="txtcs frmCtrl span7" />
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Cashable Percentage</label>
                                <input id="txtCashablePercentage" type="text" class="txtcs frmCtrl span7" />
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Cashable Amount</label>
                                <input id="txtCashableAmount" type="text" class="txtcs frmCtrl span7" />
                            </div>
                            <div class="span6">
                                <label class="form-label span12" for="normal" style="font-size: 12px;">Cashable Amount = Total Gross Pension x (Cashable Percentage) + Medical Allow.</label>
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Commutation</label>
                                <input id="txtCommutation" type="text" class="txtcs frmCtrl span7" />
                            </div>
                            <div class="span6">
                                <label class="form-label span12" for="normal" style="text-align: left;">Commutation = Gross Pension x 35%</label>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Total Commutation</label>
                                <input id="txtTotalCommutation" type="text" class="txtcs frmCtrl span7" />
                            </div>
                        </div>





                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Pension Type</label>
                                <div class="span7 controls sel">
                                    <select id="ddlPensionType" class="nostyle frmCtrl">
                                    </select>
                                </div>
                            </div>
                        </div>

                        






                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal"></label>
                                <div style="margin-left: 0px;">
                                   <%-- <button type="button" class="btn btn-primary span2" id="btnSave">Save</button>--%>
                                    <button title="Click to Make Employee Pension...!" type="button" class="btn btn-info span2" id="btnSave" tag="0" style="width: 400px; margin-bottom: 10px; float: right; margin-right: 10px;">
                        Save</button>
                                </div>
                            </div>
                        </div>




                        </form>
                        <%--////////////////END FORM//////////////////////--%>
                    </div>
                    <%--END OF tab0--%>

                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attach Documents</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <asp:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                    </div>
                    
                    <%--END OF tab0--%>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attached Documents</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
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
                url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + $("#EmpDisplay").attr('tg') + "ǁ" + "EmpPensionDoc"),
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
                    url: "EmpReg.ashx/?ID=97ǁ" + where,
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.tblEmployeeID + '"><td>' + itm.EmpNo + '</td>\
                                    <td>' + itm.FileNo + '</td>\
                                    <td>' + itm.NAME + '</td>\
                                    <td>' + itm.CNIC + '</td>\
                                    <td>' + itm.ContactNos + '</td>\
                                    <td>' + itm.CompanyName + '</td>\
                                    <td>' + itm.DeptName + '</td>\
                                    <td>' + itm.Designamtion + '</td>\
                                    <td><button tg="' + itm.tblEmployeeID + '" tag="' + itm.PensionEmpID + '" title="Select Employee" class="clsAlreadyAddedEmployees btnEdit btn btn-info">s</button></td>\
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
                $('#btnSave').attr('tag', tg);
                EmpDisplayFunc(tg);
                $('#SearchMinimizer').click();
                $('#toTop').click();
                //getAwards(tg);
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
                        getDocs(emp);
                        $('#dvdtl').show('slow');

                    }
                });
            }


            ////////////////////SEARCH START
            $('.clsAlreadyAddedEmployees').live('click', function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EditPensionEmployee.aspx/LoadEmpCompletePreviousData",
                    data: "{ 'EmpPensionID' : '" + $(this).attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            $('#txtDOA').val(item.DateOfAppointment);
                            $('#txtDOB').val(item.DOB);
                            $('#txtDOR').val(item.DateOfRetirement);

                            $('#txtTotalAgeY').val(item.TotalAgeAtRetirementY);
                            $('#txtTotalAgeM').val(item.TotalAgeAtRetirementM);
                            $('#txtTotalAgeD').val(item.TotalAgeAtRetirementD);
                            $('#txtTotalServicesY').val(item.TotalServiceY);
                            $('#txtTotalServicesM').val(item.TotalServiceM);
                            $('#txtTotalServicesD').val(item.TotalServiceD);
                            $('#txtTotalHolidaysInService').val(item.TotalHolidays);
                            $('#txtNetQualifyingServiceY').val(item.NetQualifyingServiceY);
                            $('#txtNetQualifyingServiceM').val(item.NetQualifyingServiceM);
                            $('#txtNetQualifyingServiceD').val(item.NetQualifyingServiceD);
                            $('#ddlAgeNextBirthday').val(item.AgeNextBirthdays);
                            $('#txtBankName').val(item.BankName);
                            $('#txtAccountNo').val(item.AccountNo);
                            $('#txtFileNo').val(item.FileNo);


                            $('#btnSave').attr('tag', item.EmpID);



                        });

                    }
                });
            });
            function getDocs(emp) {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + emp + "ǁ" + "EmpPensionDoc"),
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

            //function getAwards(tg) {
            //    $.ajax({
            //        type: "POST",
            //        url: "EmpReg.ashx/?ID=60ǁ" + tg,
            //        success: function (response) {
            //            $('#dvawards').html(response)

            //        }
            //    });
            //}

            //$('#btnSave').live('click', function (e) {
            //    e.preventDefault();


            //    if ($('#ddlAwardType').val() == "" || $('#ddlAwardType').val() == undefined || $('#ddlAwardType').val() == null || $('#ddlAwardType').val() == "{NEW ELEMENT}") {
            //        alertR('Select Board/University...!');
            //        return false;
            //    }
            //    if ($('#txtDate').val() == "") {
            //        alertR('Please Select Valid Date..!');
            //        return false;
            //    }


            //    var f = '';
            //    $('.frm').each(function (i, et) {
            //        // element == this
            //        f += encodeURIComponent($(this).val()) + 'ǁ';
            //    });
            //    if (f != "") {
            //        f += '¼';
            //        f = f.replace("ǁ¼", "");
            //    }

            //    var Province = "";
            //    //$('[name="multiselect_ddlAllowedAreas"][type="checkbox"][aria-selected="true"]').each(function (i, item) {
            //    //    Province += $(this).val() + '½';
            //    //});
            //    //if (Province != "") {
            //    //    Province += '¼';
            //    //    Province = Province.replace("½¼", "");
            //    //}
            //    $.ajax({
            //        type: "POST",
            //        url: "EmpReg.ashx/?ID=61ǁ" + $('#EmpDisplay').attr('tg') + "ǁ" + f + "ǁ" + Province,
            //        success: function (response) {
            //            alertG('Rrecord Saved');
            //            getAwards($('#EmpDisplay').attr('tg'));
            //        }
            //    });

            //});// end of save

            //$('#txtDate').datepicker({
            //    changeMonth: true,
            //    changeYear: true,
            //    dateFormat: 'dd/mm/yy'
            //});



            $(".trDoc").live('click', function (e) {
                document.location = "exeDataIMS.ashx/?ID=" + encodeURIComponent("114ǁ" + $(this).text() + "ǁEmp/" + $(this).attr('tag'));
            });

            ///////////////////////////Pension






            $('#txtDOA').datepicker({ dateFormat: 'dd - MM - yy', changeYear: true, changeMonth: true });
            $('#txtDOB').datepicker({ dateFormat: 'dd - MM - yy', changeYear: true, changeMonth: true });
            $('#txtDOR').datepicker({ dateFormat: 'dd - MM - yy', changeYear: true, changeMonth: true });

            function CalculateTotalAge() {

                var start = $("#txtDOB").datepicker("getDate");
                var end = $("#txtDOR").datepicker("getDate");
                var totaldays = (end - start) / (1000 * 60 * 60 * 24);
                var Years = Math.floor(totaldays / 365);
                var Months = Math.floor((totaldays - (Years * 365)) / 30);
                var Days = Math.floor(totaldays - (Years * 365) + (Months * 30));
                $('#txtTotalAgeY').val(Years);
                $('#txtTotalAgeM').val(Months);
                $('#txtTotalAgeD').val(Days);
            }

            function CalculateTotalServices() {

                var start = $("#txtDOA").datepicker("getDate");
                var end = $("#txtDOR").datepicker("getDate");
                var totaldays = (end - start) / (1000 * 60 * 60 * 24);
                var Years = Math.floor(totaldays / 365);
                var Months = Math.floor((totaldays - (Years * 365)) / 30);
                var Days = Math.floor(totaldays - (Years * 365) + (Months * 30));
                $('#txtTotalServicesY').val(Years);
                $('#txtTotalServicesM').val(Months);
                $('#txtTotalServicesD').val(Days);
            }


            function CalculateNetQualifyingServices() {

                var hdays = 0;
                if ($('#txtTotalHolidaysInService').val() != "") {
                    hdays = parseInt($('#txtTotalHolidaysInService').val());
                }
                var start = $("#txtDOA").datepicker("getDate");
                var end = $("#txtDOR").datepicker("getDate");
                var totaldays = ((end - start) / (1000 * 60 * 60 * 24)) - hdays;
                var Years = Math.floor(totaldays / 365);
                var Months = Math.floor((totaldays - (Years * 365)) / 30);
                var Days = Math.floor(totaldays - (Years * 365) + (Months * 30));
                $('#txtNetQualifyingServiceY').val(Years);
                $('#txtNetQualifyingServiceM').val(Months);
                $('#txtNetQualifyingServiceD').val(Days);
            }



            $('#txtDOR').change(function () {
                CalculateTotalAge();
                CalculateTotalServices();
                CalculateNetQualifyingServices();
            });


            $('#txtTotalHolidaysInService').blur(function () {
                CalculateTotalAge();
                CalculateTotalServices();
                CalculateNetQualifyingServices();
            });



            $('#btnSave').bind('click', function () {

                if ($('#txtDOA').val().trim() == "") {
                    alert('Please enter Date of appointment...');
                    return;
                }

                if ($('#txtDOB').val().trim() == "") {
                    alert('Please enter Date of birth...');
                    return;
                }

                if ($('#txtDOR').val().trim() == "") {
                    alert('Please enter Date of retirement...');
                    return;
                }

                if ($('#txtTotalHolidaysInService').val().trim() == "") {
                    alert('Please enter total holidays in service...');
                    return;
                }


                var ctrlVals = "";
                $('.frmCtrl').each(function (index, element) {
                    ctrlVals += $(this).val() + '½';
                });
                ctrlVals += $('#btnSave').attr('tag') + '½';




                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "MakeNewPensionerPension.aspx/SaveData",
                    data: "{ 'Vals' : '" + ctrlVals + "'  }",
                    success: function (response) {

                        alert(response.d);
                        $('.txtcs').each(function (index, element) {
                            $(this).val('');
                        });
                    }
                });


            });
            function LoadEmpPreviousData(empid) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "MakeNewPensionerPension.aspx/LoadEmpPreviousData",
                    data: "{ 'EmpID' : '" + empid + "'}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            $('#txtBankBranchName').val(item.BankName);
                            $('#txtAcountNo').val(item.AcNo);

                            $('#txtDOA').val(item.DOA);
                            $('#txtDOB').val(item.DOB);
                            $('#txtDOR').val(item.DateOfRetirement);
                            $('#txtTotalAgeY').val(item.TotalAgeAtRetirementY);
                            $('#txtTotalAgeM').val(item.TotalAgeAtRetirementM);
                            $('#txtTotalAgeD').val(item.TotalAgeAtRetirementD);
                            $('#txtTotalServicesY').val(item.TotalServiceY);
                            $('#txtTotalServicesM').val(item.TotalServiceM);
                            $('#txtTotalServicesD').val(item.TotalServiceD);
                            $('#txtTotalHolidaysInService').val(item.TotalHolidays);
                            $('#txtNetQualifyingServiceY').val(item.NetQualifyingServiceY);
                            $('#txtNetQualifyingServiceM').val(item.NetQualifyingServiceM);
                            $('#txtNetQualifyingServiceD').val(item.NetQualifyingServiceD);
                            $('#txtAgeNextBirthday').val(item.AgeNextBirthdays);
                            $('#txtAgeNextBirthday').val(item.AgeNextBirthdays);
                            $('#txtAgeRate').val(item.AgeRate);


                            $('#txtBasicPay').val(item.BasicPay);
                            $('#txtGrossPension').val(item.GrossPension);
                            $('#txtTimeToTimeGrossPension').val(item.TimeToTimeIncrement);
                            $('#txtTotalGrossPension').val(item.TotalGrossPension);
                            $('#txtMonthlyPension').val(item.MonthlyPension);
                            $('#txtCommutation').val(item.Commutation);
                            $('#txtTotalCommutation').val(item.TotalCommutation);
                            $('#txtMedicalAllowance').val(item.MedicalAllowance);
                            $('#ddlPensionType').val(item.PensionTypeId);
                            $('#txtCashablePercentage').val(item.CashablePercentage);
                            $('#txtCashableAmount').val(item.CashableAmount);













                        });

                    }
                });
            }

            LoadPensionType();
            function LoadPensionType() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "MakeNewPensionerPension.aspx/LoadPensionType",
                    data: "{ }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value= ' + item.PensionTypeID + '> ' + item.PensionType + '</option>';
                        });
                        $('#ddlPensionType').html(out);
                    }
                });
            }
        });//END OF DOC READY
    </script>
</asp:Content>
