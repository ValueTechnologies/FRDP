<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_ApproveTransportRequisition.aspx.cs" Inherits="FRDP.TMS_ApproveTransportRequisition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                <style type="text/css">
        .abGrid {
            width: 97%;
            margin-left: 20px;
        }
        .abGrid tr {
    border-bottom: 1px solid #E1E1E1;
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
                                        <span>Approve Requisition</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                <tr>
                    <td style="text-align: center">
                        <asp:GridView ID="P16_GridView_Pending" CssClass="abGrid" runat="server" 
                            AutoGenerateColumns="False" DataKeyNames="Vehicle_Requisition_Id" 
                            DataSourceID="P16_SqlDataSource_Pending" AllowPaging="True" PageSize="5" 
                            Width="96%">
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
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Process</asp:LinkButton>
                                        <asp:HiddenField ID="HiddenField7" runat="server" 
                                            Value='<%# Eval("Vehicle_Requisition_Id") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="P16_SqlDataSource_Pending" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                            InsertCommand="Vehicle_Requisition_RejectAppove_Officer" InsertCommandType="StoredProcedure" 
                            
                            
                            
                            SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS Employee_Name, View_Employee_1.EmpID, Vehicle_Requisition.ForUse, Vehicle_Requisition.DemandFor FROM Vehicle_Requisition INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_Employee AS View_Employee_1 ON View_SubDepartment.SubDept_Id = View_Employee_1.SubDeptId WHERE  (View_Employee_1.EmpID = @EmpID) AND (Vehicle_Requisition.Status = 0)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="EmpID" SessionField="Emp_Id" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:SessionParameter DefaultValue="" Name="Emp_Id" SessionField="Emp_Id" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="P16_TextBox_Remarks" Name="Remarks" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="P16_HiddenField_Reject_Approve" Name="RejectApprove" 
                                    PropertyName="Value" Type="Int32" />
                                <asp:ControlParameter ControlID="P16_HiddenField_VR_Id" Name="Vehicle_Requisition_Id" 
                                    PropertyName="Value" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:TextBox ID="P16_TextBox_Remarks" runat="server" Height="78px" 
                            TextMode="MultiLine" Visible="False" Width="398px"></asp:TextBox>
                        <asp:HiddenField ID="P16_HiddenField_VR_Id" runat="server" />
                        <asp:HiddenField ID="P16_HiddenField_Reject_Approve" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="P16_Button_Approve" runat="server" 
                            onclick="P16_Button_Approve_Click" Text="Approve" Visible="False" />
                        <asp:Button ID="P16_Button_Reject" runat="server" 
                            onclick="P16_Button_Reject_Click" Text="Reject" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="P16_GridView_ApprovedRejected" CssClass="abGrid" runat="server" 
                            AutoGenerateColumns="False" DataKeyNames="Vehicle_Requisition_Id" 
                            DataSourceID="P16_SqlDataSource_ApprovedRejected" AllowPaging="True" 
                            PageSize="5" Width="96%">
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
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IS_Rejected") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" 
                                            Checked='<%# Bind("IS_Rejected") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Expr1" HeaderText="Remarks" SortExpression="Expr1" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="P16_SqlDataSource_ApprovedRejected" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                            InsertCommand="Vehicle_Requisition_Insert" InsertCommandType="StoredProcedure" 
                            
                            
                            
                            SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Employee_Name, Vehicle_Requisition_ApproveByOfficer.IS_Rejected, Vehicle_Requisition_ApproveByOfficer.Remarks AS Expr1 FROM Vehicle_Requisition_ApproveByOfficer INNER JOIN Vehicle_Requisition ON Vehicle_Requisition_ApproveByOfficer.Vehicle_Requisition_Id = Vehicle_Requisition.Vehicle_Requisition_Id INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID WHERE (Vehicle_Requisition_ApproveByOfficer.Emp_Id = @Emp_Id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                            </SelectParameters>
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
                    </td>
                </tr>
            </table>
<br /></div>

                            </div>

                        </div>
    </div>

            </ContentTemplate></asp:UpdatePanel>
</asp:Content>
