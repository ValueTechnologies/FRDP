<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="Monthly_Attendance.aspx.cs" Inherits="FRDP.Monthly_Attendance" %>
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
                                        <span>Employee Attendance</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <br />

                          
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
         <tr>
            <td>Month</td>
            <td>
                <asp:DropDownList ID="DropDownList_Month" runat="server"  Width="94%">
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList></td>
            <td>Year</td>
            <td>
                <asp:DropDownList ID="DropDownList_year" runat="server" Width="94%">
                    <asp:ListItem Selected="True">2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
                <tr>
            <td>Office Type</td>
            <td>
                <asp:DropDownList ID="ddlOfficeTypes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOfficeTypes_SelectedIndexChanged" Width="94%">
                    <asp:ListItem Value="1">Head Office</asp:ListItem>
                    <asp:ListItem Value="2">Co-Ordinatiton Office</asp:ListItem>
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
            <asp:DropDownList ID="ddlLocation" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" OnDataBound="ddlLocation_DataBound"></asp:DropDownList>
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
FROM            tblEmployee
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
            <asp:SqlDataSource ID="SDEmp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        tblEmployee.EmpID User_ID, ISNULL(tblEmployee.FName,'')+' ' +  ISNULL(tblEmployee.LName,'') Full_Name
FROM            tblEmployee INNER JOIN
                         tbl_Company ON tblEmployee.tblCompanyID = tbl_Company.CompanyID
WHERE        (tblEmployee.tblCompanyID = @CompanyID) and (tblEmployee.tblDesigID=@DesignationID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" DefaultValue="0" />
                    <asp:ControlParameter ControlID="ddlGenerator" Name="DesignationID" PropertyName="SelectedValue" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource></td>
            <td></td>
            <td><asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Attendance" OnClick="btnShowRpt_Click" /></td>
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
                                        <span id="btnprtP" class="icon16 icomoon-icon-printer-2" title="Click To Print"></span>
                                        <span>Attendance Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div id="PrintArea"  class="content noPad" style="padding:5px;"> 
                                    
                                                        <table style="width:99%;margin-top: 10px;">
                                                    <tr>
                                <td style="width: 25px"></td>
                                <td>
                                    <asp:DetailsView ID="dvCompany" runat="server" AutoGenerateRows="False" BorderStyle="None" DataSourceID="dsComp" GridLines="None" Height="50px" Width="98%">
                                        <Fields>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <div>
                                                        <div id="CompID" style="float: left; text-align: center; width: 90px; height: 80px;">
                                                            <img alt='<%# Eval("InstName") %>' src="<%# Eval("Logo")%>" style="width: auto; height: auto; max-height: 100%; max-width: 100%;" />
                                                        </div>
                                                        <div style="float: left; width: 65%;margin-top: 10px;">
                                                            <b style="font-size: large;"><%# Eval("InstName") %></b>
                                                            <br />
                                                            <%# Eval("Addressline") %>
                                                            <br />
                                                            <%# Eval("Phs") %>
                                                        </div>
                                                        <br />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                </td>
                                <td style="vertical-align: top">

                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">
                                    <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                                    Employee Monthly Attendance</td>
                            </tr>
                    </table>
                    <hr />
                                    <asp:Label ID="lblEmp" runat="server"></asp:Label>
 <fieldset style="margin-top:5px;">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False"  Width="20%" style="width:20%;border-collapse:collapse;margin-left: 3px;" >
<Columns>
<asp:BoundField DataField="Shift" HeaderText="Shift" SortExpression="Shift" />
<asp:BoundField DataField="TotalAttendance" HeaderText="TotalAttendance" SortExpression="TotalAttendance" />
</Columns>
    <AlternatingRowStyle CssClass="GridAltItem" />
</asp:GridView>
</fieldset>   
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  Width="100%" OnPreRender="GridView2_PreRender" CssClass="abGrid">
<Columns>
    <asp:TemplateField>
             <ItemTemplate>
                 <%# Container.DataItemIndex + 1 %>   
         </ItemTemplate>
    </asp:TemplateField>
<asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
<asp:BoundField DataField="Shift" HeaderText="Shift" SortExpression="Shift" />
<asp:BoundField DataField="TimeIN" HeaderText="TimeIn" SortExpression="TimeIN" />
<asp:BoundField DataField="TimeOut" HeaderText="TimeOut" SortExpression="TimeOut" />
<asp:BoundField DataField="TotalWorkingHour" HeaderText="Total Working Hour" SortExpression="TotalWorkingHour" />
    <asp:BoundField DataField="AdminRemarks" HeaderText="Admin Remarks" 
        SortExpression="AdminRemarks" />
    <asp:BoundField DataField="Holiday_Name" HeaderText="Holiday Record" 
        SortExpression="Holiday_Name" />
    <asp:BoundField DataField="Leave_Name" HeaderText="Leave Record" 
        SortExpression="Leave_Name" />
</Columns>
    <AlternatingRowStyle CssClass="GridAltItem" />
</asp:GridView>
    <br />
<asp:GridView ID="GridViewYearlyAttendance" runat="server" AutoGenerateColumns="False" ShowHeader="False"  Width="100%"> 
    <AlternatingRowStyle CssClass="GridAltItem" />
</asp:GridView>
<br />
</div>

                            </div>

                        </div>
    </div>
                                            </ContentTemplate>
                                    </asp:UpdatePanel>

    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {
            $('#btnprtP').click(function () {
                //$('#tblAnimals_length').hide();
                //$('#tblAnimals_filter').hide();
                //$('#tblAnimals_paginate').hide();
                //$('.NoPrnt').hide();
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = { mode: mode, popClose: close };
                $("#PrintArea").printArea(options);
                $('.NoPrnt').show();
                //$('#tblAnimals_length').show();
                //$('#tblAnimals_filter').show();
                //$('#tblAnimals_paginate').show();
            });
        });///END OF READY 
    </script>
</asp:Content>
