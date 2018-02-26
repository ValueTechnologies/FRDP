
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind ="Default.aspx.cs" Inherits="FRDP.Default" %>


<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

    <meta charset="utf-8">
    <title>FRDP-(MIS)</title>
    <%--<link rel="shortcut icon" href="images/logo.png" />--%>
    <link rel="shortcut icon" href="images/favi.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->

    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/supersized.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="css/shine/shinestyle.css" rel="stylesheet" />
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->


    <style type="text/css">
        #canvas-wrap { position:relative; z-index:9!important;} /* Make this a positioned parent */
        #overlay     { position:absolute; top:25%; left:40%;z-index:9999999!important; }

    </style>
</head>

<body style="background-repeat: no-repeat; background-attachment: fixed; background-position: center;" id="header" class="big with-separation-bottom black-box">


    <div id="canvas-wrap leaves">
    <canvas width="1366" id="header-canvas"></canvas>
    <div id="overlay">

<%--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa--%>

    <form id="From1" runat="server">


        <div class="page-container">
            
<%--           <form action="" method="post">
                <img src="Images/progress1.png" />
                <asp:TextBox ID="txtUser" runat="server" CssClass="username" placeholder="Username"  style="display:none;"></asp:TextBox>
                <asp:TextBox ID="txtPass" runat="server" placeholder="Password" CssClass="password" onkeypress="javascript:if (event.keyCode == 13) __doPostBack('ctl00$SheetContentPlaceHolder$btnLogin','')" TextMode="Password"  style="display:none;"></asp:TextBox>
                <asp:Button ID="btnLogin" CssClass="button" runat="server" Text="Login" OnClick="btnLogin_Click"  style="display:none;" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Label ID="lblMsg" runat="server" Style="color: #FF0000" Text="Invalid User Name or Password" Visible="False"></asp:Label>
                <div class="error"><span>+</span></div>
            </form>--%>
           
             <form action="" method="post">
                <asp:TextBox ID="txtUser" runat="server" CssClass="username" placeholder="Username" ></asp:TextBox>
                <asp:TextBox ID="txtPass" runat="server" placeholder="Password" CssClass="password" onkeypress="javascript:if (event.keyCode == 13) __doPostBack('ctl00$SheetContentPlaceHolder$btnLogin','')" TextMode="Password" ></asp:TextBox>
                <asp:Button ID="btnLogin" CssClass="button" runat="server" Text="Login" OnClick="btnLogin_Click"  />
                <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                <asp:Label ID="lblMsg" runat="server" Style="color: #FF0000" Text="Invalid User Name or Password" Visible="False"></asp:Label>
                <div class="error"><span>+</span></div>
            </form>

            <div class="connect">
                <p>
                    <a style="margin-left: -70px; font-size: small;" href="http://valuetechnologies.org/">Developed & Design by Value Technologies</a>
                </p>
            </div>
        </div>
    </form>
<%--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa--%>
    </div>
    </div>


    <div style="float: right; position: absolute; top: 10px; left: 0px;">
<%--        <img alt="" src="images/_logo.png" style="float: left; margin-left: 17px; margin-top: 15px; background-color: white; opacity: .76; border-radius: 12px;" />--%>
        <img alt="" src="images/EG1.png" style="float: left; margin-left: 17px; margin-top: 15px; background-color: white; opacity: .6; border-radius: 12px;

-webkit-box-shadow: 8px 11px 20px -2px rgba(0,0,0,0.64);
-moz-box-shadow: 8px 11px 20px -2px rgba(0,0,0,0.64);
box-shadow: 8px 11px 20px -2px rgba(0,0,0,0.64);

" />
    </div>


    <div style="float: right; position: absolute; bottom: 15px; right: 0px;">
        <img alt="" src="images/vt.png" style="background-color: white; border-radius: 12px; /*opacity: 0.5;*/ margin-right: 15px; width: 120px;
-webkit-box-shadow: 8px 11px 20px -2px rgba(0,0,0,0.64);
-moz-box-shadow: 8px 11px 20px -2px rgba(0,0,0,0.64);
box-shadow: 8px 11px 20px -2px rgba(0,0,0,0.64);
" />
    </div>




</body>
<!-- Javascript -->
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/js/supersized.3.2.7.min.js"></script>
<script src="assets/js/supersized-init.js"></script>
<script src="assets/js/scripts.js"></script>
<script src="css/shine/plugins.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>


<%--<script src="assets/icons/js/animation-fix.js"></script>--%>
<%--<script src="assets/icons/js/jquery-css-transform.js"></script>--%>
<%--<script src="assets/icons/js/jquery-animate-css-rotate-scale.js"></script>
<script src="assets/icons/js/rotate3Di-0.9.js"></script>
<script src="assets/icons/js/leaves_falling.js"></script>--%>
<script type="text/javascript">
   
    $(document).ready(function () {
        $.cookie("newCurrentMenu", null);
        $.cookie("newCurrentTitle", null); 
    });

//fallingLeaves();
</script>
</html>
