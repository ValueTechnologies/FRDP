<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleRequisitionManual.aspx.cs" Inherits="FRDP.TMS_VehicleRequisitionManual" %>
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
                                        <span>Vehicle Requisition </span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
    <div class="bxmain">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">

            <tr>
                <td align="right">
                    Departmen :</td>
                <td>
                    <asp:DropDownList ID="P14_DropDownList_SubDept" runat="server" 
                        AutoPostBack="True" DataSourceID="P14_SqlDataSource_SubDept" 
                        DataTextField="SubDept_Name" DataValueField="SubDept_Id" Width="202px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="P14_SqlDataSource_SubDept" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT Dept_ID SubDept_Id, Dept_Name  SubDept_Name FROM View_Department">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Designation :</td>
                <td>
                    <asp:DropDownList ID="P14_DropDownList_Designation" runat="server" 
                        AutoPostBack="True" DataSourceID="P14_SqlDataSource_Designation" 
                        DataTextField="Designation_Name" DataValueField="Designation_ID" 
                        Width="202px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="P14_SqlDataSource_Designation" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT ID Designation_ID, Name Designation_Name FROM tblDesig
Where ID in (Select DISTINCT tblDesigID FROM tblEmployee WHERE tblDept=@tblDept) 
ORDER BY Designation_Name ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="P14_DropDownList_SubDept" Name="tblDept" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Officer :</td>
                <td>
                    <asp:DropDownList ID="P14_DropDownList_Officer" runat="server" 
                        AutoPostBack="True" DataSourceID="P14_SqlDataSource_Emp_Name" 
                        DataTextField="Employee_Name" DataValueField="EmpID" Width="400px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="P14_SqlDataSource_Emp_Name" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                        
                        
                        SelectCommand="SELECT EmpID, ISNULL(Prefix, '') + ' ' + ISNULL(EFName, '') + ' ' + ISNULL(EMName, '') + ' ' + ISNULL(ELName, '') + ' ' + ISNULL(Relation, '') + ' ' + ISNULL(RFName, '') + ' ' + ISNULL(RMName, '') + ' ' + ISNULL(RLName, '') AS Employee_Name, SubDeptId FROM View_Employee WHERE (DesignationID = @DesignationID) AND (SubDeptId = @SubDeptId) ORDER BY Employee_Name">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="P14_DropDownList_Designation" 
                                Name="DesignationID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="P14_DropDownList_SubDept" Name="SubDeptId" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Location :</td>
                <td>
                  <asp:TextBox ID="P14_TextBox_Location" runat="server"></asp:TextBox>
                    <asp:Label ID="Label78" runat="server" ForeColor="Red" Text="* Enter Value" 
                        Visible="False"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td align="right">
                    Date :</td>
                <td>
                    <asp:TextBox ID="P14_WebDateChooser1" runat="server"></asp:TextBox>

                    <asp:CalendarExtender ID="WebDateChooser_PurchasedDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="P14_WebDateChooser1"></asp:CalendarExtender>
                    <%--<igsch:WebDateChooser ID="P14_WebDateChooser1" runat="server">
                    </igsch:WebDateChooser>--%>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="right">
                    From Time :</td>
                <td>
                    <asp:TextBox ID="P14_WebDateTimeEdit1"  ClientIDMode="Static"  runat="server"></asp:TextBox>
<%--                    <igtxt:WebDateTimeEdit ID="P14_WebDateTimeEdit1" runat="server" DataMode="Text" 
                        DisplayModeFormat="t" EditModeFormat="t">
                    </igtxt:WebDateTimeEdit>--%>
                    <asp:HiddenField ID="P14_HiddenField_FromDateTime" runat="server" />
                    <asp:HiddenField ID="P14_HiddenField_ToDateTime" runat="server" />
              </td>
            </tr>
            <tr>
                <td align="right">
                    To Time :</td>
                <td>
                    <asp:TextBox ID="P14_WebDateTimeEdit2" ClientIDMode="Static" runat="server"></asp:TextBox>
