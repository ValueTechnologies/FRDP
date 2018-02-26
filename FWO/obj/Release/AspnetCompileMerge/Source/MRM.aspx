<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="MRM.aspx.cs" Inherits="FRDP.MRM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Monthly Review Meeting</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad" style="padding-left:20px;padding-top:1px;padding-bottom:1px;">
                    <br />
                    <table style="width: 100%">
                        <tr>
                            <td>Meeting Date</td>
                            <td>
                                <input type="text" id="txtDate" class="frm clr dtDate" /></td>
                            <td>Venue</td>
                            <td>
                                <input type="text" id="txtVenue" class="frm clr" /></td>

                        </tr>
                        <tr>
                            <td>Chaired By</td>
                            <td>
                                <input type="text" id="txtChairedBy" class="frm clr" /></td>
                            <td>Agenda</td>
                            <td>
                                <input type="text" id="txtAgenda" class="frm clr" /></td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;">Members</td>
                            <td colspan="3">
                                <textarea style="width: 77.6%;" id="txtMembers" class="frm clr" cols="20" rows="2"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;">Discussion</td>
                            <td colspan="3">
                                <textarea style="width: 77.6%;" id="txtDiscussion" class="frm clr" cols="20" rows="2"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;">Responsibilities</td>
                            <td colspan="3">
                                <textarea style="width: 77.6%;" id="txtResponsibilities" class="frm clr" cols="20" rows="2"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: right; padding-right: 140px;">
                                <button type="button" value="0" class="frm btn btn-info" style="margin-right:5px;" id="btnSave">Save</button>
                                <button type="button" value="0" class="btn" id="btnCancel">Cancel</button></td>
                        </tr>
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
                                        <span>Saved Monthly Review Meetings</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<br />
                    <div id="tblContainer" style="margin-left: 20px; margin-right: 20px;"></div>

                    <br />
                    <br />
                    <br />
<br /></div>

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

            $('.dtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });
            $('#txtMembers,#txtDiscussion,#txtResponsibilities').tinymce({
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
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                $('#btnSave').val("0").html('Save');
                $('.frm').val('');
            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($.trim($('#txtDate').val()) == "") {
                    alertR('Enter valid Date of Meeting..!');
                    return false;
                }

                if ($.trim($('#txtVenue').val()) == "") {
                    alertR('Enter Venue..!');
                    return false;
                }

                if ($.trim($('#txtChairedBy').val()) == "") {
                    alertR('Enter Name of Chair person..!');
                    return false;
                }

                if ($.trim($('#txtAgenda').val()) == "") {
                    alertR('Enter Agenda of meeting..!');
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
                choice.url = "MonitoringGH.ashx/?ID=12ǁ";
                choice.type = "POST";
                choice.data = fromdata;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (response) {
                    console.log(response);
                    $("#btnSave").val(response);
                    //$('.trupload').show('slow');
                    LoadDoctorsList();
                };
                choice.error = function (err) {
                    alertR(err.statusText);
                };
                console.log(choice);
                $.ajax(choice);
            });

            LoadDoctorsList();
            function LoadDoctorsList() {
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=13ǁ",
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
                                                    <span class="vedit icon12 icomoon-icon-pencil" title="Edit"></span>\
                                                    <span class="vdelete icon12 icomoon-icon-remove" title="Delete"></span>\
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
            //------------------
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
            //---------------------
            $('.vdelete').live('click', function (e) {
                e.preventDefault();
                alertR('Access denied..!');
                return false;
                var $thisID = $(this).parent().parent().parent().attr('tag');
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=14ǁ" + $thisID,
                    success: function (response) {
                        LoadDoctorsList();
                        alertR('Record Deleted..!');
                    }
                });
            });



            $('.vedit').live('click', function (e) {
                e.preventDefault();
                var $thisID = $(this).parent().parent().parent().attr('tag');
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=15ǁ" + $thisID,
                    success: function (response) {
                        var jData = $.parseJSON(response);

                        var row = jData[0];
                        var keysbyindex = Object.keys(row);

                        $('.frm').each(function (index, element) {
                            $(this).val(row[keysbyindex[index]]);
                        });
                        $('#btnSave').html('Update');

                        $('#txtMembers').val($('<div />').html($('#txtMembers').val()).text());
                        $('#txtDiscussion').val($('<div />').html($('#txtDiscussion').val()).text())
                        $('#txtResponsibilities').val($('<div />').html($('#txtResponsibilities').val()).text())

                        $('#toTop').click();
                    }
                });
            });
        });//END OF DOC READY
    </script>
</asp:Content>
