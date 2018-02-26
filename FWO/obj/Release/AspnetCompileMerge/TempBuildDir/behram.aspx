<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="behram.aspx.cs" Inherits="FRDP.behram" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input id="File1" type="file" /><input id="btnUpload" class="btn btn-info" type="button" value="Upload EFS.apk" /><br /><br />
    <asp:TextBox ID="TextBox1" runat="server" Height="200px" TextMode="MultiLine" Width="434px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <br />
    <asp:TextBox ID="TextBox2" runat="server" Height="92px" TextMode="MultiLine" Width="441px"></asp:TextBox>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnUpload').live('click', function () {
                //e.preventDefault();
                //alert("Called");
                var uploadfiles = $("#File1").get(0);
                var uploadedfiles = uploadfiles.files
                if (uploadedfiles.length > 0) {
                    var ex = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
                    var ctrlVals = ex;
                    var fromdata = new FormData();
                    fromdata.append("vls", ctrlVals);
                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                    var choice = {};
                    choice.url = "BehramGH.ashx";
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
                else {
                    alertR('Attach Some APK..!')
                }
            });
        });
    </script>
</asp:Content>
