<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleSearch.aspx.cs" Inherits="FRDP.TMS_VehicleSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        abGrid {
            width: 97%;
            margin-left: 20px;
        }
        .abGrid tr {
    border-bottom: 1px solid #E1E1E1;
}
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>

                  <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Vehicle Search</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
 <table  cellspacing="0" cellpadding="0" border="0" class="tbl_form" width="100%">
                        <tr>
                            <td align="right" width="40%">
                                Vehicle Number :</td>
                            <td colspan="2"><asp:TextBox ID="TextBox_Vnumber" runat="server"></asp:TextBox>
                          </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Registration Number :</td>
                            <td colspan="2"><asp:TextBox ID="TextBox_RNumber" runat="server"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Engin Number :</td>
                            <td colspan="2"><asp:TextBox ID="TextBox_EnginNumber" runat="server"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Insurance Number :</td>
                            <td colspan="2"><asp:TextBox ID="TextBox_INumber" runat="server"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Cubic Capesty :</td>
                            <td colspan="2"><asp:TextBox ID="TextBox_CC" runat="server"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Year :
                            </td>
                            <td colspan="2"><asp:DropDownList ID="DropDownList_Year" runat="server"> </asp:DropDownList>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                            Class :</td>
                            <td colspan="2"><asp:DropDownList ID="DropDownList_Class" runat="server" 
                                    datasourceid="SqlDataSource_Vehicle_Class_Id_P10" DataTextField="Class" 
                                    DataValueField="Vehicle_Class_Id" 
                                    OnSelectedIndexChanged="DropDownList_Class_SelectedIndexChanged" 
                                    AutoPostBack="True"> </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource_Vehicle_Class_Id_P10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT Vehicle_Class_Id, Class FROM Vehicle_Class ORDER BY Vehicle_Class_Id" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>"> </asp:SqlDataSource>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                            Maker Name :</td>
                            <td colspan="2"><asp:DropDownList ID="DropDownList_ManufacturerId" runat="server" 
                        AutoPostBack="True" datasourceid="SqlDataSource_ManufacturerP10" 
                        DataTextField="Manufacturer_Name" DataValueField="ManufacturerID"> </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource_ManufacturerP10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        
                        
                                    SelectCommand="SELECT ManufacturerID, Manufacturer_Name FROM VehicleManufacturer WHERE (Vehicle_Class_Id = @Vehicle_Class_Id)">
                                <SelectParameters>
                                  <asp:ControlParameter ControlID="DropDownList_Class" 
                                Name="Vehicle_Class_Id" PropertyName="SelectedValue" DefaultValue="0" />
                                </SelectParameters>
                              </asp:SqlDataSource>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Driver :
                            </td>
                            <td colspan="2">
                                <asp:DropDownList ID="DropDownList_Driver" runat="server" 
                                    datasourceid="P1A_SqlDataSource_Driver" DataTextField="DName" 
                                    DataValueField="Driver_Emp_Id" Width="400px"> </asp:DropDownList>
                              <asp:SqlDataSource ID="P1A_SqlDataSource_Driver" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                        
                                                                        
                                    
                                    SelectCommand="SELECT Driver.Driver_Emp_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS DName FROM Driver INNER JOIN View_Employee ON Driver.Driver_Emp_Id = View_Employee.EmpID  ORDER BY DName"> </asp:SqlDataSource>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">
                            Officer :</td>
                            <td colspan="2">
                                <asp:DropDownList ID="DropDownList_Officer" runat="server" 
                                    datasourceid="SqlDataSource_Officer" DataTextField="O_Name" 
                                    DataValueField="Officer_Id" Width="400px"> </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource_Officer" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                    
                                    SelectCommand="SELECT Officer_Allocation.Officer_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS O_Name, Officer_Allocation.Vehicle_Id, Officer_Allocation.ID, Officer_Allocation.Date_Time, Officer_Allocation.Emp_Id, Officer_Allocation.Vehicle_Alocation_Type_Id, Vehicle_Alocation_Type.Vehicle_Alocation_Type, ISNULL(View_Employee_1.Prefix, '') + ' ' + ISNULL(View_Employee_1.EFName, '') + ' ' + ISNULL(View_Employee_1.EMName, '') + ' ' + ISNULL(View_Employee_1.ELName, '') + ' ' + ISNULL(View_Employee_1.Relation, '') + ' ' + ISNULL(View_Employee_1.RFName, '') + ' ' + ISNULL(View_Employee_1.RMName, '') + ' ' + ISNULL(View_Employee_1.RLName, '') AS D_Name FROM Officer_Allocation INNER JOIN View_Employee ON Officer_Allocation.Officer_Id = View_Employee.EmpID INNER JOIN Vehicle_Alocation_Type ON Officer_Allocation.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type.Vehicle_Alocation_Type_Id INNER JOIN Vehicle ON Officer_Allocation.Vehicle_Id = Vehicle.Vehicle_id LEFT OUTER JOIN Driver_Allocation INNER JOIN View_Employee AS View_Employee_1 ON Driver_Allocation.Driver_Id = View_Employee_1.EmpID ON Officer_Allocation.Vehicle_Alocation_Type_Id = Driver_Allocation.Vehicle_Alocation_Type_Id AND Officer_Allocation.Vehicle_Id = Driver_Allocation.Vehicle_Id ORDER BY O_Name"> </asp:SqlDataSource>
                                </td>
                        </tr>
                        <tr>
                            <td align="right">&nbsp;</td>
                            <td colspan="2"><asp:Button ID="Button_Search" CssClass="btn btn-info" runat="server" OnClick="Button_Search_Click" 
                                    Text="Search" />                            
                              <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" OnClick="Button1_Click" Text="Clear" />                              </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                </td>
                            <td>
                                </td>
                        </tr>
                    </table>
