<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="EmployeeReg.aspx.cs" Inherits="FRDP.EmployeeReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="plugins/misc/jcrop/js/jquery.Jcrop.js"></script>
    <link href="plugins/misc/jcrop/css/jquery.Jcrop.css" rel="stylesheet" />
    <style type="text/css">

/* Apply these styles only when #preview-pane has
   been placed within the Jcrop widget */
.jcrop-holder #preview-pane {
  display: block;
  /*position: absolute;*/
  z-index: 2000;
  top: 10px;
  right: -280px;
  padding: 6px;
  border: 1px rgba(0,0,0,.4) solid;
  background-color: white;

  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;

  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

/* The Javascript code will set the aspect ratio of the crop
   area based on the size of the thumbnail preview,
   specified here */
#preview-pane .preview-container {
  /*width: 250px;*/
  /*height: 170px;*/
  overflow: hidden;
}
</style>
    <div id="dvCrop" title="cropImage" style="display:none;">
        <img id="target" alt="" src="" style="min-width:500px; max-width:500px; min-height:500px; max-height:500px;" />
        <input type="button" id="btnCrop" value="Crop" style="display: none" />
    </div>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Employee Information</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <p style="margin-left: 20px;">Employee #
                        <input id="txtEmpNo" type="text" class="txtcs frmCtrl" tg="1" />&nbsp;&nbsp;<img id="validation" alt="" src="images/ajax_fb_loader.gif" style="display:none;" /></p>
                    <div class="page-header" style="margin-left: 20px; margin-right: 20px;">
                        <h5>Employee Personal Info</h5>
                    </div>
                    <table class="responsive" style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
    <tr>
        <td style="width:100px;" rowspan="7">
            <div class="jcrop-holder">
              <div id="preview-pane">
    <div class="preview-container">
      <%--<img id="imgX1" src="images/Users/18B.png" class="jcrop-preview" alt="Preview" />--%>
        <canvas id="canvas" width="100px" height="100px"></canvas>
    </div>
  </div></div>
        </td>
        <td colspan="2"><strong>Employee Name:-</strong></td>
        <td style="width:100px;">&nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <select id="ddlPrefix" name="D1">
                <option>Mr.</option>
