<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accAppSetup.aspx.cs" Inherits="FRDP.accAppSetup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Application Setup</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<%--=====================--%><br />
<div style="margin-left: 10px; margin-right: 10px; margin-top: 10px">
        <br />
        <div id="accordion">
            <h3>Financial Group</h3>
            <div>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 100px"><strong>Financial Year</strong></td>
                        <td>
                            <asp:DropDownList ID="ddYear" runat="server" ClientIDMode="Static" DataSourceID="dsFY" DataTextField="SessionName" DataValueField="Session_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsFY" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT SessionName, Session_ID FROM tblAC_Year"></asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong>Active Month</strong></td>
                        <td>
                            <div id="Amonth" class="hidden"><%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %></div>
                            <asp:TextBox ID="txAcMonth" runat="server" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>
                            <asp:CalendarExtender ID="txAcMonth_CalendarExtender" runat="server" Enabled="True" Format="MMMM yyyy" TargetControlID="txAcMonth" OnClientHidden="onCalendarHidden"
                                OnClientShown="onCalendarShown" BehaviorID="calendar" DefaultView="Months">
                            </asp:CalendarExtender>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input id="btnFY" class="btn btn-info upS" type="button" value="Update Record" /></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <h3 style="display:none;">Academic Group</h3>
            <div style="display:none;">
                <table style="width: 100%;">
                    <tr>
                        <td style="vertical-align: top"><strong>Academic Year</strong></td>
                        <td style="vertical-align: top">
                            <asp:DropDownList ID="ddey" runat="server" ClientIDMode="Static" DataSourceID="dsAY" DataTextField="SessionName" DataValueField="Session_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsAY" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Session_ID, SessionName FROM tblED_Sessions"></asp:SqlDataSource>
                            <br />
                         <%--   <asp:SqlDataSource ID="dsFee" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" InsertCommand="INSERT INTO tblFeeType(FeeName, FeeGroup) VALUES (@FeeName, @FeeGroup)" SelectCommand="SELECT FeeTypID, FeeName, FeeGroup FROM tblFeeType WHERE (FeeTypID = @FeeTypID)" UpdateCommand="UPDATE tblFeeType SET FeeName = @FeeName, FeeGroup = @FeeGroup WHERE (FeeTypID = @FeeTypID)">
                                <InsertParameters>
                                    <asp:Parameter Name="FeeName" Type="String" />
                                    <asp:Parameter Name="FeeGroup" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="grdList" Name="FeeTypID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FeeName" Type="String" />
                                    <asp:Parameter Name="FeeGroup" Type="String" />
                                    <asp:Parameter Name="FeeTypID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>--%>
                            <%--<input id="btnFY0" class="ButtonClass upS" type="button" value="Update Academic Year" style="margin-top: 5px" /><asp:SqlDataSource ID="dsFeeCat" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT FeeGroup FROM tblFeeType GROUP BY FeeGroup"></asp:SqlDataSource>--%>
                            <%--<asp:SqlDataSource ID="dsFeeList" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT FeeTypID, FeeName, FeeGroup FROM tblFeeType WHERE (isSys = 0)" InsertCommand="INSERT INTO tblFeeType(FeeName, FeeGroup) VALUES (@FeeName, @FeeName)" UpdateCommand="UPDATE tblFeeType SET FeeName = @FeeName, FeeGroup = @FeeName WHERE (FeeTypID = @FeeTypID)">
                                <InsertParameters>
                                    <asp:Parameter Name="FeeName" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FeeName" />
                                    <asp:Parameter Name="FeeTypID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>--%>
                        </td>
                        <td>
                            <div class="tab0">
                                &nbsp;<div class="tab1" style="float: left">&nbsp;Add Fee Types</div>
                                <div class="tab2">&nbsp;</div>
                            </div>
                            <div>
                               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:DetailsView ID="dvFee" runat="server" AutoGenerateRows="False" BorderStyle="None" DataKeyNames="FeeTypID" DataSourceID="dsFee" DefaultMode="Insert" GridLines="None" Height="50px" OnItemInserted="dvFee_ItemInserted" OnItemInserting="dvFee_ItemInserting" OnItemUpdating="dvFee_ItemUpdating" Style="margin-bottom: 7px; margin-top: 4px;" Width="100%" ClientIDMode="Static">
                                            <AlternatingRowStyle BorderStyle="None" />
                                            <CommandRowStyle BorderStyle="None" />
                                            <EditRowStyle BorderStyle="None" HorizontalAlign="Left" />
                                            <EmptyDataTemplate>
                                                <asp:Button ID="Button8" runat="server" CausesValidation="False" CommandName="New" CssClass="ButtonClass" Text="Add New Exam" />
                                            </EmptyDataTemplate>
                                            <FieldHeaderStyle BorderStyle="None" CssClass="h1" Width="143px" />
                                            <Fields>
                                                <asp:TemplateField HeaderText="Fee Name" SortExpression="FeeName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FeeName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FeeName") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeeName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Font-Bold="True" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fee Group" SortExpression="FeeGroup" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddSession" runat="server" DataSourceID="dsFeeCat" DataTextField="FeeGroup" DataValueField="FeeGroup" SelectedValue='<%# Bind("FeeGroup") %>'>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsFeeCat" DataTextField="FeeGroup" DataValueField="FeeGroup" SelectedValue='<%# Bind("FeeGroup") %>'>
                                                        </asp:DropDownList>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("FeeGroup") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Font-Bold="True" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="lblMsg0" runat="server" Style="color: #CC0000"></asp:Label>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:Label ID="lblMsg1" runat="server" Style="color: #CC0000"></asp:Label>
                                                    </InsertItemTemplate>
                                                    <ItemStyle BorderStyle="None" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="edit" ShowHeader="False">
                                                    <EditItemTemplate>
                                                        <asp:Button ID="Button3" runat="server" CausesValidation="True" CommandName="Update" Text="Save Fee" />
                                                        &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:Button ID="Button5" runat="server" CausesValidation="True" CommandName="insert" Text="Save Fee" />
                                                        &nbsp;<asp:Button ID="Button6" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Button ID="Button7" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit Fee" />
                                                        &nbsp;
                                                    <asp:Button ID="Button9" runat="server" CausesValidation="False" CommandName="New" Text="Add New Fee" />
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="ButtonClass" />
                                                    <ItemStyle BorderStyle="None" />
                                                </asp:TemplateField>
                                            </Fields>
                                            <HeaderStyle BorderStyle="None" />
                                            <InsertRowStyle BorderStyle="None" />
                                            <PagerStyle CssClass="Emboss" />
                                            <RowStyle BorderStyle="None" />
                                        </asp:DetailsView>
                                        <asp:GridView ID="grdList" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="FeeTypID" DataSourceID="dsFeeList" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdList_PageIndexChanging" OnRowDataBound="grdList_RowDataBound" OnSelectedIndexChanged="grdList_SelectedIndexChanged" Width="77%">
                                            <AlternatingRowStyle BorderStyle="None" CssClass="Grd zoomin" />
                                            <Columns>
                                                <asp:BoundField DataField="FeeName" HeaderText="Fee Name" SortExpression="FeeName" />
                                                <asp:BoundField DataField="FeeGroup" HeaderText="Fee Group" SortExpression="FeeGroup" Visible="False" />
                                            </Columns>
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BorderStyle="None" CssClass="ui-state-default" Font-Bold="True" HorizontalAlign="Left" />
                                            <PagerStyle CssClass="Emboss" HorizontalAlign="Center" />
                                            <RowStyle BorderStyle="None" CssClass="Grd zoomin" />
                                            <SelectedRowStyle BorderStyle="None" Font-Bold="True" ForeColor="Navy" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>--%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <h3  style="display:none;">HR & Payrolll</h3>
            <div  style="display:none;">
                <p>
                    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
                </p>
                <ul>
                    <li>List item one</li>
                    <li>List item two</li>
                    <li>List item three</li>
                </ul>
            </div>
            <h3   style="display:none;">Section 4</h3>
            <div   style="display:none;">
                <p>
                    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
                </p>
                <p>
                    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
                </p>
            </div>
        </div>


    </div>
