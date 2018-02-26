<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="RFQVenderPrice.aspx.cs" Inherits="FRDP.RFQVenderPrice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Vendor Price Against Request for Quotation</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Select RFQ and Vendor</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <div style="width: 100%; margin-left: 20px;">
                            <strong>Select Request For Quotation </strong>:
                        <asp:DropDownList ID="ddRFQs" ClientIDMode="Static" runat="server" DataSourceID="SDRFQs" DataTextField="tblInvReqNo" DataValueField="tblInvReqMainID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SDRFQs" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblInvReqMainID, 'RFQ' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT ('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo FROM tblInvReqMain WHERE (Type = 'RFQ')  AND ApprovedRejectStatus IS NULL ORDER BY EnteryDateTime DESC"></asp:SqlDataSource>
                        </div>
                        <div style="width: 100%; margin-left: 20px;">
                            <strong>select Vendor </strong>: 
                        <asp:DropDownList ID="ddVendor" runat="server" ClientIDMode="Static"></asp:DropDownList>
                        </div>

                        <br />
                    <div id="tblContainer" style="margin-left: 20px; margin-right: 20px;"></div>

                    <br />
                    <br />
                    <br />
                    </div>
                    <%--END OF tab0--%>
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

            $('#ddRFQs').live('change', function (e) {
                e.preventDefault();
                LoadVendors();
            });
            LoadVendors();
            function LoadVendors() {

                if ($('#ddRFQs').val() == "" || $('#ddRFQs').val() == null || $('#ddRFQs').val() == undefined) {
                    $('#ddVendor').html('');
                    $('#tblContainer').html('');
                }
                else {


                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=76ǁ" + $('#ddRFQs').val(),
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<option value="' + itm.tblVenderID + '">' + itm.VenderNo + '</option>';
                            });
                            $('#ddVendor').html(opt);
                            if (opt!="") {
                             LoadPriceTable();
                            }
                            else {
                                $('#tblContainer').html('');
                            }
                        }
                    });
                }
            }//end of load vendors
            $('#ddVendor').live('change', function (e) { e.preventDefault(); LoadPriceTable(); });
            function LoadPriceTable() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=77ǁ" + $('#ddRFQs').val() + "ǁ" + $('#ddVendor').val(),
                    success: function (response) {
                        //if ($('#tblJl').hasClass('dataTable')) {
                        //    $('#tblJl').dataTable().fnDestroy();
                        //}
                        $('#tblContainer').html(response);
                        $($('#tblJl thead tr th')[0]).css('width', '50px');
                        $('#tblJl tbody tr').each(function (index, element) {
                            $($(this).find('td')[0]).html(parseInt(index) + 1);
                        });
                        
                        $('#tblJl').append('<tfoot><tr style="border-bottom: 1px solid #c4c4c4;"><th colspan="5" style="text-align:center;"><strong>Total</strong></th><th>0</th><th>0</th></tr></tfoot>');
                        GetTotals();
                //        $('#tblJl tfoot').html($('#tblJl thead').html());
                //        $('#tblJl tfoot tr').attr("style", "border-bottom: 1px solid #c4c4c4;border-right: 1px solid #c4c4c4;");
                //        $('#tblJl').addClass('dynamicTable');
                //        $('#tblJl tfoot th').each(function () {
                //            var title = $(this).text();
                //            if ($.trim(title) != "") {
                //                $(this).html('<input type="text" style="width:90%;" placeholder="' + title + '" />');
                //            }

                //        });

                //        var table = $('#tblJl').DataTable({
                //            "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
                //            "iDisplayLength": 10,
                //            "sPaginationType": "full_numbers",
                //            "bJQueryUI": false,
                //            "bAutoWidth": false,
                //            "bLengthChange": true,
                //            "fnInitComplete": function (oSettings, json) {
                //                $('.dataTables_filter>label>input').attr('id', 'search');
                //            }
                //        });
                //        table.columns().every(function () {
                //            var that = this;

                //            $('input', this.footer()).live('keyup change', function () {
                //                if (that.search() !== this.value) {
                //                    that
                //                        .search(this.value)
                //                        .draw();
                //                }
                //            });
                //        });

                //        $('#tblJl_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');


                    }
                });
            }

            $('.clup').live('focusout', function (e) {
                //alertR('');
                e.preventDefault();
                var $this = $(this);
                var id = $this.parent().parent().attr('tag');
                if ($this.val() != $this.attr('oldval')) {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=78ǁ" + $this.val() + "ǁ" + id,
                        success: function (response) {
                            if (response=="1") {
                                $($this.parent().parent().find('td')[6]).html(parseFloat($this.val()) * parseFloat($($this.parent().parent().find('td')[3]).html()));
                                GetTotals();
                            }
                        }
                    });
                }
                
            });

            function GetTotals() {

                var total = 0;
                var gtotal = 0;
                $('#tblJl tbody tr').each(function (index, element) {
                    // element == this
                    total += parseFloat($($($(this).find('td')[5]).find('.clup')[0]).val());
                    gtotal += parseFloat($($(this).find('td')[6]).html());
                });
                $($('#tblJl tfoot tr th')[1]).html(total);
                $($('#tblJl tfoot tr th')[2]).html(gtotal);
            }
        });//End of doc ready
    </script>
</asp:Content>
