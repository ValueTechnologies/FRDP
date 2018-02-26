<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_Motor_Registration.aspx.cs" Inherits="FRDP.TMS_Motor_Registration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .abGrid {
            width: 97%;
            margin-left: 20px;
        }
            .abGrid tbody tr td {
            vertical-align:top; 
            }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Visible="False" Width="100%">
                <div class="row-fluid">
                    <div class="span12">

                        <div class="box gradient">

                            <div class="title">

                                <h4>
                                    <span class="icon16 icomoon-icon-equalizer-2"></span>
                                    <span>Register Vehicle Class</span>
                                </h4>
                                <a href="#" class="minimize">Minimize</a>
                            </div>
                            <div class="content noPad">
                                <br />
    <asp:SqlDataSource ID="SqlDataSource_Vehicle_Class_Id" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT Vehicle_Class_Id, Class, Description FROM Vehicle_Class ORDER BY Vehicle_Class_Id" 
                        
            ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
            
            
            InsertCommand="INSERT INTO Vehicle_Class(Class, Description) VALUES (@Class, @Description)" 
            UpdateCommand="UPDATE Vehicle_Class SET Class = @Class, Description = @Description WHERE (Vehicle_Class_Id = @Vehicle_Class_Id)">
                    <UpdateParameters>
                        <asp:Parameter Name="Class" />
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="Vehicle_Class_Id" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox_P1_Class" Name="Class" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_P1_Description" Name="Description" 
                            PropertyName="Text" />
                    </InsertParameters>
                    </asp:SqlDataSource>




                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">

                                    <tr>
                                        <td align="right" width="40%">Class :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_P1_Class" runat="server"></asp:TextBox>
                                            <asp:Label ID="Label80" runat="server" Visible="False"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right">Description :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_P1_Description" runat="server"></asp:TextBox></td>

                                    </tr>
                                    <tr>
                                        <td align="right"></td>
                                        <td>
                                            <asp:Button ID="Button_P1_Save" CssClass="btn btn-info" runat="server" OnClick="Button_P1_Save_Click"
                                                Text="Save" /><asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Cancel"  OnClick="Button_P1_Cancel_Click" /></td>
                                    </tr>
                                </table>
                                <br />
                                <asp:GridView ID="GridView1" runat="server" CssClass="abGrid" AutoGenerateColumns="False"
                                    DataKeyNames="Vehicle_Class_Id" DataSourceID="SqlDataSource_Vehicle_Class_Id">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                                        <asp:BoundField DataField="Description" HeaderText="Description"
                                            SortExpression="Description" />
                                    </Columns>
                                </asp:GridView>
                                <br />

                            </div>

                        </div>

                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" Visible="False" Width="100%">


                <div class="row-fluid">
                    <div class="span12">

                        <div class="box gradient">

                            <div class="title">

                                <h4>
                                    <span class="icon16 icomoon-icon-equalizer-2"></span>
                                    <span>Register Vehicle Manufacture</span>
                                </h4>
                                <a href="#" class="minimize">Minimize</a>
                            </div>
                            <div class="content noPad">
                                <br />
                                       <asp:SqlDataSource ID="SqlDataSource_Manufacturer" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
            
            
            SelectCommand="SELECT VehicleManufacturer.ManufacturerID, VehicleManufacturer.Manufacturer_Name, VehicleManufacturer.Location, VehicleManufacturer.PhoneNo, Vehicle_Class.Class, VehicleManufacturer.Vehicle_Class_Id FROM VehicleManufacturer INNER JOIN Vehicle_Class ON VehicleManufacturer.Vehicle_Class_Id = Vehicle_Class.Vehicle_Class_Id WHERE (VehicleManufacturer.Vehicle_Class_Id = @Vehicle_Class_Id)" 
            InsertCommand="INSERT INTO VehicleManufacturer(Manufacturer_Name, Location, PhoneNo, Vehicle_Class_Id) VALUES (@Manufacturer_Name, @Location, @PhoneNo, @Vehicle_Class_Id)" 
            UpdateCommand="UPDATE VehicleManufacturer SET Manufacturer_Name = @Manufacturer_Name, Location = @Location, PhoneNo = @PhoneNo, Vehicle_Class_Id = @Vehicle_Class_Id WHERE (ManufacturerID = @ManufacturerID)">
            <SelectParameters>
                <asp:ControlParameter 
                    ControlID="DropDownList_ClassId" Name="Vehicle_Class_Id" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Manufacturer_Name" />
                <asp:Parameter Name="Location" />
                <asp:Parameter Name="PhoneNo" />
                <asp:Parameter Name="Vehicle_Class_Id" />
                <asp:Parameter Name="ManufacturerID" />
            </UpdateParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox_Manufacturer" Name="Manufacturer_Name" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox_Location" Name="Location" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox_Phone" Name="PhoneNo" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList_ClassId" Name="Vehicle_Class_Id" 
                    PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>

                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">

                                    <tr>
                                        <td align="right" width="25%">Class :</td>
                                        <td width="25%">
                                            <asp:DropDownList ID="DropDownList_ClassId" runat="server" AutoPostBack="True"
                                                DataSourceID="SqlDataSource_Vehicle_Class_Id" DataTextField="Class"
                                                DataValueField="Vehicle_Class_Id">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" width="25%">Location : </td>
                                        <td width="25%">
                                            <asp:TextBox ID="TextBox_Location" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">Manufacturer :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_Manufacturer" runat="server"></asp:TextBox>
                                            <asp:Label ID="Label81" runat="server" Visible="False"></asp:Label>
                                        </td>
                                        <td align="right">Phone :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_Phone" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="Button_P2_Save" CssClass="btn btn-info" runat="server" Text="Save"
                                                OnClick="Button_P2_Save_Click" /><asp:Button ID="btnCancel" CssClass="btn btn-info" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></td>
                                    </tr>

                                </table>
                                <br />
                                <asp:GridView ID="GridView_P2_Manufacturer" runat="server" CssClass="abGrid"
                                    AutoGenerateColumns="False" DataKeyNames="ManufacturerID"
                                    DataSourceID="SqlDataSource_Manufacturer">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="Manufacturer_Name" HeaderText="Manufacturer"
                                            SortExpression="Manufacturer_Name" />
                                        <asp:BoundField DataField="Location" HeaderText="Location"
                                            SortExpression="Location" />
                                        <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo"
                                            SortExpression="PhoneNo" />
                                        <asp:TemplateField HeaderText="Class" SortExpression="Class">
                                            <EditItemTemplate>
          <asp:SqlDataSource ID="SqlDataSource_Vehicle_Class_Id0" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                                                InsertCommand="INSERT INTO Vehicle_Class(Class, Description) VALUES (@Class, @Description)" 
                                                ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                                                SelectCommand="SELECT Vehicle_Class_Id, Class, Description FROM Vehicle_Class ORDER BY Vehicle_Class_Id" 
                                                UpdateCommand="UPDATE Vehicle_Class SET Class = @Class, Description = @Description WHERE (Vehicle_Class_Id = @Vehicle_Class_Id)">
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Class" />
                                                    <asp:Parameter Name="Description" />
                                                    <asp:Parameter Name="Vehicle_Class_Id" />
                                                </UpdateParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Class" />
                                                    <asp:Parameter Name="Description" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                                <asp:DropDownList ID="DropDownList_ClassId0" runat="server" AutoPostBack="True"
                                                    DataSourceID="SqlDataSource_Vehicle_Class_Id0" DataTextField="Class"
                                                    DataValueField="Vehicle_Class_Id"
                                                    SelectedValue='<%# Bind("Vehicle_Class_Id") %>'>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Class") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                            </div>

                        </div>

                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="False" Width="100%">

                <div class="row-fluid">
                    <div class="span12">

                        <div class="box gradient">

                            <div class="title">

                                <h4>
                                    <span class="icon16 icomoon-icon-equalizer-2"></span>
                                    <span>Register Vehicle Types</span>
                                </h4>
                                <a href="#" class="minimize">Minimize</a>
                            </div>
                            <div class="content noPad">
                                <br />
      <asp:SqlDataSource ID="SqlDataSource_Vehicle_Type" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
            
            SelectCommand="SELECT Vehicle_Type.VehicleTypeID, Vehicle_Type.VehicleTypeName, Vehicle_Type.ManufactureID, VehicleManufacturer.Manufacturer_Name, VehicleManufacturer.Vehicle_Class_Id, Vehicle_Class.Class FROM Vehicle_Type INNER JOIN VehicleManufacturer ON Vehicle_Type.ManufactureID = VehicleManufacturer.ManufacturerID INNER JOIN Vehicle_Class ON VehicleManufacturer.Vehicle_Class_Id = Vehicle_Class.Vehicle_Class_Id WHERE (Vehicle_Type.ManufactureID = @ManufactureID) AND (VehicleManufacturer.Vehicle_Class_Id = @Vehicle_Class_Id)" 
            InsertCommand="INSERT INTO Vehicle_Type(VehicleTypeName, ManufactureID) VALUES (@VehicleTypeName, @ManufactureID)" 
            UpdateCommand="UPDATE Vehicle_Type SET VehicleTypeName = @VehicleTypeName WHERE (VehicleTypeID = @VehicleTypeID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList_Manufacturer" 
                    Name="ManufactureID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList_ClassId1" Name="Vehicle_Class_Id" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="VehicleTypeName" />
                <asp:Parameter Name="VehicleTypeID" />
            </UpdateParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox_VehicleType" Name="VehicleTypeName" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList_Manufacturer" 
                    Name="ManufactureID" PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                    <tr>
                                        <td align="right" width="40%">Class :</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList_ClassId1" runat="server" AutoPostBack="True"
                                                DataSourceID="SqlDataSource_Vehicle_Class_Id" DataTextField="Class"
                                                DataValueField="Vehicle_Class_Id">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right">Manufacturer :</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList_Manufacturer" runat="server"
                                                DataSourceID="SqlDataSource_Manufacturer0" DataTextField="Manufacturer_Name"
                                                DataValueField="ManufacturerID">
                                            </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_Manufacturer0" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="INSERT INTO VehicleManufacturer(Manufacturer_Name, Location, PhoneNo, Vehicle_Class_Id) VALUES (@Manufacturer_Name, @Location, @PhoneNo, @Vehicle_Class_Id)" 
                        SelectCommand="SELECT VehicleManufacturer.ManufacturerID, VehicleManufacturer.Manufacturer_Name, VehicleManufacturer.Location, VehicleManufacturer.PhoneNo, Vehicle_Class.Class, VehicleManufacturer.Vehicle_Class_Id FROM VehicleManufacturer INNER JOIN Vehicle_Class ON VehicleManufacturer.Vehicle_Class_Id = Vehicle_Class.Vehicle_Class_Id WHERE (VehicleManufacturer.Vehicle_Class_Id = @Vehicle_Class_Id)" 
                        UpdateCommand="UPDATE VehicleManufacturer SET Manufacturer_Name = @Manufacturer_Name, Location = @Location, PhoneNo = @PhoneNo, Vehicle_Class_Id = @Vehicle_Class_Id WHERE (ManufacturerID = @ManufacturerID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList_ClassId1" Name="Vehicle_Class_Id" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Manufacturer_Name" />
                            <asp:Parameter Name="Location" />
                            <asp:Parameter Name="PhoneNo" />
                            <asp:Parameter Name="Vehicle_Class_Id" />
                            <asp:Parameter Name="ManufacturerID" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBox_Manufacturer" Name="Manufacturer_Name" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox_Location" Name="Location" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox_Phone" Name="PhoneNo" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="DropDownList_ClassId" Name="Vehicle_Class_Id" 
                                PropertyName="SelectedValue" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right">Vehicle Type :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_VehicleType" runat="server"></asp:TextBox>
                                            <asp:Label ID="Label82" runat="server" Visible="False"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right"></td>
                                        <td>
                                            <asp:Button ID="Button_P3_Save" CssClass="btn btn-info marginB10" runat="server"
                                                OnClick="Button_P3_Save_Click" Text="Save" />
                                            <asp:Button ID="Button2" CssClass="btn btn-info marginB10" runat="server"
                                                OnClick="Button_P3_Cancel_Click" Text="Cancel" />
                                        </td>
                                    </tr>
                                </table>

                                <br />
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="abGrid"
                                    DataKeyNames="VehicleTypeID" DataSourceID="SqlDataSource_Vehicle_Type">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="VehicleTypeName" HeaderText="Vehicle Type"
                                            SortExpression="VehicleTypeName" />
                                        <asp:TemplateField HeaderText="Manufacturer" SortExpression="Manufacturer_Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Manufacturer_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Class" SortExpression="Class">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Class") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                                <br />
                            </div>

                        </div>

                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" Visible="False" Width="100%">

                <div class="row-fluid">
                    <div class="span12">

                        <div class="box gradient">

                            <div class="title">

                                <h4>
                                    <span class="icon16 icomoon-icon-equalizer-2"></span>
                                    <span>Register Vehicle Condition</span>
                                </h4>
                                <a href="#" class="minimize">Minimize</a>
                            </div>
                            <div class="content noPad">
                                <br />
      <asp:SqlDataSource ID="SqlDataSource_Vehicle_Condition_Id" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
            
            SelectCommand="SELECT Vehicle_Condition_Id, Condition, Description FROM Vehicle_Condition" 
            InsertCommand="INSERT INTO Vehicle_Condition(Condition, Description) VALUES (@Condition, @Description)" 
            UpdateCommand="UPDATE Vehicle_Condition SET Condition = @Condition, Description = @Description WHERE (Vehicle_Condition_Id = @Vehicle_Condition_Id)">
           <UpdateParameters>
               <asp:Parameter Name="Condition" />
               <asp:Parameter Name="Description" />
               <asp:Parameter Name="Vehicle_Condition_Id" />
           </UpdateParameters>
           <InsertParameters>
               <asp:ControlParameter ControlID="TextBox_Condition" Name="Condition" 
                   PropertyName="Text" />
               <asp:ControlParameter ControlID="TextBox_ConditionDescription" 
                   Name="Description" PropertyName="Text" />
           </InsertParameters>
        </asp:SqlDataSource>


                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                    <tr>
                                        <td align="right" width="40%">Condition :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_Condition" runat="server"></asp:TextBox>
                                            <asp:Label ID="Label83" runat="server" Visible="False"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right">Description :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_ConditionDescription" runat="server"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right"></td>
                                        <td>
                                            <asp:Button ID="Button_P4_Save" CssClass="btn btn-info marginB10" runat="server" OnClick="Button_P4_Save_Click"
                                                Text="Save" />
                                            <asp:Button ID="Button3" CssClass="btn btn-info marginB10" runat="server" OnClick="Button_P4_Cancel_Click"
                                                Text="Cancel" />
                                        </td>

                                    </tr>
                                </table>
                                <br />
                                <asp:GridView ID="GridView_Condition" runat="server" CssClass="abGrid"
                                    AutoGenerateColumns="False" DataKeyNames="Vehicle_Condition_Id"
                                    DataSourceID="SqlDataSource_Vehicle_Condition_Id">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="Condition" HeaderText="Condition"
                                            SortExpression="Condition" />
                                        <asp:BoundField DataField="Description" HeaderText="Description"
                                            SortExpression="Description" />
                                    </Columns>
                                </asp:GridView>

                                <br />
                            </div>

                        </div>

                    </div>
                </div>
            </asp:Panel>



            <asp:Panel ID="Panel5" runat="server" Visible="False" Width="100%">

                <div class="row-fluid">
                    <div class="span12">

                        <div class="box gradient">

                            <div class="title">

                                <h4>
                                    <span class="icon16 icomoon-icon-equalizer-2"></span>
                                    <span>Register Vehicle Body Types</span>
                                </h4>
                                <a href="#" class="minimize">Minimize</a>
                            </div>
                            <div class="content noPad">
                                <br />
        <asp:SqlDataSource ID="SqlDataSource_Vehicle_BodyTypeId" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
            ProviderName="System.Data.SqlClient" 
            
            SelectCommand="SELECT Vehicle_BodyType_Id, BodyType, Description FROM Vehicle_BodyType" 
            InsertCommand="INSERT INTO Vehicle_BodyType(BodyType, Description) VALUES (@BodyType, @Description)" 
            UpdateCommand="UPDATE Vehicle_BodyType SET BodyType = @BodyType, Description = @Description WHERE (Vehicle_BodyType_Id = @Vehicle_BodyType_Id)">
            <UpdateParameters>
                <asp:Parameter Name="BodyType" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="Vehicle_BodyType_Id" />
            </UpdateParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox_BodyType" Name="BodyType" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox_BodyTypeDescription" 
                    Name="Description" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>



                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">

                                    <tr>
                                        <td align="right" width="40%">Body Type :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_BodyType" runat="server"></asp:TextBox>
                                            <asp:Label ID="Label84" runat="server" Visible="False"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right">Description :</td>
                                        <td>
                                            <asp:TextBox ID="TextBox_BodyTypeDescription" runat="server"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="right"></td>
                                        <td>
                                            <asp:Button ID="Button_P5_Save" CssClass="btn btn-info marginB10" runat="server" OnClick="Button1_Click"
                                                Text="Save" />
                                            <asp:Button ID="Button9" CssClass="btn btn-info marginB10" runat="server" OnClick="Button1Cancel_Click"
                                                Text="Cancel" />
                                        </td>

                                    </tr>
                                </table>

                                <br />
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="abGrid"
                                    DataKeyNames="Vehicle_BodyType_Id"
                                    DataSourceID="SqlDataSource_Vehicle_BodyTypeId">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="BodyType" HeaderText="BodyType"
                                            SortExpression="BodyType" />
                                        <asp:BoundField DataField="Description" HeaderText="Description"
                                            SortExpression="Description" />
                                    </Columns>
                                </asp:GridView>

                                <br />
                            </div>

                        </div>

                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel10" runat="server" Width="100%">
                <div class="row-fluid">
                    <div class="span12">

                        <div class="box gradient">

                            <div class="title">

                                <h4>
                                    <span class="icon16 icomoon-icon-equalizer-2"></span>
                                    <span>Vehicle Registration</span>
                                </h4>
                                <a href="#" class="minimize">Minimize</a>
                            </div>
                            <div class="content noPad">
                                <br />

                                <div class="bxmain">

                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
                                        <tr>
                                            <td align="right">Owner Name :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_OwnerName" runat="server" Enabled="False">FRDP</asp:TextBox>
                                                <asp:HiddenField ID="HiddenField_VehicleId_p10" runat="server" Value="0" />
                                            </td>
                                            <td align="right">Registration Authority :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Registration_Authority" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Vehicle Class :</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList_Vehicle_Class_Id" runat="server"
                                                    AutoPostBack="True" DataSourceID="SqlDataSource_Vehicle_Class_Id_P10"
                                                    DataTextField="Class" DataValueField="Vehicle_Class_Id">
                                                </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource_Vehicle_Class_Id_P10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT Vehicle_Class_Id, Class FROM Vehicle_Class ORDER BY Vehicle_Class_Id" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                                                <asp:Button ID="Button4" CssClass="btn btn-info  marginB10" runat="server" OnClick="Button4_Click" Style="padding: 1;"
                                                    Text=" + " />
                                            </td>
                                            <td align="right">Manufacture Month :</td>
                                            <td>
                                                <br />
                                                <asp:DropDownList ID="DropDownList_ManufactureMonths" runat="server"
                                                    DataSourceID="SqlDataSource_ManufactureMonths" DataTextField="Month_Abb"
                                                    DataValueField="Month_Name">
                                                </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource_ManufactureMonths" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        SelectCommand="SELECT Month_Name, Month_Abb FROM View_Year_Months">
                    </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Maker Name :</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList_ManufacturerId" runat="server"
                                                    AutoPostBack="True" DataSourceID="SqlDataSource_ManufacturerP10"
                                                    DataTextField="Manufacturer_Name" DataValueField="ManufacturerID">
                                                </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_ManufacturerP10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT ManufacturerID, Manufacturer_Name FROM VehicleManufacturer WHERE (Vehicle_Class_Id = @Vehicle_Class_Id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList_Vehicle_Class_Id" 
                                Name="Vehicle_Class_Id" PropertyName="SelectedValue" DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                                <asp:Button ID="Button5" CssClass="btn btn-info marginB10" runat="server" OnClick="Button5_Click"
                                                    Text=" + " />
                                            </td>
                                            <td align="right">Manufacture Year :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Manufacture_Year" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Vehicle Type :</td>
                                            <td>
                                                <asp:DropDownList ID="Vehicle_Type_Id" runat="server"
                                                    DataSourceID="SqlDataSource_VType_P10" DataTextField="VehicleTypeName"
                                                    DataValueField="VehicleTypeID">
                                                </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_VType_P10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT VehicleTypeID, VehicleTypeName FROM Vehicle_Type WHERE (ManufactureID = @ManufactureID)" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList_ManufacturerId" 
                                Name="ManufactureID" PropertyName="SelectedValue" DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                                <asp:Button ID="Button6" CssClass="btn btn-info marginB10" runat="server"
                                                    OnClick="Button6_Click" Text=" + " />
                                            </td>
                                            <td align="right">Horse Power :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_HorsePower" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Vehicle Condition :</td>
                                            <td>
                            <asp:SqlDataSource ID="SqlDataSource_Vehicle_Condition_Id_P10" 
                        runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT Vehicle_Condition_Id, Condition FROM Vehicle_Condition" 
                        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                                                <asp:DropDownList ID="DropDownList_Vehicle_Condition_Id" runat="server"
                                                    AutoPostBack="True" DataSourceID="SqlDataSource_Vehicle_Condition_Id_P10"
                                                    DataTextField="Condition" DataValueField="Vehicle_Condition_Id">
                                                </asp:DropDownList>
                                                <asp:Button ID="Button7" CssClass="btn btn-info marginB10" runat="server" OnClick="Button7_Click" Text=" + " />
                                            </td>
                                            <td align="right">No Of Cylinder :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_NoOfCylinder" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Vehicle Body :</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList_Vehicle_BodyTypeId" runat="server"
                                                    AutoPostBack="True" DataSourceID="SqlDataSource_Vehicle_BodyTypeId"
                                                    DataTextField="BodyType" DataValueField="Vehicle_BodyType_Id">
                                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" 
                        runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        
                        SelectCommand="SELECT Vehicle_BodyType_Id, BodyType FROM Vehicle_BodyType" 
                        ProviderName="System.Data.SqlClient">
                    </asp:SqlDataSource>
                                                <asp:Button ID="Button8" CssClass="btn btn-info marginB10" runat="server" OnClick="Button8_Click" Text=" + " />
                                            </td>
                                            <td align="right">Cubic Capacity :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_CubicCapacity" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Vehicle Fuel Type :</td>
                                            <td>
                                                <asp:CheckBoxList ID="CheckBoxList_Vehicle_FuelType" runat="server" RepeatDirection="Horizontal"
                                                    DataSourceID="SqlDataSource_Vehicle_FuelType_Id" DataTextField="Fuel"
                                                    DataValueField="Vehicle_FuelType_Id">
                                                </asp:CheckBoxList>
                                                <asp:HiddenField ID="HiddenField_Vehicle_FuelType_Id" runat="server" />
                    <asp:SqlDataSource ID="SqlDataSource_Vehicle_FuelType_Id" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                    SelectCommand="SELECT Vehicle_FuelType_Id, Fuel FROM Vehicle_FuelType ORDER BY Fuel" 
                    ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                    InsertCommand="INSERT INTO Vehicle_Fuel(Vehicle_FuelType_Id, Vehicle_id, Emp_Id) VALUES (@Vehicle_FuelType_Id, @Vehicle_id, @Emp_Id)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="HiddenField_Vehicle_FuelType_Id" 
                                Name="Vehicle_FuelType_Id" PropertyName="Value" />
                            <asp:ControlParameter ControlID="HiddenField_Vehicle_id" Name="Vehicle_id" 
                                PropertyName="Value" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                        </InsertParameters>
                </asp:SqlDataSource>
                                            </td>
                                            <td align="right">Engine No. :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_EnginNo" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Seating Capcity :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_SeatingCapcity" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="right">Chassis Number :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_ChassisNumber" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">UnLanded Weight :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_UnLandedWeight" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="right">Colour :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Colour" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Lenght :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Lenght" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="right">Width :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Width" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Height :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Height" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="right">Insurance Number :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_InsuranceNumber" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Insurance From (Date) :</td>
                                            <td>
                                                <asp:TextBox ID="WebDateChooser_Insurance_FromDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="WebDateChooser_Insurance_FromDate"></asp:CalendarExtender>
                                                <asp:HiddenField ID="HiddenField_Insurance_FromDate" runat="server" />
                                            </td>
                                            <td align="right">Insurance To (Date) :</td>
                                            <td>
                                                <asp:TextBox ID="WebDateChooser_Insurance_ToDate" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="WebDateChooser_Insurance_ToDate"></asp:CalendarExtender>
                                                <asp:HiddenField ID="HiddenField__Insurance_ToDate" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Vehicle Tag Number :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Number" runat="server"></asp:TextBox>
                                                <asp:Label ID="Label79" runat="server" ForeColor="Red" Text="* Enter Value"></asp:Label>
                                            </td>
                                            <td align="right">Registration No. :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_RegistrationNo" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Purchase Date :</td>
                                            <td>
                                                <asp:TextBox ID="WebDateChooser_PurchasedDate" runat="server"></asp:TextBox>

                                                <asp:CalendarExtender ID="WebDateChooser_PurchasedDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="WebDateChooser_PurchasedDate">
                                </asp:CalendarExtender>
                                                <asp:HiddenField ID="HiddenField_PurchasedDate" runat="server" />
                                            </td>
                                            <td align="right">Cost :</td>
                                            <td>
                                                <asp:TextBox ID="TextBox_Cost" CssClass="Integer" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                                             <asp:SqlDataSource ID="SqlDataSource_Save" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                    InsertCommand="Insert_Vehicle" 
                    
                    
                    SelectCommand="SELECT Vehicle.Vehicle_id, Vehicle.Owner, Vehicle.Registration_Authority, Vehicle.Vehicle_Class_Id, Vehicle.Vehicle_Condition_Id, Vehicle.Vehicle_Type_Id, Vehicle.Vehicle_BodyTypeId, Vehicle.Maker_Name, Vehicle.Manufacture_Year, Vehicle.Manufacture_Month, Vehicle.ChassisNumber, Vehicle.EnginNo, Vehicle.SeatingCapcity, Vehicle.Colour, Vehicle.InsuranceNumber, CONVERT (VARCHAR(20), Vehicle.Insurance_FromDate, 103) AS Insurance_FromDate, CONVERT (VARCHAR(20), Vehicle.Insurance_ToDate, 103) AS Insurance_ToDate, Vehicle.Number, Vehicle_BodyType.BodyType, Vehicle_Class.Class, Vehicle_Condition.Condition, Vehicle_Type.VehicleTypeName, Vehicle.Cost, VehicleManufacturer.Manufacturer_Name, Vehicle.NoOfCylinder, Vehicle.HorsePower, Vehicle.CubicCapacity, Vehicle.UnLandedWeight, Vehicle.Width, Vehicle.Lenght, Vehicle.Height, Vehicle.Registration_Number, CONVERT(VARCHAR(50) ,Vehicle.Purchased_Date,103) Purchased_Date  FROM Vehicle INNER JOIN Vehicle_Class ON Vehicle.Vehicle_Class_Id = Vehicle_Class.Vehicle_Class_Id INNER JOIN Vehicle_Condition ON Vehicle.Vehicle_Condition_Id = Vehicle_Condition.Vehicle_Condition_Id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN Vehicle_Type ON Vehicle.Vehicle_Type_Id = Vehicle_Type.VehicleTypeID INNER JOIN VehicleManufacturer ON Vehicle.Maker_Name = VehicleManufacturer.ManufacturerID" 
                    ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                    InsertCommandType="StoredProcedure" 
                    oninserted="SqlDataSource_Save_Inserted" 
                    DeleteCommand="DELETE FROM Vehicle WHERE (Vehicle_id = @Vehicle_id)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="HiddenField_VehicleId_p10" Name="Vehicle_id" 
                            PropertyName="Value" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox_OwnerName" Name="Owner" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Registration_Authority" 
                            Name="Registration_Authority" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList_Vehicle_Class_Id" 
                            Name="Vehicle_Class_Id" PropertyName="SelectedValue" DefaultValue="" />
                        <asp:ControlParameter ControlID="DropDownList_Vehicle_Condition_Id" 
                            Name="Vehicle_Condition_Id" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="Vehicle_Type_Id" Name="Vehicle_Type_Id" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList_Vehicle_BodyTypeId" 
                            Name="Vehicle_BodyTypeId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList_ManufacturerId" Name="Maker_Name" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextBox_Manufacture_Year" 
                            Name="Manufacture_Year" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList_ManufactureMonths" 
                            Name="Manufacture_Month" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextBox_NoOfCylinder" Name="NoOfCylinder" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_HorsePower" Name="HorsePower" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_CubicCapacity" Name="CubicCapacity" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_ChassisNumber" Name="ChassisNumber" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_EnginNo" Name="EnginNo" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_SeatingCapcity" Name="SeatingCapcity" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_UnLandedWeight" Name="UnLandedWeight" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Colour" Name="Colour" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Lenght" Name="Lenght" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Width" Name="Width" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Height" Name="Height" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_InsuranceNumber" 
                            Name="InsuranceNumber" PropertyName="Text" />
                        <asp:ControlParameter ControlID="WebDateChooser_Insurance_FromDate" 
                            Name="Insurance_FromDate" PropertyName="Text" />
                        <asp:ControlParameter ControlID="WebDateChooser_Insurance_ToDate" 
                            Name="Insurance_ToDate" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Number" Name="Number" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_RegistrationNo" 
                            Name="Registration_Number" PropertyName="Text" DefaultValue="0" />
                        <asp:ControlParameter ControlID="WebDateChooser_PurchasedDate" 
                            Name="Purchased_Date" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Cost" Name="Cost" 
                            PropertyName="Text" />
                        <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                        <asp:Parameter Direction="Output" Name="Vehicle_id_Return" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                                <br />

                                <asp:HiddenField ID="HiddenField_Vehicle_id" runat="server" />
                                <div style="text-align: right; margin-right: 40px;">
                                    <asp:Button ID="Button_Save" CssClass="btn btn-info marginB10" runat="server" OnClick="Button_Save_Click"
                                        Text="Save" />
                                    <asp:Button ID="Button_Update_P10" CssClass="btn btn-info marginB10" runat="server"
                                        OnClick="Button_Update_P10_Click" Text="Update" Visible="False" />
                                    <asp:Button ID="Button_Cancel_P10" CssClass="btn btn-info marginB10" runat="server"
                                        OnClick="Button_Cancel_P10_Click" Text="Cancel" Visible="False" />
                                </div>
                             
                                                <asp:SqlDataSource ID="SqlDataSource_Save0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                    InsertCommand="Update_Vehicle" InsertCommandType="StoredProcedure" 
                    ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT Vehicle.Vehicle_id, Vehicle.Owner, Vehicle.Registration_Authority, Vehicle.Vehicle_Class_Id, Vehicle.Vehicle_Condition_Id, Vehicle.Vehicle_Type_Id, Vehicle.Vehicle_BodyTypeId, Vehicle.Maker_Name, Vehicle.Manufacture_Year, Vehicle.Manufacture_Month, Vehicle.ChassisNumber, Vehicle.EnginNo, Vehicle.SeatingCapcity, Vehicle.Colour, Vehicle.InsuranceNumber, CONVERT (VARCHAR(20), Vehicle.Insurance_FromDate, 103) AS Insurance_FromDate, CONVERT (VARCHAR(20), Vehicle.Insurance_ToDate, 103) AS Insurance_ToDate, Vehicle.Number, Vehicle_BodyType.BodyType, Vehicle_Class.Class, Vehicle_Condition.Condition, Vehicle_Type.VehicleTypeName, Vehicle.Cost, VehicleManufacturer.Manufacturer_Name, Vehicle.NoOfCylinder, Vehicle.HorsePower, Vehicle.CubicCapacity, Vehicle.UnLandedWeight, Vehicle.Width, Vehicle.Lenght, Vehicle.Height, Vehicle.Registration_Number, Vehicle.Purchased_Date FROM Vehicle INNER JOIN Vehicle_Class ON Vehicle.Vehicle_Class_Id = Vehicle_Class.Vehicle_Class_Id INNER JOIN Vehicle_Condition ON Vehicle.Vehicle_Condition_Id = Vehicle_Condition.Vehicle_Condition_Id INNER JOIN Vehicle_BodyType ON Vehicle.Vehicle_BodyTypeId = Vehicle_BodyType.Vehicle_BodyType_Id INNER JOIN Vehicle_Type ON Vehicle.Vehicle_Type_Id = Vehicle_Type.VehicleTypeID INNER JOIN VehicleManufacturer ON Vehicle.Maker_Name = VehicleManufacturer.ManufacturerID">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox_OwnerName" Name="Owner" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Registration_Authority" 
                            Name="Registration_Authority" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList_Vehicle_Class_Id" 
                            Name="Vehicle_Class_Id" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList_Vehicle_Condition_Id" 
                            Name="Vehicle_Condition_Id" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="Vehicle_Type_Id" Name="Vehicle_Type_Id" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList_Vehicle_BodyTypeId" 
                            Name="Vehicle_BodyTypeId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList_ManufacturerId" Name="Maker_Name" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextBox_Manufacture_Year" 
                            Name="Manufacture_Year" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList_ManufactureMonths" 
                            Name="Manufacture_Month" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextBox_NoOfCylinder" Name="NoOfCylinder" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_HorsePower" Name="HorsePower" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_CubicCapacity" Name="CubicCapacity" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_ChassisNumber" Name="ChassisNumber" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_EnginNo" Name="EnginNo" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_SeatingCapcity" Name="SeatingCapcity" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_UnLandedWeight" Name="UnLandedWeight" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Colour" Name="Colour" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Lenght" Name="Lenght" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Width" Name="Width" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Height" Name="Height" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_InsuranceNumber" 
                            Name="InsuranceNumber" PropertyName="Text" />
                        <asp:ControlParameter ControlID="WebDateChooser_Insurance_FromDate" 
                            Name="Insurance_FromDate" PropertyName="Text" />
                        <asp:ControlParameter ControlID="WebDateChooser_Insurance_ToDate" 
                            Name="Insurance_ToDate" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Number" Name="Number" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_RegistrationNo" 
                            Name="Registration_Number" PropertyName="Text" />
                        <asp:ControlParameter ControlID="WebDateChooser_PurchasedDate" 
                            Name="Purchased_Date" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox_Cost" Name="Cost" 
                            PropertyName="Text" />
                        <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                        <asp:ControlParameter ControlID="HiddenField_VehicleId_p10" Name="Vehicle_id" 
                            PropertyName="Value" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource_Vehicle_FuelType_Id0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                    InsertCommand="INSERT INTO Vehicle_Fuel(Vehicle_FuelType_Id, Vehicle_id, Emp_Id) VALUES (@Vehicle_FuelType_Id, @Vehicle_id, @Emp_Id)" 
                    ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT Vehicle_FuelType_Id, Fuel FROM Vehicle_FuelType ORDER BY Fuel">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="HiddenField_Vehicle_FuelType_Id" 
                            Name="Vehicle_FuelType_Id" PropertyName="Value" />
                        <asp:ControlParameter ControlID="HiddenField_VehicleId_p10" Name="Vehicle_id" 
                            PropertyName="Value" />
                        <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                    </InsertParameters>
                </asp:SqlDataSource>

                                <br />

                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="Vehicle_id" DataSourceID="SqlDataSource_Save"
                                    CssClass="abGrid" AllowPaging="True" AllowSorting="True" PageSize="100" SkinID="dataGrid">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Vehicle No." SortExpression="Number">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Number") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <table width="98%" border="0" cellspacing="0" cellpadding="0" class="Grid_1" style="margin-bottom: 8px;">
                                                    <tr>
                                                        <th width="40%">Vehicle No.</th>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btnEdit" OnClick="LinkButton3_Click"
                                                                Text='<%# Bind("Number") %>'></asp:LinkButton>
                                                            <asp:HiddenField ID="HiddenField2" runat="server"
                                                                Value='<%# Eval("Vehicle_id") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Owner</th>
                                                        <td>
                                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Owner") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Registration Authority</th>
                                                        <td>
                                                            <asp:Label ID="Label13" runat="server"
                                                                Text='<%# Eval("Registration_Authority") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Purchased Condition</th>
                                                        <td>
                                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("Condition") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Purchase Date</th>
                                                        <td>
                                                            <asp:Label ID="Label29" runat="server" Text='<%# Eval("Purchased_Date") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Purchased Cost</th>
                                                        <td>
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("Cost") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Insurance No.</th>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("InsuranceNumber") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Insured From</th>
                                                        <td>
                                                            <asp:Label ID="Label18" runat="server" Text='<%# Eval("Insurance_FromDate") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Insured To</th>
                                                        <td>
                                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("Insurance_ToDate") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Made" SortExpression="VehicleTypeName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VehicleTypeName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <table width="98%" border="0" cellspacing="0" cellpadding="0" class="Grid_1" style="margin-bottom: 8px;">
                                                    <tr>
                                                        <th width="40%">Class</th>
                                                        <td>
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Class") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Maker</th>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Manufacturer_Name") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Type</th>
                                                        <td>
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("VehicleTypeName") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Body</th>
                                                        <td>
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("BodyType") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Colour</th>
                                                        <td>
                                                            <asp:Label ID="Label17" runat="server" Text='<%# Eval("Colour") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Model</th>
                                                        <td>
                                                            <asp:Label ID="Label16" runat="server" Text='<%# Eval("Manufacture_Year") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>UnLanded Weight</th>
                                                        <td>
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("UnLandedWeight") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Lenght</th>
                                                        <td>
                                                            <asp:Label ID="Label27" runat="server" Text='<%# Eval("Lenght") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Height</th>
                                                        <td>
                                                            <asp:Label ID="Label28" runat="server" Text='<%# Eval("Height") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Chassis No." SortExpression="ChassisNumber">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ChassisNumber") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <table width="98%" border="0" cellspacing="0" cellpadding="0" class="Grid_1" style="margin-bottom: 8px;">
                                                    <tr>
                                                        <th width="40%">Registration No.</th>
                                                        <td>
                                                            <asp:Label ID="Label30" runat="server"
                                                                Text='<%# Eval("Registration_Number") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Chassis No.</th>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ChassisNumber") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Cubic Capacity</th>
                                                        <td>
                                                            <asp:Label ID="Label21" runat="server" Text='<%# Eval("CubicCapacity") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Cylinder</th>
                                                        <td>
                                                            <asp:Label ID="Label22" runat="server" Text='<%# Eval("NoOfCylinder") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Engin No.</th>
                                                        <td>
                                                            <asp:Label ID="Label23" runat="server" Text='<%# Eval("EnginNo") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Width</th>
                                                        <td>
                                                            <asp:Label ID="Label24" runat="server" Text='<%# Eval("Width") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Seating Capacity</th>
                                                        <td>
                                                            <asp:Label ID="Label25" runat="server" Text='<%# Eval("SeatingCapcity") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Manufacture Month</th>
                                                        <td>
                                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("Manufacture_Month") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton13" runat="server" OnClick="LinkButton13_Click">Delete</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>

                        </div>

                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        $(document).ready(function () {

            $('.btnEdit').live('click', function (e) {
                $('#toTop').click();
            });
<%--            $('#<%= WebDateChooser_Insurance_FromDate.ClientID %>').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });

            $('#<%= WebDateChooser_Insurance_ToDate.ClientID %>').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });
            --%>
            <%--$('#<%= WebDateChooser_PurchasedDate.ClientID %>').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });--%>
        });
    </script>
</asp:Content>
