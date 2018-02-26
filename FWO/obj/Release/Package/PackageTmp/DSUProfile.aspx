<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="DSUProfile.aspx.cs" Inherits="FRDP.DSUProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>DSU Profile</span>
                    </h4>
                    <a id="SearchMinimizer" href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad" style="padding: 1px;">
                    <br />

                    <br />
                    <div id="tblContainer" style="margin-left: 20px; margin-right: 20px;"></div>

                    <br />
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>

    <div id="dtl" class="row-fluid" style="display:none;">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span id="btnprtP" class="icon16 icomoon-icon-printer-2" title="Click To Print"></span>
                        <span id="DSUName"></span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div id="PrintArea" class="content noPad">
                    <br />
                                       <table style="width:99%;margin-top: 10px;">
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
                                    <span id="DsuTitle"></span></td>
                            </tr>
                    </table>
                    <hr />
                    <br />
                    <table style="width: 99%; margin-left:20px;margin-right:20px;">
                        <tr>
                            <td>Area(sq feet) 
                            </td>
                            <td>
                                <input type="text" class="Integer" id="txtArea" /></td>
                            <td>Population</td>
                            <td>
                                <input type="text" class="Integer" id="txtPopulation" />
                            </td>
                        </tr>
                        <tr>
                            <td>Distance From Head Office(Km)</td>
                            <td>
                                <input type="text" id="txtDistance" class="Integer" /></td>
                            <td>Total BHUs</td>
                            <td><input type="text" id="txtTotalBhus" class="Integer" disabled="disabled" /></td>
                        </tr>
                        <tr class="NoPrnt">
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><button id="btnSave" value="0" type="button" class="NoPrnt btn btn-info">Update Record</button></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <h3>List</h3>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding-right: 20px;">
                                <table id="tbCompanies" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-right: 10px; margin-left: 10px; border-right: 1px solid #c4c4c4;">
                                            <thead>
                                                <tr>
                                                    <td style="width:36px;">Sr#</td>
                                                    <td>Name
                                                    </td>
                                                    <td>Phone No
                                                    </td>
                                                    <td>Address
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                            </td>
                        </tr>
                    </table>

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
                    url: "MonitoringGH.ashx/?ID=8ǁ",
                    success: function (response) {
                        if ($('#tblJl').hasClass('dataTable')) {
                            $('#tblJl').dataTable().fnDestroy();
                        }
                        $('#tblContainer').html(response);
                        $($('#tblJl thead tr th')[0]).css('width', '36px');
                        $('#tblJl tbody tr').each(function (index, element) {
                            $($(this).find('td')[0]).html(parseInt(index) + 1);
                        });
                        $('#tblJl thead tr').append('<th></th>');
                        $('#tblJl tbody tr').append('<td style="width: 100px;"><div class="controls center">\
<button title="Add Prfile Details of DSU" type="button" class="vedit btn btn-info">Add Profile</button>\
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
            $('.vedit').live('click', function (e) {
                e.preventDefault();
                var tg = $(this).parent().parent().parent().attr('tag');
                var td = $(this).parent().parent().parent().find('td');
                $('#btnSave').val(tg);
                $('#DSUName').html($(td[1]).html());
                $('#DsuTitle').html($(td[1]).html());
                $('#txtArea').val($(td[2]).html());
                $('#txtPopulation').val($(td[3]).html());
                $('#txtDistance').val($(td[4]).html());
                $('#txtTotalBhus').val($(td[5]).html());
                $('#SearchMinimizer,#toTop').click();
                $('#dtl').show();
                LoadAllCompanies(tg);

                //$('#EmpDisplay').attr('tg', tg).html('');
                //EmpDisplayFunc(tg);
                //LoadPreviousData(tg);
            });


            function LoadAllCompanies(tg) {
                //alert(tg);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CompanyRegistrationBHU.aspx/AllCompaniesList",
                    data: "{'DSU':'" + tg + "'}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {

                            var srno = parseInt(i + 1);
                            out = out + '<tr><td>' + srno + '</td><td style="text-align:left;">' + item.CompanyName + ' </td> \
 <td style="text-align:left;"> ' + item.CompanyPhoneNo + '</td> \
<<td style="text-align:left;">' + item.CompanyAddress + ' </td>\
</tr>';
                        });
                        $("#tbCompanies tbody").html(out);
                        $("#tbCompanies").show();
                    }
                });
            }
            $('#btnprtP').click(function () {
                //$('#tblAnimals_length').hide();
                //$('#tblAnimals_filter').hide();
                //$('#tblAnimals_paginate').hide();
                $('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#PrintArea").printArea(options);
                $('.NoPrnt').show();
                //$('#tblAnimals_length').show();
                //$('#tblAnimals_filter').show();
                //$('#tblAnimals_paginate').show();
            });


            $('#btnSave').live('click', function (e) {
                e.preventDefault();


                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=9ǁ" + $('#txtArea').val() + "ǁ" + $('#txtPopulation').val() + "ǁ" + $('#txtDistance').val() + "ǁ" + $('#btnSave').val(),
                    success: function (response) {
                        LoadDoctorsList();
                        alertG('Record updated..!');
                    }
                });
            });
        });//END OF DOC READY
    </script>
</asp:Content>
