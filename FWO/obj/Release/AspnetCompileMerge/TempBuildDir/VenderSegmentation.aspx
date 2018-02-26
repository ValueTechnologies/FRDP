<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="VenderSegmentation.aspx.cs" Inherits="FRDP.VenderSegmentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Supplier Segmentation</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <button id="btnAddL1" type="button" style="float: right; margin-right: 20px;" class="btn btn-info">Add New Supplier Segment</button>
                    <br />
                    <div class="accordion" id="accordion1" style="margin: 20px;">
                        <div class="accordion-group">
                            <div class="accordion-heading">

                                <a class="accordion-toggle collapsed" data-toggle="collapse" href="#collapseOne1">Collapsible Group Item #1</a>

                            </div>
                            <div id="collapseOne1" class="accordion-body collapse" style="height: 0px;">
                                <div class="accordion-inner">
                                    <table id="tblvvenders" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                                        <thead>
                                            <tr>
                                                <th>Vendor No</th>
                                                <th>Name</th>
                                                <th>Type</th>
                                                <th>CNIC/Company NTN</th>
                                                <th>Mobile</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>
                                                    <button type="button" class="addVender btn btn-success" tg="0">+</button></th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Vendor No</th>
                                                <th>Name</th>
                                                <th>Type</th>
                                                <th>CNIC/Company NTN</th>
                                                <th>Mobile</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>

    <div id="dvAddNewSegment" title="Register Supplier Segment" style="display: none; color: black;">
        <table style="margin-left: 50px; margin-top: 20px;">
            <tr>
                <td>Segment :
                </td>
                <td>
                    <input id="txtSegment" type="text" title=" Enter Segment Name..! " />
                </td>
            </tr>
            <tr>
                <td>Description :
                </td>
                <td>
                    <textarea id="txtDescription" title=" Description of the Segment..! " cols="20" rows="2"></textarea>
                </td>
            </tr>

            <tr>
                <td>&nbsp;
                </td>
                <td style="text-align: left">
                    <br />
                    <button id="btnSaveSegment" class="btn btn-info btn-mini" type="button">Save</button>
                    <button id="btnClose" class="btn btn-info btn-mini btnX" type="button">Cancel</button>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {

            $('#btnAddL1').bind('click', function () {
                $('#dvAddNewSegment').dialog("open");
            });
            $('#btnClose').live('click', function (e) {
                e.preventDefault();
                $('#dvAddNewSegment').dialog('close');
            });
            $(function () {
                $('#dvAddNewSegment').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 230,
                    width: 400,

                    show: {
                        effect: "clip",
                        duration: 500
                    },
                    hide: {
                        effect: "clip",
                        duration: 500
                    }
                });
            });
            $('#btnSaveSegment').live('click', function (e) {
                e.preventDefault();
                if ($('#txtSegment').val() == "") {
                    alertR('Enter Segment Name...!');
                    return false;
                }
                if ($('#txtDescription').val() == "") {
                    alertR('Enter Segment Description...!');
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: "venderGH.ashx/?ID=0ǁ" + $('#txtSegment').val() + "ǁ" + $('#txtDescription').val(),
                    //data: "name=John&location=Boston",
                    //dataType: "json",
                    success: function (response) {
                        LoadSegments();
                        //var $ag = '<div class="accordion-group">\
                        //      <div class="accordion-heading">\
                        //        <a class="accordion-toggle collapsed" data-toggle="collapse" href="#seg' + response + '" title="<div style=\'width:150px\'><span class="icon12 entypo-icon-plus-2 gray"></span>' + $('#txtDescription').val() + '</div">' + $('#txtSegment').val() + '</a>\
                        //      </div>\
                        //      <div id="seg' + response + '" class="accordion-body collapse" style="height: 0px;">\
                        //        <div class="accordion-inner">\
                        //         1111 abcaaa123 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\
                        //         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\
                        //         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\
                        //         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\
                        //         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\
                        //         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\
                        //        </div>\
                        //      </div>\
                        //    </div>'

                        //$('#accordion1').append($ag)
                    }
                });

            });

            LoadSegments();
            function LoadSegments() {
                $.ajax({
                    type: "POST",
                    url: "venderGH.ashx/?ID=1ǁ",
                    success: function (response) {
                        var jdata = $.parseJSON(response), $acord = "";
                        $.each(jdata, function (i, j) {
                            $acord += '<div class="accordion-group">\
                              <div class="accordion-heading">\
                                <a tg="' + j.tblVenderSegmentID + '" title="' + j.Description + '" ck="0" class="accordion-toggle collapsed" data-toggle="collapse" href="#seg' + j.tblVenderSegmentID + '">' + j.SegmentName + '</a>\
                              </div>\
                              <div id="seg' + j.tblVenderSegmentID + '" class="accordion-body collapse" style="height: 0px;">\
                                <div class="accordion-inner" tg="'+ j.tblVenderSegmentID + '">\
<div class="dvAdd" tg="' + j.tblVenderSegmentID + '" style="display:none;float:right;" ><select class="vlist" tg="' + j.tblVenderSegmentID + '" style="width:400px;" ></select><button type="button" class="addSupplierToList btn btn-info marginB10 marginL5" title="Add Supplier to the Segment" tg="' + j.tblVenderSegmentID + '">Add Supplier To Segment</button><button type="button" class="addClose btn btn-info marginB10 marginL5" title="Close" tg="' + j.tblVenderSegmentID + '">Close</button></div>\
                        <table id="tblvvenders" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">\
                        <thead>\
                            <tr style="border-bottom: 1px solid #c4c4c4;">\
                                <th>Vendor No</th>\
                                <th>Name</th>\
                                <th>Type</th>\
                                <th>CNIC/Company NTN</th>\
                                <th>Mobile</th>\
                                <th>Phone</th>\
                                <th>Email</th>\
                                <th style="width: 26px;"><button type="button" class="addVender btn btn-info" title="Add Supplier to the Segment" tg="' + j.tblVenderSegmentID + '">+</button></th>\
                            </tr>\
                        </thead>\
                        <tbody class="dtl" tg="' + j.tblVenderSegmentID + '"></tbody>\
                    </table>\
                                </div>\
                              </div>\
                            </div>'
                        });

                        $('#accordion1').html($acord);
                        LoadVTable();
                    }
                });

            }
            $('.addClose').live('click', function (e) { e.preventDefault(); $(this).parent().hide('slow'); });
            $('.addVender').live('click', function (e) {
                e.preventDefault();
                $('.dvAdd[tg=' + $(this).attr('tg') + ']').show('slow');
                //$(this).parent().hide();
            });


            function LoadVTable() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=14ǁ where CategoryVenderContractor=▓Vendor▓ ǁ order by CategoryVenderContractor, VenderNo ",
                    success: function (response) {
                        try {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<option value="' + itm.tblVenderID + '">VND' + itm.VenderNo + ' ' + itm.Name + '</option>';
                            });
                            $('.vlist').html(opt);
                        } catch (e) {
                            $('.vlist').html('');
                        }

                    }
                });
            }

            $('.addSupplierToList').live('click', function (e) {
                e.preventDefault();
                var $tg = $(this).attr('tg');

                $.ajax({
                    type: "POST",
                    url: "venderGH.ashx/?ID=2ǁ" + $tg + "ǁ" + $('.vlist[tg=' + $tg + ']').val(),
                    success: function (response) {
                        LoadBody($tg);
                    }
                });
            });

            function LoadBody($tg) {
                $.ajax({
                    type: "POST",
                    url: "venderGH.ashx/?ID=3ǁ" + $tg,
                    success: function (response) {
                        try {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<tr tg="' + itm.tblVenderID + '">\
                                <td>VND' + itm.VenderNo + '</td>\
                                <td>' + itm.Name + '</td>\
                                <td>'+ itm.Type + '</td>\
                                <td>' + itm.CNIC_CompanyNTN + '</td>\
                                <td>'+ itm.mobileNo1 + '</td>\
                                <td>' + itm.phone1 + '</td>\
                                <td>' + itm.Email + '</td>\
                                <td><button type="button" class="delVender btn btn-danger" title="Delete Supplier from the Segment" tv="' + itm.tblVenderID + '" tg="' + $tg + '">+</button></td>\
                            </tr>';
                            });
                            $('.dtl[tg=' + $tg + ']').html(opt);
                            $('a[tg=' + $tg + ']').attr('ck', '1');
                        } catch (e) {
                            $('.dtl[tg=' + $tg + ']').html('');
                        }

                    }
                });
            }

            $('.delVender').live('click', function (e) {
                e.preventDefault();
                var $tr = $(this); 
                $.ajax({
                    type: "POST",
                    url: "venderGH.ashx/?ID=4ǁ"+ $tr.attr('tg') +"ǁ"+ $tr.attr('tv'),
                    success: function (response) {
                        $tr.parent().parent().remove();
                    }
                });
               
            });

            $('a[ck=0]').live('click', function(e){
                e.preventDefault();
                var $tg = $(this).attr('tg');
                LoadBody($tg)
            });
        });//END OF DOC READY
    </script>
</asp:Content>
