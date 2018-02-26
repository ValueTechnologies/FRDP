<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_ApproveRequisitionA.aspx.cs" Inherits="FRDP.TMS_ApproveRequisitionA" %>
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
                    <asp:SqlDataSource ID="P17_SqlDataSource_Pending" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="Vehicle_Requisition_RejectAppove_Transport_Officer" 
                        InsertCommandType="StoredProcedure" 
                        
                        SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS Employee_Name, Vehicle_Requisition_ApproveByOfficer.Remarks AS Expr1, Vehicle_Requisition_ApproveByOfficer.IS_Rejected, Vehicle_Requisition.ForUse, Vehicle_Requisition.DemandFor FROM Vehicle_Requisition_ApproveByOfficer INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByOfficer.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID WHERE (Vehicle_Requisition_ApproveByOfficer.IS_Rejected = 0) AND (Vehicle_Requisition.Status = 2)">
                        <InsertParameters>
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                            <asp:ControlParameter ControlID="P17_TextBox_Remarks" Name="Remarks" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="P17_HiddenField_Reject_Approve" 
                                Name="RejectApprove" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="P17_HiddenField_VR_Id" 
                                Name="Vehicle_Requisition_Id" PropertyName="Value" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="P17_GridView_Pending" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="Vehicle_Requisition_Id" 
                        DataSourceID="P17_SqlDataSource_Pending" 
                        PageSize="5" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Requisition From" SortExpression="Employee_Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td>
                                                Name:</td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Designation:</td>
                                            <td>
                                                <asp:Label ID="Label31" runat="server" Text='<%# Eval("Designation_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Department:</td>
                                            <td>
                                                <asp:Label ID="Label32" runat="server" Text='<%# Eval("Dept_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Subdepartment</td>
                                            <td>
                                                <asp:Label ID="Label33" runat="server" Text='<%# Eval("SubDept_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Requested At:</td>
                                            <td>
                                                <asp:Label ID="Label38" runat="server" Text='<%# Eval("Date_Time") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Details" SortExpression="Destination">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Destination") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td>
                                                Destination:</td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Destination") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                From:</td>
                                            <td>
                                                <asp:Label ID="Label34" runat="server" Text='<%# Eval("FromTime") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                To:</td>
                                            <td>
                                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("ToTime") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                For Use:</td>
                                            <td>
                                                <asp:Label ID="Label36" runat="server" Text='<%# Eval("ForUse") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Demanded For:</td>
                                            <td>
                                                <asp:Label ID="Label37" runat="server" Text='<%# Eval("DemandFor") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td>
                                                Emp Remarks:</td>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Officer Remarks</td>
                                            <td>
                                                <asp:Label ID="Label39" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label>
                                                <asp:HiddenField ID="HiddenField11" runat="server" 
                                                    Value='<%# Eval("FromTime") %>' />
                                                <asp:HiddenField ID="HiddenField12" runat="server" 
                                                    Value='<%# Eval("ToTime") %>' />
                                            </td>
                                            <td>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="LinkButton5" CssClass="btn btn-info" runat="server" onclick="LinkButton5_Click">Process</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:HiddenField ID="HiddenField8" runat="server" 
                                                    Value='<%# Eval("Vehicle_Requisition_Id") %>' />
                                            </td>
                                            <td>
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
                    <asp:Panel ID="Panel17A" runat="server" Visible="False"   Width="100%" 
                        >
                         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                            <tr>
                                <td colspan="3">
                                    <asp:SqlDataSource ID="P17A_SqlDataSourceAllreadyReservedV" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        
                                        
                                        SelectCommand="SELECT Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id, Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time, Vehicle_Requisition_ApproveByTransStaff_Main.End_Time, Vehicle_Requisition_ApproveByTransStaff_Main.Status, ISNULL(Vehicle.Number, '') + ' ( ' + ISNULL(Vehicle_BodyType.BodyType, '') + ' )' AS Number, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS DriverName, Vehicle_Requisition_ApproveByTransStaff_Main.Destination FROM Vehicle_Requisition_ApproveByTransStaff_Main INNER JOIN Vehicle ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id = Vehicle.Vehicle_id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN Driver_Allocation ON Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Id = Driver_Allocation.Vehicle_Id INNER JOIN View_Employee ON Driver_Allocation.Driver_Id = View_Employee.EmpID WHERE (@START_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 0) OR (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 0) AND (@End_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) OR (Vehicle_Requisition_ApproveByTransStaff_Main.Status = 0) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time BETWEEN @START_Time AND @End_Time)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="P17_HiddenField_StartTime" Name="START_Time" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_EndTime" Name="End_Time" 
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="P17_GridViewAllreadyReservedV" runat="server" 
                                        AutoGenerateColumns="False" DataKeyNames="Vehicle_Requisition_ApproveByTransStaff_Main_Id" 
                                        DataSourceID="P17A_SqlDataSourceAllreadyReservedV" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Already Reserved At This Time" 
                                                SortExpression="Number">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Number") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <table style="width:100%;" border="0" cellpadding="0" cellspacing="0" 
                                                        frame="void">
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
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:Label ID="Label59" runat="server" Text='<%# Eval("DriverName") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Start_Time") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("End_Time") %>'></asp:Label>
                                                            </td>
                                                            <td class="style16">
                                                                <asp:LinkButton ID="LinkButton10" CssClass="btn btn-info" runat="server" onclick="LinkButton10_Click">Bind</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: #99CCFF">
                                                                <asp:HiddenField ID="HiddenField_Main_Id" runat="server" 
                                                                    Value='<%# Eval("Vehicle_Requisition_ApproveByTransStaff_Main_Id") %>' />
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                                    SelectCommand="SELECT Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id, Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_ApproveByTransStaff_Id, Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_ApproveByTransStaff_Main_Id, Vehicle_Requisition.Destination, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, View_Designation.Designation_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Name FROM Vehicle_Requisition_ApproveByTransStaff INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID WHERE (Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_ApproveByTransStaff_Main_Id = @Vehicle_Requisition_ApproveByTransStaff_Main_Id) AND (Vehicle_Requisition.Is_Canceld_By_Staf_Emp = 0)">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="HiddenField_Main_Id" 
                                                                            Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" 
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                            <td colspan="4">
                                                                <asp:Panel ID="Panel17AA" runat="server" Visible="False" Width="100%">
                                                                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                                                        <tr>
                                                                            <td class="style15">
                                                                                </td>
                                                                            <td class="style14">
                                                                                <b style="text-align: center">Date</b></td>
                                                                            <td class="style14">
                                                                                <b>Time</b></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style12">
                                                                                <b>Departure:</b></td>
                                                                            <td class="style15">
                                                                                <asp:TextBox ID="WebDateChooser1" Text='<%# Eval("Start_Time") %>' ClientIDMode="Static" CssClass="dateEdit" runat="server"></asp:TextBox>
