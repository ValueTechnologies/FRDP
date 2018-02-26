<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="BHUSurvey.aspx.cs" Inherits="FRDP.BHUSurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .content {
            padding-left: 20px !important;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Select to Enter Survey</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 100%">
                        <tr>
                            <td>Select
                            </td>
                            <td>
                                <select id="ddlDSUList" class="frm" style=""></select>
                            </td>
                            <td>Select
                            </td>
                            <td>
                                <select id="ddlCompany" class="frm"></select>
                            </td>
                        </tr>
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
                        <span>Survey Information</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 99%">
                        <tr>
                            <td>Visiting Person</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                            <td>Designation</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                        </tr>
                        <tr>
                            <td>Code No.</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                            <td>Dated</td>
                            <td>
                                <input id="txtDated" class="frm clr dtDate" type="text" /></td>
                        </tr>

                        <tr>
                            <td>District</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                            <td>Tehsil</td>
                            <td>
                                <input id="txtTehsil" class="frm clr" type="text" /></td>
                        </tr>

                        <tr>
                            <td>Village</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                            <td>Name of the In-charge of the Facility</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                        </tr>

                        <tr>
                            <td>Prepared By</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                            <td>Checked By</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                        </tr>
                        <tr>
                            <td>Verified By</td>
                            <td>
                                <input class="frm clr" type="text" /></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;BASE LINE SURVEY</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <table style="width: 99%">
                            <tr>
                                <td>Name of Visiting Person</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                                <td>Designation</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                            </tr>
                            <tr>
                                <td>Code No.</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                                <td>Dated</td>
                                <td>
                                    <input class="frm clr dtDate" type="text" /></td>
                            </tr>
                            <tr>
                                <td>District</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                                <td>Tehsil</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                            </tr>
                            <tr>
                                <td>Village</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                                <td>Name of the In-charge of the Facility</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                            </tr>
                            <tr>
                                <td>Distance From the head Quarter(Km)</td>
                                <td>
                                    <input class="frm clr Integer" type="text" /></td>
                                <td>1. Kind of health Center</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                            </tr>
                            <tr>
                                <td>2. Timing of health center</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                                <td>3. Average no of daily Expected OPD Patients</td>
                                <td>
                                    <input class="frm clr Integer" type="text" /></td>
                            </tr>
                            <tr>
                                <td>4. Catchment Area Population</td>
                                <td>
                                    <input class="frm clr Integer" type="text" /></td>
                                <td>5. Total Area</td>
                                <td>
                                    <input class="frm clr Integer" type="text" /></td>
                            </tr>
                            <tr>
                                <td>6. Covered Area (Meters)</td>
                                <td>
                                    <input class="frm clr Integer" type="text" /></td>
                                <td>7. Date of Establishment</td>
                                <td>
                                    <input class="frm clr dtDate" type="text" /></td>
                            </tr>
                            <tr>
                                <td>8. Distance from other HF(Km)</td>
                                <td>
                                    <input class="frm clr Integer" type="text" /></td>
                                <td>9. Referral System</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                            </tr>
                            <tr>
                                <td>10. Financially Supporting Source</td>
                                <td>
                                    <select class="frm">
                                        <option>Government</option>
                                        <option>Other Source</option>
                                    </select></td>
                                <td>Source (if Other)</td>
                                <td>
                                    <input class="frm clr" type="text" /></td>
                            </tr>
                        </table>
                    </div>
                    <%--END OF tab0--%>


                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;1. Condition of Building (Source Visited)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Building</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition of the building</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">Rooms</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Kitchen</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Toilet</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Medical Store</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Boundary Wall</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Laboratory</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>

                    <%--22222222222222222222222222222222222222222222222222--%>
                    <hr />
                    <h2>Residential Quarters Medical Officers:</h2>
                    <div><strong>Residential quarter available</strong>
                        <select id="ddlyn1" class="frm yn">
                            <option>Yes</option>
                            <option>No</option>
                        </select></div>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;2. Condition of the Building: Medical Officer Quarter : (Source Visited)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="ddlyn1" style="margin-bottom: 20px;">


                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Building</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition of the building</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">Rooms</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Kitchen</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Toilet</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Store</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Boundary</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Electricity</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">7</td>
                                    <td style="width: 150px;">Water</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">8</td>
                                    <td style="width: 150px;">Gas</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">9</td>
                                    <td style="width: 150px;">Sanitation</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>
                    <%--33333333333333333333333333333333333333333333333--%>

                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;3. Condition of the Building: Lady Medical Officer Quarter : (Source Visited)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">

                        <div><strong>Residential quarter available</strong>
                            <select id="ddlyn2" class="frm yn">
                                <option>Yes</option>
                                <option>No</option>
                            </select></div>
                        <table class="responsive table table-striped table-bordered table-condensed ddlyn2" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Building</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition of the building</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">Rooms</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Kitchen</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Toilet</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Store</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Boundary</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Electricity</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">7</td>
                                    <td style="width: 150px;">Water</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">8</td>
                                    <td style="width: 150px;">Gas</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">9</td>
                                    <td style="width: 150px;">Sanitation</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>
                    <%--44444444444444444444444444444444444444444444444444444444444444444--%>
                    <hr />
                    <h2>Staff quarter Condition(LHV/FMT) </h2>
                    <div><strong>Residential quarter available</strong>
                        <select id="ddlyn3" class="frm yn">
                            <option>Yes</option>
                            <option>No</option>
                        </select></div>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;4. Condition of Building: (LHV/FMT) :(Source Visited)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="ddlyn3" style="margin-bottom: 20px;">


                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Building</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition of the building</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">Rooms</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Kitchen</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Toilet</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Store</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Boundary</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Electricity</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">7</td>
                                    <td style="width: 150px;">Water</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">8</td>
                                    <td style="width: 150px;">Gas</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">9</td>
                                    <td style="width: 150px;">Sanitation</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>
                    <%--5555555555555555555555555555555555555555555555555555555555555555--%>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;1. Condition of Staff Quarter Building (MT) : (Source Visited)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">

                        <div><strong>Residential quarter available</strong>
                            <select id="ddlyn4" class="frm yn">
                                <option>Yes</option>
                                <option>No</option>
                            </select></div>
                        <table class="responsive table table-striped table-bordered table-condensed ddlyn4" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Building</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition of the building</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">Rooms</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Kitchen</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Toilet</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Store</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Boundary</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Electricity</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">7</td>
                                    <td style="width: 150px;">Water</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">8</td>
                                    <td style="width: 150px;">Gas</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">9</td>
                                    <td style="width: 150px;">Sanitation</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>
                    <%--66666666666666666666666666666666666666666666666666666--%>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;2. Condition of Staff Quarter Building (Watchman) : (Source Visited)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">

                        <div><strong>Residential quarter available</strong>
                            <select id="ddlyn5" class="frm yn">
                                <option>Yes</option>
                                <option>No</option>
                            </select></div>
                        <table class="responsive table table-striped table-bordered table-condensed ddlyn5" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Building</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition of the building</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">Rooms</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Kitchen</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Toilet</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Store</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Boundary</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Electricity</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                <tr>
                                    <td style="width: 36px;">7</td>
                                    <td style="width: 150px;">Water</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">8</td>
                                    <td style="width: 150px;">Gas</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">9</td>
                                    <td style="width: 150px;">Sanitation</td>
                                    <td style="width: 55px;">
                                        <input style="width: 50px;" class="frm clr Integer" type="text" /></td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 150px;">
                                        <select class="frm good" style="width: 150px;">
                                            <option>Good</option>
                                            <option>Repairable</option>
                                            <option>Major</option>
                                            <option>Minor</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>


                    <%--7777777777777777777777777777777777777777777777777777--%>
                                                            <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Status of Furniture : (Source In charge)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">


                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                <tr style="border-bottom: 1px solid #c4c4c4;">
                                    <th style="width: 36px;">&nbsp;</th>
                                    <th><input type="text" id="txtAdd1A" placeholder="Description" /></th>
                                    <th><input type="text" id="txtAdd1B" placeholder="Quantity" /></th>
                                    <th><input type="text" id="txtAdd1C" placeholder="Available" style="width:60px;" /></th>
                                    <th><input type="text" id="txtAdd1D" placeholder="Condition" style="width:120px;"  /></th>
                                    <th><input type="text" id="txtAdd1E" placeholder="Provided By" /></th>
                                    <th style="width:36px;"><button type="button" id="btnAdd1" class="btn btn-info" style="margin-bottom: 10px;"> + </button></th>
                                </tr>
                                <tr style="border-bottom: 1px solid #c4c4c4;">
                                    <th>S#</th>
                                    <th>Description</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition</th>
                                    <th>Provided By</th>
                                    <th style="width:36px;"></th>
                                </tr>
                            </thead>
                           <tbody></tbody>
                        </table>
                    </div>

                    <%--88888888888888888888888888888888888888888888888888888--%>
                                                                                <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Staff Strength : (Source In charge)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">


                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                                                <tr style="border-bottom: 1px solid #c4c4c4;">
                                    <th style="width: 36px;">&nbsp;</th>
                                    <th><input type="text" id="txtAdd2A" placeholder="Name" /></th>
                                    <th><input type="text" id="txtAdd2B" placeholder="Designation" /></th>
                                    <th><input type="text" id="txtAdd2C" placeholder="BPS" style="width:60px;" /></th>
                                    <th><input type="text" id="txtAdd2D" placeholder="Vacant" style="width:120px;"  /></th>
                                    <th><input type="text" id="txtAdd2E" placeholder="Remarks" /></th>
                                    <th style="width:36px;"><button type="button" id="btnAdd2" class="btn btn-info" style="margin-bottom: 10px;"> + </button></th>
                                </tr>
                                <tr style="border-bottom: 1px solid #c4c4c4;">
                                    <th>S#</th>
                                    <th>Name</th>
                                    <th>Designation</th>
                                    <th>BPS</th>
                                    <th>Vacant</th>
                                    <th>Remarks</th>
                                    <th style="width:36px;"></th>
                                </tr>
                            </thead>
                           <tbody></tbody>
                        </table>
                    </div>
                    <%--99999999999999999999999999999999999999999999999999999999--%>


                                     <hr />
                    <h2>RECORD Available at the Basic Health Unit:</h2>
                    <div><strong>Is Record available? </strong>
                        <select id="ddlyn6" class="frm yn">
                            <option>Yes</option>
                            <option>No</option>
                        </select></div>
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;1. List of record Registers: (Source In charge)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div class="ddlyn6" style="margin-bottom: 20px;">


                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Record Register</th>
                                    <th>Available</th>
                                    <th>Maintained</th>
                                    <th>Provided By</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">OPD Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Medicine Stock Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Equipment & Furniture Stock Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Mother Health Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Family Planning Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Birth Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">7</td>
                                    <td style="width: 150px;">Attendance Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">8</td>
                                    <td style="width: 150px;">Visiting Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">9</td>
                                    <td style="width: 150px;">School Health Session Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">10</td>
                                    <td style="width: 150px;">Community Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">11</td>
                                    <td style="width: 150px;">Check List Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">12</td>
                                    <td style="width: 150px;">Complain Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>

                                                                <tr>
                                    <td style="width: 36px;">13</td>
                                    <td style="width: 150px;">Abstract Register</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>





                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>

                    <%--1000000000000000000000000000000000000000000000000000000000000--%>


                                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                        &nbsp;<div class="tab1" style="float: left">&nbsp;Available Facilities : (Source In charge)</div>
                        <div class="tab2">&nbsp;</div>
                    </div>
                    <div style="margin-bottom: 20px;">


                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                <tr>
                                    <th>S#</th>
                                    <th>Record Register</th>
                                    <th>Available</th>
                                    <th>Provided By</th>
                                    <th>Condition</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 36px;">1</td>
                                    <td style="width: 150px;">Road</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 36px;">2</td>
                                    <td style="width: 150px;">Water</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">3</td>
                                    <td style="width: 150px;">Electricity</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">4</td>
                                    <td style="width: 150px;">Gas</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">5</td>
                                    <td style="width: 150px;">Refrigerator</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">6</td>
                                    <td style="width: 150px;">Stabilizer</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">7</td>
                                    <td style="width: 150px;">Fan</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">8</td>
                                    <td style="width: 150px;">Water Tank</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">9</td>
                                    <td style="width: 150px;">Public transport for Patients</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">10</td>
                                    <td style="width: 150px;">Telephone</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">11</td>
                                    <td style="width: 150px;">Well</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">12</td>
                                    <td style="width: 150px;">Submersible</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>
                                                                <tr>
                                    <td style="width: 36px;">13</td>
                                    <td style="width: 150px;">Ambulance</td>
                                    <td style="width: 100px;">
                                        <select class="frm yn" style="width: 100px;">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </td>
                                    <td>
                                       
                                        <input type="text" class="frm clr" style="width: 96%;" />
                                    </td>
                                    <td>
                                        <input type="text" class="frm clr" style="width: 96%;" /></td>
                                </tr>




                            </tbody>
                        </table>
                    </div>
                    <%--END OF tab0--%>


                    <%--111111============================--%>

                    
                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Diagnostic facilities : (Source In-charge)</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<table style="width: 99%">
                        <tr><td>Laboratory Equipments</td>
                            <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                            <td>Kits</td>
                            <td>                                        <select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                        </tr>
    <tr><td>Microscope</td><td>                                        <select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td><td></td><td></td></tr>
    </table>
