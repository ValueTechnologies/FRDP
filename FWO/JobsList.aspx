<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobsList.aspx.cs" Inherits="FRDP.JobsList" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .table thead th, .table tbody td {
            text-align: left !important;
            /*padding-top: 3px;
            padding-bottom: 3px;*/
        }

        .vdetails, .vapply {
            cursor: pointer;
            cursor: hand;
        }

        select[name=tblJl_length] {
            /* width: 150px; */
            width: 62px !important;
        }

        #tblJl_length {
            margin-right: 32px;
        }

        #tblJl_filter {
            margin-left: 22px;
        }

        #AjaxUploadAttech_FileStatusContainer {
            margin-right: 100px;
        }

        #tblJl > thead > tr > th {
            text-align: center;
        }
    </style>
    <title></title>

    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="css/supr-theme/jquery.ui.supr.css" rel="stylesheet" type="text/css" />
    <link href="css/icons.css" rel="stylesheet" type="text/css" />
    <link href="plugins/tables/dataTables/jquery.dataTables.css" type="text/css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    <script type="text/javascript"  src="plugins/forms/tiny_mce/jquery.tinymce.js"></script>


    <script type="text/javascript" src="plugins/tables/dataTables/media/js/jquery.dataTables.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
       <script type="text/javascript" src="plugins/forms/maskedinput/jquery.maskedinput-1.3.js"></script>
        <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <div id="jlist" style="margin: 10px;">

            <br />
            <div id="dvJobsList"></div>
            <br />
            <br />
            <br />
        </div>
        <div id="japply" style="margin: 10px; display: none;">
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
                            <input id="txtCNIC" class="cndi clr" type="text" style="width: 90%;" /></td>
                        <td>Name</td>
                        <td>
                            <input id="txtName" class="cndi clr" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td>
                            <input id="txtDOB" class="cndi clr" type="text" style="width: 90%;" /></td>
                        <td>Gender</td>
                        <td>
                            <select id="ddlGender" class="cndi" style="width: 92.5%;">
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Religion</td>
                        <td>
                            <input id="txtReligion" class="cndi clr" type="text" style="width: 90%;" /></td>
                        <td>Father Name</td>
                        <td>
                            <input id="txtFatherName" class="cndi clr" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>
                            <input id="txtCity" type="text" class="cndi clr" style="width: 90%;" /></td>
                        <td>District</td>
                        <td>
                            <input id="txtDistrict" class="cndi clr" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Current Address</td>
                        <td>
                            <input id="txtCrntAddress" class="cndi clr" type="text" style="width: 90%;" /></td>
                        <td>Permanent Address</td>
                        <td>
                            <input id="txtPrmntAddress" class="cndi clr" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td>
                            <input id="txtPhone" class="cndi clr" type="text" style="width: 90%;" /></td>
                        <td>Mobile No</td>
                        <td>
                            <input id="txtMobile" class="cndi clr" type="text" style="width: 90%;" /></td>
                    </tr>
                    <tr>
                        <td>Domicile</td>
                        <td>
                            <input id="txtDomicile" class="cndi clr" type="text" style="width: 90%;" /></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Qualification </td>
                        <td colspan="3">
                            <textarea id="txtQualficationDtl" class="cndi clr" cols="20" rows="2" style="width: 97.5%;"></textarea>
                        </td>
                    </tr>
                     
                    <tr>
                        <td>Experience </td>
                        <td colspan="3">
                            <textarea id="txtExperienceDtl" class="cndi clr" cols="20" rows="2" style="width: 97.5%;"></textarea>
                        </td>
                    </tr>
                                        <tr>
                        <td>Job Descriptions </td>
                        <td colspan="3">
                            <textarea id="txtJobDutiesDtl" class="cndi clr" cols="20" rows="2" style="width: 97.5%;"></textarea>
                        </td>
                    </tr>
                    <tr class="cniccheck" style="display:none;">
                        <td colspan="4">
                            <br />
                            <ajaxToolkit:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                        </td>
                    </tr>
                    <tr class="cniccheck" style="display:none;">

                        <td colspan="4" style="text-align: right !important;">
                            <button id="btnSave" value="" type="button" class="btn btn-info" disabled="disabled">Submit</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

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
                            <button id="btnApplyOnline" class="btn btn-success" type="button"><span class="icon16 icomoon-icon-checkmark white"></span>Apply Online</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        function getVal(sender, args) {
            var cndiInfo = "";
            $('.cndi').each(function (index, element) {
                // element == this
                cndiInfo += $(this).val() + '½';
            });
            //alert(cndiInfo);
            $.cookie("IDforDocument", $("#btnSave").val() + "|tblJob|Requirement|" + encodeURIComponent(cndiInfo));
        }
        function getDocs(sender, args) { Docs(); }
        function Docs() {
            $('#btnSave').removeAttr('disabled');
        }
        $(document).ready(function () {

            $('#txtDOB').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });

            //$('[id^="AjaxUploadAttech"]').live('click', function (e) {
            //    //e.preventDefault();
            //    if ($('#txtName').val() == "") {
            //        alert("Enter Your Name...!");
            //        return false;
            //    }
            //});


            $('#txtCNIC').mask('99999-9999999-9');

            $('#txtCNIC').live('change', function (e) {

                
                e.preventDefault();
                if ($(this).val() == "" || $(this).val() == "_____-_______-_") {
                   
                    $('.cniccheck').hide();
                }
                else {
                    $('.cniccheck').show('slow');
                }
            });


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
                $('#btnSave').val($tag);
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
                        $('#tblJl tbody tr').append('<td><div class="controls center"><span class="vdetails icon12 icomoon-icon-zoom-in-2" title="View Details" customtooltip="Edit">&nbsp;View</span><span class="vapply icon12 icomoon-icon-newspaper" title="Apply Online">&nbsp;Apply</span></div></td>');
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

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                $('.cndi').val('');

                $('#btnClose').click();
            });

            $('#txtQualficationDtl,#txtExperienceDtl ,#txtJobDutiesDtl').tinymce({
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
        });//END OF DOC READY
    </script>
</body>
</html>
