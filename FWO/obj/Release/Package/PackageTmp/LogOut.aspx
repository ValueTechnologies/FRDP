<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogOut.aspx.cs" Inherits="FRDP.LogOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>--%>
    <script src="assets/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "LogOut.aspx/RemoveAllCookies",
                data: "{}",
                success: function (response) {
                    var jd = $.parseJSON(response.d);
                    $.each(jd, function (i, j) {
                       // $.removeCookie("'"+j+"'");
                       $.cookie(j, null);
                    });

                    window.location.href = "default.aspx";
                },
                error: function () { window.location.href = "default.aspx"; }
            });
        });
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>