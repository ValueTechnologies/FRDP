<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="OrganizationDevelopment.aspx.cs" Inherits="FRDP.OrganizationDevelopment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<%--    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <link href="js/jquery-ui.css" rel="stylesheet" />--%>


   


    <style type="text/css">
        #ui-dialog-title-dvAddNewLevel1 {
            color: black;
        }

        #ui-dialog-title-dvAddNewLevel2 {
            color: black;
        }

        #ui-dialog-title-dvAddNewLevel3 {
            color: black;
        }

        #ui-dialog-title-dvAddNewLevel4 {
            color: black;
        }

        .myBorderclass {
            border: 1px solid #ECECEC;
            border-top: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <button id="btnAddL1" type="button" value="Add New" class="btn btn-info">Add New</button>
        <br />
        <br />
        <div id="dvOrgStructureL1" class="myaccord">
        </div>
    </div>



    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>
    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>
    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>
    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>

    <div id="NewOrgDevelopment" class="accordion gradient">
    </div>


    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>
    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>
    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>
    <%--//////////////////////////////////////////////////////////////////////////////////////////--%>


    <%--Divs--%>
    <div id="dvAddNewLevel1" title="Level 1" style="display: none; color: black;">
        <table style="margin-left: 50px; margin-top: 20px;">
            <tr>
                <td>Department :
                </td>
                <td>
                    <input id="txtNewDept" type="text" title="Add New Department" />
                </td>
            </tr>
            <tr>
                <td>
                    Priority :
                </td>
                <td>
                    <input id="txtDeptSeq" type="text" title="Enter Sequence in Departments" />
                </td>
            </tr>

            <tr>
                <td>&nbsp;
                </td>
                <td style="text-align: left">
                    <br />
                    <button id="btnSaveNewDept" class="btn btn-info btn-mini" type="button">Save</button>
                    <button id="btnCloseNewDept" class="btn btn-info btn-mini btnX" type="button">Cancel</button>
                </td>
            </tr>
        </table>
    </div>



    <div id="dvAddNewLevel2" title="Level 2" style="display: none; color: black;">
        <table style="margin-left: 50px; margin-top: 20px;">
            <tr>
                <td>Function :
                </td>
                <td>
                    <input id="txtNewFunction" type="text" title="Add New Function" />
                </td>
            </tr>
            <tr>
                <td>
                    Priority :
                </td>
                <td>
                    <input id="txtFunSeq" type="text" title="Enter Sequence in Function" />
                </td>
            </tr>

            <tr>
                <td>&nbsp;
                </td>
                <td style="text-align: left">
                    <br />
                    <button id="btnSaveNewFun" class="btn btn-info btn-mini" type="button">Save</button>
                    <button id="btnCloseNewFun" class="btn btn-info btn-mini btnX" type="button">Cancel</button>
                </td>
            </tr>
        </table>
    </div>



    <div id="dvAddNewLevel3" title="Level 3" style="display: none; color: black;">
        <table style="margin-left: 50px; margin-top: 20px;">
            <tr>
                <td>Sub Function :
                </td>
                <td>
                    <input id="txtNewSubFunction" type="text" title="Add New Sub Funtion" />
                </td>
            </tr>
            <tr>
                <td>
                    Priority :
                </td>
                <td>
                    <input id="txtsFunSeq" type="text" title="Enter Sequence in Sub Function" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td style="text-align: left">
                    <br />
                    <button id="btnSaveNewSubFun" class="btn btn-info btn-mini" type="button">Save</button>
                    <button id="btnCloseNewSubFun" class="btn btn-info btn-mini btnX" type="button">Cancel</button>
                </td>
            </tr>
        </table>
    </div>




    <div id="dvAddNewLevel4" title="Level 4" style="display: none; color: black;">
        <table style="margin-left: 50px; margin-top: 20px;">
            <tr>
                <td>Activity :
                </td>
                <td>
                    <input id="txtNewActivity" type="text" title="Add New Sub Funtion" />
                </td>
            </tr>
            <tr>
                <td>
                    Priority :
                </td>
                <td>
                    <input id="txtsActivitySeq" type="text" title="Enter Sequence in Activities" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td style="text-align: left">
                    <br />
                    <button id="btnSaveNewActivity" class="btn btn-info btn-mini" type="button">Save</button>
                    <button id="btnCloseNewActivity" class="btn btn-info btn-mini btnX" type="button">Cancel</button>
                </td>
            </tr>
        </table>
    </div>



     <script type="text/javascript">
         function showimagepreview(input, ImgID) {

             var imageid = '#' + ImgID.id;
             if (input.files && input.files[0]) {
                 var filerdr = new FileReader();
                 filerdr.onload = function (e) {
                     $(imageid).attr('src', e.target.result);
                     $(imageid).show();
                 }
                 filerdr.readAsDataURL(input.files[0]);

                 ///Save Image to DB
                 var ctrlVals = "";
                 ctrlVals += ImgID.id + '½';

                 var fromdata = new FormData();
                 fromdata.append("vls", ctrlVals);

                 fromdata.append(input.files[0].name, input.files[0]);

                 var choice = {};
                 choice.url = "OrganizationDevelopmentCS.ashx";
                 choice.type = "POST";
                 choice.data = fromdata;
                 choice.contentType = false;
                 choice.processData = false;
                 choice.success = function (result) {
                     alertG(result);
                 };
                 choice.error = function (err) {
                     alertR(err.statusText);
                 };
                 $.ajax(choice);
             }
         }



         $(document).ready(function () {

             $('#dvAddNewLevel1').dialog({ autoOpen: false, width: "70%" });
             $('#dvAddNewLevel2').dialog({ autoOpen: false, width: "70%" });
             $('#dvAddNewLevel3').dialog({ autoOpen: false, width: "70%" });
             $('#dvAddNewLevel4').dialog({ autoOpen: false, width: "70%" });


             $('body').on({
                 click: function () {
                     $('#dvAddNewLevel1').dialog("open");
                     $("#txtNewDept").val($(this).attr("newtag"));
                     $("#txtDeptSeq").val($(this).attr('seqtag'));
                     $('#btnSaveNewDept').text("Update");
                     $('#btnSaveNewDept').removeAttr('tag');
                     $('#btnSaveNewDept').attr('tag', $(this).attr('tag'));

                 }
             }, ".clsEditLevel1");


             $('body').on({
                 click: function () {
                     $('#dvAddNewLevel2').dialog("open");
                     $("#txtNewFunction").val($(this).attr("newtag"));
                     $("#txtFunSeq").val($(this).attr('seqtag'));
                     $('#btnSaveNewFun').text("Update");
                     $('#btnSaveNewFun').removeAttr('tag');
                     $('#btnSaveNewFun').attr('tag', $(this).attr('tag'));

                 }
             }, ".clsEditLevel2");



             $('body').on({
                 click: function () {
                     $('#dvAddNewLevel3').dialog("open");
                     $("#txtNewSubFunction").val($(this).attr("newtag"));
                     $("#txtsFunSeq").val($(this).attr('seqtag'));
                     $('#btnSaveNewSubFun').text("Update");
                     $('#btnSaveNewSubFun').removeAttr('tag');
                     $('#btnSaveNewSubFun').attr('tag', $(this).attr('tag'));

                 }
             }, ".clsEditLevel3");

             $('body').on({
                 click: function () {
                     $('#dvAddNewLevel4').dialog("open");
                     $("#txtNewActivity").val($(this).attr("newtag"));
                     $('#btnSaveNewActivity').text("Update");
                     $("#txtsActivitySeq").val($(this).attr('seqtag'));
                     $('#btnSaveNewActivity').removeAttr('tag');
                     $('#btnSaveNewActivity').attr('tag', $(this).attr('tag'));

                 }
             }, ".clsEditLevel4");





             $('body').on({
                 click: function () {
                     $('#dvAddNewLevel2').dialog('open');
                     $('#btnSaveNewFun').removeAttr('tag');
                     $('#btnSaveNewFun').attr('tag', $(this).attr('tag'));

                 }
             }, "#btnAddLevel_2");


             $('body').on({
                 click: function () {
                     $('#btnSaveNewSubFun').removeAttr('tag');
                     $('#dvAddNewLevel3').dialog('open');
                     $('#btnSaveNewSubFun').attr('tag', $(this).attr('tag'));
                 }
             }, "#btnAddLevel_3");



             $('body').on({
                 click: function () {
                     $('#btnSaveNewActivity').removeAttr('tag');
                     $('#dvAddNewLevel4').dialog('open');
                     $('#btnSaveNewActivity').attr('tag', $(this).attr('tag'));
                 }
             }, "#btnAddLevel_4");



             $('#btnCloseNewActivity ').bind('click', function () {
                 $('#dvAddNewLevel4').dialog('close');
             });


             $('#btnCloseNewSubFun ').bind('click', function () {
                 $('#dvAddNewLevel3').dialog('close');
             });


             $('#btnCloseNewFun ').bind('click', function () {
                 $('#dvAddNewLevel2').dialog('close');
             });



             ///////////////////////////////////////////////////////////////////

             $('#btnSaveNewFun').bind('click', function () {

                 if ($('#txtNewFunction').val().trim() != "") {
                     if ($('#btnSaveNewFun').text() == "Save") {
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/SaveLevel2",
                             data: "{ 'FunName' : '" + $('#txtNewFunction').val() + "', 'DepartmentID' : '" + $('#btnSaveNewFun').attr('tag') + "', 'Seq' : '" + $('#txtFunSeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d == "1") {
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewFunction').val('');
                                     $('#txtFunSeq').val('');
                                     $('#dvAddNewLevel2').dialog("close");
                                     L1();
                                 }
                             }
                         });
                     }
                     else {

                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/UpdateLevel2",
                             data: "{ 'FunName' : '" + $('#txtNewFunction').val() + "', 'ID' : '" + $('#btnSaveNewFun').attr('tag') + "', 'Seq' : '" + $('#txtFunSeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d == "1") {
                                     $('#btnSaveNewFun').text("Save");
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewFunction').val('');
                                     $('#txtFunSeq').val('');
                                     $('#dvAddNewLevel2').dialog("close");
                                     L1();
                                 }
                             }
                         });
                     }
                 }
             });




             $('#btnSaveNewSubFun').bind('click', function () {
                 if ($('#txtNewSubFunction').val().trim() != "") {
                     if ($('#btnSaveNewSubFun').text().trim() == "Save") {
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/SaveLevel3",
                             data: "{ 'SubFunName' : '" + $('#txtNewSubFunction').val() + "', 'FunID' : '" + $('#btnSaveNewSubFun').attr('tag') + "', 'Seq' : '" + $('#txtsFunSeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d != "") {
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewSubFunction').val('');
                                     $('#txtsFunSeq').val('');
                                     $('#dvAddNewLevel3').dialog("close");
                                     L1();
                                 }

                             }
                         });
                     }
                     else {
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/UpdateLevel3",
                             data: "{ 'SubFunName' : '" + $('#txtNewSubFunction').val() + "', 'sFunID' : '" + $('#btnSaveNewSubFun').attr('tag') + "', 'Seq' : '" + $('#txtsFunSeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d != "") {
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewSubFunction').val('');
                                     $('#txtsFunSeq').val('');
                                     $('#dvAddNewLevel3').dialog("close");
                                     L1();
                                 }

                             }
                         });

                     }



                 }

             });





             $('#btnSaveNewActivity').bind('click', function () {
                 if ($('#txtNewActivity').val().trim() != "") {
                     if ($('#btnSaveNewActivity').text().trim() == "Save") {
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/SaveLevel4",
                             data: "{ 'Activity' : '" + $('#txtNewActivity').val() + "', 'sFunID' : '" + $('#btnSaveNewActivity').attr('tag') + "', 'Seq' : '" + $('#txtsActivitySeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d != "") {
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewActivity').val('');
                                     $('#txtsActivitySeq').val('');
                                     $('#dvAddNewLevel4').dialog("close");
                                     L1();
                                 }
                             }
                         });
                     }
                     else {

                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/UpdateLevel4",
                             data: "{ 'Activity' : '" + $('#txtNewActivity').val() + "', 'ActivityID' : '" + $('#btnSaveNewActivity').attr('tag') + "', 'Seq' : '" + $('#txtsActivitySeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d != "") {
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewActivity').val('');
                                     $('#txtsActivitySeq').val('');
                                     $('#dvAddNewLevel4').dialog("close");
                                     L1();
                                 }
                             }
                         });
                     }
                 }

             });


             //////////////////////////////////////////////////////////////////
             //////////////////////////////////////////////////////////////////
             //////////////////////////////////////////////////////////////////
             //////////////////////////////////////////////////////////////////





             $('.heading h3').html('Organization Development');
             L1();




             function L1() {
                 if ($('#dvOrgStructureL1').hasClass("ui-accordion")) {
                     $('#dvOrgStructureL1').accordion("destroy");
                 }

                 $.ajax({
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "OrganizationDevelopment.aspx/Level1",
                     data: "{ }",
                     context: document.body,
                     success: function (responseText) {
                         var jData = $.parseJSON(responseText.d), out = "", NewOut = "";
                         $.each(jData, function (i, item) {
                             out += '<h3  id= "L1' + item.DeptID + '" class="csLevel1" tag="' + item.Depart + '" > ' + item.Depart + ' </h3><div id= "_L1' + item.DeptID + '">  </div>';

                             NewOut += '<div class="accordion-group" ><div class="accordion-heading csLevel1"  tag="' + item.Depart + '" id= "L1' + item.DeptID + '"><a href="#Col_' + item.DeptID + '" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle">' + item.Depart + '<img alt="" seqtag="' + item.DeptSeq + '" newtag="' + item.Depart + '" tag="L1' + item.DeptID + '" class="clsEditLevel1" src="Images/EditInfo.png" title="Edit this name" style="float:right; margin-right:15px; width:18px;" /><span class="icon12 entypo-icon-plus-2 gray"></span></a></div><div style="height: 0px;" class="accordion-body collapse myBorderclass" id="Col_' + item.DeptID + '"><div class="accordion-inner"  id= "_L1' + item.DeptID + '"></div></div></div>';

                         });

                         $('#NewOrgDevelopment').html(NewOut);
                     }
                 });
             }


             //Level 1 End

             //Level 2 start
             $('body').on({
                 click: function () {
                     if ($(this).next().children().html().trim() != "") {
                     }
                     else {
                         var DeptName = $(this).attr('tag');
                         var DeptID = $(this).attr('id');
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/Level2",
                             data: "{ 'deptId' : '" + DeptName + "' }",
                             context: document.body,
                             success: function (responseText) {
                                 var jData = $.parseJSON(responseText.d), out = "", NewOut = ' <button type="button" class="btn btn-info" tag=' + DeptID + ' id="btnAddLevel_2">Add New</button><br /><br />';
                                 $.each(jData, function (i, item) {
                                     out += '<h3  id="L2' + item.FuncID + '" class="csLevel2" tag="' + item.Func + '"> ' + item.Func + ' </h3><div id="_L2' + item.FuncID + '">  </div>';

                                     NewOut += '<div class="accordion-group"><div class="accordion-heading csLevel2"   id="L2' + item.FuncID + '" tag="' + item.Func + '"><a href="#__' + item.FuncID + '" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle">' + item.Func + '<img alt="" seqtag="' + item.FuncSeq + '" newtag="' + item.Func + '" tag="L2' + item.FuncID + '" class="clsEditLevel2" src="Images/EditInfo.png" title="Edit this name" style="float:right; margin-right:15px; width:18px;" /><span class="icon12 entypo-icon-plus-2 gray"></span></a></div><div style="height: 0px;" class="accordion-body collapse myBorderclass" id="__' + item.FuncID + '"><div class="accordion-inner" id="_L2' + item.FuncID + '"></div></div></div>';
                                 });

                                 $('#_' + DeptID).html(NewOut);
                             }
                         });
                     }
                 }
             }, ".csLevel1");



             //Level2 End

             //Level3 Start


             $('body').on({
                 click: function () {

                     if ($(this).next().children().html().trim() != "") {

                     }
                     else {
                         var FunName = $(this).attr('tag');
                         var FunID = $(this).attr('id');
                         $('#_' + FunID).html('');
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/Level3",
                             data: "{ 'FunId' : '" + FunName + "' }",
                             context: document.body,
                             success: function (responseText) {
                                 var jData = $.parseJSON(responseText.d), out = "", NewOut = ' <button type="button" tag=' + FunID + ' class="btn btn-info" id="btnAddLevel_3">Add New</button><br /><br />';
                                 $.each(jData, function (i, item) {
                                     out += '<h3 id="L3' + item.SFuncID + '" class="csLevel3" tag="' + item.SFunc + '"> ' + item.SFunc + ' </h3><div id="_L3' + item.SFuncID + '">  </div>';


                                     NewOut += '<div class="accordion-group"><div class="accordion-heading csLevel3"  id="L3' + item.SFuncID + '" tag="' + item.SFunc + '"><a href="#___' + item.SFuncID + '" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle">' + item.SFunc + '<img alt="" seqtag="' + item.SFuncSeq + '" newtag="' + item.SFunc + '" tag="L3' + item.SFuncID + '" class="clsEditLevel3"   src="Images/EditInfo.png" title="Edit this name" style="float:right; margin-right:15px; width:18px;" /><span class="icon12 entypo-icon-plus-2 gray"></span></a></div><div style="height: 0px;" class="accordion-body collapse myBorderclass" id="___' + item.SFuncID + '"><div class="accordion-inner" id="_L3' + item.SFuncID + '"></div></div></div>';
                                 });


                                 $('#_' + FunID).html(NewOut);

                             }
                         });
                     }

                 }
             }, ".csLevel2");



             // Level 3 End


             // Level 4 Start

             $('body').on({
                 click: function () {
                     if ($(this).next().children().html().trim() != "") {

                     }
                     else {
                         var sFunName = $(this).attr('tag');
                         var sFunID = $(this).attr('id');
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/Level4",
                             data: "{ 'SFunId' : '" + sFunName + "' }",
                             context: document.body,
                             success: function (responseText) {
                                 var jData = $.parseJSON(responseText.d), out = "", NewOut = ' <button type="button" tag=' + sFunID + ' class="btn btn-info" id="btnAddLevel_4">Add New</button><br /><br />';
                                 $.each(jData, function (i, item) {
                                     //out += '<h3 class="csLevel4" tag="' + item.ID + '"> ' + item.Activ + ' </h3><div id="L4' + item.ID + '">  </div>';


                                     //NewOut += '<div class="accordion-group csLevel4"  id="L4' + item.ID + '" tag="' + item.Activ + '"><div class="accordion-heading"  class="csLevel4" tag="' + item.Activ + '"><a href="#____' + item.ID + '" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle">' + item.Activ + '<span class="icon12 entypo-icon-plus-2 gray"></span></a></div><div style="height: 0px;" class="accordion-body collapse myBorderclass" id="____' + item.ID + '"><div class="accordion-inner" id="_L4' + item.ID + '"> <button type="button" class="btn btn-info">Add Process</button><br /><br /></div></div></div>';

                                     NewOut += '<div class="accordion-group csLevel4"  id="L4' + item.ID + '" tag="' + item.Activ + '"><div class="accordion-heading"  class="csLevel4" tag="' + item.Activ + '"><a href="#____' + item.ID + '" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle">' + item.Activ + '<img alt=""  seqtag="' + item.ActivitySeq + '" newtag="' + item.Activ + '" tag="L4' + item.ID + '" class="clsEditLevel4"  src="Images/EditInfo.png" title="Edit this name" style="float:right; margin-right:15px; width:18px;" /><span class="icon12 entypo-icon-plus-2 gray"></span></a></div><div style="height: 0px;" class="accordion-body collapse myBorderclass" id="____' + item.ID + '"><div class="accordion-inner" id="_L4' + item.ID + '">   <input id="FileUploadProcess" type="file"     onchange="showimagepreview(this, imgprvw____' + item.ID + ');"       />  <br /> <img id="imgprvw____' + item.ID + '" style="width: 100%; height: 100%;"  />   <br /><br /></div></div></div>';
                                 });


                                 $('#_' + sFunID).html(NewOut);
                             }
                         });
                     }

                 }
             }, ".csLevel3");

             // Level 4 end






             $('body').on({
                 click: function () {

                     $.ajax({
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         url: "OrganizationDevelopment.aspx/ProcessName",
                         data: "{ 'id' : '" + $(this).attr('id') + "'}",
                         success: function (response) {
                             var jData = $.parseJSON(response.d), out = "", Imageid = "";
                             $.each(jData, function (i, item) {
                                 out = item.Procc;
                                 Imageid = item.ID;
                             });

                             $("#imgprvw____" + Imageid).propAttr("src", out);
                         }
                     });



                 }
             }, ".csLevel4")
             //////////////////////////////////////////////////////////////////////////////////////////////
             //////////////////////////////////////////////////////////////////////////////////////////////




             //////////////////////////////////////////////////////////////////////////////////////////////
             //////////////////////////////////////////////////////////////////////////////////////////////






             $('#btnSaveNewDept').bind('click', function () {
                 if ($('#txtNewDept').val().trim() != "") {
                     if ($('#btnSaveNewDept').text().trim() == "Save") {
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/SaveLevel1",
                             data: "{ 'NewDeptName' : '" + $('#txtNewDept').val() + "', 'Seq' : '" + $('#txtDeptSeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d != "") {
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewDept').val('');
                                     $('#txtDeptSeq').val('');
                                     $('#dvAddNewLevel1').dialog("close");
                                     L1();
                                 }

                             }
                         });
                     }
                     else {
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "OrganizationDevelopment.aspx/UpdateLevel1",
                             data: "{ 'NewDeptName' : '" + $('#txtNewDept').val() + "', 'ID' : '" + $('#btnSaveNewDept').attr('tag') + "', 'Seq' : '" + $('#txtDeptSeq').val() + "'}",
                             context: document.body,
                             success: function (responseText) {
                                 if (responseText.d != "") {
                                     $('#btnSaveNewDept').text("Save");
                                     $('#btnSaveNewDept').removeAttr('tag');
                                     $('#dvOrgStructureL1').html('');
                                     $('#txtNewDept').val('');
                                     $('#txtDeptSeq').val('');
                                     $('#dvAddNewLevel1').dialog("close");
                                     L1();
                                 }

                             }
                         });
                     }
                 }
             });



             $('#btnCloseNewDept').bind('click', function () {
                 $('#dvAddNewLevel1').dialog("close");
             });

             $('#btnAddL1').bind('click', function () {
                 $('#dvAddNewLevel1').dialog("open");
             });


         });
    </script>
</asp:Content>
