<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="DragableRpt.aspx.cs" Inherits="FRDP.DragableRpt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        select[name=tblAnimals_length] {
            /* width: 150px; */
            width: 62px !important;
        }

        #tblAnimals thead tr th {
            vertical-align: top;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Employee Custom Report</span>
                    </h4>
                    <a id="btnMinimize1" href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <table class="responsive table table-bordered">
                        <tbody>
                            <tr>
                                <td style="text-align: center; border-right: none;"><strong>Report Columns</strong></td>
                                <td style="text-align: center; border-width: 0px;">&lt;&lt;&lt;&nbsp;&nbsp;DRAG&nbsp;&nbsp;&gt;&gt;&gt;</td>
                                <td style="text-align: center; border-width: 0px;"><strong>Report Columns</strong></td>
                            </tr>
                            <tr>
                                <td style="width: 45%;">
                                    <div id="external-events1" class="well droptrue" style="text-align: left;">

                                        <div class="external-event clm" tg="[EMP No]"></div>
                                        <div class="external-event clm" tg="[Service Type]"></div>
                                        <div class="external-event clm" tg="[Appointment At]"></div>
                                        <div class="external-event clm" tg="[User Group]"></div>
                                        <div class="external-event clm" tg="Department"></div>
                                        <div class="external-event clm" tg="Designation"></div>
                                        <div class="external-event clm" tg="BPS"></div>
                                        <div class="external-event clm" tg="Shift"></div>
                                        <div class="external-event clm" tg="[Employee Name]"></div>
                                        <div class="external-event clm" tg="[Father Name]"></div>
                                        <div class="external-event clm" tg="CNIC"></div>

                                    </div>
                                </td>
                                <td style="border-left-width: 0px;"></td>
                                <td style="border-left-width: 0px; width: 45%;">
                                    <div id="external-events2" class="well dropfalse" style="text-align: left;">


                                        <div class="external-event clm" tg="[Marital Status]"></div>
                                        <div class="external-event clm" tg="Gender"></div>
                                        <div class="external-event clm" tg="[Date of Birth]"></div>
                                        <div class="external-event clm" tg="Religion"></div>
                                        <div class="external-event clm" tg="Nationality"></div>
                                        <div class="external-event clm" tg="[Mobile No]"></div>
                                        <div class="external-event clm" tg="[Res Phone]"></div>
                                        <div class="external-event clm" tg="[Office Phone]"></div>
                                        <div class="external-event clm" tg="Email"></div>
                                        <div class="external-event clm" tg="City"></div>
                                        <div class="external-event clm" tg="Address"></div>
                                        <div class="external-event clm" tg="[Spouse Name]"></div>
                                        <div class="external-event clm" tg="[Spouse Occupation]"></div>
                                        <div class="external-event clm" tg="[Spouse CNIC]"></div>
                                        <div class="external-event clm" tg="[Spouse Phone]"></div>
                                        <div class="external-event clm" tg="[Spouse Email]"></div>
                                        <div class="external-event clm" tg="[Date Of Joining]"></div>
                                        <div class="external-event clm" tg="[Date of Appointment]"></div>

                                        

                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="text-align: right;">
                                    <button id="btnRunRpt" class="btn btn-info"><span class="icon16 icomoon-icon-info-2 white"></span>Run Report</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span id="btnprtP" class="icon16 icomoon-icon-printer-2" title="Click To Print"></span>
                        <span>Employee Custom Report Results</span>
                    </h4>
                    <a id="btnMinimize2" href="#" class="minimize">Minimize</a>
                </div>
                <div  id="PrintArea"  class="content noPad"  style="padding: 1px;">
                    <table style="width:99%;">
                                                    <tr>
                                <td style="width: 25px"></td>
                                <td>
                                    <asp:DetailsView ID="dvCompany" runat="server" AutoGenerateRows="False" BorderStyle="None" DataSourceID="dsComp" GridLines="None" Height="50px" Width="98%">
                                        <Fields>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <div>
                                                        <div id="CompID" style="float: left; text-align: center; width: 90px; height: 80px;">
                                                            <img alt='<%# Eval("InstName") %>' src="<%# Eval("Logo")%>" style="width: auto; height: auto; max-height: 100%; max-width: 100%;" />
                                                        </div>
                                                        <div style="float: left; width: 65%;margin-top: 10px;">
                                                            <b style="font-size: large;"><%# Eval("InstName") %></b>
                                                            <br />
                                                            <%# Eval("Addressline") %>
                                                            <br />
                                                            <%# Eval("Phs") %>
                                                        </div>
                                                        <br />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                </td>
                                <td style="vertical-align: top">

                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                    <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                                    Employee Custom Report</td>
                            </tr>
                    </table>
                    <div id="dvResult" class="dataTables_scroll"></div>
                    <br />
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
        $(document).ready(function () {
            $('#btnprtP').click(function () {
                $('#tblAnimals_length').hide();
                $('#tblAnimals_filter').hide();
                $('#tblAnimals_paginate').hide();
                $('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#PrintArea").printArea(options);
                $('.NoPrnt').show();
                $('#tblAnimals_length').show();
                $('#tblAnimals_filter').show();
                $('#tblAnimals_paginate').show();
            });
            $(function () {
                $('.clm').each(function (index, element) {
                    var $tg = $(this).attr('tg');
                    $tg = $tg.replace('[', '');
                    $tg = $tg.replace(']', '');
                    $(this).html($tg);
                });
            })
            $('#btnExcel').live('click', function (e) {
                e.preventDefault();
                $('#tblAnimals').tableExport({ type: 'excel', escape: 'false' });
                e.preventDefault();
            });
            $('#btnWord').live('click', function (e) {
                e.preventDefault();
                $('#tblAnimals').tableExport({ type: 'doc', escape: 'false' });
                e.preventDefault();
            });
            $('#btnPNG').live('click', function (e) {
                e.preventDefault();
                $('#tblAnimals').tableExport({ type: 'png', escape: 'false' });
                e.preventDefault();
            });
            $('#btnRunRpt').live('click', function (e) {
                e.preventDefault();
                var $clms = "";
                $('#btnMinimize1').click();
                if ($('#btnMinimize2').hasClass('maximize')) {
                    $('#btnMinimize2').click();
                }
                $('#external-events1 .clm').each(function (index, element) {
                    $clms += $(this).attr('tg') + ",";
                });
                if ($.trim($clms) != "") {
                    $clms += "½";
                    $clms = $clms.replace(',½', '');
                    //alert($clms);
                    //$.ajax({
                    //    type: "POST",
                    //    url: "DoctorManagmenetGH.ashx/?ID=71ǁ" + encodeURIComponent($clms),
                    //    success: function (response) {
                    //        var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                    //        $('#dvResult').html(response);
                    //        var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                    //        $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                    //        $('#tblAnimals').wrap('<div id="HChart" class="scroll" style="overflow-y: hidden; overflow-x:auto; margin:10px; padding-top:10px;width: 98%;"></div>');
                    //    }
                    //});



                    var fromdata = new FormData();
                    fromdata.append("ourformData", $clms);
                    var choice = {};
                    choice.url = "EmpReg.ashx/?ID=88ǁ";
                    choice.type = "POST";
                    choice.data = fromdata;
                    choice.contentType = false;
                    choice.processData = false;
                    choice.success = function (response) {
                                var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                                $('#dvResult').html(response);
                                var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                                $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                                $('#tblAnimals').wrap('<div id="HChart" class="scroll" style="overflow-y: hidden; overflow-x:auto; margin:10px; padding-top:10px;width: 98%;"></div>');

                    };
                    choice.error = function (err) {
                        alertR(err.statusText);
                    };
                    $.ajax(choice);
                }
                else {
                    alertR('Select Some Columns..!');
                }


            });

            var _$_fc76 = ["click", "#external-events2", "appendTo", "live", "#external-events1 div"]; $(_$_fc76[4])[_$_fc76[3]](_$_fc76[0], function () { $(this)[_$_fc76[2]](_$_fc76[1]) })
            var _$_9d9f = ["click", "#external-events1", "appendTo", "live", "#external-events2 div"]; $(_$_9d9f[4])[_$_9d9f[3]](_$_9d9f[0], function () { $(this)[_$_9d9f[2]](_$_9d9f[1]) })


            var _$_3bca = ["div", "sortable", "div.droptrue", "div.dropfalse", "disableSelection", "#sortable1, #sortable2, #sortable3"]; $(function () { $(_$_3bca[2])[_$_3bca[1]]({ connectWith: _$_3bca[0] }); $(_$_3bca[3])[_$_3bca[1]]({ connectWith: _$_3bca[0] }); $(_$_3bca[5])[_$_3bca[4]]() })
        });//END OF DOC READY
    </script>

</asp:Content>