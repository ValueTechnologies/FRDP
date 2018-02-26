<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="FRDP.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">

        <div class="span12">

            <div class="page-header">
                <h4>User profile</h4>
            </div>

            <form class="form-horizontal seperator">
                <%--                            <div class="form-row row-fluid">
                                <div class="span12">
                                    <div class="row-fluid">
                                        <label class="form-label span3" for="username">Username:</label>
                                        <input class="span4" id="username" type="text" />
                                        <span class="hint"><a href="#" class="red">Request new ?</a></span>
                                    </div>
                                </div>
                            </div>--%>


                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="name">Full name</label>
                            <input readonly="readonly" class="span4 hm" id="name" type="text" value="<%= Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["onlyname"]).Value)).ToString()%>" />
                        </div>
                    </div>
                </div>
                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid" style="vertical-align: top;">
                            <label class="form-label span3" for="username">Picture</label>
                            <img src="Uploads/<%= Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["picExt"]).Value)).ToString() %>" alt="" style="width: 75px;" id="imgprvw" class="image marginR10" />
                            <input id="fileUpload" type="file" name="fileinput" onchange="showimagepreview(this);" style="margin-left: 23%;" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="name">Contact No</label>
                            <input class="span4 hm" id="Contact" type="text" value="<%= Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["ContactNo"]).Value)).ToString()%>" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="name">Designation</label>
                            <input class="span4 hm" id="txtDesignation" readonly="readonly" type="text" value="<%= Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["designation"]).Value)).ToString()%>" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="email">User Role</label>
                            <div class="span4">
                                <select disabled="disabled" id="ddlDesignation" class="hm" slect="<%= Convert.ToString(Session["User_Group_ID"]) %>">">
                                    <option></option>

                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="email">Email</label>
                            <input class="span4 hm" id="email" type="text" value="<%= Convert.ToString(Convert.ToString(((HttpCookie)HttpContext.Current.Request.Cookies["email"]).Value)).ToString()%>" />
                        </div>
                    </div>
                </div>

                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="normal">Password</label>
                            <div class="span4 controls">
                                <input class="span12 hm" id="password" name="password" type="password" placeholder="Enter your password" value="" />
                                <input class="span12" id="passwordConfirm" name="confirm_password" type="password" placeholder="Enter your password again" />
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="textarea">More info</label>
                            <textarea class="span4 limit elastic" id="textarea2" rows="3" cols="5"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <label class="form-label span3" for="email">User Status</label>
                            <div class="span4 controls">
                                <div class="left marginR10">
                                    <input type="checkbox" id="inlineCheckbox4" checked="checked" class="ibuttonCheck nostyle" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="form-row row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <div class="form-actions">
                                <div class="span3"></div>
                                <div class="span4 controls">
                                    <button id="btnSave" type="button" class="btn btn-info marginR10">Save changes</button>
                                    <button id="btnCancel" type="button" class="btn btn-danger" style="display: none">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </form>

        </div>
        <!-- End .span12 -->

    </div>
    <!-- End .row-fluid -->

    <div class="modal fade hide" id="myModal1">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span class="icon12 minia-icon-close"></span></button>
            <h3>Chat layout</h3>
        </div>
        <div class="modal-body">
            <ul class="messages">
                <li class="user clearfix">
                    <a href="#" class="avatar">
                        <img src="images/avatar2.jpeg" alt="" />
                    </a>
                    <div class="message">
                        <div class="head clearfix">
                            <span class="name"><strong>Lazar</strong> says:</span>
                            <span class="time">25 seconds ago</span>
                        </div>
                        <p>
                            Time to go i call you tomorrow.
                        </p>
                    </div>
                </li>
                <li class="admin clearfix">
                    <a href="#" class="avatar">
                        <img src="images/avatar3.jpeg" alt="" />
                    </a>
                    <div class="message">
                        <div class="head clearfix">
                            <span class="name"><strong>Sugge</strong> says:</span>
                            <span class="time">just now</span>
                        </div>
                        <p>
                            OK, have a nice day.
                        </p>
                    </div>
                </li>

                <li class="sendMsg">
                    <form class="form-horizontal" action="#">
                        <textarea class="elastic" id="textarea1" rows="1" placeholder="Enter your message ..." style="width: 98%;"></textarea>
                        <button type="submit" class="btn btn-info marginT10">Send message</button>
                    </form>
                </li>

            </ul>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
        </div>
    </div>


    <script type="text/javascript">

        function showimagepreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgprvw').attr('src', e.target.result);
                    $('#imgprvw').show();
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }

        $(document).ready(function () {


            $(function () {
                $('.heading	h3').html('User Registration');
            });


            $(".ibuttonCheck").iButton({
                labelOn: "<span class='icon16 icomoon-icon-checkmark-2 white'></span>",
                labelOff: "<span class='icon16 icomoon-icon-cancel-3 white'></span>",
                enableDrag: false
            });


            $('#btnSave').live('click', function () {

                if (($('#passwordConfirm').val() == "" || $('#password').val() == "")) {
                    alertR("Please Enter Password..!");
                    return false;
                }

                if ($('#passwordConfirm').val() != $('#password').val()) {
                    alertR("Password not matched..!");
                    return false;
                }
                

                var ctrlVals = $('#Contact').val() + "½" + $('#email').val() + "½" + $('#password').val()  + "½" + $('#textarea2').val() + "½";


                var uploadfiles = $("#fileUpload").get(0);
                var uploadedfiles = uploadfiles.files;
                var fromdata = new FormData();
                fromdata.append("vls", ctrlVals);
                for (var i = 0; i < uploadedfiles.length; i++) {
                    fromdata.append(uploadedfiles[i].name, uploadedfiles[i]);
                }

                var choice = {};
                choice.url = "AddUsersGH1.ashx";
                choice.type = "POST";
                choice.data = fromdata;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (result) {
                    alertG(result);
                    //$('.hm').each(function (index, element) {
                    //    $(this).val('');
                    //});
                    //if ($.browser.msie) {
                    //    $('#fileUpload').replaceWith($('#fileUpload').clone());
                    //}
                    //else {
                    //    $('#fileUpload').val('');
                    //}
                    //$('.filename').html('');
                };
                choice.error = function (err) {
                    alertR(err.statusText);
                };
                $.ajax(choice);
                event.preventDefault();
            });
            $('#btnCancel').live('click', function () {
                $('.hm').each(function (index, element) {
                    $(this).val('');
                });


                //var input = $("#fileUpload");

                if ($.browser.msie) {
                    $('#fileUpload').replaceWith($('#fileUpload').clone());
                }
                else {
                    $('#fileUpload').val('');
                }
                $('.filename').html('');

            });






            $('#password').live('blur', function () {

                if ($.trim($(this).val()) != "" && $.trim($('#passwordConfirm').val()) != "") {
                    if ($(this).val() != $('#passwordConfirm').val()) {
                        alertR("Password not matched")
                    }
                }

            });

            $('#passwordConfirm').live('blur', function () {

                if ($.trim($(this).val()) != "" && $.trim($('#password').val()) != "") {
                    if ($(this).val() != $('#password').val()) {
                        alertR("Password not matched")
                    }
                }

            });

            $.ajax({
                url: "exeData.ashx/?ID=23ǁ",
                context: document.body,
                success: function (responseText) {

                    $('#ddlDesignation').html(responseText).prev().html($('#ddlDesignation option:selected').text());
                    $('#ddlDesignation').val($('#ddlDesignation').attr('slect'));
                }
            });

        });//End document ready functions
    </script>
</asp:Content>
