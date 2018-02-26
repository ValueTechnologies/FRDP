<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="ContractorSearch.aspx.cs" Inherits="FRDP.ContractorSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <style type="text/css">
        select[name=tblvvenders_length] {
  /* width: 150px; */
  width: 62px!important;
}
    </style>
               <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Contractor Search</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad clearfix">
<table id="tblvvenders" cellpadding="0" cellspacing="0" border="0"  width="100%">
                          <thead>
                            <tr>
                                <th>Contractor No</th>
                                <th>Category</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>CNIC/Company NTN</th>
                                <th>Mobile</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
    <tfoot>
                            <tr>
                                <th>Contractor No</th>
                                <th>Category</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>CNIC/Company NTN</th>
                                <th>Mobile</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th></th>
                            </tr>
    </tfoot>
                    </table>
</div>

                            </div>

                        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            LoadVTable();
            function LoadVTable() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=14ǁ where CategoryVenderContractor!=▓Vendor▓ ǁ order by CategoryVenderContractor, VenderNo ",
                    success: function (response) {
                        try {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<tr tg="' + itm.tblVenderID + '">\
<td>CON' + itm.VenderNo + '</td>\
                                <td>' + itm.CategoryVenderContractor + '</td>\
                                <td>' + itm.Name + '</td>\
                                <td>'+ itm.Type + '</td>\
                                <td>' + itm.CNIC_CompanyNTN + '</td>\
                                <td>'+ itm.mobileNo1 + '</td>\
                                <td>' + itm.phone1 + '</td>\
                                <td>' + itm.Email + '</td>\
                                <td><div class="controls center">\
                                                    <span class="vedit icon12 icomoon-icon-pencil" title="Edit"></span>\
                                                    <span class="vdelete icon12 icomoon-icon-remove" title="Delete"></span>\
                                                </div></td>\
                            </tr>';
                            });
                            $('#tblvvenders tbody').html(opt);
                            $('#tblvvenders').addClass('responsive dynamicTable display table table-bordered');

                            $('.dynamicTable').dataTable({
                                "aLengthMenu": [[25, 50, 100, 150, 250, 500, -1], [25, 50, 100, 150, 250, 500, "All"]],
                                "iDisplayLength": 5,
                                "sPaginationType": "full_numbers",
                                "bJQueryUI": false,
                                "bAutoWidth": false,
                                "bLengthChange": true,
                                "fnInitComplete": function (oSettings, json) {
                                    $('.dataTables_filter>label>input').attr('id', 'search');
                                }
                            });

                        } catch (e) {
                            $('#tblvvenders tbody').html('');
                        }

                    }
                });
            }
        });
    </script>
</asp:Content>
