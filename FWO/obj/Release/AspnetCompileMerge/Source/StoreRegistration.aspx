<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="StoreRegistration.aspx.cs" Inherits="FRDP.StoreRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="row-fluid">
        <div class="span12">
            <%--START OF PAGE--%>
            <div class="row-fluid">
                <div class="span12">

                    <div class="box gradient">

                        <div class="title">

                            <h4>
                                <span class="icon16 icomoon-icon-equalizer-2"></span>
                                <span>Store Registration</span>
                            </h4>
                            <a href="#" class="minimize">Minimize</a>
                        </div>
                        <div class="content noPad">


                            <br />
                            <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                                <tbody>
                                    <tr>
                                        <td style="width: 100px;">Store Name</td>
                                        <td style="text-align: left; width: 40%;">
                                            <input id="txtStoreName" type="text" style="width: 90%;" /></td>
                                        <td style="width: 100px;">Store Category</td>
                                        <td style="text-align: left;">
                                            <select id="ddlType" style="width: 93%;">
                                                <option>Main Store</option>
                                                <option>Sub Store</option>
                                            </select>
                                        </td>
                                    </tr>
                                                                        <tr>
                                        <td>Office Type</td>
                                        <td>
                                    <select id="ddlCompanyType"  style="width: 93%;">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>
                                        <td><label class="form-label span3 clsHelper" for="normal">DSU</label></td>
                                        <td>
                                            <select id="ddlDSUList" class="clsHelper"  style="width: 93%;">
                                    </select></td>
                                    </tr>
                                    <tr>
                                        <td>Location</td>
                                        <td>
                                            <select id="LocationsID" style="width: 93%;"></select></td>
                                        <td>In-charge</td>
                                        <td>
                                            <select id="storeInchargeEmpID" style="width: 93%;">
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Contact No.</td>
                                        <td>
                                            <input id="txtContactNo1" type="text" style="width: 90%;" /></td>
                                        <td>Contact No.(Optional)</td>
                                        <td>
                                            <input id="txtContactNo2" type="text" style="width: 90%;" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <button id="btnSave" class="btn btn-info" tg="0">Save</button>
                                            <button id="btnCancel" class="btn btn-info" style="display:none;">Cancel</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
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
                                        <span>Registered Stores</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<table id="tblStores" class="responsive table table-bordered">
    <thead>
        <tr>
        <th>Name</th>
        <th>Category</th>
            <th>Location</th>
            <th>Incharge</th>
            <th>Contact No</th>
            <th>Contact No</th>
            <th style="width:52px;"></th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
</div>

                            </div>

                        </div>
    </div>
        </div>
    </div>


    <%--============== Store Portions ======================--%>
    <div id="dvEdit" title="Edit Node">
        <table>
            <tr>
                <td style="  width: 75px;">&nbsp;</td>
                <td style="text-align: center;">
                    <img alt="" src="images/QRCode.png" style="margin-bottom:10px; margin-top:5px; box-shadow: 0 3px 5px -1px rgba(0,0,0,.2),0 6px 10px 0 rgba(0,0,0,.14),0 1px 18px 0 rgba(0,0,0,.12);" />
                </td>
            </tr>
            <tr>
                <td>Code :
                </td>
                <td>
                    <input id="txtItemCode" type="text" style="width: 94%;" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td>Item :
                </td>
                <td>
                    <input id="txtItemName" type="text" style="width: 94%;" />
                </td>
            </tr> 
                        <tr>
                <td>Head Node :</td>
                <td>
                    <input id="chkUpdateHeadNode" type="checkbox" style="  margin-bottom: 6px;" /></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right">
                    <input id="btnUpdateNode" class="btn btn-info" type="button" value="Update" />
                </td>
            </tr>

        </table>

    </div>

   
    <div id="dvAdd" title="Add Node">
        <table>
            <tr>
                <td style="width:75px;">&nbsp;</td>
                <td style="text-align: center;">
                    <img alt="" src="images/QRCode.png" style="margin-bottom:10px; margin-top:5px;box-shadow: 0 3px 5px -1px rgba(0,0,0,.2),0 6px 10px 0 rgba(0,0,0,.14),0 1px 18px 0 rgba(0,0,0,.12);"  />
                </td>
            </tr>
            <tr>
                <td>Code :
                </td>
                <td>
                    <input id="txtAddItemCode" type="text" style="width: 94%;" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td>Item :
                </td>
                <td>
                    <input id="txtIAddtemName" type="text" style="width: 94%;" />
                </td>
            </tr>
            <tr>
                <td>Head Node :</td>
                <td>
                    <input id="chkHeadNode" type="checkbox" style="  margin-bottom: 6px;" /></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right">
                    <input id="btnAddNode" class="btn btn-info" type="button" value="Save" />
                    <input id="btnAddNodeClose" class="btn btn-info" type="button" value="Close" />
                </td>
            </tr>
        </table>

    </div>
        <style type="text/css">
        .tree, .tree ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

            .tree ul {
                margin-left: 1em;
                position: relative;
            }

                .tree ul ul {
                    margin-left: .5em;
                }

                .tree ul:before {
                    content: "";
                    display: block;
                    width: 0;
                    position: absolute;
                    top: 0;
                    bottom: 0;
                    left: 0;
                    border-left: 1px solid;
                }

            .tree li {
                margin: 0;
                padding: 0 1em;
                line-height: 2em;
                color: #369;
                font-weight: 700;
                position: relative;

            }



            .tree ul li:before {
                content: "";
                display: block;
                width: 10px;
                height: 0;
                border-top: 1px solid;
                margin-top: -1px;
                position: absolute;
                top: 1em;
                left: 0;
            }

            .tree ul li:last-child:before {
                background: #fff;
                height: auto;
                top: 1em;
                bottom: 0;
            }

        .indicator {
            margin-right: 5px;
        }

        .tree li a {
            text-decoration: none;
            color: #369;
        }

        .tree li button, .tree li button:active, .tree li button:focus {
            text-decoration: none;
            color: #369;
            border: none;
            background: transparent;
            margin: 0px 0px 0px 0px;
            padding: 0px 0px 0px 0px;
            outline: 0;
        }
    </style>
           <div class="row-fluid">
                           <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Store Portions</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <br />
                                     <div style="margin-left:30px">
                                        <ul id="tree3" class="tree"></ul></div>
                                    <br />
