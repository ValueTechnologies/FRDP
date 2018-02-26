<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="Medicine_YearlyBudget.aspx.cs" Inherits="FRDP.Medicine_YearlyBudget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Yearly Government Grant per Office </span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
    <tr>
        <td style="width:100px;">Select Year</td>
        <td style="text-align:left; width: 40%;">
           <asp:DropDownList ID="ddYear" runat="server" ClientIDMode="Static" DataSourceID="dsFY" DataTextField="SessionName" DataValueField="Session_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsFY" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT SessionName, Session_ID FROM tblAC_Year"></asp:SqlDataSource></td>
        <td style="width:100px;">Budget</td>
        <td style="text-align:left;">
            <input id="txtYearlyBudget" class="Integer" value="0" type="text" style="width:90%;" />
            </td>
    </tr>
<%--        <tr>
            <td>Name</td>
            <td><input id="Name" type="text" style="width:90%;" /></td>
            <td><label id="CNICORCompanyNTN">Company NTN</label></td>
            <td><input id="CNIC_CompanyNTN" type="text" style="width:90%;" /></td>
        </tr>--%>
    </tbody>
</table>
<br /></div>

                            </div>

                        </div>
    </div>

           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>DSU Wise Financial Budget</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
                                    <div id="dvBudget">
                                        <%--=====================--%>
                                                                            <table id="tblBudgetAllocation" class="responsive table table-striped table-bordered table-condensed" style="width: 98%; margin-left: 10px; border-right: 1px solid #c4c4c4;border-bottom: 1px solid #c4c4c4;">
                                <thead>
                                  <tr>
                                    <th style="width:30px;">#</th>
                                    <th>District Support Unit</th>
                                    <th>No. Of Offices Currently</th>
                                    <th>No of Offices In That Session</th>
                                      <th>1st 6 Month Budget</th>
                                      <th>2nd 6 Month Budget</th>
                                      <th>Total Budget</th>
                                  </tr>
                                </thead>
                                <tbody>
                                     </tbody>
                                        <tfoot>
                                    <tr>
                                    <td colspan="4" style="text-align:center; font-weight:bold;">Total</td>
                                    <td style="text-align:center; font-weight:bold;">0</td>
                                        <td style="text-align:center; font-weight:bold;">0</td>
                                     <td style="text-align:center; font-weight:bold;">0</td>
                                  </tr>
                                        </tfoot>
                            </table>
                                        <%--===========================--%>
                                    </div>
<br /></div>

                            </div>

                        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {


            $('#ddYear').live('change', function (e) {
                e.preventDefault();
                GetBudget();

            });
            GetBudget();
            function GetBudget() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=64ǁ" + $('#ddYear').val(),
                    success: function (response) {
                        $('#txtYearlyBudget').val(response);
                        DSUList();
                    }
                });
            }
            $('#txtYearlyBudget').live('change', function (e) {
                e.preventDefault();
                DSUList();
            });
            function DSUList() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=65ǁ" + $('#ddYear').val() + "ǁ" + $('#txtYearlyBudget').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        var total = 0, totalhalf = 0;
                        $.each(jd, function (i, itm) {
                            total += parseFloat(jd[i].TotalBudget);
                            totalhalf += parseFloat(jd[i].HalfBudget);
                            opt += '                                  <tr>\
                                    <td style="width:30px;">'+(i+1)+'</td>\
                                    <td>' + jd[i].CompanyName + '</td>\
                                    <td>' + jd[i].TotalBHUCurrently + '</td>\
                                    <td><input tag="' + jd[i].tblDSUYearlyBudetID + '" cv="' + jd[i].TotalBHUInSession + '" lq="' + jd[i].TotalBHUCurrently + '" class="clsCurrentBHUs Integer" style="width: 143px;" type="text" value="' + jd[i].TotalBHUInSession + '" /></td>\
                                      <td>' + jd[i].HalfBudget + '</td>\
                                      <td>' + jd[i].HalfBudget + '</td>\
                                      <td>' + jd[i].TotalBudget + '</td>\
                                  </tr>';
                        });
                        $('#tblBudgetAllocation tbody').html(opt);
                        console.log(totalhalf);
                        console.log(total);
                        $($('#tblBudgetAllocation tfoot tr td')[1]).html(totalhalf);
                        $($('#tblBudgetAllocation tfoot tr td')[2]).html(totalhalf);
                        $($('#tblBudgetAllocation tfoot tr td')[3]).html(total);
                    }
                });
            }

            $('.clsCurrentBHUs').live('focusout', function (e) {
                e.preventDefault();
                var $this = $(this);
                if (parseInt( $this.attr('cv')) != parseInt($this.val())) {
                    if (parseInt($this.val()) <= parseInt($this.attr('lq'))) {

                        
                        $.ajax({
                            type: "POST",
                            url: "inv.ashx/?ID=66ǁ" + $('#ddYear').val() + "ǁ" + $('#txtYearlyBudget').val() + "ǁ" + $this.val() + "ǁ" + $this.attr('tag'),
                            success: function (response) {
                                alertG('Record Updated..!');
                                var jd = $.parseJSON(response), opt = '';
                                var total = 0, totalhalf = 0;
                                $.each(jd, function (i, itm) {
                                    total += parseFloat(jd[i].TotalBudget);
                                    totalhalf += parseFloat(jd[i].HalfBudget);
                                    opt += '                                  <tr>\
                                    <td style="width:30px;">'+ (i + 1) + '</td>\
                                    <td>' + jd[i].CompanyName + '</td>\
                                    <td>' + jd[i].TotalBHUCurrently + '</td>\
                                    <td><input tag="' + jd[i].tblDSUYearlyBudetID + '" cv="' + jd[i].TotalBHUInSession + '" lq="' + jd[i].TotalBHUCurrently + '" class="clsCurrentBHUs Integer" style="width: 143px;" type="text" value="' + jd[i].TotalBHUInSession + '" /></td>\
                                      <td>' + jd[i].HalfBudget + '</td>\
                                      <td>' + jd[i].HalfBudget + '</td>\
                                      <td>' + jd[i].TotalBudget + '</td>\
                                  </tr>';
                                });
                                $('#tblBudgetAllocation tbody').html(opt);
                                console.log(totalhalf);
                                console.log(total);
                                $($('#tblBudgetAllocation tfoot tr td')[1]).html(totalhalf);
                                $($('#tblBudgetAllocation tfoot tr td')[2]).html(totalhalf);
                                $($('#tblBudgetAllocation tfoot tr td')[3]).html(total);
                            }
                        });
                    }
                    else {
                        alertR('Enter Valid Value..!');
                        $this.val($this.attr('cv'));
                    }
                }
                
            });
        });//END OF DOC READY
    </script>
    
</asp:Content>
