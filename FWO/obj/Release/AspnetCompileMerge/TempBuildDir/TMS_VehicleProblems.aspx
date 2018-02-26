<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleProblems.aspx.cs" Inherits="FRDP.TMS_VehicleProblems" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <style type="text/css">
             select[name=tblReq_length] {
            /* width: 150px; */
            width: 62px !important;
        }

        #tblReq_length {
            margin-right: 32px;
        }

        #tblReq_filter {
            margin-left: 22px;
        }

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

        #AjaxUploadAttech_FileStatusContainer {
            right: 7% !important;
        }
    </style>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Vehicle Problems Log</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 100px;">Problem</td>
                                <td style="text-align: left; width: 40%;">

                                    <asp:DropDownList ID="ddlProblem" CssClass="frm" ClientIDMode="Static" runat="server" Width="93.5%" DataSourceID="SDProblems" DataTextField="Problem" DataValueField="Problem"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SDProblems" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT DISTINCT Problem FROM VehicleProblem ORDER BY Problem"></asp:SqlDataSource>
                                    </td>
                                <td style="width: 100px;">Date</td>
                                <td style="text-align: left;">
                                    <input id="txtDate" type="text" class="frm clr" style="width: 90%;" />
                                    <%--<select id="Type" style="  WIDTH: 93.5%;">
                <option>Company</option>
                <option>Individual</option>
            </select>--%></td>
                            </tr>
                            <tr>
                                <td>Workshop</td>
                                <td>
                                    <asp:DropDownList ID="ddlWorkshop" CssClass="frm" ClientIDMode="Static" runat="server" Width="93.5%" DataSourceID="SDWorkshop" DataTextField="Workshop_Name" DataValueField="Workshop_Id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SDWorkshop" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        Workshop_Id, Workshop_Name
FROM            Workshop
order by Workshop_Name"></asp:SqlDataSource>
                                </td>
                                <td>Vehicle</td>
                                <td>
                                    <asp:DropDownList ID="ddlVehicle" CssClass="frm" ClientIDMode="Static" runat="server" Width="93.5%" DataSourceID="SDVehicle" DataTextField="Number" DataValueField="Vehicle_id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SDVehicle" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Vehicle_id, Number FROM Vehicle ORDER BY Number"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>Driver</td>
                                <td>
                                    <asp:SqlDataSource ID="SDDriver" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        tblEmployee.EmpID, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') + ' ( ' + tblDesig.NAME + ' )' AS Emp_Name
FROM            tblEmployee INNER JOIN
                         tblDesig ON tblEmployee.tblDesigID = tblDesig.ID INNER JOIN
                         Driver ON tblEmployee.EmpID = Driver.Driver_Emp_Id
