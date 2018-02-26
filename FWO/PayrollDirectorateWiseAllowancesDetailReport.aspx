<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="PayrollDirectorateWiseAllowancesDetailReport.aspx.cs" Inherits="FRDP.PayrollDirectorateWiseAllowancesDetailReport" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  


    <style type="text/css">
        .button {
            background: #3498db;
            background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
            background-image: -moz-linear-gradient(top, #3498db, #2980b9);
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
                background-image: -o-linear-gradient(top, #2780b8, #3498db);
                background-image: linear-gradient(to bottom, #2780b8, #3498db);
                text-decoration: none;
            }

        div.button span {
            text-transform: none;
        }

        div.button {
            height: 26px;
        }
    </style>
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
                                    <asp:DropDownList Class="nostyle" ID="ddlMonth" runat="server" DataSourceID="SqlDataSource1" DataTextField="Month" DataValueField="MonthID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT MonthID, Month FROM tbl_Month"></asp:SqlDataSource>
                                </div>


                            </div>

                            <div class="span6">
                                <label class="form-label span4" for="normal">Year</label>
                                <div class="span7 controls sel" style="margin-left: 0px;">
                                    <asp:DropDownList ID="ddlYears" runat="server" Class="nostyle"></asp:DropDownList>

                                </div>

                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span6">
                                <label class="form-label span4" for="normal">Office</label>
                                <div class="span7 controls sel" style="margin-left: 0px;">
                                    <asp:DropDownList Class="nostyle" ID="ddlDirectorate" runat="server" DataSourceID="SqlDataSource2" DataTextField="Directorate" DataValueField="DirectorateID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT COMPANYID [DirectorateID], CompanyName [Directorate] FROM TBL_COMPANY WHERE LVL = 1 OR LVL = 2
ORDER BY LVL , CompanyName"></asp:SqlDataSource>
                                </div>
                            </div>


                            <div class="span6">
                                <label class="form-label span4" for="normal">&nbsp;</label>

                                <asp:Button type="Button" style="width:200px;" CssClass="btn btn-info" runat="server" Text="Salary Sheets" ID="btnSearch" OnClick="btnSearch_Click" />
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
                        <span>Reports</span>
                    </h4>
                    <a href="dvReports" class="minimize">Minimize</a>
                </div>
                <div class="content" id="dvReports">

                    <form class="form-horizontal" action="#">
                        <div class="form-row row-fluid">
                            <div class="span12">
                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="99%" Height="550"></rsweb:ReportViewer>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
      <script type="text/javascript">

          $(document).ready(function () {
              $('.heading h3').html('Office Wise Allowance Detail Report');


          });



    </script>
</asp:Content>
