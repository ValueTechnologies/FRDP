<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_VehicleAllocationCategories.aspx.cs" Inherits="FRDP.TMS_VehicleAllocationCategories" %>

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
                        <span>Vehicle Allocation Categories Registration</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
   <br />
                            <div class="bxmain">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
            <tr>
                <td align="right" width="180px">
                    Vehicle Allocation Type :</td>
                <td>
                  <asp:TextBox ID="TextBox_VAllocation_Type" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource_Fuel_System" DataTextField="Name" 
                        DataValueField="Fule_System_Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_Fuel_System" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        SelectCommand="SELECT [Fule_System_Id], [Name] FROM [Fule_System]">
                    </asp:SqlDataSource>
                    <asp:Label ID="Label85" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
                    <tr>
                        <td align="right">
                            Description :</td>
                        <td>
                          <asp:TextBox ID="TextBox_VAllocation_Description" runat="server"></asp:TextBox>
                            <asp:CheckBox ID="P6_CheckBox_Is_Pool" CssClass="checkbox"  runat="server" Text="Pool Category" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
                            <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" onclick="Button1_Click1" Text="Save" />
                        </td>
                    </tr>
             </table> </div>
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
                        <span>Vehicle Allocation Categories List</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                                 <br />
                    <asp:GridView ID="GridView_VAllocationType" CssClass="abGrid" runat="server" Width="96%"
                        AutoGenerateColumns="False" DataKeyNames="Vehicle_Alocation_Type_Id" 
                        DataSourceID="SqlDataSource_VAllocationType">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Vehicle_Alocation_Type" 
                                HeaderText="Vehicle Allocation Type" SortExpression="Vehicle_Alocation_Type" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" />
                            <asp:TemplateField HeaderText="Fuel System" SortExpression="Fuel_System">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList51" runat="server" AutoPostBack="True" 
                                        Enabled="False" SelectedValue='<%# Bind("Fuel_System") %>'>
                                        <asp:ListItem Value="1">PSO CARD</asp:ListItem>
                                        <asp:ListItem Value="2">Slip System</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList50" runat="server" AutoPostBack="True" 
                                        SelectedValue='<%# Bind("Fuel_System") %>'>
                                        <asp:ListItem Value="1">PSO CARD</asp:ListItem>
                                        <asp:ListItem Value="2">Slip System</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="Is_Deactivated" HeaderText="Deactivated" 
                                SortExpression="Is_Deactivated" />
                            <asp:CheckBoxField DataField="Is_Pool" HeaderText="Pool" 
                                SortExpression="Is_Pool" />
                        </Columns><EditRowStyle CssClass="gridedit" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_VAllocationType" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="INSERT INTO Vehicle_Alocation_Type(Vehicle_Alocation_Type, Description, Fuel_System, Emp_Id, Is_Pool) VALUES (@Vehicle_Alocation_Type, @Description, @Fuel_System, @Emp_Id, @Is_Pool)" 
                        SelectCommand="SELECT Vehicle_Alocation_Type, Description, Is_Deactivated, Vehicle_Alocation_Type_Id, Fuel_System, Is_Pool FROM Vehicle_Alocation_Type" 
                        
                        
                        UpdateCommand="UPDATE Vehicle_Alocation_Type SET Vehicle_Alocation_Type = @Vehicle_Alocation_Type, Is_Deactivated = @Is_Deactivated, Description = @Description, Fuel_System = @Fuel_System, Is_Pool = @Is_Pool WHERE (Vehicle_Alocation_Type_Id = @Vehicle_Alocation_Type_Id)">
                        <UpdateParameters>
                            <asp:Parameter Name="Vehicle_Alocation_Type" />
                            <asp:Parameter Name="Is_Deactivated" />
                            <asp:Parameter Name="Description" />
                            <asp:Parameter Name="Fuel_System" />
                            <asp:Parameter Name="Is_Pool" />
                            <asp:Parameter Name="Vehicle_Alocation_Type_Id" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBox_VAllocation_Type" 
                                Name="Vehicle_Alocation_Type" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox_VAllocation_Description" 
                                Name="Description" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DropDownList5" Name="Fuel_System" 
                                PropertyName="SelectedValue" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                            <asp:ControlParameter ControlID="P6_CheckBox_Is_Pool" Name="Is_Pool" 
                                PropertyName="Checked" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                
        
        <br />
                </div>

            </div>

        </div>
    </div>
            </ContentTemplate></asp:UpdatePanel>
</asp:Content>
