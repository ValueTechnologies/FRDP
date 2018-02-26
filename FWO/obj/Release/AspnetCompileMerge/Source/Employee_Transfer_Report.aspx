<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="Employee_Transfer_Report.aspx.cs" Inherits="FRDP.Employee_Transfer_Report" %>
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
                                        <span>Employee Transfers</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <br />

                          
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
    <tr>
        <td style="width:100px;">Location</td>
        <td style="text-align:left; width: 40%;">
            <asp:DropDownList ID="ddlLocation" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListByEmp" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:CookieParameter CookieName="Emp_Id" Name="User_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width:100px;">Designation</td>
        <td style="text-align:left;">
            <asp:SqlDataSource ID="SDGenerator" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT ID, NAME AS Modal FROM tblDesig 


where ID IN (


SELECT        DesignationID
FROM            TblHResources
WHERE        (CompanyID = @CompanyID)




) ORDER BY Modal">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="Modal" DataValueField="ID" AutoPostBack="True"></asp:DropDownList></td>
    </tr>
       
        <tr>
            <td>Employee</td>
            <td><asp:DropDownList ID="ddlEmp" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDEmp" DataTextField="Full_Name" DataValueField="User_ID" OnDataBound="ddlEmp_DataBound" OnSelectedIndexChanged="ddlEmp_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource ID="SDEmp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        TblHResources.User_ID, TblHResources.Full_Name
FROM            TblHResources INNER JOIN
                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID
WHERE       (TblHResources.U_Status = 1) and  (TblHResources.CompanyID = @CompanyID) and (TblHResources.DesignationID=@DesignationID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlGenerator" Name="DesignationID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource></td>
            <td></td>
            <td><asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Transfer History" OnClick="btnShowRpt_Click" ClientIDMode="Static" /></td>
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
                                        <span>Transfer Details</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad" style="padding:5px;"> 
                                    
                                    <asp:Label ID="lblEmp" runat="server"></asp:Label>
    <br />
<table id="tblTransferHistory" class="responsive table table-striped table-bordered table-condensed" style="  width: 96%;  margin-left: 20px;  margin-right: 20px;  border-right: 1px solid #c4c4c4;">
                                <thead>
                                  <tr>
                                    <th>Date</th>
                                    <th>&nbsp;</th>
                                      <th>Location</th>
                                      <th>Department</th>
                                      <th>Designation</th>
                                      <th>Group</th>
                                      <th>Salary</th>
                                      <th>Shift</th>
                                  </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
<br />
</div>

                            </div>

                        </div>
    </div>
                                            </ContentTemplate>
                                    </asp:UpdatePanel>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#<%= btnShowRpt.ClientID %>').live('click', function (e) { e.preventDefault(); tblTransferHistoryLoad(); });
            tblTransferHistoryLoad();
            function tblTransferHistoryLoad() {


                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=28ǁ" + $('#<%= ddlEmp.ClientID %>').find("option:selected").val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr>\
                                    <td rowspan="2" style="border-bottom: 1px solid #c4c4c4;">' + itm.TDT + '</td>\
                                     <td><strong>Before</strong></td>\
                                      <td>'+ itm.CompanyNameA + '</td>\
                                      <td>' + itm.DeptNameA + '</td>\
                                      <td>' + itm.DesigA + '</td>\
                                      <td>' + itm.GroupA + '</td>\
                                      <td>' + itm.SalaryA + '</td>\
                                      <td> ' + itm.ShiftA + ' </td>\
                                  </tr>\
                                  <tr>\
                                    <td style="text-align:center;"><strong>After</strong></td>\
                                      <td>' + itm.CompanyNameB + '</td>\
                                      <td>' + itm.DeptNameB + '</td>\
                                      <td>' + itm.DesigB + '</td>\
                                      <td>' + itm.GroupB + '</td>\
                                      <td>' + itm.SalaryB + '</td>\
                                      <td>' + itm.ShiftB + '</td>\
                                  </tr>';
                        });
                        $('#tblTransferHistory tbody').html(opt);
                    }
                });

            }
        });
    </script>
</asp:Content>
