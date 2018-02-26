<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="PayrollGrossSalary.aspx.cs" Inherits="FRDP.PayrollGrossSalary" %>

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
                        <span>Search Employee</span>
                    </h4>
                    <a id="SearchMinimizer" href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td>Salary Date</td>
                                <td><input id="txtSalaryDate" value="<%= Convert.ToString(DateTime.Now.Day) +" - "+ DateTime.Now.ToString("MMMM")+" - "+Convert.ToString(DateTime.Now.Year)  %>"  type="text" class="txtcs frmCtrl" /></td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
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
                                <th style="width: 120px;">Employee No</th>
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
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Details :- </span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad" style="padding: 1px;">
                    <div id="EmpDisplay" tg="0" style="margin: 5px;"></div>
                    <%-- End of div EmpDisplay--%>

                    <form class="form-horizontal" action="#">

                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Gross Salary Allowances</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px; margin-left: 5px;">
                      
                            
                                  <div class="form-row row-fluid">
                                <div class="span6">
                                    <%--<label class="form-label span6" for="normal">Salary Date</label>--%>
                                    &nbsp;
                                </div>

                                <div class="span6">
                                    <label class="form-label span6" for="normal">Basic Pay</label>
                                    <input id="txtBasicPay" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                            </div>


                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">House Rent</label>
                                    <input id="txtHouseRent" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Conveyance Allowance</label>
                                    <input id="txtConveyanceAllowance" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                            </div>


                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Medical Allowance</label>
                                    <input id="txtMedicalAllow" disabled="disabled"  type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>

                                <div class="span6">
                                    <label class="form-label span6" for="normal">Misc./Eid Advance</label>
                                    <input id="txtMiscEidAdvance" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                            </div>



                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Computer Allowance</label>
                                    <input id="txtComputerAllowance" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Entertainment Allowance</label>
                                    <input id="txtEntertainmentAllowance" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>

                            </div>



                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Deputation Allowance</label>
                                    <input id="txtDeputationAllowance" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Project Base Allowance</label>
                                    <input id="txtProjectBasedAllowance" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                            </div>



                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Arrears</label>
                                    <input id="txtArrears" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                                <div class="span6">
                                    &nbsp;</div>
                            </div>

                            <div class="form-row row-fluid">
                                <div class="span6">&nbsp;</div>
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Gross Salary</label>
                                    <input id="txtGrossSalary" value="0" type="text" class="txtcs frmCtrl span4 numeric clsGrossSalary" disabled="disabled" />
                                </div>
                            </div>
                        </div>
                        <%--END OF tab0--%>


                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Gross Salary Deductions</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px; margin-left: 5px;">

                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">GPF Contribution</label>
                                    <input id="txtGPF" type="text"  disabled="disabled" class="txtcs frmCtrl span4 clsDeductions" />
                                </div>

                                <div class="span6">
                                    <label class="form-label span6" for="normal">GPF Advance</label>
                                    <input id="txtGPFInstallment" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" value="0" />
                                </div>

                            </div>


                            <div class="form-row row-fluid">

                                <div class="span6">
                                    <label class="form-label span6" for="normal">Income Tax</label>
                                    <input id="txtIncomeTax" type="text" value="0" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>

                  <div class="span6">
                                    <label class="form-label span6" for="normal">Group Insurance</label>
                                    <input id="txtGroupInsurance" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
                            </div>





                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Other Deduction</label>
                                    <input id="txtPersonnelInstalment" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
                               
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Car Advance</label>
                                    <input id="txtCarAdvance" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
                            </div>



                            <div class="form-row row-fluid">

                                <div class="span6">
                                    <label class="form-label span6" for="normal">Motor Cycle Advance</label>
                                    <input id="txtMotorCycle" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
<div class="span6">
                                    <label class="form-label span6" for="normal">House Building Advance</label>
                                    <input id="txtHouseBuilding" disabled="disabled" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>

                            </div>


                            <div class="form-row row-fluid">
                                
                               
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Cash Advance / Loan</label>
                                    <input id="txtCashAdvanceLoan" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
 <div class="span6">