<br /></div>

                            </div>

                        </div>
    </div>

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Search Results</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<asp:GridView ID="GridView_VSearch" CssClass="abGrid" style="margin-left:20px;"  runat="server" AutoGenerateColumns="False" Width="96%">
          <columns>
            <asp:BoundField DataField="Number" HeaderText="Number" 
                                SortExpression="Number" />
            <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
            <asp:BoundField DataField="Manufacture_Year" HeaderText="Model" ReadOnly="True" 
                                SortExpression="Manufacture_Year" />
            <asp:BoundField DataField="InsuranceNumber" HeaderText="Insurance No." 
                                SortExpression="InsuranceNumber" />
            <asp:BoundField DataField="Manufacturer_Name" HeaderText="Manufacturer" 
                                SortExpression="Manufacturer_Name" />
            <asp:BoundField DataField="CubicCapacity" HeaderText="Cubic Capacity" 
                                SortExpression="CubicCapacity" />
            <asp:BoundField DataField="Registration_Number" HeaderText="Registration" 
                                ReadOnly="True" SortExpression="Registration_Number" />
            <asp:BoundField DataField="Driver_Name" HeaderText="Driver Name" 
                                ReadOnly="True" SortExpression="Driver_Name" />
            <asp:BoundField DataField="Officer_Name" HeaderText="Officer Name" 
                                ReadOnly="True" SortExpression="Officer_Name" />
          </columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_GridView" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        
                        SelectCommand="SELECT Vehicle.Vehicle_id, Vehicle.Owner, Vehicle.Registration_Authority, Vehicle.Vehicle_Class_Id, Vehicle.Vehicle_Condition_Id, Vehicle.Vehicle_Type_Id, Vehicle.Vehicle_BodyTypeId, Vehicle.Maker_Name, ISNULL(Vehicle.Manufacture_Year, 0) AS Manufacture_Year, Vehicle.Manufacture_Month, Vehicle.ChassisNumber, ISNULL(Vehicle.EnginNo, 0) AS EnginNo, Vehicle.SeatingCapcity, Vehicle.Colour, Vehicle.InsuranceNumber, CONVERT (VARCHAR(20), Vehicle.Insurance_FromDate, 103) AS Insurance_FromDate, CONVERT (VARCHAR(20), Vehicle.Insurance_ToDate, 103) AS Insurance_ToDate, Vehicle.Number, Vehicle_BodyType.BodyType, Vehicle_Class.Class, Vehicle_Condition.Condition, Vehicle_Type.VehicleTypeName, Vehicle.Cost, VehicleManufacturer.Manufacturer_Name, Vehicle.NoOfCylinder, Vehicle.HorsePower, Vehicle.CubicCapacity, Vehicle.UnLandedWeight, Vehicle.Width, Vehicle.Lenght, Vehicle.Height, ISNULL(Vehicle.Registration_Number, '0') AS Registration_Number, Vehicle.Purchased_Date, Driver_Allocation.Driver_Id, Officer_Allocation.Officer_Id, VehicleManufacturer.ManufacturerID, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Driver_Name, ISNULL(View_Employee_1.Prefix, '') + ' ' + ISNULL(View_Employee_1.EFName, '') + ' ' + ISNULL(View_Employee_1.EMName, '') + ' ' + ISNULL(View_Employee_1.ELName, '') AS Officer_Name FROM Vehicle INNER JOIN Vehicle_Class ON Vehicle.Vehicle_Class_Id = Vehicle_Class.Vehicle_Class_Id INNER JOIN Vehicle_Condition ON Vehicle.Vehicle_Condition_Id = Vehicle_Condition.Vehicle_Condition_Id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN Vehicle_Type ON Vehicle.Vehicle_Type_Id = Vehicle_Type.VehicleTypeID INNER JOIN VehicleManufacturer ON Vehicle.Maker_Name = VehicleManufacturer.ManufacturerID LEFT OUTER JOIN View_Employee AS View_Employee_1 INNER JOIN Officer_Allocation ON View_Employee_1.EmpID = Officer_Allocation.Officer_Id ON Vehicle.Vehicle_id = Officer_Allocation.Vehicle_Id LEFT OUTER JOIN View_Employee INNER JOIN Driver_Allocation ON View_Employee.EmpID = Driver_Allocation.Driver_Id ON Vehicle.Vehicle_id = Driver_Allocation.Vehicle_Id"> </asp:SqlDataSource>
 
<br /></div>

                            </div>

                        </div>
    </div>
        </ContentTemplate></asp:UpdatePanel>
</asp:Content>
