<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="PhysicalAppearance.aspx.cs" Inherits="FRDP.PhysicalAppearance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Select Animal</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                                       <br /> <table style="width: 60%; margin-left:20%;">
                       <tr><td  style="width:90px;">Dairy Farm</td>
                            <td>
                                <select id="ddlDairyForm" style="width: 50%"  name="D2" class="vl">
                                </select></td>
                            </tr>
                        <tr>
                            <td>Animal Type : </td>
                            <td>
                                <select id="ddtype" style="width: 50%" class="vl">
                                    <option value="SelectAnimal">Select Animal</option>
                                    <option value="All Animals">All Animals</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Animal Tag # : </td>
                            <td>
                                <select id="ddTag" style="width: 50%" class="vl">
                                    <option>Select</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Animal Name : </td>
                            <td>
                                <input id="txtName" type="text" disabled="disabled" style="width: 47.6%" class="vl" /></td>
                        </tr>
                    </table><br />
                </div>

            </div>

        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Details</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <table id="myTab" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th>Tag #</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Vaccine Name</th>
                                <th>Disease Prevention</th>
                                <th>Dose Rate</th>
                                <th>Schedule</th>

                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>

    <button class="btn btn-info trgt" style="float: right;">Add New Data</button>


           <div id="dvAddActivity" title="Add New Activity" style="display:none; ">
            <table style="width: 100%; max-width: 749px;">

                <tr>
                    <td>Animal Tag #</td>
                    <td>
                        <select id="PopTag" class="vl" name="D11">
                            <option></option>
                        </select></td>
                    <td>Body Condition</td>
                    <td>
                        <select id="ddBodyCondition" class="vl" name="D10" style="width: 100px">
                            <option value="Weak">Weak</option>
                            <option value="Injured">Injured</option>
                            <option value="Other">Other</option>
                        </select></td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>Date</td>
                    <td>
                        <input id="adate" type="text" />
                        
                    </td>
                    <td style="width: 113px">Excretion type</td>
                    <td>
                        <select id="ddExcretionType" class="vl" name="D10" style="width: 100px">
                            <option value="Increased">Normal</option>
                            <option value="Decreased">Abnormal</option>
                        </select></td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>Feed Intake</td>
                    <td>
                        <select id="ddFeedIntake" class="vl">
                            <option value="GreenFadar">Green Fadar</option>
                            <option value="CottonSeedCake">Cotton Seed Cake</option>
                            <option value="WheatBran">Wheat Bran</option>
                            <option value="Wanda">Wanda</option>
                        </select>
                    </td>
                    <td style="width: 113px">Production Cycle</td>
                    <td>
                        <select id="ddProduction" class="vl">
                            <option value="Increased">Increased</option>
                            <option value="Decreased">Decreased</option>
                            <option value="RemainedSame">Remained Same</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Notes</td>
                    <td colspan="4">

                        <textarea id="taNotes" cols="20" name="S1" rows="2" style="width: 100%"></textarea></td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td colspan="4">&nbsp;</td>
                </tr>

                <tr class="chgpwd">
                    <td align="right" colspan="5">

                        <input id="btnsave" class="btn btn-info" type="button" value="Save Data" />
                    </td>
                </tr>
            </table>
        </div>
    <script type="text/javascript">



        $(document).ready(function () {

            LoadAllCompanies();
            function LoadAllCompanies() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "DairyFormRegister.aspx/AllCompaniesList",
                    data: "{}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            // out = out + '<tr><td style="text-align:left;">' + item.CompanyName + ' </td> <td style="text-align:left;"> ' + item.CompanyAbbrivation + '</td> <td style="text-align:left;"> ' + item.CompanyPhoneNo + '</td> <td style="text-align:left;">' + item.CompanyEmail + ' </td> <td style="text-align:right;">' + item.CompanyEstablishmentYear + ' </td><td style="text-align:left;">' + item.CompanyAddress + ' </td></tr>';
                            out += '<option value="' + item.CompanyID + '">' + item.CompanyName + '</option>';
                        });
                        $("#ddlDairyForm").html(out);
                        if (out != "") {
                            Abreed();
                        }
                    }
                });
            }
            $("#ddVaccineName").eComboBox();
            $("#ddPreventionFrom").eComboBox();
            $("#ddDoseRate").eComboBox();
            $("#ddSchedule").eComboBox();

            $("#adate").datepicker({ dateFormat: 'dd-mm-yy' });

            $(".trgt").live('click', function (e) {
                e.preventDefault();
                $('#dvAddActivity').dialog("open");
                $('#PopTag').html('<option>' + $('#ddTag').val() + '</option>');
            });

            $("#ddtype").change(function () {
                Abreed();
                health();
            });

            $("#ddTag").change(function () {
                health();
                GetAnimalName();
            });



            //------------------------------------Functions----------------------------//


            $(function () {
                $('#dvAddActivity').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 300,
                    width: 800,

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
            $("#btnsave").click(function () {

                var tag = $('#PopTag').val();
                var bodyCondition = $('#ddBodyCondition').val();
                var adate = $('#adate').val();
                var excretionType = $('#ddExcretionType').val();
                var feedIntake = $('#ddFeedIntake').val();
                var production = $('#ddProduction').val();
                var taNotes = $('#taNotes').val();

                $.ajax({

                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: 'PhysicalAppearance.aspx/insert',
                    data: "{'tag':'" + tag + "','bodyCondition':'" + bodyCondition + "','adate':'" + adate + "','feedIntake':'" + feedIntake + "','production':'" + production + "','excretionType':'" + excretionType + "','taNotes':'" + taNotes + "'}",
                    async: false,
                    success: function (response) {

                        alert("Record saved successfully in database");
                        health();
                    },
                    error: function () {

                        alert("some problem in saving data");
                    }


                });


            })
        });

        function Abreed() {


            $.ajax({

                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'PhysicalAppearance.aspx/Abreed',
                data: "{'tbl_CompanyID':'" + $('#ddlDairyForm').val() + "'}",
                async: false,
                success: function (response) {

                    var name = $.parseJSON(response.d), myname = "";
                    myname = "<option  value=0></option>";
                    $.each(name, function (i, item) {
                        myname += "<option  value= " + item.tag + ">" + item.tag + "</option>";

                    });

                    $('#ddTag').html(myname);
                }


            });


        }

        function health() {

            var tag = $('#ddTag').val();
            var AnimalType = $('#ddtype').val();

            $.ajax({

                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'PhysicalAppearance.aspx/health',
                data: "{'tag':'" + tag + "','AnimalType':'" + AnimalType + "'}",
                async: false,
                success: function (response) {

                    var name = $.parseJSON(response.d), myname = "";
                    $.each(name, function (i, item) {
                        myname = myname + "<tr><td>" + item.strAnimalTag + "</td><td>" + item.dtDateTime + "</td><td>" + item.strBodyCondition + "</td><td>" + item.strExcretionType + "</td><td>" + item.strFeedIntake + "</td><td>" + item.strProductionCycle + "</td><td>" + item.strNotes + "</td></tr>";

                    });

                    $('#myTab tbody').html(myname);
                }


            });


        }

        function GetAnimalName() {

            var tag = $('#ddTag').val();

            $.ajax({

                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'PhysicalAppearance.aspx/GetAnimalName',
                data: "{'tag':'" + tag + "'}",
                async: false,
                success: function (response) {

                    var name = $.parseJSON(response.d), myname = "";

                    $.each(name, function (i, item) {
                        myname += item.name;
                    });
                    $('#txtName').val(myname);
                }


            });


        }


    </script>
</asp:Content>

