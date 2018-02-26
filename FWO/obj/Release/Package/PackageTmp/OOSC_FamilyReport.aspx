<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="OOSC_FamilyReport.aspx.cs" Inherits="FRDP.OOSC_FamilyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        select[name=tblAnimals_length] {
            /* width: 150px; */
            width: 62px !important;
        }
        #tblAnimals thead tr th {
            vertical-align:top;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">
            
            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Out of School Children (OOSC) Report</span>
                    </h4>
                    <a id="btnMinimize1" href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <table class="responsive table table-bordered">
                        <tbody>
                            <tr>
                                <td style="text-align: center;"><strong>Report Columns</strong></td>
                                <td style="text-align: center; border-width: 0px;">&lt;&lt;&lt;&nbsp;&nbsp;DRAG&nbsp;&nbsp;&gt;&gt;&gt;</td>
                                <td style="text-align: center; border-width: 0px;"><strong>Report Columns</strong></td>
                            </tr>
                            <tr>
                                <td style="width:45%;">
                                    <div id="external-events1" class="well droptrue" style="text-align:left;">

                                        <div class="external-event clm" tg="Name"></div>
                                        <div class="external-event clm" tg="DOB"></div>
                                        <div class="external-event clm" tg="[CNIC BISP]"></div>
                                        <div class="external-event clm" tg="AGE"></div>
                                        <div class="external-event clm" tg="Gender"></div>
                                        <div class="external-event clm" tg="Disability"></div>
                                        <div class="external-event clm" tg="[Has the Child ever been to school?]"></div>
                                        <div class="external-event clm" tg="[When did the child leave the school?]"></div>
                                        <div class="external-event clm" tg="[Why did child leave the school?]"></div>
                                        <div class="external-event clm" tg="[What was the name of the school?]"></div>
                                        <div class="external-event clm" tg="[Class When Left the School?]"></div>
                                        <div class="external-event clm" tg="[Total Schooling Year?]"></div>
                                        <div class="external-event clm" tg="[Can Child Read Short Story?]"></div>
                                        <div class="external-event clm" tg="[Can Child Write Letter?]"></div>
                                        <div class="external-event clm" tg="[Can Child Add & Subtract?]"></div>
                                        <div class="external-event clm" tg="[Is Child Employed?]"></div>
                                        <div class="external-event clm" tg="[What does Child Work ?]"></div>

                                    </div>
                                </td>
                                <td style="border-left-width: 0px;"></td>
                                <td style="border-left-width: 0px;width:45%;">
                                    <div id="external-events2" class="well dropfalse" style="text-align: left;">


                                        <div class="external-event clm" tg="[Working Hours?]"></div>
                                        <div class="external-event clm" tg="[Father Name]"></div>
                                        <div class="external-event clm" tg="[Father CNIC]"></div>
                                        <div class="external-event clm" tg="[Father Occupation]"></div>
                                        <div class="external-event clm" tg="[Mother Name]"></div>
                                        <div class="external-event clm" tg="[Mother CNIC]"></div>
                                        <div class="external-event clm" tg="[Mother Occupation]"></div>
                                        <div class="external-event clm" tg="[Grid Code]"></div>
                                        <div class="external-event clm" tg="[Survey Date]"></div>
                                        <div class="external-event clm" tg="[Form No]"></div>
                                        <div class="external-event clm" tg="[Surveyor Name]"></div>
                                        <div class="external-event clm" tg="[Respondant Name]"></div>
                                        <div class="external-event clm" tg="[Respondent Relation]"></div>
                                        <div class="external-event clm" tg="[Family Head Name]"></div>
                                        <div class="external-event clm" tg="[Family Head Marital Status]"></div>
                                        <div class="external-event clm" tg="[Family Head Mother Toung]"></div>
                                        <div class="external-event clm" tg="[Family Head Religion]"></div>
                                        <div class="external-event clm" tg="[Monthly Income]"></div>
                                        <div class="external-event clm" tg="[Residential Status]"></div>
                                        <div class="external-event clm" tg="[UC Name]"></div>
                                        <div class="external-event clm" tg="[UC NO]"></div>
                                        <div class="external-event clm" tg="[Slum Name]"></div>
                                        <div class="external-event clm" tg="[Slum Division]"></div>
                                        <div class="external-event clm" tg="[House No]"></div>
                                        <div class="external-event clm" tg="[Street No]"></div>
                                        <div class="external-event clm" tg="[Land Mark]"></div>
                                        <div class="external-event clm" tg="[Contact Nmae 1]"></div>
                                        <div class="external-event clm" tg="[Contact Number 1]"></div>
                                        <div class="external-event clm" tg="[Contact Name 2]"></div>
                                        <div class="external-event clm" tg="[Contact Number 2]"></div>

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
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Out of School Children (OOSC) Report Results</span>
                    </h4>
                    <a id="btnMinimize2" href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <div id="dvResult" class="dataTables_scroll"></div><br /><br /><br /><br />
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
                    $.ajax({
                        type: "POST",
                        url: "ghEFS.ashx/?ID=25ǁ" + encodeURIComponent($clms),
                        success: function (response) {
                            var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                            $('#dvResult').html(response);
                            var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                            $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                            $('#tblAnimals').wrap('<div id="HChart" class="scroll" style="overflow-y: hidden; overflow-x:auto; margin:10px; padding-top:10px;width: 98%;"></div>');
                        }
                    });
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
