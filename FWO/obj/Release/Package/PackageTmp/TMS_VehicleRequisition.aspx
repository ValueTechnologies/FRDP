<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleRequisition.aspx.cs" Inherits="FRDP.TMS_VehicleRequisition" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                                        <span>Vehicle Requisition</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
    <div class="bxmain" >
    
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
        <tr>
            <td align="right">
                Location :</td>
            <td colspan="2">
              <asp:TextBox ID="P15_TextBox_Location" runat="server"></asp:TextBox>
                    <asp:Label ID="Label77" runat="server" ForeColor="Red" Text="* Enter Value" 
                        Visible="False"></asp:Label>
                </td>
            <td>
                </td>
        </tr>
        <tr>
            <td align="right">
                Date :</td>
          <td>
              <asp:TextBox ID="P15_WebDateChooser1" runat="server"></asp:TextBox>
              <asp:CalendarExtender ID="WebDateChooser_PurchasedDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="P15_WebDateChooser1"></asp:CalendarExtender>
<%--                    <igsch:WebDateChooser ID="P15_WebDateChooser1" runat="server">
                    </igsch:WebDateChooser>--%>
                </td>
            <td align="right">
                To Date :</td>
            <td>

                <asp:TextBox ID="P15_WebDateChooser2" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="P15_WebDateChooser2"></asp:CalendarExtender>
                <%--<igsch:WebDateChooser ID="P15_WebDateChooser2" runat="server">
              </igsch:WebDateChooser>--%>
                <asp:HiddenField ID="P15_HiddenField_ToDate" runat="server" />
          </td>
        </tr>
        <tr>
          <td align="right">
                From Time :</td>
          <td align="left">
              <asp:TextBox ID="P15_WebDateTimeEdit1" name="P15_WebDateTimeEdit1" ClientIDMode="Static" runat="server"></asp:TextBox>

<%--                <igtxt:WebDateTimeEdit ID="P15_WebDateTimeEdit1" runat="server" DataMode="Text" 
                    DisplayModeFormat="t" EditModeFormat="t">
                </igtxt:WebDateTimeEdit>--%>
                <asp:HiddenField ID="P15_HiddenField_FromDateTime" runat="server" />
            </td>
            <td align="right">
                To Time :</td>
          <td align="left">
              <asp:TextBox ID="P15_WebDateTimeEdit2" name="P15_WebDateTimeEdit2" ClientIDMode="Static" runat="server"></asp:TextBox>
<%--                <igtxt:WebDateTimeEdit ID="P15_WebDateTimeEdit2" runat="server" 
                    DisplayModeFormat="t" EditModeFormat="t">
            </igtxt:WebDateTimeEdit>--%>
                <asp:HiddenField ID="P15_HiddenField_ToDateTime" runat="server" />
          </td>
        </tr>
        <tr>
            <td align="right">
                For Use :</td>
            <td colspan="2">
                <asp:RadioButtonList ID="P15_RadioButtonList_ForUse" runat="server" RepeatLayout="Flow" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Official</asp:ListItem>
                    <asp:ListItem>Private Business</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td align="right">
                Demand :</td>
            <td colspan="2">
                <asp:RadioButtonList ID="P15_RadioButtonList_Demanded" runat="server"  RepeatLayout="Flow"
                    onselectedindexchanged="P14_RadioButtonList_Demanded0_SelectedIndexChanged" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Hi-Roof</asp:ListItem>
                    <asp:ListItem>Car</asp:ListItem>
                    <asp:ListItem>Loader</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td align="right">
                Remarks :</td>
            <td colspan="2">
              <asp:TextBox ID="P15_TextBoxRemarks" runat="server"  
                            Height="80px" TextMode="MultiLine" Width="90%"></asp:TextBox>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td align="right">
                </td>
            <td colspan="2">
              <asp:Button ID="P15_Button_Save" CssClass="btn btn-info" runat="server" Text="Submit Requisition" 
                        onclick="P15_Button_Save_Click" />
                </td>
            <td>
                </td>
        </tr>
        </table>
</div> 
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
                                        <span>Vehicle Requisition Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<asp:SqlDataSource ID="P15_SqlDataSource_Save" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                    InsertCommand="Vehicle_Requisition_Insert" 
                    
                    SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, View_SubDepartment.SubDept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') AS Employee_Name, Vehicle_Requisition.ForUse, Vehicle_Requisition.DemandFor FROM Vehicle_Requisition INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_SubDepartment ON Vehicle_Requisition.SubdeptId = View_SubDepartment.SubDept_Id INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID WHERE (Vehicle_Requisition.Staf_Emp_Id = @Emp_Id) ORDER BY Vehicle_Requisition.Date_Time DESC" 
                    InsertCommandType="StoredProcedure">
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
                        <asp:ControlParameter ControlID="P15_RadioButtonList_ForUse" Name="ForUse" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="P15_RadioButtonList_Demanded" Name="DemandFor" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="P15_HiddenField_ToDate" Name="To_Date" 
                            PropertyName="Value" Type="DateTime" />
                        <asp:Parameter DefaultValue="1" Name="Request_Id" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
            
                <asp:GridView ID="P15_GridView_Save" CssClass="abGrid" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Vehicle_Requisition_Id" 
                    DataSourceID="P15_SqlDataSource_Save" AllowPaging="True" Width="96%">
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
                        <asp:BoundField DataField="ForUse" HeaderText="For Use" 
                            SortExpression="ForUse" />
                        <asp:BoundField DataField="DemandFor" HeaderText="Demand" 
                            SortExpression="DemandFor" />
                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                            SortExpression="Remarks" />
                        <asp:BoundField DataField="Date_Time" HeaderText="Requested At" 
                            SortExpression="Date_Time" />
                    </Columns>
                </asp:GridView>
<br /></div>

                            </div>

                        </div>
    </div>
             </ContentTemplate></asp:UpdatePanel>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#P15_WebDateTimeEdit1').timeEntry({
                show24Hours: false,
                spinnerImage: ''
            });
            $('#P15_WebDateTimeEdit1').timeEntry('setTime', '09:00AM');
            $('#P15_WebDateTimeEdit2').timeEntry({
                show24Hours: false,
                spinnerImage: ''
            });
            $('#P15_WebDateTimeEdit2').timeEntry('setTime', '09:00AM');



            $('#<%= P15_Button_Save.ClientID %>').live('click', function (e) {
                $('#<%= P15_HiddenField_FromDateTime.ClientID %>').attr('value', $('#P15_WebDateTimeEdit1').val());
                $('#<%= P15_HiddenField_ToDateTime.ClientID %>').attr('value', $('#P15_WebDateTimeEdit2').val());
            });
        });
    </script>
</asp:Content>
