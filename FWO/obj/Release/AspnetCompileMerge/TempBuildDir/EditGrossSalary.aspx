<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EditGrossSalary.aspx.cs" Inherits="FRDP.EditGrossSalary" %>
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
                                <td>
                                    Month
                                </td>
                                <td>
                            <select id="ddlSalaryMonth" class="nostyle">
                            <option value="1">January</option>
                            <option value="2">February</option>
                            <option value="3">March</option>
                            <option value="4">April</option>
                            <option value="5">May</option>
                            <option value="6">June</option>
                            <option value="7">July</option>
                            <option value="8">August</option>
                            <option value="9">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>
                                </td>
                                <td>
                                    Year
                                </td>
                                <td><select id="ddlSalaryYear" class="nostyle">
                        <option>2010 </option><option>2011 </option><option>2012 </option><option>2013 </option><option>2014 </option><option>2015 </option><option selected="selected">2016 </option><option>2017 </option><option>2018 </option><option>2019 </option><option>2020 </option><option>2021 </option><option>2022 </option><option>2023 </option><option>2024 </option><option>2025 </option><option>2026 </option><option>2027 </option><option>2028 </option><option>2029 </option><option>2030 </option><option>2031 </option><option>2032 </option><option>2033 </option><option>2034 </option><option>2035 </option><option>2036 </option><option>2037 </option><option>2038 </option><option>2039 </option><option>2040 </option><option>2041 </option><option>2042 </option><option>2043 </option><option>2044 </option><option>2045 </option><option>2046 </option><option>2047 </option><option>2048 </option><option>2049 </option></select></td>
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
                                <td style="width: 100px; text-align: right;"><label class="form-label span3 clsHelper" for="normal" style="display: none;">Select DSU</label></td>
                                <td style="text-align: left;"><select id="ddlDSUList" class="pr clsHelper" style="display: none;"></select></td>
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
                                <th  style="width:120px;">Employee No</th>
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
                        <div style="margin-bottom: 20px;margin-left:5px;">


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
                                    <input id="txtMedicalAllow" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>

                                <div class="span6">
                                    <label class="form-label span6" for="normal">Misc./Eid Advance</label>
                                    <input id="txtMiscEidAdvance" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                            </div>



                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Computer Allowance</label>
                                    <input id="txtComputerAllowance" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Entertainment Allowance</label>
                                    <input id="txtEntertainmentAllowance" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
                                </div>

                            </div>



                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Deputation Allowance</label>
                                    <input id="txtDeputationAllowance" type="text" class="txtcs frmCtrl span4 numeric clsAllowanceItem" />
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
</div><%--END OF tab0--%>


<div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Gross Salary Deductions</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;margin-left:5px;">
                 
                    <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">GPF Contribution</label>
                                    <input id="txtGPF" type="text" class="txtcs frmCtrl span4 clsDeductions" />
                                </div>

                                <div class="span6">
                                    <label class="form-label span6" for="normal">GPF Advance</label>
                                    <input id="txtGPFInstallment" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" value="0" />
                                </div>

                            </div>


                            <div class="form-row row-fluid">

                                <div class="span6">
                                    <label class="form-label span6" for="normal">Income Tax</label>
                                    <input id="txtIncomeTax" type="text" value="0" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>

                  <div class="span6">
                                    <label class="form-label span6" for="normal">Group Insurance</label>
                                    <input id="txtGroupInsurance" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
                            </div>





                            <div class="form-row row-fluid">
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Other Deduction</label>
                                    <input id="txtPersonnelInstalment" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
                               
                                <div class="span6">
                                    <label class="form-label span6" for="normal">Car Advance</label>
                                    <input id="txtCarAdvance" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
                            </div>



                            <div class="form-row row-fluid">

                                <div class="span6">
                                    <label class="form-label span6" for="normal">Motor Cycle Advance</label>
                                    <input id="txtMotorCycle" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
                                </div>
<div class="span6">
                                    <label class="form-label span6" for="normal">House Building Advance</label>
                                    <input id="txtHouseBuilding" type="text" class="txtcs frmCtrl span4 numeric clsDeductions" />
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
</div><%--END OF tab0--%>

                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Net Salary</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;margin-left:5px;">
                        <div class="form-row row-fluid">
                            <div class="span6">&nbsp;</div>
                            <div class="span6">
                                <label class="form-label span6" for="normal">Net Salary</label>
                                <input id="txtNetSalary" type="text" class="txtcs frmCtrl span4" disabled="disabled" />
                            </div>
                        </div>




