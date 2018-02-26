<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="Testi.aspx.cs" Inherits="FRDP.Testi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <script>
      // Tooltip
      //$(function () {
      //    // Default tooltip settings
      //    var offsetX = 15;
      //    var offsetY = 25;
      //    var TooltipOpacity = 0.9;

      //    // Select all tags having a title attribute
      //    $('[title]').mouseenter(function (e) {

      //        // Get the value of the title attribute
      //        var Tooltip = $(this).attr('title');
      //        if (Tooltip !== '') {
      //            // Tooltip exists. Assign it to a custom attribute
      //            $(this).attr('customTooltip', Tooltip);

      //            // Empty title attribute (to ensure that native browser tooltip is not shown)
      //            $(this).attr('title', '');
      //        }

      //        // Assign customTooltip to variable
      //        var customTooltip = $(this).attr('customTooltip');

      //        // Tooltip exists?
      //        if (customTooltip !== '') {
      //            // Append tooltip element to body
      //            $("body").append('<div id="tooltip">' + customTooltip + '</div>');

      //            // Set X and Y coordinates for Tooltip
      //            $('#tooltip').css('left', e.pageX + offsetX);
      //            $('#tooltip').css('top', e.pageY + offsetY);

      //            // FadeIn effect for Tooltip
      //           $('#tooltip').fadeIn('500');
      //           $('#tooltip').fadeTo('10', TooltipOpacity);
      //        }

      //    }).mousemove(function (e) {
      //        var X = e.pageX;
      //        var Y = e.pageY;
      //        var tipToBottom, tipToRight;

      //        // Distance to the right
      //        tipToRight = $(window).width() - (X + offsetX + $('#tooltip').outerWidth() + 5);

      //        // Tooltip too close to the right?
      //        if (tipToRight < offsetX) {
      //            X = e.pageX + tipToRight;
      //        }

      //        // Distance to the bottom
      //        tipToBottom = $(window).height() - (Y + offsetY + $('#tooltip').outerHeight() + 5);

      //        // Tooltip too close to the bottom?
      //        if (tipToBottom < offsetY) {
      //            Y = e.pageY + tipToBottom;
      //        }

      //        // Assign tooltip position
      //        $('#tooltip').css('left', X + offsetX);
      //        $('#tooltip').css('top', Y + offsetY);

      //    }).mouseleave(function () {
      //        // Remove tooltip element
      //        $("body").children('div#tooltip').remove();
      //    });
      //});
</script>
<style>
/*html, body {
	font: small/150% "Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, Verdana, sans-serif;
	text-align: left;
	width: 100%;
	min-height: 100%;
	height: 100%;
	color: #293644;
	padding:0;
	margin:0;
}
.container {
	padding: 10px;
}*/

/* Tooltip */
#tooltip {
	position:absolute;
	z-index:9999;
	opacity: .0;
	filter: alpha(opacity=00);
	-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=00)";
	
	/* Edit from here */
	width :auto;
	background-color:#FFFFFF;
	border:1px solid #cccccc;
    border-radius:4px;
	padding: 3px;
	-moz-box-shadow: 2px 2px 11px #666;
	-webkit-box-shadow: 2px 2px 11px #666;	
}

</style>
<div class="container">
<p>
Lorem ipsum nam lorem debitis ut, postulant <a href="" title="<strong>Iriure </strong>appetere<br />menandri ei duo,<br />ad per <em>sumo </em>solum tibique?">vulputate his cu</a>, sit mutat accumsan ne. Vis ea sapientem assentior prodesset. Sea ex oratio accumsan, ne per zzril doming, pri ne periculis corrumpit reprimique? Fugit legimus dignissim ad cum, eruditi invidunt urbanitas pri te.
</p>
<p>
Cum ea mundi bonorum <a href="" title="Sea ex <strong>oratio </strong>accumsan">reprehendunt</a>, no elitr fabulas rationibus pro, vix tale sint id. 
</p>
</div>
    <input id="Text1" title="Hello<br>World" type="text" />
    
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</asp:Content>
