<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="JoiningOrientation.aspx.cs" Inherits="FRDP.JoiningOrientation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    &nbsp;
    <script type="text/javascript">

        $('body').on({
            click: function () {
                var str = "";
                str = "<tr><td>" + $("#ddlTeamList option:selected").text() + "</td><td><img tag= '" + $("#ddlTeamList").val() + "'  class='removeSendToJoining' src='images/cross_circle.png' /></td></tr>";

                $('#tblEmailList').append(str);
            }
        }, "#btnAddMailSendTo");

        $('body').on({
            click: function () {
                var str = "";
                str = "<tr><td>" + $("#ddlOrientationTeamList option:selected").text() + "</td><td><img tag= '" + $("#ddlOrientationTeamList").val() + "'  class='removeSendToOrientation' src='images/cross_circle.png' /></td></tr>";

                $('#tblEmailListOrientation').append(str);
            }
        }, "#btnAddMailSendToOrentation");



        $("body").on({
            click: function () {
                $(this).parent().parent().remove();
            }
        }, ".removeSendToJoining");

        $("body").on({
            click: function () {
                $(this).parent().parent().remove();
            }
        }, ".removeSendToOrientation");



        $(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MeetingArrangements.aspx/OurTeamMembers",
                context: document.body,
                success: function (responseText) {
                    var jData = $.parseJSON(responseText.d), out = "";
                    $.each(jData, function (i, item) {
                        out = out + '<option value="' + item.User_ID + '">' + item.Full_Name + '</option>';
                    });
                    $('#ddlTeamList').html(out);
                    $('#JoiningResponsible').html(out);
                    $('#OrientationResponsible').html(out);
                    $('#ddlOrientationTeamList').html(out);
                }
            });
        });



        $("body").on({
            click: function () {
                $("*").css("cursor", "wait");
                var SendtoListEmp = "";
                $('.removeSendToJoining').each(function (i, obj) {
                    SendtoListEmp += $(this).attr('tag') + ",";
                });

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "JoiningOrientation.aspx/JoiningSaveData",
                    data: "{'IsJoined':'" + $('#IsJoined').val() + "', 'JoiningRespoinsible':'" + $('#JoiningResponsible').val() + "', 'EmailTo':'" + SendtoListEmp + "'   ,  'CandidateID':'" + $('#btnSendMailJoining').attr('tag') + "'}",
                    context: document.body,
                    success: function (responseText) {
                        alert('save Successfully!');
                        $("*").css("cursor", "auto");
                        $('#tblEmailList').html('');
                        $('#txtEmail').val('');
                        $('#dvJoining').hide();
                    }
                });

            }
        }, '#btnSendMailJoining');





        $("body").on({
            click: function () {
                $("*").css("cursor", "wait");
                var SendtoListEmp = "";
                $('.removeSendToOrientation').each(function (i, obj) {
                    SendtoListEmp += $(this).attr('tag') + ",";
                });

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "JoiningOrientation.aspx/OrientationSaveData",
                    data: "{'OrientationStatus':'" + $('#IsJoined').val() + "', 'OrientationRespoinsible':'" + $('#JoiningResponsible').val() + "', 'EmailTo':'" + SendtoListEmp + "'   ,  'CandidateID':'" + $('#btnSendMailJoining').attr('tag') + "'}",
                    context: document.body,
                    success: function (responseText) {
                        alert('save Successfully!');
                        $("*").css("cursor", "auto");
                        $('#tblEmailListOrientation').html('');
                        $('#txtEmail').val('');
                        $('#dvOrientation').hide();
                    }
                });

            }
        }, '#btnSendMailOrientation');

        ///email end
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



        $('body').on({
            click: function () {
                $("#dvJoining").show('slow');
                $("#dvOrientation").hide('slow');
                $("#dvJD").hide('slow');
                $('#btnSendMailJoining').attr('tag', $(this).attr('tag'));

            }
        }, ".clsJoining");


        $('body').on({
            click: function () {
                $("#dvOrientation").show('slow');
                $("#dvJoining").hide('slow');
                $("#dvJD").hide('slow');
                $('#btnSendMailOrientation').attr('tag', $(this).attr('tag'));
            }
        }, ".clsOrientation");


        $('body').on({
            click: function () {
                Department();
                $("#dvJD").show('slow');
                $("#dvOrientation").hide('slow');
                $("#dvJoining").hide('slow');
                $('#btnSaveActivity').attr('tag', $(this).attr('tag'));
            }
        }, ".clsJD");



        //JD Functions start

        function Department() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "JoiningOrientation.aspx/Department",
                data: "{}",
                success: function (response) {
                    var jData = $.parseJSON(response.d), out = "";
                    $.each(jData, function (i, item) {
                        out = out + '<option value="' + item.DeptID + '">' + item.Depart + '</option>';
                    });
                    $('#ddDepartment').html(out);
                    $('#ddDepartment').prev().html($('#ddDepartment option:selected').text());
                    Function();
                }
            });
        }

        $('body').on({
            change: function () {
                Function();
            }
        }, "#ddDepartment");

        function Function() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "JoiningOrientation.aspx/Function",
                data: "{ 'Deptid' : '" + $('#ddDepartment').val() + "'}",
                success: function (response) {
                    var jData = $.parseJSON(response.d), out = "";
                    $.each(jData, function (i, item) {
                        out = out + '<option value="' + item.FuncID + '">' + item.Func + '</option>';
                    });
                    $('#ddFunction').html(out);
                    $('#ddFunction').prev().html($('#ddFunction option:selected').text());
                    sFunction();
                }
            });
        }

        $('body').on({
            change: function () {
                sFunction();
            }
        }, "#ddFunction");

        function sFunction() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "JoiningOrientation.aspx/sFunction",
                data: "{ 'funID' : '" + $('#ddFunction').val() + "'}",
                success: function (response) {
                    var jData = $.parseJSON(response.d), out = "";
                    $.each(jData, function (i, item) {
                        out = out + '<option value="' + item.SFuncID + '">' + item.SFunc + '</option>';
                    });
                    $('#ddsFunction').html(out);
                    $('#ddsFunction').prev().html($('#ddsFunction option:selected').text());
                    Activity();
                }
            });
        }

        $('body').on({
            change: function () {
                Activity();
            }
        }, "#ddsFunction");

        function Activity() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "JoiningOrientation.aspx/Activity",
                data: "{ 'sfunID' : '" + $('#ddsFunction').val() + "'}",
                success: function (response) {
                    var jData = $.parseJSON(response.d), out = "";
                    $.each(jData, function (i, item) {
                        out = out + '<option value="' + item.ID + '">' + item.Activ + '</option>';
                    });
                    $('#ddActivity').html(out);
                    $('#ddActivity').prev().html($('#ddActivity option:selected').text());
                }
            });
        }




        $('body').on({
            click: function () {

                $("*").css("cursor", "wait");
                var AllActivities = "";
                $('.clsActivities').each(function (i, obj) {
                    AllActivities += $(this).attr('tag') + ",";
                });


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "JoiningOrientation.aspx/OrganizationStructure",
                    data: "{ 'deptid' : '" + $("#ddDepartment").val() + "', 'funid' : '" + $("#ddFunction").val() + "',  'sfunID' : '" + $("#ddsFunction").val() + "',  'activityID' : '" + $("#ddActivity").val() + "', 'AddedActivities' : '" + AllActivities + "'}",
                    success: function (response) {
                        var jData = $.parseJSON(response.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<tr><td> ' + item.Depart + '</td> <td> ' + item.Func + '</td> <td> ' + item.SFunc + '</td> <td> ' + item.Activ + '</td><td><img class="clsActivities" tag=' + item.ID + ' src="images/cross_circle.png"></td></tr>';
                        });
                        $('#tbOD tbody').append(out);
                        $("*").css("cursor", "auto");
                    }
                });
            }
        }, "#btnAddActivity");




        $('body').on({
            click: function () {
                $(this).parent().parent().remove();
                
            }
        }, ".clsActivities");







        $('body').on({
            click: function () {

                $("*").css("cursor", "wait");
                var AllActivities = "";
                $('.clsActivities').each(function (i, obj) {
                    AllActivities += $(this).attr('tag') + ",";
                });

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "JoiningOrientation.aspx/SaveJDData",
                    data: "{ 'Activities' : '" + AllActivities + "', 'candidateID' : '" + $("#btnSaveActivity").attr('tag') + "'}",
                    success: function (response) {
                        alert('Save successfully!');
                        $("*").css("cursor", "auto");
                        $("#dvJD").hide('slow');
                        AllActivities = "";
                        $('.clsActivities').each(function (i, obj) {
                            $(this).parent().parent().remove();
                        });
                    }
                });

            }
        }, "#btnSaveActivity");

        //JD Function End





        $(document).ready(function () {
            $(".heading h3").html('Joining & Orientation');


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




            $('#btnSearch').bind('click', function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "JoiningOrientation.aspx/SearchCandidates",
                    data: "{ 'CompanyID' : '" + $('#ddlCompany').val() + "',    'DutyStationID' : '" + $('#ddlDutyStation').val() + "',  'JobCode' : '" + $('#txtJobCode').val() + "',  'Name' : '" + $('#txtName').val() + "'}",
                    success: function (response) {
                        var JData = $.parseJSON(response.d), out = "";
                        $.each(JData, function (i, item) {
                            out = out + '<tr> <td> ' + item.Srno + ' </td>  <td> ' + item.Name + ' </td><td> ' + item.CNIC + ' </td><td> ' + item.CellNo + ' </td><td> ' + item.SelectOnDate + ' </td><td> ' + item.SelectedBy + ' </td><td>  <button tag="' + item.SelectedCandidateID + '" type="button" class="clsJD btn btn-link">Create JD</button>  &nbsp; &nbsp;<a href="JDRpt.aspx?ID=' + item.SelectedCandidateID + '" target="_blank">View JD</a> &nbsp; &nbsp; <button type="button"  tag="' + item.SelectedCandidateID + '"  class="clsJoining btn btn-link">Joining</button>  &nbsp; &nbsp; <button tag="' + item.SelectedCandidateID + '" type="button" class="clsOrientation btn btn-link">Orientation</button> </td></tr>';
                        });
                        $('#tbAllCandidates tbody').html(out);
                    }
                });
            });
        });




    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


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







    <div id="dvJoining" class="row-fluid" style="display: none;">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Joining</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">Joined ?</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="IsJoined">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">Joining Responsible</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="JoiningResponsible">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />

                        <h4 style="margin-left: 10%; color: rgb(79, 116, 148);">Send Mail For Create New Email and VMIS Account</h4>
                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">To</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddlTeamList" title="Email to">
                                    </select>
                                </div>
                                <button type="button" id="btnAddMailSendTo" class="span2 btn btn-info btn-mini">Add</button>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="span3"></label>
                                <div class="span7" style="margin-left: 0px;">
                                    <table id="tblEmailList" class="responsive table table-striped table-bordered table-condensed csTable" style="width: 60%;">
                                    </table>
                                </div>

                            </div>
                        </div>

                        <div class="form-row row-fluid" style="display: none;">
                            <div class="span12">
                                <label class="form-label span3" for="normal">Email Text</label>

                                <textarea class="span7" id="txtEmail" cols="60" rows="7" title="Email text"></textarea>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" for="normal"></label>
                                <button type="button" id="btnSendMailJoining" class="btn btn-info">Save & Send Mail</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <div id="dvOrientation" class="row-fluid" style="display: none;">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Orientation</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">Orientation Status</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="OrientationStatus">
                                        <option value="1">Done</option>
                                        <option value="0">Not Done</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">Orientation Responsible</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="OrientationResponsible">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />

                        <h4 style="margin-left: 10%; color: rgb(79, 116, 148);">Send Mail For Orientation</h4>
                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">To</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddlOrientationTeamList" title="Email to">
                                    </select>
                                </div>
                                <button type="button" id="btnAddMailSendToOrentation" class="span2 btn btn-info btn-mini">Add</button>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="span3"></label>
                                <div class="span7" style="margin-left: 0px;">
                                    <table id="tblEmailListOrientation" class="responsive table table-striped table-bordered table-condensed csTable" style="width: 60%;">
                                    </table>
                                </div>

                            </div>
                        </div>

                        <div class="form-row row-fluid" style="display: none;">
                            <div class="span12">
                                <label class="form-label span3" for="normal">Email Text</label>

                                <textarea class="span7" id="txtEmailOrientation" cols="60" rows="7" title="Email text"></textarea>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" for="normal"></label>
                                <button type="button" id="btnSendMailOrientation" class="btn btn-info">Save & Send Mail</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>





    <div id="dvJD" class="row-fluid" style="display: none;">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Job Discription (JD)</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">Department</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddDepartment">
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">Function</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddFunction">
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">SubFunction</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddsFunction">
                                    </select>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="form-label span3" style="margin-left: 0px;" for="normal">Activity</label>
                                <div class="span7" style="margin-left: 0px;">
                                    <select id="ddActivity">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal"></label>
                                <button type="button" id="btnAddActivity" class="btn btn-info">Add</button>
                            </div>
                        </div>
                        <div class="form-row row-fluid">
                            <div class="span12">
                                <table id="tbOD" class="responsive table table-striped table-bordered table-condensed">
                                    <thead>
                                        <tr>
                                            <th>
                                                Department
                                            </th>
                                            <th>
                                                Function
                                            </th>
                                            <th>
                                                Sub Function
                                            </th>
                                            <th>
                                                Activity
                                            </th>
                                            <th>
                                                Cancel
                                            </th>
                                        </tr>
                                    </thead>
                                   <tbody>
                                       
                                   </tbody>
                                </table>
                            </div>
                        </div>

                     

                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span3" for="normal"></label>
                                <button type="button" id="btnSaveActivity" class="btn btn-info">Save</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
