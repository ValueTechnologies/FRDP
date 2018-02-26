<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="PayrollReports.aspx.cs" Inherits="FRDP.PayrollReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="title">
                    <h4>
                        <span>Reports </span>
                    </h4>
                    <a href="dvReports" class="minimize">Minimize</a>
                </div>
                <div class="content" id="dvReports">

                    <form class="form-horizontal" action="#">
                        <div class="form-row row-fluid">
                            <div class="span12">

                                <table>
                                    <tr>
<%--                                        <td style="margin-top: 0px; padding: 35px;">
                                            <div id="dvDirectorateWiseUnionFundRpt" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    Directorate Wise Union Fund Report
                                                </p>
                                            </div>
                                        </td>--%>


<%--                                        <td style="margin-top: 0px; padding: 35px;">
                                            <div id="dvDirectorateWiseMicroFinanceRpt" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    Directorate Wise Micro Finance Report
                                                </p>
                                            </div>
                                        </td>--%>

                                        <td style="margin-top: 0px; padding: 35px;">
                                            <div id="dvDirectorateWiseIncomeTaxRpt" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    Income Tax Report
                                                </p>
                                            </div>
                                        </td>


                                        <td style="margin-top: 0px; padding: 35px;">
                                            <div id="dvDirectorateWiseNetSalaryRpt" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    Net Salary Report
                                                </p>
                                            </div>
                                        </td>


<%--                                    </tr>


                                    <tr>--%>
                                        <td style="margin-top: 0px; padding: 35px;">
                                           <%-- <div id="dvDirectorateWiseGPFDetailRpt" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    GPF Report
                                                </p>
                                            </div>--%>
                                        </td>

                                        <td style="margin-top: 0px; padding: 35px;">
                                            <div id="dvDirectorateWiseAllowancesDetailRpt" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    Allowances Detail Report
                                                </p>
                                            </div>
                                        </td>

                                        <td style="margin-top: 0px; padding: 35px;">
                                            <div id="dvDirectorateWiseDeductionDetailRpt" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    Deductions Detail Report
                                                </p>
                                            </div>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <div id="dvDirectorateWiseDeductionDetailRpt123" style="text-align: center;">
                                                <a class="btn btn-app" style="background-image: url(Images/indicat.png); width: 104px; height: 127px;"></a>
                                                <p style="text-align: center;">
                                                    Salary Detail Report
                                                </p>
                                            </div>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        
                                    </tr>


                                </table>


                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

      <script type="text/javascript">
          $(document).ready(function () {
              $('.heading h3').html('Reports');

              $('#dvDirectorateWiseUnionFundRpt').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseUnionFundReport.aspx";
              });

              $('#dvDirectorateWiseMicroFinanceRpt').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseMicroFinanceReport.aspx";
              });

              $('#dvDirectorateWiseIncomeTaxRpt').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseIncomeTaxReport.aspx";
              });

              $('#dvDirectorateWiseNetSalaryRpt').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseNetSalaryReport.aspx";
              });

              $('#dvDirectorateWiseAllowancesDetailRpt').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseAllowancesDetailReport.aspx";
              });

              $('#dvDirectorateWiseGPFDetailRpt').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseGPFDetailReport.aspx";
              });

              $('#dvDirectorateWiseDeductionDetailRpt').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseDeductionsDetailReport.aspx";
              });

              $('#dvDirectorateWiseDeductionDetailRpt123').bind('click', function () {
                  window.location.href = "PayrollDirectorateWiseCompleteDetailReport.aspx";
              });



          });
          //end ready

    </script>
</asp:Content>
