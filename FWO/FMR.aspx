<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="FMR.aspx.cs" Inherits="FRDP.FMR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .content {
            padding-left: 20px !important;
            padding-right: 20px !important;
        }

        .table thead th, .table tbody td {
            text-align: left;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>PHC Facility Monthly Report</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 100%">
                        <tr>
                            <td>Select DSU
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
                        <tr>
                            <td></td>
                            <td></td>
                            <td>For Month</td>
                            <td>
                                <asp:TextBox ID="txAcMonth" runat="server" ClientIDMode="Static" ReadOnly="True" CssClass="frm clr"></asp:TextBox>
                                <asp:CalendarExtender ID="txAcMonth_CalendarExtender" runat="server" Enabled="True" Format="MMMM yyyy" TargetControlID="txAcMonth" OnClientHidden="onCalendarHidden"
                                    OnClientShown="onCalendarShown" BehaviorID="calendar" DefaultView="Months">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>Date of Submission</td>
                            <td>
                                <input type="text" id="txtSubmissionDate" class="frm clr dtDate" /></td>
                        </tr>
                    </table>
                    <hr />

                    <table class="responsive table table-striped table-bordered table-condensed" style="width: 100%;">
                        <thead>
                            <tr>
                                <th colspan="5">Section 1 : Identification</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Facility ID</td>
                                <td>
                                    <input id="txtA" type="text" class="frm clr" style="width: 96%;" /></td>
                                <td rowspan="2">4</td>
                                <td rowspan="2"><strong>Signature of Facility In-charge</strong></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Facility Name</td>
                                <td>
                                    <input id="txtB" type="text" class="frm clr" style="width: 96%;" /></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Tehsil</td>
                                <td>
                                    <input  id="txtC" type="text" class="frm clr" style="width: 96%;" /></td>
                                <td>5</td>
                                <td><strong>Designation : </strong>&nbsp;&nbsp;<input id="txtD" type="text" class="frm clr" style="width: 70%;" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />

                    <table class="responsive table table-striped table-bordered table-condensed" style="width: 100%;">
                        <thead>
                            <tr>
                                <th colspan="2">Section II.  Monthly Performance (Number or % as appropriate)</th>
                                <th>Monthly Target</th>
                                <th>Performance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Daily OPD attendance</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td>Full immunization coverage</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Antenatal Care (ANC-1) coverage</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Monthly reports date accuracy</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Delivery coverage at facility</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>TB-DOTS patients missing more than one week</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Total Visits for FP</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>LHW pregnancy registration coverage</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            </tr>
                        </tbody>
                    </table>

                    <br />

                    <table class="responsive table table-striped table-bordered table-condensed" style="width: 100%;">
                        <thead>
                            <tr>
                                <th colspan="2">Section III.  Outpatients Attendance (From OPD Register) </th>
                                <th>< 1yrs</th>
                                <th>1-4yrs</th>
                                <th>5 - 14</th>
                                <th>15 - 49</th>
                                <th>50+</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1.</td>
                                <td>Male (New Cases)</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            </tr>
                            <tr>
                                <td>2.</td>
                                <td>Female (New Cases)</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: right;"><strong>Grand Total</strong></td>
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>3.</td>
                                <td colspan="2">Follow-up cases</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                                <td colspan="3">4. Referred cases</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            </tr>
                            <tr>
                                <td>5.</td>
                                <td>Total Homeo cases</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td>6. Total Tibb/Unani cases</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                                <td colspan="2">7. No. Of Cases of Malnutrition &lt;5 yrs children</td>
                                <td>
                                    <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            </tr>
                        </tbody>
                    </table>
                    <br />

                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35%; border: 1px solid #c4c4c4; background: lightgray; font-weight: 700;" colspan="3"><strong>Section IV</strong>Cases attending OPD (from OPD Abstract Form)</td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; border: 1px solid #c4c4c4;">24</td>
                            <td style="border: 1px solid #c4c4c4;">Hypertension</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35%;" colspan="3">Respiratory Diseases</td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Skin Diseases</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">Acute (uper) respiratory infections</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">25</td>
                            <td style="width: 35%;">Scabies</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>

                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">Pneumonia &lt;5 yrs</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">26</td>
                            <td style="width: 35%;">Dermatitis</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">Pneumonia &gt; 5 yrs</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">27</td>
                            <td style="width: 35%;">Cutaneous Leishmaniasis</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">4</td>
                            <td style="width: 35%;">TB Suspects</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Eudocrine Diseases</td>

                        </tr>
                        <tr>
                            <td style="width: 35px;">5</td>
                            <td style="width: 35%;">Chronic Obstructive Pulmonary Diseases</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">28</td>
                            <td style="width: 35%;">Diabetes Mellitus</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">6</td>
                            <td style="width: 35%;">Asthma</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Neuro-Psychiatric Diseases</td>

                        </tr>
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Gastro Intestinal Diseases</td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">29</td>
                            <td style="width: 35%;">Depression</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">7</td>
                            <td style="width: 35%;">Diarrhoea / Dysentery &lt;5 yrs</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">30</td>
                            <td style="width: 35%;">Drug Dependence</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">8</td>
                            <td style="width: 35%;">Diarrhoea / Dysentery &gt; 5 yrs</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">31</td>
                            <td style="width: 35%;">Epilepsy</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">9</td>
                            <td style="width: 35%;">Enteric / Typhoid Fever</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Eye & Ent</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">10</td>
                            <td style="width: 35%;">Worm Infestapions</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">32</td>
                            <td style="width: 35%;">Cataract</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">11</td>
                            <td style="width: 35%;">Peptic Ulcer Diseases</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">33</td>
                            <td style="width: 35%;">Trachome</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">12</td>
                            <td style="width: 35%;">Cirrhosis of Liver</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">34</td>
                            <td style="width: 35%;">Glaucoma</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Urinary Tract Diseases</td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">35</td>
                            <td style="width: 35%;">Otitis Media</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">13</td>
                            <td style="width: 35%;">Urinary Tract Infections</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Oral Diseases</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">14</td>
                            <td style="width: 35%;">Nephritis / Nephrosis</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">36</td>
                            <td style="width: 35%;">Dental Caries</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">15</td>
                            <td style="width: 35%;">Sexually Transmitted Infections</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Inguries / Poisoning</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">16</td>
                            <td style="width: 35%;">Benign Enlargement of Prostrate</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">37</td>
                            <td style="width: 35%;">Road Traffic Accidents</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Other Communicable Diseases</td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">38</td>
                            <td style="width: 35%;">Fractures</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">17</td>
                            <td style="width: 35%;">Suspected Malaria</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">39</td>
                            <td style="width: 35%;">Burns</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">18</td>
                            <td style="width: 35%;">Suspected Meningitis</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">40</td>
                            <td style="width: 35%;">Dog Bite</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">19</td>
                            <td style="width: 35%;">Fever Due to other causes</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">41</td>
                            <td style="width: 35%;">Snake Bite (With Signs Symptoms of Poisoning)</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Vaccine Preventable Diseases</td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Miscellaneous Diseases</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">20</td>
                            <td style="width: 35%;">Suspected Measles</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">42</td>
                            <td style="width: 35%;">Acute Flaccid Paralysis</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">21</td>
                            <td style="width: 35%;">Suspected Viral Hepatitis</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">43</td>
                            <td style="width: 35%;">Suspected HIV / AIDS</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">22</td>
                            <td style="width: 35%;">Suspected Neo Natal Tatanus</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Any Other Unusual Diseases (Specify)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="3">Cardiovascular Diseases</td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">44</td>
                            <td style="width: 35%;">
                                <input type="text" class="frm clr" style="width: 96%; border: none; background: transparent;" /></td>
                            <%--===============see=========================--%>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">23</td>
                            <td style="width: 35%;">Ischemic Heart Disease</td>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 35px; border: none; background: white;"></td>
                            <td style="width: 35px;">45</td>
                            <td style="width: 35%;">
                                <input type="text" class="frm clr" style="width: 96%; border: none; background: transparent;" /></td>
                            <%--===============see=========================--%>
                            <td style="width: 105px;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>


                    </table>

                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section V- Immunization (From EPI Register)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">Children &lt; 12 months received 3rd Pentavalent vacc</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">Children &lt; 12 months fully immunized</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">Children &lt; 12 months received 1st Measles vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">4</td>
                            <td style="width: 35%;">Pregnant women received TT -2 vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                    </table>


                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section VI: TB-DOTS (From TB Card TB-01)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">Intensive-phase TB-DOTS patients</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">Intensive phase TB-DOTS patients missing treatment &gt; 1 week</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                    </table>



                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section VII: Family Planning Services/Commodities Provided (From FPRegister)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">Total FP visits</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">6</td>
                            <td style="width: 35%;">Condom Pieces</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>


                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">COC Cycles</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">7</td>
                            <td style="width: 35%;">IUCD</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>

                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">POP cycles</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">8</td>
                            <td style="width: 35%;">Tubal Ligation</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>
                        <tr>

                            <td style="width: 35px;">4</td>
                            <td style="width: 35%;">DMPA Inj.</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">9</td>
                            <td style="width: 35%;">Vasectomy</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>




                        </tr>
                        <tr>
                            <td style="width: 35px;">5</td>
                            <td style="width: 35%;">Net-En Inj</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">10</td>
                            <td style="width: 35%;">Implants</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                    </table>

                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section VIII: Maternal and Newborn Health (From Maternal Health-& Obsteric Register)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">1st Antenatal Care visits (ANC-1) in the facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">6</td>
                            <td style="width: 35%;">Vacuum / Forceps deliveries in facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>


                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">ANC-1 women with Hb. &lt; g/dl</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">7</td>
                            <td style="width: 35%;">Live birth in the facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>

                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">Antenatal Care revisit in the facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">8</td>
                            <td style="width: 35%;">Live births with LBW (&lt;2.5kg)</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>
                        <tr>

                            <td style="width: 35px;">4</td>
                            <td style="width: 35%;">1st Postnatal Care visit (PNC-1) in the facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">9</td>
                            <td style="width: 35%;">Stillbirth in the facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>




                        </tr>
                        <tr>
                            <td style="width: 35px;">5</td>
                            <td style="width: 35%;">Normal vaginal deliveries in facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">10</td>
                            <td style="width: 35%;">Neonatal deaths in the facility</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                    </table>

                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section IX: Community BSED Date (From LHW Report)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">Pregnant women newly registered by LHW</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">4</td>
                            <td style="width: 35%;">Infant deaths reported</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>


                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">Delivery by skilled person reported</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">5</td>
                            <td style="width: 35%;">No. of modern FP method users</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>

                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">Maternal deaths reported</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">6</td>
                            <td style="width: 35%;">&lt; 5 years diarrhea cases reported</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>7</td>
                            <td>&lt; 5 years ARI cases reported</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                    </table>


                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section X: Community Meetings (From Community Meetings Register)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">No. of community meetings</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">No. of Participants Male</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>


                        </tr>
                        <tr>
                            <td style="width: 35px;">&nbsp;</td>
                            <td style="width: 35%;">&nbsp;</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">&nbsp;</td>


                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">No. of Participants Female</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>
                    </table>


                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="8">Section XI: Diagnostic Service (From Laboratory Register / TB Register / Radiology Register)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(For RHG ONLY)</td>
                        </tr>
                        <tr style="background: lightgray;">
                            <td>&nbsp;</td>
                            <td>Service Provided</td>
                            <td>OPD</td>
                            <td>Indoor</td>
                            <td>&nbsp;</td>
                            <td>Service Provided</td>
                            <td>OPD</td>
                            <td>Indoor</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">Total Lab Investigations</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">Total Ultra Sonographies</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">Total X-Rays</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">4</td>
                            <td style="width: 35%;">Total ECGs</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>

                    </table>
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700; text-align: center;" colspan="9">Laboratory Investigation for Communicable Diseases</td>
                        </tr>
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700; text-align: center;" colspan="3">Malaria</td>
                            <td style="width: 35px; background: lightgray; font-weight: 700; text-align: center;" colspan="3">TB</td>
                            <td style="width: 35px; background: lightgray; font-weight: 700; text-align: center;" colspan="3">Viral Hepatitis</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 20%;">Slides examined</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">1</td>
                            <td style="width: 25%;">Slide for AFB Diagnosis</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">1</td>
                            <td style="width: 20%;">Patients screened</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 20%;">Slides MP+ve</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">2</td>
                            <td style="width: 25%;">Diagnosis slided with AFB+ve</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">2</td>
                            <td style="width: 20%;">Hepatitis B+ve</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 20%;">Slides P. falciparum +ve</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">3</td>
                            <td style="width: 25%;">Follow-up slides for AFB</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">3</td>
                            <td style="width: 20%;">Hepatitis C+ve</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">&nbsp;</td>
                            <td style="width: 20%;">&nbsp;</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">&nbsp;</td>

                            <td style="width: 35px;">4</td>
                            <td style="width: 25%;">Follow-up slides with AFB+</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">&nbsp;</td>
                            <td style="width: 20%;">&nbsp;</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">&nbsp;</td>
                        </tr>
                    </table>


                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="9">Section XIII-A: Stock out Report: Stock out of tracer drugs for any number of days this month (From Stock Register fro Medicine/Supplies )  Tick where applicable</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 20%;">Cap. Amoxicillin</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">7</td>
                            <td style="width: 25%;">Inj. Ampicillin</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">13</td>
                            <td style="width: 20%;">Syp. Antihelminthic</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 20%;">Syp. Amoxicllin</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">8</td>
                            <td style="width: 25%;">Tab. Dicofeanc</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">14</td>
                            <td style="width: 20%;">I/V infusions</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 20%;">Tab. Cotrimoxazole</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">9</td>
                            <td style="width: 25%;">Syp. Paracetamol</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">15</td>
                            <td style="width: 20%;">Inj. Dexamethasone</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>

                        <tr>
                            <td style="width: 35px;">4</td>
                            <td style="width: 20%;">Syp. Cotrimoxazole</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">10</td>
                            <td style="width: 25%;">Inj. Diclofenac</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">16</td>
                            <td style="width: 20%;">Tab. Iron/Folic Acid</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">5</td>
                            <td style="width: 20%;">Tab. Metronidazole</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">11</td>
                            <td style="width: 25%;">Tab. Chloroquin</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">17</td>
                            <td style="width: 20%;">ORS</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">6</td>
                            <td style="width: 20%;">Syp. Metronidazole</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">12</td>
                            <td style="width: 25%;">Syp. Salbutamol</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">18</td>
                            <td style="width: 20%;">Oral pills (COC)</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="9">Section XIII-B: Stock out Reports Vaccines Tick where applicable</td>
                        </tr>

                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 20%;">BCG vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">4</td>
                            <td style="width: 25%;">Hepatitis-B vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">7</td>
                            <td style="width: 20%;">Anti Rabies Vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>

                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 20%;">Pentavalent vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">5</td>
                            <td style="width: 25%;">Measles vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">8</td>
                            <td style="width: 20%;">Anti Snake Venom</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 20%;">Polio vaccine</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">6</td>
                            <td style="width: 25%;">Tetanus Toxiod</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">9</td>
                            <td style="width: 20%;">Vaccine Syringes</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                    </table>
                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="12">Section XIII-A: Indoor Services (From Daily Bed Statement Register)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(For RHC Only)</td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                            <td>Allocated Beds</td>
                            <td>Admissions</td>
                            <td>Discharged/DOR (not on the same day of admission)</td>
                            <td>Discharged/DOR on same day of admission</td>
                            <td>LAMA</td>
                            <td>Referred</td>
                            <td>Deaths</td>
                            <td>Total Daily Patient Count</td>
                            <td>Bed Occupancy</td>
                            <td>Average Length of Stay (ALS)</td>

                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Male</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Female</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>
                        </tr>
                    </table>

                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="4">Section XIII-B: Cases Attending Indoor ( From Indoor Register / Obsteric Register )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(For RHS Only)</td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                            <td>Total Number of Admissions</td>
                            <td>Total Number of Deaths</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Diarrhea/Dysentery in &lt; 5 yrs.</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Pneumonia in &lt; 5 yrs.</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Malaria</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Pulmonary Tuberculosis</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Obsteric / Maternal Complication</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Other Causes</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 96%;" /></td>
                        </tr>
                        <tr style="background: lightgray; font-weight: 700;">

                            <td colspan="2" style="text-align: center;">Total</td>
                            <td style="text-align: center;">0</td>
                            <td style="text-align: center;">0</td>
                        </tr>
                    </table>

                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section XIV: Surgeries (From OT Register)</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 35%;">Operations Under GA</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">3</td>
                            <td style="width: 35%;">Operations Under LA</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>


                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 35%;">Operations under Spinal Anesthesia</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">4</td>
                            <td style="width: 35%;">Operations under other type of Anesthesia</td>
                            <td style="width: 105px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>



                        </tr>


                    </table>

                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="7">Section XV: Human Resource Date (From Facility Records)</td>
                        </tr>
                        <tr style="font-weight: 700;">
                            <td colspan="2">Post Name/Category
                            </td>
                            <td>Sanctioned</td>
                            <td>Vacant</td>
                            <td>Contract</td>
                            <td>On General Duty in Facility</td>
                            <td>On General Duty out of Facility</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Senior Medical Officer</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Medical Officer</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Women / Lady Medical Officer</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Dental Surgeon</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Head Nurse</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Staff Nurse / Charge Nurse</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Medical Assistant</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>8</td>
                            <td>Sanitary Inspector</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>9</td>
                            <td>Lab Assistants</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>10</td>
                            <td>Dental Assistant</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>11</td>
                            <td>X-Ray Assistant</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>12</td>
                            <td>Lady Health Visitor</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>13</td>
                            <td>Health Technician / Medical Technician</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>14</td>
                            <td>Dispenser</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>15</td>
                            <td>EPI Vaccinator</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>16</td>
                            <td>CDC Supervisor</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>17</td>
                            <td>Midwife</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>18</td>
                            <td>LHW</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                        <tr>
                            <td>19</td>
                            <td>Others</td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>
                            <td>
                                <input type="text" class="frm clr Integer" style="width: 90%;" /></td>

                        </tr>
                    </table>

                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="9">Section XVI-A: Revenue Generated (From Receipt Register ) </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                            <td>Total Receipt</td>
                            <td>Deposited</td>
                            <td colspan="2">&nbsp;</td>
                            <td>Total Receipt</td>
                            <td>Deposited</td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td style="width: 20%;">OPD</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">5</td>
                            <td style="width: 25%;">X-Ray</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td style="width: 20%;">Indoor</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">6</td>
                            <td style="width: 25%;">Ultrasound</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                        <tr>
                            <td style="width: 35px;">3</td>
                            <td style="width: 20%;">Laboratory</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">7</td>
                            <td style="width: 25%;">Dental Procedures</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>

                        <tr>
                            <td style="width: 35px;">4</td>
                            <td style="width: 20%;">ECG</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                            <td style="width: 35px;">8</td>
                            <td style="width: 25%;">Ambulance</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                        <tr>
                            <td style="width: 35px;">&nbsp;</td>
                            <td style="width: 20%;">&nbsp;</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">&nbsp;</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">&nbsp;</td>

                            <td style="width: 35px;">9</td>
                            <td style="width: 25%;">Others</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <input type="text" class="frm clr Integer" style="width: 70%;" /></td>

                        </tr>
                    </table>
                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;" colspan="6">Section XVI-B: Financial Report-for the Current Fiscal Year (From Budget and Expenditure Statement)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(For RHC ONLY) </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                            <td>Total Allocation for the fiscal Year</td>
                            <td>Total Budget Related to Date</td>
                            <td>Total Expenditure to-date</td>
                            <td>Balance to date</td>

                        </tr>
                        <tr>
                            <td style="width: 35px;">1</td>
                            <td>Salary & Allowances (Establishment charges)</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">2</td>
                            <td>Non-Salary (Operating Expense)</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">3</td>
                            <td>Utilities</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">4</td>
                            <td>Medicine</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">5</td>
                            <td>General Store</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">6</td>
                            <td>M&R Equip/Transport/Furniture</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">7</td>
                            <td>M&R Building Dept</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">8</td>
                            <td>Others</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>
                        <tr>
                            <td style="width: 35px;">9</td>
                            <td>Anual Development Plan</td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                            <td style="width: 140px; border: 1px solid #c4c4c4;">
                                <span>Rs.</span><input type="text" class="frm clr Integer" style="width: 60%;" /></td>
                        </tr>

                    </table>
                    <br />
                    <table class="table table-bordered table-condensed" style="width: 100%;">
                        <tr>
                            <td style="width: 35px; background: lightgray; font-weight: 700;">Section XVII: Achievements/Issues</td>
                        </tr>
                        <tr>
                            <td>
                                <textarea id="TextArea1" class="frm clr" cols="20" rows="2" style="width: 98.5%; resize: none;"></textarea>
                            </td>
                        </tr>
                    </table>
                    <div style="text-align: right; margin-top: 10px;">
                        <button type="button" id="btnSave" value="0" class="btn btn-info frm">Submit Form</button>
                        <button id="btnCancel" value="0" class="btn btn" style="margin-right: 1%;">Cancel</button>
                    </div>
                    <br />
                </div>
                <%--==========END OF CONTENT DIV============--%>
                
            </div>

        </div>
    </div>
   
            <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Previously Sent Reports</span>
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
        function onCalendarShown() {
            var cal = $find("calendar");
            //Setting the default mode to month
            cal._switchMode("months", true);
            //Iterate every month Item and attach click event to it
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);
                    }
                }
            }
        }
        function onCalendarHidden() {
            var cal = $find("calendar");
            //Iterate every month Item and remove click event from it
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call);
                    }
                }
            }
        }
        function call(eventElement) {
            var target = eventElement.target;
            switch (target.mode) {
                case "month":
                    var cal = $find("calendar");
                    cal._visibleDate = target.date;
                    cal.set_selectedDate(target.date);
                    cal._switchMonth(target.date);
                    cal._blur.post(true);
                    cal.raiseDateSelectionChanged();
                    break;
            }
        }

        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        $(document).ready(function () {

            $('#btnSave').live('click', function (e) {
                e.preventDefault();
                if ($('#ddlDSUList').val() == "" || $('#ddlDSUList').val() == null || $('#ddlDSUList').val()== undefined) {
                    alertR('Please Select Valid DSU..!');
                    return false;
                }
                if ($('#ddlCompany').val() == "" || $('#ddlCompany').val() == null || $('#ddlCompany').val() == undefined) {
                    alertR('Please Select Valid Entry..!');
                    return false;
                }
                
                if ($('#txAcMonth').val() == "") {
                    alertR('Please Select Valid Month..!');
                    return false;
                }
                if ($('#txtSubmissionDate').val() == "") {
                    alertR('Please Select Valid Submited Date..!');
                    return false;
                }
                
                if ($('#txtA').val() == "") {
                    alertR('Please Select Valid Facility ID..!');
                    return false;
                }
                if ($('#txtB').val() == "") {
                    alertR('Please Select Valid Facility Name..!');
                    return false;
                }
                if ($('#txtC').val() == "") {
                    alertR('Please Select Valid Tehsil..!');
                    return false;
                }
                if ($('#txtD').val() == "") {
                    alertR('Please Select Valid Designation..!');
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
                choice.url = "MonitoringGH.ashx/?ID=0ǁ";
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
            $('#btnCancel').live('click', function (e) {
                e.preventDefault();
                //$('.clr').css('background', 'red');
                $('.clr').val('');
                $('.Integer').val('0');
                $('#btnSave').html('Submit Form').val('0');
                // $("#chkStatus").iButton("checked");

            });

           
            $(function () {
                $('.Integer').val('0');
            });
            $('#ddlCompany').live('change', function (e) {

                e.preventDefault();
                LoadDoctorsList();
            });
            function LoadDoctorsList() {
                $.ajax({
                    type: "POST",
                    url: "MonitoringGH.ashx/?ID=1ǁ" + $('#ddlCompany').val(),
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

            $('.dtDate').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });

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
                    url: "MonitoringGH.ashx/?ID=2ǁ" + $thisID,
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
                    url: "MonitoringGH.ashx/?ID=3ǁ" + $thisID,
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
        });//end of doc ready
    </script>
</asp:Content>
