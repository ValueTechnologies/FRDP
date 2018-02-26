<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="EmployeeRegistration.aspx.cs" Inherits="FRDP.EmployeeRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        select[name=tblEmpList_length] {
            /* width: 150px; */
            width: 62px !important;
        }
    </style>
    <div id="dvLoadEmployees" title="Confirmation">
        <p>
            CNIC already exists....<br />
            Do you want to load previous Data?
        </p>
    </div>



    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Employee Registration</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Employee No</label>
                                <input id="txtEmpNo" type="text" class="txtcs frmCtrl span8" readonly="readonly" />
                                <img id="validation" alt="" src="images/ajax_fb_loader.gif" style="display: none;" />
                            </div>

                            <div class="span6">
                                <label class="form-label span3" for="normal">CNIC</label>
                                <input id="txtCNIC" type="text" class="txtcs frmCtrl span8" />

                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Name</label>
                                <input id="txtName" type="text" class="txtcs frmCtrl span8" />
                            </div>

                            <div class="span6">
                                <label class="form-label span3" for="normal">Father Name</label>
                                <input id="txtFName" type="text" class="txtcs frmCtrl span8" />
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">DOB</label>
                                <input id="txtDOB" type="text" class="txtcs frmCtrl span8" />
                            </div>

                            <div class="span6">
                                <label class="form-label span3" for="normal">Gender</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlGender" class="txtcs frmCtrl">
                                        <option value="1">Male</option>
                                        <option value="0">Female</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Office Type</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlCompanyType">
                                        <option value="1">Head Office</option>
                                        <option value="2">Co-Ordination Office</option>
                                        <option value="3">Field Office</option>
                                        <option value="6">School</option>
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span3 clsHelper" for="normal">Select DSU</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlDSUList" class="clsHelper">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Appointment Office</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlCompany" class="txtcs frmCtrl">
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span3" for="normal">Department</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlDept" class="txtcs frmCtrl">
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">

                            <div class="span6">
                                <label class="form-label span3" for="normal">Designation</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlDesignation" class="txtcs frmCtrl">
                                    </select>
                                </div>
                            </div>

                            <div class="span6">
                                <label class="form-label span3" for="normal">Group</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlGroup" class="txtcs frmCtrl">
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Cell#</label>
                                <input id="txtCellNo" type="text" class="txtcs frmCtrl span8" />
                            </div>
                            <div class="span6">
                                <label class="form-label span3" for="normal">Active</label>
                                <div class="span8" style="margin-left: 0px;">
                                    <select id="ddlActive" class="txtcs frmCtrl">
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Qualification</label>
                                <input id="txtQualification" type="text" class="txtcs frmCtrl span8" />
                            </div>

                            <div class="span6">
                                <label class="form-label span3" for="normal">Email Address</label>
                                <input id="txtEmail" type="text" class="txtcs frmCtrl span8" />
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Appointment Date</label>
                                <input id="txtAppointmentDate" type="text" class="txtcs frmCtrl span8" />
                            </div>

                            <div class="span6">
                                <label class="form-label span3" for="normal">Resignation Date</label>
                                <input id="txtResignationDate" disabled="disabled" type="text" class="txtcs frmCtrl span8" />
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Photo</label>
                                <div class="span9" style="margin-left: 0px;">
                                    <input id="photoUpload" type="file" />
                                </div>

                            </div>
                            <div class="span6">
                                <label class="form-label span3" for="normal">CV</label>
                                <div class="span9" style="margin-left: 0px;">
                                    <input id="fileUploadCV" type="file" />
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal">Academic Documents</label>
                                <div class="span9" style="margin-left: 0px;">
                                    <input id="fileUploadAccadmicDoc" type="file" />
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span3" for="normal">Address</label>
                                <textarea id="txtAddress" cols="20" rows="2" class="txtcs frmCtrl span8"></textarea>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                             <div class="span6">
                            <label class="form-label span3" for="normal">Allowed Areas</label>
                                 <div class="span9">&nbsp;</div>
                            </div>
                            <div class="span6">
                                
                                <div class="span12" style="margin-left: 2px;">
                                    <select id="ddlAllowedAreas" style="width: 461px;">
                                        <option></option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12" style="text-align: right;">

                                <button id="btnSave" type="button" value="Save" class="btn btn-info">Save</button>
                                <button id="btnCancel" type="button" value="Cancel" class="btn">Cancel</button>
                            </div>
                        </div>



                    </form>
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
                        <span>Employees List</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table id="tblEmpList" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th>Employee No</th>
                                <th>Name</th>
                                <th>Father Name</th>
                                <th>CNIC</th>
                                <th>Cell#</th>
                                <th>Service Area</th>
                                <th>Department</th>
                                <th>Designation</th>
                                <th style="width: 52px;"></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>
    <script type="text/javascript" src="plugins/forms/maskedinput/jquery.maskedinput-1.3.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            LoadAllCompanies();
            //var _$_472b = ["POST", "EmpReg.ashx/?ID=23ǁ", "val", "#ddlCompany", "parseJSON", "", "<tr tg=\"", "User_ID", "\"><td>", "EmpNo", "</td>\r                                    <td>", "Full_Name", "FatherName", "CNIC", "</td>\r<td>", "ContactNos", "Area", "Department", "Designations", "</td>\r<td><button tg=\"", "\" title=\"Edit\" class=\"btnEdit btn btn-info\">e</button></td>\r</tr>", "each", "dataTable", "hasClass", "#tblEmpList", "fnDestroy", "html", "#tblEmpList tbody", "dynamicTable", "addClass", "All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", ".dynamicTable", "ajax"];

            //$(function () {
            //    $.ajax({
            //        type: "POST",
            //        url: "inv.ashx/?ID=47ǁ",
            //        success: function (response) {
            //            //alert(response);
            //            var jd = $.parseJSON(response), opt = '';
            //            $.each(jd, function (i, itm) {
            //                opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
            //            });
            //            $('#ddlDSUList').html(opt);
            //            $('.clsHelper').hide();
            //            LoadAllCompanies();
            //        }
            //    });
            //});


            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=52ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlAllowedAreas').html(opt);
                        $('#ddlAllowedAreas').multiselect({
                            show: ["clip", 500],
                            hide: ["clip", 500]
                        }).multiselectfilter();
                    }
                });
            });

            $('#ddlCompanyType').live('change', function () {
                LoadAllCompanies();
            });

            //$('#ddlCompanyType').live('change', function (e) {
            //    e.preventDefault();
            //    if ($(this).val() == "3") {
            //        $('.clsHelper').show();
            //    }
            //    else {
            //        $('.clsHelper').hide();
            //    }

            //    LoadAllCompanies();
            //});

            function LoadAllCompanies() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "EmployeeRegistration.aspx/getCompanies",
                    data: "{ 'Level' : '" + $('#ddlCompanyType').val() + "' }",
                    success: function (response) {
                        var jd = $.parseJSON(response.d), opt = '';
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

            // AllDepartment();
            // AllDesignation();
            $("#ddlCompany").live('change', function () {

                LoadEmpList();
                //AllDepartment();
                //AllDesignation();

            });
            function LoadEmpList() {
                //$[_$_472b[37]]({ type: _$_472b[0], url: _$_472b[1] + $(_$_472b[3])[_$_472b[2]](), success: function (c) { var a = $[_$_472b[4]](c), b = _$_472b[5]; $[_$_472b[21]](a, function (d, e) { b += _$_472b[6] + e[_$_472b[7]] + _$_472b[8] + e[_$_472b[9]] + _$_472b[10] + e[_$_472b[11]] + _$_472b[10] + e[_$_472b[12]] + _$_472b[10] + e[_$_472b[13]] + _$_472b[14] + e[_$_472b[15]] + _$_472b[14] + e[_$_472b[16]] + _$_472b[14] + e[_$_472b[17]] + _$_472b[14] + e[_$_472b[18]] + _$_472b[19] + e[_$_472b[7]] + _$_472b[20] }); if ($(_$_472b[24])[_$_472b[23]](_$_472b[22])) { $(_$_472b[24])[_$_472b[22]]()[_$_472b[25]]() }; $(_$_472b[27])[_$_472b[26]](b); $(_$_472b[24])[_$_472b[29]](_$_472b[28]); $(_$_472b[36])[_$_472b[22]]({ "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, _$_472b[30]]], "iDisplayLength": 10, "sPaginationType": _$_472b[31], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (g, f) { $(_$_472b[35])[_$_472b[34]](_$_472b[32], _$_472b[33]) } }); } })
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=23ǁ" + $('#ddlCompany').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.User_ID + '"><td>' + itm.EmpNo + '</td>\
                                    <td>'+ itm.Full_Name + '</td>\
                                    <td>'+ itm.FatherName + '</td>\
                                    <td>'+ itm.CNIC + '</td>\
<td>'+ itm.ContactNos + '</td>\
<td>'+ itm.Area + '</td>\
<td>'+ itm.Department + '</td>\
<td>' + itm.Designations + '</td>\
<td><button tg="' + itm.User_ID + '" title="Edit" class="btnEdit btn btn-info">e</button></td>\
</tr>';
                        });

                        if ($('#tblEmpList').hasClass('dataTable')) {
                            $('#tblEmpList').dataTable().fnDestroy();
                            //alert('Reached');
                        }

                        $('#tblEmpList tbody').html(opt);

                        $('#tblEmpList').addClass('dynamicTable');

                        $('.dynamicTable').dataTable({
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




                    }
                });
            }
            GetNextEmpNo();



            function GetNextEmpNo() {
                $('#txtEmpNo').attr('readonly', 'readonly');
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=29ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $('#txtEmpNo').val(jd[0].EmpNo);
                    }
                });
            }


            $('#btnCancel').live('click', function () {
                $('#btnSave').attr('tag', 0);
                $("*").css("cursor", "auto");
                $('.frmCtrl').each(function (index, element) {
                    $(this).val('');
                });

                $('#photoUpload').val('');
                $('#fileUploadCV').val('');
                $('#fileUploadAccadmicDoc').val('');
                $('#txtEmpNo').removeAttr('readonly');
                $('#btnSave').html('Save');
                GetNextEmpNo();
            });

            $('#txtEmpNo').live('focusout', function () {
                if ($.trim($(this).val()) != "" && $('#btnSave').attr('tag') == "0") {

                    $('#validation').attr('src', 'images/ajax_fb_loader.gif').show();
                    $.ajax({
                        type: "POST",
                        url: "EmpReg.ashx/?ID=0ǁ" + $('#txtEmpNo').val(),
                        success: function (response) {
                            if (response == "1") {
                                $('#validation').attr('src', 'images/ok.png').show();
                                $('#txtEmpNo').attr('tg', '0');
                            }
                            else {
                                $('#validation').attr('src', 'images/exists.png').show();
                                $('#txtEmpNo').attr('tg', '1');
                            }
                        }
                    });
                }
                else {
                    $('#validation').hide();
                    $('#txtEmpNo').attr('tg', '1');
                }

            });




            $('.btnEdit').live('click', function () {
                var $btn = $(this);
                $('#btnSave').html('Update');
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "EmployeeRegistration.aspx/LoadPreviousDataByID",
                    data: "{ 'cnic' : '" + $btn.attr('tg') + "' }",
                    success: function (response) {

                        var jData = $.parseJSON(response.d);

                        LoadEmployeeData(jData);
                        $('#toTopHover').click();
                    }
                });

            });

            $('#btnSave').attr('tag', 0);

            $('.heading h3').html('Employee Registration');
            $('#txtCNIC').mask('99999-9999999-9');


            $(function () {
                $("#txtAppointmentDate").datepicker({ dateFormat: 'dd - MM - yy', yearRange: "-100:+10", changeYear: true, changeMonth: true });
            });

            $(function () {
                $("#txtResignationDate").datepicker({ dateFormat: 'dd - MM - yy', yearRange: "-100:+10", changeYear: true, changeMonth: true });
            });

            $(function () {
                $("#txtDOB").datepicker({ dateFormat: 'dd - MM - yy', yearRange: "-100:+10", changeYear: true, changeMonth: true });
            });

            $("#dvLoadEmployees").dialog({
                autoOpen: false,
                resizable: false,
                modal: true,
                height: 170,
                width: 400,
                buttons: {
                    "Yes": function () {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            url: "EmployeeRegistration.aspx/LoadPreviousData",
                            data: "{ 'cnic' : '" + $('#txtCNIC').val() + "' }",
                            success: function (response) {

                                var jData = $.parseJSON(response.d);
                                LoadEmployeeData(jData);
                            }
                        });


                        $(this).dialog('close');
                    },
                    "No": function () {
                        $(this).dialog('close');
                    }
                }
            });



            function LoadEmployeeData(jData) {

                $('#txtEmpNo').val(jData[0].EmpNo).attr('readonly', 'readonly');
                $('#txtCNIC').val(jData[0].CNIC);
                $('#txtName').val(jData[0].Name);
                $('#txtFName').val(jData[0].FatherName);
                $('#txtDOB').val(jData[0].DOB);
                $('#ddlGender').val(jData[0].Is_Male);
                $('#ddlCompany').val(jData[0].CompanyID);

                AllDesignation();
                AllDepartment();
                AllUserGroups();
                $('#ddlDept').val(jData[0].DeptID);
                $("#ddlDept").prev().html($("#ddlDept option:selected").text());
                $('#ddlDesignation').val(jData[0].DesignationID);
                $("#ddlDesignation").prev().html($("#ddlDesignation option:selected").text());
                $('#ddlGroup').val(jData[0].UserGroupID);
                $("#ddlGroup").prev().html($("#ddlGroup option:selected").text());
                $('#txtCellNo').val(jData[0].ContactNos);
                $('#ddlActive').val(jData[0].U_Status);
                $('#txtQualification').val(jData[0].Qualification);
                $('#txtEmail').val(jData[0].Email);
                $('#txtAppointmentDate').val(jData[0].AppointmentDate);
                $('#txtResignationDate').val(jData[0].ResignationDate);
                $('#txtAddress').val(jData[0].Address);
                $('#btnSave').attr('tag', jData[0].User_ID);

                $("#ddlAllowedAreas").multiselect('uncheckAll');
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=25ǁ" + jData[0].User_ID,
                    success: function (response) {
                        //var jd = $.parseJSON(response);

                        //var _$_ab06 = ["click", "each", ":checkbox[value='", "LocID", "']", "find", "widget", "multiselect", "#ddlAllowedAreas"]; $[_$_ab06[1]](jd, function (a, b) { $(_$_ab06[8])[_$_ab06[7]](_$_ab06[6])[_$_ab06[5]](_$_ab06[2] + b[_$_ab06[3]] + _$_ab06[4])[_$_ab06[1]](function () { this[_$_ab06[0]]() }) });
                        var jd = $.parseJSON(response);

                        $.each(jd, function (i, itm) {
                            $("#ddlAllowedAreas").multiselect("widget").find(":checkbox[value='" + itm.LocID + "']").each(function () {
                                this.click();
                            });
                        });
                    }
                });



            }

            //LoadAllCompanies();
            AllDesignation();
            AllDepartment();
            //AllEmployees();


            $("#txtCNIC").focusout(function () {

                //if ($('#btnSave').attr('tag') == "0") {

                //    $.ajax({
                //        type: "POST",
                //        contentType: "application/json; charset=utf-8",
                //        dataType: "json",
                //        url: "EmployeeRegistration.aspx/CNICCheck",
                //        data: "{ 'cnic' : '" + $("#txtCNIC").val() + "'}",
                //        success: function (response) {
                //            var jData = $.parseJSON(response.d);

                //            if (jData[0] != undefined) {
                //                $("#dvLoadEmployees").dialog('open');
                //            }
                //        }
                //    });
                //}



            });





            AllUserGroups();
            function AllDepartment() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllDepartments",
                    data: "{ 'CompanyID' : '" + $("#ddlCompany").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value= ' + item.DepartmentID + '> ' + item.DepartmentName + '</option>';
                        });
                        $('#ddlDept').html(out);
                    }
                });
            }


            function AllDesignation() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllDesignation",
                    data: "{'CompanyID' : '" + $("#ddlCompany").val() + "' }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value=' + item.DesignationID + '> ' + item.Designation + '</option>';
                        });
                        $('#ddlDesignation').html(out);
                    }
                });
            }


            function AllUserGroups() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllGroups",
                    data: "{'CompanyID' : '0' }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value=' + item.User_Group_Id + '> ' + item.User_Group_Name + '</option>';
                        });
                        $('#ddlGroup').html(out);
                    }
                });
            }



            function AllEmployees() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllEmployees",
                    data: "{ 'SrchDept' : '" + $('#ddlSearchDepartment').val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<tr><td>' + item.SrNo + '</td><td>' + item.Name + '</td><td>' + item.CNIC + '</td><td>' + item.CellNo + ' </td><td>' + item.Email + '</td><td>' + item.Department + '</td><td>' + item.designation + '</td><td>' + item.Qualification + '</td></tr>';
                        });
                        $('#tbEmployees tbody').html(out);
                    }
                });
            }


            $('#btnSave').live('click', function () {



                $("*").css("cursor", "wait");
                if ($('#txtName').val() == "") {
                    alertR('Please enter name...');
                    return false;
                }
                if ($('#txtEmpNo').val() == "") {
                    alertR('Please enter Employee No...');
                    return false;
                }

                if ($('#btnSave').attr('tag') == "0") {
                    if ($('#txtEmpNo').attr('tg') == "1") {
                        alertR('Employee Number Already Exists!...');
                        return false;
                    }
                }
                if ($('#ddlCompany').val()==null || $('#ddlCompany').val()== undefined) {
                    alertR('Appointment Office must be selected!...');
                    return false;
                }

                var ctrlVals = "";
                $('.frmCtrl').each(function (index, element) {
                    ctrlVals += $(this).val() + '½';
                });
                //ID
                ctrlVals += $('#btnSave').attr('tag') + '½';





                var Province = "";
                $('[name="multiselect_ddlAllowedAreas"][type="checkbox"][aria-selected="true"]').each(function (i, item) {
                    Province += $(this).val() + '½';
                });
                if (Province != "") {
                    Province += '¼';
                    Province = Province.replace("½¼", "");
                }



                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "EmployeeRegistration.aspx/SaveBasicData",
                    data: "{ 'vals' : '" + ctrlVals + "','loc':'" + Province + "'}",
                    success: function (response) {
                        var EmpID = response.d;


                        var ctrlVals1 = "";
                        ctrlVals1 += "1" + '½';
                        ctrlVals1 += EmpID + '½';
                        //Photo Upload
                        var uploadfiles1 = $("#photoUpload").get(0);
                        var uploadedfiles1 = uploadfiles1.files;
                        var fromdata1 = new FormData();
                        fromdata1.append("vls", ctrlVals1);

                        for (var i = 0; i < uploadedfiles1.length; i++) {
                            fromdata1.append(uploadedfiles1[i].name, uploadedfiles1[i]);
                        }

                        var choice1 = {};
                        choice1.url = "EmployeeRegistrationCS.ashx";
                        choice1.type = "POST";
                        choice1.data = fromdata1;
                        choice1.contentType = false;
                        choice1.processData = false;
                        choice1.success = function (result) {
                            //Upload CV

                            var ctrlVals2 = "";
                            ctrlVals2 += "2" + '½';
                            ctrlVals2 += EmpID + '½';
                            //Photo Upload
                            var uploadfiles2 = $("#fileUploadCV").get(0);
                            var uploadedfiles2 = uploadfiles2.files;
                            var fromdata2 = new FormData();
                            fromdata2.append("vls", ctrlVals2);

                            for (var i = 0; i < uploadedfiles2.length; i++) {
                                fromdata2.append(uploadedfiles2[i].name, uploadedfiles2[i]);
                            }

                            var choice2 = {};
                            choice2.url = "EmployeeRegistrationCS.ashx";
                            choice2.type = "POST";
                            choice2.data = fromdata2;
                            choice2.contentType = false;
                            choice2.processData = false;
                            choice2.success = function (result) {
                                // upload Documents


                                var ctrlVals3 = "";
                                ctrlVals3 += "3" + '½';
                                ctrlVals3 += EmpID + '½';
                                //Photo Upload
                                var uploadfiles3 = $("#fileUploadAccadmicDoc").get(0);
                                var uploadedfiles3 = uploadfiles3.files;
                                var fromdata3 = new FormData();
                                fromdata3.append("vls", ctrlVals3);

                                for (var i = 0; i < uploadedfiles3.length; i++) {
                                    fromdata3.append(uploadedfiles3[i].name, uploadedfiles3[i]);
                                }

                                var choice3 = {};
                                choice3.url = "EmployeeRegistrationCS.ashx";
                                choice3.type = "POST";
                                choice3.data = fromdata3;
                                choice3.contentType = false;
                                choice3.processData = false;
                                choice3.success = function (result) {
                                    alertG('Save Employee Successfully!');
                                    $('#btnSave').attr('tag', 0);
                                    $("*").css("cursor", "auto");
                                    $('.frmCtrl').each(function (index, element) {
                                        $(this).val('');
                                    });

                                    $('#photoUpload').val('');
                                    $('#fileUploadCV').val('');
                                    $('#fileUploadAccadmicDoc').val('');
                                    //$('#txtEmpNo').removeAttr('readonly');
                                    $('#btnSave').html('Save');
                                    GetNextEmpNo();
                                };
                                choice3.error = function (err) {
                                    alertR(err.statusText);
                                };
                                $.ajax(choice3);


                                //end upload Documents
                            };
                            choice2.error = function (err) {
                                alertR(err.statusText);
                            };
                            $.ajax(choice2);



                            //end upload CV
                        };
                        choice1.error = function (err) {
                            alertR(err.statusText);
                        };
                        $.ajax(choice1);

                        //end photo Upload
                        LoadAllCompanies();
                    }
                });
                LoadEmpList();
                $("#ddlAllowedAreas").multiselect('uncheckAll');
            });
        });



    </script>

</asp:Content>