WHERE        (tblEmployee.Status = 1) 
ORDER BY Emp_Name"></asp:SqlDataSource>
                                    <asp:DropDownList ID="ddlDriver" CssClass="frm" ClientIDMode="Static" runat="server" Width="93.5%" DataSourceID="SDDriver" DataTextField="Emp_Name" DataValueField="EmpID"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Description</td>
                                <td colspan="3">
                                    <textarea id="txtDescription" class="frm clr" cols="20" rows="2" style="width: 96%;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">COST</td>
                                <td colspan="3">
                                    <table id="tblCost" class="responsive table table-striped table-bordered table-condensed" style="margin-bottom:20px; width: 97.5%; border-right: 1px solid #c4c4c4;">
                                        <thead>
                                            <tr style="border-bottom: 1px solid #c4c4c4;">
                                                <th style="width: 40px;">#</th>
                                                <th>Cost For</th>
                                                <th>Description (if any)</th>
                                                <th style="width: 100px;">Cost Amount</th>
                                                <th style="width: 40px;">
                                                    <button type="button" id="btnAddCost" class="btn btn-info">+ </button>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr class="upload" style="display:none;">
                                <td></td>
                                <td colspan="3">
                                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                                        &nbsp;<div class="tab1" style="float: left">&nbsp;Attach Documents</div>
                                        <div class="tab2">&nbsp;</div>
                                    </div>
                                    <div style="margin-bottom: 20px;">
                                        <asp:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                                    </div>
                                    <%--END OF tab0--%>

                                </td>
                            </tr>
                            <tr  class="upload" style="display:none;">
                                <td></td>
                                <td colspan="3">
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
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td style="text-align: right;">
                                    <button type="button" value="0" id="btnSave" class="frm btn btn-info">Save</button>
                                    <button type="button" value="0" id="btnCancel" class="btn" style="margin-left: 5px;">Cancel</button></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                </div>
                <%--END OF NOPAD--%>
            </div>

        </div>
    </div>

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Problem List</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<div id="dvSentJobsReq" style="margin-left:20px; margin-right:20px;margin-bottom:40px;"></div>
<br /></div>

                            </div>

                        </div>
    </div>
    <script type="text/javascript">
        function getVals(sender, args) { $.cookie("asp_act", $("#btnSave").attr('value') + "|1"); }
        function getVal(sender, args) { $.cookie("asp_act", $("#btnSave").attr('value') + "|2"); }
        function getDocs(sender, args) { Docs(); }
        function getPic(sender, args) { emp($("#EmpDisplay").attr('tg')); }
        function Docs() {
            $.ajax({
                url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + $("#btnSave").attr('value') + "ǁ" + "VehicleProblemDoc"),
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
        /////////////////////////
        $(document).ready(function () {
            $('#btnCancel').live('click',function(e){
                e.preventDefault();
                window.location.href = "TMS_VehicleInspection.aspx";
            });
            
            $('#btnRmoveRow').live('click',function(e){
                e.preventDefault();
                if ($(this).attr('tg')=="0") {
                    $(this).parent().parent().remove();
                }
            });
            $('#ddlProblem').eComboBox();
            $('#btnAddCost').live('click',function(e){
                e.preventDefault();
                var tr = '<tr class="rowtbl1" tag="0">\
                                                <td>' + ($('#tblCost tbody tr').length +1) + '</td>\
                                                <td>\
                                                    <input id="txtCostFor" type="text" class="cst" style="width:96%;"></td>\
                                                <td>\
                                                    <input id="txtCostDescription" type="text" class="cst" style="width:96%;"></td>\
                                                <td>\
                                                    <input id="txtAmount" value="0" type="text" class="cst Integer" style="width: 85px;"></td>\
                                                <td><button type="button" id="btnRmoveRow" tg="0" class="btn btn-danger"> X </button></td>\
                                            </tr>';
                $('#tblCost tbody').append(tr);
            });

            $('#txtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#ddlProblem').val() == "" || $('#ddlProblem').val() == undefined || $('#ddlProblem').val() == null || $('#ddlProblem').val() == "{NEW ELEMENT}")
                {
                    alertR("Select Vehicle Problem..!");
                    return false;
                }
                if ($('#txtDate').val()=="") {
                    alertR("Select valid Date..!");
                    return false;
                }
                var ctrlVals = "";
                $('.frm').each(function (index, element) {
                    // element == this
                    ctrlVals += $(this).val() + '½';
                });

                ctrlVals += '¼';
                ctrlVals = ctrlVals.replace(/½¼/g, "");

                ctrlVals = encodeURIComponent(ctrlVals);
                var formData = new FormData();
                var rt1 = encodeURIComponent(RowsValues('.rowtbl1', '.cst'));

                formData.append("rt1", rt1);
                formData.append("vls", ctrlVals);

                var choice = {};
                choice.url = "TMS_GH.ashx/?ID=0ǁ";
                choice.type = "POST";
                choice.data = formData;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (result) {
                    if (result!="") {
                        $('#btnSave').val(result).html('Update');
                        $('.upload').show();
                        LoadData();
                    }
                   
                };
                choice.error = function (err) {
                    alertR(err.statusText);
                };
                $.ajax(choice);

            });

            function RowsValues(clsrow, clscontrol) {
                var rt1 = "";
                $(clsrow).each(function (index, element) {
                    // element == this
                    var clsAcademic = "";
                    var x = $(this).find(clscontrol);
                    x.each(function (index, element) {
                        // element == this
                        clsAcademic += $(this).val() + "½";
                    });
                    rt1 += clsAcademic + "¼"
                });

                rt1 = rt1.replace(/½¼/g, '¼');
                return rt1;
            }

            LoadData();
            function LoadData() {
                $.ajax({
                    type: "POST",
                    url: "TMS_GH.ashx/?ID=1ǁ",
                    success: function (response) {




                        if ($('#tblReq').hasClass('dataTable')) {
                            $('#tblReq').dataTable().fnDestroy();
                        }
                        $('#dvSentJobsReq').html(response);
                        $('#tblReq thead tr').append('<th></th>');
                        $('#tblReq tbody tr').append('<td><div class="controls center"><span class="vedit icon12 icomoon-icon-pencil" title="Edit" customtooltip="Edit"></span><span class="vdelete icon12 icomoon-icon-remove" title="Delete"></span></div></td>');
                        $('#tblReq').append('<tfoot></tfoot>');
                        $('#tblReq tfoot').html($('#tblReq thead').html());
                        $('#tblReq tfoot tr').attr("style", "border-bottom: 1px solid #c4c4c4;border-right: 1px solid #c4c4c4;");
                        $('#tblReq').addClass('dynamicTable');

                        // Setup - add a text input to each footer cell
                        $('#tblReq tfoot th').each(function () {
                            var title = $(this).text();
                            if ($.trim(title) != "") {
                                $(this).html('<input type="text" placeholder="' + title + '" style="width: 90%;" />');
                            }

                        });

                        var table = $('#tblReq').DataTable({
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

                        $('#tblReq_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');

                    }


                });
            }

            $('.vdelete').live('click', function (e) {
                e.preventDefault();
                alertR("Access is Denied..!");
            });

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

            $(".trDoc").live('click', function (e) {
                document.location = "exeDataIMS.ashx/?ID=" + encodeURIComponent("114ǁ" + $(this).text() + "ǁEmp/" + $(this).attr('tag'));
            });
        });//End of doc ready
    </script>
</asp:Content>