<%--                                                                                <igsch:WebDateChooser ID="WebDateChooser1" runat="server" CssClass="style15" 
                                                                                    Value='<%# Eval("Start_Time") %>'>
                                                                                </igsch:WebDateChooser>--%>
                                                                            </td>
                                                                            <td class="style15">
                                                                                <asp:TextBox ID="WebDateTimeEdit1" Text='<%# Bind("Start_Time") %>' CssClass="timeEdit" ClientIDMode="Static" runat="server"></asp:TextBox>
                                                                          <%--      <igtxt:WebDateTimeEdit ID="WebDateTimeEdit1" runat="server" EditModeFormat="t" 
                                                                                    Value='<%# Bind("Start_Time") %>'>
                                                                                </igtxt:WebDateTimeEdit>--%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style6">
                                                                                Arrival</td>
                                                                            <td class="style15">
                                                                                <asp:TextBox ID="WebDateChooser2" Text='<%# Eval("End_Time") %>' CssClass="dateEdit" ClientIDMode="Static" runat="server"></asp:TextBox>

<%--                                                                                <igsch:WebDateChooser ID="WebDateChooser2" runat="server" CssClass="style15" 
                                                                                    Value='<%# Eval("End_Time") %>'>
                                                                                </igsch:WebDateChooser>--%>
                                                                            </td>
                                                                            <td class="style15">

                                                                                <asp:TextBox ID="WebDateTimeEdit2" Text='<%# Eval("End_Time") %>' CssClass="timeEdit" ClientIDMode="Static" runat="server"></asp:TextBox>

                                                                                <%--<igtxt:WebDateTimeEdit ID="WebDateTimeEdit2" runat="server" EditModeFormat="t" 
                                                                                    Value='<%# Eval("End_Time") %>'>
                                                                                </igtxt:WebDateTimeEdit>--%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style6">
                                                                                Full Destination</td>
                                                                            <td class="style15" colspan="2">
                                                                                <asp:TextBox ID="TextBox22" runat="server" Text='<%# Eval("Destination") %>' 
                                                                                    Width="342px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style15">
                                                                                </td>
                                                                            <td class="style15" colspan="2">
                                                                                <asp:Button ID="Button10" CssClass="btn btn-info" runat="server" onclick="Button10_Click" Text="Save" />
                                                                                <asp:Button ID="Button11" CssClass="btn btn-info" runat="server" onclick="Button11_Click" 
                                                                                    Text="Cancel" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" 
                                                                    DataKeyNames="Vehicle_Requisition_ApproveByTransStaff_Id" 
                                                                    DataSourceID="SqlDataSource2" Width="100%">
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
                            </tr>
                            <tr>
                                <td colspan="3">
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="P17_HiddenFieldBind_ID" runat="server" />
                                    <asp:HiddenField ID="P17_HiddenField_BindStartDate" runat="server" />
                                    <asp:HiddenField ID="P17_HiddenField_BindEndDate" runat="server" />
                                    <asp:HiddenField ID="P17_HiddenField_BindDestination" runat="server" />
                                    <asp:SqlDataSource ID="P17_SqlDataSource_Bind" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        InsertCommand="Vehicle_Requisition_Bind" InsertCommandType="StoredProcedure" 
                                        SelectCommand="SELECT [Vehicle_id], [Number] FROM [Vehicle]">
                                        <InsertParameters>
                                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                                            <asp:ControlParameter ControlID="P17_TextBox_Remarks" Name="Remarks" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_VR_Id" 
                                                Name="Vehicle_Requisition_Id" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="P17_HiddenFieldBind_ID" 
                                                Name="Vehicle_Requisition_ApproveByTransStaff_Main_Id" PropertyName="Value" 
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_BindStartDate" 
                                                Name="Start_Time" PropertyName="Value" Type="DateTime" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_BindEndDate" Name="End_Time" 
                                                PropertyName="Value" Type="DateTime" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_BindDestination" 
                                                Name="Destination" PropertyName="Value" Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="P17_SqlDataSource_AvaiableV" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        
                                        
                                        
                                        SelectCommand="SELECT Vehicle.Vehicle_id, Vehicle.Number + ' (' + Vehicle_BodyType.BodyType + ')' AS Number FROM Vehicle INNER JOIN Vehicle_Allocation ON Vehicle.Vehicle_id = Vehicle_Allocation.Vehicle_Id INNER JOIN Vehicle_Alocation_Type ON Vehicle_Allocation.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type.Vehicle_Alocation_Type_Id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id WHERE (NOT (Vehicle.Vehicle_id IN (SELECT Vehicle_1.Vehicle_id FROM Vehicle AS Vehicle_1 INNER JOIN Vehicle_Allocation AS Vehicle_Allocation_1 ON Vehicle_1.Vehicle_id = Vehicle_Allocation_1.Vehicle_Id INNER JOIN Vehicle_Alocation_Type AS Vehicle_Alocation_Type_1 ON Vehicle_Allocation_1.Vehicle_Alocation_Type_Id = Vehicle_Alocation_Type_1.Vehicle_Alocation_Type_Id INNER JOIN Vehicle_BodyType AS Vehicle_BodyType_1 ON Vehicle_1.Vehicle_BodyTypeId = Vehicle_BodyType_1.Vehicle_BodyType_Id INNER JOIN Vehicle_Requisition_ApproveByTransStaff ON Vehicle_1.Vehicle_id = Vehicle_Requisition_ApproveByTransStaff.Vehicle_Id INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN Vehicle_Requisition_ApproveByTransStaff_Main ON Vehicle_Requisition_ApproveByTransStaff.Vehicle_Requisition_ApproveByTransStaff_Main_Id = Vehicle_Requisition_ApproveByTransStaff_Main.Vehicle_Requisition_ApproveByTransStaff_Main_Id WHERE (Vehicle_Requisition_ApproveByTransStaff.IS_Rejected = 0) AND (@START_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) AND (Vehicle_Requisition.Is_Canceld_By_Staf_Emp = 0) AND (Vehicle_Alocation_Type_1.Is_Pool = 1) OR (Vehicle_Requisition_ApproveByTransStaff.IS_Rejected = 0) AND (Vehicle_Alocation_Type_1.Is_Pool = 1) AND (@End_Time BETWEEN Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time AND Vehicle_Requisition_ApproveByTransStaff_Main.End_Time) OR (Vehicle_Requisition_ApproveByTransStaff.IS_Rejected = 0) AND (Vehicle_Alocation_Type_1.Is_Pool = 1) AND (Vehicle_Requisition_ApproveByTransStaff_Main.Start_Time BETWEEN @START_Time AND @End_Time) OR (Vehicle_Requisition_ApproveByTransStaff.IS_Rejected = 0) AND (Vehicle_Alocation_Type_1.Is_Pool = 1) AND (Vehicle_Requisition_ApproveByTransStaff_Main.End_Time BETWEEN @START_Time AND @End_Time)))) AND (Vehicle_Alocation_Type.Is_Pool = 1)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="P17_HiddenField_StartTime" Name="START_Time" 
                                                PropertyName="Value" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_EndTime" Name="End_Time" 
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DataList ID="P17_DataList_AvaiableV" runat="server" 
                                        DataKeyField="Vehicle_id" DataSourceID="P17_SqlDataSource_AvaiableV" 
                                        onprerender="P17_DataList_AvaiableV_PreRender">
                                        <HeaderTemplate>
                                            <b>Available Vehicles ( </b>
                                            <asp:Label ID="NumberLabela" runat="server" Font-Bold="True" ForeColor="Red" />
                                            <b>)</b>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:HiddenField ID="HiddenField13" runat="server" 
                                                Value='<%# Eval("Vehicle_id") %>' />
                                            <asp:LinkButton ID="LinkButton11" runat="server"  CssClass="btn btn-info" onclick="LinkButton11_Click" 
                                                Text='<%# Eval("Number") %>'></asp:LinkButton>
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:Label ID="Label54" runat="server" Font-Bold="True" ForeColor="Red" 
                                        Text="Select a Vehicle" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="P17_TextBox_Remarks" runat="server" Height="78px" 
                                        TextMode="MultiLine" Width="398px"></asp:TextBox>
                                    <asp:HiddenField ID="P17_HiddenField_VR_Id" runat="server" 
                                        onvaluechanged="P16_HiddenField_VR_Id0_ValueChanged" />
                                    <asp:HiddenField ID="P17_HiddenField_Vehicle_SelectedID" runat="server" />
                                    <asp:HiddenField ID="P17_HiddenField_EndTime" runat="server" 
                                        onvaluechanged="P16_HiddenField_VR_Id0_ValueChanged" />
                                    <asp:HiddenField ID="P17_HiddenField_Reject_Approve" runat="server" />
                                    <asp:HiddenField ID="P17_HiddenField_StartTime" runat="server" 
                                        onvaluechanged="P16_HiddenField_VR_Id0_ValueChanged" />
                                </td>
                                <td>
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="P17_SqlDataSource_DirectApprove" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                        InsertCommand="Vehicle_Requisition_RejectAppove_Transport_Staff" 
                                        InsertCommandType="StoredProcedure" 
                                        SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Employee_Name, Vehicle_Requisition_ApproveByOfficer.Remarks AS Expr1, Vehicle_Requisition_ApproveByTransOfficer.IS_Rejected, Vehicle_Requisition.ForUse, Vehicle_Requisition.DemandFor, Vehicle_Requisition_ApproveByTransOfficer.Remarks AS Expr2 FROM Vehicle_Requisition_ApproveByTransOfficer INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByTransOfficer.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID INNER JOIN Vehicle_Requisition_ApproveByOfficer ON Vehicle_Requisition_ApproveByTransOfficer.Vehicle_Requisition_Id = Vehicle_Requisition_ApproveByOfficer.Vehicle_Requisition_Id WHERE (Vehicle_Requisition.Status = 4) AND (Vehicle_Requisition_ApproveByTransOfficer.IS_Rejected = 0)">
                                        <InsertParameters>
                                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                                            <asp:ControlParameter ControlID="P17_TextBox_Remarks" Name="Remarks" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_Reject_Approve" 
                                                Name="RejectApprove" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_VR_Id" 
                                                Name="Vehicle_Requisition_Id" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="P17_HiddenField_Vehicle_SelectedID" 
                                                Name="Vehicle_Id" PropertyName="Value" Type="Int32" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:Button ID="Button9"  CssClass="btn btn-info" runat="server" onclick="Button9_Click" 
                                        Text="Approve" />
                                    <asp:Button ID="P17_Button_Reject" CssClass="btn btn-info" runat="server" 
                                        onclick="P17_Button_Reject_Click" Text="Reject" />
                                    <asp:Button ID="P17_Button_Approve" CssClass="btn btn-info" runat="server" 
                                        onclick="P17_Button_Approve_Click" style="width: 68px" 
                                        Text="Forward To Staff" Width="96px" />
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
                <td>
                    </td>
                <td style="text-align: center">
                    </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:SqlDataSource ID="P17_SqlDataSource_ApprovedRejected" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="Vehicle_Requisition_Insert" InsertCommandType="StoredProcedure" 
                        SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Employee_Name, Vehicle_Requisition_ApproveByTransOfficer.IS_Rejected, Vehicle_Requisition_ApproveByTransOfficer.Remarks AS Expr1 FROM Vehicle_Requisition_ApproveByTransOfficer INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByTransOfficer.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID">
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
                    <asp:GridView ID="P17_GridView_ApprovedRejected" runat="server" 
                        AllowPaging="True" AutoGenerateColumns="False" 
                        DataKeyNames="Vehicle_Requisition_Id" 
                        DataSourceID="P17_SqlDataSource_ApprovedRejected" PageSize="5" 
                        Width="100%">
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
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("IS_Rejected") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox3" runat="server" 
                                        Checked='<%# Bind("IS_Rejected") %>' Enabled="False" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Expr1" HeaderText="Remarks" SortExpression="Expr1" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
<br /></div>

                            </div>

                        </div>
    </div>
             </ContentTemplate></asp:UpdatePanel>
</asp:Content>
