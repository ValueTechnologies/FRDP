<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleAllocation.aspx.cs" Inherits="FRDP.TMS_VehicleAllocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <style type="text/css">
        .abGrid {
            width: 97%;
            margin-left: 20px;
        }
        label[for] {
        display:inline-block;
        margin-left: 5px;
        }

        input[type="radio"], input[type="checkbox"] {
            margin: 0 0 0;
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
                                        <span>Vehicle Allocation</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
                                        <div class="bxmain">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
            <tr>
                <td align="right" width="180px;">
                    Vehicle No. :</td>
                <td>
                  <asp:SqlDataSource ID="SqlDataSource_P11_Vehicle_Id" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        SelectCommand="SELECT Vehicle_id, Number FROM Vehicle WHERE (Vehicle_id NOT IN (SELECT Vehicle_Id FROM Vehicle_Allocation))"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList_P11_Vechile_Id" runat="server" 
                        DataSourceID="SqlDataSource_P11_Vehicle_Id" DataTextField="Number" 
                        DataValueField="Vehicle_id">
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    </td>
                <td>
                    <asp:DropDownList ID="P11_DropDownList_FuelType" runat="server" 
                        AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="1">PSO CARD</asp:ListItem>
                        <asp:ListItem Value="2">Slip System</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Vehicle Allocation Type :</td>
                <td>
                    <asp:DropDownList ID="DropDownList_P11_AllocationType_Id" runat="server" 
                        DataSourceID="SqlDataSource_P11_AllocationType_Id" 
                        DataTextField="Vehicle_Alocation_Type" 
                        DataValueField="Vehicle_Alocation_Type_Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_P11_AllocationType_Id" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        SelectCommand="SELECT Vehicle_Alocation_Type_Id, Vehicle_Alocation_Type FROM Vehicle_Alocation_Type WHERE (Fuel_System = @Fuel_System) ORDER BY Vehicle_Alocation_Type" 
                        UpdateCommand="Vehicle_Allocation_Update" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="P11_DropDownList_FuelType" Name="Fuel_System" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="HiddenField_P11_Update_Allocation_Id" 
                                Name="Vehicle_Id" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="HiddenField_P11_Update_AllocationTypeId" 
                                Name="Vehicle_Alocation_Type_Id" PropertyName="Value" Type="Int32" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    </td>
                <td>
                  <asp:Button ID="Button_P11_Save" CssClass="btn btn-info" runat="server" onclick="Button_P11_Save_Click" 
                        Text="Save" />
                    <asp:SqlDataSource ID="SqlDataSource_p11_grid" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="Vehicle_Allocation_Insert" InsertCommandType="StoredProcedure" 
                        
                        SelectCommand="SELECT Vehicle_Allocation.Vehicle_Id, Vehicle_Allocation.ID, Vehicle_Allocation.Date_Time, Vehicle.Manufacture_Year, Vehicle.CubicCapacity, VehicleManufacturer.Manufacturer_Name, Vehicle_Type.VehicleTypeName, Vehicle_Alocation_Type.Vehicle_Alocation_Type, Vehicle.Number, Vehicle_Allocation.Vehicle_Alocation_Type_Id, Vehicle_Allocation.Emp_Id FROM Vehicle_Allocation INNER JOIN Vehicle_Alocation_Type ON Vehicle_Allocation.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type.Vehicle_Alocation_Type_Id INNER JOIN Vehicle ON Vehicle_Allocation.Vehicle_Id = Vehicle.Vehicle_id INNER JOIN VehicleManufacturer ON Vehicle.Maker_Name = VehicleManufacturer.ManufacturerID INNER JOIN Vehicle_Type ON Vehicle.Vehicle_Type_Id = Vehicle_Type.VehicleTypeID ORDER BY Vehicle_Alocation_Type.Vehicle_Alocation_Type" 
                        DeleteCommand="Vehicle_Allocation_Delete" 
                        DeleteCommandType="StoredProcedure" ondeleted="SqlDataSource_p11_grid_Deleted">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridView_p11" Name="Vehicle_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="DropDownList_P11_Vechile_Id" Name="Vehicle_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="DropDownList_P11_AllocationType_Id" 
                                Name="Vehicle_Alocation_Type_Id" PropertyName="SelectedValue" Type="Int32" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:HiddenField ID="HiddenField_P11_Update_AllocationTypeId" runat="server" 
                        Value="0" />
                    <asp:HiddenField ID="HiddenField_P11_Update_Allocation_Id" runat="server" 
                        Value="0" />
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
                                        <span>Vehicle Allocation Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
                                                        <asp:GridView ID="GridView_p11" CssClass="abGrid" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Vehicle_Id" DataSourceID="SqlDataSource_p11_grid" 
                        Width="96%">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" onclick="LinkButton1_Click" Text="Update"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Alocation To" 
                                SortExpression="Vehicle_Alocation_Type">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList_P11_AllocationType_Id0" runat="server" 
                                        AutoPostBack="True" DataSourceID="SqlDataSource_P11_AllocationType_Id0" 
                                        DataTextField="Vehicle_Alocation_Type" 
                                        DataValueField="Vehicle_Alocation_Type_Id" 
                                        onselectedindexchanged="DropDownList_P11_AllocationType_Id0_SelectedIndexChanged" 
                                        SelectedValue='<%# Bind("Vehicle_Alocation_Type_Id") %>'>
                                    </asp:DropDownList>
                                    <asp:HiddenField ID="HiddenField1" runat="server" 
                                        Value='<%# Eval("Vehicle_Id") %>' />
                                    <asp:SqlDataSource ID="SqlDataSource_P11_AllocationType_Id0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        SelectCommand="SELECT [Vehicle_Alocation_Type_Id], [Vehicle_Alocation_Type] FROM [Vehicle_Alocation_Type] ORDER BY [Vehicle_Alocation_Type]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("Vehicle_Alocation_Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number" SortExpression="Number">
                                <EditItemTemplate>
                                    <asp:Label ID="Label02" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Manufacturer" SortExpression="Manufacturer_Name">
                                <EditItemTemplate>
                                    <asp:Label ID="Label03" runat="server" Text='<%# Bind("Manufacturer_Name") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Manufacturer_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Vehicle" SortExpression="VehicleTypeName">
                                <EditItemTemplate>
                                    <asp:Label ID="Label04" runat="server" Text='<%# Bind("VehicleTypeName") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("VehicleTypeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Model" SortExpression="Manufacture_Year">
                                <EditItemTemplate>
                                    <asp:Label ID="Label05" runat="server" Text='<%# Bind("Manufacture_Year") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Manufacture_Year") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CC(Cubic Capacity)" 
                                SortExpression="CubicCapacity">
                                <EditItemTemplate>
                                    <asp:Label ID="Label06" runat="server" Text='<%# Bind("CubicCapacity") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("CubicCapacity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allocated Since" SortExpression="Date_Time">
                                <EditItemTemplate>
                                    <asp:Label ID="Label07" runat="server" Text='<%# Bind("Date_Time") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Date_Time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns><EditRowStyle CssClass="gridedit" />
                    </asp:GridView>
                 
        <br />
        <br />
</div>

                            </div>

                        </div>
    </div>

             </ContentTemplate></asp:UpdatePanel>
</asp:Content>
