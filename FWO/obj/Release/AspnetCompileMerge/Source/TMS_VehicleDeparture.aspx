<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleDeparture.aspx.cs" Inherits="FRDP.TMS_VehicleDeparture" %>
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
                                        <span>Vehicle Departure</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
            <asp:SqlDataSource ID="P1_SqlDataSourceAllreadyReservedV" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        
                                        
                                        
                
                
                
                
                
                SelectCommand="SELECT Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id, Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time, Vehicle_Requisition_ApproveByTransStaff_Main.End_Time, Vehicle_Requisition_ApproveByTransStaff_Main.Status, ISNULL(Vehicle.Number, '') + ' ( ' + ISNULL(Vehicle_BodyType.BodyType, '') + ' )' AS Number, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS DriverName, Driver_Allocation.Driver_Id, Vehicle.CurrentMeterReading, Vehicle_Requisition_ApproveByTransStaff_Main.Destination FROM Vehicle_Requisition_ApproveByTransStaff_Main INNER JOIN Vehicle ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id = Vehicle.Vehicle_id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN Driver_Allocation ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id = Driver_Allocation.Vehicle_Id INNER JOIN View_Employee ON Driver_Allocation.Driver_Id = View_Employee.EmpID WHERE (@START_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 2) OR (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 2) AND (@End_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) OR (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 2) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time BETWEEN @START_Time AND @End_Time)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="P1_HiddenField_StartTime" Name="START_Time" 
                                                PropertyName="Value" />
                    <asp:ControlParameter ControlID="P1_HiddenField_EndTime" Name="End_Time" 
                                                PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="P1_HiddenField_BindStartDate" runat="server" />
            <asp:HiddenField ID="P1_HiddenField_BindEndDate" runat="server" />
            <asp:HiddenField ID="P1_HiddenField_EndTime" runat="server" />
            <asp:HiddenField ID="P1_HiddenField_StartTime" runat="server" />
            <asp:HiddenField ID="P1_HiddenFieldBind_ID" runat="server" />
            
             <div class="bxmain">
            <table  cellspacing="0" cellpadding="0" border="0" class="tbl_form" width="100%">
                <tr>
                  <td align="right" width="40%">
                      Departure Date:</td>
                    <td>

                       
                        <asp:TextBox ID="WebDateChooser1" AutoPostBack="true" OnTextChanged="WebDateChooser1_ValueChanged" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="WebDateChooser_PurchasedDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="WebDateChooser1"></asp:CalendarExtender>
