<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_DriverAllocation.aspx.cs" Inherits="FRDP.TMS_DriverAllocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Register Driver Allocation</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
        <div class="bxmain" >
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
            <tr>
                <td align="right" width="40%">
                    Select Driver:</td>
                <td>
                    <asp:DropDownList ID="P12_DropDownList_Driver" runat="server" 
                        DataSourceID="P12_SqlDataSource_Driver" DataTextField="D_Name" 
                        DataValueField="Driver_Id" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="P12_SqlDataSource_Driver" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        
                        SelectCommand="SELECT Driver.Driver_Emp_Id AS Driver_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS D_Name FROM Driver INNER JOIN View_Employee ON Driver.Driver_Emp_Id = View_Employee.EmpID WHERE  (NOT (Driver.Driver_Emp_Id IN (SELECT Driver_Id FROM Driver_Allocation AS Driver_Allocation_1))) ORDER BY D_Name">
                    </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td align="right"> Fuel Type :
                    </td>
                <td>
                    <asp:DropDownList ID="P12_DropDownList_FuelType" runat="server" 
                        AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="1">PSO CARD</asp:ListItem>
                        <asp:ListItem Value="2">Slip System</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Allocation Category:</td>
                <td>
                    <asp:SqlDataSource ID="P12_SqlDataSource_Allocation_Category" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        SelectCommand="SELECT Vehicle_Alocation_Type_Id, Vehicle_Alocation_Type FROM Vehicle_Alocation_Type WHERE (Is_Deactivated = 0) AND (Fuel_System = @Fuel_System) ORDER BY Vehicle_Alocation_Type">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="P12_DropDownList_FuelType" DefaultValue="" 
                                Name="Fuel_System" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="P12_DropDownList_AllocationCategory" runat="server" 
                        DataSourceID="P12_SqlDataSource_Allocation_Category" DataTextField="Vehicle_Alocation_Type" 
                        DataValueField="Vehicle_Alocation_Type_Id" AutoPostBack="True">
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Select Vehicle:</td>
                <td>
                    <asp:DropDownList ID="P12_DropDownList_Vehicle" runat="server" 
                        AutoPostBack="True" DataSourceID="P12_SqlDataSource_Vehicle" 
                        DataTextField="Number" DataValueField="Vehicle_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="P12_SqlDataSource_Vehicle" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        SelectCommand="SELECT Vehicle_Allocation.Vehicle_Id, Vehicle.Number FROM Vehicle_Allocation INNER JOIN Vehicle ON Vehicle_Allocation.Vehicle_Id = Vehicle.Vehicle_id WHERE (Vehicle_Allocation.Vehicle_Alocation_Type_Id = @Vehicle_Alocation_Type_Id) AND (Vehicle_Allocation.Vehicle_Id NOT IN (SELECT Vehicle_Id FROM Driver_Allocation))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="P12_DropDownList_AllocationCategory" 
                                DefaultValue="" Name="Vehicle_Alocation_Type_Id" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    </td>
                <td>
                  <asp:Button ID="P12_Button_Save" CssClass="btn btn-info" runat="server" onclick="P12_Button_Save_Click" 
                        Text="Save" />
                    <asp:SqlDataSource ID="P12_SqlDataSource_Save" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        DeleteCommand="Driver_Allocation_Delete" DeleteCommandType="StoredProcedure" 
                        InsertCommand="INSERT INTO Driver_Allocation(Driver_Id, Vehicle_Id, Emp_Id) VALUES (@Driver_Id, @Vehicle_Id, @Emp_Id)" 
                        ondeleted="P12_SqlDataSource_Save_Deleted" 
                        
                        SelectCommand="SELECT Driver_Allocation.Driver_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS D_Name, Driver_Allocation.Vehicle_Id, Driver_Allocation.ID, Driver_Allocation.Date_Time, Driver_Allocation.Emp_Id, Vehicle.Number, Vehicle_Alocation_Type.Vehicle_Alocation_Type, Vehicle_Allocation.Vehicle_Alocation_Type_Id FROM Driver_Allocation INNER JOIN View_Employee ON Driver_Allocation.Driver_Id = View_Employee.EmpID INNER JOIN Vehicle ON Driver_Allocation.Vehicle_Id = Vehicle.Vehicle_id INNER JOIN Vehicle_Allocation ON Driver_Allocation.Vehicle_Id = Vehicle_Allocation.Vehicle_Id INNER JOIN Vehicle_Alocation_Type ON Vehicle_Allocation.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type.Vehicle_Alocation_Type_Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Driver_Id" Type="Int32" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="P12_DropDownList_Vehicle" Name="Vehicle_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="P12_DropDownList_Driver" Name="Driver_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
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
                                        <span>Driver Allocation List</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
           <br />

                    <asp:GridView ID="P12_GridView_Save" CssClass="abGrid" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Driver_Id" DataSourceID="P12_SqlDataSource_Save" 
                        Width="96%">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Delete" onclick="LinkButton1_Click1" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="D_Name" HeaderText="Driver Name" ReadOnly="True" 
                                SortExpression="D_Name" />
                            <asp:TemplateField HeaderText="Number" SortExpression="Number">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                                    <asp:HiddenField ID="HiddenField005" runat="server" 
                                        Value='<%# Eval("Vehicle_Id") %>' />
                                    <asp:HiddenField ID="HiddenField6" runat="server" 
                                        Value='<%# Eval("Vehicle_Alocation_Type_Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category" 
                                SortExpression="Vehicle_Alocation_Type">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("Vehicle_Alocation_Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allocated Since" SortExpression="Date_Time">
                                <EditItemTemplate>
                                    <asp:Label ID="Label03" runat="server" Text='<%# Bind("Date_Time") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("Date_Time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
               
        <br />
</div>

                            </div>

                        </div>
    </div>
            </ContentTemplate>
                    </asp:UpdatePanel>
</asp:Content>
