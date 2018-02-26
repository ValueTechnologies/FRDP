<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeCard.aspx.cs" Inherits="FRDP.EmployeeCard" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
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
                                        <span>Employee Card</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <br />

                          
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
        <tr>
            <td>Office Type</td>
            <td>
                <asp:DropDownList ID="ddlOfficeTypes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOfficeTypes_SelectedIndexChanged" Width="94%">
                    <asp:ListItem Value="1">Head Office</asp:ListItem>
                    <asp:ListItem Value="2">Co-Ordination Office</asp:ListItem>
                    <asp:ListItem Value="3">Field Office</asp:ListItem>
                    <asp:ListItem Value="6">School</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lblDsu" runat="server" Text="DSU" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDSU" runat="server" AutoPostBack="True" DataSourceID="sdDSU" DataTextField="CompanyName" DataValueField="CompanyID" Visible="False" Width="94%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdDSU" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT [CompanyID], [CompanyName] FROM [tbl_Company] WHERE ([lvl] = @lvl) ORDER BY [CompanyName]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="lvl" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    <tr>
        <td style="width:100px;">Office</td>
        <td style="text-align:left; width: 40%;">
            <asp:DropDownList ID="ddlLocation" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" OnDataBound="ddlLocation_DataBound"></asp:DropDownList>
            <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListByEmpPPHI" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:CookieParameter CookieName="Emp_Id" Name="User_ID" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlOfficeTypes" DefaultValue="1" Name="lvl" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlDSU" DefaultValue="0" Name="ParentId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width:100px;">Designation</td>
        <td style="text-align:left;">
            <asp:SqlDataSource ID="SDGenerator" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT ID, NAME AS Modal FROM tblDesig 


where ID IN (


SELECT        tblDesigID
FROM            TblEmployee
WHERE        (tblCompanyID = @CompanyID)




) ORDER BY Modal">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="Modal" DataValueField="ID" AutoPostBack="True" OnDataBound="ddlGenerator_DataBound"></asp:DropDownList></td>
    </tr>
       
        <tr>
            <td>Employee</td>
            <td><asp:DropDownList ID="ddlEmp" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDEmp" DataTextField="Full_Name" DataValueField="User_ID" OnDataBound="ddlEmp_DataBound" OnSelectedIndexChanged="ddlEmp_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource ID="SDEmp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        tblemployee.EmpID AS User_Id, CONCAT(tblemployee.FName, ' ', tblEmployee.LName) AS Full_Name
FROM            tblemployee INNER JOIN
                         tbl_Company ON tblemployee.tblCompanyID = tbl_Company.CompanyID
WHERE      (tblemployee.tblCompanyID = @CompanyID) and (tblemployee.tblDesigID=@DesignationID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" DefaultValue="0" />
                    <asp:ControlParameter ControlID="ddlGenerator" Name="DesignationID" PropertyName="SelectedValue" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource></td>
            <td></td>
            <td><asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Employee Card" OnClick="btnShowRpt_Click" /></td>
        </tr>
    </tbody>
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
                                        <span>Employee Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad" style="padding:5px;"> 
                                    
                                    <asp:Label ID="lblEmp" runat="server"></asp:Label>
 &nbsp;<br />
                                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
                                    </rsweb:ReportViewer>
<br />
</div>
                                
                            </div>

                        </div>
    </div>
                                            </ContentTemplate>
                                    </asp:UpdatePanel>
</asp:Content>
