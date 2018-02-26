<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ED.aspx.cs" Inherits="FRDP.ED" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btnEncrypt" runat="server" Text="E" OnClick="btnEncrypt_Click" /><asp:Button ID="btnDecrypt" runat="server" Text="D" OnClick="btnDecrypt_Click" />
    </div>
    </form>
</body>
</html>
