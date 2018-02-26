<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="SlumReport.aspx.cs" Inherits="FRDP.SlumReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style type="text/css">
        #tblAnimals > tbody > tr > td {
            text-align: left !important;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>20 UCs Maps Status Sheet</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table id="tblAnimals" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th style="width: 30px;">Sr#</th>
                                <th>UC's Name</th>
                                <th style="width: 70px;">UC's ID</th>
                                <th style="width: 170px;">Town</th>
                                <th style="width: 70px;">Total Slums</th>
                                <th style="width: 300px;">Slum Names</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
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
            LoadGrid();
            function LoadGrid() {
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=19ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr>\
                                <td style="width: 30px;">'+ (parseInt(i) + 1).toString() + '</td>\
                                <td>' + itm.UC + '</td>\
                                <td>' + itm.UCCode + '</td>\
<td>' + itm.Town + '</td>\
<td>' + itm.TSlum + '</td>\
<td class="sl" tg="' + itm.UnionConcilID + '"><ul>' + itm.xxx + '</ul></td>\
                                </tr>';
                        });
                        var _$_93d2 = ["dataTable", "hasClass", "#tblAnimals", "fnDestroy"]; if ($(_$_93d2[2])[_$_93d2[1]](_$_93d2[0])) { $(_$_93d2[2])[_$_93d2[0]]()[_$_93d2[3]]() };
                        $('#tblAnimals tbody').html(opt);
                        var _$_a949 = ["All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "dataTable", "#tblAnimals"]; $(_$_a949[7])[_$_a949[6]]({ "aLengthMenu": [[5, 10, 25, 50, 100, 150, 250, 500, -1], [5, 10, 25, 50, 100, 150, 250, 500, _$_a949[0]]], "iDisplayLength": 5, "sPaginationType": _$_a949[1], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (b, a) { $(_$_a949[5])[_$_a949[4]](_$_a949[2], _$_a949[3]) } });
                        $('#tblAnimals_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');
                       // LoadSlumNames();
                    }
                });
            }

            function LoadSlumNames() {
                $('.sl').each(function (i, j) {
                    var td = $(this);
                    WriteSlums(td);
                });
            }
            function WriteSlums(obj) {
                $.ajax({
                    type: "POST",
                    url: "ghEFS.ashx/?ID=20ǁ" + obj.attr('tg'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<li>' + itm.strSlumName+'</li>';
                        });
                        $('.sl[tg=' + obj.attr('tg') + ']').html('<ul>' + opt + '</ul>');
                    }
                });
            }


        });//END OF DOC READY

    </script>
</asp:Content>
