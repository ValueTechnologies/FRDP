<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="AppointmentLetter.aspx.cs" Inherits="FRDP.AppointmentLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function showimagepreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgprvw').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }

        $('body').on({
            click: function () {
                var name = $(this).parent().prev().prev().prev().prev().prev().html().trim();
                $('#lblNameRejectionCandidate').html(name);
                $('#lblNameRejectionCandidate').attr('tag', $(this).attr('tag'));
                $('#dvRejectionJobOffer').dialog("open");
            }
        }, ".clsReject");


        $('body').on({
            click: function () {

                var id = $(this).attr('tag');
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "AppointmentLetter.aspx/IsLetterAccepted",
                    data: "{ 'SelectedCandidateID' : '" + id + "'}",
                    success: function (response) {
                        
                        var JData = $.parseJSON(response.d);
                        if (JData[0].OfferAccepted == "1") {
                            $('#dvAppointmentLetter').show('slow');
                            $('#btnMakeAppointmentLetter').attr('tag', id);
                            AllDepartment();
                            return;
                        }
                    }
                });


                var name = $(this).parent().prev().prev().prev().prev().prev().html().trim();
                $('#lblNameAcceptanceCandidate').html(name);
                $('#lblNameAcceptanceCandidate').attr('tag', $(this).attr('tag'));
                $('#dvAcceptJobOffer').dialog("open");
            }
        }, ".clsAccept");


        function AllDepartment() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "AppointmentLetter.aspx/AllDepartments",
                data: "{ 'CompanyID' : '" + $('#ddlCompany').val() + "' }",
                async: false,
                success: function (responseText) {
                    var jData = $.parseJSON(responseText.d), out = "";
                    $.each(jData, function (i, item) {
                        out = out + '<option value="' + item.DepartmentID + '">' + item.DepartmentName + '</option>';
                    });
                    $('#ddlDepartment').html(out);
                    $('#ddlDepartment').prev().html($('#ddlDepartment option:selected').text());
                }
            });
        }




        $(document).ready(function () {
            $('.heading h3').html('Appointment Letter');
            //Company
            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "JobSpecification.aspx/AllCompaniesList",
                    data: "{}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.CompanyID + '">' + item.CompanyName + '</option>';
                        });
                        $('#ddlCompany').html(out);
                        $('#ddlCompany').prev().html($('#ddlCompany option:selected').text());
                    }
                });
            });


            //Duty Station
            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "JobRequirement.aspx/AllDutyStations",
                    data: "{ }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.DutyStationID + '">' + item.DutyStation + '</option>';
                        });

                        $('#ddlDutyStation').html(out);
                        $('#ddlDutyStation').prev().html($('#ddlDutyStation option:selected').text());
                    }
                });
            });



            $("#dvRejectionJobOffer").dialog({
                autoOpen: false,
                resizable: false,
                modal: true,
                height: 400,
                width: 550,
                buttons: {
                    "Confirm": function () {

                        //Offer Letter Rejection Confirmation


                        if ($('#txtEmailReply').val() == "") {
                            alert("Please Copy/Past email reply in Text Area. ");
                            return;
                        }
                        var ctrlVals = "";
                        ctrlVals += '0' + '½';
                        ctrlVals += $('#txtEmailReply').val() + '½';
                        ctrlVals += $('#lblNameRejectionCandidate').attr('tag'); + '½';


                        var uploadfiles = $("#fileUpload").get(0);
                        var uploadedfiles = uploadfiles.files;
                        var fromdata = new FormData();
                        fromdata.append("vls", ctrlVals);
                        for (var i = 0; i < uploadedfiles.length; i++) {
                            fromdata.append(uploadedfiles[i].name, uploadedfiles[i]);
                        }

                        var choice = {};
                        choice.url = "OfferLetter.ashx";
                        choice.type = "POST";
                        choice.data = fromdata;
                        choice.contentType = false;
                        choice.processData = false;
                        choice.success = function (result) {

                            if (result > 0) {
                                alert('Save Successfully!');
                                $('#lblNameRejectionCandidate').removeAttr('tag');
                                $('#txtEmailReply').val('');
                                
                            }


                            if ($.browser.msie) {
                                $('#fileUpload').replaceWith($('#fileUpload').clone());
                            }
                            else {
                                $('#fileUpload').val('');
                            }
                            $('.filename').html('');
                        };
                        choice.error = function (err) {
                            alert(err.statusText);
                        };
                        $.ajax(choice);



                        $(this).dialog("close");
                        //Offer Letter Rejection Confirmation End

                    },
                    "Not Confirm": function () {
                        $(this).dialog('close');
                    }
                }
            });


            $("#dvAcceptJobOffer").dialog({
                autoOpen: false,
                resizable: false,
                modal: true,
                height: 400,
                width: 550,
                buttons: {
                    "Confirm": function () {

                        //Offer Letter Acceptance Confirmation
                        var id = $('#lblNameAcceptanceCandidate').attr('tag');
                        if ($('#txtEmailConfirmationReply').val() == "") {
                            alert("Please Copy/Past email reply in Text Area. ");
                            return;
                        }
                        var ctrlVals = "";
                        ctrlVals += '1' + '½';
                        ctrlVals += $('#txtEmailConfirmationReply').val() + '½';
                        ctrlVals += $('#lblNameAcceptanceCandidate').attr('tag'); + '½';


                        var uploadfiles = $("#fileUploadConfirm").get(0);
                        var uploadedfiles = uploadfiles.files;
                        var fromdata = new FormData();
                        fromdata.append("vls", ctrlVals);
                        for (var i = 0; i < uploadedfiles.length; i++) {
                            fromdata.append(uploadedfiles[i].name, uploadedfiles[i]);
                        }

                        var choice = {};
                        choice.url = "OfferLetter.ashx";
                        choice.type = "POST";
                        choice.data = fromdata;
                        choice.contentType = false;
                        choice.processData = false;
                        choice.success = function (result) {

                            if (result > 0) {
                                alert('Save Successfully!');
                                $('#lblNameRejectionCandidate').removeAttr('tag');
                                $('#txtEmailReply').val('');
                                $('#lblNameAcceptanceCandidate').removeAttr('tag');
                                $('#txtEmailConfirmationReply').val('');
                                $(this).dialog('close');
                                $('#dvAppointmentLetter').show('slow');
                                $('#btnMakeAppointmentLetter').attr('tag', id);
                            }


                            if ($.browser.msie) {
                                $('#fileUpload').replaceWith($('#fileUpload').clone());
                            }
                            else {
                                $('#fileUpload').val('');
                            }
                            $('.filename').html('');
                        };
                        choice.error = function (err) {
                            alert(err.statusText);
                        };
                        $.ajax(choice);




                        //Offer Letter Acceptance Confirmation End

                    },
                    "Not Confirm": function () {
                        $(this).dialog('close');
                    }
                }
            });

            $("#dvImageEmail").dialog({
                autoOpen: false,
                resizable: false,
                modal: true,
                height: 500,
                width: 500

            });


            $('#DutyTimmingFrom').timepicker({
                datepicker: false,
                format: 'hh:i'
            });

            $('#DutyTimmingTo').timepicker({
                datepicker: false,
                format: 'hh:i'
            });

            $('#txtDateOfJoining').datepicker({ dateFormat: 'dd - MM - yy', timepicker: false });


            $('#btnShowImage').bind('click', function () {
                $('#dvImageEmail').dialog('open');
            });

            $('#btnShowImageConfirm').bind('click', function () {
                $('#dvImageEmail').dialog('open');
            });

            $('#btnSearch').bind('click', function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "AppointmentLetter.aspx/SearchCandidates",
                    data: "{ 'CompanyID' : '" + $('#ddlCompany').val() + "',    'DutyStationID' : '" + $('#ddlDutyStation').val() + "',  'JobCode' : '" + $('#txtJobCode').val() + "',  'Name' : '" + $('#txtName').val() + "'}",
                    success: function (response) {
                        var JData = $.parseJSON(response.d), out = "";
                        $.each(JData, function (i, item) {
                            out = out + '<tr> <td> ' + item.Srno + ' </td>  <td> ' + item.Name + ' </td><td> ' + item.CNIC + ' </td><td> ' + item.CellNo + ' </td><td> ' + item.SelectOnDate + ' </td><td> ' + item.SelectedBy + ' </td><td> <button type="button"  tag="' + item.SelectedCandidateID + '"  class="clsAccept btn btn-link">Offer Accepted</button>  &nbsp; &nbsp; <button tag="' + item.SelectedCandidateID + '" type="button" class="clsReject btn btn-link">Offer Rejected</button> </td></tr>';
                        });
                        $('#tbAllCandidates tbody').html(out);
                    }
                });

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "AppointmentLetter.aspx/SearchAppointedCandidates",
                    data: "{ 'CompanyID' : '" + $('#ddlCompany').val() + "',    'DutyStationID' : '" + $('#ddlDutyStation').val() + "',  'JobCode' : '" + $('#txtJobCode').val() + "',  'Name' : '" + $('#txtName').val() + "'}",
                    success: function (response) {

                        var JData = $.parseJSON(response.d), out = "";
                        $.each(JData, function (i, item) {
                            out = out + '<tr> <td> ' + item.Srno + ' </td>  <td> ' + item.Name + ' </td><td> ' + item.CNIC + ' </td><td> ' + item.CellNo + ' </td><td> ' + item.DepartmentName + ' </td><td> ' + item.DateOfJoining + ' </td><td> <a href="AppointmentLetterRpt.aspx?ID=' + item.SelectedCandidateID + '" target="_blank"   >Letter</a>  </td></tr>';
                        });
                        $('#tbAllAppointmentLetters tbody').html(out);
                        $('#dvAllAppointmentLetter').show('slow');
                    }
                });
            });




            $('#btnMakeAppointmentLetter').bind('click', function () {
                if ($('#txtSalary').val() == "") {
                    alert('Please enter salary...');
                    return;
                }

                if ($('#DutyTimmingFrom').val() == "") {
                    alert('Please enter Duty Timming From ...');
                    return;
                }


                if ($('#DutyTimmingTo').val() == "") {
                    alert('Please enter Duty Timming To ...');
                    return;
                }


                if ($('#txtDateOfJoining').val() == "") {
                    alert('Please enter Date of Joining ...');
                    return;
                }


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "AppointmentLetter.aspx/SaveAppointmentLetter",
                    data: "{  'CandidateSelectedID' : '" + $("#btnMakeAppointmentLetter").attr('tag') + "', 'salary' : '" + $('#txtSalary').val() + "', 'TimmingFrom' : '" + $('#DutyTimmingFrom').val() + "', 'TimmingTo' : '" + $('#DutyTimmingTo').val() + "', 'DateOfJoining' : '" + $('#txtDateOfJoining').val() + "',  'DeptID' : '" + $('#ddlDepartment').val() + "', 'ProbationPeriod' : '" + $('#ProbationPeriod').val() + "'   }",
                    success: function (response) {
                        alert("Save successfully!");
                        $("#btnMakeAppointmentLetter").removeAttr('tag');
                        $('#txtSalary').val('');
                        $('#DutyTimmingFrom').val('');
                        $('#DutyTimmingTo').val('');
                        $('#txtDateOfJoining').val('');
                        $('#ddlDepartment').val('');
                        $('#ProbationPeriod').val('');
                    }
                });
            });






        });
    </script>



    <script type="text/javascript" src="js/supr-theme/jquery-ui-timepicker-addon.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="dvImageEmail" title="Offer Letter Reply">
        <img alt="" src="" id="imgprvw" style="width: 100%; height: 100%;" />
    </div>

    <div id="dvRejectionJobOffer" title="Offer Letter Rejection Confirmation?">
        <p style="text-align: center;">
            <label id="lblNameRejectionCandidate" style="font-weight: bold;"></label>
        </p>

        <table>
            <tr>
                <td>Email Reply : 
                </td>
                <td>
                    <textarea id="txtEmailReply" cols="70" rows="5" style="width: 400px; height: 150px;"></textarea>
                </td>
            </tr>
            <tr>
                <td>Snap Shot Email : 
                </td>
                <td>
                    <input type="file" id="fileUpload" onchange="showimagepreview(this);" />
                    &nbsp;
                    <button class="btn btn-info" type="button" id="btnShowImage">Show Image</button>
                </td>
            </tr>
        </table>

    </div>

    <div id="dvAcceptJobOffer" title="Offer Letter Acceptance Confirmation?">
        <p style="text-align: center;">
            <label id="lblNameAcceptanceCandidate" style="font-weight: bold;"></label>
        </p>

        <table>
            <tr>
                <td>Email Reply : 
                </td>
                <td>
                    <textarea id="txtEmailConfirmationReply" cols="70" rows="5" style="width: 400px; height: 150px;"></textarea>
                </td>
            </tr>
            <tr>
                <td>Snap Shot Email : 
                </td>
                <td>
                    <input type="file" id="fileUploadConfirm" onchange="showimagepreview(this);" />
                    &nbsp;
                    <button class="btn btn-info" type="button" id="btnShowImageConfirm">Show Image</button>
                </td>
            </tr>
        </table>

    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Search Candidates</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">
                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">Company</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddlCompany" title="Company ">
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span4" for="normal">Duty Station</label>
                                <div class="span7 controls" style="margin-left: 0px;">
                                    <select id="ddlDutyStation" name="select">
                                    </select>
                                </div>
                            </div>

                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">Job Code</label>
                                <input class="span7" id="txtJobCode" type="text" />
                            </div>
                            <div class="span6">
                                <label class="form-label span4" for="normal">Name</label>
                                <input class="span7" id="txtName" type="text" />
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal"></label>
                                <button type="button" id="btnSearch" class="btn btn-info">Search</button>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <table id="tbAllCandidates" class="responsive table table-striped table-bordered table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Sr.#
                                            </th>
                                            <th>Name
                                            </th>
                                            <th>CNIC
                                            </th>
                                            <th>Contact No.
                                            </th>
                                            <th>Selected Date
                                            </th>
                                            <th>Selected By
                                            </th>
                                            <th>Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>




                    </form>

                </div>
            </div>
        </div>
    </div>



    <div class="row-fluid" style="display: none;" id="dvAppointmentLetter">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Appointment Letter</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">
                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">Salary</label>
                                <input class="span7" id="txtSalary" type="number" />
                            </div>
                            <div class="span6">
                                <label class="form-label span4" for="normal">Office Timming</label>

                                <table>
                                    <tr>
                                        <td>From
                                        </td>
                                        <td>
                                            <input id="DutyTimmingFrom" style="width: 100px;" class="hasTimeEntry" type="text" name="time" autocomplete="off" />
                                        </td>
                                        <td style="width: 25px;"></td>
                                        <td>To
                                        </td>
                                        <td>
                                            <input id="DutyTimmingTo" style="width: 100px;" class="hasTimeEntry" type="text" name="time" autocomplete="off" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">Date Of Joining</label>
                                <input class="span7" id="txtDateOfJoining" type="text" />
                            </div>
                            <div class="span6">
                                <label class="form-label span4" for="normal">Department</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddlDepartment">
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">
                                    Probation Period<br />
                                    (In Month)</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ProbationPeriod">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                            </div>
                        </div>




                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal"></label>
                                <button type="button" class="btn btn-info" id="btnMakeAppointmentLetter">Save</button>

                            </div>
                            <div class="span6">
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>










    <div class="row-fluid"  id="dvAllAppointmentLetter" style="display:none;">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>All Appointment Letters</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">
                        <div class="form-row row-fluid">
                            <div class="span12">
                                <table id="tbAllAppointmentLetters" class="responsive table table-striped table-bordered table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Sr.No
                                            </th>
                                            <th>Name
                                            </th>
                                            <th>CNIC
                                            </th>
                                            <th>Contact No.
                                            </th>
                                            <th>Department
                                            </th>
                                            <th>Date Of Joining
                                            </th>
                                            <th>Appointment Letter
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