<%--                        <igsch:WebDateChooser ID="WebDateChooser1" runat="server" 
                            onvaluechanged="WebDateChooser1_ValueChanged">
                            <AutoPostBack CalendarMonthChanged="True" ValueChanged="True" />
                      </igsch:WebDateChooser>--%>
                        <asp:SqlDataSource ID="P1_SqlDataSource_Name" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                            SelectCommand="SELECT Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id, Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_ApproveByTransStaff_Id, Vehicle_Requisition.Destination, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Name, Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_Requisition_ApproveByTransStaff_Main.Status, Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time, Vehicle_Requisition_ApproveByTransStaff_Main.End_Time FROM Vehicle_Requisition_ApproveByTransStaff_Main INNER JOIN Vehicle_Requisition_ApproveByTransStaff INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Requisition_ApproveByTransStaff_Main_Id = Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_ApproveByTransStaff_Main_Id WHERE (Vehicle_Requisition.Is_Canceld_By_Staf_Emp = 0) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 0)">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="P1_SqlDataSource_Vehicle" runat="server">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="P1_SqlDataSource_Driver" runat="server">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="P1_SqlDataSource_Destination" runat="server">
                        </asp:SqlDataSource>
                        <asp:HiddenField ID="P1_HiddenField_OutPut_Visit_Id" runat="server" />
                        <asp:HiddenField ID="P1_HiddenField_SelectedRow" runat="server" />
                  </td>
                </tr>
                 </table>
                 </div>
                 <br />

                        <asp:GridView ID="P1_GridViewAllreadyReservedV" runat="server" 
                            AutoGenerateColumns="False" 
                            DataKeyNames="Vehicle_Requisition_ApproveByTransStaff_Main_Id" 
                            DataSourceID="P1_SqlDataSourceAllreadyReservedV" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Ready For Departure" SortExpression="Number">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Number") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" frame="void" 
                                            style="width:100%;">
                                            <tr>
                                                <td class="style17" width="180PX">
                                                    <b style="text-align: center">Vehicle</b></td>
                                                <td class="style17">
                                                    <b>Driver</b></td>
                                                <td class="style17">
                                                    <b>Departure</b></td>
                                                <td class="style17">
                                                    <b>Arrival</b></td>
                                                <td class="style28">
                                                    Destination</td>
                                                <td class="style10">
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td class="style16" width="180PX">
                                                    <asp:Label ID="Label60" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                                                </td>
                                                <td class="style16">
                                                    <asp:Label ID="Label59" runat="server" Text='<%# Eval("DriverName") %>'></asp:Label>
                                                </td>
                                                <td class="style16">
                                                    <asp:Label ID="P1A_Label_DepartureTime" runat="server" 
                                                        Text='<%# Bind("Start_Time") %>'></asp:Label>
                                                </td>
                                                <td class="style16">
                                                    <asp:Label ID="P1A_Label_Arrival" runat="server" Text='<%# Bind("End_Time") %>'></asp:Label>
                                                </td>
                                                <td class="style16">
                                                    <asp:Label ID="P1_Label_Destination" runat="server" 
                                                        Text='<%# Eval("Destination") %>'></asp:Label>
                                                </td>
                                                <td class="style16">
                                                    <asp:LinkButton ID="LinkButton10" runat="server" onclick="LinkButton10_Click">Departure</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color: #99CCFF" width="180PX">
                                                    <asp:HiddenField ID="HiddenField_VId" runat="server" 
                                                        Value='<%# Eval("Vehicle_Id") %>' />
                                                    <asp:HiddenField ID="HiddenField_Main_Id" runat="server" 
                                                        Value='<%# Eval("Vehicle_Requisition_ApproveByTransStaff_Main_Id") %>' />
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                        
                                                        SelectCommand="SELECT Vehicle_Requisition.Destination, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, View_Designation.Designation_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Name, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Vehicle_Requisition_ApproveByTransStaff_Main_Id FROM View_Employee INNER JOIN Vehicle_Requisition ON View_Employee.EmpID = Vehicle_Requisition.Staf_Emp_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID WHERE (Vehicle_Requisition.Is_Canceld_By_Staf_Emp = 0) AND (Vehicle_Requisition.Vehicle_Requisition_ApproveByTransStaff_Main_Id = @Vehicle_Requisition_ApproveByTransStaff_Main_Id)" 
                                                        
                                                        InsertCommand="Visit_Emp_Insert" InsertCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" 
                                                                Type="Int32" />
                                                        </SelectParameters>
                                                        <InsertParameters>
                                                            <asp:ControlParameter ControlID="P1_HiddenField_OutPut_Visit_Id" 
                                                                Name="Visit_Id" PropertyName="Value" />
                                                            <asp:ControlParameter ControlID="HiddenField_Visited_StafEmpId0" 
                                                                Name="Visited_StafEmpId" PropertyName="Value" />
                                                            <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" />
                                                            <asp:ControlParameter ControlID="HiddenField_VId" Name="Vehicle_id" 
                                                                PropertyName="Value" />
                                                            <asp:ControlParameter ControlID="HiddenField_Vehicle_Requisition_Id0" 
                                                                Name="Vehicle_Requisition_Id" PropertyName="Value" />
                                                        </InsertParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:HiddenField ID="HiddenField_Visited_StafEmpId0" runat="server" />
                                                    <asp:SqlDataSource ID="P1_SqlDataSource_Save" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                        InsertCommand="[Visit_Start_Insert]" InsertCommandType="StoredProcedure" 
                                                        SelectCommand="SELECT * FROM [Visit]" 
                                                        oninserted="P1_SqlDataSource_Save_Inserted">
                                                        <InsertParameters>
                                                            <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" 
                                                                Type="Int32" />
                                                            <asp:ControlParameter ControlID="HiddenField_VId" Name="Vehicle_id" 
                                                                PropertyName="Value" Type="Int32" />
                                                            <asp:ControlParameter ControlID="P1A_TextBox_MeterStart" 
                                                                Name="VisitStart_MeterReading" PropertyName="Text" Type="Double" />
                                                            <asp:SessionParameter Name="VisitStart_Emp_Id" SessionField="Emp_Id" 
                                                                Type="Int32" />
                                                            <asp:ControlParameter ControlID="P1A_DropDownList_Driver" Name="Driver_Emp_Id" 
                                                                PropertyName="SelectedValue" Type="Int32" />
                                                            <asp:ControlParameter Name="Departure_Time" Type="DateTime" 
                                                                ControlID="P1A_Label_DepartureTime" PropertyName="Text" />
                                                            <asp:ControlParameter ControlID="P1A_Label_Arrival" Name="Arrival_Time" 
                                                                PropertyName="Text" Type="DateTime" />
                                                            <asp:ControlParameter ControlID="P1_Label_Destination" Name="Destination" 
                                                                PropertyName="Text" Type="String" />
                                                            <asp:Parameter Name="Visit_Id_OutPut" Type="Int32" Direction="InputOutput" />
                                                        </InsertParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:HiddenField ID="HiddenField_Vehicle_Requisition_Id0" runat="server" />
                                                </td>
                                                <td colspan="5">
                                                    <asp:Panel ID="Panel1A" runat="server" Visible="False">
                                                        <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                                            <tr>
                                                                <td class="style22">
                                                                    Meter Reading</td>
                                                                <td class="style18">
                                                                    <asp:TextBox ID="P1A_TextBox_MeterStart" runat="server" AutoPostBack="True" 
                                                                        ontextchanged="P1A_TextBox_MeterStart_TextChanged" 
                                                                        Text='<%# Eval("CurrentMeterReading") %>'></asp:TextBox>
                                                                </td>
                                                                <td class="style18" rowspan="2">
                                                                    <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" 
                                                                        CssClass="style24" DataKeyNames="Vehicle_Fuel_Id" 
                                                                        DataSourceID="P1A_SqlDataSource_CurrentFuel">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="Fuel" HeaderText="Fuel" SortExpression="Fuel" />
                                                                            <asp:TemplateField HeaderText="Value">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Current_Fuel") %>' 
                                                                                        AutoPostBack="True" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
                                                                                    <asp:HiddenField ID="HiddenField_VFType_Id" runat="server" 
                                                                                        Value='<%# Eval("Vehicle_FuelType_Id") %>' />
                                                                                    <asp:HiddenField ID="HiddenField2" runat="server" 
                                                                                        Value='<%# Eval("Vehicle_Fuel_Id") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="Description" HeaderText="Unit" 
                                                                                SortExpression="Description" />
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="P1A_SqlDataSource_CurrentFuel" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                        
                                                                        SelectCommand="SELECT Vehicle_Fuel.Vehicle_Fuel_Id, Vehicle_FuelType.Fuel, Vehicle_FuelType.Description, Vehicle_Fuel.Vehicle_FuelType_Id, Vehicle_Fuel.Current_Fuel FROM Vehicle_Fuel INNER JOIN Vehicle_FuelType ON Vehicle_Fuel.Vehicle_FuelType_Id = Vehicle_FuelType.Vehicle_FuelType_Id WHERE (Vehicle_Fuel.Vehicle_id = @Vehicle_id)" 
                                                                        InsertCommand="INSERT INTO Visit_Fuel_Status(Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_id, Vehicle_FuelType_Id, StartVal, Start_Emp_Id, Visit_Id) VALUES (@Vehicle_Requisition_ApproveByTransStaff_Main_Id, @Vehicle_id, @Vehicle_FuelType_Id, @StartVal, @Start_Emp_Id, @Visit_Id)">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="HiddenField_VId" Name="Vehicle_id" 
                                                                                PropertyName="Value" />
                                                                        </SelectParameters>
                                                                        <InsertParameters>
                                                                            <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" />
                                                                            <asp:ControlParameter ControlID="HiddenField_VId" Name="Vehicle_id" 
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
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style18">
                                                                    Driver<asp:SqlDataSource ID="P1A_SqlDataSource_Fuel_Type" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                        SelectCommand="SELECT Vehicle_FuelType.Fuel, Vehicle_FuelType.Vehicle_FuelType_Id FROM Vehicle_Fuel INNER JOIN Vehicle_FuelType ON Vehicle_Fuel.Vehicle_FuelType_Id = Vehicle_FuelType.Vehicle_FuelType_Id WHERE (Vehicle_Fuel.Vehicle_id = @Vehicle_id)">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="HiddenField_VId" Name="Vehicle_id" 
                                                                                PropertyName="Value" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="P1A_SqlDataSource_FuleStation" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                        SelectCommand="SELECT Fuel_Station.Fuel_Station_Id, Fuel_Station.Fuel_Station_Name + ' ( ' + ISNULL(Fuel_Station_Type.Fuel_Station_Type_Name, '') + ' )' AS FName FROM Fuel_Station INNER JOIN Fuel_Station_Type ON Fuel_Station.Fuel_Station_Type_Id = Fuel_Station_Type.Fuel_Station_Type_Id">
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td class="style18">
                                                                    <asp:DropDownList ID="P1A_DropDownList_Driver" runat="server" 
                                                                        DataSourceID="P1A_SqlDataSource_Driver" DataTextField="DName" 
                                                                        DataValueField="Driver_Emp_Id" SelectedValue='<%# Eval("Driver_Id") %>'>
                                                                    </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="P1A_SqlDataSource_Driver" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                        SelectCommand="SELECT Driver.Driver_Emp_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS DName FROM Driver INNER JOIN View_Employee ON Driver.Driver_Emp_Id = View_Employee.EmpID WHERE (View_Employee.Is_Deleted = 0)">
                                                                    </asp:SqlDataSource>
                                                                    <asp:HiddenField ID="HiddenField_VFType_Id0" runat="server" />
                                                                    <asp:HiddenField ID="HiddenField_VF_Current" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td  colspan="3">
                                                                    <table  cellspacing="0" cellpadding="0" border="0" class="tbl_form" width="100%">
                                                                        <tr>
                                                                            <td class="style27" colspan="9">
                                                                                <b style="text-align: left">Issue Slip</b></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <b>Station</b></td>
                                                                            <td class="style19">
                                                                                AC No</td>
                                                                            <td>
                                                                                <b>Book No.</b></td>
                                                                            <td>
                                                                                <b>Slip No.</b></td>
                                                                            <td>
                                                                                <b>Fuel</b></td>
                                                                            <td>
                                                                                <b>Value</b></td>
                                                                            <td>
                                                                                </td>
                                                                            <td>
                                                                                </td>
                                                                            <td>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:DropDownList ID="P1A_DropDownList_FuelStation" runat="server" 
                                                                                    AutoPostBack="True" DataSourceID="P1A_SqlDataSource_FuleStation" 
                                                                                    DataTextField="FName" DataValueField="Fuel_Station_Id" 
                                                                                    onprerender="P1A_DropDownList_FuelStation_PreRender">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="P1ALabel_FS_AC" runat="server" Text="Label"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="P1A_TextBox_BookNo" runat="server" AutoPostBack="True" 
                                                                                    ontextchanged="P1A_TextBox_BookNo_TextChanged" Width="80px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="P1A_TextBox_SlipNo" runat="server" AutoPostBack="True" 
                                                                                    ontextchanged="P1A_TextBox_SlipNo_TextChanged" Width="80px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="P1A_DropDownList_VFuleType" runat="server" 
                                                                                    AutoPostBack="True" DataSourceID="P1A_SqlDataSource_Fuel_Type" 
                                                                                    DataTextField="Fuel" DataValueField="Vehicle_FuelType_Id" 
                                                                                    onprerender="P1A_DropDownList_VFuleType_PreRender">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="P1A_TextBox_Value" runat="server" Width="80px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="P1A_Label_Unit" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="P1A_Button_UseSlipOf" runat="server" 
                                                                                    onclick="P1A_Button_UseSlipOf_Click" Text=" + " />
                                                                            </td>
                                                                            <td>
                                                                                </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                                                                            </tr>
                                                            <tr>
                                                                <td  colspan="3">
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                <td  colspan="3">
                                                                    <asp:GridView ID="P1A_GridView_Issue_Slip" runat="server" 
                                                                        AutoGenerateColumns="False" DataKeyNames="Visit_Issue_Slip_Id" 
                                                                        DataSourceID="P1A_SqlDataSource_Issue_Slip" Width="100%">
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
                                                                            <asp:CommandField ShowDeleteButton="True" />
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="P1A_SqlDataSource_Issue_Slip" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                        DeleteCommand="DELETE FROM [Visit_Issue_Slip] WHERE [Visit_Issue_Slip_Id] = @Visit_Issue_Slip_Id" 
                                                                        InsertCommand="INSERT INTO Visit_Issue_Slip(Fuel_Station_Id, Vehicle_FuelType_Id, Slip_No, Value, Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_id, Emp_Id, FS_AccountNo, FS_BookNo) VALUES (@Fuel_Station_Id, @Vehicle_FuelType_Id, @Slip_No, @Value, @Vehicle_Requisition_ApproveByTransStaff_Main_Id, @Vehicle_id, @Emp_Id, @FS_AccountNo, @FS_BookNo)" 
                                                                        
                                                                        
                                                                        SelectCommand="SELECT Visit_Issue_Slip.Visit_Issue_Slip_Id, Visit_Issue_Slip.Fuel_Station_Id, Visit_Issue_Slip.Vehicle_FuelType_Id, Visit_Issue_Slip.Slip_No, Visit_Issue_Slip.Value, Visit_Issue_Slip.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Visit_Issue_Slip.Vehicle_id, Visit_Issue_Slip.Date_Time, Visit_Issue_Slip.Emp_Id, Fuel_Station.Fuel_Station_Name, Vehicle_FuelType.Fuel, Vehicle_FuelType.Description, Visit_Issue_Slip.FS_AccountNo, Visit_Issue_Slip.FS_BookNo FROM Visit_Issue_Slip INNER JOIN Fuel_Station ON Visit_Issue_Slip.Fuel_Station_Id = Fuel_Station.Fuel_Station_Id INNER JOIN Vehicle_FuelType ON Visit_Issue_Slip.Vehicle_FuelType_Id = Vehicle_FuelType.Vehicle_FuelType_Id WHERE (Visit_Issue_Slip.Vehicle_id = @Vehicle_id) AND (Visit_Issue_Slip.Vehicle_Requisition_ApproveByTransStaff_Main_Id = @Vehicle_Requisition_ApproveByTransStaff_Main_Id)" 
                                                                        oninserted="P1A_SqlDataSource_Issue_Slip_Inserted">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="HiddenField_VId" Name="Vehicle_id" 
                                                                                PropertyName="Value" />
                                                                            <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" />
                                                                        </SelectParameters>
                                                                        <DeleteParameters>
                                                                            <asp:Parameter Name="Visit_Issue_Slip_Id" />
                                                                        </DeleteParameters>
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
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" 
                                                                        DataKeyNames="Vehicle_Requisition_Id" 
                                                                        DataSourceID="SqlDataSource2" Width="100%">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
                                                                                    <asp:HiddenField ID="HiddenField_Visited_StafEmpId" runat="server" 
                                                                                        Value='<%# Eval("Staf_Emp_Id") %>' />
                                                                                    <asp:HiddenField ID="HiddenField_Vehicle_Requisition_Id" runat="server" 
                                                                                        Value='<%# Eval("Vehicle_Requisition_Id") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                                                                                SortExpression="Name" />
                                                                            <asp:BoundField DataField="Designation_Name" HeaderText="Designation" 
                                                                                SortExpression="Designation_Name" />
                                                                            <asp:BoundField DataField="SubDept_Name" HeaderText="SubDepartment" 
                                                                                SortExpression="SubDept_Name" />
                                                                            <asp:BoundField DataField="Dept_Name" HeaderText="Department" 
                                                                                SortExpression="Dept_Name" />
                                                                            <asp:BoundField DataField="Destination" HeaderText="Destination" 
                                                                                SortExpression="Destination" />
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style16" colspan="3">
                                                                    <asp:Button ID="P1A_Button_Save" runat="server" onclick="Button10_Click" 
                                                                        Text="Departure" />
                                                                    <asp:Button ID="Button1" runat="server" Text="Discard" 
                                                                        onclick="Button1_Click" />
                                                                    <asp:Button ID="P1A_Button_Cancel" runat="server" onclick="Button11_Click" 
                                                                        Text="Cancel" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" 
                                                        DataKeyNames="Vehicle_Requisition_Id" 
                                                        DataSourceID="SqlDataSource2" Width="100%" 
                                                        onselectedindexchanged="GridView7_SelectedIndexChanged">
                                                        <Columns>
                                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                                                                SortExpression="Name" />
                                                            <asp:BoundField DataField="Designation_Name" HeaderText="Designation" 
                                                                SortExpression="Designation_Name" />
                                                            <asp:BoundField DataField="SubDept_Name" HeaderText="SubDepartment" 
                                                                SortExpression="SubDept_Name" />
                                                            <asp:BoundField DataField="Dept_Name" HeaderText="Department" 
                                                                SortExpression="Dept_Name" />
                                                            <asp:BoundField DataField="Destination" HeaderText="Destination" 
                                                                SortExpression="Destination" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
<br /></div>

                            </div>

                        </div>
    </div>

    </ContentTemplate></asp:UpdatePanel>
</asp:Content>
