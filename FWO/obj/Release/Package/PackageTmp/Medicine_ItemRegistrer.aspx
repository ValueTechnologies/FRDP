<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="Medicine_ItemRegistrer.aspx.cs" Inherits="FRDP.Medicine_ItemRegistrer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
    <div class="row-fluid" style="display:none;">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon8 icomoon-icon-equalizer-2"></span>
                        <span>Set Inventory Items Total Hierarchical levels</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>

                <div class="content noPad">
                    <br />
                    <div style="margin: 10px;">
                        Level of hierarchy  
                        <input id="txtTotalLevel" readonly="readonly" class="Integer" type="text" style="width: 50px" value="0" />
                        <button id="btnSetTotalLevel" class="btn btn-info marginB10">Save</button>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon8 icomoon-icon-equalizer-2"></span>
                        <span>Medicine Items</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
      <button id="btnAddRoot" class="btn btn-info" style="float:right; margin-right:10px; display:none;">Add Root</button><br />
                    <div style="margin-left:30px">
    <ul id="tree3" class="tree"></ul></div><br />
                </div>

            </div>

        </div>
    </div>





       <%--=================================================--%>
    <div id="dvAdd" title="Add Node">
        <table>
            <tr>
                <td style="width:105px;">&nbsp;</td>
                <td style="text-align: left;">
                    <img alt="" src="images/QRCode.png" style="width: 50px; margin-bottom:10px; margin-top:5px;box-shadow: 0 3px 5px -1px rgba(0,0,0,.2),0 6px 10px 0 rgba(0,0,0,.14),0 1px 18px 0 rgba(0,0,0,.12);"  />
                </td>
            </tr>
              <tr>
                <td>Head Node :</td>
                <td>
                    <input id="chkHeadNode" type="checkbox" style="  margin-bottom: 6px;" /></td>
            </tr>
            <tr>
                <td>Code :
                </td>
                <td>
                    <input id="txtAddItemCode" type="text" style="width: 94%;" readonly="readonly" />
                </td>
            </tr>
                       <tr>
                <td id="tdTile">Medicine Name:
                </td>
                <td>
                    <input id="txtIAddtemName" type="text" style="width: 94%;" />
                </td>
            </tr>
             <tr class="clsitms">
     <td>Generic Name :</td>
     <td>
         <input id="txtAddGENERIC_NAME" type="text" style="width: 94%;" /></td>
 </tr>
 <tr class="clsitms">
     <td>Unit :</td>
     <td>
         <select id="ddlUnit">
             <option>PC</option>
             <option>Foot</option>
             <option>Inches</option>
             <option>Meter</option>
         </select></td>
 </tr>
            <tr class="clsitms">
                <td>Min Stock Level:</td>
                <td>
                    <input id="txtAlert" class="Integer" type="text" /></td>
            </tr>
                       <tr class="clsitms">
                <td>Manufacturer:</td>
                <td>
                    <input id="txtMenufecturer"  type="text" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>
                    <textarea id="txtDescription" cols="20" rows="2"></textarea></td>
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

