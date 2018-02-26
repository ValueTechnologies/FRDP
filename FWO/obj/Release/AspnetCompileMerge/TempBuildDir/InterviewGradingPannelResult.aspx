<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="InterviewGradingPannelResult.aspx.cs" Inherits="FRDP.InterviewGradingPannelResult" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Select Job to view Interview Marks</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 80px;">Select Job</td>
                                <td>
                                    <asp:DropDownList ID="ddlJobs" runat="server" Width="97%" ClientIDMode="Static" DataSourceID="sdJobsList" DataTextField="Post" DataValueField="tblJobRequirementID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sdJobsList" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        tblJobRequirementID, 'FRDP-B4-' + RIGHT('00000' + CAST(tblJobRequirementID AS VARCHAR(50)), 5) + '/' + CAST(DATEPART(YYYY, dtDateTime) AS VARCHAR(50)) + '-R' +' [ '+ Post +' ]' as Post
FROM            tblJobRequirement
ORDER BY dtDateTime DESC"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                    <div id="tblContainer" style="margin-left:20px;margin-right:20px;"></div>

                    <br />
                    <br />
                    <br />
<br />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#ddlJobs').live('change', function (e) { e.preventDefault(); LoadDoctorsList(); });
            LoadDoctorsList();
            function LoadDoctorsList() {

                if ($('#ddlJobs').val() == "" || $('#ddlJobs').val() == null || $('#ddlJobs').val() == undefined) {
                    $('#tblContainer').html('No Candidate applied for this job...!');
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: "RecruitmentGH.ashx/?ID=11ǁ" + $('#ddlJobs').val(),
                    success: function (response) {
                        if ($('#dvJobsList').hasClass('dataTable')) {
                            $('#dvJobsList').dataTable().fnDestroy();
                        }
                        $('#tblContainer').html(response);
                        //$('#tblJl thead tr').append('<th></th>');
                        //$('#tblJl tbody tr').append('<td style="width: 30px;"><button  title="Select Candidate..." class="btnEdit btn btn-info" customtooltip="Select Candidate">s</button></td>');
                        $('#tblJl').append('<tfoot></tfoot>');
                        $('#tblJl tfoot').html($('#tblJl thead').html());
                        $('#tblJl tfoot tr').attr("style", "border-bottom: 1px solid #c4c4c4;border-right: 1px solid #c4c4c4;");
                        $('#tblJl').addClass('dynamicTable');
                        $('#tblJl tfoot th').each(function () {
                            var title = $(this).text();
                            if ($.trim(title) != "") {
                                $(this).html('<input type="text" placeholder="' + title + '" style="width: 90%;" />');
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

            $('.btnEdit').live('change', function (e) {
                e.preventDefault();
                var btn = $(this);
                var cid = $(this).parent().parent().attr('tag');
                var val = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "RecruitmentGH.ashx/?ID=10ǁ" + cid + "ǁ" + val,
                    success: function (response) {
                        if (response == "1") {
                            alertG("Record Saved..!");
                        }
                    }
                });


            });
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
        });//End of Doc Ready
    </script>
</asp:Content>