<%--=====================--%><br />
</div>

                            </div>

                        </div>
    </div>





            <script type="text/javascript">
                $(document).ready(function () {
                    $("#accordion").accordion({
                        heightStyle: "content",

                        collapsible: "false"
                    });

                    $('#txAcMonth').val($('#Amonth').text());
                    $('#ddYear').val($.cookie('fy'));
                    $('#ddey').val($.cookie('ey'));
                    $("#ddSession").live('focus', function (e) {
                        if ($(this).attr('tag') != 0) {
                            $("#ddSession").eComboBox({
                                'allowNewElements': true,		// default : true
                                'editableElements': false		// default : true
                            });
                        }
                        $(this).attr('tag', 0);
                    });
                    //$("#ddSession").live('focusout', function (e) {
                    //    $(this).children().attr('value', $(this).val());
                    //});
                    $("#DropDownList4").live('focus', function (e) {

                        if ($(this).attr('tag') != 0) {
                            $("#DropDownList4").eComboBox({
                                'allowNewElements': true,		// default : true
                                'editableElements': false		// default : true
                            });
                        }
                        $(this).attr('tag', 0);
                    });
                    $("#btnFY").live('click', function (e) {
                        $.ajax({
                            url: "exeDataIMS.ashx/?ID=107ǁ" + encodeURIComponent($('#ddYear').val() + "ǁ" + $('#ddey').val() + "ǁ" + $('#txAcMonth').val()),
                            context: document.body,
                            success: function (responseText) {
                                if (responseText == "1") {
                                    $.cookie('fy', $('#ddYear').val());
                                    $.cookie('ey', $('#ddey').val());
                                    alertG('Record Saved..!');
                                } else { alertR("please select a valid month"); }
                            }
                        });
                    });
                });
                function onCalendarShown() {
                    var cal = $find("calendar");
                    //Setting the default mode to month
                    cal._switchMode("months", true);
                    //Iterate every month Item and attach click event to it
                    if (cal._monthsBody) {
                        for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                            var row = cal._monthsBody.rows[i];
                            for (var j = 0; j < row.cells.length; j++) {
                                Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);
                            }
                        }
                    }
                }
                function onCalendarHidden() {
                    var cal = $find("calendar");
                    //Iterate every month Item and remove click event from it
                    if (cal._monthsBody) {
                        for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                            var row = cal._monthsBody.rows[i];
                            for (var j = 0; j < row.cells.length; j++) {
                                Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call);
                            }
                        }
                    }
                }
                function call(eventElement) {
                    var target = eventElement.target;
                    switch (target.mode) {
                        case "month":
                            var cal = $find("calendar");
                            cal._visibleDate = target.date;
                            cal.set_selectedDate(target.date);
                            cal._switchMonth(target.date);
                            cal._blur.post(true);
                            cal.raiseDateSelectionChanged();
                            break;
                    }
                }
        </script>
</asp:Content>