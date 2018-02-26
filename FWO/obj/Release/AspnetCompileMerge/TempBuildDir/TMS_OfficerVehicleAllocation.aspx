<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_OfficerVehicleAllocation.aspx.cs" Inherits="FRDP.TMS_OfficerVehicleAllocation" %>
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
                                        <span>Officer Vehicle Allocation</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
                                        <div class="bxmain">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
            <tr>
                <td align="right" width="180px">
                    Department :</td>
                <td>
                  <asp:SqlDataSource ID="P13_SqlDataSource_department" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
                    SelectCommand="SELECT ID [Dept_ID], Name [Dept_Name] FROM [tblDept]"></asp:SqlDataSource>
                    <asp:DropDownList ID="P13_DropDownList_department" runat="server" DataSourceID="P13_SqlDataSource_department"
                    DataTextField="Dept_Name" DataValueField="Dept_ID" Width="201px" AutoPostBack="True">
      </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Designation :</td>
                <td>
                  <asp:SqlDataSource ID="P13_SqlDataSource_designation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
                    SelectCommand="SELECT ID AS Designation_ID, NAME AS Designation_Name FROM tblDesig WHERE (ID IN (SELECT DISTINCT tblDesigID FROM tblEmployee WHERE (tblDept = @tblDept))) ORDER BY Designation_Name">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="P13_DropDownList_department" DefaultValue="0" Name="tblDept" PropertyName="SelectedValue" />
                      </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="P13_DropDownList_designation" runat="server" DataSourceID="P13_SqlDataSource_designation"
                      DataTextField="Designation_Name" DataValueField="Designation_ID" Width="202px" AutoPostBack="True">
      </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Select Officer :</td>
                <td>
                    <asp:DropDownList ID="P13_DropDownList_Emp" runat="server" 
                        DataSourceID="P13_SqlDataSource_Emp_Name" DataTextField="Employee_Name" 
                        DataValueField="EmpID" Width="400px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="P13_SqlDataSource_Emp_Name" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
                    
            
                        
                        SelectCommand="SELECT EmpID, ISNULL(Prefix, '') + ' ' + ISNULL(EFName, '') + ' ' + ISNULL(EMName, '') + ' ' + ISNULL(ELName, '') + ' ' + ISNULL(Relation, '') + ' ' + ISNULL(RFName, '') + ' ' + ISNULL(RMName, '') + ' ' + ISNULL(RLName, '') AS Employee_Name FROM View_Employee WHERE (tblDept = @DeptID) AND (tblDesigID = @DesignationID) AND (EmpID NOT IN (SELECT Officer_Id AS Emp_Id FROM Officer_Allocation)) ORDER BY Employee_Name" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="P13_DropDownList_department" Name="DeptID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="P13_DropDownList_designation" 
                            Name="DesignationID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Allocation Category :</td>
                <td>
                    <asp:SqlDataSource ID="P13_SqlDataSource_Allocation_Category" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT Vehicle_Alocation_Type_Id, Vehicle_Alocation_Type FROM Vehicle_Alocation_Type WHERE (Is_Deactivated = 0) AND (Fuel_System = 1) ORDER BY Vehicle_Alocation_Type">
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="P13_DropDownList_AllocationCategory" runat="server" 
                        AutoPostBack="True" DataSourceID="P13_SqlDataSource_Allocation_Category" 
                        DataTextField="Vehicle_Alocation_Type" 
                        DataValueField="Vehicle_Alocation_Type_Id">
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Select Vehicle :</td>
                <td>
                    <asp:DropDownList ID="P13_DropDownList_Vehicle" runat="server" 
                        DataSourceID="P13_SqlDataSource_Vehicle" DataTextField="Number" 
                        DataValueField="Vehicle_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="P13_SqlDataSource_Vehicle" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT Vehicle_Allocation.Vehicle_Id, Vehicle.Number FROM Vehicle_Allocation INNER JOIN Vehicle ON Vehicle_Allocation.Vehicle_Id = Vehicle.Vehicle_id WHERE (Vehicle_Allocation.Vehicle_Alocation_Type_Id = @Vehicle_Alocation_Type_Id) AND (Vehicle_Allocation.Vehicle_Id NOT IN (SELECT Vehicle_Id FROM Officer_Allocation))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="P13_DropDownList_AllocationCategory" 
                                Name="Vehicle_Alocation_Type_Id" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    </td>
                <td>
                  <asp:Button ID="P13_Button_Save" CssClass="btn btn-info" runat="server" 
                        onclick="P13_Button_Save_Click" Text="Save" />
            <asp:SqlDataSource ID="P13_SqlDataSource_Save" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        DeleteCommand="Officer_Allocation_Delete" DeleteCommandType="StoredProcedure" 
                        InsertCommand="Officer_Allocation_Insert" InsertCommandType="StoredProcedure" 
                        
                        
                        SelectCommand="SELECT Officer_Allocation.Officer_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS O_Name, Officer_Allocation.Vehicle_Id, Officer_Allocation.ID, Officer_Allocation.Date_Time, Officer_Allocation.Emp_Id, Officer_Allocation.Vehicle_Alocation_Type_Id, Vehicle_Alocation_Type.Vehicle_Alocation_Type, Vehicle.Number, ISNULL(View_Employee_1.Prefix, '') + ' ' + ISNULL(View_Employee_1.EFName, '') + ' ' + ISNULL(View_Employee_1.EMName, '') + ' ' + ISNULL(View_Employee_1.ELName, '') + ' ' + ISNULL(View_Employee_1.Relation, '') + ' ' + ISNULL(View_Employee_1.RFName, '') + ' ' + ISNULL(View_Employee_1.RMName, '') + ' ' + ISNULL(View_Employee_1.RLName, '') AS D_Name FROM Officer_Allocation INNER JOIN View_Employee ON Officer_Allocation.Officer_Id = View_Employee.EmpID INNER JOIN Vehicle_Alocation_Type ON Officer_Allocation.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type.Vehicle_Alocation_Type_Id INNER JOIN Vehicle ON Officer_Allocation.Vehicle_Id = Vehicle.Vehicle_id LEFT OUTER JOIN Driver_Allocation INNER JOIN View_Employee AS View_Employee_1 ON Driver_Allocation.Driver_Id = View_Employee_1.EmpID ON Officer_Allocation.Vehicle_Id = Driver_Allocation.Vehicle_Id ORDER BY O_Name" 
                        ondeleted="P13_SqlDataSource_Save_Deleted" 
                        oninserted="P13_SqlDataSource_Save_Inserted">
                        <DeleteParameters>
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                            <asp:Parameter Name="Officer_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="P13_DropDownList_Vehicle" Name="Vehicle_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="P13_DropDownList_Emp" Name="Officer_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                            <asp:ControlParameter ControlID="P13_DropDownList_AllocationCategory" 
                                Name="Vehicle_Alocation_Type_Id" PropertyName="SelectedValue" Type="Int32" />
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
                                        <span>Officer Vehicle List</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
           <br />

            
                    <asp:GridView ID="P13_GridView_Save" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Officer_Id" CssClass="abGrid" DataSourceID="P13_SqlDataSource_Save" 
                        Width="96%">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="O_Name" HeaderText="Officer Name" ReadOnly="True" 
                                SortExpression="O_Name" />
                            <asp:BoundField DataField="Number" HeaderText="Vehicle Number" 
                                SortExpression="Number" />
                            <asp:BoundField DataField="D_Name" HeaderText="Driver Name" 
                                SortExpression="D_Name" />
                            <asp:BoundField DataField="Vehicle_Alocation_Type" 
                                HeaderText="Alocation Category" SortExpression="Vehicle_Alocation_Type" />
                            <asp:BoundField DataField="Date_Time" HeaderText="Allocated Since" 
                                SortExpression="Date_Time" />
                        </Columns>
                    </asp:GridView>
</div>

                            </div>

                        </div>
    </div>
            </ContentTemplate></asp:UpdatePanel>
</asp:Content>
