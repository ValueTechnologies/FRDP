<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleArival.aspx.cs" Inherits="FRDP.TMS_VehicleArival" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Vehicle Arrival</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
            <table  cellspacing="0" cellpadding="0" border="0" class="tbl_form" width="100%">
                <tr>
                    <td align="right" width="35%">
                        <asp:SqlDataSource ID="P2_SqlDataSource_Display" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                            
                            SelectCommand="SELECT Visit.Visit_Id, Visit.Vehicle_id, Visit.Driver_Emp_Id, Visit.Departure_Time, Visit.Arrival_Time, Visit.Destination, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS DriverName, ISNULL(Vehicle.Number, '') + ' ( ' + ISNULL(Vehicle_BodyType.BodyType, '') + ' )' AS V_Number, Vehicle.CurrentMeterReading, Visit.Status FROM Visit INNER JOIN View_Employee ON Visit.Driver_Emp_Id = View_Employee.EmpID INNER JOIN Vehicle ON Visit.Vehicle_id = Vehicle.Vehicle_id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id WHERE (Visit.Arrival_Time BETWEEN @StartTime AND @EndTime) AND (Visit.Status = 0)" 
                            UpdateCommand="UPDATE Visit SET VisitEnd_MeterReading = @VisitEnd_MeterReading, VisitEnd_Emp_Id = @VisitEnd_Emp_Id, VisitEnd_DateTime = GETDATE(), Arrived_Atdatetime = @Arrived_Atdatetime, Status = 1 WHERE (Visit_Id = @Visit_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="P2_HiddenField_StartTime" Name="StartTime" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="P2_HiddenField_EndTime" Name="EndTime" 
                                    PropertyName="Value" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="P2_TextBox_MeterEnd" 
                                    Name="VisitEnd_MeterReading" PropertyName="Text" />
                                <asp:SessionParameter Name="VisitEnd_Emp_Id" SessionField="Emp_Id" />
                                <asp:ControlParameter ControlID="HiddenField_ArrivedAt" 
                                    Name="Arrived_Atdatetime" PropertyName="Value" />
                                <asp:ControlParameter ControlID="P2_HiddenField_VisitId" Name="Visit_Id" 
                                    PropertyName="Value" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:HiddenField ID="P2_HiddenField_StartTime" runat="server" />
                        <asp:HiddenField ID="P2_HiddenField_EndTime" runat="server" />
                         Select Date: </td>
                    <td>
                        <asp:TextBox ID="P2_WebDateChooser" AutoPostBack="true" OnTextChanged="P2_WebDateChooser_ValueChanged" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="WebDateChooser_PurchasedDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="P2_WebDateChooser"></asp:CalendarExtender>
