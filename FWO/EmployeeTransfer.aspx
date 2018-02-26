<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeTransfer.aspx.cs" Inherits="FRDP.EmployeeTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        select[name=tblEmpSearch_length] {
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
                        <span>Employee Selection</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                      <br />  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 100px;">Location</td>
                                <td style="text-align: left; width: 40%;">
                                    <asp:DropDownList ID="ddlLocation" runat="server" Width="94%" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" ClientIDMode="Static" AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListByEmp" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:CookieParameter CookieName="Emp_Id" DefaultValue="0" Name="User_ID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 100px;">Designation</td>
                                <td style="text-align: left;">
                                    <asp:SqlDataSource ID="SDGenerator" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="
SELECT        '%' AS ID, 'All' AS NAME, 1 AS ord
UNION
SELECT         CAST(ID AS VARCHAR(10)) AS ID, NAME , 2 AS ord
FROM            tblDesig
WHERE        (ID IN
                             (SELECT        DesignationID
                               FROM            TblHResources
                               WHERE        (CompanyID = @CompanyID)))
ORDER BY ord, NAME">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="NAME" DataValueField="ID"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Search" ClientIDMode="Static" OnClick="btnShowRpt_Click" /></td>
                            </tr>
                        </tbody>
                    </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                

                   
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
                        <span>Employees</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table id="tblEmpSearch" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th>EMP#</th>
                                <th>Name</th>
                                <th>Father Name</th>
                                <th>Contact</th>
                                <th>CNIC</th>
                                <th>Area</th>
                                <th>Designation</th>
                                <th>Salary</th>
                                <th></th>


                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>


    <div id="dvTransfer" title="Employee Transfer" style="display: none;">
        <table class="table">
            <tbody>
                <tr class="success">
                    <td rowspan="3" style="width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;">
                        <img id="imgEmpPhoto" src="Uploads/EmployeePhoto/0.png" alt="" style="width: 75px;" class="image marginR10" /></td>
                    <td style="text-align: left; width: 80px;"><strong>Emp#</strong></td>
                    <td style="text-align: left;" id="t1"></td>
                    <td style="text-align: left; width: 80px;"><strong>Name</strong></td>
                    <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="t2"></td>
                </tr>
                <tr class="error">
                    <td style="text-align: left;"><strong>CNIC</strong></td>
                    <td style="text-align: left;" id="t3"></td>
                    <td style="text-align: left;"><strong>Father Name</strong></td>
                    <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="t4"></td>
                </tr>
                <tr class="info">

                    <td style="text-align: left;"><strong>Designation</strong></td>
                    <td style="text-align: left;" id="t5"></td>
                    <td style="text-align: left;"><strong>Appointed At</strong></td>
                    <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="t6"></td>
                </tr>
            </tbody>
        </table>

        <div class="row-fluid">
            <div class="span12">

                <div class="box gradient">

                    <div class="title">

                        <h4>
                            <span class="icon16 icomoon-icon-equalizer-2"></span>
                            <span>Transfer</span>
                        </h4>
                        <a id="min" href="#" class="maximize" style="display: none;">Minimize</a>
                    </div>
                    <div class="content noPad" style="display: none;">
                        <br />
                        <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                            <tbody>
                                <tr>
                                    <td style="width: 100px;">Location</td>
                                    <td style="text-align: left; width: 40%;">
                                        <select id="ddlCompany" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">Department</td>
                                    <td style="text-align: left;">
                                        <select id="ddlDept" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Designation</td>
                                    <td>
                                        <select id="ddlDesignation" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select></td>
                                    <td>Group</td>
                                    <td>
                                        <select id="ddlGroup" class="frm" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Allowed Areas</td>
                                    <td>
                                        <select id="ddlAllowedAreas" style="width: 93.5%;">
                                            <option>Company</option>
                                        </select></td>
                                    <td>Salary</td>
                                    <td>
                                        <input id="txtSalary" class="Integer frm" type="text" style="width: 90%;" /></td>
                                </tr>
                                <tr>
                                    <td>Transfer Date</td>
                                    <td>
                                        <input id="txtTransferDate" class="frm" type="text" style="width: 90%;" /></td>
                                    <td>Shift</td>
                                    <td><select id="ddlShift" class="frm" style="width: 93.5%;">
                                            <option value="1">Day Shift</option>
                                        <option value="2">Night Shift</option>
                                        <option value="3">Full Shift</option>
                                        </select>
</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>                                        <button id="btnTranferSave" class="btn btn-info">Save</button>&nbsp;
                                        <button id="btnCancel" class="btn">Cancel</button></td>
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
                                        <span>Transfer History</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">

<br />
<table id="tblTransferHistory" class="responsive table table-striped table-bordered table-condensed" style="  width: 96%;  margin-left: 20px;  margin-right: 20px;  border-right: 1px solid #c4c4c4;">
                                <thead>
                                  <tr>
                                    <th>Date</th>
                                    <th>&nbsp;</th>
                                      <th>Location</th>
                                      <th>Department</th>
                                      <th>Designation</th>
                                      <th>Group</th>
                                      <th>Salary</th>
                                      <th>Shift</th>
                                  </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
<br />
</div>

                            </div>

                        </div>
    </div>
    </div>

    <script type="text/javascript">
       $(document).ready(function () {

            LoadAllCompanies();

            function LoadAllCompanies() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=17ǁ",
                    success: function (response) {
                        //alert(response);
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlCompany').html(opt);
                        $('#ddlAllowedAreas').html(opt);
                        var _$_2cca = ["Select Province!", "clip", "multiselect", "#ddlAllowedAreas"]; $(_$_2cca[3])[_$_2cca[2]]({ header: _$_2cca[0], show: [_$_2cca[1], 500], hide: [_$_2cca[1], 500] });
                        $('.ui-multiselect').css('width', '93.5%');
                        if (opt != '') {
                            AllDepartment();
                            AllDesignation();
                        }
                    }
                });

            }
            $('#txtTransferDate').datepicker({ dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true });

            $("#ddlCompany").live('change', function () {
                AllDepartment();
                AllDesignation();

            });
            AllUserGroups();

            function AllDepartmentS(obj) {
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
                        $("#ddlDept").val(obj);
                    }
                });
            }

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

            function AllDesignationS(obj) {
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
                        $('#ddlDesignation').val(obj)
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

            function AllUserGroupsS(obj) {
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
                        $("#ddlGroup").val(obj);
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



            $(function () {
                $('#dvTransfer').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 530,
                    width: 800,

                    show: {
                        effect: "clip",
                        duration: 500
                    },
                    hide: {
                        effect: "clip",
                        duration: 500
                    },
                    beforeClose: function (event, ui) {

                        if ($('#min').hasClass('minimize')) {
                            $('#min').click();
                        }

                    }

                });
            });


            $('#btnTranferSave').live('click', function (e) {
                e.preventDefault();
                if ($('#txtTransferDate').val() == "") {
                    alertR('Please Select Valid Date..!');
                    return false;
                }

                if ($('#txtSalary').val() == "") {
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
                $('[name="multiselect_ddlAllowedAreas"][type="checkbox"][aria-selected="true"]').each(function (i, item) {
                    Province += $(this).val() + '½';
                });
                if (Province != "") {
                    Province += '¼';
                    Province = Province.replace("½¼", "");
                }
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=27ǁ" + $('#dvTransfer').attr('eid') + "ǁ" + f + "ǁ" + Province,
                    success: function (response) {
                        alertG('Rrecord Saved');
                        LoadEmp();
                        tblTransferHistoryLoad($('#dvTransfer').attr('eid'));
                    }
                });
                
            });

            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                $('#min').click();
            });

            //=======================================

            $('#<%=btnShowRpt.ClientID%>').live('click', function (e) {
            e.preventDefault();
            LoadEmp();
            });

            $('#<%= ddlGenerator.ClientID%>').live('change', LoadEmp);
            LoadEmp();

            function LoadEmp() {
                var _$_6498 = ["val", "option:selected", "find", "½", "POST", "application/json; charset=utf-8", "json", "EmployeeTransfer.aspx/GetEmpList", "{'vals':'", "'}", "d", "parseJSON", "", "<tr><td>", "EmpNo", "</td>\r                                    <td>", "Full_Name", "FatherName", "</td>\r                                      <td>", "ContactNos", "CNIC", "Area", "Designations", "Salary", "</td>\r                                      <td><button class=\"btnEdit btn btn-info\" eid=\"", "User_ID", "\">Transfer</button></td></tr>", "each", "dataTable", "hasClass", "#tblEmpSearch", "fnDestroy", "html", "#tblEmpSearch tbody", "dynamicTable", "addClass", "All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", ".dynamicTable", "ajax"]; var vals = $('#<%= ddlLocation.ClientID %>')[_$_6498[2]](_$_6498[1])[_$_6498[0]]() + _$_6498[3] + $('#<%= ddlGenerator.ClientID %>')[_$_6498[2]](_$_6498[1])[_$_6498[0]](); $[_$_6498[43]]({ type: _$_6498[4], contentType: _$_6498[5], dataType: _$_6498[6], url: _$_6498[7], data: _$_6498[8] + vals + _$_6498[9], success: function (c) { var a = $[_$_6498[11]](c[_$_6498[10]]), b = _$_6498[12]; $[_$_6498[27]](a, function (d, e) { b += _$_6498[13] + e[_$_6498[14]] + _$_6498[15] + e[_$_6498[16]] + _$_6498[15] + e[_$_6498[17]] + _$_6498[18] + e[_$_6498[19]] + _$_6498[18] + e[_$_6498[20]] + _$_6498[18] + e[_$_6498[21]] + _$_6498[18] + e[_$_6498[22]] + _$_6498[18] + e[_$_6498[23]] + _$_6498[24] + e[_$_6498[25]] + _$_6498[26] }); if ($(_$_6498[30])[_$_6498[29]](_$_6498[28])) { $(_$_6498[30])[_$_6498[28]]()[_$_6498[31]]() }; $(_$_6498[33])[_$_6498[32]](b); $(_$_6498[30])[_$_6498[35]](_$_6498[34]); $(_$_6498[42])[_$_6498[28]]({ "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, _$_6498[36]]], "iDisplayLength": 10, "sPaginationType": _$_6498[37], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (g, f) { $(_$_6498[41])[_$_6498[40]](_$_6498[38], _$_6498[39]) } }); } });
            }

            $('.btnEdit').live('click', function (e) {
                e.preventDefault();
                var $eid = $(this).attr('eid');

                $('#dvTransfer').attr('eid', $eid);
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=26ǁ" + $eid,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $('#imgEmpPhoto').attr('src', 'Uploads/EmployeePhoto/' + jd[0].PhotoExtension);
                        $('#t1').html(jd[0].EmpNo);
                        $('#t2').html(jd[0].Full_Name);
                        $('#t3').html(jd[0].CNIC);
                        $('#t4').html(jd[0].FatherName);
                        $('#t5').html(jd[0].Designations);
                        $('#t6').html(jd[0].Area);
                        

                        $('#ddlCompany').val(jd[0].CompanyID);

                        AllDesignationS(jd[0].DesignationID);
                        AllDepartmentS(jd[0].DeptID);
                        AllUserGroupsS(jd[0].UserGroupID);
                        $('#txtSalary').val(jd[0].Salary);



                        var _$_95d2 = ["uncheckAll", "multiselect", "#ddlAllowedAreas"]; $(_$_95d2[2])[_$_95d2[1]](_$_95d2[0]);
                        $.ajax({
                            type: "POST",
                            url: "EmpReg.ashx/?ID=25ǁ" + jd[0].User_ID,
                            success: function (response) {
                                var jd = $.parseJSON(response);
                                
                                var _$_8980 = ["click", "each", ":checkbox[value='", "LocID", "']", "find", "widget", "multiselect", "#ddlAllowedAreas"]; $[_$_8980[1]](jd, function (a, b) { $(_$_8980[8])[_$_8980[7]](_$_8980[6])[_$_8980[5]](_$_8980[2] + b[_$_8980[3]] + _$_8980[4])[_$_8980[1]](function () { this[_$_8980[0]]() }) });
                            }
                        });
                        tblTransferHistoryLoad($eid);
                    $('#dvTransfer').dialog('open');

                    }
                });
            });

            function tblTransferHistoryLoad(obj) {
               

                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=28ǁ" +obj ,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr>\
                                    <td rowspan="2" style="border-bottom: 1px solid #c4c4c4;">' + itm.TDT + '</td>\
                                     <td><strong>Before</strong></td>\
                                      <td>'+itm.CompanyNameA+'</td>\
                                      <td>' + itm.DeptNameA + '</td>\
                                      <td>' + itm.DesigA + '</td>\
                                      <td>' + itm.GroupA + '</td>\
                                      <td>' + itm.SalaryA + '</td>\
                                      <td> ' + itm.ShiftA + ' </td>\
                                  </tr>\
                                  <tr>\
                                    <td style="text-align:center;"><strong>After</strong></td>\
                                      <td>' + itm.CompanyNameB + '</td>\
                                      <td>' + itm.DeptNameB + '</td>\
                                      <td>' + itm.DesigB + '</td>\
                                      <td>' + itm.GroupB + '</td>\
                                      <td>' + itm.SalaryB + '</td>\
                                      <td>' + itm.ShiftB + '</td>\
                                  </tr>';
                        });
                        $('#tblTransferHistory tbody').html(opt);
                    }
                });

            }


        });//End of DocReady




        
    </script>
</asp:Content>
