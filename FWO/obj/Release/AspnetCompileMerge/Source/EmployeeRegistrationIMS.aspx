<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="EmployeeRegistrationIMS.aspx.cs" Inherits="FRDP.EmployeeRegistrationIMS" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        select {
            width: 205px;
        }

        .ajax__fileupload_selectFileButton {
            background-color: #175DAD;
            color: #FFFFFF;
        }

        select[name=tblEmpList_length] {
            /* width: 150px; */
            width: 62px !important;
        }

        #tblEmpList_length {
            margin-right: 32px;
        }

        #tblEmpList_filter {
            margin-left: 22px;
        }
    </style>
    <div class="row-fluid">

        <div class="span12">
            <div class="page-header" style="margin-bottom: -1px; margin-top: 0px;">
                <h4>Employee Registration</h4>
            </div>
            <div id="topEmp" style="display: none" class="well well-small">
                <table>
                    <tr>
                        <td rowspan="4" style="width: 70px;">
                            <img src="images/cif.png" style="width: 100%" class="image" /></td>
                        <td id="tdNam" style="font-weight: 700; font-size: medium; padding-left: 20px;">Name</td>
                    </tr>
                    <tr>
                        <td id="tdCNIC" style="padding-left: 20px;">CNIC</td>
                    </tr>
                    <tr>
                        <td id="tdEmTp" style="padding-left: 20px;">emp type</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div style="margin-bottom: 20px;">
                <ul id="tabs" class="nav nav-tabs gradient">
                    <%--                    <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
                    <li><a href="#profile" data-toggle="tab">Profile</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#dropdown1" data-toggle="tab">@fat</a></li>
                            <li><a href="#dropdown2" data-toggle="tab">@mdo</a></li>
                        </ul>
                    </li>--%>

                    <li class="active"><a href="#tabs-1" data-toggle="tab">Personnel Details</a></li>

                    <li><a href="#tabs-3" data-toggle="tab">Academic Qualifications</a></li>
                    <li style="display: none;"><a href="#tabs-4" data-toggle="tab">Professional Qualification</a></li>
                    <li><a href="#tabs-2" data-toggle="tab">Financial Details</a></li>
                    <li><a href="#tabs-5" data-toggle="tab">Experience</a></li>
                    <li><a href="#tabs-6" data-toggle="tab">Picture & Documents</a></li>
                    <li><a href="#tabs-7" data-toggle="tab">Training Details</a></li>


                </ul>

                <div class="tab-content">
                    <%--                    <div class="tab-pane fade in active" id="home">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. </p>
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. </p>
                    </div>
                    <div class="tab-pane fade" id="dropdown1">
                        <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. </p>
                    </div>
                    <div class="tab-pane fade" id="dropdown2">
                        <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master.</p>
                    </div>--%>
                    <div class="tab-pane fade in active" id="tabs-1">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Official Information</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <table style="width: 99%; margin-top: 3px; margin-left: 5px">
                                <tr>
                                    <td style="width: 110px">Employee ID</td>
                                    <td>

                                        <input id="txtEmpNo" readonly="readonly" type="text" style="width: 190px;" />
                                        <input id="txtENo" class="pr Integer" readonly="readonly" type="text" style="width: 190px; display: none;" />
                                    </td>
                                    <td></td>
                                    <td style="width: 130px;">Service Type</td>
                                    <td>
                                        <select class="pr">
                                            <option>Regular</option>
                                            <option>Sacked</option>
                                            <option>Daily-Wager</option>
                                            <option>Contract</option>
                                            <option>Volunteer</option>
                                            <option>Deputation</option>
                                            <option>Internee</option>
                                            <option>Project Base</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Office Type</td>
                                    <td>
                                        <select id="ddlCompanyType" class="pr">
                                            <option value="1">Head Office</option>
                                            <option value="2">Co-Ordination Office</option>
                                            <option value="3">Field Office</option>
                                            <option value="6">School</option>
                                        </select></td>
                                    <td></td>
                                    <td>
                                        <label class="form-label span3 clsHelper" for="normal" style="display: none;">Select DSU</label></td>
                                    <td>
                                        <select id="ddlDSUList" class="pr clsHelper" style="display: none;"></select></td>
                                </tr>
                                <tr>
                                    <td>Appointment </td>
                                    <td>
                                        <select id="ddlCompany" class="pr"></select></td>
                                    <td></td>
                                    <td>Group</td>
                                    <td>
                                        <select id="ddlGroup" class="pr">
                                            <option></option>

                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Department</td>
                                    <td>
                                        <select id="ddlDept" class="pr"></select></td>
                                    <td></td>
                                    <td>Designation</td>
                                    <td>
                                        <select id="ddlDesignation" class="pr"></select></td>
                                </tr>
                                <tr>
                                    <td>BPS</td>
                                    <td>
                                        <select id="ddlBPS" class="pr">
                                            <option value="1">BPS-1</option>
                                            <option value="2">BPS-2</option>
                                            <option value="3">BPS-3</option>
                                            <option value="4">BPS-4</option>
                                            <option value="5">BPS-5</option>
                                            <option value="6">BPS-6</option>
                                            <option value="7">BPS-7</option>
                                            <option value="8">BPS-8</option>
                                            <option value="9">BPS-9</option>
                                            <option value="10">BPS-10</option>
                                            <option value="11">BPS-11</option>
                                            <option value="12">BPS-12</option>
                                            <option value="13">BPS-13</option>
                                            <option value="14">BPS-14</option>
                                            <option value="15">BPS-15</option>
                                            <option value="16">BPS-16</option>
                                            <option value="17">BPS-17</option>
                                            <option value="18">BPS-18</option>
                                            <option value="19">BPS-19</option>
                                            <option value="20">BPS-20</option>
                                            <option value="21">BPS-21</option>
                                            <option value="22">BPS-22</option>
                                            <option value="0">N/A</option>
                                        </select></td>
                                    <td></td>
                                    <td>Shift</td>
                                    <td>
                                        <select id="ddlShift" class="pr">
                                            <option value="1">Morning</option>
                                            <option value="2">Evening</option>
                                            <option value="3">Night</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Basic Pay</td>
                                    <td><input type="text" value="0" class="pr Integer" id="basicpay" style="width: 190px;" /></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>



                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Personnel Details</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <table style="width: 99%; margin-top: 3px; margin-left: 5px">

                                <tr>
                                    <td style="width: 110px"><strong>First Name</strong></td>
                                    <td>
                                        <input id="txtFrName" maxlength="30" tag="0" type="text" style="width: 190px" class="pr Alpha" /></td>
                                    <td></td>
                                    <td style="width: 130px;"><strong>Last Name</strong></td>
                                    <td>
                                        <input id="txtLName" maxlength="30" type="text" style="width: 190px" class="pr Alpha" /></td>
                                </tr>
                                <tr>
                                    <td>Father Name
                                    </td>
                                    <td>
                                        <input type="text" maxlength="30" style="width: 190px" class="pr Alpha" /></td>
                                    <td></td>
                                    <td>C.N.I.C No</td>
                                    <td>
                                        <asp:TextBox ID="txtCNIC" runat="server" ClientIDMode="Static" CssClass="pr" Width="190px"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="txtCNIC_MaskedEditExtender" runat="server" Century="2000" ClearTextOnInvalid="True" ClientIDMode="Static" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" Mask="99999-9999999-9" PromptCharacter=" " TargetControlID="txtCNIC" ClearMaskOnLostFocus="False">
                                        </asp:MaskedEditExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Marital Status</td>
                                    <td>
                                        <select class="pr">
                                            <option>Single</option>
                                            <option>Married</option>
                                            <option>Widowed</option>
                                            <option>Divorced</option>
                                        </select></td>
                                    <td></td>
                                    <td>Gender</td>
                                    <td>
                                        <select id="ddGender" class="pr">
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Date of Birth</strong></td>
                                    <td>
                                        <asp:TextBox ID="txtDoB" runat="server" ClientIDMode="Static" Width="190px" placeholder="dd MMMM yyyy" CssClass="pr"></asp:TextBox>
                                        <asp:CalendarExtender ID="txtDoB_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtDoB" Format="dd MMMM yyyy">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td></td>
                                    <td>Religion</td>
                                    <td>
                                        <select id="ddReligion" class="pr">
                                            <option>Islam</option>
                                            <option>Hindu</option>
                                            <option>Christian</option>
                                            <option>Sikh</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Nationality</td>
                                    <td>
                                        <select id="ddNationality" class="pr">
                                            <option>Pakistani</option>
                                            <option>Afghani</option>
                                        </select></td>
                                    <td>&nbsp;</td>
                                    <td>District of Domicile</td>
                                    <td>
                                        <asp:DropDownList ID="ddDomicile" runat="server" DataSourceID="dsDistt" DataTextField="LocName" DataValueField="LocID" CssClass="pr">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsDistt" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT DistrictID LocID, LocName FROM TblDistrict order by LocName"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Contact Details</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <table style="width: 99%; margin-top: 3px; margin-left: 5px">
                                <tr>
                                    <td style="width: 110px">Mobile #</td>
                                    <td>
                                        <input type="text" maxlength="11" style="width: 190px" class="pr Integer" /></td>
                                    <td></td>
                                    <td style="width: 130px;">Res. Phone #</td>
                                    <td>
                                        <input type="text" maxlength="11" style="width: 190px" class="pr Integer" /></td>
                                </tr>
                                <tr>
                                    <td>Office Phone #</td>
                                    <td>
                                        <input type="text" maxlength="11" style="width: 190px" class="pr Integer" /></td>
                                    <td></td>
                                    <td>Email</td>
                                    <td>
                                        <input type="text" style="width: 190px" class="pr" /></td>
                                </tr>
                                <tr>
                                    <td>District</td>
                                    <td>
                                        <asp:DropDownList ID="ddDistrict" runat="server" DataSourceID="dsDistt" DataTextField="LocName" DataValueField="LocName" CssClass="pr ddDist">
                                        </asp:DropDownList>
                                    </td>
                                    <td></td>
                                    <td>City</td>
                                    <td>
                                        <asp:DropDownList ID="ddCity" runat="server" DataSourceID="dsCity" DataTextField="LocName" DataValueField="LocName" CssClass="pr ddCit">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_SelectCities" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddDistrict" DefaultValue="1" Name="District" PropertyName="SelectedValue" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td colspan="4">
                                        <input id="txtAddress" type="text" style="width: 78%" class="pr" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Family Details</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <table style="width: 99%; margin-top: 3px; margin-left: 5px">
                                <tr>
                                    <td style="width: 110px">Spouse Name</td>
                                    <td>
                                        <input type="text" maxlength="30" style="width: 190px" class="pr Alpha" /></td>
                                    <td></td>
                                    <td style="width: 130px;">Spouse's Occupation</td>
                                    <td>
                                        <select id="ddOccupation" class="pr">
                                            <option>N/A</option>
                                            <option>Govt.</option>
                                            <option>Teacher</option>
                                            <option>Business</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Spouse&#39;s CNIC</td>
                                    <td>
                                        <asp:TextBox ID="txtCNIC0" runat="server" ClientIDMode="Static" CssClass="pr" Width="190px"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="txtCNIC0_MaskedEditExtender" runat="server" Century="2000" ClearTextOnInvalid="True" ClientIDMode="Static" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" Mask="99999-9999999-9" PromptCharacter=" " TargetControlID="txtCNIC0">
                                        </asp:MaskedEditExtender>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>Mobile #</td>
                                    <td>
                                        <input type="text" style="width: 190px" class="pr" /></td>
                                </tr>
                                <tr>
                                    <td>No of Dependents</td>
                                    <td>
                                        <input type="text" style="width: 190px" class="pr" /></td>
                                    <td></td>
                                    <td>Email</td>
                                    <td>
                                        <input type="text" style="width: 190px" class="pr" /></td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="text-align: right;">
                            <input id="btnSvPersonnel" class="btn btn-info" type="button" value="Save Personnel Details" />&nbsp;<input id="btnCancel" class="btn" type="button" value="Cancel" />

                        </div>

                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Registered Employees</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <br />
                            <table id="tblEmpList" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                                <thead>
                                    <tr>
                                        <th>Employee No</th>
                                        <th>Name</th>
                                        <th>CNIC</th>
                                        <th>Cell#</th>
                                        <th>Office</th>
                                        <th>Department</th>
                                        <th>Designation</th>
                                        <th>Service Type</th>
                                        <th style="width: 52px;"></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr style="border-bottom: 1px solid #c4c4c4;">
                                        <th>Employee No</th>
                                        <th>Name</th>
                                        <th>CNIC</th>
                                        <th>Cell#</th>
                                        <th>Office</th>
                                        <th>Department</th>
                                        <th>Designation</th>
                                        <th>Service Type</th>
                                        <th style="width: 52px;"></th>
                                    </tr>
                                </tfoot>
                                <tbody></tbody>
                            </table>
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabs-2">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Financial Details</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <table style="width: 99%; margin-top: 3px; margin-left: 5px">
                                <tr style="display: none;">
                                    <td style="width: 110px">Personal No</td>
                                    <td>
                                        <input type="text"  style="width: 190px" class="fi" /></td>
                                    <td></td>
                                    <td>Vender No.</td>
                                    <td>
                                        <input type="text"  value="0"  style="width: 190px" class="fi" /></td>
                                </tr>
                                <tr>
                                    <td>NTN #</td>
                                    <td>
                                        <input type="text"  style="width: 190px" class="fi" /></td>
                                    <td>&nbsp;</td>
                                    <td style="display:none;">Salary</td>
                                    <td style="display:none;">
                                        <input id="txtReg" type="text"  style="width: 190px" class="fi" /></td>
                                </tr>
                                <tr style="display:none;">
                                    <td>Basic Pay</td>
                                    <td>
                                        <input type="text"    style="width: 190px" class="fi numeric" /></td>
                                    <td ></td>
                                    <td>Grass Pay</td>
                                    <td>
                                        <input type="text"    style="width: 190px" class="fi numeric" /></td>
                                </tr>
                                <tr style="display:none;">
                                    <td>Net Pay</td>
                                    <td>
                                        <input type="text"   style="width: 190px" class="fi numeric" /></td>
                                    <td></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Bank</td>
                                    <td colspan="4">
                                        <select id="ddlBank" class="fi" name="D1">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Bank Branch</td>
                                    <td>
                                        <input type="text" style="width: 190px" class="fi" /></td>
                                    <td></td>
                                    <td>Bank Account No.</td>
                                    <td>
                                        <input type="text" style="width: 190px" class="fi" /></td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="text-align: center;">
                            <input id="btnSvFinancial" class="btn btn-info" type="button" value="Save Financial Details" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabs-5">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">
                                &nbsp;Employee Experience
                            </div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <div style="margin-top: 5px; margin-bottom: 5px; float: left; margin-right: 7px;">
                                <strong>Date of Appointment :</strong>
                                <asp:TextBox ID="txtAppoint" runat="server" ReadOnly="true" ClientIDMode="Static" Width="150px" BackColor="Transparent" placeholder="dd/mm/yyyy" CssClass="pr" Text="01/01/2010"></asp:TextBox>
                                <%--<asp:CalendarExtender ID="clAppoint" runat="server" Enabled="True" Format="dd/mm/yyyy" TargetControlID="txtAppoint">
                                </asp:CalendarExtender>--%>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Date of Joining :</strong>
                                <asp:TextBox ID="txtJin" runat="server" ReadOnly="true" ClientIDMode="Static" Width="150px" BackColor="Transparent" placeholder="dd/mm/yyyy" CssClass="pr" Text="01/01/2010"></asp:TextBox>
                                <%--<asp:CalendarExtender ID="clJibn" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txtJin"></asp:CalendarExtender>--%>
                            </div>
                            <div class="btnSVDts GrdB cBtn">
                                <div class="imgBtn">
                                    <img alt="" src="images/Add.png" />
                                </div>
                                <div class="tBtn">Save Info.</div>
                            </div>
                            <div>
                                <br />
                                <div class="container postdtl">
                                    <div class="table-row head">
                                        <div class="col">BPS</div>
                                        <div class="col">Post</div>
                                        <div class="col">Institute/Office</div>
                                        <div class="col">Deportment</div>
                                        <div class="col">From Date</div>
                                        <div class="col">To Date</div>
                                        <div class="col">Posting Category</div>
                                    </div>
                                </div>
                                <br />
                                <div class="btnAddP GrdB cBtn">
                                    <div class="imgBtn">
                                        <img alt="" src="images/Add.png" />
                                    </div>
                                    <div class="tBtn">Add New Posting</div>
                                </div>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabs-4">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">
                                &nbsp;Professional Qualification
                            </div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <div>
                                <br />
                                <div class="container AcQ2">
                                    <div class="table-row head">
                                        <div class="col">Degree/Certificate </div>
                                        <div class="col">Subject I</div>
                                        <div class="col">Subject II</div>
                                        <div class="col">Subject III</div>
                                        <div class="col">Date of Completion</div>
                                        <div class="col">Board/University</div>
                                        <div class="col">Division/Grade/CGPA</div>
                                    </div>
                                </div>
                                <br />
                                <div class="btnAddEQ GrdB cBtn">
                                    <div class="imgBtn">
                                        <img alt="" src="images/Add.png" />
                                    </div>
                                    <div class="tBtn">Add New Degree/Certificate</div>
                                </div>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabs-3">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">
                                &nbsp;Academic Qualifications
                            </div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <div>
                                <br />
                                <div class="container AcQ1">
                                    <div class="table-row head">
                                        <div class="col">Degree/Certificate </div>
                                        <div class="col">Majors</div>
                                        <div class="col">Date of Completion</div>
                                        <div class="col">Board/University</div>
                                        <div class="col">Division/Grade/CGPA</div>
                                    </div>
                                </div>
                                <br />
                                <div class="btnAddE GrdB cBtn">
                                    <div class="imgBtn">
                                        <img alt="" src="images/Add.png" />
                                    </div>
                                    <div class="tBtn">Add New Degree/Certificate</div>
                                </div>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabs-6">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Upload Profile Picture</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" OnUploadComplete="AjaxFileUpload1_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVals" OnClientUploadComplete="getPic" />

                        <br />
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Documents</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <asp:AjaxFileUpload ID="AjaxUploadAttech" runat="server" OnUploadComplete="AjaxUploadAttech_UploadComplete" ClientIDMode="Static" OnClientUploadStart="getVal" OnClientUploadComplete="getDocs" />
                        <br />

                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">&nbsp;Documents</div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div id="Docs" style="margin-top: 7px"></div>
                    </div>
                    <div class="tab-pane fade" id="tabs-7">
                        <div class="tab0">
                            &nbsp;<div class="tab1" style="float: left">
                                &nbsp;Training Details
                            </div>
                            <div class="tab2">&nbsp;</div>
                        </div>
                        <div>
                            <div>
                                <br />
                                <div class="container dvTrain">
                                    <div class="table-row head">
                                        <div class="col">Training Title</div>
                                        <div class="col">From Date </div>
                                        <div class="col">Duration(Days)</div>
                                        <div class="col">Training Area</div>
                                        <div class="col">Training Agency</div>
                                        <div class="col">Venue</div>
                                        <div class="col">City</div>
                                        <div class="col">Country</div>
                                    </div>
                                </div>
                                <br />
                                <div class="btnAddT GrdB cBtn">
                                    <div class="imgBtn">
                                        <img alt="" src="images/Add.png" />
                                    </div>
                                    <div class="tBtn">Add New Training</div>
                                </div>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <!-- End .span12 -->
    </div>
    <%--End Row Fluid--%>

    <div id="dvAddPost" class="Dlg" title="Experience Posting / Transfer" style="display: none">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">
                &nbsp;Experience Detail of Posting / Transfer
            </div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="width: 99%; margin-top: 3px; margin-left: 5px">

                <tr>
                    <td>BPS</td>
                    <td>
                        <%--                        <input type="text" class="numeric pt" style="width: 70px" maxlength="2" />--%>

                        <select class="pt">
                            <option>BPS-1</option>
                            <option>BPS-2</option>
                            <option>BPS-3</option>
                            <option>BPS-4</option>
                            <option>BPS-5</option>
                            <option>BPS-6</option>
                            <option>BPS-7</option>
                            <option>BPS-8</option>
                            <option>BPS-9</option>
                            <option>BPS-10</option>
                            <option>BPS-11</option>
                            <option>BPS-12</option>
                            <option>BPS-13</option>
                            <option>BPS-14</option>
                            <option>BPS-15</option>
                            <option>BPS-16</option>
                            <option>BPS-17</option>
                            <option>BPS-18</option>
                            <option>BPS-19</option>
                            <option>BPS-20</option>
                            <option>BPS-21</option>
                            <option>BPS-22</option>
                            <option>N/A</option>
                        </select></td>
                    <td>&nbsp;</td>
                    <td>Post</td>
                    <td>
                        <%--                        <asp:DropDownList ID="ddPost" runat="server" DataSourceID="dsPost" DataTextField="Post" DataValueField="Post" Width="150px" CssClass="pt" ClientIDMode="Static">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsPost" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Post FROM tblEmpService GROUP BY Post"></asp:SqlDataSource>--%>
                        <input id="ddPost" class="pt" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>From Date</td>
                    <td>
                        <asp:TextBox ID="txtfr" runat="server" ClientIDMode="Static" Width="207px" placeholder="dd MMMM yyyy" CssClass="pt"></asp:TextBox>
                        <asp:CalendarExtender ID="txtfr_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtfr" Format="dd MMMM yyyy">
                        </asp:CalendarExtender>
                    </td>
                    <td>&nbsp;</td>
                    <td>To Date</td>
                    <td>
                        <asp:TextBox ID="txtTo" runat="server" ClientIDMode="Static" Width="207px" placeholder="dd MMMM yyyy" CssClass="pt"></asp:TextBox>
                        <asp:CalendarExtender ID="txtTo_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtTo" Format="dd MMMM yyyy">
                        </asp:CalendarExtender>
                    </td>
                </tr>

                <tr>
                    <td><strong>Office</strong></td>
                    <td>
                        <input id="ddCampus" type="text" class="pt" />
                        <%--<asp:DropDownList ID="ddCampus" runat="server" DataSourceID="dsCampus" DataTextField="CampusName" DataValueField="CampusID" ClientIDMode="Static" CssClass="pt" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCampus" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyID CampusID, CompanyName CampusName FROM tbl_Company ORDER BY CampusName"></asp:SqlDataSource>--%>
                    </td>
                    <td>&nbsp;</td>
                    <td><strong>Department</strong></td>
                    <td>
                        <input id="ddDepot" type="text" class="pt" />
                        <%-- <asp:DropDownList ID="ddDepot" runat="server" DataSourceID="dsDepot" DataTextField="Deport" DataValueField="Deport" ClientIDMode="Static" CssClass="pt" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsDepot" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Deport FROM tblEmpService GROUP BY Deport"></asp:SqlDataSource>--%>
                    </td>
                </tr>
                <tr>
                    <td>Posting Category</td>
                    <td>
                        <select class="pt">
                            <option>Dpt. Promotion</option>
                            <option>Direct Selection</option>
                            <option>Temporary Duty</option>
                            <option>Deputation</option>
                        </select></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <input id="btnPT" class="btn btn-info" type="button" value="Save Record" />
                        <input class="btn btnC" type="button" value="Close" /></td>
                </tr>
            </table>
        </div>
    </div>
    <div id="dvAddTrn" class="Dlg" title="Training" style="display: none">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">
                &nbsp;Training Detail
            </div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="width: 99%; margin-top: 3px; margin-left: 5px">
                <tr>
                    <td style="width: 120px">Training Title</td>
                    <td style="width: 120px">
                        <input id="txtTrn" type="text" style="width: 200px" class="trn" /></td>
                    <td style="width: 60px">&nbsp;</td>
                    <td style="width: 120px">Duration(Days)</td>
                    <td>
                        <input id="txtDuration" class="numeric trn" type="number" style="width: 80px" /></td>
                </tr>
                <tr>
                    <td style="width: 120px">From Date</td>
                    <td style="width: 120px">
                        <asp:TextBox ID="dpFrm" runat="server" ClientIDMode="Static" Width="190px" placeholder="dd MMMM yyyy" CssClass="trn"></asp:TextBox>
                        <asp:CalendarExtender ID="dpFrm_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="dpFrm">
                        </asp:CalendarExtender>
                    </td>
                    <td style="width: 60px">&nbsp;</td>
                    <td style="width: 120px">Training Area</td>
                    <td>
                        <input type="text" style="width: 200px" class="trn" /></td>
                </tr>
                <tr>
                    <td style="width: 120px">Training Agency</td>
                    <td style="width: 120px">
                        <input type="text" style="width: 200px" class="trn" /></td>
                    <td style="width: 60px">&nbsp;</td>
                    <td style="width: 120px">Venue</td>
                    <td>
                        <input type="text" style="width: 200px" class="trn" /></td>
                </tr>
                <tr>
                    <td style="width: 120px">City</td>
                    <td style="width: 120px">
                        <input type="text" style="width: 200px" class="trn" /></td>
                    <td style="width: 60px">&nbsp;</td>
                    <td style="width: 120px">Country</td>
                    <td>
                        <input type="text" style="width: 200px" class="trn" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td style="width: 60px">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <input id="btnSvTrnP" class="btn btn-info" type="button" value="Save Record" /></td>
                    <td>
                        <input class="btn btn-info btnC" type="button" value="Close" /></td>
                    <td style="width: 60px">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
    <div id="dvAddEdu" class="Dlg" title="Empolyee Qualifications" style="display: none">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">
                &nbsp;Qualifications
            </div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="width: 99%; margin-top: 3px; margin-left: 5px">
                <tr>
                    <td>Degree/Certificate</td>
                    <td>
                        <asp:DropDownList ID="ddDegree" runat="server" DataSourceID="dsDegree" DataTextField="Degree" DataValueField="Degree" Width="150px" CssClass="dg1" ClientIDMode="Static">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsDegree" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Degree FROM tblEmpQualifications WHERE (EduType = 1) GROUP BY Degree"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>Date of Completion</td>
                    <td>
                        <asp:TextBox ID="txtCompletion" runat="server" ClientIDMode="Static" Width="150px" placeholder="dd MMMM yyyy" CssClass="dg1"></asp:TextBox>
                        <asp:CalendarExtender ID="txtCompletion_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txtCompletion">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>Board/University</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddBoard" runat="server" DataSourceID="dsBoard" DataTextField="Board" DataValueField="Board" Width="85%" CssClass="dg1" ClientIDMode="Static">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsBoard" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Board FROM tblEmpQualifications GROUP BY Board"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Major Subject</td>
                    <td>
                        <asp:DropDownList ID="ddSbI" runat="server" DataSourceID="dsSubject" DataTextField="listTxt" DataValueField="listTxt" Width="85%" CssClass="dg1" ClientIDMode="Static">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSubject" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT id, listTxt FROM tblLists WHERE (listTyp = 'subject')"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td style="display: none;">Subject II</td>
                    <td style="display: none;">
                        <asp:DropDownList ID="ddSbI0" runat="server" DataSourceID="dsSubject" DataTextField="listTxt" DataValueField="listTxt" Width="150px" CssClass="dg1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="display: none;">Subject III</td>
                    <td style="display: none;">
                        <asp:DropDownList ID="ddSbI1" runat="server" DataSourceID="dsSubject" DataTextField="listTxt" DataValueField="listTxt" Width="150px" CssClass="dg1">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Division/Grade/CGPA</td>
                    <td colspan="2">
                        <input id="txtCGPA1" type="text" style="width: 100px" class="dg1" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <input tag="1" class="btn btn-info btnDegree" type="button" value="Save Degree" />
                        <input class="btn btn-info btnC" type="button" value="Close" /></td>
                </tr>
            </table>
        </div>
    </div>
    <div id="dvAddEduP" class="Dlg" title="Empolyee Qualifications" style="display: none">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">
                &nbsp;Qualifications
            </div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="width: 99%; margin-top: 3px; margin-left: 5px">
                <tr>
                    <td>Degree/Certificate</td>
                    <td>
                        <asp:DropDownList ID="ddDegree0" runat="server" DataSourceID="dsDegree0" DataTextField="Degree" DataValueField="Degree" Width="150px" CssClass="dg2" ClientIDMode="Static">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>Date of Completion</td>
                    <td>
                        <asp:TextBox ID="txtCD" runat="server" ClientIDMode="Static" Width="150px" placeholder="dd MMMM yyyy" CssClass="dg2"></asp:TextBox>
                        <asp:CalendarExtender ID="txtCD_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txtCD">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>Board/University</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddBoard0" runat="server" DataSourceID="dsBoard" DataTextField="Board" DataValueField="Board" Width="85%" CssClass="dg2" ClientIDMode="Static">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:SqlDataSource ID="dsDegree0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Degree FROM tblEmpQualifications WHERE (EduType = 2) GROUP BY Degree"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Subject I</td>
                    <td>
                        <asp:DropDownList ID="txtS1" runat="server" DataSourceID="dsSubject" DataTextField="listTxt" DataValueField="listTxt" Width="150px" CssClass="dg2">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>Subject II</td>
                    <td>
                        <asp:DropDownList ID="txtS2" runat="server" DataSourceID="dsSubject" DataTextField="listTxt" DataValueField="listTxt" Width="150px" CssClass="dg2">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Subject III</td>
                    <td>
                        <asp:DropDownList ID="txtS3" runat="server" DataSourceID="dsSubject" DataTextField="listTxt" DataValueField="listTxt" Width="150px" CssClass="dg2">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Division/Grade/CGPA</td>
                    <td colspan="2">
                        <input id="txtCGPA2" type="text" style="width: 100px" class="dg2" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <input tag="2" class="btn btn-info btnDegree" type="button" value="Save Degree" />
                        <input class="btn btn-info btnC" type="button" value="Close" /></td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        function getVals(sender, args) { $.cookie("asp_act", $("#txtFrName").attr('tag') + "|1"); }
        function getVal(sender, args) { $.cookie("asp_act", $("#txtFrName").attr('tag') + "|2"); }
        function getDocs(sender, args) { Docs(); }
        function getPic(sender, args) {
            //emp($("#txtFrName").attr('tag'));

            var milis = new Date();
            var mili = milis.getMilliseconds();
            $('#topEmp img').attr('src', 'Uploads/EmployeePhoto/' + $("#txtFrName").attr('tag') + 'B' + args._contentType + '?' + mili);
            //console.log(args._contentType);
        }
        function Docs() {
            $.ajax({
                url: "exeDataIMS.ashx/?ID=" + encodeURIComponent("34ǁ" + $("#txtFrName").attr('tag')),
                context: document.body,
                success: function (responseText) {
                    var jdata = $.parseJSON(responseText), optOdd = "", optEven = "";
                    $.each(jdata, function (i, item) {
                        if (i & 1) {
                            optOdd = optOdd + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt="" style="width: 24px;" />&nbsp;' + item.FileTitle + '</div>';
                        }
                        else {
                            optEven = optEven + '<div class="trDoc Grd" style="vertical-align: top;" tag="' + item.FileID + item.FileExt + '"><img src="images/' + item.FileExt.substring(1) + '1.png" alt="" style="width: 24px;" />&nbsp;' + item.FileTitle + '</div>';
                        }
                    });
                    $('#Docs').html('<div style="width: 47%; float:left">' + optEven + '</div><div style="width: 47%; float:right">' + optOdd + '</div>');
                }
            });//end ajax
        }
        function emp(eid) {
            $('#tdNam').text($("#txtFrName").val() + ' ' + $("#txtLName").val());
            $('#tdCNIC').text($("#txtCNIC").val());
            $('#tdEmTp').text($("#txtEmpNo").val());
            var milis = new Date();
            var mili = milis.getMilliseconds();
            $.ajax({
                url: 'Uploads/EmployeePhoto/' + eid + 'B.png?' + mili,
                type: 'HEAD',
                error: function () {
                    $.ajax({
                        url: 'Uploads/EmployeePhoto/' + eid + 'B.jpg?' + mili,
                        type: 'HEAD',
                        error: function () {
                            $('#topEmp img').attr('src', 'Uploads/EmployeePhoto/0.png');
                        },
                        success: function () {
                            $('#topEmp img').attr('src', 'Uploads/EmployeePhoto/' + eid + 'B.jpg?' + mili);
                        }
                    });
                    //$('#topEmp img').attr('src', 'Uploads/EmployeePhoto/0.png');
                },
                success: function () {
                    $('#topEmp img').attr('src', 'Uploads/EmployeePhoto/' + eid + 'B.png?' + mili);
                }
            });
            $('#topEmp').show('slow');
        }

        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {

            $('.Alpha').live('keyup blur', function () {
                var node = $(this);
                node.val(node.val().replace(/[^.a-z A-Z]/g, ''));
            });

            $('.ddDist').live('change', function () {
                //alert($('#<%=ddDistrict.ClientID %> option:selected').val());
                var myDropDownList = $('.ddCit');
                $.ajax({
                    type: "POST",
                    url: "EmployeeRegistrationIMS.aspx/GetCitiesList",
                    data: "{ 'District' : '" + $('#<%=ddDistrict.ClientID %> option:selected').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        myDropDownList.empty();
                        console.log(msg.d);
                        var jd = $.parseJSON(msg.d);
                        $.each(jd, function (i, itm) {
                            var OptionValue = itm.LocName;
                            var option = $("<option>" + OptionValue + "</option>");
                            option.attr("value", OptionValue);
                            myDropDownList.append(option);
                        });
                        //$.each(msg.d, function () {
                        //    //opt += '<option value="' + itm.LocName + '">' + itm.LocName + '</option>';
                        //    $(".ddCit").empty().append($("<option></option>").val(this.KeyName).html(this.ValueName));
                        //});
                    },
                    error: function () {
                        alert("An error has occurred during processing your request.");
                    }
                });
            });
            


            $('#txtAppoint,#txtJin').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });

            function loadTrain() {

            }
            $('#btnCancel').live('click', function () {
                window.location.href = "EmployeeRegistrationIMS.aspx";
            });
            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllGroups",
                    data: "{'CompanyID' : '0' }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.User_Group_Id + '"> ' + item.User_Group_Name + '</option>';
                        });
                        $('#ddlGroup').html(out);
                    }
                });
            });
            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllDepartments",
                    data: "{ 'CompanyID' : '" + $("#ddlCompany").val() + "'}",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.DepartmentID + '"> ' + item.DepartmentName + '</option>';
                        });
                        $('#ddlDept').html(out);
                    }
                });
            });
            $(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeRegistration.aspx/AllDesignation",
                    data: "{'CompanyID' : '" + $("#ddlCompany").val() + "' }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value="' + item.DesignationID + '"> ' + item.Designation + '</option>';
                        });
                        $('#ddlDesignation').html(out);
                    }
                });
            });
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
                        $('.clsHelper').hide();
                        LoadAllCompanies();
                    }
                });
            });
            //$('#ddlDSUList').live('change', function () {
            //    LoadAllCompanies();
            //});
            $('#ddlCompanyType').live('change', function (e) {
                e.preventDefault();
                //if ($(this).val() == "3") {
                //    $('.clsHelper').show();
                //}
                //else {
                //    $('.clsHelper').hide();
                //}

                LoadAllCompanies();
            });

            function LoadAllCompanies() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=53ǁ" + $('#ddlCompanyType').val() + "ǁ" + $('#ddlDSUList').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#ddlCompany').html(opt);

                        if (opt != '') {
                            LoadEmpList();
                        }
                    }
                });
            }
            function LoadEmpList() {
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=54ǁ" + $('#ddlCompany').val(),
                    success: function (response) {

                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<tr tg="' + itm.tblEmployeeID + '"><td>' + itm.EmpNo + '</td>\
                                    <td>' + itm.NAME + '</td>\
                                    <td>' + itm.CNIC + '</td>\
                                    <td>' + itm.ContactNos + '</td>\
                                    <td>' + itm.CompanyName + '</td>\
                                    <td>' + itm.DeptName + '</td>\
                                    <td>' + itm.Designamtion + '</td>\
                                    <td>' + itm.PostTyp + '</td>\
                                    <td><button tg="' + itm.tblEmployeeID + '" title="Edit" class="btnEdit btn btn-info">e</button></td>\
                                    </tr>';
                        });

                        if ($('#tblEmpList').hasClass('dataTable')) {
                            $('#tblEmpList').dataTable().fnDestroy();
                        }

                        $('#tblEmpList tbody').html(opt);

                        $('#tblEmpList').addClass('dynamicTable');

                        // Setup - add a text input to each footer cell
                        $('#tblEmpList tfoot th').each(function () {
                            var title = $(this).text();
                            if ($.trim(title) != "") {
                                $(this).html('<input type="text" placeholder="' + title + '" style="width: 90%;" />');
                            }

                        });

                        var table = $('#tblEmpList').DataTable({
                            "aLengthMenu": [[10, 25, 50, 100, 150, 250, 500, -1], [10, 25, 50, 100, 150, 250, 500, "All"]],
                            "iDisplayLength": -1,
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

                        $('#tblEmpList_filter label').append('<input type="image" name="btnExcel" id="btnExcel" title="Export to Excel" class="Grd" src="images/xcel.png" style="border-width:0px;">&nbsp;<input type="image" name="btnWord" id="btnWord" title="Export to Word" class="Grd" src="images/wrd.png" style="border-width:0px;">&nbsp;<input type="image" name="btnPNG" id="btnPNG" title="Export to PNG" class="Grd" src="images/png.png" style="width: 16px;border-width:0px;">');


                    }
                });
            }
            $('#btnExcel').live('click', function (e) {
                e.preventDefault();
                $('#tblEmpList').tableExport({ type: 'excel', escape: 'false' });
                e.preventDefault();
            });
            $('#btnWord').live('click', function (e) {
                e.preventDefault();
                $('#tblEmpList').tableExport({ type: 'doc', escape: 'false' });
                e.preventDefault();
            });
            $('#btnPNG').live('click', function (e) {
                e.preventDefault();
                $('#tblEmpList').tableExport({ type: 'png', escape: 'false' });
                e.preventDefault();
            });
            $('#ddlCompany').live('change', LoadEmpList);
            $('#btnSvFinancial').hide(); $('.cBtn').hide(); $('#ddDegree').eComboBox(); $('#ddDegree0').eComboBox(); $('#ddBoard0').eComboBox(); $('#ddBoard').eComboBox();
            $('#tabs a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
            $('.btnEdit').live('click', function (e) {
                e.preventDefault();
                var $btn = $(this);
                $("#txtFrName").attr('tag', $btn.attr('tg'));
                $('#btnSvPersonnel').val('Update');
                //$.ajax({
                //    type: "POST",
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    url: "EmployeeRegistration.aspx/LoadPreviousDataByID",
                //    data: "{ 'cnic' : '" + $btn.attr('tg') + "' }",
                //    success: function (response) {

                //        var jData = $.parseJSON(response.d);

                //        LoadEmployeeData(jData);
                //        $('#toTopHover').click();
                //    }
                //});
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=38ǁ" + $("#txtFrName").attr('tag'),
                    context: document.body,
                    success: function (responseText) {
                        var pr = ["EmpNo", "PostTyp", "OfficeType", "DSUtblCompanyID", "tblCompanyID", "User_Group_Id", "tblDept", "tblDesigID", "BPS", "tblEmpShiftID", "BPay", "FName", "LName", "Father", "CNIC", "Marital", "Gender", "DoB", "Religion", "Nationality", "Domicile", "Mobile", "RPh", "OPh", "email", "Area", "City", "Addrss", "Spouse", "SpOccu", "SoCNIC", "SpPh", "Dependent", "SpEmail", "Apoint", "Joind", "EmpStatus", "LDate"];
                        var jdata = $.parseJSON(responseText);
                        $('.pr').each(function (i, e) {
                            $(this).val(jdata[0][pr[i]]);
                        });
                        var fi = ["PNo", "VNo", "NTN", "Reg", "BPay", "GPay", "NPay", "BankID", "BCode", "BAcc"];
                        $('.fi').each(function (i, e) {
                            $(this).val(jdata[0][fi[i]]);
                        });
                        $('#txtEmpNo').val(jdata[0].ENO);
                        //emp($("#txtFrName").attr('tag'));



                        $('#topEmp img').attr('src', 'Uploads/EmployeePhoto/' + jdata[0].PhotoExtension);
                        $('#tdNam').text($("#txtFrName").val() + ' ' + $("#txtLName").val());
                        $('#tdCNIC').text($("#txtCNIC").val());
                        $('#tdEmTp').text($("#txtEmpNo").val());
                        $('#topEmp').show('slow');

                        $('#toTop').click();


                        loadQf(1);
                        //loadQf(2);
                        LoadEmployeeTrainings();
                        loadService();
                        Docs();
                        loadTrain();
                        //getSrly();
                        $('#btnSvFinancial').show();
                        $('.cBtn').show();
                    }
                });
            });
            function loadQf(typ) {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=39ǁ" + encodeURIComponent($("#txtFrName").attr('tag') + "ǁ" + typ),
                    context: document.body,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText);
                        $.each(jdata, function (i, item) {
                            //   $('.AcQ' + typ).append('<div class="table-row Grd"><div class="col">' + item.Degree + '</div><div class="col">' + item.Subject1 + '</div><div class="col">' + item.Subject2 + '</div><div class="col">' + item.Subject3 + '</div><div class="col">' + item.Completion + '</div><div class="col">' + item.Board + '</div><div class="col">' + item.CGPA + '</div></div>');
                            $('.AcQ' + typ).append('<div class="table-row Grd"><div class="col">' + item.Degree + '</div><div class="col">' + item.Subject1 + '</div><div class="col">' + item.Completion + '</div><div class="col">' + item.Board + '</div><div class="col">' + item.CGPA + '</div></div>');
                        });
                    }
                });
            }
            function LoadEmployeeTrainings() {
                $('.dvTrain').html('<div class="table-row head">\
                                <div class="col">Training Title</div>\
                                <div class="col">From Date </div>\
                                <div class="col">Duration(Days)</div>\
                                <div class="col">Training Area</div>\
                                <div class="col">Training Agency</div>\
                                <div class="col">Venue</div>\
                                <div class="col">City</div>\
                                <div class="col">Country</div>\
                            </div>');
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=41ǁ" + encodeURIComponent($("#txtFrName").attr('tag')),
                    context: document.body,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText);
                        $.each(jdata, function (i, item) {

                            $('.dvTrain').append('<div class="table-row Grd"><div class="col">' + item.Training + '</div><div class="col">' + item.FDate + '</div><div class="col">' + item.Duration + '</div><div class="col">' + item.TrainArea + '</div><div class="col">' + item.Agency + '</div><div class="col">' + item.Venue + '</div><div class="col">' + item.City + '</div><div class="col">' + item.Country + '</div></div>');
                        });
                    }
                });
            }
            function loadService() {
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=40ǁ" + encodeURIComponent($("#txtFrName").attr('tag')),
                    context: document.body,
                    success: function (responseText) {
                        var jdata = $.parseJSON(responseText);
                        var rows = "";
                        $.each(jdata, function (i, item) {
                            rows = rows + '<div class="table-row Grd eService" tag="' + item.ServiceID + '"><div class="col">' + item.BPS + '</div><div class="col">' + item.Post + '</div><div class="col">' + item.Name + '</div><div class="col">' + item.Deport + '</div><div class="col">' + item.FDate + '</div><div class="col">' + item.TDate + '</div><div class="col">' + item.Cat + '</div></div>';
                        });
                        $('.postdtl').html('<div class="table-row head"><div class="col">BPS</div><div class="col">Post</div><div class="col">Office</div><div class="col">Department</div><div class="col">From Date</div><div class="col">To Date</div><div class="col">Posting Category</div></div>' + rows);
                    }
                });
            }

            //function getSrly() {
            //    $.ajax({
            //        url: "exeDataIMS.ashx/?ID=111" + encodeURIComponent("ǁ" + $("#txtFrName").attr('tag')),
            //        context: document.body,
            //        success: function (responseText) {
            //            var lstF = "";
            //            var jdata = $.parseJSON(responseText);
            //            $.each(jdata.row, function (i, item) {
            //                lstF = lstF + '<div class="table-row Grd"><div class="col lt">' + item.SrlyNam + '</div><div class="col rt">' + $.number(item.SrlyAmt, 0) + '</div><div class="col"><img tag="' + item.ESrlyID + '" class="DelFee" src="images/close.ico" /></div></div>';
            //            });
            //            $('.dvSsrly').html(lstF); $('#srTotal').html($.number(jdata.totl, 0));
            //        }
            //    });
            //}
            $(function () {
                $('#tabs').tabs({
                    show: {
                        effect: "slide",
                        duration: 500,
                        direction: "up"
                    },
                    hide: {
                        effect: "drop",
                        duration: 500,
                        direction: "down"
                    }
                });
                $('#tabs').show('slow');
            });
            $('.tab1:nth(3)').parent().next().hide('slow'); $('.tab1:nth(2)').parent().next().hide('slow'); $('.tab1:nth(7)').parent().next().hide('slow'); $('.tab1:nth(9)').parent().next().hide('slow');
            $('#dvAddPost').dialog({
                autoOpen: false,
                height: 360,
                width: 650,
                modal: true,
                show: {
                    effect: "clip",
                    duration: 500
                },
                hide: {
                    effect: "clip",
                    duration: 500
                }
            }); $('#dvAddEdu').dialog({
                autoOpen: false,
                height: 410,
                width: 700,
                modal: true,
                show: {
                    effect: "clip",
                    duration: 500
                },
                hide: {
                    effect: "clip",
                    duration: 500
                }
            }); $('#dvAddEduP').dialog({
                autoOpen: false,
                height: 310,
                width: 700,
                modal: true,
                show: {
                    effect: "clip",
                    duration: 500
                },
                hide: {
                    effect: "clip",
                    duration: 500
                }
            }); $('#dvAddTrn').dialog({
                autoOpen: false,
                height: 330,
                width: 730,
                modal: true,
                show: {
                    effect: "clip",
                    duration: 500
                },
                hide: {
                    effect: "clip",
                    duration: 500
                }
            });
            $(".btnC").live('click', function (e) { $('.Dlg').dialog('close'); });
            $(".btnAddP").live('click', function (e) {
                $('#dvAddPost').dialog('open');
            }); $(".btnAddT").live('click', function (e) {
                $('#dvAddTrn').dialog('open');
            });
            $(".btnAddE").live('click', function (e) {
                $('#dvAddEdu').dialog('open');
            });
            $(".btnAddEQ").live('click', function (e) {
                $('#dvAddEduP').dialog('open');
            });
            $(".trDoc").live('click', function (e) {
                document.location = "exeDataIMS.ashx/?ID=" + encodeURIComponent("114ǁ" + $(this).text() + "ǁEmp/" + $(this).attr('tag'));
            });

            $("#btnSvTrnP").live('click', function (e) {
                var Data = [];
                Data[0] = "37";
                $('.trn').each(function () {
                    Data.push($(this).val());
                });
                Data.push($("#txtFrName").attr('tag'));
                //$('#TB_overlay').show();
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                    context: document.body,
                    success: function (responseText) {
                        //$('#TB_overlay').hide();
                        $('.dvTrain').append('<div class="table-row Grd"><div class="col">' + Data[1] + '</div><div class="col">' + Data[3] + '</div><div class="col">' + Data[2] + '</div><div class="col">' + Data[4] + '</div><div class="col">' + Data[5] + '</div><div class="col">' + Data[6] + '</div><div class="col">' + Data[7] + '</div><div class="col">' + Data[8] + '</div></div>');
                        $('.trn').each(function () {
                            $(this).val('');
                        });
                        $('.Dlg').dialog('close');
                    }
                });
            });
            $("#btnPT").live('click', function (e) {
                var Data = [];
                Data[0] = "36";
                $('.pt').each(function () {
                    Data.push($(this).val());
                });
                Data.push($("#txtFrName").attr('tag'));
                //$('#TB_overlay').show();
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                    context: document.body,
                    success: function (responseText) {
                        //$('#TB_overlay').hide();
                        $('.postdtl').append('<div class="table-row Grd"><div class="col">' + Data[1] + '</div><div class="col">' + Data[2] + '</div><div class="col">' + $('#ddCampus').val() + '</div><div class="col">' + Data[6] + '</div><div class="col">' + Data[3] + '</div><div class="col">' + Data[4] + '</div><div class="col">' + Data[7] + '</div></div>');
                        $('.pt').each(function () {
                            $(this).val('');
                        });
                    }
                });
            });
            $("#btnSvFinancial").live('click', function (e) {
                var Data = [];
                Data[0] = "33";
                $('.fi').each(function () {
                    Data.push($(this).val());
                });
                Data.push($("#txtFrName").attr('tag'));
                //$('#TB_overlay').show();
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                    context: document.body,
                    success: function (responseText) {
                        //$('#TB_overlay').hide();
                        alertG('Record Updated...!');
                    }
                });
            });
            $(".btnDegree").live('click', function (e) {

                svDegree($(this).attr('tag'));
            });
            function svDegree(typ) {

                if (typ == "1") {
                    if ($('#ddBoard').val() == "" || $('#ddBoard').val() == undefined || $('#ddBoard').val() == null || $('#ddBoard').val() == "{NEW ELEMENT}") {
                        alertR('Select Board/University...!');
                        return false;
                    }

                    if ($('#txtCompletion').val() == "") {
                        alertR('Select Valid Date...!');
                        return false;
                    }
                    if ($('#txtCGPA1').val() == "") {
                        alertR('Enter valid CGPA..!');
                        return false;
                    }
                }
                var Data = [];
                Data[0] = "35";
                $('.dg' + typ).each(function () {
                    Data.push($(this).val());
                });
                Data.push(typ);
                Data.push($("#txtFrName").attr('tag'));
                //$('#TB_overlay').show();
                $.ajax({
                    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                    context: document.body,
                    success: function (responseText) {
                        //$('#TB_overlay').hide();
                        $('.AcQ' + typ).append('<div class="table-row Grd"><div class="col">' + Data[1] + '</div><div class="col">' + Data[4] + '</div><div class="col">' + Data[2] + '</div><div class="col">' + Data[3] + '</div><div class="col">' + Data[7] + '</div></div>');
                        $('.dg' + typ).each(function () {
                            $(this).val('');
                        });
                        if (typ == "1") {
                            $('#txtCGPA1').val('');
                            $('#txtCompletion').val('');
                        }

                        $('.Dlg').dialog('close');
                    }
                });
            }
            $("#txtCNIC").live('focusout', function (e) {

                if ($("#txtFrName").attr('tag') == "0") {
                    $.ajax({
                        url: "exeDataIMS.ashx/?ID=22ǁ" + $(this).val(),
                        context: document.body,
                        success: function (responseText) {
                            var jdata;
                            jdata = $.parseJSON(responseText);
                            $("#txtCNIC").attr('chk', jdata[0].rtn);
                            if (jdata[0].rtn == "false") { alertR("Employee already registered .."); }
                        }
                    });
                }

            });
            $(".btnSVDts").live('click', function (e) {

                $("#btnSvPersonnel").trigger('click');
            });
            $("#btnSvPersonnel").live('click', function (e) {

                if ($('#ddlCompany').val() == "" || $('#ddlCompany').val() == null || $('#ddlCompany').val() == undefined) {
                    alertR('Select Valid Appointment Location...!');
                    return false;
                }

                if ($('#txtEmpNo').val() == "") {
                    alertR('Please enter Employee No...');
                    return false;
                }
                if ($("#txtFrName").attr('tag') == "0") {
                    if ($("#txtFrName").val() == "") {
                        alertR("Please Enter first Name ...");
                        return false;
                    }
                    if ($("#txtCNIC").attr('chk') == "false") {
                        alertR("Employee already registered.");
                        return false;
                    }
                    if ($("#txtLName").val() == "") {
                        alertR("Please Enter last Name ...");
                        return false;
                    }
                    if ($("#txtDoB").val() == "") {
                        alertR("Please Enter Date of Birth ...");
                        return false;
                    }
                    if (Date.parse($("#txtDoB").val()).toString() == "NaN") {
                        alertR("Please Enter vaild Date of Birth ...");
                        return false;
                    }
                    if ($("#txtFather").val() == "") {
                        alertR("Please Enter Father's Nme ...");
                        return false;
                    }
                    if ($('#txtCNIC').val().trim().length < 15) {
                        alertR("Please enter a vaild CNIC No...");
                        return false;
                    }
                    var Data = [];
                    Data[0] = "26";
                    $('.pr').each(function () {
                        Data.push($(this).val());
                    });
                    Data.push($.cookie('username'));


                    //$.ajax({
                    //    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                    //    context: document.body,
                    //    success: function (responseText) {
                    //        $("#txtFrName").attr('tag', responseText);
                    //         LoadEmpList();
                    //        fncreate(responseText);
                    //        $('#topEmp img').attr('src', 'Uploads/EmployeePhoto/0.png');
                    //        $('#tdNam').text($("#txtFrName").val() + ' ' + $("#txtLName").val());
                    //        $('#tdCNIC').text($("#txtCNIC").val());
                    //        $('#tdEmTp').text($("#txtEmpNo").val());
                    //        $('#topEmp').show('slow');


                    //        $('#btnSvFinancial').show();
                    //        $('.cBtn').show();
                    //        $('#btnSvPersonnel').val('Update');
                    //    }
                    //});
                    //////////////////////////////////////////////////////////////////////////88888888888888888888
                    var fromdata = new FormData();
                    fromdata.append("vls", encodeURIComponent(Data.join('ǁ')));
                    var choice = {};
                    choice.url = "exeDataIMS.ashx/?ID=116ǁ";
                    choice.type = "POST";
                    choice.data = fromdata;
                    choice.contentType = false;
                    choice.processData = false;
                    choice.success = function (responseText) {
                        //alertG(result);
                        $("#txtFrName").attr('tag', responseText);
                        LoadEmpList();
                        fncreate(responseText);
                        $('#topEmp img').attr('src', 'Uploads/EmployeePhoto/0.png');
                        $('#tdNam').text($("#txtFrName").val() + ' ' + $("#txtLName").val());
                        $('#tdCNIC').text($("#txtCNIC").val());
                        $('#tdEmTp').text($("#txtEmpNo").val());
                        $('#topEmp').show('slow');


                        $('#btnSvFinancial').show();
                        $('.cBtn').show();
                        $('#btnSvPersonnel').val('Update');
                        alertG('Employee is Registered. Please Update Other information..!');
                    };
                    choice.error = function (err) {
                        alertR(err.statusText);
                    };
                    $.ajax(choice);
                    //////////////////////////////////////////////////////////////////////////88888888888888888888
                } else {
                    var Data = [];
                    Data[0] = "32";
                    $('.pr').each(function () {
                        Data.push($(this).val());
                    });
                    Data.push($("#txtFrName").attr('tag'));
                    //$.ajax({
                    //    url: "exeDataIMS.ashx/?ID=" + encodeURIComponent(Data.join('ǁ')),
                    //    context: document.body,
                    //    success: function (responseText) {
                    //        $('#tdNam').text($("#txtFrName").val() + ' ' + $("#txtLName").val());
                    //        $('#tdCNIC').text($("#txtCNIC").val());
                    //        $('#tdEmTp').text($("#txtEmpNo").val());
                    //    }
                    //});
                    /////////////////////////////////////////////////////////////////////////999999999999999999
                    var fromdata = new FormData();
                    fromdata.append("vls", encodeURIComponent(Data.join('ǁ')));
                    var choice = {};
                    choice.url = "exeDataIMS.ashx/?ID=117ǁ";
                    choice.type = "POST";
                    choice.data = fromdata;
                    choice.contentType = false;
                    choice.processData = false;
                    choice.success = function (result) {
                        //alertG(result);
                        $('#tdNam').text($("#txtFrName").val() + ' ' + $("#txtLName").val());
                        $('#tdCNIC').text($("#txtCNIC").val());
                        $('#tdEmTp').text($("#txtEmpNo").val());
                        LoadEmpList();
                    };
                    choice.error = function (err) {
                        alertR(err.statusText);

                    };
                    $.ajax(choice);

                    //////////////////
                }
            });

            function fncreate(tg) {
                //$.ajax({
                //    type: "POST",
                //    url: "EmpReg.ashx/?ID=68ǁ" + $('#txtEmpNo').val() + "ǁ" + $('#ddlGroup').val() + "ǁ" + tg,
                //    success: function (response) {

                //    }
                //});

            }

            $('#AjaxFileUpload1_FileStatusContainer,#AjaxUploadAttech_FileStatusContainer').css('right', '100px');
            $("#ulVMenu a,.nav a").live('click', function (e) { $('.art-sheet').hide('slow'); $.cookie('page', $(this).attr('href')) });
            GetNextEmpNo();
            function GetNextEmpNo() {
                $('#txtEmpNo').attr('readonly', 'readonly');
                $.ajax({
                    type: "POST",
                    url: "EmpReg.ashx/?ID=53ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $('#txtEmpNo').val(jd[0].EmpNo);
                        $('#txtENo').val(jd[0].ENo);
                    }
                });
            }
            //$(".tab1").live('click', function (e) { $(this).parent().next().slideToggle('slow'); });
            LoadBank();
            function LoadBank() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "EmployeeParticulars.aspx/AllBanks",
                    data: "{ }",
                    async: false,
                    success: function (responseText) {
                        var jData = $.parseJSON(responseText.d), out = "";
                        $.each(jData, function (i, item) {
                            out = out + '<option value= ' + item.BankID + '> ' + item.Bank + '</option>';
                        });
                        $('#ddlBank').html(out);
                        $("#ddlBank").prev().html($("#ddlBank option:selected").text());
                    }
                });
            }

        });//END OF DOC READY
    </script>

</asp:Content>
