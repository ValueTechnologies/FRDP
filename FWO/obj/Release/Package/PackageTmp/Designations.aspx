<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="Designations.aspx.cs" Inherits="FRDP.Designations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <%-- <script type="text/javascript" src="Scripts/jquery.mask.js"></script>--%>

    <script type="text/javascript">
        $(document).ready(function () {

            $('.heading h3').val("Designations");

            $('#txtSalaryRangeFrom').mask('0000000');
            $('#txtSalaryRangeTo').mask('0000000');

            $(function () {

                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=17ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlCompany').html(opt);
                        AllDesignation();
                    }
                });


                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=21ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.ID + '">' + itm.NAME + '</option>';
                        });
                        $('#txtDesignation').html(opt);

                    }
                });
                
            });


            AllDesignation();

            $('#btnSave').bind('click', function () {
                if ($('#txtDesignation').val() == "") {
                    alertG("Please enter designation...");
                    return false;
                }

                if ($('#btnSave').attr('tag') == undefined) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Designations.aspx/SaveData",
                        data: "{'designation':'" + $('#txtDesignation').val() + "', 'detail':'" + $('#txtDetail').val() + "', 'CompanyID':'" + $('#ddlCompany').val() + "' , 'SalaryFrom':'" + $('#txtSalaryRangeFrom').val() + "' , 'SalaryTo':'" + $('#txtSalaryRangeTo').val() + "'}",
                        context: document.body,
                        success: function (responseText) {
                            if (responseText.d != "") {
                                alertG("Save Successfully!");
                                //$("#txtDesignation").val('');
                                $("#txtDetail").val('');
                                $('#txtSalaryRangeFrom').val('');
                                $('#txtSalaryRangeTo').val('');

                                AllDesignation();
                            }

                        }
                    });
                }
                else {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Designations.aspx/UpdateData",
                        data: "{'designation':'" + $('#txtDesignation').val() + "', 'detail':'" + $('#txtDetail').val() + "', 'CompanyID':'" + $('#ddlCompany').val() + "' , 'SalaryFrom':'" + $('#txtSalaryRangeFrom').val() + "' , 'SalaryTo':'" + $('#txtSalaryRangeTo').val() + "' , 'DesignationID':'" + $('#btnSave').attr('tag') + "'}",
                        context: document.body,
                        success: function (responseText) {
                            alertG("Save Successfully!");
                            //$("#txtDesignation").val('');
                            $("#txtDetail").val('');
                            $('#txtSalaryRangeFrom').val('');
                            $('#txtSalaryRangeTo').val('');
                            $('#btnSave').removeAttr('tag');
                            AllDesignation();

                        }
                    });
                }

            });

            
            $('#ddlCompany').live('change', AllDesignation);



            function AllDesignation() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Designations.aspx/AllDesignation",
                    data: "{ 'CompanyID' : '" + $('#ddlCompany').val() + "' }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<tr> <td> ' + item.srno + '</td> <td> ' + item.Designation + '</td> <td> ' + item.DesignationDetail + '</td><td> ' + item.SalaryFrom + '</td><td> ' + item.SalaryTo + '</td><td> <img src="Images/Edit.jpg" tag="' + item.DesignationID + '" class="EditInfo" style="width:20px; height : 20px;" /></td></tr>';
                        });

                        $('#tbDesignation tbody').html(out);
                        $('#tbDesignation').show();
                    }
                });
            }

            $('body').on({
                click: function () {
                    $("#txtSalaryRangeTo").val($(this).parent().prev().html());
                    $("#txtSalaryRangeFrom").val($(this).parent().prev().prev().html());
                    $("#txtDetail").val($(this).parent().prev().prev().prev().html());
                    $("#txtDesignation").val($(this).parent().prev().prev().prev().prev().html());


                    $('#btnSave').attr('tag', $(this).attr('tag'));
                    $('#btnSave').val('Update');
                }
            }, ".EditInfo");
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Designation Registration</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" for="normal">Service Area</label>
                                <div class="span4" style="margin-left: 0px;">
                                    <select id="ddlCompany" class="txtcs frmCtrl" title="Company">
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" for="normal">Designation</label>
                                <%--<input id="txtDesignation" type="text" class="txtcs frmCtrl span4" title="New Designation Name" />--%>
                                <div class="span4">
                                    <select id="txtDesignation" class="txtcs frmCtrl">
                                        <option></option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" for="normal">Salary Range</label>

                                <div class="span2" style="margin-left: 0px;">
                                    <label class="form-label span3" for="normal">From</label>
                                    <input id="txtSalaryRangeFrom" type="text" class="txtcs frmCtrl span9" title="Salary Range From (Lowest Salary Range in Rs.)" />
                                </div>
                                <div class="span2">
                                    <label class="form-label span3" for="normal">To</label>
                                    <input id="txtSalaryRangeTo" type="text" class="txtcs frmCtrl span9" title="Salary Range To (Highest Salary Limit in Rs.)" />
                                </div>

                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" for="normal">Detail</label>
                                <textarea id="txtDetail" cols="20" rows="2" style="height: 95px;" class="txtcs frmCtrl span4" title="Detail of designation if any."></textarea>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <label class="form-label span3" for="normal"></label>
                                <button id="btnSave" type="button" class="btn btn-info">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <div class="row-fluid">
        <div class="spdan12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>All Registered Designations</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <table id="tbDesignation" style="width: 100%; display: none;" class="table table-bordered">
                                    <thead style="border-spacing: 0px; margin: 0px;">
                                        <tr style="background-color: rgb(228, 226, 226); color: black; text-align: left;">
                                            <td>Sr_No
                                            </td>
                                            <td>Designation
                                            </td>
                                            <td>Detail
                                            </td>
                                            <td>Salary Range From
                                            </td>
                                            <td>Salary Range To
                                            </td>
                                            <td></td>
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
