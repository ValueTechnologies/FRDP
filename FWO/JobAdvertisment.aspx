<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="JobAdvertisment.aspx.cs" Inherits="FRDP.JobAdvertisment" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Current Advertised Jobs On Web Site</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad" style="padding:1px;">
                                    <div id="jlist" style="margin: 10px;">
                                     <br />
            <div id="dvJobsList"></div>
            <br />
            <br />
            <br />
                </div>                         <%--   <div id="japply" style="margin: 10px; display: none;">
            <br />
            <table class="responsive table table-bordered">
                <tbody>
                    <tr style="border-top: 1px solid #c4c4c4;">
                        <td colspan="4" style="text-align: right !important;">
                            <button id="btnClose" class="btn btn-danger" type="button"><span class="icon16 icomoon-icon-cancel-2 white"></span>Jobs List</button>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">Case No</td>
                        <td style="text-align: left; width: 40%;">
                            <input id="txtCaseNo" type="text" disabled="disabled" readonly="readonly" style="width: 90%;" /></td>
                        <td style="width: 100px;">Post</td>
                        <td style="text-align: left;">
                            <input id="txtPost" type="text" disabled="disabled" readonly="readonly" style="width: 90%;" />
                        </td>
                    </tr>

                    <tr>
                        <td>CNIC</td>
                        <td>
                            <input id="txtCNIC" type="text" style="width: 90%;" /></td>
                        <td>Name</td>
                        <td>
                            <input id="txtName" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td>
                            <input id="txtDOB" type="text" style="width: 90%;" /></td>
                        <td>Gender</td>
                        <td>
                            <select id="ddlGender" style="width: 92.5%;">
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Religion</td>
                        <td>
                            <input id="txtReligion" type="text" style="width: 90%;" /></td>
                        <td>Father Name</td>
                        <td>
                            <input id="txtFatherName" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>
                            <input id="txtCity" type="text" style="width: 90%;" /></td>
                        <td>District</td>
                        <td>
                            <input id="txtDistrict" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Current Address</td>
                        <td>
                            <input id="txtCrntAddress" type="text" style="width: 90%;" /></td>
                        <td>Permanent Address</td>
                        <td>
                            <input id="txtPrmntAddress" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td>
                            <input id="txtPhone" class="Integer" type="text" style="width: 90%;" /></td>
                        <td>Mobile No</td>
                        <td>
                            <input id="txtMobile" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Domicile</td>
                        <td>
                            <input id="txtDomicile" type="text" style="width: 90%;" /></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <br />
                            <asp:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                        </td>
                    </tr>
                    <tr>

                        <td colspan="4" style="text-align: right !important;">
                            <button id="btnSave" type="button" class="btn btn-info" disabled="disabled">Submit</button></td>
                    </tr>
                </tbody>
            </table>
        </div>--%>

        <div id="jdtl" style="margin: 10px; display: none;">
            <table class="responsive table table-striped table-bordered table-condensed">
                <tbody>
                    <tr style="border-top: 1px solid #c4c4c4;">
                        <td colspan="4" style="text-align: right !important;">
                            <button id="btnClosedtl" class="btn btn-danger" type="button"><span class="icon16 icomoon-icon-cancel-2 white"></span>Jobs List</button></td>
                    </tr>
                    <tr>
                        <td style="width: 115px;">Name of Post</td>
                        <td class="frm" style="width: 40%;"></td>
                        <td style="width: 115px;">Grade/BPS</td>
                        <td class="frm" style="width: 40%;"></td>
                    </tr>
                    <tr>
                        <td>Post/Job status</td>
                        <td class="frm"></td>
                        <td>Duty Station</td>
                        <td class="frm"></td>
                    </tr>
                    <tr>
                        <td>Total Positions</td>
                        <td class="frm"></td>
                        <td>Gender</td>
                        <td class="frm"></td>
                    </tr>
                    <tr>
                        <td>Minimum Age</td>
                        <td class="frm"></td>
                        <td>Maximum Age</td>
                        <td class="frm"></td>
                    </tr>
                    <tr>
                        <td>Purpose of Hiring</td>
                        <td id="txtPurpose" colspan="3" class="frm"></td>
                    </tr>
                    <tr>
                        <td>Qualification Required</td>
                        <td id="txtQualfication" colspan="3" class="frm"></td>
                    </tr>
                    <tr>
                        <td>Experience Required</td>
                        <td id="txtExperience" colspan="3" class="frm"></td>
                    </tr>
                    <tr>
                        <td>Job Duties</td>
                        <td id="txtJobDuties" colspan="3" class="frm"></td>
                    </tr>
                    <tr style="border-top: 1px solid #c4c4c4;">
                        <td colspan="4" style="text-align: right !important;">
                            <span id="spID" sid="0" case="0" post="0" class="frm" style="display: none;"></span>
                            <button style="display:none;" id="btnApplyOnline" class="btn btn-success" type="button"><span class="icon16 icomoon-icon-checkmark white"></span>Apply Online</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
                                </div>

                            </div>

                        </div>
    </div>

        <script type="text/javascript">
            function getVal(sender, args) { $.cookie("IDforDocument", $("#btnSave").val() + "|tblJobRequirement"); }
            function getDocs(sender, args) { Docs(); }
            function Docs() {
                $('#btnSave').removeAttr('disabled');
            }
            $(document).ready(function () {


                $('#txtCNIC').mask('99999-9999999-9');

                $('.vdetails').live('click', function (e) {
                    e.preventDefault();
                    var $tr = $(this).closest('tr').attr('tag');
                    var $tds = $(this).closest('tr').find('td');
                    $('#spID').attr('sid', $tr);
                    $('#spID').attr('case', $($tds[0]).text());
                    $('#spID').attr('post', $($tds[1]).text());
                    //alertG($tr);
                    $.ajax({
                        type: "POST",
                        url: "RecruitmentGH.ashx/?ID=2ǁ" + $tr,
                        success: function (response) {
                            var jData = $.parseJSON(response);

                            var row = jData[0];
                            var keysbyindex = Object.keys(row);
                            //console.log(row[keysbyindex[3]]);
                            $('.frm').each(function (index, element) {
                                $(this).html(row[keysbyindex[index]]);
                            });
                            $('#txtPurpose').html($('<div />').html($('#txtPurpose').html()).text());
                            $('#txtExperience').html($('<div />').html($('#txtExperience').html()).text())
                            $('#txtQualfication').html($('<div />').html($('#txtQualfication').html()).text())
                            $('#txtJobDuties').html($('<div />').html($('#txtJobDuties').html()).text())
                            $('#jlist').hide('slow');
                            $('#jdtl').show('slow');
                        }
                    });

                });

                $('#btnApplyOnline').live('click', function (e) {
                    e.preventDefault();

                    $('#txtCaseNo').val($('#spID').attr('case')).attr('tag', $('#spID').attr('sid'));
                    $('#txtPost').val($('#spID').attr('post'));

                    $('#jdtl').hide('slow');
                    $('#japply').show('slow');

                });
                $('.vapply').live('click', function (e) {
                    e.preventDefault();
                    var $tr = $(this).parent().parent().parent();
                    var $tag = $tr.attr('tag');
                    var $tds = $tr.find('td');
                    $('#txtCaseNo').val($($tds[0]).html()).attr('tag', $tag);
                    $('#txtPost').val($("<div/>").html($($tds[1]).html()).text());
                    $('#jlist').hide('slow');
                    $('#japply').show('slow');
                });
                $('#btnClose').live('click', function (e) {
                    e.preventDefault();
                    $('#japply').hide('slow');
                    $('#jlist').show('slow');
                });
                $('#btnClosedtl').live('click', function (e) {
                    e.preventDefault();
                    $('#jdtl').hide('slow');
                    $('#jlist').show('slow');
                });

                $(function () {
                    $.ajax({
                        type: "POST",
                        url: "RecruitmentGH.ashx/?ID=5ǁ",
                        success: function (response) {
                            $('#dvJobsList').html(response);
                            $('#tblJl thead tr').append('<th></th>');
                            $('#tblJl tbody tr').append('<td><div class="controls center"><span class="vdetails icon12 icomoon-icon-zoom-in-2" title="View Details" customtooltip="Edit">&nbsp;View</span><span style="display:none;" class="vapply icon12 icomoon-icon-newspaper" title="Apply Online">&nbsp;Apply</span></div></td>');
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
                });
            });
    </script>

</asp:Content>