</div><%--END OF tab0--%>


<div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Other facilities : (Source In-charge)</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<table style="width: 99%">
                        <tr>
                            <td>1. O.T Service</td>
                            <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                            <td>2. X-Ray Service</td>
                            <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                        </tr>
    <tr>
        <td>3. Lab Service</td>
        <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>4. MCH Service</td>
        <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
    <tr>
        <td>5. EPI Service</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>6. Ambulance Service</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
    <tr>
        <td>7. Family Planning</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>8. Total no. Bed in Ward</td>
                <td><input type="text" class="frm clr Integer" /></td>
    </tr>
</table>
</div><%--END OF tab0--%>



                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Facilities in Village</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<table style="width: 99%">
                        <tr>
                            <td>Road</td>
                            <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                            <td>Electricity</td>
                            <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
                        </tr>
    <tr>
        <td>Water Supply</td>
        <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>Transport Public/Private</td>
        <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
    <tr>
        <td>School (Primary / Middle/High</td>
        <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>Telephone</td>
        <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
</table>
</div><%--END OF tab0--%>


                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Availability of Equipments : (Source In charge)</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
                        <table class="responsive table table-striped table-bordered table-condensed" style="width: 99%;">
                            <thead>
                                <tr style="border-bottom: 1px solid #c4c4c4;">
                                    <th style="width: 36px;">&nbsp;</th>
                                    <th><input type="text" id="txtAdd3A" placeholder="Description" /></th>
                                    <th><input type="text" id="txtAdd3B" placeholder="Quantity" /></th>
                                    <th><input type="text" id="txtAdd3C" placeholder="Available" style="width:60px;" /></th>
                                    <th><input type="text" id="txtAdd3D" placeholder="Condition" style="width:120px;"  /></th>
                                    <th><input type="text" id="txtAdd3E" placeholder="Provided By" /></th>
                                    <th style="width:36px;"><button type="button" id="btnAdd3" class="btn btn-info" style="margin-bottom: 10px;"> + </button></th>
                                </tr>
                                <tr style="border-bottom: 1px solid #c4c4c4;">
                                    <th>S#</th>
                                    <th>Description</th>
                                    <th>Quantity</th>
                                    <th>Available</th>
                                    <th>Condition</th>
                                    <th>Provided By</th>
                                    <th style="width:36px;"></th>
                                </tr>
                            </thead>
                           <tbody></tbody>
                        </table>
</div><%--END OF tab0--%>



                    <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp; Preventive Service </div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<table style="width:99%;">
    <tr>
        <td>Cleanliness</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>EPI</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
    <tr>
        <td>TB</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>Malaria Control Program</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
</table>
</div><%--END OF tab0--%>



                                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp; Medicine Store</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<table style="width:99%;">
    <tr>
        <td>A. Medicines Available in the Health center</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>B. Medicines near to Expiry</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
    <tr>
        <td>C. Bin Cards</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>D. Hospital Waste</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
</table>
</div><%--END OF tab0--%>



                                        <div class="tab0" style="margin-left: 5px; margin-bottom: 20px;">
                            &nbsp;<div class="tab1" style="float: left">&nbsp; Procedure of medicine delivery from DHO Office</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div style="margin-bottom: 20px;">
<table style="width:99%;">
    <tr>
        <td>Monthly</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>Quarterly</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
    <tr>
        <td>Half Yearly</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
        <td>Other</td>
                <td><select class="frm yn">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select></td>
    </tr>
    <tr>
        <td>Other</td>
        <td><input type="text" class="frm clr" /></td>
        <td></td>
        <td></td>
    </tr>
</table>
                   
</div><%--END OF tab0--%>






                                                <hr />
                                                <div style="text-align: right; margin-top: 10px;">
                        <button type="button" id="btnSave" value="0" class="btn btn-info frm">Submit Form</button>
                        <button id="btnCancel" value="0" class="btn btn" style="margin-right: 1%;">Cancel</button>
                    </div>
                    <br />
                </div>
                <%-- END OF CONTENT DIV--%>
            </div>

        </div>
    </div>


          <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Previously Saved Surveys</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad"><br />
<br />
                    <div id="tblContainer" style="margin-left: 20px; margin-right: 20px;"></div>

                    <br />
                    <br />
                    <br />
<br /></div>

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

            $('#ddlyn1').live('change', function (e) {
                e.preventDefault();
                if ($(this).val()=="Yes") {
                    $('.ddlyn1').show('slow');
                    
                    $('.ddlyn1 .frm').val('').removeAttr('disabled');
                    $('.ddlyn1 .good').html('<option>Good</option><option>Repairable</option><option>Major</option><option>Minor</option>');
                    $('.ddlyn1 .yn').html('<option>Yes</option><option>No</option>'); $('.ddlyn1 .Integer').val('0');
                }
                else {
                    $('.ddlyn1 .frm').val('').attr('disabled', 'disabled');
                    $('.ddlyn1 .Integer').val('0');
                    $('.ddlyn1').hide('slow');
                    $('.ddlyn1 .good').html('<option></option>');
                    $('.ddlyn1 .yn').html('<option></option>');
                }
            });
            $('#ddlyn2').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Yes") {
                    $('.ddlyn2').show('slow');
                    
                    $('.ddlyn2 .frm').val('').removeAttr('disabled');
                    $('.ddlyn2 .good').html('<option>Good</option><option>Repairable</option><option>Major</option><option>Minor</option>');
                    $('.ddlyn2 .yn').html('<option>Yes</option><option>No</option>'); $('.ddlyn2 .Integer').val('0');
                }
                else {
                    $('.ddlyn2 .frm').val('').attr('disabled', 'disabled');
                    $('.ddlyn2 .Integer').val('0');
                    $('.ddlyn2').hide('slow');
                    $('.ddlyn2 .good').html('<option></option>');
                    $('.ddlyn2 .yn').html('<option></option>');
                }
            });
            $('#ddlyn3').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Yes") {
                    $('.ddlyn3').show('slow');
                    
                    $('.ddlyn3 .frm').val('').removeAttr('disabled');
                    $('.ddlyn3 .good').html('<option>Good</option><option>Repairable</option><option>Major</option><option>Minor</option>');
                    $('.ddlyn3 .yn').html('<option>Yes</option><option>No</option>'); $('.ddlyn3 .Integer').val('0');
                }
                else {
                    $('.ddlyn3 .frm').val('').attr('disabled', 'disabled');
                    $('.ddlyn3 .Integer').val('0');
                    $('.ddlyn3').hide('slow');
                    $('.ddlyn3 .good').html('<option></option>');
                    $('.ddlyn3 .yn').html('<option></option>');
                }
            });
            $('#ddlyn4').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Yes") {
                    $('.ddlyn4').show('slow');
                   
                    $('.ddlyn4 .frm').val('').removeAttr('disabled');
                    $('.ddlyn4 .good').html('<option>Good</option><option>Repairable</option><option>Major</option><option>Minor</option>');
                    $('.ddlyn4 .yn').html('<option>Yes</option><option>No</option>'); $('.ddlyn4 .Integer').val('0');
                }
                else {
                    $('.ddlyn4 .frm').val('').attr('disabled', 'disabled');
                    $('.ddlyn4 .Integer').val('0');
                    $('.ddlyn4').hide('slow');
                    $('.ddlyn4 .good').html('<option></option>');
                    $('.ddlyn4 .yn').html('<option></option>');
                }
            });

            $('#ddlyn5').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Yes") {
                    $('.ddlyn5').show('slow');
                    
                    $('.ddlyn5 .frm').val('').removeAttr('disabled');
                    $('.ddlyn5 .good').html('<option>Good</option><option>Repairable</option><option>Major</option><option>Minor</option>');
                    $('.ddlyn5 .yn').html('<option>Yes</option><option>No</option>'); $('.ddlyn5 .Integer').val('0');
                }
                else {
                    $('.ddlyn5 .frm').val('').attr('disabled', 'disabled');
                    $('.ddlyn5 .Integer').val('0');
                    $('.ddlyn5').hide('slow');
                    $('.ddlyn5 .good').html('<option></option>');
                    $('.ddlyn5 .yn').html('<option></option>');
                }
            });

            $('#ddlyn6').live('change', function (e) {
                e.preventDefault();
                if ($(this).val() == "Yes") {
                    $('.ddlyn6').show('slow');
                   
                    $('.ddlyn6 .frm').val('').removeAttr('disabled');
                    $('.ddlyn6 .good').html('<option>Good</option><option>Repairable</option><option>Major</option><option>Minor</option>');
                    $('.ddlyn6 .yn').html('<option>Yes</option><option>No</option>'); $('.ddlyn6 .Integer').val('0');
                }
                else {
                    $('.ddlyn6 .frm').val('').attr('disabled', 'disabled');
                    $('.ddlyn6 .Integer').val('0');
                    $('.ddlyn6').hide('slow');
                    $('.ddlyn6 .good').html('<option></option>');
                    $('.ddlyn6 .yn').html('<option></option>');
                }
            });
            $(function () {
                $('.Integer').val('0');
            });
            //======================
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=47ǁ",
                    success: function (response) {
                        //alert(response);
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlDSUList').html(opt);

                        LoadAllCompanies();
                    }
                });
            });
            $('#ddlDSUList').live('change', function () {
                LoadAllCompanies();
            });

            function LoadAllCompanies() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ3ǁ" + $('#ddlDSUList').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlCompany').html(opt);
                        LoadDoctorsList();
                    }
                });
            }
            $('#ddlCompany').live('change', function (e) { e.preventDefault(); LoadDoctorsList(); });

            $('.dtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });
            ///////////////////////////////////////


            $('#btnExcel').live('click', function (e) {
                e.preventDefault();
                $('#tblJl').tableExport({ type: 'excel', escape: 'false' });
                e.preventDefault();
            });
            $('#btnWord').live('click', function (e) {
                e.preventDefault();
                $('#tblJl').tableExport({ type: 'doc', escape: 'false' });
                e.preventDefault();
            });
            $('#btnPNG').live('click', function (e) {
                e.preventDefault();
                $('#tblJl').tableExport({ type: 'png', escape: 'false' });
                e.preventDefault();
            });

            $('.vdelete').live('click', function (e) {
                e.preventDefault();
                var $thisID = $(this).parent().parent().parent().attr('tag');
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=6ǁ" + $thisID,
                    success: function (response) {
                        LoadDoctorsList();
                        alertR('Record Deleted..!');
                    }
                });
            });

            $('.vedit').live('click', function (e) {
                e.preventDefault();
                var $thisID = $(this).parent().parent().parent().attr('tag');
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=7ǁ" + $thisID,
                    success: function (response) {
                        var jData = $.parseJSON(response);

                        var row = jData[0];
                        var keysbyindex = Object.keys(row);

                        $('.frm').each(function (index, element) {
                            $(this).val(row[keysbyindex[index]]);
                        });
                        $('#btnSave').html('Update');
                        $('#toTop').click();
                    }
                });
            });
            function LoadDoctorsList() {
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=5ǁ" + $('#ddlCompany').val(),
                    success: function (response) {
                        if ($('#tblJl').hasClass('dataTable')) {
                            $('#tblJl').dataTable().fnDestroy();
                        }
                        $('#tblContainer').html(response);
                        $($('#tblJl thead tr th')[0]).css('width', '50px');
                        $('#tblJl tbody tr').each(function (index, element) {
                            $($(this).find('td')[0]).html(parseInt(index) + 1);
                        });
                        $('#tblJl thead tr').append('<th></th>');
                        $('#tblJl tbody tr').append('<td style="width: 50px;"><div class="controls center">\
                                                    <span class="vedit icon12 icomoon-icon-pencil" title="Edit"></span>\
                                                    <span class="vdelete icon12 icomoon-icon-remove" title="Delete"></span>\
                                                </div></td>');
                        $('#tblJl').append('<tfoot></tfoot>');
                        $('#tblJl tfoot').html($('#tblJl thead').html());
                        $('#tblJl tfoot tr').attr("style", "border-bottom: 1px solid #c4c4c4;border-right: 1px solid #c4c4c4;");
                        $('#tblJl').addClass('dynamicTable');
                        $('#tblJl tfoot th').each(function () {
                            var title = $(this).text();
                            if ($.trim(title) != "") {
                                $(this).html('<input type="text" style="width:90%;" placeholder="' + title + '" />');
                            }

                        });

                        var table = $('#tblJl').DataTable({
                            "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
                            "iDisplayLength": 10,
                            "sPaginationType": "full_numbers",
                            "bJQueryUI": false,
                            "bAutoWidth": false,
                            "bLengthChange": true,
                            "fnInitComplete": function (oSettings, json) {
                                $('.dataTables_filter>label>input').attr('id', 'search');
                            }
                        });
                        table.columns().every(function () {
                            var that = this;

                            $('input', this.footer()).live('keyup change', function () {
                                if (that.search() !== this.value) {
                                    that
                                        .search(this.value)
                                        .draw();
                                }
                            });
                        });

                        $('#tblJl_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');


                    }
                });
            }

            $('#ddlCompany').live('change', function (e) {

                e.preventDefault();
                LoadDoctorsList();
            });
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                //$('.clr').css('background', 'red');
                $('.clr').val('');
                $('.Integer').val('0');
                $('#btnSave').html('Submit Form').val('0');
                // $("#chkStatus").iButton("checked");

            });

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#ddlDSUList').val() == "" || $('#ddlDSUList').val() == null || $('#ddlDSUList').val() == undefined) {
                    alertR('Please Select Valid DSU..!');
                    return false;
                }
                if ($('#ddlCompany').val() == "" || $('#ddlCompany').val() == null || $('#ddlCompany').val() == undefined) {
                    alertR('Please Select Valid Entry..!');
                    return false;
                }

                if ($('#txtTehsil').val() == "") {
                    alertR('Please Select Valid Tehsil..!');
                    return false;
                }
                if ($('#txtDated').val() == "") {
                    alertR('Please Select Valid Date..!');
                    return false;
                }
                var val = '';
                $('.frm').each(function (index, element) {
                    val += $(this).val() + "½";
                });
                //val += $("#chkStatus").attr("checked") ? 1 : 0;
                val += $("#chkStatus").val();
                //alert(val);
                //$('.frm').css('background', 'red');
                val = encodeURIComponent(val);
                var formDta = new FormData();
                formDta.append("ourformData", val);
                var choice = {};
                choice.url = "MonitoringGH.ashx/?ID=4ǁ";
                choice.type = "POST";
                choice.data = formDta;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (result) {
                    alertG("Record Saved..!");
                    LoadDoctorsList();
                    $('.clr').val('');
                    $('.Integer').val('0');
                    $('#btnSave').html('Save').val('0');
                };
                choice.error = function (err) {
                    alertR(err.statusText);
                };
                $.ajax(choice);
            });


        });//end of doc ready


    </script>
</asp:Content>
