<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="LeaveApprove.aspx.cs" Inherits="FRDP.LeaveApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Pending Leaves Record</span>
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
        $(document).ready(function () {
            LoadDoctorsList();
            function LoadDoctorsList() {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=85ǁ",
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
                                                    <span class="vedit icon12 icomoon-icon-pencil" title="Approve Leave"></span>\
                                                    <span class="vdelete icon12 icomoon-icon-remove" title="Reject Leave"></span>\
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

            $('.vdelete').live('click', function (e) {
                e.preventDefault();
                var $thisID = $(this).parent().parent().parent().attr('tag');
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=86ǁ0ǁ" + $thisID + "ǁ" + rmx,
                    success: function (response) {
                        if (response == "1") {
                            alertG('Record Updated..!');
                            LoadDoctorsList();
                        }
                    }
                });
            });

            $('.vedit').live('click', function (e) {
                e.preventDefault();
                var $thisID = $(this).parent().parent().parent().attr('tag');
                var rmx = $($(this).parent().parent().parent().find('.frm')[0]).val();
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=86ǁ1ǁ" + $thisID + "ǁ" + rmx,
                    success: function (response) {
                        if (response=="1") {
                            alertG('Record Updated..!');
                            LoadDoctorsList();
                        }
                    }
                });
            });

        });//End of doc ready
    </script>
</asp:Content>