<%--==================================================--%>
        <div id="dvEdit" title="Edit Node">
        <table>
            <tr>
                <td style="width:105px;">&nbsp;</td>
                <td style="text-align: left;">
                    <img alt="" src="images/QRCode.png" style="width: 50px; margin-bottom:10px; margin-top:5px;box-shadow: 0 3px 5px -1px rgba(0,0,0,.2),0 6px 10px 0 rgba(0,0,0,.14),0 1px 18px 0 rgba(0,0,0,.12);"  />
                </td>
            </tr>
              <tr>
                <td>Head Node :</td>
                <td>
                    <input id="chkUpdateHeadNode" type="checkbox" style="  margin-bottom: 6px;" /></td>
            </tr>
            <tr>
                <td>Code :
                </td>
                <td>
                    <input id="txtItemCode" type="text" style="width: 94%;" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td  id="tdTileEdit">Item :
                </td>
                <td>
                    <input id="txtItemName" type="text" style="width: 94%;" />
                </td>
            </tr> 
            <%--======--%>
                         <tr class="clsitmsEdit">
     <td>Generic Name :</td>
     <td>
         <input id="txtGENERIC_NAME" type="text" style="width: 94%;" /></td>
 </tr>
             <tr class="clsitmsEdit">
     <td>Unit :</td>
     <td>
         <select id="ddlUnitEdit">
             <option>PC</option>
             <option>Foot</option>
             <option>Inches</option>
             <option>Meter</option>
         </select></td>
 </tr>
            <tr class="clsitmsEdit">
                <td>Min Stock Level:</td>
                <td>
                    <input id="txtAlertEdit" class="Integer" type="text" /></td>
            </tr>
                       <tr class="clsitmsEdit">
                <td>Manufacturer:</td>
                <td>
                    <input id="txtMenufecturerEdit" type="text" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>
                    <textarea id="txtDescriptionEdit" cols="20" rows="2"></textarea></td>
            </tr>
            <%--======--%>
            <tr>
                <td></td>
                <td style="text-align: right">
                    <input id="btnUpdateNode" class="btn btn-info" type="button" value="Update" />
                </td>
            </tr>

        </table>

    </div>
    


    <%--=================================================================--%>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {
            $(function () {
                try {
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=0ǁ",
                        success: function (response) {
                            var jd = $.parseJSON(response);
                            $('#txtTotalLevel').val(jd[0].MaxLevels);
                            $('#txtTotalLevel').attr('tg', jd[0].MaxLevels);
                        },
                        error: function (e) { alertR(e.error); }
                    });
                } catch (e) {

                }

            });
            $('#btnSetTotalLevel').live('click', function (e) {
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=1ǁ" + $('#txtTotalLevel').val(),
                    success: function (response) {
                        if (response == '1') {
                            alertG('Record Updated...!');
                        }
                    },
                    error: function (e) { alertR(e.error); }
                });
            });

            ///////////////////////////////////

            $(function () {
                $('#dvEdit').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 510,
                    width: 370,

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

                    height: 510,
                    width: 370,

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
            LoadRoot();
            function LoadRoot() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=56ǁ1",
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
                            if (itm.bIsHead=="1") {
                                hcolor = 'style="color:red"';
                            }
                            if (parseInt(itm.Code) < 10) {
                                zeros = '0';
                            }
                            else {
                                zeros = '';
                            }

                            if (itm.Branch == '0') {
                                opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '" lvl="1" cd="' + zeros + itm.Code + '" lid="' + itm.tblInvItemsID + '" nam="' + itm.Name + '" ' + spce + ' class="Nbranch">' + zeros + itm.Code + ' ' + itm.Name + '<span title="Edit" class="editor viz icon8 icomoon-icon-pencil-4" style="display:none; cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span><span title="Add New"  class="adder viz icon8 icomoon-icon-enter-2" style="display:none; cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span></li>';
                            }
                            else {
                                opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '" lvl="1" cd="' + zeros + itm.Code + '" lid="' + itm.tblInvItemsID + '" nam="' + itm.Name + '" class="branch" style="cursor: pointer; cursor: hand;"><span lid="' + itm.tblInvItemsID + '"  class="branch indicator icon8 icomoon-icon-plus-2" style="margin-left: -19px;"></span>' + zeros + itm.Code + ' ' + itm.Name + '<span  title="Edit"  class="editor viz icon8 icomoon-icon-pencil-4" style="display:none;  cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span><span  title="Add New" class="adder viz icon8 icomoon-icon-enter-2" style="display:none;  cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span><ul  ulid="' + itm.tblInvItemsID + '"></ul></li>';
                            }

                        });
                        $('#tree3').html(opt);
                        SetColors();

                    }
                });
            }
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=54ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option>'+itm.unit+'</option>';
                        });
                        $('#ddlUnit,#ddlUnitEdit').html(opt);
                        $('#ddlUnit').eComboBox();
                        $('#ddlUnitEdit').eComboBox();
                    }
                });
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
                            url: "inv.ashx/?ID=3ǁ" + lid,
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
                                        opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '"  lvl="' + lvl + '" cd="' + c3 + '" lid="' + itm.tblInvItemsID + '" nam="' + itm.Name + '" ' + spce + '>' + c3 + ' ' + itm.Name + '<span title="Edit"  class="editor viz icon8 icomoon-icon-pencil-4" style="display:none; cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span><span  title="Add New"  class="adder viz icon8 icomoon-icon-enter-2" style="display:none; cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span></li>';
                                    }
                                    else {
                                        opt += '<li ' + hcolor + ' h="' + itm.bIsHead + '"  lvl="' + lvl + '" cd="' + c3 + '" lid="' + itm.tblInvItemsID + '" nam="' + itm.Name + '" class="branch" style="cursor: pointer; cursor: hand;"><span lid="' + itm.tblInvItemsID + '" class="branch indicator icon8 icomoon-icon-plus-2" style="margin-left: -19px;"></span>' + c3 + ' ' + itm.Name + '<span  title="Edit"  class="editor viz icon8 icomoon-icon-pencil-4" style="display:none; cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span><span title="Add New"  class="adder viz icon8 icomoon-icon-enter-2" style="display:none; cursor: pointer;" lid="' + itm.tblInvItemsID + '"></span><ul  ulid="' + itm.tblInvItemsID + '"></ul></li>';
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

            function SetColors()
            {
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

            $('.editor').live('click', function () {
                var lid = $(this).attr('lid');
                var $li = $('li[lid=' + lid + ']');
                $('#txtItemCode').val($li.attr('cd'));
                $('#txtItemName').val($li.attr('nam'));
                $('#btnUpdateNode').attr('lid', lid);
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=19ǁ" + $('#btnUpdateNode').attr('lid'),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $('#ddlUnitEdit').val(jd[0].Unit);
                        $('#txtGENERIC_NAME').val(jd[0].GENERIC_NAME);
                        $('#txtAlertEdit').val(jd[0].MinStockLevel);
                        $('#txtMenufecturerEdit').val(jd[0].Menufecturer);
                        $('#txtDescriptionEdit').val(jd[0].Description);




                        if ($li.attr('h') == 'true') {
                            $('#chkUpdateHeadNode').attr('checked', 'checked');
                            $('#tdTileEdit').html('Head Name :');
                            $('.clsitmsEdit').hide();
                            $('#txtGENERIC_NAME').val('');
                            $('#ddlUnitEdit').val('');
                            $('#txtAlertEdit').val('');
                            $('#txtMenufecturerEdit').val('');
                        }
                        else {
                            $('.clsitmsEdit').show();
                            $('#chkUpdateHeadNode').removeAttr('checked');
                            $('#tdTileEdit').html('Item Name :');
                        }

                        $('#dvEdit').dialog('open');

                    }
                });


            });


            $('#btnUpdateNode').live('click', function () {
                var lid = $(this).attr('lid');
                var $li = $('li[lid=' + lid + ']');
                
                var chk = ($('#chkUpdateHeadNode').is(':checked')) ? "1" : "0";
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=58ǁ" + encodeURIComponent($('#txtItemName').val()) + "ǁ" + $('#btnUpdateNode').attr('lid') + "ǁ" + chk + "ǁ" + encodeURIComponent($('#ddlUnitEdit').val()) + "ǁ" + $('#txtAlertEdit').val() + "ǁ" + encodeURIComponent($('#txtMenufecturerEdit').val()) + "ǁ" + encodeURIComponent($('#txtDescriptionEdit').val()) + "ǁ" + encodeURIComponent($('#txtGENERIC_NAME').val()),
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


            $('.adder').live('click', function () {
                var lid = $(this).attr('lid');
                var $li = $('li[lid=' + lid + ']');
                if (parseInt($li.attr('lvl')) >= parseInt($('#txtTotalLevel').attr('tg'))) {
                    alertR('Next Level is not allowd..!')
                }
                else {
                $('#chkHeadNode').attr('checked', false);
                $('#tdTile').html('Item Name :');
                $('.clsitms').show();
                $('#txtAddItemCode').val($li.attr('cd') + '-*****');
                $('#txtIAddtemName').val('');
                $('#btnAddNode').attr('lid', lid);
                $('#dvAdd').dialog('open');}
            });


            $('#chkHeadNode').live('click', function () {
                var chk = ($('#chkHeadNode').is(':checked')) ? "1" : "0";
                if (chk=="1") {
                    $('#tdTile').html('Head Name :');
                    $('.clsitms').hide();
                }
                else {
                    $('#tdTile').html('Item Name :');
                    $('.clsitms').show();
                }
            });
            $('#chkUpdateHeadNode').live('click', function () {
                var chk = ($('#chkUpdateHeadNode').is(':checked')) ? "1" : "0";
                if (chk == "1") {
                    $('#tdTileEdit').html('Head Name :');
                    $('.clsitmsEdit').hide();
                    $('#txtAlertEdit').val('');
                    $('#txtMenufecturerEdit').val('');
                }
                else {

                    $('.clsitmsEdit').show();
                    $('#tdTileEdit').html('Item Name :');
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=19ǁ" + $('#btnUpdateNode').attr('lid'),
                        success: function (response) {
                            var jd = $.parseJSON(response), opt = '';
                            $('#ddlUnitEdit').val(jd[0].Unit);
                            $('#txtAlertEdit').val(jd[0].MinStockLevel);
                            $('#txtMenufecturerEdit').val(jd[0].Menufecturer);
                            $('#txtDescriptionEdit').val(jd[0].Description);
                        }
                    });

                }
            });
            
            $('#btnAddNode').live('click', function () {


                var chk = ($('#chkHeadNode').is(':checked')) ? "1" : "0";
                if ($('#txtIAddtemName').val()=="") {
                    alertR('Enter Valid Name..!');
                    return false;
                }
                if ($('#ddlUnit').val() == '{NEW ELEMENT}' || $('#ddlUnit').val() == '' || $('#ddlUnit').val() == undefined) {
                    alertR('Enter Valid Unit..!');
                    return false;
                }
                var minstok = 0, manufect = "0";
                var lid = $(this).attr('lid');
                if (lid == 'NULL') {
                    if (chk == "1") {
                        minstok = 0;
                        manufect = "0";

                        $('#txtAddGENERIC_NAME').val('');
                    }
                    else {
                        minstok = $('#txtAlert').val();
                        manufect= encodeURIComponent($('#txtMenufecturer').val())
                    }
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=57ǁ" + encodeURIComponent($('#txtIAddtemName').val()) + "ǁ" + $('#btnAddNode').attr('lid') + "ǁ" + chk + "ǁ" + encodeURIComponent($('#ddlUnit').val()) + "ǁ" + minstok + "ǁ" + manufect + "ǁ" + encodeURIComponent($('#txtDescription').val()) + "ǁ" + encodeURIComponent($('#txtAddGENERIC_NAME').val()),
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
                    if (chk == "1") {
                        minstok = 0;
                        manufect = "0";
                    }
                    else {
                        minstok = $('#txtAlert').val();
                        manufect = encodeURIComponent($('#txtMenufecturer').val())
                    }
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=57ǁ" + encodeURIComponent($('#txtIAddtemName').val()) + "ǁ" + $('#btnAddNode').attr('lid') + "ǁ" + chk + "ǁ" + encodeURIComponent($('#ddlUnit').val()) + "ǁ" + minstok + "ǁ" + manufect + "ǁ" + encodeURIComponent($('#txtDescription').val()) + "ǁ" + encodeURIComponent($('#txtAddGENERIC_NAME').val()),
                        success: function (response) {
                            var r = response.split("½");
                            //var $ul = //<ul  ulid="' + itm.tblInvItemsID + '"></ul>
                            if ($li.hasClass('branch')) {
                                var $ul = $('ul[ulid=' + lid + ']');
                                $ul.html('');
                            }
                            else {
                                $li.addClass('branch');
                                //hand icon
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

            $('#btnAddNodeClose').live('click', function () { $('#dvAdd').dialog('close'); });
            $('#btnAddRoot').live('click', function (e) {
                e.preventDefault();
                $('#txtAddItemCode').val('Root');
                $('#txtIAddtemName').val('');
                $('#btnAddNode').attr('lid', 'NULL');
                $('#dvAdd').dialog('open');
            });
        });//End of ready function
    </script>
</asp:Content>
