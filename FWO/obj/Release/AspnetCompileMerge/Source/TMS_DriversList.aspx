<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="TMS_DriversList.aspx.cs" Inherits="FRDP.TMS_DriversList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
    .abGrid {
        width: 97%; margin-left: 20px;
    }
      .abGrid tbody tr td input[type="text"] {
    width: 180px;
}
</style>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Panel ID="Panel9" runat="server" Width="100%">
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Driver Selection</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
    <div   class="bxmain">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
            <tr>
                <td align="right" width="40%" >
                    Select Driver :</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource_Driver" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        InsertCommand="INSERT INTO Driver(Driver_Emp_Id, Contact1, Contact2, Contact3, LicenseNo, Emp_Id) VALUES (@Driver_Emp_Id, @Contact1, @Contact2, @Contact3, @LicenseNo, @Emp_Id)" 
                        
                        
                        SelectCommand="SELECT tblEmployee.EmpID, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') + ' ( ' + tblDesig.NAME + ' )' AS Emp_Name FROM tblEmployee INNER JOIN tblDesig ON tblEmployee.tblDesigID = tblDesig.ID WHERE (tblEmployee.Status = 1) AND (tblEmployee.EmpID NOT IN (SELECT Driver_Emp_Id AS EmpID FROM Driver)) AND (tblDesig.NAME = 'Driver') ORDER BY Emp_Name">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="DropDownList_Drivers" Name="Driver_Emp_Id" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TextBox_MobNo" Name="Contact1" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxCont2" Name="Contact2" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxCont3" Name="Contact3" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxLicence" Name="LicenseNo" 
                                PropertyName="Text" />
                            <asp:SessionParameter Name="Emp_Id" SessionField="Emp_Id" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList_Drivers" runat="server" 
                        DataSourceID="SqlDataSource_Driver" DataTextField="Emp_Name" 
                        DataValueField="EmpID" Width="400px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" >
                    Mobile No. :</td>
                <td>
                  <asp:TextBox ID="TextBox_MobNo" runat="server"></asp:TextBox>
                    <asp:Label ID="Label88" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" >
                    Other Contact :</td>
                <td>
                  <asp:TextBox ID="TextBoxCont2" runat="server"></asp:TextBox>
                     <span class="dim">( if any)</span></td>
            </tr>
            <tr>
                <td align="right" >
                    Other Contact :</td>
                <td>
                  <asp:TextBox ID="TextBoxCont3" runat="server"></asp:TextBox>
                    <span class="dim">( if any )</span></td>
            </tr>
            <tr>
                <td align="right" >
                    Driving License No. :</td>
                <td>
                  <asp:TextBox ID="TextBoxLicence" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" >
                    </td>
                <td>
                  <asp:Button ID="ButtonDriverList" CssClass="btn btn-info" runat="server" 
                        onclick="ButtonDriverList_Click" Text="Save" />
                </td>
            </tr>
            </table>
            </div>
            <br />

                    <asp:GridView ID="GridViewDriverList" CssClass="abGrid" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Driver_Id" DataSourceID="SqlDataSource_ForGrid">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Emp_Name" HeaderText="Driver Name" ReadOnly="True" 
                                SortExpression="Emp_Name" />
                            <asp:BoundField DataField="LicenseNo" HeaderText="LicenseNo" 
                                SortExpression="LicenseNo" />
                            <asp:BoundField DataField="Contact1" HeaderText="Mobile No." 
                                SortExpression="Contact1" />
                            <asp:BoundField DataField="Contact2" HeaderText="Other Contact" 
                                SortExpression="Contact2" />
                            <asp:BoundField DataField="Contact3" HeaderText="Other Contact" 
                                SortExpression="Contact3" />
                        </Columns><RowStyle CssClass="GridItem" />
<AlternatingRowStyle CssClass="GridAltItem" />
<PagerStyle CssClass="GridPager" /><EditRowStyle CssClass="gridedit" />
                    </asp:GridView><br /><br />
                    <asp:SqlDataSource ID="SqlDataSource_ForGrid" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" 
                        SelectCommand="SELECT        Driver.Contact1, Driver.Driver_Id, Driver.Contact2, Driver.Contact3, Driver.LicenseNo, ISNULL(tblEmployee.FName, '') + ' ' + ISNULL(tblEmployee.LName, '') AS Emp_Name
FROM            Driver INNER JOIN
                         tblEmployee ON Driver.Driver_Emp_Id = tblEmployee.EmpID
ORDER BY Emp_Name" 
                        
                        UpdateCommand="UPDATE Driver SET Contact1 = @Contact1, Contact2 = @Contact2, Contact3 = @Contact3, LicenseNo = @LicenseNo WHERE (Driver_Id = @Driver_Id)">
                        <UpdateParameters>
                            <asp:Parameter Name="Contact1" />
                            <asp:Parameter Name="Contact2" />
                            <asp:Parameter Name="Contact3" />
                            <asp:Parameter Name="LicenseNo" />
                            <asp:Parameter Name="Driver_Id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
               </div>

                            </div>

                        </div>
    </div>
    </asp:Panel>
            </ContentTemplate></asp:UpdatePanel>
</asp:Content>