<option>Mrs.</option>
<option>Miss</option>
<option>Dr.</option>
<option>Ms.</option>
<option>Prof.</option>
<option>Rev.</option>
<option>Lady</option>
<option>Sir</option>
<option>Capt.</option>
<option>Major</option>
<option>Lt.-Col.</option>
<option>Col.</option>
<option>Lady</option>
<option>Lt.-Cmdr.</option>
<option>The Hon.</option>
<option>Cmdr.</option>
<option>Flt. Lt.</option>
<option>Brgdr.</option>
<option>Judge</option>
<option>Lord</option>
<option>The Hon. Mrs</option>
<option>Wng. Cmdr.</option>
<option>Group Capt.</option>
<option>Rt. Hon. Lord</option>
<option>Revd. Father</option>
<option>Revd Canon</option>
<option>Maj.-Gen.</option>
<option>Air Cdre.</option>
<option>Viscount</option>
<option>Dame</option>
<option>Rear Admrl.</option>
            </select></td>
        <td style=" width: 220px;">
            <input id="txtEF" placeholder="First Name" type="text" /></td>
        <td>
            <input id="txtEM" placeholder="Middle Name" type="text" /></td>
        <td>
            <input id="txtEL" placeholder="Last Name" type="text" /></td>
    </tr>
    <tr>
        <td colspan="2"><strong>Relation:-</strong></td>
        <td>&nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
        <tr>
            <td>
                <select id="ddlRelation" name="D2">
                    <option>S/O</option>
                    <option>D/O</option>
                    <option>W/O</option>
                    <option></option>
                </select></td>
            <td><input id="txtRF" placeholder="First Name" type="text" /></td>
            <td>
                <input id="txtRM" placeholder="Middle Name" type="text" /></td>
            <td><input id="txtRL" placeholder="Last Name" type="text"  /></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <input id="FileUpload1" accept=".jpg,.png,.gif" type="file" /></td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>b</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>c&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table><br />
                </div>

            </div>

        </div>
    </div>
        <input type="hidden" name="imgX1" id="imgX1" />
    <input type="hidden" name="imgY1" id="imgY1" />
    <input type="hidden" name="imgWidth" id="imgWidth" />
    <input type="hidden" name="imgHeight" id="imgHeight" />
    <input type="hidden" name="imgCropped" id="imgCropped" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                $('#dvCrop').dialog({
                    autoOpen: false,
                    modal: true,

                    height: 560,
                    width: 550,

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
            $('#txtEmpNo').live('focusout', function () {
                if ($.trim($(this).val()) != "") {

                    $('#validation').attr('src', 'images/ajax_fb_loader.gif').show();
                    $.ajax({
                        type: "POST",
                        url: "EmpReg.ashx/?ID=0ǁ" + $('#txtEmpNo').val(),
                        success: function (response) {
                            if (response=="1") {
                                $('#validation').attr('src', 'images/ok.png').show();
                                $('#txtEmpNo').attr('tg', '0');
                            }
                            else {
                                $('#validation').attr('src', 'images/exists.png').show();
                                $('#txtEmpNo').attr('tg', '1');
                            }
                        }
                    });
                }
                else {
                    $('#validation').hide();
                    $('#txtEmpNo').attr('tg', '1');
                }
                
            });


            $('#FileUpload1').live('change', function () {
                var reader = new FileReader();
                reader.onload = function (e) {
                var jcrop_api,
                boundx,
                boundy,
                // Grab some information about the preview pane
                $preview = $('#preview-pane'),
                $pcnt = $('#preview-pane .preview-container'),
                $pimg = $('#preview-pane .preview-container img'),
                xsize = $pcnt.width(),
                ysize = $pcnt.height();

                    $('#dvCrop').dialog('open');
                    $('#target').show();
                    $('#target').attr("src", e.target.result);
                    $('#target').Jcrop({
                        onChange: SetCoordinates,
                        onSelect: SetCoordinates,
                        aspectRatio: xsize / ysize
                    }, function () {
                        var bounds = this.getBounds();
                        boundx = bounds[0];
                        boundy = bounds[1];
                        jcrop_api = this;
                        //$preview.appendTo(jcrop_api.ui.holder);
                        
                        //preview.appendTo(jcrop_api.ui.holder);
                        var xxx=  $preview.parent();
                        xxx.html($preview[0]);
                        //$preview.appendTo($('.preview-container img'));
                        //alert($preview);
                    });
                }
              reader.readAsDataURL($(this)[0].files[0]);
            });
            function SetCoordinates(c) {
                //if (parseInt(c.w) > 0) {
                    //var rx = xsize / c.w;
                    //var ry = ysize / c.h;

                    //$pimg.css({
                    //    width: Math.round(rx * boundx) + 'px',
                    //    height: Math.round(ry * boundy) + 'px',
                    //    marginLeft: '-' + Math.round(rx * c.x) + 'px',
                    //    marginTop: '-' + Math.round(ry * c.y) + 'px'
                    //});
                //}
                $('#imgX1').val(c.x);
                $('#imgY1').val(c.y);
                $('#imgWidth').val(c.w);
                $('#imgHeight').val(c.h);
                $('#btnCrop').show();


                //var x1 = $('#imgX1').val();
                //var y1 = $('#imgY1').val();
                //var width = $('#imgWidth').val();
                //var height = $('#imgHeight').val();
                //var canvas = $("#canvas")[0];
                //var context = canvas.getContext('2d');
                //var img = new Image();
                //img.onload = function () {
                //    //canvas.height = c.h;
                //    //canvas.width = c.w;
                //    context.drawImage(img, c.x, c.y, c.w, c.h, 0, 0, c.w, c.h);
                //    $('#imgCropped').val(canvas.toDataURL());
                //    //$('[id*=btnUpload]').show();
                //};
                //img.src = $('#Image1').attr("src");
            };

            $('#btnCrop').click(function () {
                var x1 = $('#imgX1').val();
                var y1 = $('#imgY1').val();
                var width = $('#imgWidth').val();
                var height = $('#imgHeight').val();
                var canvas = $("#canvas")[0];
                var context = canvas.getContext('2d');
                var img = new Image();
                img.onload = function () {
                    canvas.height = height;
                    canvas.width = width;
                    context.drawImage(img, x1, y1, width, height, 0, 0, width, height);
                    $('#imgCropped').val(canvas.toDataURL());
                   // $('[id*=btnUpload]').show();
                };
                img.src = $('#Image1').attr("src");
            });

        });//End of DocReadys
    </script>
</asp:Content>
