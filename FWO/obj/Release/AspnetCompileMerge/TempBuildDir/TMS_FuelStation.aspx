<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_FuelStation.aspx.cs" Inherits="FRDP.TMS_FuelStation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .abGrid {
            width: 97%;
            margin-left: 20px;
        }

        .RBL label {
            display: inline-block;
            margin-right: 50px;
        }

        .RBL td {
            text-align: center;
            width: 20px;
        }

        input[type="radio"], input[type="checkbox"] {
            margin: -2px 8px 0px;
        }
    .abGrid tbody tr td input[type="text"] {
    width: 75px;
}
        </style>


        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Fuel Station Registration</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div class="bxmain">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                            <tr>
                                <td align="right" width="180px" style="vertical-align: top;">Fule Station Type :</td>
                                <td>
                                    <div class="col-sm-8">
                                        <asp:RadioButtonList ID="RadioButtonList1" CssClass="RBL" runat="server" RepeatLayout="Flow"
                                            RepeatDirection="Horizontal" DataSourceID="P7_SqlDataSource_FuelStaType"
                                            DataTextField="Fuel_Station_Type_Name"
                                            DataValueField="Fuel_Station_Type_Id" OnPreRender="RadioButtonList1_PreRender">
                                        </asp:RadioButtonList>
                                    </div>
                                    <asp:SqlDataSource ID="P7_SqlDataSource_FuelStaType" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
                                        SelectCommand="SELECT [Fuel_Station_Type_Id], [Fuel_Station_Type_Name] FROM [Fuel_Station_Type]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Station Name :</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="180px"></asp:TextBox>
                                    <asp:Label ID="Label86" runat="server" Visible="False"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td align="right">Manager Name :</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" Width="60px">
                                        <asp:ListItem Selected="True">Mr.</asp:ListItem>
                                        <asp:ListItem>Mrs.</asp:ListItem>
                                        <asp:ListItem>Miss</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td align="right">Account No. :</td>
                                <td>
                                    <asp:TextBox ID="P7_TextBox_AccountNo" runat="server" Width="180px"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td align="right">Phone Number :</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="180px"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td align="right">Phone Number :</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Width="180px"></asp:TextBox>
                                    <span class="dim">(if Any)</span></td>

                            </tr>
                            <tr>
                                <td align="right">Phone Number :</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" Width="180px"></asp:TextBox>
                                    <span class="dim">(if Any)</span></td>

                            </tr>
                            <tr>
                                <td align="right">Fax :</td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" Width="180px"></asp:TextBox>
                                    <span class="dim">(if Any)</span></td>

                            </tr>
                            <tr>
                                <td align="right" style="vertical-align: top;">Address :</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Height="65px" TextMode="MultiLine"
                                        Width="90%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="Button2" CssClass="btn btn-info" runat="server" OnClick="Button2_Click" Text="Save" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                </div>

            </div>

        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Fuel Station List</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource_FuelStation" runat="server"
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
                        InsertCommand="INSERT INTO Fuel_Station(Fuel_Station_Type_Id, Fuel_Station_Name, Fuel_Station_Phone1, Fuel_Station_Phone2, Fuel_Station_Phone3, Fuel_Station_Fax, Fuel_Station_Address, Emp_Id, Manager_Prifix, Manager_Name, AccountNo) VALUES (@Fuel_Station_Type_Id, @Fuel_Station_Name, @Fuel_Station_Phone1, @Fuel_Station_Phone2, @Fuel_Station_Phone3, @Fuel_Station_Fax, @Fuel_Station_Address, @Emp_Id, @Manager_Prifix, @Manager_Name, @AccountNo)"
                        SelectCommand="SELECT Fuel_Station_Id, Fuel_Station_Type_Id, Fuel_Station_Name, Fuel_Station_Phone1, Fuel_Station_Phone2, Fuel_Station_Phone3, Fuel_Station_Fax, Fuel_Station_Address, Is_Deactivated, ISNULL(Manager_Prifix, '') + ' ' + ISNULL(Manager_Name, '') AS Manager_NameDisplay, Manager_Prifix, Manager_Name, AccountNo FROM Fuel_Station ORDER BY Fuel_Station_Name"
                        UpdateCommand="UPDATE Fuel_Station SET Fuel_Station_Type_Id = @Fuel_Station_Type_Id, Fuel_Station_Name = @Fuel_Station_Name, Fuel_Station_Phone1 = @Fuel_Station_Phone1, Fuel_Station_Phone2 = @Fuel_Station_Phone2, Fuel_Station_Phone3 = @Fuel_Station_Phone3, Fuel_Station_Fax = @Fuel_Station_Fax, Fuel_Station_Address = @Fuel_Station_Address, Is_Deactivated = @Is_Deactivated, Manager_Prifix = @Manager_Prifix, Manager_Name = @Manager_Name, AccountNo = @AccountNo WHERE (Fuel_Station_Id = @Fuel_Station_Id)">
                        <UpdateParameters>
                            <asp:Parameter Name="Fuel_Station_Id" />
                            <asp:Parameter Name="Fuel_Station_Type_Id" />
                            <asp:Parameter Name="Fuel_Station_Name" />
                            <asp:Parameter Name="Fuel_Station_Phone1" />
                            <asp:Parameter Name="Fuel_Station_Phone2" />
                            <asp:Parameter Name="Fuel_Station_Phone3" />
                            <asp:Parameter Name="Fuel_Station_Fax" />
                            <asp:Parameter Name="Fuel_Station_Address" />
                            <asp:Parameter Name="Is_Deactivated" />
                            <asp:Parameter Name="Manager_Prifix" />
                            <asp:Parameter Name="Manager_Name" />
                            <asp:Parameter Name="AccountNo" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="RadioButtonList1" Name="Fuel_Station_Type_Id"
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TextBox1" Name="Fuel_Station_Name"
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox2" Name="Fuel_Station_Phone1"
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox3" Name="Fuel_Station_Phone2"
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox4" Name="Fuel_Station_Phone3"
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox6" Name="Fuel_Station_Fax"
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox5" Name="Fuel_Station_Address"
                                PropertyName="Text" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                            <asp:ControlParameter ControlID="DropDownList3" Name="Manager_Prifix"
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TextBox14" Name="Manager_Name"
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="P7_TextBox_AccountNo" Name="AccountNo"
                                PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>

                    <br />
                    <asp:GridView ID="GridView_FuelStation" runat="server" CssClass="abGrid" Width="96%"
                        AutoGenerateColumns="False" DataKeyNames="Fuel_Station_Id"
                        DataSourceID="SqlDataSource_FuelStation">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Fuel_Station_Name" HeaderText="Fuel Station Name"
                                SortExpression="Fuel_Station_Name" />
                            <asp:TemplateField HeaderText="Fuel Station Type"
                                SortExpression="Fuel_Station_Type_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server"
                                        SelectedValue='<%# Bind("Fuel_Station_Type_Id") %>'>
                                        <asp:ListItem Value="1">CNG Pump</asp:ListItem>
                                        <asp:ListItem Value="2">Petrol Pump</asp:ListItem>
                                        <asp:ListItem Value="3">CNG + Petrol Pump</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server"
                                        DataSourceID="P7_SqlDataSource_FuelStaType1"
                                        DataTextField="Fuel_Station_Type_Name" DataValueField="Fuel_Station_Type_Id"
                                        Enabled="False" SelectedValue='<%# Bind("Fuel_Station_Type_Id") %>'>
                                        <asp:ListItem Value="1">CNG Pump</asp:ListItem>
                                        <asp:ListItem Value="2">Petrol Pump</asp:ListItem>
                                        <asp:ListItem Value="3">CNG + Petrol Pump</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="P7_SqlDataSource_FuelStaType1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
                                        SelectCommand="SELECT [Fuel_Station_Type_Id], [Fuel_Station_Type_Name] FROM [Fuel_Station_Type]"></asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AccountNo" HeaderText="AccountNo"
                                SortExpression="AccountNo" />
                            <asp:TemplateField HeaderText="Manager Name"
                                SortExpression="Manager_NameDisplay">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList3a" runat="server"
                                        SelectedValue='<%# Bind("Manager_Prifix") %>'>
                                        <asp:ListItem>Mr.</asp:ListItem>
                                        <asp:ListItem>Mrs.</asp:ListItem>
                                        <asp:ListItem>Miss</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Manager_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Manager_NameDisplay") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Fuel_Station_Phone1" HeaderText="Phone No."
                                SortExpression="Fuel_Station_Phone1" />
                            <asp:BoundField DataField="Fuel_Station_Phone2" HeaderText="Phone No."
                                SortExpression="Fuel_Station_Phone2" />
                            <asp:BoundField DataField="Fuel_Station_Phone3" HeaderText="Phone No."
                                SortExpression="Fuel_Station_Phone3" />
                            <asp:BoundField DataField="Fuel_Station_Fax" HeaderText="Fax No."
                                SortExpression="Fuel_Station_Fax" />
                            <asp:BoundField DataField="Fuel_Station_Address" HeaderText="Address"
                                SortExpression="Fuel_Station_Address" />
                            <asp:CheckBoxField DataField="Is_Deactivated" HeaderText="Is Deactivated"
                                SortExpression="Is_Deactivated" />
                        </Columns>
                        <EditRowStyle CssClass="gridedit" />
                    </asp:GridView>
                    <br />
                </div>

            </div>

        </div>
    </div>

            </ContentTemplate></asp:UpdatePanel>
</asp:Content>
