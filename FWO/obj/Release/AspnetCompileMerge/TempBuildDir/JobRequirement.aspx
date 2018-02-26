<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="JobRequirement.aspx.cs" Inherits="FRDP.JobRequirement" %>

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
        #AjaxUploadAttech_FileStatusContainer {
            margin-right: 100px;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Job Requirements</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad tst">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 115px;">Name of Post</td>
                                <td style="text-align: left; width: 40%;">
                                    <input id="txtPName" class="frm clr" type="text" style="width: 90%;" /></td>
                                <td style="width: 100px;" hidden>Grade/BPS</td>
                                <td style="text-align: left;" hidden>
                                    <select id="ddlBPS" class="frm" style="width: 93.5%;">
                                        <option>BPS-1</option>
                                        <option>BPS-2</option>
                                        <option>BPS-3</option>
                                        <option>BPS-4</option>
                                        <option>BPS-5</option>
                                        <option>BPS-6</option>
                                        <option>BPS-7</option>
                                        <option>BPS-8</option>
                                        <option>BPS-9</option>
                                        <option>BPS-10</option>
                                        <option>BPS-11</option>
                                        <option>BPS-12</option>
                                        <option>BPS-13</option>
                                        <option>BPS-14</option>
                                        <option>BPS-15</option>
                                        <option>BPS-16</option>
                                        <option>BPS-17</option>
                                        <option>BPS-18</option>
                                        <option>BPS-19</option>
                                        <option>BPS-20</option>
                                        <option>BPS-21</option>
                                        <option>BPS-22</option>
                                        <option selected="selected">N/A</option>
                                    </select></td>
                                <td>Duty Station</td>
                                <td>
                                    <input id="txtDutyStatuion" class="frm clr" type="text" style="width: 90%;" /></td>
                            </tr>
                            <tr>
                                <td>Post/Job status</td>
                                <td>
                                    <select id="ddlPostType" class="frm" style="width: 93.5%;">
                                        <option>Regular</option>
                                        <option>Sacked</option>
                                        <option>Daily-Wager</option>
                                        <option>Contract</option>
                                        <option>Volunteer</option>
                                        <option>Deputation</option>
                                        <option>Internee</option>
                                        <option>Project Base</option>
                                        <option>N/A</option>
                                    </select></td>
                                <td>Gender
                                </td>
                                <td>
                                    <select id="ddlGender" class="frm" style="width: 93.5%;">
                                        <option>Male</option>
                                        <option>Female</option>
                                        <option>Any</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Total Positions</td>
                                <td>
                                    <input id="txtPositions" class="Integer frm clr" type="text" style="width: 90%;" /></td>
                                <td>Maximum Age</td>
                                <td>
                                    <input id="txtMaxAge" class="Integer frm clr" type="text" style="width: 90%;" /></td>

                            </tr>
                            <tr>
                                <td>Minimum Age</td>
                                <td>
                                    <input id="txtMinAge" class="Integer frm clr" type="text" style="width: 90%;" /></td>
                                
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Purpose of Hiring</td>
                                <td colspan="3">
                                    <textarea id="txtPurpose" class="frm clr" cols="20" rows="2" style="width: 97.5%;"></textarea></td>
                            </tr>

                            <tr>
                                <td style="vertical-align: top;">Qualification Required</td>
                                <td colspan="3">
                                    <textarea id="txtQualfication" class="frm clr" cols="20" rows="2" style="width: 97.5%;"></textarea></td>
                            </tr>

                            <tr>
                                <td style="vertical-align: top;">Experience Required</td>
                                <td colspan="3">
                                    <textarea id="txtExperience" class="frm clr" cols="20" rows="2" style="width: 97.5%;"></textarea></td>
                            </tr>

                            <tr>
                                <td style="vertical-align: top;">Job Duties</td>
                                <td colspan="3">
                                    <textarea id="txtJobDuties" class="abc frm clr" cols="20" rows="2" style="width: 97.5%;"></textarea></td>
                            </tr>

                            <tr class="trupload" style="display: none;">
                                <td colspan="4">
                                    <br />
                                    <asp:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: right; padding-right: 2.5%;">
                                    <br />
                                    <button id="btnSave" value="0" type="button" class="frm btn btn-info">Save</button>
                                    <button id="btnFinish" type="button" class="btn btn-info trupload" style="display: none; margin-left: 3px;">Finish</button></td>
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
                        <span>Sent Job Requirements</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div id="dvSentJobsReq" style="margin-right: 6px; margin-left: 6px;"></div>
                    <br /><br /><br />
                </div>

            </div>

        </div>
    </div>




    <script type="text/javascript">

        function getVal(sender, args) { $.cookie("IDforDocument", $("#btnSave").val() + "|tblJobRequirement"); }
        function getDocs(sender, args) { Docs(); }
        function Docs() {
            //$.ajax({
            //    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("115ǁ" + $("#EmpDisplay").attr('tg') + "ǁ" + "EE"),
            //    context: document.body,
            //    success: function (responseText) {
            //        var jdata = $.parseJSON(responseText), optOdd = "", optEven = "";
            //        $.each(jdata, function (i, item) {
            //            if (i & 1) {
            //                optOdd = optOdd + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt=""  style="width:24px;" />&nbsp;' + item.FileTitle + '</div>';
            //            }
            //            else {
            //                optEven = optEven + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt="" style="width:24px;" />&nbsp;' + item.FileTitle + '</div>';
            //            }
            //        });
            //        $('#Docs').html('<div style="width: 47%; float:left">' + optEven + '</div><div style="width: 47%; float:right">' + optOdd + '</div>');
            //    }
            //});//end ajax
        }
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {

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
            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($.trim($('#txtPName').val()) == "") {
                    alertR('Enter Name of Post..!');
                    return false;
                }

                if ($.trim($('#txtDutyStatuion').val()) == "") {
                    alertR('Enter Duty Station..!');
                    return false;
                }

                if ($.trim($('#txtPositions').val()) == "") {
                    alertR('Enter Total Positions..!');
                    return false;
                }

                if ($.trim($('#txtMinAge').val()) == "") {
                    alertR('Enter Minimum Age..!');
                    return false;
                }
                if ($.trim($('#txtMaxAge').val()) == "") {
                    alertR('Enter Maximum Age..!');
                    return false;
                }
                var vals = "";
                $('.frm').each(function (index, element) {
                    // element == this
                    vals += $(this).val() + 'ǁ';
                });
                vals += '¼';
                vals = vals.replace("ǁ¼", "");

                var fromdata = new FormData();
                fromdata.append("frmData", encodeURIComponent(vals));

                var choice = {};
                choice.url = "RecruitmentGH.ashx/?ID=0ǁ";
                choice.type = "POST";
                choice.data = fromdata;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (response) {
                    console.log(response);
                    $("#btnSave").val(response);
                    $('.trupload').show('slow');
                };
                choice.error = function (err) {
                    alertR(err.statusText);
                };
                console.log(choice);
                $.ajax(choice);
            });


            $('#btnFinish').live('click', function (e) {
                e.preventDefault();
                if ($.trim($('#txtPName').val()) == "") {
                    alertR('Enter Name of Post..!');
                    return false;
                }

                if ($.trim($('#txtDutyStatuion').val()) == "") {
                    alertR('Enter Duty Station..!');
                    return false;
                }

                if ($.trim($('#txtPositions').val()) == "") {
                    alertR('Enter Total Positions..!');
                    return false;
                }

                if ($.trim($('#txtMinAge').val()) == "") {
                    alertR('Enter Minimum Age..!');
                    return false;
                }
                if ($.trim($('#txtMaxAge').val()) == "") {
                    alertR('Enter Maximum Age..!');
                    return false;
                }
                var vals = "";
                $('.frm').each(function (index, element) {
                    // element == this
                    vals += $(this).val() + 'ǁ';
                });
                vals += '¼';
                vals = vals.replace("ǁ¼", "");

                var fromdata = new FormData();
                fromdata.append("frmData", encodeURIComponent(vals));

                var choice = {};
                choice.url = "RecruitmentGH.ashx/?ID=0ǁ";
                choice.type = "POST";
                choice.data = fromdata;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (response) {
                    console.log(response);
                    window.location.href = "JobRequirement.aspx";
                };
                choice.error = function (err) {
                    
                    alertR(err.statusText);
                };
                console.log(choice);
                $.ajax(choice);

            });

            $(function () {
                $.ajax({
                    type: "POST",
                    url: "RecruitmentGH.ashx/?ID=1ǁ",
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
            });
            $('.vedit').live('click', function (e) {
                e.preventDefault();
                var $tr = $(this).closest('tr').attr('tag');
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
                            $(this).val(row[keysbyindex[index]]);
                        });
                        $('#txtPurpose').val($('<div />').html($('#txtPurpose').val()).text());
                        $('#txtExperience').val($('<div />').html($('#txtExperience').val()).text())
                        $('#txtQualfication').val($('<div />').html($('#txtQualfication').val()).text())
                        $('#txtJobDuties').val($('<div />').html($('#txtJobDuties').val()).text())
                        $('.trupload').show('slow');
                        $('#toTop').click();
                    }
                });

            });
            $('.vdelete').live('click', function (e) { e.preventDefault(); alertR('Access Denied..!'); });
            $('#txtPurpose,#txtExperience ,#txtQualfication,#txtJobDuties').tinymce({
                // Location of TinyMCE script
                script_url: 'plugins/forms/tiny_mce/tiny_mce.js',

                // General options
                theme: "advanced",
                plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

                // Theme options
                theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect,|,bullist,numlist,outdent,indent,forecolor,backcolor,hr,|,preview,|,fullscreen",
                theme_advanced_toolbar_location: "top",
                theme_advanced_toolbar_align: "left",
                theme_advanced_statusbar_location: "bottom",
                theme_advanced_resizing: true,

                // Example content CSS (should be your site CSS)
                content_css: "css/main.css",

                // Drop lists for link/image/media/template dialogs
                template_external_list_url: "lists/template_list.js",
                external_link_list_url: "lists/link_list.js",
                external_image_list_url: "lists/image_list.js",
                media_external_list_url: "lists/media_list.js",

                // Replace values for the template plugin
                template_replace_values: {
                    username: "SuprUser",
                    staffid: "991234"
                }
            });
        });///End of doc readdy
    </script>
</asp:Content>
