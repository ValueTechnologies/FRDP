<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="PurchaseInvoice.aspx.cs" Inherits="FRDP.PurchaseInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Create Purchase Invoice</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 99%; margin-left: 20px; margin-right: 20px;">
                        <tr>
                            <td style="width: 150px;">GRN #</td>
                            <td>
                                <select>
                                    <option>GRN-00001</option>
                                </select></td>
                            <td style="width: 150px;">Date</td>
                            <td>
                                <input type="text" class="dtDate" value="" /></td>
                        </tr>
                        <tr>
                            <td>Type</td>
                            <td>
                                <select id="ddlReqType" disabled="disabled" >
                                    <option>Without P.O</option>
                                    <option>With P.O</option>
                                </select></td>
                            <td>P.O#</td>
                            <td>
                                <select id="ddlPO" disabled="disabled"></select></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>Vendor</td>
                            <td>
                                <select id="ddlVendor"></select></td>
                        </tr>
                        <tr>
                            <td colspan="4">Vendor Details</td>
                        </tr>
                        <tr>
                            <td>Gate PASS#</td>
                            <td>
                                <input type="text" disabled="disabled" /></td>
                            <td>Purchase Invoice #</td>
                            <td>
                                <input type="text"  disabled="disabled"  /></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table id="tblitsms" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                                    <thead>
                                        <tr>
                                            <th style="width: 30px;">#</th>
                                            <th>Item</th>
                                            <th>Quality</th>
                                            <th style="width: 100px;">Quantity</th>
                                            <th style="width: 50px;">Unit</th>
                                            <th>Unit Price</th>
                                            <th>Total Amount</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr iid="66" ar="0" qty="50" qly="abc">
                                            <td>1</td>
                                            <td>01-011-0004 FALGYL PLUS</td>
                                            <td>abc</td>
                                            <td>50</td>
                                            <td>ML</td>
                                            <td>
                                                <input type="text" style="width: 50px" class="Integer" /></td>
                                            <td>68</td>

                                        </tr>
                                        <tr iid="70" ar="1" qty="4" qly="ASDFASDF">
                                            <td>2</td>
                                            <td>01-011-0008 SANGOBION</td>
                                            <td>ASDFASDF</td>
                                            <td>4</td>
                                            <td>ML</td>
                                            <td>
                                                <input type="text" style="width: 50px" class="Integer" /></td>
                                            <td>342</td>

                                        </tr>
                                        <tr iid="44" ar="2" qty="34" qly="ASDFF">
                                            <td>3</td>
                                            <td>01-004-0007 MEDISOL HARTMANS WITH SET</td>
                                            <td>ASDFF</td>
                                            <td>34</td>
                                            <td>BAG</td>
                                            <td>
                                                <input type="text" style="width: 50px" class="Integer" /></td>
                                            <td>258</td>

                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="3" style="text-align: center; font-weight: bold;">Total</td>
                                            <td id="totalitems" style="text-align: center; font-weight: bold;">88</td>
                                            <td colspan="2"></td>
                                            <td>785</td>

                                        </tr>
                                    </tfoot>
                                </table>
                            </td>
                        </tr>


                        <tr>
                            
                                <td></td>
                                <td></td>
                                <td>Freight Charges</td>
                                <td>
                                    <input type="text" /></td>
                           
                        </tr>
                        <tr>

                            <td></td>
                            <td></td>
                            <td>Sales Tax</td>
                            <td>
                                <input type="text" /></td>

                        </tr>
                        <tr>

                            <td></td>
                            <td></td>
                            <td>Grand Total</td>
                            <td>
                                <input type="text" /></td>

                        </tr>
                    </table>
                    <br />
                </div>

            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {

            $('.dtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });
        });
    </script>
</asp:Content>
