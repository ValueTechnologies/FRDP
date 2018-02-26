<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="GenerateSalary.aspx.cs" Inherits="FRDP.GenerateSalary" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row-fluid">
        <div class="span12">
            <div class="box gradient">
                <div class="title">
                    <h4>
                        <span>Search</span>
                    </h4>
                    <a href="dvSearch" class="minimize">Minimize</a>
                </div>
                <div class="content" id="dvSearch">

                    <form class="form-horizontal" action="#">
                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">Month</label>
                                <div class="span7 controls sel" style="margin-left: 0px;">
                                    <asp:DropDownList Class="nostyle" ID="ddlMonth" runat="server" ClientIDMode="Static" DataSourceID="SqlDataSource1" DataTextField="Month" DataValueField="MonthID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT MonthID, Month FROM tbl_Month"></asp:SqlDataSource>
                                </div>


                            </div>

                            <div class="span6">
                                <label class="form-label span4" for="normal">Year</label>
                                <div class="span7 controls sel" style="margin-left: 0px;">
                                    <asp:DropDownList ID="ddlSalaryYear" ClientIDMode="Static" runat="server">
                                        <asp:ListItem>2010 </asp:ListItem><asp:ListItem>2011 </asp:ListItem><asp:ListItem>2012 </asp:ListItem><asp:ListItem>2013 </asp:ListItem><asp:ListItem>2014 </asp:ListItem><asp:ListItem>2015 </asp:ListItem><asp:ListItem selected="selected">2016 </asp:ListItem><asp:ListItem>2017 </asp:ListItem><asp:ListItem>2018 </asp:ListItem><asp:ListItem>2019 </asp:ListItem><asp:ListItem>2020 </asp:ListItem><asp:ListItem>2021 </asp:ListItem><asp:ListItem>2022 </asp:ListItem><asp:ListItem>2023 </asp:ListItem><asp:ListItem>2024 </asp:ListItem><asp:ListItem>2025 </asp:ListItem><asp:ListItem>2026 </asp:ListItem><asp:ListItem>2027 </asp:ListItem><asp:ListItem>2028 </asp:ListItem><asp:ListItem>2029 </asp:ListItem><asp:ListItem>2030 </asp:ListItem><asp:ListItem>2031 </asp:ListItem><asp:ListItem>2032 </asp:ListItem><asp:ListItem>2033 </asp:ListItem><asp:ListItem>2034 </asp:ListItem><asp:ListItem>2035 </asp:ListItem><asp:ListItem>2036 </asp:ListItem><asp:ListItem>2037 </asp:ListItem><asp:ListItem>2038 </asp:ListItem><asp:ListItem>2039 </asp:ListItem><asp:ListItem>2040 </asp:ListItem><asp:ListItem>2041 </asp:ListItem><asp:ListItem>2042 </asp:ListItem><asp:ListItem>2043 </asp:ListItem><asp:ListItem>2044 </asp:ListItem><asp:ListItem>2045 </asp:ListItem><asp:ListItem>2046 </asp:ListItem><asp:ListItem>2047 </asp:ListItem><asp:ListItem>2048 </asp:ListItem><asp:ListItem>2049 </asp:ListItem>
                                    </asp:DropDownList>
                                    
                                    

                                </div>

                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">Office</label>
                                <div class="span7 controls sel" style="margin-left: 0px;">
                                    <asp:DropDownList Class="nostyle" ID="ddlOfficeType" ClientIDMode="Static" runat="server">
                                        <asp:ListItem Value="1">Head Office</asp:ListItem>
                                        <asp:ListItem Value="2">District Support Units</asp:ListItem>
                                        <asp:ListItem Value="3">Basic Health Units</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT COMPANYID [DirectorateID], CompanyName [Directorate] FROM TBL_COMPANY WHERE LVL = 1 OR LVL = 2
ORDER BY LVL , CompanyName"></asp:SqlDataSource>
                                </div>
                            </div>


                            <div class="span6">
                                <label class="form-label span4" for="normal">&nbsp;</label>

                                <asp:Button type="Button" style="width:200px;" CssClass="btn btn-info" runat="server" Text="Generate Salary Sheets" ID="btnSearch" OnClick="btnSearch_Click" />
                            </div>
                        </div>





<%--                        <div class="form-row row-fluid">
                            

                        </div>--%>

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
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Report</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
                    <form class="form-horizontal" action="#">
                        <div class="form-row row-fluid">
                            <div class="span12">
                                <rsweb:reportviewer ID="ReportViewer1" runat="server" Width="99%" Height="550"></rsweb:reportviewer>
                            </div>
                        </div>

                    </form>
<br /></div>

                            </div>

                        </div>
    </div>
</asp:Content>
