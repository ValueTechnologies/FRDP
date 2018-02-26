<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="PersonalRequisitionForm.aspx.cs" Inherits="FRDP.PersonalRequisitionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">
                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Personal Requisition Form</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div id="PrintArea" class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td>&nbsp;
                                </td>
                                <td>Date
                                </td>
                                <td>
                                    <input id="txtDate" class="frm clr dtDate" style="width: 90%;" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">District Support Unit</td>
                                <td style="text-align: left; width: 30%;">
                                    <select id="ddlToDSUList" class="frm" style="width: 93.5%;">
                                    </select></td>
                                <td style="width: 150px;">No</td>
                                <td style="text-align: left;">
                                    <input id="txtNo" type="text" class="frm clr" style="width: 90%;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                                        &nbsp;<div class="tab1" style="float: left">&nbsp;To The Personnel Office</div>
                                        <div class="tab2">&nbsp;</div>
                                    </div>
                                    <div style="margin-bottom: 20px;">
                                        1&nbsp;&nbsp;<textarea id="txt1" class="frm clr" style="width: 96%;" cols="20" rows="2">Following items are required in accordance with prescribed procedure and rules. A Copy of job for future action description is attached for advertisement and for future action.</textarea>
                                        <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 150px;">POSITION TITLE AND NO </td>
                                                    <td style="text-align: left; width: 30%;">
                                                        <input id="txtPTAN" class="frm clr" type="text" style="width: 90%;" /></td>
                                                    <td style="width: 150px;">CATEGORY AND GRADE</td>
                                                    <td style="text-align: left;">
                                                        <input id="txtCAG" class="frm clr" type="text" style="width: 90%;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">LOCATION / HF </td>
                                                    <td style="text-align: left;">
                                                        <input id="txtLocation" class="frm clr" type="text" style="width: 90%;" /></td>
                                                    <td style="width: 150px;">SANCTIONED/NON SANCTIONED</td>
                                                    <td style="text-align: left;">
                                                        <select id="ddlSanctioned" class="frm" style="width: 93.5%;">
                                                            <option>SANCTIONED</option>
                                                            <option>NON SANCTIONED</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <%--END OF tab0--%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                                        &nbsp;<div class="tab1" style="float: left">&nbsp;Certification:&nbsp;</div>
                                        <div class="tab2">&nbsp;</div>
                                    </div>
                                    <div style="margin-bottom: 20px;">
                                        <textarea id="txtCertification" class="frm clr" style="width: 96%;" cols="20" rows="2">I certify that the above-required position is essential for the purposes of company's business and that it is provided in the company's budget. It also certify that attached job descriptions complete in all material respected and represent a true sketch of position requirements.</textarea>
                                    </div>
                                    <%--END OF tab0--%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                                        &nbsp;<div class="tab1" style="float: left">&nbsp;Justification of Recruitment Against Sanctioned/Non-Sanctioned</div>
                                        <div class="tab2">&nbsp;</div>
                                    </div>
                                    <div style="margin-bottom: 20px;">
                                        <textarea id="txtJoRAS" class="frm clr" style="width: 96%;" cols="20" rows="2">LHV is needed in office and there is a local qualified female available for it.</textarea>
                                    </div>
                                    <%--END OF tab0--%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                                        &nbsp;<div class="tab1" style="float: left">&nbsp;Socio-Demographic Condition</div>
                                        <div class="tab2">&nbsp;</div>
                                    </div>
                                    <div style="margin-bottom: 20px;">
                                        <div>1&nbsp;&nbsp; Total Catchment Population :
                                            <input id="txtTotalPopulation" class="frm clr" type="text" /></div>
                                        <div>2&nbsp;&nbsp; OPD & MCH Report :
                                            <input id="txtOPD" class="frm clr" type="text" /></div>
                                        <div>3&nbsp;&nbsp; Distance From DSU :
                                            <input id="txtDistance" class="frm clr" type="text" /></div>
                                        <div>
                                            4&nbsp;&nbsp; Details of Contract & Regular Staff;<br />
                                            <ul>
                                                <li>
                                                    <select id="PostType" class="frm" style="width: 100px; border: none;">
                                                        <option>Regular</option>
                                                        <option>Contract</option>
                                                    </select>
                                                    <select id="ddlRegular" class="frm">
                                                        <option>Dispenser</option>
                                                        <option>disp N/O</option>
                                                        <option>chowkidar</option>
                                                    </select></li>

                                            </ul>
                                        </div>

                                    </div>
                                    <%--END OF tab0--%>
                                    <hr />
                                </td>
                            </tr>
                            <tr class="NoPrnt">
                                <td>Office Type</td>
                                <td>
                                    <select id="ddlCompanyType" style="width: 93%;">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>
                                <td>
                                    <label class="form-label span3 clsHelper" for="normal">DSU</label></td>
                                <td>
                                    <select id="ddlDSUList" class="clsHelper" style="width: 93%;">
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Location</td>
                                <td>
                                    <select id="LocationsID" style="width: 93%;"></select></td>
                                <td>To </td>
                                <td>
                                    <select id="storeInchargeEmpID" class="frm" style="width: 93%;">
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="4" id="senders">
                                    <div id="btomline" style="text-align: right;">
                                        <br />
                                        Signature:______________________<br />
                                        <br />
                                        Name : <%: Session["username"] %>
                                        <br />
                                        <br />
                                        Title:<%: Session["designation"] %>
                                        <br />
                                        <br />
                                    </div>
                                </td>
                            </tr>
                            <tr class="NoPrnt">
                                <td colspan="4">
                                    <button id="btnSave" type="button" class="btn btn-info">Send Personal Requisition</button>
                                    <button id="btnPrnt" style="display: none;" class="btn btn-info" type="button">Print Personal Requisition</button>
                                    <button id="btnCancel" class="btn btn" type="button">Cancel</button>
                                </td>
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
                        <span>Sent Personal Requisition Forms</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <br />
                    <div id="tblContainer" style="margin-left: 20px; margin-right: 20px;"></div>

                    <br />
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>


    <%--<input id="btnTest" type="button" value="button" />--%>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {
            $('#btnTest').live('click', function (e) {
                var input = "dtDate, tbl_CompanyIDDSU, No, ToThePersonalOffice, Position, Category, Location, SANCTIONED, Certification, Justification, TotalCatchment, OPD, Distance, Details, Post, LoginIDTO, LoginIDSender, LastAction".split(',');
                var str = "";
                $('.frm').each(function (index, element) {
                    if ($(this).hasClass('hasDatepicker')) {
                        str += "CASE WHEN CONVERT(VARCHAR(50)," + input[index] + ",103) = '01/01/1900' THEN '' ELSE CONVERT(VARCHAR(50)," + input[index] + ",103) END AS " + input[index] + ", ";
                    }
                    else {
                        str += input[index] + ", ";
                    }
                });
                alert(str);
            });
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
                        $('#ddlToDSUList').html(opt);


                        $('.clsHelper').hide();
                        LoadLocations();
                    }
                });
            });
            $('#ddlDSUList').live('change', function () {
                LoadLocations();
            });
            $('#ddlCompanyType').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "3") {
                    $('.clsHelper').show();
                }
                else {
                    $('.clsHelper').hide();
                }

                LoadLocations();
            });
            function storeInchargeEmpIDLoad() {
                if ($('#LocationsID').val() == "" || $('#LocationsID').val() == null || $('#LocationsID').val() == undefined) {
                    $('#storeInchargeEmpID').html('');
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=81ǁ" + $('#LocationsID').val(),
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<option value="' + itm.LoginID + '">' + itm.Emp_Name + '</option>';
                            });
                            $('#storeInchargeEmpID').html(opt);
                        }
                    });
                }

            }
            $('#LocationsID').live('change', function () {
                storeInchargeEmpIDLoad();
            });
            function LoadLocations() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType').val() + "ǁ" + $('#ddlDSUList').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#LocationsID').html(opt);
                        storeInchargeEmpIDLoad();
                    }
                });
            }
            $('.dtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#txtDate').val() == "") {
                    alertR('Select Valid Date..!');
                    return false;
                }

                if ($('#ddlToDSUList').val() == "" || $('#ddlToDSUList').val() == null || $('#ddlToDSUList').val() == undefined) {
                    alertR('Select Valid District Support Unit..!');
                    return false;
                }

                if ($('#storeInchargeEmpID').val() == "" || $('#storeInchargeEmpID').val() == null || $('#storeInchargeEmpID').val() == undefined) {
                    alertR('Select Valid Receiver ..!');
                    return false;
                }
                var val = '';
                $('.frm').each(function (index, element) {
                    val += $(this).val() + "½";
                });
                val = encodeURIComponent(val);
                var formDta = new FormData();
                formDta.append("ourformData", val);
                var choice = {};
                choice.url = "EmpReg.ashx/?ID=89ǁ";
                choice.type = "POST";
                choice.data = formDta;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (result) {
                    alertG("Record Saved..!");
                    LoadDoctorsList();
                    //$('.clr').val('');
                    $('.frm').attr('disabled', 'disabled');
                    $('#btnPrnt').show();
                    $('#btnSave').hide();
                    //$('#btnSave').html('Save').val('0');
                    //$("#chkStatus").iButton("checked");
                };
                choice.error = function (err) {
                    alertR(err.statusText);
                };
                $.ajax(choice);
            });

            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                $('#btnPrnt').hide();
                $('#btnSave').show();
                $('.frm').removeAttr('disabled');
                $('#txtDate').val('');
            });
            LoadDoctorsList();
            function LoadDoctorsList() {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=91ǁ",
                    success: function (response) {
                        if ($('#tblJl').hasClass('dataTable')) {
                            $('#tblJl').dataTable().fnDestroy();
                        }
                        $('#tblContainer').html(response);
                        $($('#tblJl thead tr th')[0]).css('width', '50px');
                        $('#tblJl tbody tr').each(function (index, element) {
                            $($(this).find('td')[0]).html(parseInt(index) + 1);
                        });
                        $('#tblJl thead tr').append('<th></th>');
                        $('#tblJl tbody tr').append('<td style="width: 50px;"><div class="controls center">\
                                                    <span class="vedit icon12 icomoon-icon-pencil" title="Edit"></span>\
                                                </div></td>');
                        $('#tblJl').append('<tfoot></tfoot>');
                        $('#tblJl tfoot').html($('#tblJl thead').html());
                        $('#tblJl tfoot tr').attr("style", "border-bottom: 1px solid #c4c4c4;border-right: 1px solid #c4c4c4;");
                        $('#tblJl').addClass('dynamicTable');
                        $('#tblJl tfoot th').each(function () {
                            var title = $(this).text();
                            if ($.trim(title) != "") {
                                $(this).html('<input type="text" style="width:90%;" placeholder="' + title + '" />');
                            }

                        });

                        var table = $('#tblJl').DataTable({
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

                        $('#tblJl_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');


                    }
                });
            }

            $('#btnExcel').live('click', function (e) {
                e.preventDefault();
                $('#tblJl').tableExport({ type: 'excel', escape: 'false' });
                e.preventDefault();
            });
            $('#btnWord').live('click', function (e) {
                e.preventDefault();
                $('#tblJl').tableExport({ type: 'doc', escape: 'false' });
                e.preventDefault();
            });
            $('#btnPNG').live('click', function (e) {
                e.preventDefault();
                $('#tblJl').tableExport({ type: 'png', escape: 'false' });
                e.preventDefault();
            });


            $('.vedit').live('click', function (e) {
                e.preventDefault();
                var $thisID = $(this).parent().parent().parent().attr('tag');
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=90ǁ" + $thisID,
                    success: function (response) {
                        var jData = $.parseJSON(response);

                        var row = jData[0];
                        var keysbyindex = Object.keys(row);

                        $('.frm').each(function (index, element) {
                            $(this).val(row[keysbyindex[index]]);
                        });

                        $('#btnPrnt').show();
                        $('#btnSave').hide();
                        $('.frm').attr('disabled', 'disabled');
                        $('#toTop').click();
                    }
                });
            });


            $('#btnPrnt').click(function () {
                $('#tblJl_length').hide();
                $('#tblJl_filter').hide();
                $('#tblJl_paginate').hide();
                $('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#PrintArea").printArea(options);
                $('.NoPrnt').show();
                $('#tblJl_length').show();
                $('#tblJl_filter').show();
                $('#tblJl_paginate').show();
            });

        });//end of doc ready
    </script>

</asp:Content>
