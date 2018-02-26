<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeParticularsN.aspx.cs" Inherits="FRDP.EmployeeParticularsN" %>
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
                                                <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Basic Pay</label>
                                <input id="txtBasicPay" type="text" class="txtcs frmCtrl span6" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Rate of Increment</label>
                                <input id="txtRateOfIncrement" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Minimum Pay Scale</label>
                                <input id="txtMinimumPayScale" type="text" class="txtcs frmCtrl span6" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Directorate</label>

                                <div class="span6 controls sel">
                                    <select id="ddlDirectorate" class="nostyle frmCtrl">
                                        <option value="1"> M.D. CELL</option><option value="2"> D.M.D. CELL</option><option value="3"> A &amp; C</option><option value="4"> COORDINATION</option><option value="5"> F A &amp; P</option><option value="6"> PLANNING</option><option value="7"> IA</option><option value="8"> C &amp; CI</option><option value="9"> C &amp; M</option><option value="10"> P &amp; M</option><option value="11"> ESTABLISHMENT</option><option value="12"> R.O LHR</option><option value="13"> R.O G/WALA</option><option value="14"> R.O R/PINDI</option><option value="15"> R.O MULTAN</option><option value="16"> R.O SARGODHA</option><option value="17"> R.O B/PUR</option><option value="18"> R.O D.G.KHAN</option><option value="19"> DTE W &amp; E</option><option value="20"> F &amp; A</option><option value="21"> ADMN.</option><option value="22"> P &amp; C</option><option value="23"> CLUSTER SCHEME</option><option value="24"> CENSUS SCHEME</option><option value="25"> R.O FAISALABAD</option><option value="26"> PE&amp;R</option><option value="27"> I&amp;C</option><option value="28"> PNI</option><option value="29"> CNG</option><option value="30"> POBOH</option><option value="31"> IT SECTION</option><option value="32"> L.P.R</option><option value="33"> APSC</option><option value="34"> Identi.cluster</option><option value="35"> STONE CRAFT TAXILA</option><option value="36"> SALT RANGE KHEWRA</option><option value="37"> IT CP.BUILDIN</option><option value="38"> CENSUS &amp; SURVEY</option><option value="1002"> </option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Bank</label>
                                <div class="span6 controls sel">
                                    <select id="ddlBank" class="nostyle frmCtrl">
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Bank Account #</label>
                                <input id="txtBankAccountNo" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">ECR Page No.</label>
                                <input id="txtECRPageNo" type="text" class="txtcs frmCtrl span6" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Car Maintain</label>
                                <div class="span6 controls sel">
                                    <select id="ddlCarMaintain" class="nostyle frmCtrl">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Transfer Status</label>
                                <div class="span6 controls sel">
                                    <select id="ddlTransferStatus" class="nostyle frmCtrl">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Move Over</label>
                                <input id="txtMoveOver" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>




                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Pick and Drop</label>
                                <div class="span6 controls sel">
                                    <select id="ddlPickAndDrop" class="nostyle frmCtrl">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Leave half average</label>
                                <div class="span6 controls sel">
                                    <select id="ddlLeaveHalfAverage" class="nostyle frmCtrl">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Use Govt. House</label>
                                <div class="span6 controls sel">
                                    <select id="ddlUseGovtHouse" class="nostyle frmCtrl">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Muslim</label>
                                <div class="span6 controls sel">
                                    <select id="ddlMuslim" class="nostyle frmCtrl">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Depotation Allowance</label>
                                <div class="span6 controls sel">
                                    <select id="ddlDepotationAllowance" class="nostyle frmCtrl">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Persoanl Loan</label>
                                <input id="txtPersonalLoan" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">GPF Percentage</label>
                                <input id="txtGPFPercentage" type="text" class="txtcs frmCtrl span6" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">GRLS</label>
                                <input id="txtGRLS" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">GRLS Installments</label>
                                <input id="txtGRLSInstallments" type="text" class="txtcs frmCtrl span6" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">House Building Advance</label>
                                <input id="txtHouseBuildingAdvance" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Basic Pay Nov 2010</label>
                                <input id="txtBasicPayNov2010" type="text" class="txtcs frmCtrl span6" />
                            </div>
                            <div class="span6">
                                <label class="form-label span5" for="normal">Basic Pay Jun 2011</label>
                                <input id="txtBasicPayJun2011" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal">Basic Pay Jun 2015</label>
                                <input id="txtBasicPayJun2015" type="text" class="txtcs frmCtrl span6" />
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span5" for="normal"></label>
                                <button type="button" class="btn btn-info" id="btnSave">Save</button>
                            </div>
                        </div>


                    </form>
                </div> <%-- End of Content Dive--%> 

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
            function LoadEmpList() {

                var where =$('#ddlCompany').val();
                if ($('#ddlGroup').val() != "0") {
                    where +=  ' AND tblEmployee.User_Group_Id =' + $('#ddlGroup').val()
                }
                if ($('#ddlDept').val() != "0") {
                    where +=  ' AND tblEmployee.tblDept =' + $('#ddlDept').val()
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
                $('#btnSave').attr('tag', tg);
                $('#btnSave').attr('IsUpdated', 'No');
                EmpDisplayFunc(tg);
                LoadPreviousData(tg);
            });
            ////////////////////SEARCH START




            function LoadPreviousData(EmpID) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "EmployeeParticulars.aspx/SearchEmployeePayrollDataByID",
                    data: "{ 'EmpID' : '" + EmpID + "'}",
                    success: function (response) {

                        var jData = $.parseJSON(response.d), out = "";


                        try {
                            $.each(jData, function (i, item) {

                                $('#txtBasicPay').val(item.BasicPay);
                                $('#txtRateOfIncrement').val(item.RateOfIncrement);
                                $('#txtMinimumPayScale').val(item.MinimumPayScale);
                                $('#ddlDirectorate').val(item.DirectorateId);
                                $('#ddlBank').val(item.BankId);
                                $('#txtBankAccountNo').val(item.BankAccountNo);
                                $('#txtECRPageNo').val(item.ECRPageNo);
                                $('#ddlCarMaintain').val(item.CarMaintain);
                                $('#ddlTransferStatus').val(item.TransferStatus);
                                $('#txtMoveOver').val(item.MoveOver);
                                $('#ddlPickAndDrop').val(item.PickAndDrop);
                                $('#ddlLeaveHalfAverage').val(item.LeaveHaldAverage);
                                $('#ddlUseGovtHouse').val(item.UseGovtHouse);
                                $('#ddlMuslim').val(item.Is_Muslim);
                                $('#ddlDepotationAllowance').val(item.DepotationAllowance);
                                $('#txtPersonalLoan').val(item.PersonalLoan);
                                $('#txtGPFPercentage').val(item.GPFPercentage);
                                $('#txtGRLS').val(item.GRLS);
                                $('#txtGRLSInstallments').val(item.GRLSInstallments);
                                $('#txtHouseBuildingAdvance').val(item.HouseBuildingAdvance);
                                $('#txtBasicPayNov2010').val(item.BasicPayNov2010);
                                $('#txtBasicPayJun2011').val(item.BasicPayNov2011);
                                $('#txtBasicPayJun2015').val(item.BasicPayJun2015);

                                $('#btnSave').attr('IsUpdated', 'Yes');


                            });
                        } catch (e) {
                            $('#btnSave').attr('IsUpdated', 'No');
                        }


                    }
                });
            }

           
            LoadBank();
            function LoadBank() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeParticulars.aspx/AllBanks",
                    data: "{ }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value= ' + item.BankID + '> ' + item.Bank + '</option>';
                        });
                        $('#ddlBank').html(out);
                        $("#ddlBank").prev().html($("#ddlBank option:selected").text());
                    }
                });
            }


            $('#btnSave').bind('click', function () {

                if ($('#txtBasicPay').val().trim() == "") {
                    alertR('Please enter basic pay...');
                    return;
                }

                if ($('#txtRateOfIncrement').val().trim() == "") {
                    alertR('Please enter Rate Of Increment...');
                    return;
                }

                if ($('#txtBankAccountNo').val().trim() == "") {
                    alertR('Please enter Bank Account No...');
                    return;
                }


                var ctrlVals = "";
                $('.frmCtrl').each(function (index, element) {
                    ctrlVals += $(this).val() + '½';
                });

                ctrlVals += $('#btnSave').attr('tag') + '½';


                if ($('#btnSave').attr('IsUpdated') == 'Yes') {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        url: "EmployeeParticulars.aspx/UpdateEmployeePayrollDataByID",
                        data: "{ 'Vals' : '" + ctrlVals + "'}",
                        success: function (response) {

                            $('.frmCtrl').each(function (index, element) {
                                $(this).val('');
                            });

                            $('#btnSave').removeAttr('tag');
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
                        url: "EmployeeParticulars.aspx/SaveEmpParticular",
                        data: "{ 'Vals' : '" + ctrlVals + "'}",
                        success: function (response) {

                            $('.frmCtrl').each(function (index, element) {
                                $(this).val('');
                            });
                            $('#dvdtl').hide('slow');
                            $('#SearchMinimizer').click();
                            $('#btnSave').removeAttr('tag');
                            $('#toTop').click();
                            alertG('Save Sucessfully!');

                        }
                    });

                }

            });

        });//END OF DOC READY
    </script>
</asp:Content>
