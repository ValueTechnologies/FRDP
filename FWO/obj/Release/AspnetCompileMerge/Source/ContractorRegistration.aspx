<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="ContractorRegistration.aspx.cs" Inherits="FRDP.ContractorRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">
                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Contractor Registration</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h5>Contractor Information</h5>
                    </div>
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
                        <tbody>
                            <tr>
                                <td>Catetory</td>
                                <td>
                                    <select id="ddlContractorCategory" style="width: 93.5%;">
                                    </select></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">Contractor No</td>
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
                                    <button type="button" id="SaveVender" class="btn btn-info">Save</button></td>
                            </tr>
                        </tbody>
                    </table>

             <table id="tblvvenders" class="responsive table table-striped table-bordered table-condensed" style="  width: 96%;  margin-left: 20px;  margin-right: 20px;  border-right: 1px solid #c4c4c4;">
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
                    </table>
                    <div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h5>Contact Person Information</h5>
                    </div>

                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>

                            <tr>
                                <td>Select Category</td>
                                <td colspan="3">
                                    <select id="ddlConCategory" style="width: 97%;" >
                                        <option></option>

                                    </select></td>
                            </tr>
                            <tr>
                                <td>Contractor</td>
                                <td colspan="3">
                                    <select id="ddlVender" style="width: 97%;" class="vc">
                                        <option></option>

                                    </select></td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">Name</td>
                                <td style="text-align: left; width: 40%;">
                                    <input id="ContactPersonName" type="text" style="width: 90%;" class="vc clr" /></td>
                                <td style="width: 100px; display:none;">C.N.I.C</td>
                                <td>
                                    <input id="ContactPersonCNIC" type="text" style="width: 90%; display:none;" class="vc clr" /></td>
                            </tr>
                            <tr>
                                <td>Mobile*</td>
                                <td>
                                    <input id="ContactPersonmobileNo1" type="text" style="width: 90%;" class="vc clr" /></td>
                                <td>Moible</td>
                                <td>
                                    <input id="ContactPersonmobileNo2" type="text" style="width: 90%;" class="vc clr" /></td>
                            </tr>
                            <tr>
                                <td>Phone*</td>
                                <td>
                                    <input id="ContactPersonPhone1" type="text" style="width: 90%;" class="vc clr" /></td>
                                <td>Phone</td>
                                <td>
                                    <input id="ContactPersonPhone2" type="text" style="width: 90%;" class="vc clr" /></td>
                            </tr>

                            <tr>
                                <td>Email*</td>
                                <td>
                                    <input id="ContactPersonemail" type="text" style="width: 90%;" class="vc clr" /></td>
                                <td>Address</td>
                                <td>
                                    <textarea id="ContactPersonAddress" cols="20" rows="2" style="width: 90%;" class="vc clr"></textarea></td>
                            </tr>

                            <tr>
                                <td>Remarks</td>
                                <td>
                                    <textarea id="ContactRemarks" cols="20" rows="2" style="width: 90%;" class="vc clr"></textarea>
                                </td>
                                <td style="display:none;">CNIC Copy</td>
                                <td>
                                    <input id="File1" type="file"  style="display:none;" /></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" id="SaveVenderContactPerson" class="btn btn-info">Save</button></td>
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
                                <th style="width: 60px;"></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <br />
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
                                } catch (e) {
                                    $('#tblvvenders tbody').html('');
                                }
                                loadType();
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
                                        opt += '<tr tg="' + itm.tblVender_ContactPerson + '">\
                                <td>'+ itm.ContactPersonName + '</td>\
                                <td style="display:none;">' + itm.ContactPersonCNIC + '</td>\
                                <td>'+ itm.ContactPersonmobileNo1 + '</td>\
                                <td>'+ itm.ContactPersonPhone1 + '</td>\
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





                    /////////////////////////////////////////////

                    $('#SaveVenderContactPerson').live('click', function (e) {
                        e.preventDefault();
                        var v = '2½';
                        $('.vc').each(function (index, element) {
                            v += $(this).val() + '½';
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
                            alertG(result);
                            LoadVTable();
                            LoadVCPTable();
                           
                            
                        };
                        choice.error = function (err) {
                            alertR(err.statusText);
                        };
                        $.ajax(choice);
                        event.preventDefault();
                    });//End of save vender

                    function loadType() {
                        $.ajax({
                            type: "POST",
                            url: "inv.ashx/?ID=13ǁ",
                            success: function (response) {

                                try {

                                    var jd = $.parseJSON(response), opt = '';
                                    $.each(jd, function (i, itm) {
                                        opt += '<option>' + itm.CategoryVenderContractor + '</option>';
                                    });
                                    // $('#ddlContractorCategory').html(opt);
                                    $('#ddlConCategory').html(opt);
                                    loadContractersofthis();
                                    // $('#ddlContractorCategory').eComboBox({ 'allowNewElements': true, 'editableElements': false });
                                } catch (e) {
                                    // $('#ddlContractorCategory').eComboBox({ 'allowNewElements': true, 'editableElements': false });
                                }


                            }
                        });
                    }

                    function loadContractersofthis() {
                        var vend = $('#ddlConCategory').val();
                        if (vend != '' || vend != null) {
                            //alert('called'+ vend);

                            $.ajax({
                                type: "POST",
                                url: "inv.ashx/?ID=12ǁCONǁ" + vend,
                                success: function (response) {
                                    var jd = $.parseJSON(response), opt = '';
                                    $.each(jd, function (i, itm) {
                                        opt += '<option value="' + itm.tblVenderID + '">' + itm.Name + '</option>';
                                    });
                                    $('#ddlVender').html(opt);
                                    LoadVCPTable();
                                }
                            });
                        }
                    }
                    $('#SaveVender').live('click', function (e) {
                        if ($('#ddlContractorCategory').val() == '{NEW ELEMENT}' || $('#ddlContractorCategory').val() == null || $('#ddlContractorCategory').val() == 'Vendor') {
                            alertR('Select valid Category');
                            return false;
                        }
                        e.preventDefault();
                        var v = '3½' + $('#ddlContractorCategory').val() + '½';
                        $('.vnd').each(function (index, element) {
                            v += $(this).val() + '½';
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
                            alertG(result);
                            GetNextVenderNo();

                            LoadVTable();
                            loadContractersofthis();

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


                    $('#ddlContractorCategory').live('change', function () {



                        var valueofdll = $(this).val();
                        if (valueofdll == '{NEW ELEMENT}' || valueofdll == null || valueofdll == '') {

                            $('#VenderNo').val('');

                        }
                        else {
                            $.ajax({
                                type: "POST",
                                url: "inv.ashx/?ID=11ǁ" + valueofdll,
                                success: function (response) {
                                    if (response == '<p>Contents not available</p>') {
                                        var zeros = '0000000000000000000000000000000000000000000000000000' + 1;
                                        var vno = 'CON' + zeros.substr(zeros.length - 5);
                                        $('#VenderNo').val(vno);
                                    }
                                    else {
                                        var zeros = '0000000000000000000000000000000000000000000000000000' + response;
                                        var vno = 'CON' + zeros.substr(zeros.length - 5);
                                        $('#VenderNo').val(vno);
                                    }
                                }
                            });
                        }

                    });


                    $('#ddlContractorCategory').live('focusout', function () {



                        var valueofdll = $(this).val();
                        if (valueofdll == '{NEW ELEMENT}' || valueofdll == null || valueofdll == '') {

                            $('#VenderNo').val('');

                        }
                        else {
                            $.ajax({
                                type: "POST",
                                url: "inv.ashx/?ID=11ǁ" + valueofdll,
                                success: function (response) {
                                    if (response == '<p>Contents not available</p>') {
                                        var zeros = '0000000000000000000000000000000000000000000000000000' + 1;
                                        var vno = 'CON' + zeros.substr(zeros.length - 5);
                                        $('#VenderNo').val(vno);
                                    }
                                    else {
                                        var zeros = '0000000000000000000000000000000000000000000000000000' + response;
                                        var vno = 'CON' + zeros.substr(zeros.length - 5);
                                        $('#VenderNo').val(vno);
                                    }
                                }
                            });
                        }

                    });


                    $('#ddlConCategory').live('change', loadContractersofthis);

                    ddlConCategoryBind();
                    function ddlConCategoryBind() {
                        $.ajax({
                            type: "POST",
                            url: "inv.ashx/?ID=13ǁ",
                            success: function (response) {

                                try {

                                    var jd = $.parseJSON(response), opt = '';
                                    $.each(jd, function (i, itm) {
                                        opt += '<option>' + itm.CategoryVenderContractor + '</option>';
                                    });
                                    $('#ddlContractorCategory').html(opt);
                                    $('#ddlConCategory').html(opt);
                                    loadContractersofthis();
                                    $('#ddlContractorCategory').eComboBox({ 'allowNewElements': true, 'editableElements': false });
                                } catch (e) {
                                    $('#ddlContractorCategory').eComboBox({ 'allowNewElements': true, 'editableElements': false });
                                }


                            }
                        });
                    }
                    GetNextVenderNo();
                    function GetNextVenderNo() {





                        if ($('#ddlContractorCategory').val() == '{NEW ELEMENT}' || $('#ddlContractorCategory').val() == null) {

                            $('#VenderNo').val('');

                        }
                        else {
                            $.ajax({
                                type: "POST",
                                url: "inv.ashx/?ID=11ǁ" + $('#ddlContractorCategory').val(),
                                success: function (response) {
                                    if (response == '<p>Contents not available</p>') {
                                        var zeros = '0000000000000000000000000000000000000000000000000000' + 1;
                                        var vno = 'CON' + zeros.substr(zeros.length - 5);
                                        $('#VenderNo').val(vno);
                                    }
                                    else {
                                        var zeros = '0000000000000000000000000000000000000000000000000000' + response;
                                        var vno = 'CON' + zeros.substr(zeros.length - 5);
                                        $('#VenderNo').val(vno);
                                    }
                                }
                            });
                        }
                        //if ($('#ddlContractorCategory').val() == '{NEW ELEMENT}' || $('#ddlContractorCategory').val() == null || $('#ddlContractorCategory').val()=='') {

                        //    $('#ddlVender').html('');
                        //}
                        //else {

                        //    var vend = $('#ddlContractorCategory').val();
                        //    $.ajax({
                        //        type: "POST",
                        //        url: "inv.ashx/?ID=12ǁCONǁ" + vend,
                        //        success: function (response) {
                        //            var jd = $.parseJSON(response), opt = '';
                        //            $.each(jd, function (i, itm) {
                        //                opt += '<option value="' + itm.tblVenderID + '">' + itm.Name + '</option>';
                        //            });
                        //            $('#ddlVender').html(opt);
                        //        }
                        //    });
                        //}



                    }

                });///READY END



            </script>
        </div>
    </div>
</asp:Content>