<%--                        <igsch:WebDateChooser ID="P2_WebDateChooser" runat="server" 
                            onvaluechanged="P2_WebDateChooser_ValueChanged">
                            <AutoPostBack CalendarMonthChanged="True" ValueChanged="True" />
                      </igsch:WebDateChooser>--%>
                  </td>
                    <td>
                  </td>
              </tr>
             </table>
             
              <table  cellspacing="0" cellpadding="0" border="0" class="tbl_form" width="100%"> 
              
              
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="P2_GridView_Display" runat="server" 
                            AutoGenerateColumns="False" DataKeyNames="Visit_Id" 
                            DataSourceID="P2_SqlDataSource_Display" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="V_Number" HeaderText="Vehicle" 
                                    SortExpression="V_Number" />
                                <asp:BoundField DataField="DriverName" HeaderText="Driver" ReadOnly="True" 
                                    SortExpression="DriverName" />
                                <asp:BoundField DataField="Departure_Time" HeaderText="Departure" 
                                    SortExpression="Departure_Time" />
                                <asp:BoundField DataField="Arrival_Time" HeaderText="Arrival" 
                                    SortExpression="Arrival_Time" />
                                <asp:BoundField DataField="Destination" HeaderText="Destination" 
                                    SortExpression="Destination" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton11" CssClass="btn btn-info" runat="server" onclick="LinkButton11_Click">Arrival</asp:LinkButton>
                                        <asp:HiddenField ID="HiddenField_Visit_Id" runat="server" 
                                            Value='<%# Eval("Visit_Id") %>' />
                                        <asp:HiddenField ID="HiddenField_Vehicle_id" runat="server" 
                                            Value='<%# Eval("Vehicle_id") %>' />
                                        <asp:HiddenField ID="HiddenField_Driver_Emp_Id" runat="server" 
                                            onvaluechanged="HiddenField_Driver_Emp_Id_ValueChanged" 
                                            Value='<%# Eval("Driver_Emp_Id") %>' />
                                        <asp:HiddenField ID="HiddenField_Departure_Time" runat="server" 
                                            Value='<%# Eval("Departure_Time") %>' />
                                        <asp:HiddenField ID="HiddenField_MeterReading" runat="server" 
                                            Value='<%# Eval("CurrentMeterReading") %>' />
                                        <asp:HiddenField ID="HiddenField_Arrival_Time" runat="server" 
                                            Value='<%# Eval("Arrival_Time") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <table  cellspacing="0" cellpadding="0" border="0" class="tbl_form" width="100%">
                            <tr>
                                <td class="style35" style="text-align: center">
                              </td>
                            </tr>
                            <tr>
                                <td class="style34" style="text-align: center">
                                    <asp:SqlDataSource ID="P1A_SqlDataSource_Issue_SlipReturned" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        DeleteCommand="DELETE FROM [Visit_Issue_Slip] WHERE [Visit_Issue_Slip_Id] = @Visit_Issue_Slip_Id" 
                                        InsertCommand="INSERT INTO Visit_Issue_Slip(Fuel_Station_Id, Vehicle_FuelType_Id, Slip_No, Value, Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_id, Emp_Id, FS_AccountNo, FS_BookNo) VALUES (@Fuel_Station_Id, @Vehicle_FuelType_Id, @Slip_No, @Value, @Vehicle_Requisition_ApproveByTransStaff_Main_Id, @Vehicle_id, @Emp_Id, @FS_AccountNo, @FS_BookNo)" 
                                        oninserted="P1A_SqlDataSource_Issue_Slip_Inserted" 
                                        SelectCommand="SELECT Visit_Issue_Slip.Visit_Issue_Slip_Id, Visit_Issue_Slip.Fuel_Station_Id, Visit_Issue_Slip.Vehicle_FuelType_Id, Visit_Issue_Slip.Slip_No, Visit_Issue_Slip.Value, Visit_Issue_Slip.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Visit_Issue_Slip.Vehicle_id, Visit_Issue_Slip.Date_Time, Visit_Issue_Slip.Emp_Id, Fuel_Station.Fuel_Station_Name, Vehicle_FuelType.Fuel, Vehicle_FuelType.Description, Visit_Issue_Slip.FS_AccountNo, Visit_Issue_Slip.FS_BookNo, Visit_Issue_Slip.Visit_Id FROM Visit_Issue_Slip INNER JOIN Fuel_Station ON Visit_Issue_Slip.Fuel_Station_Id = Fuel_Station.Fuel_Station_Id INNER JOIN Vehicle_FuelType ON Visit_Issue_Slip.Vehicle_FuelType_Id = Vehicle_FuelType.Vehicle_FuelType_Id WHERE (Visit_Issue_Slip.Visit_Id = @Visit_Id) AND (Visit_Issue_Slip.Vehicle_id = @Vehicle_id)" 
                                        UpdateCommand="UPDATE Visit_Issue_Slip SET Returned = 1 WHERE (Visit_Issue_Slip_Id = @Visit_Issue_Slip_Id)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="P2_HiddenField_VisitId" Name="Visit_Id" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="P2_HiddenField_Vehicleid" Name="Vehicle_id" 
                                                PropertyName="Value" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="Visit_Issue_Slip_Id" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldSlipId" Name="Visit_Issue_Slip_Id" 
                                                PropertyName="Value" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="P1A_DropDownList_FuelStation" 
                                                Name="Fuel_Station_Id" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="P1A_DropDownList_VFuleType" 
                                                Name="Vehicle_FuelType_Id" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="P1A_TextBox_SlipNo" Name="Slip_No" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="P1A_TextBox_Value" Name="Value" 
                                                PropertyName="Text" Type="Double" />
                                            <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" 
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="HiddenField_VId" Name="Vehicle_id" 
                                                PropertyName="Value" Type="Int32" />
                                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                                            <asp:ControlParameter ControlID="P1ALabel_FS_AC" Name="FS_AccountNo" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="P1A_TextBox_BookNo" Name="FS_BookNo" 
                                                PropertyName="Text" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="P2_SqlDataSource_CurrentFuel" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        InsertCommand="INSERT INTO Visit_Fuel_Status(Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_id, Vehicle_FuelType_Id, StartVal, Start_Emp_Id, Visit_Id) VALUES (@Vehicle_Requisition_ApproveByTransStaff_Main_Id, @Vehicle_id, @Vehicle_FuelType_Id, @StartVal, @Start_Emp_Id, @Visit_Id)" 
                                        SelectCommand="SELECT Vehicle_Fuel.Vehicle_Fuel_Id, Vehicle_FuelType.Fuel, Vehicle_FuelType.Description, Vehicle_Fuel.Vehicle_FuelType_Id, Vehicle_Fuel.Current_Fuel FROM Vehicle_Fuel INNER JOIN Vehicle_FuelType ON Vehicle_Fuel.Vehicle_FuelType_Id = Vehicle_FuelType.Vehicle_FuelType_Id WHERE (Vehicle_Fuel.Vehicle_id = @Vehicle_id)" 
                                        UpdateCommand="UPDATE Visit_Fuel_Status SET EndVal = @EndVal, End_Emp_Id = @End_Emp_Id, End_DateTime = GETDATE() WHERE (Visit_Id = @Visit_Id) AND (Vehicle_id = @Vehicle_id) AND (Vehicle_FuelType_Id = @Vehicle_FuelType_Id)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="P2_HiddenField_Vehicleid" Name="Vehicle_id" 
                                                PropertyName="Value" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="HiddenField_EndVal" Name="EndVal" 
                                                PropertyName="Value" />
                                            <asp:SessionParameter Name="End_Emp_Id" SessionField="Emp_Id" />
                                            <asp:ControlParameter ControlID="P2_HiddenField_VisitId" Name="Visit_Id" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="P2_HiddenField_Vehicleid" Name="Vehicle_id" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="HiddenField_Vehicle_FuelType_Id" 
                                                Name="Vehicle_FuelType_Id" PropertyName="Value" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" />
                                            <asp:ControlParameter ControlID="P2_HiddenField_Vehicleid" Name="Vehicle_id" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="HiddenField_VFType_Id0" 
                                                Name="Vehicle_FuelType_Id" PropertyName="Value" />
                                            <asp:ControlParameter ControlID="HiddenField_VF_Current" Name="StartVal" 
                                                PropertyName="Value" />
                                            <asp:SessionParameter Name="Start_Emp_Id" SessionField="Emp_Id" />
                                            <asp:ControlParameter ControlID="P1_HiddenField_OutPut_Visit_Id" 
                                                Name="Visit_Id" PropertyName="Value" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:HiddenField ID="HiddenField_Vehicle_FuelType_Id" runat="server" />
                                    <asp:HiddenField ID="HiddenField_EndVal" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldSlipId" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Panel ID="Panel6" runat="server" Visible="False">
                            <table border="0" cellpadding="0" cellspacing="0" frame="box" 
                                style="width:100%;">
                                <tr>
                                    <td class="style41">
                                  </td>
                                    <td class="style41">
                                  </td>
                                    <td class="style38" colspan="2" style="text-align: center">
                                        <b>Remaining Astimated Fuel</b></td>
                                </tr>
                                <tr>
                                    <td align="right" class="style42">
                                        Date:</td>
                                    <td class="style41">
                                        <asp:TextBox ID="WebDateChooser2" runat="server"></asp:TextBox>
                                        <%--<igsch:WebDateChooser ID="WebDateChooser2" runat="server" CssClass="style41">
                                        </igsch:WebDateChooser>--%>
                                    </td>
                                    <td class="style38" colspan="2" rowspan="3" style="text-align: center">
                                        <asp:GridView ID="P2_GridView_Fuel" runat="server" AutoGenerateColumns="False" 
                                            CssClass="style37" DataKeyNames="Vehicle_Fuel_Id" 
                                            DataSourceID="P2_SqlDataSource_CurrentFuel">
                                            <Columns>
                                                <asp:BoundField DataField="Fuel" HeaderText="Fuel" SortExpression="Fuel" />
                                                <asp:TemplateField HeaderText="Value">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" 
                                                            ontextchanged="TextBox2_TextChanged" Text='<%# Bind("Current_Fuel") %>'></asp:TextBox>
                                                        <asp:HiddenField ID="HiddenField_VFType_Id1" runat="server" 
                                                            Value='<%# Eval("Vehicle_FuelType_Id") %>' />
                                                        <asp:HiddenField ID="HiddenField1" runat="server" 
                                                            Value='<%# Eval("Vehicle_Fuel_Id") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Description" HeaderText="Unit" 
                                                    SortExpression="Description" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style42">
                                        Time:</td>
                                    <td class="style41">
                                        <asp:TextBox ID="P15_WebDateTimeEdit1" runat="server"></asp:TextBox>
