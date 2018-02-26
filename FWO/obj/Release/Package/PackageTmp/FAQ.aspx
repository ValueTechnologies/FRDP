<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="FRDP.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        @-moz-document url-prefix() {
            #tab-1 {
                margin-top: 100px;
            }
        }
    </style>

    <div class="accordion" id="faqs"></div>


    <div class="page-header">
        <h4>Feedbacks</h4>
    </div>

    <asp:GridView ID="gvFeedBacks" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="FeedID" DataSourceID="dsFeedbacks" GridLines="None" Width="97%" ShowHeader="False">
        <Columns>
            <asp:TemplateField HeaderText="Name" SortExpression="fUser">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fComments") %>' TextMode="MultiLine" Width="97%" Height="78px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;|
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    Name :&nbsp;<asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# Bind("fUser") %>'></asp:Label>
                    &nbsp;<span style="font-size: x-small">Posted Date :
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("fDate") %>'></asp:Label>
                    </span>
                    <br />
                    email :
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("fEmail") %>'></asp:Label>
                    <br />
                    <br />
                    <b>Subject : </b>
                    <asp:Label ID="Label3" runat="server" Style="font-weight: 700" Text='<%# Bind("fSubject") %>'></asp:Label>
                    <b>
                        <br />
                    </b>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("fComments") %>'></asp:Label>
                    <br />
                    <span style="color: #C0C0C0">____________________________________________________________________</span><br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#006600" ForeColor="White" HorizontalAlign="Left" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsFeedbacks" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" DeleteCommand="DELETE FROM TblFeedback WHERE (FeedID = @FeedID)" SelectCommand="SELECT FeedID, fUser, fEmail, fSubject, fComments, CONVERT (VARCHAR(50), fDate, 103) AS fDate, isPublic FROM TblFeedback WHERE (isPublic = 1)" UpdateCommand="UPDATE TblFeedback SET fComments = @fComments, isPublic = @isPublic WHERE (FeedID = @FeedID)">
        <DeleteParameters>
            <asp:Parameter Name="FeedID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="fComments" Type="String" />
            <asp:Parameter Name="isPublic" Type="Boolean" />
            <asp:Parameter Name="FeedID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Collecting ideas and feature requests!</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="margin-left: 20px; width: 100%; margin-top: 7px;">
                        <tr>
                            <td>
                                <label for="txtUser"><strong>Name</strong></label></td>
                            <td>
                                <input id="txtUser" type="text" style="width: 470px;" disabled="disabled" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtEmail"><strong>Email Address</strong></label></td>
                            <td>
                                <input id="txtEmail" type="email" style="width: 470px;" disabled="disabled" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtSubject"><strong>Subject</strong></label></td>
                            <td>
                                <input id="txtSubject" type="text" style="width: 470px" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtFeedback"><strong>Feedback</strong></label></td>
                            <td>
                                <textarea id="txtFeedback" cols="20" name="S1" rows="2" style="width: 470px"></textarea></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <%-- <input id="btnFB" type="button" value="Submit Feedback" class="ButtonClass" />--%>
                                <button id="btnFB" value="Submit Feedback" class="btn btn-info">Submit Feedback</button><br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>

            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {



            $('#txtUser').val($.cookie("username"));
            $('#txtEmail').val($.cookie("email"));
            

            FillCategoryTable();


            function FillCategoryTable() {
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=118ǁ",


                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<div class="accordion-group">\
                              <div class="accordion-heading qs" fr="' + itm.strType + '">\
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqs" href="#collapseOne'+itm.ID+'">\
                                  ' + itm.strType + '\
                                </a>\
                              </div>\
                              <div id="collapseOne' + itm.ID + '" class="accordion-body collapse" style="height: 0px; ">\
                                <div class="accordion-inner">\
                                    <div class="qlist"  fr="' + itm.strType + '"></div>\
                                </div>\
                              </div>\
                            </div>';
                        });

                        $('#faqs').html(opt);

                    }
                });
            }

            $('.qs').live('click', function () {
                var QType = $(this).attr('fr');
                //alert(QType);
                if ($('.qlist[fr="' + QType + '"]').html() == '') {
                    Fillqlist(QType);
                }
            });

            function Fillqlist(obj) {

                //'+ itm.dtDateTime + '
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=123ǁ" + encodeURIComponent(obj),


                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '<table style="width:96.6%;">';
                        $.each(jd, function (i, itm) {
                            opt += '<tr>\
                <td style="width:90%; vertical-align:top;" colspan="2"><strong>Question ' + itm.listOrder + '. ' + itm.strQuestion + '</strong></td>\
                <td style="width:10%; vertical-align:top;"></td>\
            </tr>\
            <tr>\
                <td style="width:3%;">&nbsp;</td>\
                <td style="width:90%; vertical-align:top;"><strong>Answer</strong> '+ itm.strAnswer + '</td>\
                <td>&nbsp;</td>\
            </tr>';

                        });

                        $('.qlist[fr="' + obj + '"]').html(opt + '</table>');
                    }
                });
            }



            $("#btnFB").live('click', function (e) {
                e.preventDefault();
                if ($('#txtUser').val() == "") {
                    alertR("Your name please ...");
                    return false;
                }

                if ($('#txtEmail').val() == "") {
                    alertR("Your email please ...");
                    return false;
                }
                //var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                //if (!emailReg.test($('#txtEmail').val())) {
                //    alert("Please enter a vaild email ...");
                //    return false;
                //}
                if ($('#txtSubject').val() == "") {
                    alertR("Subject required ...");
                    return false;
                }

                if ($('#txtFeedback').val() == "") {
                    alertR("Feedback please");
                    return false;
                }
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "FAQ.aspx/PostFeedback",
                    data: "{'name':'" + $('#txtUser').val() + "','email':'" + $('#txtEmail').val() + "','subject':'" + $('#txtSubject').val() + "','feedback':'" + $('#txtFeedback').val() + "'}",
                    context: document.body,
                    success: function (responseText) {

                        $('#txtUser').val(''); $('#txtEmail').val(''); $('#txtSubject').val(''); $('#txtFeedback').val('');
                        alertG("Thanks for feedback");
                    }

                });
            });

        });//END OF READY FUNCTION
    </script>
</asp:Content>
