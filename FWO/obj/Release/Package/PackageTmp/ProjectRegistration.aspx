<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="ProjectRegistration.aspx.cs" Inherits="FRDP.ProjectRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
        $(document).ready(function () {
            $('.heading h3').val("Project Registration");
            $("#txtStartDate").datepicker({ dateFormat: 'dd-MM-yy', yearRange: "-100:+10", changeYear: true, changeMonth: true });
            $("#txtEndDate").datepicker({ dateFormat: 'dd-MM-yy', yearRange: "-100:+10", changeYear: true, changeMonth: true });
            AllProjects();
            

            function toDate(selector) {
                var from = $(selector).val().split('-');
                var mon = from[1], day = from[0], year = from[2];
                //var d = new Date(Date.parse($(selector).val())).getMonth() + 1;
                return Date.parse(year + "-" + mon + "-" + day);
            }

            $('#btnSave').bind('click', function () {
                var ctrlVals = "";
                $('.frmCtrl').each(function (index, element) {
                    ctrlVals += $(this).val() + '½';
                });

                var eDate = toDate("#txtEndDate");
                var sDate = toDate("#txtStartDate");
                if(sDate > eDate)
                {
                    alertR('End Date cannot be smaller than Start Date.');
                    return false;
                }

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ProjectRegistration.aspx/SaveData",
                    data: "{'Values':'" + ctrlVals + "'}",
                    context: document.body,
                    success: function (responseText) {
                        alertG("Save Successfully!");
                        $("#txtEndDate").val('');
                        $("#txtStartDate").val('');
                        $('#txtProjectName').val('');
                        AllProjects();
                    }
                });
            });
            
            function AllProjects() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ProjectRegistration.aspx/AllProjects",
                    data: "{ }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            var ended = "Completed";
                            if (item.Ended == 0)
                                ended = "Ongoing";
                            out = out + '<tr> <td  style="text-align:left;"> ' + item.ProjectName + '</td> <td  style="text-align:left;"> ' + item.StartDate + '</td> <td  style="text-align:left;"> ' + item.EndDate + '</td> <td style="text-align:left;">' + ended + ' </td></tr>';
                        });
                        $('#tbDepartments tbody').html(out);
                        $('#tbDepartments').show();
                    }
                });
            }
        });
    </script>


    <style type="text/css">
        .txtcs {
            width: 200px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Project Registration</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">

                                <div class="form-row row-fluid">
                                    <div class="span12">
                                        <label class="form-label span3" for="normal">Project Name</label>
                                            <input id="txtProjectName" type="text" class="txtcs frmCtrl span4" title="Enter name of the project." />
                                    </div>
                                </div>


                                <div class="form-row row-fluid">
                                    <div class="span12">
                                        <label class="form-label span3" for="normal">Start Date</label>
                                            <input id="txtStartDate" type="text" class="txtcs frmCtrl span4" title="Start date of the project." />
                                    </div>
                                </div>

                                <div class="form-row row-fluid">
                                    <div class="span12">
                                        <label class="form-label span3" for="normal">End Date</label>
                                            <input id="txtEndDate" type="text" class="txtcs frmCtrl span4" title="End date of the project." />
                                    </div>
                                </div>


                                <%--<div class="form-row row-fluid">
                                    <div class="span12">
                                        <label class="form-label span3" for="normal">Currently Working?</label>
                                        <div class="span4" style="margin-left:0px;">
                                            <select id="ddlCurruentlyWorking" class="txtcs frmCtrl" title="Is Currently Working?">
                                                <option value="1">Yes</option>
                                                <option value="0">No</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="form-row row-fluid">
                                    <div class="span12">
                                        <label class="form-label span3" for="normal"></label>
                                         <button id="btnSave" type="button" value="Save" class="btn btn-info">Save</button>
                                    </div>
                                </div>




                                <%--***********************--%>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>All Registered Projects</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">

                                <div class="form-row row-fluid">
                                    <div class="span12">
                                        <table id="tbDepartments" style="width: 100%; display: none;" class="table table-bordered">
                                            <thead style="border-spacing: 0px; margin: 0px;">
                                                <tr style="background-color: rgb(228, 226, 226); color: black; text-align: left;">
                                                    <td>Project Name
                                                    </td>
                                                    <td>Start Date
                                                    </td>
                                                    <td>End Date
                                                    </td>
                                                    <td>Status
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