<%--                    <igtxt:WebDateTimeEdit ID="P14_WebDateTimeEdit2" runat="server" 
                        DisplayModeFormat="t" EditModeFormat="t">
                    </igtxt:WebDateTimeEdit>--%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    For Use :</td>
                <td>
                    <asp:RadioButtonList ID="P14_RadioButtonList_ForUse" runat="server" RepeatLayout="Flow" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Official</asp:ListItem>
                        <asp:ListItem>Private Business</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Demand :</td>
                <td>
                    <asp:RadioButtonList ID="P14_RadioButtonList_Demanded" runat="server" RepeatLayout="Flow" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Hi-Roof</asp:ListItem>
                        <asp:ListItem>Car</asp:ListItem>
                        <asp:ListItem>Loader</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Remarks :</td>
                <td>
                  <asp:TextBox ID="P14_TextBoxRemarks" runat="server"  
                        Height="80px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    </td>
                <td>
                  <asp:Button ID="P14_Button_Save" CssClass="btn btn-info" runat="server" Text="Submit Requisition" 
                        onclick="P14_Button_Save_Click" />                  
                    <asp:SqlDataSource ID="P14_SqlDataSource_Save" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="INSERT INTO Vehicle_Requisition(Staf_Emp_Id, Destination, FromTime, ToTime, Remarks, Emp_Id, DeptID, SubdeptId, DesignationID, ForUse, DemandFor) VALUES (@Staf_Emp_Id, @Destination, @FromTime, @ToTime, @Remarks, @Emp_Id, @DeptID, @SubdeptId, @DesignationID, @ForUse, @DemandFor)" 
                        
                        
                        
                        SelectCommand="SELECT Vehicle_Requisition.Vehicle_Requisition_Id, Vehicle_Requisition.Staf_Emp_Id, Vehicle_Requisition.Destination, Vehicle_Requisition.FromTime, Vehicle_Requisition.ToTime, Vehicle_Requisition.Remarks, Vehicle_Requisition.Date_Time, Vehicle_Requisition.Status, Vehicle_Requisition.Emp_Id, Vehicle_Requisition.Is_Canceld_By_Staf_Emp, View_Designation.Designation_Name, View_Department.Dept_Name, ISNULL(View_Employee.Prefix, '') + ' ' + ISNULL(View_Employee.EFName, '') + ' ' + ISNULL(View_Employee.EMName, '') + ' ' + ISNULL(View_Employee.ELName, '') + ' ' + ISNULL(View_Employee.Relation, '') + ' ' + ISNULL(View_Employee.RFName, '') + ' ' + ISNULL(View_Employee.RMName, '') + ' ' + ISNULL(View_Employee.RLName, '') AS Employee_Name, Vehicle_Requisition.ForUse, Vehicle_Requisition.DemandFor FROM Vehicle_Requisition INNER JOIN View_Employee ON Vehicle_Requisition.Staf_Emp_Id = View_Employee.EmpID INNER JOIN View_Department ON Vehicle_Requisition.DeptID = View_Department.Dept_ID INNER JOIN View_Designation ON Vehicle_Requisition.DesignationID = View_Designation.Designation_ID WHERE (Vehicle_Requisition.Emp_Id = @Emp_Id) AND (Vehicle_Requisition.Emp_Id &lt;&gt; Vehicle_Requisition.Staf_Emp_Id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="P14_DropDownList_Officer" Name="Staf_Emp_Id" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="P14_TextBox_Location" Name="Destination" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="P14_HiddenField_FromDateTime" Name="FromTime" 
                                PropertyName="Value" />
                            <asp:ControlParameter ControlID="P14_HiddenField_ToDateTime" Name="ToTime" 
                                PropertyName="Value" />
                            <asp:ControlParameter ControlID="P14_TextBoxRemarks" Name="Remarks" 
                                PropertyName="Text" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                            <asp:ControlParameter ControlID="P14_DropDownList_SubDept" Name="DeptID" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="P14_DropDownList_SubDept" Name="SubdeptId" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="P14_DropDownList_Designation" 
                                Name="DesignationID" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="P14_RadioButtonList_ForUse" Name="ForUse" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="P14_RadioButtonList_Demanded" Name="DemandFor" 
                                PropertyName="SelectedValue" />
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
                                        <span>Vehicle Requisition Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
                                                        <asp:GridView ID="P14_GridView_Save" CssClass="abGrid" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Vehicle_Requisition_Id" 
                        DataSourceID="P14_SqlDataSource_Save" Width="96%">
                        <Columns>
                            <asp:BoundField DataField="Employee_Name" HeaderText="Name" 
                                SortExpression="Employee_Name" />
                            <asp:BoundField DataField="Designation_Name" HeaderText="Designation" 
                                SortExpression="Designation_Name" />
                            <asp:BoundField DataField="Dept_Name" HeaderText="Department" 
                                SortExpression="Dept_Name" />
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
                                    <br />
</div>

                            </div>

                        </div>
    </div>

                <script type="text/javascript">
                    $(document).ready(function () {

                        $('#P14_WebDateTimeEdit1').timeEntry({
                            show24Hours: false,
                            spinnerImage: ''
                        });
                        $('#P14_WebDateTimeEdit1').timeEntry('setTime', '09:00AM');
                        $('#P14_WebDateTimeEdit2').timeEntry({
                            show24Hours: false,
                            spinnerImage: ''
                        });
                        $('#P14_WebDateTimeEdit2').timeEntry('setTime', '09:00AM');


            <%--$('#<%= P14_WebDateChooser1.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true });--%>

            $('#<%= P14_Button_Save.ClientID%>').live('click', function (e) {

                $('#<%= P14_HiddenField_FromDateTime.ClientID %>').attr('value', $('#P14_WebDateTimeEdit1').val());
                $('#<%= P14_HiddenField_ToDateTime.ClientID %>').attr('value', $('#P14_WebDateTimeEdit2').val());
            });

            $('#<%= P14_DropDownList_SubDept %>').live('change', function (e) {
                $('#P14_WebDateTimeEdit1').timeEntry({
                    show24Hours: false,
                    spinnerImage: ''
                });
                $('#P14_WebDateTimeEdit1').timeEntry('setTime', '09:00AM');
                $('#P14_WebDateTimeEdit2').timeEntry({
                    show24Hours: false,
                    spinnerImage: ''
                });
                $('#P14_WebDateTimeEdit2').timeEntry('setTime', '09:00AM');
            });

        });//End  Doc ready 

    </script>

     </ContentTemplate></asp:UpdatePanel>

</asp:Content>
