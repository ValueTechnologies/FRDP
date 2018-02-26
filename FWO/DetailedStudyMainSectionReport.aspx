<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="DetailedStudyMainSectionReport.aspx.cs" Inherits="FRDP.DetailedStudyMainSectionReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #tblAnimals > tbody > tr > td {
            text-align: left !important;
        }
        .table thead th {
            vertical-align:top;
        }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Detailed Study Report (Main Section)</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">

                    <br />
                     
                    <%--<table id="tblAnimals" class="responsive table table-striped table-bordered table-condensed" style="margin-left: 10px; margin-right: 10px; border-right: 1px solid #c4c4c4;">--%>
                    <table id="tblAnimals" class="responsive table table-striped table-bordered table-condensed" style="margin-left: 10px; margin-right: 10px; border-right: 1px solid #c4c4c4;">
                        <thead>
  <tr height="20" style="height:15.0pt">
  <th colspan="9">Survey Information</th>
  <th colspan="10">School's  Name and Contacts</th>
  <th>&nbsp;</th>
  <th colspan="3">School Ownership</th>
  <th colspan="2">Information  about the Principal</th>
  <th colspan="3">Information  about the Respondent</th>
  <th colspan="44">Academic  Information Required</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th colspan="44" >Information  about the School's Building</th>
  <th colspan="2">Enrollment</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th colspan="8">Basic  Amenities</th>
 </tr>
  <tr>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>SI1</th>
  <th>SI2a</th>
  <th>SI2b</th>
  <th>SI2c</th>
  <th>SI2d</th>
  <th>SI3a</th>
  <th>SI3a1</th>
  <th>SI3a2</th>
  <th>SI3a3</th>
  <th>SI3a4 (a)</th>
  <th>SI3a4 (b)</th>
  <th>SI4a</th>
  <th>SI4b</th>
  <th>SI4c</th>
  <th>SI5a</th>
  <th>SI5b</th>
  <th>SI6a</th>
  <th>SI6b</th>
  <th>SI6c</th>
  <th>A1</th>
  <th>A2</th>
  <th>A3</th>
  <th>A4</th>
  <th>A5</th>
  <th>A6</th>
  <th>A7</th>
  <th>A8</th>
  <th>A9</th>
  <th>A10</th>
  <th>A11</th>
  <th>A12</th>
  <th>A13</th>
  <th>A14</th>
  <th>A14a</th>
  <th>A15</th>
  <th>A16</th>
  <th>A17</th>
  <th>A18a</th>
  <th>A18b</th>
  <th>A18c</th>
  <th>A19a</th>
  <th>A19b</th>
  <th>A19c</th>
  <th>A19d</th>
  <th>A19e</th>
  <th>A20a</th>
  <th>A20b</th>
  <th>A21a</th>
  <th>A21b</th>
  <th>A21c</th>
  <th>A22a</th>
  <th>A22b</th>
  <th>A22c</th>
  <th>A22d</th>
  <th>A22e</th>
  <th>A23a</th>
  <th>A23b</th>
  <th>A24</th>
  <th>A25</th>
  <th>A26</th>
  <th>A27</th>
  <th>A28</th>
  <th>A29</th>
  <th>A30a</th>
  <th>A30b</th>
  <th>A30c</th>
  <th>A31</th>
  <th>B1a</th>
  <th>B1b</th>
  <th>B2a</th>
  <th>B2b</th>
  <th>B3a</th>
  <th>B3b</th>
  <th>B4a</th>
  <th>B4b</th>
  <th>B4c</th>
  <th>B4d</th>
  <th>B4e</th>
  <th>B4f</th>
  <th>B5</th>
  <th>B6</th>
  <th>B7</th>
  <th>B8</th>
  <th>B9</th>
  <th>B10</th>
  <th>B11</th>
  <th>B12</th>
  <th>B13</th>
  <th>B14</th>
  <th>B15</th>
  <th>B16</th>
  <th>B17</th>
  <th>B18a1</th>
  <th>B18a2</th>
  <th>B18b1</th>
  <th>B18b2</th>
  <th>B18c1</th>
  <th>B18c2</th>
  <th>B19</th>
  <th>B20</th>
  <th>B21</th>
  <th>B22</th>
  <th>B23</th>
  <th>B24</th>
  <th>B25a</th>
  <th>B25b</th>
  <th>B25c</th>
  <th>B25d</th>
  <th>B25e</th>
  <th>B25f</th>
  <th>B25g</th>
  <th>C1</th>
  <th>C2</th>
  <th>E13</th>
  <th>E14</th>
  <th>E15</th>
  <th>F1a1</th>
  <th>F1b1</th>
  <th>F1c1</th>
  <th>F1a2</th>
  <th>F1b2</th>
  <th>F1b3</th>
  <th>F1d</th>
  <th>F2</th>
 </tr>