</div>

                            </div>

                        </div>
    </div>
    <%--END OF PAGE--%>

    <script type="text/javascript">

        //$.ajaxSetup({
        //    beforeSend: function () {
        //        // show image here
        //        $("#busy").show();
        //    },
        //    complete: function () {
        //        // hide image here
        //        $("#busy").hide();
        //    }
        //});

        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {
            //////////////////
            $(function () {
                $('#dvEdit').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 420,
                    width: 310,

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
            $(function () {
                $('#dvAdd').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 420,
                    width: 310,

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
            
            $('#ddlDSUList').live('change', function () {
                LoadLocations();
            });
            $('#ddlCompanyType').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "3") {
                    $('.clsHelper').show();
                }
                else {
                    $('.clsHelper').hide();
                }

                LoadLocations();
            });
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=47ǁ",
                    success: function (response) {
                        //alert(response);
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlDSUList').html(opt);
                        $('.clsHelper').hide();
                        LoadLocations();
                    }
                });
            });
            function LoadLocations() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType').val() + "ǁ" + $('#ddlDSUList').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#LocationsID').html(opt);
                        storeInchargeEmpIDLoad();
                        loaddata();
                        LoadRoot();
                    }
                });
            }
            function LoadRoot() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=26ǁ" + $('#LocationsID').val(),
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';
                        var spce = '';
                        var zeros = '';
                        $.each(jd, function (i, itm) {
                            if (itm.Branch != '0') {
                                //  spce = 'style = "margin-left: 28px;"';
                            }

                        });
                        $.each(jd, function (i, itm) {

                            var hcolor = "";
                            if (itm.bIsHead == "1") {
                                hcolor = 'style="color:red"';
                            }
                            if (parseInt(itm.Code) < 10) {
                                zeros = '0';
                            }
                            else {
                                zeros = '';
                            }

                            if (itm.Branch == '0') {
                                opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '" lvl="1" cd="' + zeros + itm.Code + '" lid="' + itm.ID + '" nam="' + itm.Name + '" ' + spce + ' class="Nbranch">' + zeros + itm.Code + ' ' + itm.Name + '<span title="Edit" class="editor viz icon8 icomoon-icon-pencil-4" style="display:none; cursor: pointer;" lid="' + itm.ID + '"></span><span title="Add New"  class="adder viz icon8 icomoon-icon-enter-2" style="display:none; cursor: pointer;" lid="' + itm.ID + '"></span></li>';
                            }
                            else {
                                opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '" lvl="1" cd="' + zeros + itm.Code + '" lid="' + itm.ID + '" nam="' + itm.Name + '" class="branch" style="cursor: pointer; cursor: hand;"><span lid="' + itm.ID + '"  class="branch indicator icon8 icomoon-icon-plus-2" style="margin-left: -19px;"></span>' + zeros + itm.Code + ' ' + itm.Name + '<span  title="Edit"  class="editor viz icon8 icomoon-icon-pencil-4" style="display:none;  cursor: pointer;" lid="' + itm.ID + '"></span><span  title="Add New" class="adder viz icon8 icomoon-icon-enter-2" style="display:none;  cursor: pointer;" lid="' + itm.ID + '"></span><ul  ulid="' + itm.ID + '"></ul></li>';
                            }

                        });
                        $('#tree3').html(opt);
                        SetColors();

                    }
                });
            }
            function SetColors() {
                $('li[lvl=1]').each(function (index, element) {
                    $(this).css('color', 'red');
                });
                $('li[lvl = 2]').each(function (index, element) {
                    $(this).css('color', 'green');
                });
                $('li[lvl = 3]').each(function (index, element) {
                    $(this).css('color', 'brown');
                });
                $('li[lvl = 4]').each(function (index, element) {
                    $(this).css('color', 'blue');
                });
                $('li[lvl = 5]').each(function (index, element) {
                    $(this).css('color', 'orange');
                });
                $('li[lvl = 6]').each(function (index, element) {
                    $(this).css('color', 'black');
                });
            }
            $('.tree li').live('hover', function () {
                var lid = $(this).attr('lid');
                var ed = $('.viz[lid=' + lid + ']');
                ed.toggle();
                // alertR('show123');

            });

            $('.branch').live('click', function (e) {
                if (this == e.target) {
                    var lid = $(this).attr('lid');
                    var $li = $('li[lid=' + lid + ']');
                    var lvl = parseInt($li.attr('lvl')) + 1;
                    var lnt = parseInt($li.attr('lvl')) + 2;
                    var cd = '';
                    cd = $li.attr('cd');
                    var ul = $('ul[ulid=' + lid + ']');
                    if (ul.html() == '') {
                        $.ajax({
                            type: "POST",
                            url: "inv.ashx/?ID=23ǁ" + lid,
                            success: function (response) {
                                var jd = $.parseJSON(response), opt = '';
                                var spce = ''
                                var zeros = '0000000000000000000000000000000000000000000000000000';
                                $.each(jd, function (i, itm) {
                                    if (itm.Branch != '0') {
                                        //  spce = 'style = "margin-left: 28px;"';
                                    }
                                });
                                $.each(jd, function (i, itm) {
                                    var hcolor = "";
                                    if (itm.bIsHead == "1") {
                                        hcolor = 'style="color:red"';
                                    }
                                    var c1 = '', c2 = '', c3 = '';
                                    c1 = zeros + itm.Code
                                    c2 = c1.substr(c1.length - lnt);
                                    c3 = cd + '-' + c2;
                                    if (itm.Branch == '0') {
                                        opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '"  lvl="' + lvl + '" cd="' + c3 + '" lid="' + itm.ID + '" nam="' + itm.Name + '" ' + spce + '>' + c3 + ' ' + itm.Name + '<span title="Edit"  class="editor viz icon8 icomoon-icon-pencil-4" style="display:none; cursor: pointer;" lid="' + itm.ID + '"></span><span  title="Add New"  class="adder viz icon8 icomoon-icon-enter-2" style="display:none; cursor: pointer;" lid="' + itm.ID + '"></span></li>';
                                    }
                                    else {
                                        opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '"  lvl="' + lvl + '" cd="' + c3 + '" lid="' + itm.ID + '" nam="' + itm.Name + '" class="branch" style="cursor: pointer; cursor: hand;"><span lid="' + itm.ID + '" class="branch indicator icon8 icomoon-icon-plus-2" style="margin-left: -19px;"></span>' + c3 + ' ' + itm.Name + '<span  title="Edit"  class="editor viz icon8 icomoon-icon-pencil-4" style="display:none; cursor: pointer;" lid="' + itm.ID + '"></span><span title="Add New"  class="adder viz icon8 icomoon-icon-enter-2" style="display:none; cursor: pointer;" lid="' + itm.ID + '"></span><ul  ulid="' + itm.ID + '"></ul></li>';
                                    }

                                });
                                ul.html(opt);
                                SetColors();
                            }

                        });
                    }

                    var icon = $('.indicator[lid=' + lid + ']').toggleClass('icomoon-icon-plus-2 icomoon-icon-minus-2');
                    $('li[lid=' + lid + ']').children().children().toggle();
                }

            });
            $('.editor').live('click', function () {
                var lid = $(this).attr('lid');
                var $li = $('li[lid=' + lid + ']');
                $('#txtItemCode').val($li.attr('cd'));
                $('#txtItemName').val($li.attr('nam'));
                if ($li.attr('h') == 'true') {
                    $('#chkUpdateHeadNode').attr('checked', 'checked');
                }
                else {
                    $('#chkUpdateHeadNode').removeAttr('checked');
                }
                $('#btnUpdateNode').attr('lid', lid);
                $('#dvEdit').dialog('open');
            });

            $('.adder').live('click', function () {
                var lid = $(this).attr('lid');
                var $li = $('li[lid=' + lid + ']');
                if (parseInt($li.attr('lvl')) >= parseInt($('#txtTotalLevel').attr('tg'))) {
                    alertR('Next Level is not allowd..!')
                }
                else {
                    $('#txtAddItemCode').val($li.attr('cd') + '-*****');
                    $('#txtIAddtemName').val('');
                    $('#btnAddNode').attr('lid', lid);
                    $('#dvAdd').dialog('open');
                }
            });

            $('#btnAddNodeClose').live('click', function () { $('#dvAdd').dialog('close'); });

            $('#btnAddNode').live('click', function () {
                var chk = ($('#chkHeadNode').is(':checked')) ? "1" : "0";
                var lid = $(this).attr('lid');
                if (lid == 'NULL') {

                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=25ǁ" + encodeURIComponent($('#txtIAddtemName').val()) + "ǁ" + $('#btnAddNode').attr('lid') + "ǁ" + chk ,
                        success: function (response) {
                            alertG('Record Saved');
                            $('#txtIAddtemName').val('');
                            $('#chkHeadNode').removeAttr('checked');
                            LoadRoot();
                        }
                    });
                }
                else {
                    var $li = $('li[lid=' + lid + ']');
                    var lnt = parseInt($li.attr('lvl')) + 2;
                    var indd = $('.indicator[lid=' + lid + ']');
                    if (indd.hasClass('icomoon-icon-minus-2')) {
                        indd.toggleClass('icomoon-icon-plus-2 icomoon-icon-minus-2');
                    }
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=25ǁ" + encodeURIComponent($('#txtIAddtemName').val()) + "ǁ" + $('#btnAddNode').attr('lid') + "ǁ" + chk ,
                        success: function (response) {
                            var r = response.split("½");
                            if ($li.hasClass('branch')) {
                                var $ul = $('ul[ulid=' + lid + ']');
                                $ul.html('');
                            }
                            else {
                                $li.addClass('branch');
                                $li.prepend('<span lid="' + lid + '"  class="branch indicator icon8 icomoon-icon-plus-2" style="margin-left: -19px;"></span>');
                                $('.editor[lid=' + lid + ']').addClass('branch');
                                $('.adder[lid=' + lid + ']').addClass('branch');
                                $li.append('<ul  ulid="' + lid + '"></ul>');
                            }
                            $('#txtIAddtemName').val('');
                            $('#chkHeadNode').removeAttr('checked');
                            alertG('Record Entered ..!');
                        }
                    });
                }
                SetColors();
            });
            $('#btnUpdateNode').live('click', function () {
                var lid = $(this).attr('lid');
                var $li = $('li[lid=' + lid + ']');

                var chk = ($('#chkUpdateHeadNode').is(':checked')) ? "1" : "0";
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=24ǁ" + encodeURIComponent($('#txtItemName').val()) + "ǁ" + $('#btnUpdateNode').attr('lid') + "ǁ" + chk + "ǁ" + encodeURIComponent($('#ddlUnitEdit').val()) + "ǁ" + $('#txtAlertEdit').val() + "ǁ" + encodeURIComponent($('#txtMenufecturerEdit').val()) + "ǁ" + encodeURIComponent($('#txtDescriptionEdit').val()),
                    success: function (response) {
                        if (response == 1) {
                            var str = $li.html();
                            var res = str.replace($li.attr('nam'), $('#txtItemName').val());
                            $li.html(res);
                            $li.attr('nam', $('#txtItemName').val());
                            if (chk == "1")
                            { $li.css('color', 'red').attr('h', 'true'); }
                            else
                            { $li.css('color', '#369').attr('h', 'false'); }
                            alertG('Update Successful...!');
                        }

                    }
                });
                $('#dvEdit').dialog('close');
                SetColors();
            });

            /////////////////////////Store Portions End
            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#LocationsID').val()=="" ||  $('#LocationsID').val()== null || $('#LocationsID').val()== undefined) {
                    alertR("Select Location...!");
                    return false;
                }


                if ($('#storeInchargeEmpID').val() == "" || $('#storeInchargeEmpID').val() == null || $('#storeInchargeEmpID').val() == undefined) {
                    alertR("Select Store In-charge...!");
                    return false;
                }
                if ($(this).attr('tg')==0) {

                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=6ǁ"+ $('#txtStoreName').val() +"ǁ"+ $('#ddlType').val() +"ǁ"+ $('#LocationsID').val()+"ǁ"+ $('#storeInchargeEmpID').val()+"ǁ"+                $('#txtContactNo1').val()+"ǁ"+                $('#txtContactNo2').val()+"ǁ"+                 $('#btnSave').attr('tg') ,
                        success: function (response) {
                            if (response=="1") {
                                clearform();
                                loaddata();
                                LoadRoot();
                                alertG('Record Saved..!');
                            }
                        }
                    });
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=9ǁ" + $('#txtStoreName').val() +"ǁ"+ $('#ddlType').val() +"ǁ"+ $('#LocationsID').val()+"ǁ"+ $('#storeInchargeEmpID').val()+"ǁ"+                $('#txtContactNo1').val()+"ǁ"+                $('#txtContactNo2').val()+"ǁ"+                 $('#btnSave').attr('tg'),
                        success: function (response) {
                            if (response == "1") {
                                clearform();
                                loaddata();
                                alertG('Record Updated..!');
                            }
                        }
                    });
                }
            });
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                clearform();
            });
            function clearform() {
                $('#txtStoreName').val('');
                $('#txtContactNo1').val('');
                $('#txtContactNo2').val('');
                $('#btnSave').attr('tg','0');
                $('#btnSave').html('save');
                $('#btnCancel').hide();
                
                
            }
            
            function loaddata() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=27ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        try {
                            var jd = $.parseJSON(response), opt = '';
                            $.each(jd, function (i, itm) {
                                opt +=        ' <tr>\
        <td>'+itm.txtStoreName+'</td>\
        <td>'+itm.Type+'</td>\
            <td>' + itm.CompanyName + '</td>\
            <td>' + itm.Emp_Name + '</td>\
            <td>'+itm.txtContactNo1+'</td>\
            <td>' + itm.txtContactNo2 + '</td>\
            <td style="width:75px;"><button tg="' + itm.tblinvStoreID + '" class="btnDelete btn btn-danger">X</button>\
            <button tg="'+itm.tblinvStoreID+'" title="Edit" class="btnEdit btn btn-info">e</button>\
            </th>\
        </tr>';
                            });
                            $('#tblStores tbody').html(opt);

                            

                        } catch (e) {
                            alertR(e.message);
                        }
                        
                    }
                });

            }

            $('.btnDelete').live('click', function (e) {
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=10ǁ" + $(this).attr('tg'),
                    success: function (response) {
                        loaddata();
                        alertG('Recored Deleted..!');
                    }
                });
            });

            $('.btnEdit').live('click', function (e) {
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=8ǁ" + $(this).attr('tg'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        
                        $('#txtStoreName').val(jd[0].txtStoreName);
                        $('#ddlType').val(jd[0].Type); 
                        $('#LocationsID').val(jd[0].LocationsID); 
                        $('#storeInchargeEmpID').val(jd[0].storeInchargeEmpID); 
                        $('#txtContactNo1').val(jd[0].txtContactNo1); 
                        $('#txtContactNo2').val(jd[0].txtContactNo2);
                        $('#btnSave').attr('tg', jd[0].tblinvStoreID);
                        $('#btnSave').html('Update');
                        $('#btnCancel').show();
                    }
                });
            });

            $('#LocationsID').live('change', function () {
                storeInchargeEmpIDLoad();
                loaddata();
                LoadRoot();
            });
            
            function storeInchargeEmpIDLoad() {
                if ($('#LocationsID').val()=="" ||  $('#LocationsID').val()== null || $('#LocationsID').val()== undefined) {
                    $('#storeInchargeEmpID').html('');
                }
                else {
                    $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=18ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.Emp_Id + '">' + itm.Emp_Name + '</option>';
                        });
                        $('#storeInchargeEmpID').html(opt);
                    }
                });
                }

            }
        });///End of READY
    </script>
</asp:Content>
