<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="VenderRegistration.aspx.cs" Inherits="FRDP.VenderRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" src="plugins/forms/maskedinput/jquery.maskedinput-1.3.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Vender Registration</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h5>Vender Information</h5>
                    </div>
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 100px;">Vender No</td>
                                <td style="text-align: left; width: 40%;">
                                    <input id="VenderNo" type="text" style="width: 90%;" readonly="readonly" /></td>
                                <td style="width: 100px;">Type</td>
                                <td style="text-align: left;">
                                    <select id="Type" style="width: 93.5%;" class="vnd">
                                        <option>Company</option>
                                        <option>Individual</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td>
                                    <input id="Name" type="text" style="width: 90%;" class="vnd" /></td>
                                <td>
                                    <label id="CNICORCompanyNTN">Company NTN</label></td>
                                <td>
                                    <input id="CNIC_CompanyNTN" type="text" style="width: 90%;" class="vnd" /></td>
                            </tr>

                            <tr>
                                <td>Cell No*</td>
                                <td>
                                    <input id="mobileNo1" type="text" style="width: 90%;" class="vnd" /></td>
                                <td>Cell No</td>
                                <td>
                                    <input id="mobileNo2" type="text" style="width: 90%;" class="vnd" /></td>
                            </tr>

                            <tr>
                                <td>Phone No*</td>
                                <td>
                                    <input id="Phone1" type="text" style="width: 90%;" class="vnd" /></td>
                                <td>Phone No</td>
                                <td>
                                    <input id="phone2" type="text" style="width: 90%;" class="vnd" /></td>
                            </tr>

                            <tr>
                                <td>Fax</td>
                                <td>
                                    <input id="Fax" type="text" style="width: 90%;" class="vnd" /></td>
                                <td>Email</td>
                                <td>
                                    <input id="Email" type="text" style="width: 90%;" class="vnd" />
                                </td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <textarea id="Address" cols="20" rows="2" style="width: 90%;" class="vnd"></textarea></td>
                                <td>Contract Copy</td>
                                <td>
                                    <input id="FileContractCopy" type="file" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button id="SaveVender" class="btn btn-info">Save</button></td>
                            </tr>
                        </tbody>
                    </table>
                          <table id="tblvvenders" class="responsive table table-striped table-bordered table-condensed" style="  width: 96%;  margin-left: 20px;  margin-right: 20px;  border-right: 1px solid #c4c4c4;">
                        <thead>
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
                        </thead>
                        <tbody></tbody>
                    </table>
                    <div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h5>Contact Person Information</h5>
                    </div>

                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td>Select Vender</td>
                                <td colspan="3">
                                    <select id="ddlVender" style="width: 97%;" class="vc">
                                        <option></option>

                                    </select></td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">Name</td>
                                <td style="text-align: left; width: 40%;">
                                    <input id="ContactPersonName" type="text" style="width: 90%;"  class="vc clr" /></td>
                                <td style="width: 100px;"><%--C.N.I.C--%></td>
                                <td>
                                    <input id="ContactPersonCNIC" type="text" style="width: 90%;display:none;"  class="vc clr" /></td>
                            </tr>
                            <tr>
                                <td>Mobile*</td>
                                <td>
                                    <input id="ContactPersonmobileNo1" type="text" style="width: 90%;"  class="vc clr" /></td>
                                <td>Moible</td>
                                <td>
                                    <input id="ContactPersonmobileNo2" type="text" style="width: 90%;"  class="vc clr" /></td>
                            </tr>
                            <tr>
                                <td>Phone*</td>
                                <td>
                                    <input id="ContactPersonPhone1" type="text" style="width: 90%;"  class="vc clr" /></td>
                                <td>Phone</td>
                                <td>
                                    <input id="ContactPersonPhone2" type="text" style="width: 90%;"  class="vc clr" /></td>
                            </tr>

                            <tr>
                                <td>Email*</td>
                                <td>
                                    <input id="ContactPersonemail" type="text" style="width: 90%;"  class="vc clr" /></td>
                                <td>Address</td>
                                <td>
                                    <textarea id="ContactPersonAddress" cols="20" rows="2" style="width: 90%;"  class="vc clr"></textarea></td>
                            </tr>

                            <tr>
                                <td>Remarks</td>
                                <td>
                                    <textarea id="ContactRemarks" cols="20" rows="2" style="width: 90%;"  class="vc clr"></textarea>
                                </td>
                                <td><%--CNIC Copy--%></td>
                                <td>
                                    <input id="File1" type="file" / style="display:none;"></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button id="SaveVenderContactPerson" class="btn btn-info">Save</button></td>
                            </tr>

                        </tbody>
                    </table>
                    <br />
                            <table id="tblvvendersContractPerson" class="responsive table table-striped table-bordered table-condensed" style="  width: 96%;  margin-left: 20px;  margin-right: 20px;  border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th style="display:none;">CNIC</th>
                                <th>Mobile</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <br />
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript">
        $('input').live('keypress', function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {
           // alert(encodeURIComponent("'"));
            LoadVTable();
            function LoadVTable() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=14ǁ where CategoryVenderContractor=▓Vendor▓ ǁ order by CategoryVenderContractor, VenderNo ",
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
                                <td><div class="controls center">\
                                                    <span class="vedit icon12 icomoon-icon-pencil" title="Edit"></span>\
                                                    <span class="vdelete icon12 icomoon-icon-remove" title="Delete"></span>\
                                                </div></td>\
                            </tr>';
                            });
                            $('#tblvvenders tbody').html(opt);
                        } catch (e) {
                            $('#tblvvenders tbody').html('');
                        }
                        
                    }
                });
            }
            
            function LoadVCPTable() {
                if ($('#ddlVender').val() != null) {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=15ǁ where tbltblVenderID=" + $('#ddlVender').val() + "ǁ Order by ContactPersonName",
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt += '<tr tg="'+itm.tblVender_ContactPerson+'">\
                                <td>'+itm.ContactPersonName+'</td>\
                                <td style="display:none;">'+itm.ContactPersonCNIC+'</td>\
                                <td>'+itm.ContactPersonmobileNo1+'</td>\
                                <td>'+itm.ContactPersonPhone1+'</td>\
                                <td>' + itm.ContactPersonemail + '</td>\
                                    <td><div class="controls center">\
                                                    <span class="vedit icon12 icomoon-icon-pencil" title="Edit"></span>\
                                                    <span class="vdelete icon12 icomoon-icon-remove" title="Delete"></span>\
                                                </div></td>\
                            </tr>';
                            });
                            $('#tblvvendersContractPerson tbody').html(opt);
                        }
                    });
                }
                else {
                    $('#tblvvendersContractPerson tbody').html('');
                }
            }
            $('#ddlVender').live('change', LoadVCPTable);
            $('#Type').live('change', function () {
                if ($(this).val() != 'Company') {
                    $('#CNICORCompanyNTN').html('C.N.I.C');
                }
                else {
                    $('#CNICORCompanyNTN').html('Company NTN');
                }
            });

             
               $('#SaveVenderContactPerson').live('click', function (e) {
                   e.preventDefault();
                   var v = '2½';
                   $('.vc').each(function (index, element) {
                       v += $(this).val() +'½';
                   });
                   var uploadfiles = $("#File1").get(0);
                   var uploadedfiles = uploadfiles.files;
                   var fromdata = new FormData();
                   fromdata.append("vls", v);
                   for (var i = 0; i < uploadedfiles.length; i++) {
                       fromdata.append(uploadedfiles[i].name, uploadedfiles[i]);
                   }

                   var choice = {};
                   choice.url = "VenderReg.ashx";
                   choice.type = "POST";
                   choice.data = fromdata;
                   choice.contentType = false;
                   choice.processData = false;
                   choice.success = function (result) {
                       alertG(result);
                       LoadVCPTable();

                       $('.clr').each(function (index, element) {
                           $(this).val('');
                       });
                   
                       if ($.browser.msie) {
                           $('#File1').replaceWith($('#File1').clone());
                       }
                       else {
                           $('#File1').val('');
                       }
                       $('.filename').html('');
                       

                   };
                   choice.error = function (err) {
                       alertR(err.statusText);
                   };
                   $.ajax(choice);
                   event.preventDefault();
               });//End of save vender
            $('#SaveVender').live('click', function (e) {
                e.preventDefault();
                var v = '1½';
                $('.vnd').each(function (index, element) {
                    v += $(this).val() +'½';
                });
                var uploadfiles = $("#FileContractCopy").get(0);
                var uploadedfiles = uploadfiles.files;
                var fromdata = new FormData();
                fromdata.append("vls", v);
                for (var i = 0; i < uploadedfiles.length; i++) {
                    fromdata.append(uploadedfiles[i].name, uploadedfiles[i]);
                }

                var choice = {};
                choice.url = "VenderReg.ashx";
                choice.type = "POST";
                choice.data = fromdata;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (result) {
                    LoadVTable();
                    alertG(result);
                    GetNextVenderNo();
                    $('.vnd').each(function (index, element) {
                        $(this).val('');
                    });
                   
                    if ($.browser.msie) {
                        $('#FileContractCopy').replaceWith($('#FileContractCopy').clone());
                    }
                    else {
                        $('#FileContractCopy').val('');
                    }
                    $('.filename').html('');
                };
                choice.error = function (err) {
                    alertR(err.statusText);
                };
                $.ajax(choice);
                event.preventDefault();
            });//End of save vender
            GetNextVenderNo();
            function GetNextVenderNo()
            {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=11ǁVendor",
                    success: function (response) {
                        var zeros = '0000000000000000000000000000000000000000000000000000' + response;
                        var vno = 'VND' + zeros.substr(zeros.length - 5);
                        $('#VenderNo').val(vno);
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=12ǁVNDǁVendor",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.tblVenderID + '">'+itm.Name+'</option>';
                        });
                        $('#ddlVender').html(opt);
                        LoadVCPTable();
                    }
                });

            }
        });///END OF READY FUNCTION
    </script>

    <%--****************************************************--%>
</asp:Content>
