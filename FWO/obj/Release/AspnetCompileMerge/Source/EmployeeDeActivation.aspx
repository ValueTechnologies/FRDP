<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeDeActivation.aspx.cs" Inherits="FRDP.EmployeeDeActivation" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <style type="text/css">
        select[name=tblEmpList_length] {
            /* width: 150px; */
            width: 62px !important;
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
                                        <span>Employee Selection</span>
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
                    <asp:ListItem Value="2">District Support Unit</asp:ListItem>
                    <asp:ListItem Value="3">Basic Health Unit</asp:ListItem>
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
            <asp:DropDownList ID="ddlLocation" runat="server" Width="94%" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" ClientIDMode="Static"></asp:DropDownList>
<%--            <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListWithAll" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>--%>
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
            <%--<asp:SqlDataSource ID="SDGenerator" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT '%' AS ID, 'All' AS NAME, 0 AS ord UNION SELECT CAST(ID AS VARCHAR(10)) AS Expr1, NAME, 1 AS ord FROM tblDesig ORDER BY ord, NAME">
            </asp:SqlDataSource>--%>
            <%--<asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="NAME" DataValueField="ID"></asp:DropDownList>--%>
            <asp:DropDownList ID="ddlGenerator" runat="server"></asp:DropDownList>
        </td>
    </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Show Report" OnClick="btnShowRpt_Click" ClientIDMode="Static" /></td>
        </tr>
                                            <tr>
                                        <td>Employee</td>
                                        <td>
                                            <asp:DropDownList ID="ddlEmp" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDEmp" DataTextField="Full_Name" DataValueField="User_ID" OnDataBound="ddlEmp_DataBound" OnSelectedIndexChanged="ddlEmp_SelectedIndexChanged" ClientIDMode="Static"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SDEmp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        TblHResources.User_ID, TblHResources.Full_Name
FROM            TblHResources INNER JOIN
                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID
WHERE     (TblHResources.U_Status =1) and    (TblHResources.CompanyID = @CompanyID) and (TblHResources.DesignationID=@DesignationID)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="ddlGenerator" Name="DesignationID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Emp Details" OnClick="btnShowRpt_Click" /></td>
                                    </tr>
    </tbody>
</table><br />
</div>

                            </div>

                        </div>
    </div>
<%--            <div class="row-fluid">
                <div class="span12">

                    <div class="box gradient">

                        <div class="title">

                            <h4>
                                <span class="icon16 icomoon-icon-equalizer-2"></span>
                                <span>Employee Selection</span>
                            </h4>
                            <a href="#" class="minimize">Minimize</a>
                        </div>
                        <div class="content noPad">
                            <br />


                            <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                                <tbody>
                                    <tr>
                                        <td style="width: 100px;">Location</td>
                                        <td style="text-align: left; width: 40%;">
                                            <asp:DropDownList ID="ddlLocation" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" ClientIDMode="Static"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListByEmp" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:CookieParameter CookieName="Emp_Id" Name="User_ID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td style="width: 100px;">Designation</td>
                                        <td style="text-align: left;">
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
                                            <asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="Modal" DataValueField="ID" AutoPostBack="True" ClientIDMode="Static"></asp:DropDownList></td>
                                    </tr>

                                    <tr>
                                        <td>Employee</td>
                                        <td>
                                            <asp:DropDownList ID="ddlEmp" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDEmp" DataTextField="Full_Name" DataValueField="User_ID" OnDataBound="ddlEmp_DataBound" OnSelectedIndexChanged="ddlEmp_SelectedIndexChanged" ClientIDMode="Static"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SDEmp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        TblHResources.User_ID, TblHResources.Full_Name
FROM            TblHResources INNER JOIN
                         tbl_Company ON TblHResources.CompanyID = tbl_Company.CompanyID
WHERE     (TblHResources.U_Status =1) and    (TblHResources.CompanyID = @CompanyID) and (TblHResources.DesignationID=@DesignationID)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlLocation" Name="CompanyID" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="ddlGenerator" Name="DesignationID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Emp Details" OnClick="btnShowRpt_Click" /></td>
                                    </tr>
                                </tbody>
                            </table>


                            <br />
                        </div>

                    </div>

                </div>
            </div>--%>

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
                        <div class="content noPad" style="padding: 5px;">

                            <asp:Label ID="lblEmp" runat="server"></asp:Label>
                            &nbsp;<br />
                            <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                                <tbody>
                                    <tr>
                                        <td style="width: 100px;">Date</td>
                                        <td style="text-align: left; width: 40%;">
                                            <input id="txtdt" class="clsd" type="text" style="width: 90%;" /></td>
                                        <td style="width: 100px;">Type</td>
                                        <td style="text-align: left;">
                                            <select id="ddlType" class="clsd" style="width: 93.5%;">
                                                <option>Fired</option>
                                                <option>Resigned</option>
                                                <option>Other</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Reason</td>
                                        <td colspan="3">
                                            <textarea id="txtReason" class="clsd" cols="20" rows="2" style="width: 95.6%;"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="4" style="text-align: right;">
                                            <button id="btnDeactivate" class="btn btn-danger" style="margin-right: 3%;">Deactivate</button>
                                        </td>
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
                                <span>Deactivated Employee List</span>
                            </h4>
                            <a href="#" class="minimize">Minimize</a>
                        </div>
                        <div class="content noPad">
                            <br />
                                                <table id="tblEmpList" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Type</th>
                                <th>Reason</th>
                                <th>Employee No</th>
                                <th>Name</th>
                                <th>CNIC</th>
                                <th>Cell#</th>
                                <th>Service Area</th>
                                <th>Designation</th>
                                <th style="width: 52px;"></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table><br /><br /><br />
                           <%-- <table class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                                <thead>
                                    <tr>
                                        <th style="width: 30px;">#</th>
                                        <th>Item</th>
                                        <th>Quality</th>
                                        <th style="width: 100px;">Quantity</th>
                                        <th style="width: 60px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>
                                            <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                            <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>
                                            <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                            <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                        </td>
                                    </tr>

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="3" style="text-align: center; font-weight: bold;">Total</td>
                                        <td style="text-align: center; font-weight: bold;">@twitter</td>
                                        <td></td>
                                    </tr>
                                </tfoot>
                            </table>--%>
                        </div>

                    </div>

                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(function () {
                        $('#txtdt').datepicker({
                            changeMonth: true,
                            changeYear: true,
                            showButtonPanel: false,
                            dateFormat: 'dd/mm/yy'
                        }).datepicker("setDate", "<%= Convert.ToString(DateTime.Now.Day) +"/"+ Convert.ToString(DateTime.Now.Month) +"/"+Convert.ToString(DateTime.Now.Year) %>");
                    });
                    $('#btnDeactivate').live('click', function (e) {
                        e.preventDefault();
                        var dta = "";
                       dta= $('#tblEmpDetail').attr('empid') + "ǁ"
                        $('.clsd').each(function (i, j) {
                            dta += $(this).val() + "ǁ";

                        });

                        $.ajax({
                            type: "POST",
                            url: "EmpReg.ashx/?ID=43ǁ" + dta,
                            success: function (response) {
                                LoadDeactivatedList(response)
                            }
                        });

                    });

                    $(function () {
                        $.ajax({
                            type: "POST",
                            url: "EmpReg.ashx/?ID=44ǁ",
                            success: function (response) {
                                LoadDeactivatedList(response);
                            }
                        });
                    })

                    var _$_c506 = ["parseJSON", "", "<tr tg=\"", "tblEmpDeactivateID", "\">\r<td>", "DeactivationDate", "</td>\r<td>", "strType", "Reason", "</td>\r                                    <td>", "EmpNo", "Full_Name", "CNIC", "ContactNos", "Area", "Designations", "</td>\r<td><button tg=\"", "User_ID", "\" title=\"Edit\" class=\"btnEdit btn btn-danger\">x</button></td>\r</tr>", "each", "dataTable", "hasClass", "#tblEmpList", "fnDestroy", "html", "#tblEmpList tbody", "dynamicTable", "addClass", "All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", ".dynamicTable"]; function LoadDeactivatedList(c) { var a = $[_$_c506[0]](c), b = _$_c506[1]; $[_$_c506[19]](a, function (d, e) { b += _$_c506[2] + e[_$_c506[3]] + _$_c506[4] + e[_$_c506[5]] + _$_c506[6] + e[_$_c506[7]] + _$_c506[6] + e[_$_c506[8]] + _$_c506[9] + e[_$_c506[10]] + _$_c506[9] + e[_$_c506[11]] + _$_c506[9] + e[_$_c506[12]] + _$_c506[6] + e[_$_c506[13]] + _$_c506[6] + e[_$_c506[14]] + _$_c506[6] + e[_$_c506[15]] + _$_c506[16] + e[_$_c506[17]] + _$_c506[18] }); if ($(_$_c506[22])[_$_c506[21]](_$_c506[20])) { $(_$_c506[22])[_$_c506[20]]()[_$_c506[23]]() }; $(_$_c506[25])[_$_c506[24]](b); $(_$_c506[22])[_$_c506[27]](_$_c506[26]); $(_$_c506[34])[_$_c506[20]]({ "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, _$_c506[28]]], "iDisplayLength": 10, "sPaginationType": _$_c506[29], "bJQueryUI": false, "bAutoWidth": false, "bLengthChange": true, "fnInitComplete": function (g, f) { $(_$_c506[33])[_$_c506[32]](_$_c506[30], _$_c506[31]) } }); }

                    $('.btnEdit').live('click', function (e) {
                        e.preventDefault();
                        $.ajax({
                            type: "POST",
                            url: "EmpReg.ashx/?ID=45ǁ" + $(this).attr('tg'),
                            success: function (response) {
                                LoadDeactivatedList(response);
                            }
                        });
                    });
                });//END OF READY
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
