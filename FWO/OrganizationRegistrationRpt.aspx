<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="OrganizationRegistrationRpt.aspx.cs" Inherits="FRDP.OrganizationRegistrationRpt" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
                                    .button {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  -webkit-border-radius: 7;
  -moz-border-radius: 7;
  border-radius: 7px;
  font-family: Arial;
  color: #ffffff;
  font-size: 14px;
  padding: 0px 5px 0px 5px;
  text-decoration: none;
}

.button:hover {
  background: #2780b8;
  background-image: -webkit-linear-gradient(top, #2780b8, #3498db);
  background-image: -moz-linear-gradient(top, #2780b8, #3498db);
  background-image: -ms-linear-gradient(top, #2780b8, #3498db);
  background-image: -o-linear-gradient(top, #2780b8, #3498db);
  background-image: linear-gradient(to bottom, #2780b8, #3498db);
  text-decoration: none;
}
                                </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    

    <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Search Organizational Structure</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">

                                <div class="form-row row-fluid">
                                    <div class="span6">
                                        <label class="form-label span3" for="normal">Department</label>
                                        
                                        <div class="span9" style="margin-left:0px;">
                                            <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Depart" DataValueField="DeptID" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="Select 0 as DeptID, ' --- All ---' as Depart
union
SELECT        DeptID, Depart FROM tblOD_Process
group by Depart, DeptID
Order by Depart"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="span6">
                                        <label class="form-label span3" for="normal">Function</label>
                                        <div class="span9" style="margin-left:0px;">
                                            <asp:DropDownList ID="ddlFunction" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Func" DataValueField="FuncID" OnSelectedIndexChanged="ddlFunction_SelectedIndexChanged"></asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="Select 0 as FuncID, ' --- All ---' as Func
union
SELECT FuncID, Func FROM tblOD_Process
where FuncID is not null and Func is not null and DeptID = @DeptID
group by Func, FuncID
Order by Func">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="" Name="DeptID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                
                            

                                <div class="form-row row-fluid">
                                    <div class="span6">
                                        <label class="form-label span3" for="normal">Sub Function</label>
                                        <div class="span9" style="margin-left:0px;">
                                            <asp:DropDownList ID="ddlsFunction" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="SFunc" DataValueField="SFuncID" OnSelectedIndexChanged="ddlsFunction_SelectedIndexChanged"></asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="Select 0 as SFuncID, ' --- All ---' as SFunc
union
SELECT SFuncID, SFunc FROM tblOD_Process
where SFuncID is not null and SFunc is not null and FuncID = @FunID
group by SFunc, SFuncID
Order by SFunc">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlFunction" Name="FunID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="span6">
                                        <label class="form-label span3" for="normal">Activity</label>
                                        <div class="span9" style="margin-left:0px;">
                                            <asp:DropDownList ID="ddlActiviy" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Activ" DataValueField="ID" OnSelectedIndexChanged="ddlActiviy_SelectedIndexChanged"></asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="Select 0 as ID, ' --- All ---' as Activ
union
SELECT ID, Activ FROM tblOD_Process
where ID is not null and Activ is not null and Activ not like '' and SFuncID = @sFunID
group by Activ, ID
Order by Activ">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlsFunction" Name="sFunID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>



                                


                                <div class="form-row row-fluid">
                                    <div class="span6">
                                        <label class="span3" ></label>
                                        <asp:Button  ID="btnSrch" runat="server" Text="Search" OnClick="btnSrch_Click" />
                                    </div>
                                </div>
                                

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


        <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Organizational Development Structure</span>
                    </h4>
                </div>
                <div class="content">

                    <form class="form-horizontal" action="#">

                        <div class="form-row row-fluid">
                            <div class="span12">

                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="500px"></rsweb:ReportViewer>


                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




    


</asp:Content>