</div><%--END OF tab0--%>
                        <hr />
                                                <div class="form-row row-fluid">
                                                    <div class="span6">&nbsp;</div>
                            <div class="span6">
                                <label class="form-label span6" for="normal"></label>
                                <button type="button" class="btn btn-info spna2" id="btnSave">Save</button>
                            </div>
                        </div>
                    </form>
                </div> <%-- End of Content Dive--%> 

            </div>

        </div>
    </div>

      <div id="dvSalarySearch" title="Search Salary">
        <table>
            <tr>
                <td style="width: 100px;">Salary Month
                </td>
                <td>
                    <div class="controls sel" style="width: 120px;">

                    </div>

                </td>
            </tr>
            <tr>
                <td style="width: 100px;">Salary Year
                </td>
                <td>
                    <div class="controls sel">
                        
                    </div>

                </td>
            </tr>
            <tr>
                <td style="width: 100px;"></td>
                <td>
                    <button type="button" class="btn btn-info" id="btnSearchPreviousSalary">Search</button>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
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
            $('#ddlSalaryMonth').live('change', LoadEmpList);
            $('#ddlSalaryYear').live('change', LoadEmpList);
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
                    url: "EmpReg.ashx/?ID=101ǁ" + where + "ǁ" + $('#ddlSalaryMonth').val() + "ǁ" + $('#ddlSalaryYear').val(),
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            var $btn = "";
                            //alert(itm.bIsApproved);
                            if (itm.bIsApproved == "1") {
                                $btn = '<button tg="' + itm.tblEmployeeID + '" tag="1" title="View Only" class="btnEdit btn btn-success">s</button>';
                            }
                            else {
                                $btn = '<button tg="' + itm.tblEmployeeID + '"  tag="0" title="Editable" class="btnEdit btn btn-info">s</button>';
                            }
                            opt += '<tr tg="' + itm.tblEmployeeID + '"><td>' + itm.EmpNo + '</td>\
                                    <td>' + itm.NAME + '</td>\
                                    <td>' + itm.CNIC + '</td>\
                                    <td>' + itm.ContactNos + '</td>\
                                    <td>' + itm.CompanyName + '</td>\
                                    <td>' + itm.DeptName + '</td>\
                                    <td>' + itm.Designamtion + '</td>\
                                    <td>'+$btn+'</td>\
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
                            "iDisplayLength": -1,
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
                //$('#SearchMinimizer,#toTop').click();
                $('#EmpDisplay').attr('tg', tg).html('');
                $('#btnSave').attr('tag', tg);
                //EmpDisplayFunc(tg);


                $('.clsAllowanceItem').val(0);
                $('.clsDeductions').val(0);
                $('#txtBasicPay').attr('tag', tg);

                if ($(this).attr('tag')=="1") {
                    $('.clsDeductions,.clsAllowanceItem').attr('disabled', 'disabled');
                    $('#btnSave').hide();
                }
                else {
                    $('.clsDeductions,.clsAllowanceItem').removeAttr('disabled');

                    $('#txtMedicalAllow').attr('disabled', 'disabled');
                    $('#txtMiscEidAdvance').attr('disabled', 'disabled');
                    $('#txtComputerAllowance').attr('disabled', 'disabled');
                    $('#txtEntertainmentAllowance').attr('disabled', 'disabled');
                    $('#txtDeputationAllowance').attr('disabled', 'disabled');


                    $('#txtGPF').attr('disabled', 'disabled');
                    $('#txtGPFInstallment').attr('disabled', 'disabled');
                    $('#txtGroupInsurance').attr('disabled', 'disabled');
                    $('#txtCarAdvance').attr('disabled', 'disabled');
                    $('#txtMotorCycle').attr('disabled', 'disabled');
                    $('#txtHouseBuilding').attr('disabled', 'disabled');





                    $('#btnSave').show();
                }

                GetPreviousMonthlySalary(tg);
            });
            ////////////////////SEARCH START


            $('.heading h3').html('Edit Gross Salary');

            $('.numeric').numeric();
            $('#txtSalaryDate').datepicker({ dateFormat: 'dd - MM - yy', changeYear: true, changeMonth: true });
            $('#dvSalarySearch').dialog({ autoOpen: false, width: "45%", modal: true });
            //$(function () {
            //    for (var i = 2010; i < 2050; i++) {
            //        $('#ddlSalaryYear').append('<option >' + i + ' </option>');
            //    }

            //    $('#ddlSalaryYear').val(2016);
            //});

            $('#btnSearchPreviousSalary').live('click', function (e) {
                e.preventDefault();
                GetPreviousMonthlySalary();
            });
            function GetPreviousMonthlySalary(tg) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "EditGrossSalary.aspx/GetPrevousSalary",
                    data: "{ 'EmpID' : '" + tg + "', 'Month' : '" + $('#ddlSalaryMonth').val() + "', 'Year' : '" + $('#ddlSalaryYear').val() + "'}",
                    success: function (response) {
                        var jData = $.parseJSON(response.d), out = "";

                        if (jData.length == 1) {
                            $.each(jData, function (i, item) {
                                //$('#txtSalaryDate').val(item.SalaryDate);
                                //$('#txtBasicPay').val(item.BasicPay);
                                //$('#txtHouseRent').val(item.HouseRent);
                                //$('#txtConveyanceAllowance').val(item.ConveyanceAllowance);
                                //$('#txtIntegratedAllow').val(item.IntegratedAllowSplPay);
                                //$('#txtMedicalAllow').val(item.MedicalAllowCurrentBPay);
                                //$('#txtAdhocAllowance').val(item.AdhocAllowance7Point5);
                                //$('#txtMiscEidAdvance').val(item.MiscEidAdvance);
                                //$('#txtComputerAllowance').val(item.ComputerAllowance);
                                //$('#txtAdhocAllowanceEmpty').val(item.AdhocAllowanceEmpty);
                                //$('#txtEntertainmentAllowance').val(item.EntertainmentAllowance);
                                //$('#txtAdhocRelief10Percent').val(item.AdhocRelief10Percent);
                                //$('#txtDeputationAllowance').val(item.DeputationAllowance);
                                //$('#txtQualificationAllowance').val(item.QualificationAllowance);
                                //$('#txtTenPercentAAllowancePreviousYear').val(item.AAllow2013_10Percent);
                                //$('#txtSplReliefAllowance30Percent').val(item.SplReliefAllowance30Percent);
                                //$('#txtDrivingAllowance').val(item.DrivingAllowance);
                                //$('#txtAdhocAllowBPNov10').val(item.AdhocAllowBPNov10_50percent);
                                //$('#txtArrears').val(item.Arrears);
                                //$('#txtSPlAllwJuneBasic20Percent').val(item.SplAllowJuneBasic20Percent);
                                //$('#txtGrossSalary').val(item.GrossSalary);

                                //$('#txtGPF').val(item.GPF);
                                //$('#txtGPFInstallment').val(item.GPFInstallments);
                                //$('#txtStaffLedger').val(item.StaffLedger);
                                //$('#txtIncomeTax').val(item.IncomeTax);
                                //$('#txtTradeTax').val(item.TradeTax);
                                //$('#txtGroupInsurance').val(item.GroupInsurance);
                                //$('#txtPersonnelInstalment').val(item.PersonnelInstalment);
                                //$('#txtGRLSLoan').val(item.GRLSLoan);
                                //$('#txtHajFund').val(item.HajFund);
                                //$('#txtBenevolentFund').val(item.BenevolentFund);
                                //$('#txtCarAdvance').val(item.CarAdvance);
                                //$('#txtMotorCycle').val(item.MotorCycle);
                                //$('#txtHouseBuilding').val(item.HouseBuilding);
                                //$('#txtSalarySlipCharges').val(item.SalarySlipCharges);
                                //$('#txtPUTMicroFinance').val(item.PUTMicroFinance);
                                //$('#txtUnionFund').val(item.UnionFund);
                                //$('#txtShop').val(item.Shop);
                                //$('#txtEidAdvance').val(item.EidAdvanceSPL);
                                //$('#txtGovtResidence10').val(item.GovtResidence10Percent);
                                //$('#txtTotalDeduction').val(item.TotalDeductions);
                                //$('#txtNetSalary').val(item.NetSalary);



                                $('#txtBasicPay').val(jData[0].BasicPay);
                                $('#txtHouseRent').val(jData[0].HouseRent);
                                $('#txtConveyanceAllowance').val(jData[0].ConveyanceAllowance);
                                $('#txtMedicalAllow').val(jData[0].MedicalAllowCurrentBPay);
                                $('#txtMiscEidAdvance').val(jData[0].MiscEidAdvance);
                                $('#txtComputerAllowance').val(jData[0].ComputerAllowance);
                                $('#txtEntertainmentAllowance').val(jData[0].EntertainmentAllowance);
                                $('#txtDeputationAllowance').val(jData[0].DeputationAllowance);
                                $('#txtProjectBasedAllowance').val(jData[0].ProjectBaseAllowance);
                                $('#txtArrears').val(jData[0].Arrears);
                                $('#txtGrossSalary').val(jData[0].GrossSalary);
                                
                                $('#txtGPF').val(jData[0].GPF);
                                $('#txtGPFInstallment').val(jData[0].GPFInstallments);
                                $('#txtIncomeTax').val(jData[0].IncomeTax);
                                $('#txtGroupInsurance').val(jData[0].GroupInsurance);
                                $('#txtPersonnelInstalment').val(jData[0].PersonnelInstalment);
                                $('#txtCarAdvance').val(jData[0].CarAdvance);
                                $('#txtMotorCycle').val(jData[0].MotorCycle);
                                $('#txtHouseBuilding').val(jData[0].HouseBuilding);
                                $('#txtCashAdvanceLoan').val(jData[0].CashAdvanceLoan);

                                $('#txtTotalDeduction').val(jData[0].TotalDeductions);
                                $('#txtNetSalary').val(jData[0].NetSalary);

                                $('#SearchMinimizer,#toTop').click();
                                EmpDisplayFunc(tg);
                                $('#btnSave').attr('SalaryID', item.MonthlySalaryID);
                                $('#dvSalarySearch').dialog("close");

                            });
                        }
                        else {
                            alertR('Sorry! Record not found.');
                        }




                    }
                });
            }
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



                        $.each(jData, function (i, item) {
                            $('#txtBasicPay').val(item.BasicPay);


                            //*****CONVEYANCE ALLOWANCE 

                            switch (parseInt(item.MinimumPayScale, 2)) {
                                case 1: case 2: case 3: case 4:
                                    CMTAIN = 1785;
                                    break;
                                case 5: case 6: case 7: case 8: case 9: case 10:
                                    CMTAIN = 1932;
                                    break;
                                case 11: case 12: case 13: case 14: case 15:
                                    CMTAIN = 2856;
                                    break;
                                case 16: case 17: case 18: case 19: case 20: case 21: case 22:
                                    CMTAIN = 5000;
                                    break;
                                default:
                                    CMTAIN = 0;
                                    break;
                            }
                            $('#txtConveyanceAllowance').val(CMTAIN);





                            //***********Income Tax ****** 

                            $('#txtIncomeTax').val(item.IncomeTax);

                            //Adhoc Releif 50% 2010 
                            $('#txtAdhocAllowBPNov10').val(parseFloat(item.BasicPayNov2010) * 0.5);


                            //***  10 % Adhoc Relief Fund 2013 - Dearness Allowance 
                            $('#txtTenPercentAAllowancePreviousYear').val(parseFloat(item.BasicPayJun2015) * 0.1);


                            //***  20 % special/Secretary Allowance 
                            $('#txtSPlAllwJuneBasic20Percent').val(parseFloat(item.BasicPayNov2011) * 0.2);


                            //***  10 % Adhoc Relief 2014 - SRPOSTA Allowance 
                            $('#txtAdhocRelief10Percent').val(parseFloat(item.BasicPayJun2015) * 0.1);


                            //***************** House Rent *************** 

                            if (item.UseGovtHouse == "1") {
                                switch (item.MinimumPayScale) {
                                    case "1":
                                        int1 = 2970;
                                        break;
                                    case "2":
                                        int1 = 3035;
                                        break;
                                    case "3":
                                        int1 = 3140;
                                        break;
                                    case "4":
                                        int1 = 3240;
                                        break;
                                    case "5":
                                        int1 = 3340;
                                        break;
                                    case "6":
                                        int1 = 3430;
                                        break;
                                    case "7":
                                        int1 = 3530;
                                        break;
                                    case "8":
                                        int1 = 3665;
                                        break;
                                    case "9":
                                        int1 = 3820;
                                        break;
                                    case "10":
                                        int1 = 3955;
                                        break;
                                    case "11":
                                        int1 = 4115;
                                        break;
                                    case "12":
                                        int1 = 4355;
                                        break;
                                    case "13":
                                        int1 = 4645;
                                        break;
                                    case "14":
                                        int1 = 4920;
                                        break;
                                    case "15":
                                        int1 = 5220;
                                        break;
                                    case "16":
                                        int1 = 6060;
                                        break;
                                    case "17":
                                        int1 = 9850;
                                        break;
                                    case "18":
                                        int1 = 12910;
                                        break;
                                    case "19":
                                        int1 = 19680;
                                        break;
                                    case "20":
                                        int1 = 23345;
                                        break;
                                    case "21":
                                        int1 = 25880;
                                        break;
                                    case "22":
                                        int1 = 27680;
                                        break;
                                    default:
                                        int1 = 0;
                                        break;
                                }
                                $('#txtHouseRent').val(int1 * 0.45);
                            }

                            //*******************GPF**************************

                            $('#txtGPF').val(item.BasicPay * (item.GPFPercentage / 100));





                            //*************Medical Allowance 1 to 15 scale**** 



                            switch (item.MinimumPayScale) {
                                case 1:
                                    MedicalAllowance = Math.round((item.BasicPay * 4) / 12, 0);
                                    break;
                                case 2:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 3:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 4:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 5:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 6:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 7:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 8:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 9:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 10:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 11:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 12:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 13:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 14:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 15:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 16:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 17:
                                    MedicalAllowance = Math.round(item.BasicPay * 4 / 12, 0);
                                    break;
                                case 18:
                                    MedicalAllowance = Math.round(item.BasicPay * 3 / 12, 0);
                                    break;
                                case 19:
                                    MedicalAllowance = Math.round(item.BasicPay * 3 / 12, 0);
                                    break;
                                case 20:
                                    MedicalAllowance = Math.round(item.BasicPay * 3 / 12, 0);
                                    break;
                                case 21:
                                    MedicalAllowance = Math.round(item.BasicPay * 3 / 12, 0);
                                    break;
                                case 22:
                                    MedicalAllowance = Math.round(item.BasicPay * 3 / 12, 0);
                                    break;
                                default:
                                    MedicalAllowance = 0;
                                    break;
                            }
                            $('#txtMedicalAllow').val(Math.round(MedicalAllowance));


                            //  7.5% Adhoc Allowance (2015)
                            $('#txtAdhocAllowance').val(Math.round(item.BasicPay * 0.075, 0));


                            //COMPUTER ALLOWANCE 
                            if (item.DesignationID == 2) {
                                ComputerAllowance = 1500;
                            }
                            if (item.DesignationID == 37 || item.DesignationID == 38) {
                                ComputerAllowance = 750;
                            }

                            $('#txtComputerAllowance').val(ComputerAllowance);



                            //TRUST ALLOWANCE 

                            if (item.DesignationID == 45) {
                                $('#txtMiscEidAdvance').val(500);
                            }

                            if (item.DesignationID == 46) {
                                $('#txtMiscEidAdvance').val(600);
                            }


                            //***********Entertainment Allowance******* 


                            switch (item.MinimumPayScale) {
                                case '19':
                                    $('#txtEntertainmentAllowance').val(500);
                                    break;
                                default:
                                    $('#txtEntertainmentAllowance').val(0);
                                    break;
                            }


                            // **** Deputation Allowance **** 
                            if (item.DepotationAllowance == "1") {

                                switch (item.MinimumPayScale) {
                                    case "1":
                                        DeputationAllowance = 1870;
                                        break;
                                    case "2":
                                        DeputationAllowance = 1915;
                                        break;
                                    case "3":
                                        DeputationAllowance = 1980;
                                        break;
                                    case "4":
                                        DeputationAllowance = 2040;
                                        break;
                                    case "5":
                                        DeputationAllowance = 2100;
                                        break;
                                    case "6":
                                        DeputationAllowance = 2160;
                                        break;
                                    case "7":
                                        DeputationAllowance = 2220;
                                        break;
                                    case "8":
                                        DeputationAllowance = 2310;
                                        break;
                                    case "9":
                                        DeputationAllowance = 2410;
                                        break;
                                    case "10":
                                        DeputationAllowance = 2490;
                                        break;
                                    case "11":
                                        DeputationAllowance = 2590;
                                        break;
                                    case "12":
                                        DeputationAllowance = 2745;
                                        break;
                                    case "13":
                                        DeputationAllowance = 2925;
                                        break;
                                    case "14":
                                        DeputationAllowance = 3100;
                                        break;
                                    case "15":
                                        DeputationAllowance = 3285;
                                        break;
                                    case "16":
                                        DeputationAllowance = 3805;
                                        break;
                                    case "17":
                                        DeputationAllowance = 6210;
                                        break;
                                    case "18":
                                        DeputationAllowance = 8135;
                                        break;
                                    case "19":
                                        DeputationAllowance = 12400;
                                        break;
                                    case "20":
                                        DeputationAllowance = 14710;
                                        break;
                                    case "21":
                                        DeputationAllowance = 16305;
                                        break;
                                    case "22":
                                        DeputationAllowance = 17440;
                                        break;
                                    default:
                                        DeputationAllowance = 0;
                                        break;
                                }

                                $('#txtDeputationAllowance').val(DeputationAllowance);
                            }


                            //Driving Licence
                            if (item.DesignationID == 15) {
                                $('#txtDrivingAllowance').val(700);
                            }
                            else {
                                $('#txtDrivingAllowance').val(0);
                            }

                            //'********10 % GPF Deduction********* 

                            $('#txtGPF').val(item.BasicPay * item.GPFPercentage / 100);

                            //USE OF GOVT RESIDENCE DEDCTION 10 % 

                            $('#txtGovtResidence10').val(Math.round(item.BasicPay * 0.1, 0));


                            //******* Union fund******* 

                            if (item.MinimumPayScale >= 1 && item.MinimumPayScale <= 15) {
                                $('#txtUnionFund').val(100);
                            }
                            else {
                                $('#txtUnionFund').val(0);
                            }


                            //**********Washing allowance********* 

                            if (item.MinimumPayScale >= 1 && item.MinimumPayScale <= 4) {
                                $('#txtIntegratedAllow').val(150);
                            }
                            else {
                                $('#txtIntegratedAllow').val(0);
                            }


                            //****** Haj Fund Check ****** 


                            if (item.Is_Muslim) {
                                HajjDeduction = item.BasicPay * 0.01;

                                if (HajjDeduction < 80) {
                                    $('#txtHajFund').val(80);
                                }
                                else {
                                    $('#txtHajFund').val(HajjDeduction);
                                }
                                if (HajjDeduction > 150) {
                                    $('#txtHajFund').val(150);
                                }
                                else {
                                    $('#txtHajFund').val(Math.round(HajjDeduction));
                                }
                            }
                            else {
                                $('#txtHajFund').val(0);
                            }



                            //*********** Benavelent Fund ****** 

                            BenvolentFund = item.BasicPay * 0.02;

                            $('#txtBenevolentFund').val(Math.round(BenvolentFund, 0));






                            //*********** Salary Slip ****** 
                            $('#txtSalarySlipCharges').val(6);


                            //*********** Depotation Employees ****** 

                            if (item.DepotationAllowance == "1") {
                                $('#txtGovtResidence10').val(item.BasicPay * 0.05);
                                $('#txtGPF').val(0);
                                $('#txtGPFInstallment').val(0);
                                $('#txtStaffLedger').val(0);
                                $('#txtTradeTax').val(0);
                                $('#txtGroupInsurance').val(0);
                                $('#txtPersonnelInstalment').val(0);
                                $('#txtGRLSLoan').val(0);
                                $('#txtHajFund').val(0);
                                $('#txtBenevolentFund').val(0);
                                $('#txtCarAdvance').val(0);
                                $('#txtMotorCycle').val(0);
                                $('#txtHouseBuilding').val(0);
                                $('#txtPUTMicroFinance').val(0);
                                $('#txtUnionFund').val(0);
                                $('#txtShop').val(0);
                                $('#txtEidAdvance').val(0);
                            }





                            //Gross Salary / Deductions and Net Salary Calculations


                            CalculateGrossSalary();
                            CalculateDeductions();





                        });
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


            //$('#btnSave').bind('click', function () {
            //    var CompleteString = "";

            //    if ($('#txtSalaryDate').val().trim() == "") {
            //        alertR("Please enter date...");
            //        return false;
            //    }

            //    if ($('#txtNetSalary').val().trim() == "") {
            //        alertR("Net Salary is not calculated..");
            //        return false;
            //    }

            //    //concatente all strings
            //    CompleteString += $('#txtBasicPay').attr('tag') + '½';

            //    CompleteString += $('#txtSalaryDate').val() + '½';


            //    $('.clsAllowanceItem').each(function () {
            //        CompleteString += $(this).val() + '½';
            //    });
            //    CompleteString += $('#txtGrossSalary').val() + '½';

            //    $('.clsDeductions').each(function () {
            //        CompleteString += $(this).val() + '½';
            //    });
            //    CompleteString += $('#txtTotalDeduction').val() + '½';
            //    CompleteString += $('#txtNetSalary').val() + '½';


            //    if ($('#btnSave').attr('tag') == undefined || $('#btnSave').attr('tag') == "0") {
            //        $.ajax({
            //            type: "POST",
            //            contentType: "application/json; charset=utf-8",
            //            dataType: "json",
            //            url: "PayrollGrossSalary.aspx/SaveSalary",
            //            data: "{ 'SalaryID' : '" + 0 + "', 'CompleteData' : '" + CompleteString + "'}",
            //            success: function (response) {

            //                //$('#btnSave').attr('tag', response.d);
            //                $('.clsAllowanceItem').each(function () {
            //                    $(this).val('');
            //                });
            //                $('.clsDeductions').each(function () {
            //                    $(this).val('');
            //                });
            //                $('#txtGrossSalary').val('');
            //                $('#txtTotalDeduction').val('');
            //                $('#txtNetSalary').val('');
            //                $('#dvdtl').hide('slow');
            //                $('#SearchMinimizer').click();
            //                $('#toTop').click();
            //                alertG('Save Sucessfully!');
            //            }
            //        });
            //    }
            //    else {
            //        $.ajax({
            //            type: "POST",
            //            contentType: "application/json; charset=utf-8",
            //            dataType: "json",
            //            url: "PayrollGrossSalary.aspx/SaveSalary",
            //            data: "{ 'SalaryID' : '" + $('#btnSave').attr('tag') + "', 'CompleteData' : '" + CompleteString + "'}",
            //            success: function (response) {

            //                $('.clsAllowanceItem').each(function () {
            //                    $(this).val('');
            //                });
            //                $('.clsDeductions').each(function () {
            //                    $(this).val('');
            //                });
            //                $('#txtGrossSalary').val('');
            //                $('#txtTotalDeduction').val('');
            //                $('#txtNetSalary').val('');

            //                $('#dvdtl').hide('slow');
            //                $('#SearchMinimizer').click();
            //                $('#toTop').click();
            //                alertG('Save Sucessfully!');
            //            }
            //        });
            //    }


            //});


            $('#btnSave').bind('click', function () {
                var CompleteString = "";

                //if ($('#txtSalaryDate').val().trim() == "") {
                //    alertR("Please enter date...");
                //    return false;
                //}

                if ($('#txtNetSalary').val().trim() == "") {
                    alertR("Net Salary is not calculated..");
                    return false;
                }

                //concatente all strings
                CompleteString += $('#txtBasicPay').attr('tag') + '½';

                //CompleteString += $('#txtSalaryDate').val() + '½';


                $('.clsAllowanceItem').each(function () {
                    CompleteString += $(this).val() + '½';
                });
                CompleteString += $('#txtGrossSalary').val() + '½';

                $('.clsDeductions').each(function () {
                    CompleteString += $(this).val() + '½';
                });
                CompleteString += $('#txtTotalDeduction').val() + '½';
                CompleteString += $('#txtNetSalary').val() + '½';


                if ($('#btnSave').attr('SalaryID') == undefined || $('#btnSave').attr('SalaryID') == "0") {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        url: "EditGrossSalary.aspx/SaveSalary",
                        data: "{ 'SalaryID' : '" + 0 + "', 'CompleteData' : '" + CompleteString + "'}",
                        success: function (response) {
                            //alertG('Save Sucessfully!');
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
                else {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        url: "EditGrossSalary.aspx/SaveSalary",
                        data: "{ 'SalaryID' : '" + $('#btnSave').attr('SalaryID') + "', 'CompleteData' : '" + CompleteString + "'}",
                        success: function (response) {
                            //alert('Save Sucessfully!');
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