<tr>
  <th>UC Name</th>
  <th>Date</th>
  <th>Day</th>
  <th>Start  Time</th>
  <th>End  Time</th>
  <th>Name  of Surveyor (1)</th>
  <th>Name  of Surveyor (2)</th>
  <th>Contact  of Surveyor (1)</th>
  <th>Contact  of Surveyor (2)</th>
  <th>Name  of the School</th>
  <th>Address  Line 1</th>
  <th>Address  Line 2</th>
  <th>Nearest  Landmark</th>
  <th>Slum  Area</th>
  <th>PTCL  Number</th>
  <th>(IN  CASE THE CONTACT IS IN SOMEONE ELSE's NAME) Name of the Contact</th>
  <th>Cell  Phone</th>
  <th>Email</th>
  <th>GPS  Coordinate(Lat.)</th>
  <th>GPS  Coordinate(Log.)</th>
  <th>School  is owned by (Individual, Organization OR Trust)</th>
  <th>Owner's  Name</th>
  <th>Owner's  Contact Number</th>
  <th>Principal  Name</th>
  <th>Provide  Brief Background of the Principal</th>
  <th>Respondent  Name</th>
  <th>Position  of the Respondent (Principal, Manager, Senior Teacher, Other)</th>
  <th>If  you Choose OTHER in SI6b, Name the Position</th>
  <th>Lowest  Class</th>
  <th>Highest  Class</th>
  <th>School  Year Begins (Month)</th>
  <th>School  Year Ends (Month)</th>
  <th>Shifts  Offered in the School (Morning, Evening, Both Morning and Evening)</th>
  <th>Start  Time of School Day (Morning Shift) 24H format</th>
  <th>End  Time of School Day (Morning Shift) 24H format</th>
  <th>Start  Time of School Day (Evening Shift) 24H format</th>
  <th>End  Time of School Day (Evening Shift) 24H format</th>
  <th>In  the Last School Year, Report How Many Days was the School Open</th>
  <th>In  the Last School Year, Report How Many Days the School Should Have Been Open</th>
  <th>Is  the School Registered? (Yes, No, Applied, Expired)</th>
  <th>Section  Registration Type</th>
  <th>Type  of School</th>
  <th>If  you Choose OTHER in A14, Enter type of school</th>
  <th>What  is the main language used for communication between teachers and students?</th>
  <th>Year  School Established</th>
  <th>Year  School Registered</th>
  <th>Where  do you get most of your students from (Area 1)</th>
  <th>Where  do you get most of your students from (Area 2)</th>
  <th>Where  do you get most of your students from (Area 3)</th>
  <th>Predominant  Ethnic Community of the Children enrolled in the school (Choice 1)</th>
  <th>Predominant  Ethnic Community of the Children enrolled in the school (Choice 2)</th>
  <th>Predominant  Ethnic Community of the Children enrolled in the school (Choice 3)</th>
  <th>If  you choose OTHER in A19a, A19b, A19d, Write Ethnic Group</th>
  <th>If  you choose OTHER in A19a, A19b, A19d, Write Ethnic Group</th>
  <th>Number  of Government Schools in 500 meters</th>
  <th>Number  of Private Schools in 500 meters</th>
  <th>Names  of kutchi Abadis/Slums Located Nearby (Choice 1)</th>
  <th>Names  of Katchi Abadis/Slums Located Nearby (Choice 2)</th>
  <th>Names  of Katchi Abadis/Slums Located Nearby (Choice 3)</th>
  <th>Ethnic  Communities Residing within 1 km (Choice 1)</th>
  <th>Ethnic  Communities Residing within 1 km (Choice 2)</th>
  <th>Ethnic  Communities Residing within 1 km (Choice 3)</th>
  <th>If  you choose OTHER in A22a, A22b, A22c, enter Ethnic Group here</th>
  <th>If  you choose OTHER in A22a, A22b, A22c, enter Ethnic Group here</th>
  <th>Name  of the publisher whose books are followed in the earlier classes</th>
  <th>If  you choose Other in A23, Enter choice</th>
  <th>Check  if the up-to-date attendance record in available (Yes, No)</th>
  <th>Are  the attendance records computerized? (Yes, No)</th>
  <th>Is  the record of tuition fee receipt available? (Yes, No)</th>
  <th>Is  the record of tuition fee receipt computerized? (Yes, No)</th>
  <th>Is  the record of teachers' salaries available? (Yes, No)</th>
  <th>Is  the record of teachers' salaries computerized? (Yes, No)</th>
  <th>Does  the school maintain a bank account</th>
  <th>Is  the account maintained on school name</th>
  <th>If  the school is partnered with EFS, will it open on account on school name</th>
  <th>In  case of non-registered school, will it open an account on school name.</th>
  <th>School's  building is (Owned, Rented, Leased, Other)</th>
  <th>If  you choose OTHER in B1a, explain your choice here</th>
  <th>Size  of the plot (Building 1)</th>
  <th>Size  of the plot (Building 2)</th>
  <th>Number  of Floors (Building 1)</th>
  <th>Number  of Floors (Building 2)</th>
  <th>Total  Rooms (Building 1)</th>
  <th>Total  Rooms (Building 2)</th>
  <th>Morning  unused rooms (Building 1)</th>
  <th>Morning  unused rooms (Building 2)</th>
  <th>Afternoon unused rooms (Building 1)</th>
  <th>Afternoon  unused rooms (Building 2)</th>
  <th>Is  there any hall available? (Yes, No)</th>
  <th>If  yes, how many?</th>
  <th>Is  the hall(s) used as classrooms? (Yes, No)</th>
  <th>Is  there a dedicated space for library? (Yes, No)</th>
  <th>If  no, is there a dedicated box or bookshelf where books are kept and shared  from? (Yes, No)</th>
  <th>Does  the school have electricity? (Yes, No)</th>
  <th>At  the time of the survey, was there electricity? (Yes, No)</th>
  <th>Average  Hours of Load Shedding per day (in Hours)</th>
  <th>Electricity  Generator Available? (Yes, No)</th>
  <th>Is  there a source of drinking water in the school boundary? (Yes, No)</th>
  <th>If  yes, is the water drinkable? (Yes, No)</th>
  <th>Is  there a water cooler/pitcher/bucket for drinking water? (Yes, No)</th>
  <th>Does  the school have an adequate boundary wall? (Yes, No)</th>
  <th>Number  of Teachers' Toilets Available</th>
  <th>Number  of Teachers' Toilets Functional</th>
  <th>Number  of Male Students' Toilets Available</th>
  <th>Number  of Male Students' Toilets Functional</th>
  <th>Number  of Female Students' Toilets Available</th>
  <th>Number  of Female Students' Toilets Functional</th>
  <th>Is  there a playground available? (Yes, No)</th>
  <th>Is  there a computer lab available? (Yes, No)</th>
  <th>Number  of Computers in labs</th>
  <th>Is  the lab being used? (Yes, No)</th>
  <th>Is  school's transportation facility available for students? (Yes, No)</th>
  <th>Number  of vans available (Owned/Rented/Third Party)</th>
  <th>Does  the classroom appear regularly cleaned? (Yes, No)</th>
  <th>Are  the playing facilities/common areas clean? (Yes, No)</th>
  <th>Do  the students have a clean eating area? (Yes, No)</th>
  <th>Do  the students have clean uniforms? (Yes, No)</th>
  <th>Do  their nails/hair appear neatly cut/trimmed? (Yes, No)</th>
  <th>Is  there a proper dustbin easily accessible? (Yes, No)</th>
  <th>Do  you observe a garbage deposit nearby the school? (Yes, No)</th>
  <th>Is  the school willing to enroll students throughout the academic year? (Yes, No)</th>
  <th>Is  the school willing to enroll students who are older than the recommended age  for a class? (Yes, No)</th>
  <th>Are  parent-teacher meeting held?</th>
  <th>Do  parents-teachers formal setup exist?</th>
  <th>Number  of times in the year parents are invited to school?</th>
  <th>CLASS  3: Is there a fan? (Yes, No)</th>
  <th>CLASS  3: Cross Ventilation? (Yes, No)</th>
  <th>CLASS  3: What kind of lighting is there? (Dark, Well Lit Naturally, Lit by  Electricity)</th>
  <th>CLASS  5: Is there a fan? (Yes, No)</th>
  <th>CLASS  5: Cross Ventilation? (Yes, No)</th>
  <th>CLASS  5: What kind of lighting is there? (Dark, Well Lit Naturally, Lit by  Electricity)</th>
  <th>Multi-grade  Class? (Yes, No)</th>
  <th>Is  a timetable displayed in the school? (Yes, No)</th>
 </tr>
                        </thead>
<tbody>


 
</tbody>
                    </table>
                        
                    <br />
                    <br />
                    <br />
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript">
        var _$_6bb3 = ["keyCode", "preventDefault", "keypress", "click", "excel", "false", "tableExport", "#tblAnimals", "live", "#btnExcel", "doc", "#btnWord", "png", "#btnPNG", "class", "removeAttr", "width", "style", "each", "#tblAnimals tbody tr td", "height", "#tblAnimals tbody tr", "", "dataTable", "hasClass", "fnDestroy", "All", "full_numbers", "id", "search", "attr", ".dataTables_filter>label>input", "<input type=\"image\" name=\"btnExcel\" id=\"btnExcel\" title=\"Export to Excel\" class=\"Grd\" src=\"images/xcel.png\" style=\"border-width:0px;\">&nbsp;<input type=\"image\" name=\"btnWord\" id=\"btnWord\" title=\"Export to Word\" class=\"Grd\" src=\"images/wrd.png\" style=\"border-width:0px;\">&nbsp;<input type=\"image\" name=\"btnPNG\" id=\"btnPNG\" title=\"Export to PNG\" class=\"Grd\" src=\"images/png.png\" style=\"width: 16px;border-width:0px;\">", "append", "#tblAnimals_filter label", "<div id=\"HChart\"  class=\"scroll\" style=\"overflow-y: hidden; overflow-x:auto; margin:10px; padding-top:10px;width: 98%;\"></div>", "wrap", "ready"];
        $(document)[_$_6bb3[2]](function (a) {
            if (a[_$_6bb3[0]] === 13) {
                a[_$_6bb3[1]]();
                return false
            }
        });
        $(document)[_$_6bb3[37]](function () {
            $(_$_6bb3[9])[_$_6bb3[8]](_$_6bb3[3], function (a) {
                a[_$_6bb3[1]]();
                $(_$_6bb3[7])[_$_6bb3[6]]({
                    type: _$_6bb3[4],
                    escape: _$_6bb3[5]
                });
                a[_$_6bb3[1]]()
            });
            $(_$_6bb3[11])[_$_6bb3[8]](_$_6bb3[3], function (a) {
                a[_$_6bb3[1]]();
                $(_$_6bb3[7])[_$_6bb3[6]]({
                    type: _$_6bb3[10],
                    escape: _$_6bb3[5]
                });
                a[_$_6bb3[1]]()
            });
            $(_$_6bb3[13])[_$_6bb3[8]](_$_6bb3[3], function (a) {
                a[_$_6bb3[1]]();
                $(_$_6bb3[7])[_$_6bb3[6]]({
                    type: _$_6bb3[12],
                    escape: _$_6bb3[5]
                });
                a[_$_6bb3[1]]()
            });
            b();

            function b() {
                $(_$_6bb3[19])[_$_6bb3[18]](function (h, g) {
                    $(this)[_$_6bb3[15]](_$_6bb3[14]);
                    $(this)[_$_6bb3[15]](_$_6bb3[16]);
                    $(this)[_$_6bb3[15]](_$_6bb3[17])
                });
                $(_$_6bb3[21])[_$_6bb3[18]](function (h, g) {
                    $(this)[_$_6bb3[15]](_$_6bb3[20]);
                    $(this)[_$_6bb3[15]](_$_6bb3[17])
                });
                var f = _$_6bb3[22];
                f += _$_6bb3[22];
                var c = [_$_6bb3[23], _$_6bb3[24], _$_6bb3[7], _$_6bb3[25]];
                if ($(c[2])[c[1]](c[0])) {
                    $(c[2])[c[0]]()[c[3]]()
                };
                var d = [_$_6bb3[26], _$_6bb3[27], _$_6bb3[28], _$_6bb3[29], _$_6bb3[30], _$_6bb3[31], _$_6bb3[23], _$_6bb3[7]];
                $(d[7])[d[6]]({
                    "aLengthMenu": [
                        [5, 10, 25, 50, 100, 150, 250, 500, -1],
                        [5, 10, 25, 50, 100, 150, 250, 500, d[0]]
                    ],
                    "iDisplayLength": 5,
                    "sPaginationType": d[1],
                    "bJQueryUI": false,
                    "bAutoWidth": false,
                    "bLengthChange": true,
                    "fnInitComplete": function (j, i) {
                        $(d[5])[d[4]](d[2], d[3])
                    }
                });
                $(_$_6bb3[34])[_$_6bb3[33]](_$_6bb3[32]);
                $(_$_6bb3[7])[_$_6bb3[36]](_$_6bb3[35])
            }
        })
    </script>
</asp:Content>
