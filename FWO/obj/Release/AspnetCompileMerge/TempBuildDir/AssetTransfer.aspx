<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="AssetTransfer.aspx.cs" Inherits="FRDP.AssetTransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Select Asset to Transfer</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />

                                     <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 125px;">
                                    <label>Office Type : &nbsp;</label></td>
                                <td style="text-align: left; width: 40%;">
                                    <select id="ddlCompanyType" class="pr frm">
                                        <option value="1">Head Office</option>
                                        <option value="2">District Support Office</option>
                                        <option value="3">Basic Health Unit</option>
                                    </select></td>
                                <td style="width: 125px; text-align: right;">
                                    <label class="form-label span3 clsHelper" for="normal" style="display: none;">DSU</label></td>
                                <td style="text-align: left;">
                                    <select id="ddlDSUList" class="pr clsHelper frm" style="display: none;"></select></td>
                            </tr>

                            <tr>
                                <td>Office </td>
                                <td>
                                    <select id="ddlCompany" class="pr frm"></select></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">Date</td>
                                <td style="text-align: left; width: 40%;">
                                    <input id="dtDate" class="frm clr" type="text" /></td>
                                <td style="width: 100px;"></td>
                                <td style="text-align: left;">
                                   
                                    <%--<select id="Type" style="  WIDTH: 93.5%;">
                <option>Company</option>
                <option>Individual</option>
            </select>--%></td>
                            </tr>
                            <tr>
                                <td>Asset Category</td>
                                <td colspan="3">
                                    <select id="ddlItemCategory" class="frm" style="width: 83.5%;">
                                    </select></td>
                               
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                   </td>
                                
                                <td>Select Item</td>
                                <td>
                                    <select id="ddlItem" class="frm"></select>
                                </td>
                            </tr>


                            <tr>
                                <td>Serial #
                                </td>
                                <td>
                                    <input id="txtSerial" class="frm clr" title="Serial Number of Item if Any" type="text" />
                                </td>
                                <td>Product #
                                </td>
                                <td>
                                    <input id="txtProduct" class="frm clr" title="Product Number of Item if Any" type="text" /></td>
                            </tr>
                            <tr>
                                <td>Insurance</td>
                                <td>
                                    <input id="txtInsurance" class="frm clr" title="Include any details regarding the insurance policy for the asset, including broker name and company." type="text" /></td>
                                <td>Warranty</td>
                                <td>
                                    <input id="txtWarranty" class="frm clr" title="If applicable, including contact information for warranty provider." type="text" /></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Description</td>
                                <td colspan="3">
                                    <textarea id="txtDetails" class="frm clr" cols="20" rows="2" style="width: 82%;"></textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" value="0" id="btnSave" class="btn btn-info frm">Save</button>
                                    <button type="button" id="btnCancel" class="btn btn" style="margin-left: 5px;">Cancel</button></td>
                            </tr>
                        </tbody>
                    </table>

<br /></div>

                            </div>

                        </div>
    </div>
</asp:Content>