&nbsp;
                                </div>

                            </div>


                            <div class="form-row row-fluid">
                                <div class="span6">
                                    &nbsp;
                                </div>
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Total Deduction</label>
                                    <input id="txtTotalDeduction" type="text" value="0" class="txtcs frmCtrl span4 numeric clsTotalDeductions" disabled="disabled" />
                                </div>
                            </div>






                        </div>
                        <%--END OF tab0--%>

                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Net Salary</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px; margin-left: 5px;">
                            <div class="form-row row-fluid">
                                <div class="span6">&nbsp;</div>
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Net Salary</label>
                                    <input id="txtNetSalary" value="0" type="text" class="txtcs frmCtrl span4" disabled="disabled" />
                                </div>
                            </div>




                        </div>
                        <%--END OF tab0--%>
                        <hr />
                        <div class="form-row row-fluid">
                            <div class="span6">&nbsp;</div>
                            <div class="span6">
                                <label class="form-label span6" for="normal"></label>
                                <button type="button" class="btn btn-info spna2" id="btnSave">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
                <%-- End of Content Dive--%>
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
            //$('.frmCtrl').css('background', 'red');
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
            $('#ddlCompany').live('change', function (e) {
                e.preventDefault();
                LoadEmpList();
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
                    url: "EmpReg.ashx/?ID=100ǁ" + where + "ǁ" + $('#txtSalaryDate').val(),
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
            $('.btnEdit').live('click', function (e) {
                e.preventDefault();
                var tg = $(this).attr('tg');
                $('#SearchMinimizer,#toTop').click();
                $('#EmpDisplay').attr('tg', tg).html('');
                //$('#btnSave').attr('tag', tg);
                EmpDisplayFunc(tg);


                $('.clsAllowanceItem').val(0);
                $('.clsDeductions').val(0);
                $('#txtBasicPay').attr('tag', tg);
                GetBasicSalaryData(tg);


            });
            ////////////////////SEARCH START


            $('.heading h3').html('Gross Salary');

            $('.numeric').numeric();
            $('#txtSalaryDate').datepicker({
                dateFormat: 'dd - MM - yy', changeYear: true, changeMonth: true,
                        onSelect: function () {
                            LoadEmpList();
                            return false;
                        }
            });
            function GetBasicSalaryData(EmpID) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "PayrollGrossSalary.aspx/GetBasicSalaryData",
                    data: "{ 'EmpID' : '" + EmpID + "'}",
                    success: function (response) {
                        var jData = $.parseJSON(response.d), out = "";
                        var CMTAIN = 0;
                        var int1 = 0;
                        var MedicalAllowance = 0;
                        var ComputerAllowance = 0;
                        var DeputationAllowance = 0;
                        var HajjDeduction = 0;
                        var BenvolentFund = 0;




                        $('#txtBasicPay').val(jData[0].BPay);
                        $('#txtHouseRent').val(jData[0].HouseRentAllowance);
                        $('#txtConveyanceAllowance').val(jData[0].ConveyanceAllowance);
                        $('#txtMedicalAllow').val(jData[0].MedicalAllowance);
                        $('#txtMiscEidAdvance').val(jData[0].MiscEidAdvance);
                        $('#txtComputerAllowance').val(jData[0].ComputerAllowance);
                        $('#txtEntertainmentAllowance').val(jData[0].EntertainmentAllowance);
                        $('#txtDeputationAllowance').val(jData[0].DeputationAllowance);
                        $('#txtProjectBasedAllowance').val(jData[0].ProjectBaseAllowance);
                        $('#txtArrears').val(jData[0].Arrears);

                        $('#txtGPF').val(jData[0].GPFContribution);
                        $('#txtGPFInstallment').val(jData[0].GPFAdvance);
                        $('#txtIncomeTax').val(jData[0].IncomeTax);
                        $('#txtGroupInsurance').val(jData[0].GroupInsurance);
                        $('#txtPersonnelInstalment').val(jData[0].PersonnelInstalment);
                        $('#txtCarAdvance').val(jData[0].CarAdvance);
                        $('#txtMotorCycle').val(jData[0].MotorCycleAdvance);
                        $('#txtHouseBuilding').val(jData[0].HouseBuildingAdvance);
                        $('#txtCashAdvanceLoan').val(jData[0].CashAdvanceLoan);

                        CalculateGrossSalary();
                        CalculateDeductions();
                    }
                });
            }
            ////////////////////////
            $('.clsAllowanceItem').live('keyup', function () {
                CalculateGrossSalary();
            });


            $('.clsDeductions').live('keyup', function () {
                CalculateDeductions();
            });



            function CalculateGrossSalary() {
                var totalGrossSalary = 0.00;
                $('.clsAllowanceItem').each(function (i, item) {
                    totalGrossSalary += parseFloat($(this).val());
                });
                $('#txtGrossSalary').val(totalGrossSalary);
                CalcualteNetSalary();
            }



            function CalculateDeductions() {
                var totalDeductions = 0.00;
                $('.clsDeductions').each(function (i, item) {
                    totalDeductions += parseFloat($(this).val());
                });
                $('#txtTotalDeduction').val(totalDeductions);
                CalcualteNetSalary();
            }


            function CalcualteNetSalary() {
                $('#txtNetSalary').val(parseFloat($('#txtGrossSalary').val()) - parseFloat($('#txtTotalDeduction').val()));
            }


            $('#btnSave').live('click', function () {
                var CompleteString = "";

                if ($('#txtSalaryDate').val().trim() == "") {
                    alertR("Please enter date...");
                    return false;
                }

                if ($('#txtNetSalary').val().trim() == "") {
                    alertR("Net Salary is not calculated..");
                    return false;
                }

                //concatente all strings
                CompleteString += $('#txtBasicPay').attr('tag') + '½';

                CompleteString += $('#txtSalaryDate').val() + '½';


                $('.clsAllowanceItem').each(function () {
                    CompleteString += $(this).val() + '½';
                });
                CompleteString += $('#txtGrossSalary').val() + '½';

                $('.clsDeductions').each(function () {
                    CompleteString += $(this).val() + '½';
                });
                CompleteString += $('#txtTotalDeduction').val() + '½';
                CompleteString += $('#txtNetSalary').val() + '½';


                if ($('#btnSave').attr('tag') == undefined || $('#btnSave').attr('tag') == "0") {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        url: "PayrollGrossSalary.aspx/SaveSalary",
                        data: "{ 'SalaryID' : '" + 0 + "', 'CompleteData' : '" + CompleteString + "'}",
                        success: function (response) {

                            //$('#btnSave').attr('tag', response.d);
                            if (response.d == "-1") {
                                alertR('Salary Already Generated..!');
                            }
                            else {
                                $('.clsAllowanceItem').each(function () {
                                    $(this).val('');
                                });
                                $('.clsDeductions').each(function () {
                                    $(this).val('');
                                });
                                $('#txtGrossSalary').val('');
                                $('#txtTotalDeduction').val('');
                                $('#txtNetSalary').val('');
                                $('#dvdtl').hide('slow');
                                $('#SearchMinimizer').click();
                                $('#toTop').click();
                                LoadEmpList();
                                alertG('Save Sucessfully!');
                            }
                        }
                    });
                }
                else {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        url: "PayrollGrossSalary.aspx/SaveSalary",
                        data: "{ 'SalaryID' : '" + $('#btnSave').attr('tag') + "', 'CompleteData' : '" + CompleteString + "'}",
                        success: function (response) {

                            $('.clsAllowanceItem').each(function () {
                                $(this).val('');
                            });
                            $('.clsDeductions').each(function () {
                                $(this).val('');
                            });
                            $('#txtGrossSalary').val('');
                            $('#txtTotalDeduction').val('');
                            $('#txtNetSalary').val('');

                            $('#dvdtl').hide('slow');
                            $('#SearchMinimizer').click();
                            $('#toTop').click();
                            alertG('Save Sucessfully!');
                        }
                    });
                }


            });
        });//END OF DOC READY
    </script>
</asp:Content>
