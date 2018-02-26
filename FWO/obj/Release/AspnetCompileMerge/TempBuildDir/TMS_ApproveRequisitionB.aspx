<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_ApproveRequisitionB.aspx.cs" Inherits="FRDP.TMS_ApproveRequisitionB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <style type="text/css">
        .tbl_form td {
            vertical-align: top;
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
                                        <span>Approve Requisition</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:SqlDataSource ID="P18_SqlDataSource_Pending" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="Vehicle_Requisition_RejectAppove_Transport_TransStaff" 
                        InsertCommandType="StoredProcedure" 
                        
                        
                        
                        
                        
                        SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS Employee_Name, '' AS Expr1, '' AS IS_Rejected, Vehicle_Requisition.ForUse, Vehicle_Requisition.DemandFor, '' AS Remarks FROM Vehicle_Requisition INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID WHERE (Vehicle_Requisition.Status = 0)">
                        <InsertParameters>
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                            <asp:ControlParameter ControlID="P18_TextBox_Remarks" Name="Remarks" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="P18_HiddenField_Reject_Approve" 
                                Name="RejectApprove" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="P18_HiddenField_VR_Id" 
                                Name="Vehicle_Requisition_Id" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="P18_HiddenField_Vehicle_SelectedID" 
                                Name="Vehicle_Id" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="P18_DropDownList_SelectedDriver" 
                                DefaultValue="" Name="Driver_Emp_Id" PropertyName="SelectedValue" 
                                Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="P18_GridView_Pending" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="Vehicle_Requisition_Id" 
                        DataSourceID="P18_SqlDataSource_Pending" PageSize="5" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Requisition From" SortExpression="Employee_Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td>
                                                Name:</td>
                                            <td>
                                                <asp:Label ID="Label40" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Designation:</td>
                                            <td>
                                                <asp:Label ID="Label41" runat="server" Text='<%# Eval("Designation_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Department:</td>
                                            <td>
                                                <asp:Label ID="Label42" runat="server" Text='<%# Eval("Dept_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Subdepartment</td>
                                            <td>
                                                <asp:Label ID="Label43" runat="server" Text='<%# Eval("SubDept_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Requested At:</td>
                                            <td>
                                                <asp:Label ID="Label44" runat="server" Text='<%# Eval("Date_Time") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Details" SortExpression="Destination">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Destination") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td>
                                                Destination:</td>
                                            <td>
                                                <asp:Label ID="Label45" runat="server" Text='<%# Bind("Destination") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                From:</td>
                                            <td>
                                                <asp:Label ID="Label46" runat="server" Text='<%# Eval("FromTime") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                To:</td>
                                            <td>
                                                <asp:Label ID="Label47" runat="server" Text='<%# Eval("ToTime") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                For Use:</td>
                                            <td>
                                                <asp:Label ID="Label48" runat="server" Text='<%# Eval("ForUse") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Demanded For:</td>
                                            <td>
                                                <asp:Label ID="Label49" runat="server" Text='<%# Eval("DemandFor") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td>
                                                Emp Remarks:</td>
                                            <td>
                                                <asp:HiddenField ID="HiddenField9" runat="server" 
                                                    Value='<%# Eval("Vehicle_Requisition_Id") %>' />
                                                <asp:Label ID="Label50" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                                <asp:HiddenField ID="HiddenFieldFromTime" runat="server" 
                                                    Value='<%# Eval("FromTime") %>' />
                                                <asp:HiddenField ID="HiddenField_ToTime" runat="server" 
                                                    Value='<%# Eval("ToTime") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:LinkButton CssClass="btn btn-info" ID="LinkButton6" runat="server" onclick="LinkButton6_Click">Process</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Panel ID="Panel18A" runat="server"  Width="100%" 
                        Visible="False">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                            <tr>
                                <td colspan="3">
                                    <asp:SqlDataSource ID="P18A_SqlDataSourceAllreadyReservedV" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        
                                        
                                        SelectCommand="SELECT Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id, Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time, Vehicle_Requisition_ApproveByTransStaff_Main.End_Time, Vehicle_Requisition_ApproveByTransStaff_Main.Status, ISNULL(Vehicle.Number, '') + ' ( ' + ISNULL(Vehicle_BodyType.BodyType, '') + ' )' AS Number, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS DriverName, Vehicle_Requisition_ApproveByTransStaff_Main.Destination FROM Vehicle_Requisition_ApproveByTransStaff_Main INNER JOIN Vehicle ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id = Vehicle.Vehicle_id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN Driver_Allocation ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id = Driver_Allocation.Vehicle_Id INNER JOIN View_Employee ON Driver_Allocation.Driver_Id = View_Employee.EmpID WHERE (@START_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 2) OR (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 2) AND (@End_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) OR (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 2) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time BETWEEN @START_Time AND @End_Time)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="P18_HiddenField_StartTime" Name="START_Time" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="P18_HiddenField_EndTime" Name="End_Time" 
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="P18_GridViewAllreadyReservedV" runat="server" 
                                        AutoGenerateColumns="False" 
                                        DataKeyNames="Vehicle_Requisition_ApproveByTransStaff_Main_Id" 
                                        DataSourceID="P18A_SqlDataSourceAllreadyReservedV" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Already Reserved At This Time" 
                                                SortExpression="Number">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label61" runat="server" Text='<%# Eval("Number") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <table border="0" cellpadding="0" cellspacing="0" frame="void" 
                                                        style="width:100%;">
                                                        <tr>
                                                            <td class="style17">
                                                                <b style="text-align: center">Vehicle</b></td>
                                                            <td class="style17">
                                                                <b>Driver</b></td>
                                                            <td class="style17">
                                                                <b>Departure</b></td>
                                                            <td class="style17">
                                                                <b>Arrival</b></td>
                                                            <td class="style10">
                                                                </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style16">
                                                                <asp:Label ID="Label62" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:Label ID="Label63" runat="server" Text='<%# Eval("DriverName") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:Label ID="Label64" runat="server" Text='<%# Bind("Start_Time") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:Label ID="Label65" runat="server" Text='<%# Bind("End_Time") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:LinkButton ID="LinkButton12"  CssClass="btn btn-info" runat="server" onclick="LinkButton12_Click">Bind</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: #99CCFF">
                                                                <asp:HiddenField ID="HiddenField_Main_Id0" runat="server" 
                                                                    Value='<%# Eval("Vehicle_Requisition_ApproveByTransStaff_Main_Id") %>' />
                                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                    
                                                                    SelectCommand="SELECT Vehicle_Requisition.Destination, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, View_Designation.Designation_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Name, Vehicle_Requisition.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_Requisition.Vehicle_Requisition_Id FROM Vehicle_Requisition INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID WHERE (Vehicle_Requisition.Is_Canceld_By_Staf_Emp = 0) AND (Vehicle_Requisition.Vehicle_Requisition_ApproveByTransStaff_Main_Id = @Vehicle_Requisition_ApproveByTransStaff_Main_Id)">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="HiddenField_Main_Id0" 
                                                                            Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" 
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                            <td colspan="4">
                                                                <asp:Panel ID="Panel18AA" runat="server" Visible="False">
                                                                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                                                        <tr>
                                                                            <td class="style18">
                                                                                </td>
                                                                            <td class="style18">
                                                                                <b style="text-align: center">Date</b></td>
                                                                            <td class="style18">
                                                                                <b>Time</b></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style18">
                                                                                <b>Departure:</b></td>
                                                                            <td class="style18">
                                                                                <asp:TextBox ID="WebDateChooser3" Text='<%# Eval("Start_Time") %>' style="background-color: #CCCCFF" ClientIDMode="Static" runat="server"></asp:TextBox>
                                                                             <%--   <igsch:WebDateChooser ID="WebDateChooser3" runat="server" CssClass="style15" 
                                                                                    Value='<%# Eval("Start_Time") %>' style="background-color: #CCCCFF">
                                                                                </igsch:WebDateChooser>--%>
                                                                            </td>
                                                                            <td class="style18">
                                                                                <asp:TextBox ID="WebDateTimeEdit3" Text='<%# Bind("Start_Time") %>' ClientIDMode="Static" runat="server"></asp:TextBox>
                                                                                <%--<igtxt:WebDateTimeEdit ID="WebDateTimeEdit3" runat="server" EditModeFormat="t" 
                                                                                    Value='<%# Bind("Start_Time") %>'>
                                                                                </igtxt:WebDateTimeEdit>--%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style6">
                                                                                Arrival</td>
                                                                            <td class="style18">
                                                                                <asp:TextBox ID="WebDateChooser4" Text='<%# Eval("End_Time") %>' style="background-color: #CCCCFF" ClientIDMode="Static" runat="server"></asp:TextBox>
                                                                                <%--<igsch:WebDateChooser ID="WebDateChooser4" runat="server" CssClass="style15" 
                                                                                    Value='<%# Eval("End_Time") %>' style="background-color: #CCCCFF">
                                                                                </igsch:WebDateChooser>--%>
                                                                            </td>
                                                                            <td class="style18">
                                                                                <asp:TextBox ID="WebDateTimeEdit4" Text='<%# Eval("End_Time") %>' ClientIDMode="Static" runat="server"></asp:TextBox>
                                                                                <%--<igtxt:WebDateTimeEdit ID="WebDateTimeEdit4" runat="server" EditModeFormat="t" 
                                                                                    Value='<%# Eval("End_Time") %>'>
                                                                                </igtxt:WebDateTimeEdit>--%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style6">
                                                                                Destination</td>
                                                                            <td class="style18" colspan="2">
                                                                                <asp:TextBox ID="TextBox23" runat="server" Text='<%# Eval("Destination") %>' 
                                                                                    Width="352px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style18">
                                                                                </td>
                                                                            <td class="style18" colspan="2">
                                                                                <asp:Button ID="Button12" runat="server" CssClass="btn btn-info" onclick="Button12_Click" Text="Save" />
                                                                                <asp:Button ID="Button13" runat="server" CssClass="btn btn-info" onclick="Button13_Click" 
                                                                                    Text="Cancel" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" 
                                                                    DataKeyNames="Vehicle_Requisition_Id" 
                                                                    DataSourceID="SqlDataSource3" Width="100%">
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
                                </td>
                                <td>
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="P18_SqlDataSource_AvaiableV" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        
                                        SelectCommand="SELECT Vehicle.Vehicle_id, Vehicle.Number + ' (' + Vehicle_BodyType.BodyType + ')' AS Number, Driver_Allocation.Driver_Id FROM Vehicle INNER JOIN Vehicle_Allocation ON Vehicle.Vehicle_id = Vehicle_Allocation.Vehicle_Id INNER JOIN Vehicle_Alocation_Type ON Vehicle_Allocation.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type.Vehicle_Alocation_Type_Id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN Driver_Allocation ON Vehicle.Vehicle_id = Driver_Allocation.Vehicle_Id WHERE (NOT (Vehicle.Vehicle_id IN (SELECT Vehicle_1.Vehicle_id FROM Vehicle AS Vehicle_1 INNER JOIN Vehicle_Allocation AS Vehicle_Allocation_1 ON Vehicle_1.Vehicle_id = Vehicle_Allocation_1.Vehicle_Id INNER JOIN Vehicle_Alocation_Type AS Vehicle_Alocation_Type_1 ON Vehicle_Allocation_1.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type_1.Vehicle_Alocation_Type_Id INNER JOIN Vehicle_Requisition_ApproveByTransStaff_Main ON Vehicle_1.Vehicle_id = Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Requisition_ApproveByTransStaff_Main_Id = Vehicle_Requisition.Vehicle_Requisition_ApproveByTransStaff_Main_Id WHERE (@START_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) AND (Vehicle_Requisition.Is_Canceld_By_Staf_Emp = 0) AND (Vehicle_Alocation_Type_1.Is_Pool = 1) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 2) AND (Vehicle_Requisition.Status = 2) OR (Vehicle_Alocation_Type_1.Is_Pool = 1) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 4) AND (Vehicle_Requisition.Status = 4) AND (@End_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) OR (Vehicle_Alocation_Type_1.Is_Pool = 1) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time BETWEEN @START_Time AND @End_Time) OR (Vehicle_Alocation_Type_1.Is_Pool = 1) AND (Vehicle_Requisition_ApproveByTransStaff_Main.End_Time BETWEEN @START_Time AND @End_Time)))) AND (Vehicle_Alocation_Type.Is_Pool = 1)">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="START_Time" ControlID="P18_HiddenField_StartTime" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="P18_HiddenField_EndTime" Name="End_Time" 
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:HiddenField ID="P18_HiddenFieldBind_ID" runat="server" />
                                    <asp:HiddenField ID="P18_HiddenField_BindStartDate" runat="server" />
                                    <asp:HiddenField ID="P18_HiddenField_BindEndDate" runat="server" />
                                    <asp:HiddenField ID="P18_HiddenField_BindDestination" runat="server" />
                                    <asp:SqlDataSource ID="P18_SqlDataSource_Bind" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        InsertCommand="Vehicle_Requisition_Bind" InsertCommandType="StoredProcedure" 
                                        SelectCommand="SELECT [Vehicle_id], [Number] FROM [Vehicle]">
                                        <InsertParameters>
                                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                                            <asp:ControlParameter ControlID="P18_TextBox_Remarks" Name="Remarks" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="P18_HiddenField_VR_Id" 
                                                Name="Vehicle_Requisition_Id" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="P18_HiddenFieldBind_ID" 
                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" 
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="P18_HiddenField_BindStartDate" 
                                                Name="Start_Time" PropertyName="Value" Type="DateTime" />
                                            <asp:ControlParameter ControlID="P18_HiddenField_BindEndDate" Name="End_Time" 
                                                PropertyName="Value" Type="DateTime" />
                                            <asp:ControlParameter ControlID="P18_HiddenField_BindDestination" 
                                                Name="Destination" PropertyName="Value" Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:DataList ID="P18_DataList_AvaiableV" runat="server" 
                                        DataKeyField="Vehicle_id" DataSourceID="P18_SqlDataSource_AvaiableV" 
                                        onprerender="P18_DataList_AvaiableV_PreRender">
                                        <HeaderTemplate>
                                            <b>Available Vehicles ( </b>
                                            <asp:Label ID="NumberLabela0" runat="server" Font-Bold="True" ForeColor="Red" />
                                            <b>)</b>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton7" runat="server" onclick="LinkButton7_Click" 
                                                Text='<%# Eval("Number") %>'></asp:LinkButton>
                                            <asp:HiddenField ID="HiddenField10" runat="server" 
                                                Value='<%# Eval("Vehicle_id") %>' />
                                            <asp:HiddenField ID="HiddenField_Driver_I_D" runat="server" 
                                                Value='<%# Eval("Driver_Id") %>' />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                                <td>
                                    <asp:TextBox ID="P18_TextBox_Remarks" runat="server" Height="78px" 
                                        TextMode="MultiLine" Width="398px"></asp:TextBox>
                                    <asp:HiddenField ID="P18_HiddenField_VR_Id" runat="server" />
                                    <asp:HiddenField ID="P18_HiddenField_Reject_Approve" runat="server" />
                                    <asp:HiddenField ID="P18_HiddenField_Vehicle_SelectedID" runat="server" />
                                    <asp:HiddenField ID="P18_HiddenField_SelectedDriver" runat="server" />
                                    <asp:HiddenField ID="P18_HiddenField_EndTime" runat="server" 
                                         />
                                    <asp:HiddenField ID="P18_HiddenField_StartTime" runat="server" 
                                         />
                                </td>
                                <td>
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="P18_Label_Vehicle" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="P18_Label_DriverTitle" runat="server" Text="Driver:" 
                                                    Visible="False"></asp:Label>
                                            </td>
                                            <td colspan="2">
                                                <asp:DropDownList ID="P18_DropDownList_SelectedDriver" runat="server" 
                                                    DataSourceID="P18_SqlDataSource_DriverDisplay" DataTextField="DName" 
                                                    DataValueField="Driver_Emp_Id" Visible="False">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="P18_SqlDataSource_DriverDisplay" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                    
                                                    SelectCommand="SELECT Driver.Driver_Emp_Id, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS DName FROM Driver INNER JOIN View_Employee ON Driver.Driver_Emp_Id = View_Employee.EmpID ORDER BY DName">
                                                </asp:SqlDataSource>
                                            </td>
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
                                </td>
                                <td>
                                    </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="Label66" runat="server" Font-Bold="True" ForeColor="Red" 
                                        Text="Select a Vehicle" Visible="False"></asp:Label>
                                </td>
                                <td colspan="2">
                                  <asp:Button ID="P18_Button_Approve" runat="server" 
                                        onclick="P18_Button_Approve_Click" style="width: 68px; height: 26px;" 
                                        Text="Approve" />
                                    <asp:Button ID="P18_Button_Reject" runat="server" 
                                        onclick="P18_Button_Reject_Click" Text="Reject" />
                                </td>
                                <td>
                                    </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    </td>
                <td style="text-align: center">
                    </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:SqlDataSource ID="P18_SqlDataSource_ApprovedRejected" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="Vehicle_Requisition_Insert" InsertCommandType="StoredProcedure" 
                        SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Employee_Name, Vehicle_Requisition_ApproveByTransStaff.IS_Rejected, Vehicle_Requisition_ApproveByTransOfficer.Remarks AS Expr1, Vehicle_Requisition_ApproveByOfficer.Remarks AS Expr2, Vehicle_Requisition_ApproveByTransStaff.Remarks AS Expr3 FROM Vehicle_Requisition_ApproveByTransStaff INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID INNER JOIN Vehicle_Requisition_ApproveByOfficer ON Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id = Vehicle_Requisition_ApproveByOfficer.Vehicle_Requisition_Id INNER JOIN Vehicle_Requisition_ApproveByTransOfficer ON Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id = Vehicle_Requisition_ApproveByTransOfficer.Vehicle_Requisition_Id">
                        <InsertParameters>
                            <asp:SessionParameter DefaultValue="" Name="Emp_Id" SessionField="Emp_Id" 
                                Type="Int32" />
                            <asp:ControlParameter ControlID="P15_TextBox_Location" Name="Destination" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="P15_HiddenField_FromDateTime" Name="FromTime" 
                                PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="P15_HiddenField_ToDateTime" Name="ToTime" 
                                PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="P15_TextBoxRemarks" Name="Remarks" 
                                PropertyName="Text" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                  
                  
                  
                    <asp:GridView ID="P18_GridView_ApprovedRejected" runat="server"  Width="100%"
                        AllowPaging="True" AutoGenerateColumns="False" 
                        DataKeyNames="Vehicle_Requisition_Id" 
                        DataSourceID="P18_SqlDataSource_ApprovedRejected" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="Employee_Name" HeaderText="Name" 
                                SortExpression="Employee_Name" />
                            <asp:BoundField DataField="Designation_Name" HeaderText="Designation" 
                                SortExpression="Designation_Name" />
                            <asp:BoundField DataField="Dept_Name" HeaderText="Department" 
                                SortExpression="Dept_Name" />
                            <asp:BoundField DataField="SubDept_Name" HeaderText="SubDepartment" 
                                SortExpression="SubDept_Name" />
                            <asp:BoundField DataField="Destination" HeaderText="Destination" 
                                SortExpression="Destination" />
                            <asp:BoundField DataField="FromTime" HeaderText="From" 
                                SortExpression="FromTime" />
                            <asp:BoundField DataField="ToTime" HeaderText="To" SortExpression="ToTime" />
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                SortExpression="Remarks" />
                            <asp:BoundField DataField="Date_Time" HeaderText="Requested At" 
                                SortExpression="Date_Time" />
                            <asp:TemplateField HeaderText="Rejected" SortExpression="IS_Rejected">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("IS_Rejected") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox4" runat="server" 
                                        Checked='<%# Bind("IS_Rejected") %>' Enabled="False" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Expr1" HeaderText="Remarks" SortExpression="Expr1" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    </td>
            </tr>
        </table>
<br /></div>

                            </div>

                        </div>
    </div>
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>
