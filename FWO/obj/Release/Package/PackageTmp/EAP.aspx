<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EAP.aspx.cs" Inherits="FRDP.EAP" %>
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
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Details :- </span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad" style="padding: 1px;">
                    <div id="EmpDisplay" tg="0" style="margin: 5px;"></div>
                    <%-- End of div EmpDisplay--%>
                                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Assign Project to Employee</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                            <tbody>

                                <tr>
                                    <td style="width: 100px;">Project</td>
                                    <td style="text-align: left; width: 40%;">
                                        <select id="ddlAwardType" class="frm" style="width: 387px;">
                                        </select>
                                    </td>
                                    <td style="width: 100px;">Assign Date </td>
                                    <td style="text-align: left;">
                                        <input id="txtDate" type="text" class="frm" style="width: 90%;" />
                                        <%--                                        <select id="ddlDept" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select>--%></td>
                                </tr>
                                <tr>
                                    <td>Project Base Salary</td>
                                    <td>
                                        <input id="txtReason" type="text" class="frm Integer" style="width: 90%;" /></td>
                                    <td>Location</td>
                                    <td>
                                        <input id="txtRemarks" type="text" class="frm" style="width: 90%;" /></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;">
                                        Description
                                    </td>
                                    <td colspan="3">
                                        <textarea id="txtOutComes"  class="frm"   style="width: 95.5%;" cols="20" rows="2"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="text-align: right;    padding-right: 28px;">
                                        <button id="btnSave" class="btn btn-info">Save</button>&nbsp;
                                        <button id="btnCancel" class="btn">Cancel</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Employee Project History</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <div id="dvawards" style="margin-left:5px;margin-right:5px;"></div>
                    </div>
                    <%--END OF tab0--%>
                    
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attach Documents</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;padding-left:5px; padding-right:5px;">
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
                    <%--END OF tab0--%><br /><br /><br /><br />
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
                url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + $("#EmpDisplay").attr('tg') + "ǁ" + "EProj"),
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
            //function LoadEmpList() {

            //    var where = $('#ddlCompany').val();
            //    if ($('#ddlGroup').val() != "0") {
            //        where += ' AND tblEmployee.User_Group_Id =' + $('#ddlGroup').val()
            //    }
            //    if ($('#ddlDept').val() != "0") {
            //        where += ' AND tblEmployee.tblDept =' + $('#ddlDept').val()
            //    }
            //    if ($('#ddlDesignation').val() != "0") {
            //        where += ' AND tblEmployee.tblDesigID =' + $('#ddlDesignation').val()
            //    }

            //    $.ajax({
            //        type: "POST",
            //        url: "EmpReg.ashx/?ID=79ǁ" + where,
            //        success: function (response) {

            //            var jd = $.parseJSON(response), opt = '';
            //            $.each(jd, function (i, itm) {
            //                opt += '<tr tg="' + itm.tblEmployeeID + '"><td>' + itm.EmpNo + '</td>\
            //                        <td>' + itm.NAME + '</td>\
            //                        <td>' + itm.CNIC + '</td>\
            //                        <td>' + itm.ContactNos + '</td>\
            //                        <td>' + itm.CompanyName + '</td>\
            //                        <td>' + itm.DeptName + '</td>\
            //                        <td>' + itm.Designamtion + '</td>\
            //                        <td><button tg="' + itm.tblEmployeeID + '" title="Select Employee" class="btnEdit btn btn-info">s</button></td>\
            //                        </tr>';
            //            });

            //            if ($('#tblEmpList').hasClass('dataTable')) {
            //                $('#tblEmpList').dataTable().fnDestroy();
            //            }

            //            $('#tblEmpList tbody').html(opt);

            //            $('#tblEmpList').addClass('dynamicTable');

            //            // Setup - add a text input to each footer cell
            //            $('#tblEmpList tfoot th').each(function () {
            //                var title = $(this).text();
            //                if ($.trim(title) != "") {
            //                    $(this).html('<input type="text" placeholder="' + title + '" style="width: 90%;" />');
            //                }

            //            });

            //            var table = $('#tblEmpList').DataTable({
            //                "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
            //                "iDisplayLength": 10,
            //                "sPaginationType": "full_numbers",
            //                "bJQueryUI": false,
            //                "bAutoWidth": false,
            //                "bLengthChange": true,
            //                "fnInitComplete": function (oSettings, json) {
            //                    $('.dataTables_filter>label>input').attr('id', 'search');
            //                }
            //            });
            //            table.columns().every(function () {
            //                var that = this;

            //                $('input', this.footer()).live('keyup change', function () {
            //                    if (that.search() !== this.value) {
            //                        that
            //                            .search(this.value)
            //                            .draw();
            //                    }
            //                });
            //            });

            //            $('#tblEmpList_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');


            //        }
            //    });
            //}
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
                getInquiries(tg);
                getDocs(tg);
            });
            function EmpDisplayFunc(emp) {

                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=55ǁ" + emp,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText);
                        $('#EmpDisplay').html(jData[0].EmpDisplay);
                        //getInquiries(emp);
                        //getDocs(emp);
                        $('#dvdtl').show('slow');

                    }
                });
            }

           
            ////////////////////SEARCH START

            function getDocs(emp) {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + emp + "ǁ" + "EProj"),
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

            function getInquiries(tg) {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=82ǁ" + tg,
                    success: function (response) {
                        $('#dvawards').html(response)
                       
                    }
                });
            }
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                //$('#min').click();
            });
            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#txtDate').val() == "") {
                    alertR('Please Select Valid Date..!');
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
                    url: "EmpReg.ashx/?ID=81ǁ"  + f + "ǁ" + $('#EmpDisplay').attr('tg'),
                    success: function (response) {
                        alertG('Rrecord Saved');
                        getInquiries($('#EmpDisplay').attr('tg'));
                    }
                });

            });// end of save

            $('#txtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });


            $(function() {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=80ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlAwardType').html(opt);
                        //$('#ddlAwardType').eComboBox();
                    }
                });
            });
            $(".trDoc").live('click', function (e) {
                document.location = "exeDataIMS.ashx/?ID=" + encodeURIComponent("114ǁ" + $(this).text() + "ǁEmp/" + $(this).attr('tag'));
            });
        });//END OF DOC READY
    </script>
</asp:Content>
