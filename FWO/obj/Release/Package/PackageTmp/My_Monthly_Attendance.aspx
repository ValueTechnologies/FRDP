<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="My_Monthly_Attendance.aspx.cs" Inherits="FRDP.My_Monthly_Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Attendance Search</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
  <table  cellspacing="0" cellpadding="0" border="0" class="tbl_form" width="100%">
            <tr>
                <td align="right"  width="35%" >
                    Select Month :</td>
                <td>
                <asp:DropDownList ID="DropDownList_Month" runat="server" Width="202px">
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">Jun</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
              </td>
      </tr>
            <tr>
                <td align="right"  >
                    Select Year :
                </td>
                <td>
                <asp:DropDownList ID="DropDownList_year" runat="server" Width="202px">
              </asp:DropDownList></td>
      </tr>
            <tr>
                <td  >&nbsp;
              </td>
                <td>
                    <asp:Button ID="Button_Search" CssClass="btn btn-info" runat="server" Text="Search" OnClick="Button_Search_Click" />
                </td>
            </tr>
    </table>

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
                                        <span>Attendance Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad" style="padding:5px;"> 
                                    
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
</asp:Content>
