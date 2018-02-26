<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="FAQAddEdit.aspx.cs" Inherits="FRDP.FAQAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width: 100%;">
        <tr>
            <td style="width: 120px;"><strong>FAQ Group :</strong></td>
            <td>
                <select id="ddlActionType" class="frm">
                    <option></option>
                </select></td>
        </tr>
        <tr>
            <td colspan="2" id="QtrTable"></td>
        </tr>
    </table>
    <br />
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Feedbacks</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <br />
                                    <div style="margin:20px;">
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
                        <ItemTemplate>Name :&nbsp;<asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# Bind("fUser") %>'></asp:Label>
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
                            <br />
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;|&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            <br />
                            <span style="color: #C0C0C0">____________________________________________________________________</span><br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="isPublic" HeaderText="Public" SortExpression="isPublic" />
                </Columns>
                <HeaderStyle BackColor="#006600" ForeColor="White" HorizontalAlign="Left" />
            </asp:GridView>
                <asp:SqlDataSource ID="dsFeedbacks" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" DeleteCommand="DELETE FROM TblFeedback WHERE (FeedID = @FeedID)" SelectCommand="SELECT FeedID, fUser, fEmail, fSubject, fComments, fDate, isPublic FROM TblFeedback" UpdateCommand="UPDATE TblFeedback SET fComments = @fComments, isPublic = @isPublic WHERE (FeedID = @FeedID)">
                    <DeleteParameters>
                        <asp:Parameter Name="FeedID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fComments" Type="String" />
                        <asp:Parameter Name="isPublic" Type="Boolean" />
                        <asp:Parameter Name="FeedID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                                        </div>
</div>

                            </div>

                        </div>
    </div>
    <script type="text/javascript">
        $('.clsNewEntry').live('keypress', function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $('input').live('keypress', function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=118ǁ",
                    success: function (response) {
                        var jdata = $.parseJSON(response), optList = "";
                        $.each(jdata, function (i, item) {
                            optList = optList + '<option value="' + item.strType + '">' + item.strType + '</option>';
                        });
                        $('#ddlActionType').html(optList);
                        $('#ddlActionType').eComboBox();
                        FillCategoryTable();
                    }
                });
            });
            $('#ddlActionType').live('change', FillCategoryTable);
            function FillCategoryTable() {
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=119ǁ" + encodeURIComponent($('#ddlActionType').val()),

                    
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '<table id="checklist" class="responsive table table-bordered"><thead><tr>\
                            <th style="width: 30px;">Order</th>\
                            <th>Question</th>\
                               <th>Answer</th>\
                                <th  style="width: 40px;">Visibility</th>\
                                <th style="width:27px;"></th>\
                                </tr></thead><tbody>';
                        // alert(response);
                        //$('#tblCatDetails').html(response);
                        $.each(jd, function (i, itm) {
                            var chk = (itm.bIsVisible == true) ? 'checked' : '';
                            var chkval = (itm.bIsVisible == true) ? '1' : '0';
                            opt += '<tr tg="' + itm.tblFAQID + '"><td><input tg="listOrder" value="' + itm.listOrder + '" class="frmu Integer" type="text" style="width: 30px;" /></td>\
                            <td><input tg="strQuestion" class="frmu" type="text" value="' + itm.strQuestion + '"  style="width: 95.6%;" /></td>\
                               <td><input tg="strAnswer" class="frmu" type="text" value="' + itm.strAnswer + '" style="width: 95.6%;"  /></td>\
                                <td  style="vertical-align: top;"><input tg="bIsVisible" value="' + chkval + '" name="visiblity" class="frmu chkbx" type="checkbox" ' + chk + ' /></td>\
                                <td><button tg="' + itm.tblFAQID + '" class="btnDelList btn btn-danger marginB10"> x </button></td>\
                                </tr>';
                        });
                        opt += '</tbody><thead>\
                            <tr>\
                            <th><input class="frm Integer" type="text" style="width: 30px;" /></th>\
                            <th><input class="frm" type="text"   style="width: 95.6%;" /></th>\
                               <th><input class="frm" type="text" style="width: 95.6%;"  /></th>\
                                <th style="vertical-align: top;"><input name="visiblity" value="1" class="frm chkbx" type="checkbox" checked /></th>\
                                <th><button id="btnAddList" class="btn btn-info marginB10"> + </button></th>\
                                </tr>\
                                </thead>\
                            </table>';

                        $('#QtrTable').html(opt);

                    }
                });
            }

            $('.chkbx').live('change', function (e) {
                e.preventDefault();
                if ($(this).is(":checked")) {
                    $(this).val('1');
                }
                else {
                    $(this).val('0');
                }
                
            });
            $('#btnAddList').live('click', function (e) {
                e.preventDefault();

                if ($('#ddlActionType').val()== '{NEW ELEMENT}') {
                    alertR('Select valied Question Category Type');
                    return false;
                }
                var val = '',  flg = true;
                $('.frm').each(function (index, element) {
                    
                    if ($.trim($(this).val())=='') {
                       
                        flg = false;
                        $(this).css('background-color', 'red');
                    }
                    else {
                        $(this).css('background-color', 'White');
                    }
                    val += encodeURIComponent($(this).val()) + 'ǁ';
                });
                if (flg) {
                    $.ajax({
                        type: "POST",
                        url: "exeData.ashx/?ID=120ǁ" + val,
                        success: function (response) {
                            alertG('Record Added');
                            FillCategoryTable();
                        }
                    });
                }
                else {
                    alertR('Enter Valid value');
                }



            });

            $('.btnDelList').live('click', function (e) {
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=121ǁ" + $(this).attr('tg'),
                    success: function (response) {
                        alertR('Record Deleted');
                        FillCategoryTable();
                    }
                });
            });

            $('.frmu').live('focusout', function (e) {
                e.preventDefault();
                var v = $(this).attr('tg');
                $.ajax({
                    type: "POST",
                    url: "exeData.ashx/?ID=122ǁ" + $(this).attr('tg') + 'ǁ' + $(this).val() + 'ǁ' + $(this).parent().parent().attr('tg'),
                    success: function (response) {
                        
                        if (v == 'listOrder') {
                        alertG('Record Updated');
                        FillCategoryTable();
                        }
                    }
                });
            });

        });//END OF READY
    </script>
</asp:Content>
