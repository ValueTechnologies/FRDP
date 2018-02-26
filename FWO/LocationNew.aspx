<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="LocationNew.aspx.cs" Inherits="FRDP.LocationNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    &nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .accordion-inner {
  padding: 9px 0px 0px 20px; !important;
}
    </style>
      

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon24 wpzoom-earth"></span>
                        <span>Geographical Area</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div class="accordion" id="dvHead"></div>
                </div>

            </div>
            <!-- End .box -->

        </div>
    </div>

    <div id="dvLocation" title="Geographical Area" style="display: none">
        <table style="width: 100%">
            <tr>
                <td style="width: 100px">Location Name</td>
                <td>
                    <input id="txtLoc" class="vl" style="width: 90%" type="text" /></td>
                <td style="width: 120px; text-align: right;">Coordinates</td>
                <td>
                    <input id="txtLat" class="vl" type="text" readonly="readonly" value="0,0" /></td>
            </tr>
            <tr>
                <td>SVG Path</td>
                <td>
                    <input id="txtPath" class="vl" style="width: 90%" type="text" /></td>
                <td style="width: 120px; text-align: right;" class="dvPop">Population</td>
                <td>
                    <input id="txtPopulation" class="vl dvPop" type="text"/></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="3" style="text-align: right">
                    <input id="btnSave" class="ButtonClass" type="button" value="Save " />
                    <input class="ButtonClass btnX" type="button" value="Cancel" /></td>
            </tr>
        </table>
        <div id='dvmap' style="width: 100%; height: 340px;"></div>
    </div>

    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            $('.dvPop').hide();

            //$('#TB_overlay').hide();
            $(function () {
                $('.heading	h3').html('Geographical Area');
            });

            $(function () {
                $('#dvLocation').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 530,
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


            LoadProv();
            function LoadProv() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/LocProv",
                    data: "{}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";

                        $.each(jdata, function (i, item) {
                            // output = output + '<h3 class="hProv1" tbl=1 tag="' + item.LocID + '"><b>Country : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="dReg"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hProv1" tbl=1 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#dvHead" href="#tbl1' + item.LocID + '">\
                                                <b>Country : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl1' + item.LocID + '" class="accordion-body collapse" style="height: 0px; ">\
                                                <div class="accordion-inner">\
                                <div id="id1' + item.LocID + '" class="accordion dReg"></div>\
                                </div>\
                              </div>\
                            </div>'
                        });
                        $('#dvHead').html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="1" parent="NULL" >Add New Country</div>');
                    }
                });
            }


            $(".hProv1").live('click', function (e) {
                $('#AddLoc input:text').val('');
                var me = $(this);
                //var dp = $(this).attr('id');
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getlocProvince",
                    data: "{'TypeID':'" + me.attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";

                        $.each(jdata, function (i, item) {
                            // output = output + '<h3 class="hProv" tbl=2 tag="' + item.LocID + '"><b>Province : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="dDistt1"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hProv" tbl=2 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#id1' + me.attr('tag') + '" href="#tbl2' + item.LocID + '">\
                                                <b>Province : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl2' + item.LocID + '" class="accordion-body collapse" style="height: 0px; ">\
                                                <div class="accordion-inner">\
                                <div id="id2' + item.LocID + '" class="accordion dDistt1"></div>\
                                </div>\
                              </div>\
                            </div>'
                        });
                        $("#id1" + me.attr('tag')).html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="2" parent="' + me.attr('tag') + '">Add New Province</div>');
                    }
                });
            });



            $(".hProv").live('click', function (e) {
                $('#AddLoc input:text').val('');
                var me = $(this);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getlocRegion",
                    data: "{'TypeID':'" + me.attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";

                        $.each(jdata, function (i, item) {
                            //output = output + '<h3 class="hReg" tbl=3 tag="' + item.LocID + '"><b>Region : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="dDistt"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hReg" tbl=3 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#id2' + me.attr('tag') + '" href="#tbl3' + item.LocID + '">\
                                                <b>Region : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl3' + item.LocID + '" class="accordion-body collapse" style="height: 0px; ">\
                                                <div class="accordion-inner">\
                                <div id="id3' + item.LocID + '"  class="accordion dDistt"></div>\
                                </div>\
                              </div>\
                            </div>'
                        });
                        //me.next().html(output + '<h3 class="AddLoc" typ="3" parent="' + me.attr('tag') + '">Add New Region</h3>');
                        $("#id2" + me.attr('tag')).html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="3" parent="' + me.attr('tag') + '">Add New Region</div>');
                    }
                });
            });

            $(".hReg").live('click', function (e) {
                $('#AddLoc input:text').val('');
                var me = $(this);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getlocDistrict",
                    data: "{'TypeID':'" + me.attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";

                        $.each(jdata, function (i, item) {
                            // output = output + '<h3 class="hDistt" tbl=4 tag="' + item.LocID + '"><b>District : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="dTehsil"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hDistt" tbl=4 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#id3' + me.attr('tag') + '" href="#tbl4' + item.LocID + '">\
                                                <b>District : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl4' + item.LocID + '" class="accordion-body collapse" style="height: 0px; ">\
                                                <div class="accordion-inner">\
                                            <div id="id4' + item.LocID + '"  class="accordion dTehsil"></div>\
                                </div>\
                              </div>\
                            </div>'
                        });
                        //me.next().html(output + '<h3 class="AddLoc" typ="4" parent="' + me.attr('tag') + '">Add New District</h3>');
                        $('#id3' + me.attr('tag')).html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="4" parent="' + me.attr('tag') + '">Add New District</div>');

                    }
                });
            });
            $(".hDistt").live('click', function (e) {
                var me = $(this);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getlocTehsil",
                    data: "{'TypeID':'" + me.attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";

                        $.each(jdata, function (i, item) {
                            //  output = output + '<h3 class="hTehsil" tbl=5 tag="' + item.LocID + '"><b>Tehsil : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="dFU"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hTehsil" tbl=5 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#id4' + me.attr('tag') + '" href="#tbl5' + item.LocID + '">\
                                                <b>Tehsil : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl5' + item.LocID + '" class="accordion-body collapse" style="height: 0px; ">\
                                                <div class="accordion-inner">\
                                <div id="id5' + item.LocID + '"  class="accordion dFU"></div>\
                                </div>\
                              </div>\
                            </div>'
                        });
                       // me.next().html(output + '<h3 class="AddLoc" typ="5" parent="' + me.attr('tag') + '">Add New Tehsil</h3>');
                        $('#id4' + me.attr('tag')).html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="5" parent="' + me.attr('tag') + '">Add New Tehsil</div>');
                    }
                });
            });
            $(".hTehsil").live('click', function (e) {
                var me = $(this);

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getlocFeildUnit",
                    data: "{'TypeID':'" + me.attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";

                        $.each(jdata, function (i, item) {
                            //  output = output + '<h3 class="hFU" tbl=6 tag="' + item.LocID + '"><b>Field Unit : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="dUC"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hFU" tbl=6 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#id5' + me.attr('tag') + '" href="#tbl6' + item.LocID + '">\
                                                <b>Field Unit : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl6' + item.LocID + '" class="accordion-body collapse" style="height: 0px; ">\
                                                <div class="accordion-inner">\
                               <div id="id6' + item.LocID + '"  class="accordion dUC"></div>\
                                </div>\
                              </div>\
                            </div>'
                        });
                        //me.next().html(output + '<h3 class="AddLoc" typ="6" parent="' + me.attr('tag') + '">Add New Field Unit</h3>');
                        $('#id5' + me.attr('tag')).html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="6" parent="' + me.attr('tag') + '">Add New Field Unit</div>');
                    }
                });
            });
            $(".hFU").live('click', function (e) {
                var me = $(this);

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getlocUnionConcil",
                    data: "{'TypeID':'" + me.attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";

                        $.each(jdata, function (i, item) {
                            // output = output + '<h3 class="hUC" tbl=7 tag="' + item.LocID + '"><b>Union Council : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="dVillage"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hUC" tbl=7 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#id6' + me.attr('tag') + '" href="#tbl7' + item.LocID + '">\
                                                <b>Union Council : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl7' + item.LocID + '"  class="accordion-body collapse" style="height: 0px; ">\
                                                <div class="accordion-inner">\
                               <div id="id7' + item.LocID + '"  class="accordion dUC"></div>\
                                </div>\
                              </div>\
                            </div>'
                        });
                        $('#id6' + me.attr('tag')).html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="7" parent="' + me.attr('tag') + '">Add New Union Council</div>');
                    }
                });
            });
            $(".hUC").live('click', function (e) {
                var me = $(this);
                //alert(me.attr('tag'));
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getlocVillageCity",
                    data: "{'TypeID':'" + me.attr('tag') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d), output = "";
                        //alert(jdata);
                        $.each(jdata, function (i, item) {
                            // output = output + '<h3 class="hVillage" tbl=8 tag="' + item.LocID + '"><b>Village : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" /></h3><div class="csvillage"></div>';
                            output += '<div class="accordion-group" style="margin-top: 15px;">\
                                              <div class="accordion-heading hVillage" tbl=8 tag="' + item.LocID + '">\
                                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#id7' + me.attr('tag') + '" href="#tbl8' + item.LocID + '">\
                                                <b>Village : </b>' + item.LocName + '<img class="btnEd" src="images/Comments-edit.ico" style="float: right;" />\
                                              </a>\
                                              </div>\
                                              <div id="tbl8' + item.LocID + '" class="accordion-body collapse" style="height: 0px; ">\
                                               <div class="accordion-inner"> \
                               <div id="id8' + item.LocID + '"  class="accordion csvillage"></div>\
                                </div>\
                              </div>\
                            </div>'
                            
                        });
                        //alert(output);
                       // me.next().html(output + '<h3 class="AddLoc" typ="8"  parent="' + me.attr('tag') + '">Add New Village</h3>');
                        $('#id7' + me.attr('tag')).html(output + '<div class="AddLoc accordion-heading" style="background: beige;" typ="8"  parent="' + me.attr('tag') + '">Add New Village</div>');
                        //$('#id7' + me.attr('tag')).html('abc');
                    }
                });
            });
            $('#dvLocation').on('dialogclose', function () {
                $('.dvPop').hide();
            });
            $("#btnSave").click(function () {
                var Loc = $('#txtLoc').val();
                var Latude = $('#txtLat').val();
                var Path = $('#txtPath').val();
                if (Loc == '') {
                    alert("Please Enter Location Name ...");
                    return false;
                }
                if (Latude == '') {
                    alert("Please Enter Coordinates ...");
                    return false;
                }
                if (Path == '') {
                    alert("Please Enter SVG Path...");
                    return false;
                }
                if ($("#btnSave").val() == 'Save') {

                    $.ajax({
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        url: "LocationNew.aspx/AddLoc",
                        data: "{'Loc':'" + Loc + "','Latude':'" + Latude + "','Path':'" + Path + "','TypeID':'" + $('#txtLoc').attr('typ') + "','ParentID':'" + $('#txtLoc').attr('parent') + "','Population' : '" + $('#txtPopulation').val() + "'}",
                        async: false,
                        success: function (responseText) {
                            if (responseText.d == "1") {
                                if ($('#txtLoc').attr('typ') == "1") { LoadProv(); } else { Obj.trigger('click'); }
                                $('#dvLocation').dialog("close");
                                $('.vl').val('');
                            }
                            else {
                                if ($('#txtLoc').attr('typ') == "1") { LoadProv(); } else { Obj.trigger('click'); }
                                $('#dvLocation').dialog("close");
                                $('.vl').val('');
                                alert("Name Already Exists");
                            }

                            //Error: {
                            //    alert("Name Already Exists");
                            //}
                        }
                    });


                } else {

                    $.ajax({
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        url: "LocationNew.aspx/UpdateLoc",
                        data: "{'Loc':'" + Loc + "','Latude':'" + Latude + "','Path':'" + Path + "','LocID':'" + Obj.attr('tag') + "','tbl':'" + Obj.attr('tbl') + "', 'Population' : '" + $('#txtPopulation').val() + "'}",
                        async: false,
                        success: function (responseText) {
                            if ($('#txtLoc').attr('typ') == "1") { LoadProv(); } else { Obj.parent().prev().trigger('click'); }
                            $('#dvLocation').dialog("close");
                            $('.vl').val('');
                        }
                    });
                }
            });







            var Obj;
            $(".AddLoc").live('click', function (e) {
                Obj = $(this).parent().prev();
                $('#txtLoc').attr('typ', $(this).attr('typ'));
                $('#txtLoc').attr('parent', $(this).attr('parent'));
                $("#btnSave").val('Save');
                $('.vl').val('');
                $("#txtLat").val('0,0');
                $('#dvLocation').dialog("open");
                if ($(this).attr('typ') == '8') {
                    $('.dvPop').show();
                }
                var geocoder, map, marker;
                geocoder = new google.maps.Geocoder();
                var myLatlng = new google.maps.LatLng(33.75346059828491, 73.09427261352539);
                var myOptions = {
                    zoom: 6,
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                map = new google.maps.Map(document.getElementById("dvmap"), myOptions);
                marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map
                });
                var message = "Here will be the uploaded pictures of... ";
                var info = message;
                var infoWindow = new google.maps.InfoWindow({
                    content: message
                });

                google.maps.event.addListener(map, 'click', function (event) {
                    marker.setVisible(false);
                    temp = event;
                    marker = new google.maps.Marker({ position: event.latLng, map: map });
                    $('#txtLat').val(event.latLng.lat() + ',' + event.latLng.lng());
                });

            });
            $(".btnX").live('click', function (e) {
                $('#dvLocation').dialog("close");
            });


            $(".btnEd").live('click', function (e) {
                Obj = $(this).parent().closest('.accordion-heading');
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LocationNew.aspx/getRec",
                    // data: "{'LocID':'" + Obj.attr('tag') + "'}",
                    data: "{'LocID':'" + Obj.attr('tag') + "','tbl':'" + Obj.attr('tbl') + "'}",
                    async: false,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText.d);
                        $('#txtLoc').val(jdata[0].LocName);
                        $('#txtLat').val(jdata[0].Lat);
                        $('#txtPath').val(jdata[0].Path);
                        $('#txtLoc').attr('typ', jdata[0].TypeID);
                        $('#txtPopulation').val(jdata[0].Population);
                        $("#btnSave").val('Update');
                        $('#dvLocation').dialog("open");
                        if ($('#txtLoc').attr('typ') == '8') {
                            $('.dvPop').show();
                        }
                        /*load location on google map */
                        var geocoder, map, marker;
                        geocoder = new google.maps.Geocoder();
                        var myLatlng = new google.maps.LatLng(jdata[0].Lat.split(',')[0], jdata[0].Lat.split(',')[1]);
                        var myOptions = {
                            zoom: 6,
                            center: myLatlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        }
                        map = new google.maps.Map(document.getElementById("dvmap"), myOptions);
                        marker = new google.maps.Marker({
                            position: myLatlng,
                            map: map
                        });
                        var message = "Here will be the uploaded pictures of... ";
                        var info = message;
                        var infoWindow = new google.maps.InfoWindow({
                            content: message
                        });

                        google.maps.event.addListener(map, 'click', function (event) {
                            marker.setVisible(false);
                            temp = event;
                            marker = new google.maps.Marker({ position: event.latLng, map: map });
                            $('#txtLat').val(event.latLng.lat() + ',' + event.latLng.lng());
                        });
                    }
                });

            });
        });//// END OF READY
    </script>

</asp:Content>
