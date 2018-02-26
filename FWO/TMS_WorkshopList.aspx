<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_WorkshopList.aspx.cs" Inherits="FRDP.TMS_WorkshopList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    .abGrid {
        width: 97%; margin-left: 20px;
    }
    .abGrid tbody tr td input[type="text"] {
    width: 75px;
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
                                        <span>Workshop Registration</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
            <tr>
                <td  align="right" width="180px;" >
                    Workshop Name :</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <asp:Label ID="Label87" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
              <td align="right" >Manager Name :</td>
              <td><asp:DropDownList ID="DropDownList4" runat="server" Width="50px">
                <asp:ListItem Selected="True">Mr.</asp:ListItem>
                <asp:ListItem>Mrs.</asp:ListItem>
                <asp:ListItem>Miss</asp:ListItem>
              </asp:DropDownList>
              <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" >
                    Phone No. :</td>
              <td>
                <asp:TextBox ID="TextBox8" runat="server" Width="100px"></asp:TextBox>
                    <asp:TextBox ID="TextBox9" runat="server" Width="100px"></asp:TextBox>
<span class="dim">(if any)</span> 
<asp:TextBox ID="TextBox10" runat="server" Width="100px"></asp:TextBox>
<span class="dim">(if any)</span> </td>
            </tr>
            <tr>
                <td align="right" >
                    Fax :</td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align:top;" >
                    Description :</td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server" Height="65px" TextMode="MultiLine" 
                        Width="90%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right"  style="vertical-align:top;" >
                    Address :</td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server" Height="65px" TextMode="MultiLine" 
                        Width="90%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    </td>
                <td>
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-info" onclick="Button3_Click" Text="Save" />                    
                    <asp:SqlDataSource ID="SqlDataSource_Workshop" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="INSERT INTO Workshop(Workshop_Name, Workshop_Phone1, Workshop_Phone2, Workshop_Phone3, Workshop_Fax, Workshop_Description, Workshop_Address, Emp_Id, Manager_Prifix, Manager_Name) VALUES (@Workshop_Name, @Workshop_Phone1, @Workshop_Phone2, @Workshop_Phone3, @Workshop_Fax, @Workshop_Description, @Workshop_Address, @Emp_Id, @Manager_Prifix, @Manager_Name)" 
                        SelectCommand="SELECT Workshop_Id, Workshop_Name, Workshop_Phone1, Workshop_Phone2, Workshop_Phone3, Workshop_Fax, Workshop_Description, Workshop_Address, Is_Deactivated, ISNULL(Manager_Prifix, '') + ' ' + ISNULL(Manager_Name, '') AS Manager_NameDisplay, Manager_Prifix, Manager_Name FROM Workshop ORDER BY Workshop_Name" 
                        
                        UpdateCommand="UPDATE Workshop SET Workshop_Name = @Workshop_Name, Workshop_Phone1 = @Workshop_Phone1, Workshop_Phone2 = @Workshop_Phone2, Workshop_Phone3 = @Workshop_Phone3, Workshop_Fax = @Workshop_Fax, Workshop_Description = @Workshop_Description, Workshop_Address = @Workshop_Address, Is_Deactivated = @Is_Deactivated, Manager_Prifix = @Manager_Prifix, Manager_Name = @Manager_Name WHERE (Workshop_Id = @Workshop_Id)">
                        <UpdateParameters>
                            <asp:Parameter Name="Workshop_Name" />
                            <asp:Parameter Name="Workshop_Phone1" />
                            <asp:Parameter Name="Workshop_Phone2" />
                            <asp:Parameter Name="Workshop_Phone3" />
                            <asp:Parameter Name="Workshop_Fax" />
                            <asp:Parameter Name="Workshop_Description" />
                            <asp:Parameter Name="Workshop_Address" />
                            <asp:Parameter Name="Is_Deactivated" />
                            <asp:Parameter Name="Workshop_Id" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBox7" Name="Workshop_Name" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox8" Name="Workshop_Phone1" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox9" Name="Workshop_Phone2" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox10" Name="Workshop_Phone3" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox11" Name="Workshop_Fax" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox12" Name="Workshop_Description" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox13" Name="Workshop_Address" 
                                PropertyName="Text" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                            <asp:ControlParameter ControlID="DropDownList4" Name="Manager_Prifix" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TextBox15" Name="Manager_Name" 
                                PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
           </table>
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
                                        <span>Registered Worksops</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
           <br />

                    <asp:GridView ID="GridView4" CssClass="abGrid" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Workshop_Id" DataSourceID="SqlDataSource_Workshop" 
                        Width="96%">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Workshop_Name" HeaderText="Workshop Name" 
                                SortExpression="Workshop_Name" />
                            <asp:TemplateField HeaderText="Manager Name" 
                                SortExpression="Manager_NameDisplay">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList04" runat="server" Width="50px" 
                                        SelectedValue='<%# Bind("Manager_Prifix") %>'>
                                        <asp:ListItem>Mr.</asp:ListItem>
                                        <asp:ListItem>Mrs.</asp:ListItem>
                                        <asp:ListItem>Miss</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Manager_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Manager_NameDisplay") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Workshop_Phone1" HeaderText="Phone No." 
                                SortExpression="Workshop_Phone1" />
                            <asp:BoundField DataField="Workshop_Phone2" HeaderText="Phone No." 
                                SortExpression="Workshop_Phone2" />
                            <asp:BoundField DataField="Workshop_Phone3" HeaderText="Phone No" 
                                SortExpression="Workshop_Phone3" />
                            <asp:BoundField DataField="Workshop_Fax" HeaderText="Fax No" 
                                SortExpression="Workshop_Fax" />
                            <asp:BoundField DataField="Workshop_Address" HeaderText="Address" 
                                SortExpression="Workshop_Address" />
                            <asp:BoundField DataField="Workshop_Description" HeaderText="Description" 
                                SortExpression="Workshop_Description" />
                            <asp:CheckBoxField DataField="Is_Deactivated" HeaderText="Is Deactivated" 
                                SortExpression="Is_Deactivated" />
                        </Columns><RowStyle CssClass="GridItem" />
<AlternatingRowStyle CssClass="GridAltItem" />
<PagerStyle CssClass="GridPager" />
<EditRowStyle CssClass="gridedit" />
 
                    </asp:GridView>
                

        <br />
</div>

                            </div>

                        </div>
    </div>
            </ContentTemplate></asp:UpdatePanel>
</asp:Content>
