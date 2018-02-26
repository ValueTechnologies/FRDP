<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="AUA.aspx.cs" Inherits="FRDP.AUA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="plugins/misc/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .leftBox {
    float: left;
    width: 20%;
}
        .rightBox {
    float: right;
    width: 77%;
    margin-right: 2%;
}
   
        .checkbox
        {
            padding-left: 20px;
            margin-left:30px;
        }
        .checkbox label
        {
            display: inline-block;
            vertical-align: middle;
            position: relative;
            padding-left: 5px;
            width: 300px;
        }
        .checkbox label::before
        {
            content: "";
            display: inline-block;
            position: absolute;
            width: 17px;
            height: 17px;
            left: 0;
            margin-left: -20px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            background-color: #fff;
            -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
        }
        .checkbox label::after
        {
            display: inline-block;
            position: absolute;
            width: 16px;
            height: 16px;
            left: 0;
            top: 0;
            margin-left: -20px;
            padding-left: 3px;
            padding-top: 1px;
            font-size: 11px;
            color: #555555;
        }
        .checkbox input[type="checkbox"]
        {
            opacity: 0;
            z-index: 1;
        }

        .checkbox input[type="checkbox"]:checked + label::after
        {
            /*font-family: "FontAwesome";*/
            font-family: FontAwesome;
            content: "\f00c";
        }
         
        .checkbox-primary input[type="checkbox"]:checked + label::before
        {
            background-color: #337ab7;
            border-color: #337ab7;
        }
        .checkbox-primary input[type="checkbox"]:checked + label::after
        {
            color: #fff;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span>Users Access Rights</span>
                                    </h4>
                                </div>
                                <div class="content">

                                    <form class="form-horizontal" action="#">

                                        <div class="form-row row-fluid">
                                            <div class="span12">
                                                <div class="leftBox">
                                                    <div class="searchBox" style="width:125%;"><input type="text" id="box1Filter" class="searchField" placeholder="filter ..."/><button id="box1Clear" type="button" class="btn"><span class="icon12  icomoon-icon-cancel-3"></span></button></div>
                                                    <asp:DropDownList ID="box1View" multiple="multiple" style="height:400px;"  ClientIDMode="Static" runat="server" DataSourceID="SDLogins" DataTextField="UserName" DataValueField="LoginID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SDLogins"  runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT LoginID, UserName FROM Login ORDER BY UserName"></asp:SqlDataSource>
                                                   <%-- <select id="box1View" multiple="multiple" class="multiple nostyle" style="height:300px;">
                                                        <option value="1">Spain</option>
                                                        <option value="2">Germany</option>
                                                        <option value="3">Uruguay</option>
                                                        <option value="4" selected="selected">Brazil</option>
                                                        <option value="5" selected="selected">England</option>
                                                        <option value="6" selected="selected">Portugal</option>
                                                        <option value="7">Argentina</option>
                                                        <option value="8">Italy</option>
                                                        <option value="9">Croatia</option>
                                                        <option value="10">Denmark</option>
                                                        <option value="11">Russia</option>
                                                        <option value="12">Greece</option>
                                                        <option value="13">Chile</option>
                                                        <option value="14">Côte d'Ivoire</option>
                                                        <option value="15" selected="selected">France</option>
                                                        <option value="16">Sweden</option>
                                                        <option value="17">Switzerland</option>
                                                        <option value="18">Republic of Ireland</option>
                                                        <option value="19">Australia</option>
                                                    </select>--%>
<%--                                                    <br/>
                                                    <span id="box1Counter" class="count"></span>
                                                    
                                                    <div class="dn"><select id="box1Storage" name="box1Storage" class="nostyle"></select></div>--%>
                                                </div>
                                                    
                                               
                                                    
                                                <div class="rightBox">
                                                    <div class="searchBox" style="width: 156%;"><input type="text" id="box2Filter" class="searchField" placeholder="filter ..." style="background: url(./images/search.png) no-repeat 98% center;" /><button id="box2Clear"  type="button" class="btn" ><span class="icon12  icomoon-icon-cancel-3"></span></button></div>
<%--                                                    <select id="box2View" multiple="multiple" class="multiple nostyle" style="height:300px;"></select><br/>
                                                    <span id="box2Counter" class="count"></span>
                                                    
                                                    <div class="dn"><select id="box2Storage" class="nostyle"></select></div>--%>
                                                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Head Office</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<%--=========================--%>
                            <asp:SqlDataSource ID="SDHO" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT [CompanyID], [CompanyName] FROM [tbl_Company] WHERE ([lvl] = @lvl) ORDER BY [CompanyName]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="lvl" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:CheckBoxList ID="chklstHO" ClientIDMode="Static"  runat="server" DataSourceID="SDHO" DataTextField="CompanyName" DataValueField="CompanyID" RepeatDirection="Horizontal" CssClass="checkbox" RepeatColumns="3"></asp:CheckBoxList>
</div><%--END OF tab0--%>
<div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;DSUs' (District Support Unit)</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<%--=========================--%>
                            <asp:SqlDataSource ID="SDRO" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyID, CompanyName FROM tbl_Company WHERE (lvl = @lvl) ORDER BY CompanyName">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="2" Name="lvl" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:CheckBoxList ID="chklstRO" ClientIDMode="Static"  runat="server" DataSourceID="SDRO" DataTextField="CompanyName" DataValueField="CompanyID" RepeatDirection="Horizontal" CssClass="checkbox" RepeatColumns="3"></asp:CheckBoxList>
</div><%--END OF tab0--%>
<div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;FRDP's</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<%--=========================--%>
                            <asp:SqlDataSource ID="SDDistricts" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        CompanyID, CompanyName FROM            tbl_Company WHERE        (lvl = @lvl) ORDER BY CompanyName">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="3" Name="lvl" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:CheckBoxList ID="CheckBoxList1" ClientIDMode="Static"  runat="server" DataSourceID="SDDistricts" DataTextField="CompanyName" DataValueField="CompanyID" RepeatDirection="Horizontal" CssClass="checkbox" RepeatColumns="3"></asp:CheckBoxList>
</div><%--END OF tab0--%>

                                                </div>

                                            </div> 
                                        </div>

                                    </form>

                                </div>

                            </div><!-- End .box -->

                        </div><!-- End .span6 -->

                    </div><!-- End .row-fluid -->                  

                    <script type="text/javascript">
                        $(document).ready(function () {
                            //var logins = $('#box1View').html();
                            $('#box1Filter').keyup(function () {
                                var filter = $(this).val(), count = 0;
                                $("#box1View option").each(function () {
                                    if ($(this).html().search(new RegExp(filter, "i")) < 0) {
                                        $(this).fadeOut();
                                    } else {
                                        $(this).show();
                                    }
                                });
                            });

                            $('#box1Clear').live('click', function (e) {
                                e.preventDefault();
                                $('#box1Filter').val('');
                                $('#box1Filter').keyup();
                            });


                            $('#box2Filter').keyup(function () {
                                var filter = $(this).val(), count = 0;
                                //$(".checkbox [type='checkbox']").each(function () {
                                $(".checkbox label").each(function () {

                                    if ($(this).html().search(new RegExp(filter, "i")) < 0) {
                                        $(this).parent().fadeOut();
                                    } else {
                                        $(this).parent().show();
                                    }
                                });
                            });

                            $('#box2Clear').live('click', function (e) {
                                e.preventDefault();
                                $('#box2Filter').val('');
                                $('#box2Filter').keyup();
                            });


                            ////////////

                            $('#box1View').live('change', function (e) {
                                //alertR($(this).val());
                            });
                            $(".checkbox [type='checkbox']").live('click', function () {

                                //alert($('#box1View').val());

                                if ($('#box1View').val() == null) {
                                    alertR('Please Select User...!');
                                    return false;
                                }

                                if ($(this).attr('checked') == 'checked') {
                                    //alertG($(this).val() + " Add");
                                    $.ajax({
                                        type: "POST",
                                        url: "inv.ashx/?ID=67ǁ" + $('#box1View').val() + "ǁ" + $(this).val(),
                                        success: function (response) {
                                            $('#box1View').click();
                                            alertG('Record Updated...!');
                                        }
                                    });
                                }
                                else {
                                    $.ajax({
                                        type: "POST",
                                        url: "inv.ashx/?ID=68ǁ" + $('#box1View').val() + "ǁ" + $(this).val(),
                                        success: function (response) {
                                            $('#box1View').click();
                                            alertG('Record Updated...!');
                                        }
                                    });
                                }


                                //alertG($(this).val());
                            });




                            $('#box1View').live('click', function (e) {
                                e.preventDefault();
                                //alertR('Load Data');
                                $(".checkbox [type='checkbox']").removeAttr('checked');
                                $.ajax({
                                    type: "POST",
                                    url: "inv.ashx/?ID=69ǁ" + $('#box1View').val(),
                                    success: function (response) {
                                        var jd = $.parseJSON(response), opt = '';
                                        $.each(jd, function (i, itm) {
                                            $(".checkbox [type='checkbox'][value='" + itm.LocID + "']").attr('checked', 'checked');
                                        });

                                    }
                                });

                            });

                        });//END OF DOC READY
                    </script>
</asp:Content>
