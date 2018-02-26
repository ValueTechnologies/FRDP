<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="LeaveApply.aspx.cs" Inherits="FRDP.LeaveApply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Leave Application</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>

                                                                                                    <tr>
                                        <td>Office Type</td>
                                        <td>
                                    <select id="ddlCompanyType"  style="width: 93%;">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>
                                        <td><label class="form-label span3 clsHelper" for="normal">DSU</label></td>
                                        <td>
                                            <select id="ddlDSUList" class="clsHelper"  style="width: 93%;">
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
                                <td style="width: 100px;">Select Leave</td>
                                <td style="text-align: left; width: 40%;">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT [Leave_Type_Id], [Leave_Type_Name] FROM [Leave_Types] ORDER BY [Leave_Type_Name]"></asp:SqlDataSource>
                                    <asp:DropDownList CssClass="frm" ID="ddlLeaveType" Style="width: 93.5%;" runat="server" ClientIDMode="Static" DataSourceID="SqlDataSource1" DataTextField="Leave_Type_Name" DataValueField="Leave_Type_Id">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 100px;"></td>
                                <td style="text-align: left;">
                                </td>
                            </tr>
                            <tr>
                                <td>From Date</td>
                                <td>
                                    <input id="txtFromDate" class="frm clr dtDate" type="text" style="width: 90%;" /></td>
                                <td>To Date</td>
                                <td>
                                    <input id="txtToDate" class="frm clr dtDate"  type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Brief Description
                                </td>
                                <td colspan="3">
                                    <textarea id="txtDescription" class="frm clr" cols="20" rows="2" style="width: 95.5%;"></textarea>
                                </td>

                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td style="text-align: right; padding-right: 28px;">
                                    <button type="button" id="btnSave" value="0"  class="frm btn btn-info">Apply & Send</button>
                                    <button type="button" id="btnCancel" class="btn marginL5">Cancel</button></td>

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
                        <span>Applied Leave Record</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div id="tblContainer" style="margin-left: 20px; margin-right: 20px;"></div>

                    <br />
                    <br />
                    <br />
                </div>
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


        //**************************************************************************************
        $(function () {
            $.ajax({
                type: "POST",
                url: "inv.ashx/?ID=47ǁ",
                success: function (response) {
                    //alert(response);
                    var jd = $.parseJSON(response), opt = '';
                    $.each(jd, function (i, itm) {
                        opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                    });
                    $('#ddlDSUList').html(opt);
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
        function storeInchargeEmpIDLoad() {
            if ($('#LocationsID').val() == "" || $('#LocationsID').val() == null || $('#LocationsID').val() == undefined) {
                $('#storeInchargeEmpID').html('');
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=18ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.Emp_Id + '">' + itm.Emp_Name + '</option>';
                        });
                        $('#storeInchargeEmpID').html(opt);
                    }
                });
            }

        }
        //******************************************************************************************************
        $('.dtDate').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });
        $(document).ready(function () {
            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#storeInchargeEmpID').val()=="" || $('#storeInchargeEmpID').val()== null || $('#storeInchargeEmpID').val()==undefined) {
                    alertR('Select Officer to Send Leave Request...!');
                    return false;
                }
                if ($('#txtFromDate').val() == "") {
                    alertR('Enter Valid From Date..!');
                    return false;
                }

                if ($('#txtToDate').val() == "") {
                    alertR('Enter Valid To Date..!');
                    return false;
                }
                if ($('#txtDescription').val() == "") {
                    alertR('Enter Valid Description..!');
                    return false;
                }



                var val = '';
                $('.frm').each(function (index, element) {
                    val += $(this).val() + "ǁ";
                });
                
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=83ǁ" + val,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';

                        if (response=="1") {
                            alertG("Record Saved..!");
                            LoadDoctorsList();
                            
                            $('##txtFromDate').val('');
                            $('##txtToDate').val('');
                            $('##txtDescription').val('');
                        }
                        //$.each(jd, function (i, itm) {
                        //    opt += '';
                        //});
                        //$('#faqs').html(opt);
                    }
                });
            });
            LoadDoctorsList();
            function LoadDoctorsList() {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=84ǁ",
                    success: function (response) {
                        if ($('#tblJl').hasClass('dataTable')) {
                            $('#tblJl').dataTable().fnDestroy();
                        }
                        $('#tblContainer').html(response);
                        $($('#tblJl thead tr th')[0]).css('width', '50px');
                        $('#tblJl tbody tr').each(function (index, element) {
                            $($(this).find('td')[0]).html(parseInt(index) + 1);
                        });
                        //$('#tblJl thead tr').append('<th></th>');
                        //$('#tblJl tbody tr').append('<td style="width: 50px;"><div class="controls center">\
                        //                            <span class="vedit icon12 icomoon-icon-pencil" title="Edit"></span>\
                        //                            <span class="vdelete icon12 icomoon-icon-remove" title="Delete"></span>\
                        //                        </div></td>');
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


        });//END OF DOC READY
    </script>
</asp:Content>