<%--                                        <igtxt:WebDateTimeEdit ID="P15_WebDateTimeEdit1" runat="server" DataMode="Text" 
                                            DisplayModeFormat="t" EditModeFormat="t">
                                        </igtxt:WebDateTimeEdit--%>>
                                        <asp:HiddenField ID="HiddenField_ArrivedAt" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style42">
                                        Meter Reading:</td>
                                    <td class="style41">
                                        <asp:TextBox ID="P2_TextBox_MeterEnd" runat="server" AutoPostBack="True" 
                                            ontextchanged="P2_TextBox_MeterEnd_TextChanged" 
                                            Text='<%# Eval("CurrentMeterReading") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                </tr>
                                <tr>
                                    <td class="style39" colspan="4" style="text-align: center">
                                        <b><span class="style39">Returned Fuel Issue Slips</b></td>
                                </tr>
                                <tr>
                                    <td class="style39" colspan="4" style="text-align: center">
                                        <asp:GridView ID="P1A_GridView_Issue_Slip_Return" runat="server" 
                                            AutoGenerateColumns="False" CssClass="style39" 
                                            DataKeyNames="Visit_Issue_Slip_Id" 
                                            DataSourceID="P1A_SqlDataSource_Issue_SlipReturned" Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Fuel_Station_Name" HeaderText="Fuel Station" 
                                                    SortExpression="Fuel_Station_Name" />
                                                <asp:BoundField DataField="FS_AccountNo" HeaderText="Account No." 
                                                    SortExpression="FS_AccountNo" />
                                                <asp:BoundField DataField="FS_BookNo" HeaderText="Book No." 
                                                    SortExpression="FS_BookNo" />
                                                <asp:BoundField DataField="Slip_No" HeaderText="Slip No." 
                                                    SortExpression="Slip_No" />
                                                <asp:BoundField DataField="Fuel" HeaderText="Fuel" SortExpression="Fuel" />
                                                <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
                                                <asp:BoundField DataField="Description" SortExpression="Description" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                                        <asp:HiddenField ID="HiddenField_SlipId" runat="server" 
                                                            Value='<%# Eval("Visit_Issue_Slip_Id") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style39">
                                  </td>
                                    <td class="style39">
                                  </td>
                                    <td class="style39">
                                  </td>
                                    <td class="style39">
                                  </td>
                                </tr>
                                <tr>
                                    <td class="style40" colspan="4" style="text-align: center">
                                        <b>Problems</b></td>
                                </tr>
                                <tr>
                                    <td class="style33">
                                        <b>Item Name :</b></td>
                                    <td class="style36">
                                        Repair Type</td>
                                    <td class="style33">
                                        <strong style="text-align: center">No. of Items </strong>
                                    </td>
                                    <td class="style40">
                                  </td>
                                </tr>
                                <tr>
                                    <td class="style40">
                                        <asp:SqlDataSource ID="SqlDataSourceItem" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                            SelectCommand="SELECT [Item_Id], [Item_Name] FROM [Items]">
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DropDownListItemName" runat="server" 
                                            DataSourceID="SqlDataSourceItem" DataTextField="Item_Name" 
                                            DataValueField="Item_Id"  Width="230px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style40">
                                        <asp:DropDownList ID="DropDownListR_Type" runat="server" 
                                            DataSourceID="SqlDataSourceRepair_Type" DataTextField="Repair_Type" 
                                            DataValueField="Repair_Id" Width="229px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style40">
                                        <asp:TextBox ID="TextBoxNoOfitems" runat="server"  
                                            Width="225px"></asp:TextBox>
                                        <asp:SqlDataSource ID="SqlDataSourceRepair_Type" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                            SelectCommand="SELECT [Repair_Id], [Repair_Type] FROM [Repair_Type]">
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style40">
                                  </td>
                                </tr>
                                <tr>
                                    <td class="style40">
                                        <b>Description:</b></td>
                                    <td class="style40" colspan="2">
                                        <asp:TextBox ID="TextBox_Description" runat="server" Height="53px" 
                                            TextMode="MultiLine" Width="524px"></asp:TextBox>
                                    </td>
                                    <td class="style40">
                                        <asp:Button ID="Button_AddProblem" CssClass="btn btn-info" runat="server" 
                                            onclick="Button_AddProblem_Click" Text=" + " />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style40" colspan="4" style="text-align: center">
                                        <asp:Label ID="Label61" runat="server" ForeColor="Red" 
                                            style="text-align: center" Text="Item Name Already  Exists" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style40" colspan="4" style="text-align: center">
                                        <asp:HiddenField ID="P2_HiddenField_Vehicleid" runat="server" />
                                        <asp:HiddenField ID="P2_HiddenField_ArrivalTime" runat="server" />
                                        <asp:SqlDataSource ID="SqlDataSourceSave" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                            InsertCommand="TMS_Insert_RepairVehicle" InsertCommandType="StoredProcedure" 
                                            ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>">
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="DropDownListVehicleNo" Name="Vehicle_Id" 
                                                    PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="DropDownListR_Type" Name="Repair_Id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="DropDownListItemName" Name="Item_Id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="TextBoxNoOfitems" Name="No_ofItems" 
                                                    PropertyName="Text" Type="Int32" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                        <asp:HiddenField ID="P2_HiddenField_VisitId" runat="server" />
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            CssClass="Grid" DataKeyNames="Visit_Problem_Id" 
                                            DataSourceID="SqlDataSourceGrid" style="background-color: #FFCCCC" Width="100%">
                                            <Columns>
                                                <asp:CommandField ShowDeleteButton="True" />
                                                <asp:BoundField DataField="Item_Name" HeaderText="Item Name" 
                                                    SortExpression="Item_Name" />
                                                <asp:BoundField DataField="Repair_Type" HeaderText="Repair Type" 
                                                    SortExpression="Repair_Type" />
                                                <asp:BoundField DataField="NoOfItems" HeaderText="No Of Items" 
                                                    SortExpression="NoOfItems" />
                                                <asp:BoundField DataField="Driver_Name" HeaderText="Driver Name" 
                                                    ReadOnly="True" SortExpression="Driver_Name" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description" />
                                                <asp:BoundField DataField="Date_Time" HeaderText="Date" 
                                                    SortExpression="Date_Time" />
                                            </Columns>
                                            <HeaderStyle CssClass="GridHeader" />
                                            <AlternatingRowStyle CssClass="GridAltItem" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSourceGrid" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                            DeleteCommand="DELETE FROM Visit_Problem WHERE (Visit_Problem_Id = @Visit_Problem_Id)" 
                                            InsertCommand="INSERT INTO Visit_Problem(Vehicle_Id, Repair_Type_Id, Item_Id, NoOfItems, ComplaintByDriver_EmpId, Visit_Id, Emp_Id, Description, MeterReading) VALUES (@Vehicle_Id, @Repair_Type_Id, @Item_Id, @NoOfItems, @ComplaintByDriver_EmpId, @Visit_Id, @Emp_Id, @Description, @MeterReading)" 
                                            
                                            SelectCommand="SELECT Vehicle_Info.RegistrationNO, Items.Item_Name, Repair_Type.Repair_Type, Visit_Problem.Description, Visit_Problem.is_forward, Visit_Problem.Vehicle_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Driver_Name, CONVERT (VARCHAR(50), Visit_Problem.Date_Time, 103) AS Date_Time, Visit_Problem.NoOfItems, Visit_Problem.Visit_Problem_Id FROM Visit_Problem INNER JOIN Vehicle_Info ON Visit_Problem.Vehicle_Id = Vehicle_Info.Vehicle_id INNER JOIN Items ON Visit_Problem.Item_Id = Items.Item_Id INNER JOIN Repair_Type ON Visit_Problem.Repair_Type_Id = Repair_Type.Repair_Id INNER JOIN View_Employee ON Visit_Problem.ComplaintByDriver_EmpId = View_Employee.EmpID WHERE (Visit_Problem.is_forward = 0) AND (Visit_Problem.Vehicle_Id = @Vehicle_Id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="P2_HiddenField_Vehicleid" Name="Vehicle_Id" 
                                                    PropertyName="Value" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="Visit_Problem_Id" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="P2_HiddenField_Vehicleid" Name="Vehicle_Id" 
                                                    PropertyName="Value" />
                                                <asp:ControlParameter ControlID="DropDownListR_Type" Name="Repair_Type_Id" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DropDownListItemName" Name="Item_Id" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="TextBoxNoOfitems" Name="NoOfItems" 
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="P2_HiddenField_Driver_EmpId" 
                                                    Name="ComplaintByDriver_EmpId" PropertyName="Value" />
                                                <asp:ControlParameter ControlID="P2_HiddenField_VisitId" Name="Visit_Id" 
                                                    PropertyName="Value" />
                                                <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                                                <asp:ControlParameter ControlID="TextBox_Description" Name="Description" 
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="P2_TextBox_MeterEnd" Name="MeterReading" 
                                                    PropertyName="Text" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                        <asp:HiddenField ID="P2_HiddenField_DepartureTime" runat="server" />
                                        <asp:HiddenField ID="P2_HiddenField_Driver_EmpId" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center">
                                        <asp:Button ID="Button_Save" CssClass="btn btn-info" runat="server" onclick="Button_Save_Click" 
                                            Text="Save" Width="260px" />
                                        <asp:Button ID="Button2" CssClass="btn btn-info" runat="server" onclick="Button2_Click" Text="Cancel" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                    <td>
                                  </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
<br /></div>

                            </div>

                        </div>
    </div>

    </ContentTemplate></asp:UpdatePanel>
</asp:Content>
