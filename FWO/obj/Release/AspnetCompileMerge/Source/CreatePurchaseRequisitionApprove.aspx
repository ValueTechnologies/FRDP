<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="CreatePurchaseRequisitionApprove.aspx.cs" Inherits="FRDP.CreatePurchaseRequisitionApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="plugins/misc/selectize/dist/js/standalone/selectize.js"></script>
    <link href="plugins/misc/selectize/dist/css/selectize.bootstrap3.css" rel="stylesheet" />
    <!-- Build page from here: -->
    <div class="row-fluid">

        <div class="span2">
            <div class="email-nav well">
                <ul class="nav nav-list">
                    <li class="nav-header">Requisitions</li>
                    <li class="sideBtns active" prm="1"><a>Today</a></li>
                    <li class="sideBtns"  prm="2"><a>Important</a></li>
                    <li class="sideBtns"  prm="3"><a>Pending</a></li>
                    <li class="sideBtns" prm="4"><a>All Requ...</a></li>
                    <li class="nav-header">Processed</li>
                    <li class="sideBtns"  prm="5"><a>Issued Requ...</a></li>
                    <li class="divider"></li>
                    <li class="sideBtns"  prm="6"><a>Drafts</a></li>
                    <li class="divider"></li>
                    <li class="sideBtns"  prm="7"><a>Archive</a></li>
                </ul>
            </div>
            <!-- End .email-nav-->
        </div>
        <!-- End .span2-->

        <div class="span10">

            <div class="email-content">

                <div class="email-header">

                    <div class="btn-toolbar" style="margin: 0;">
                        <div class="btn-group">
                            <button class="btn tip" title="Refresh inbox"><span class="icon16 icomoon-icon-refresh"></span></button>
                        </div>
                        <div class="btn-group">
                            <button class="btn tip" title="Archive"><span class="icon16 icomoon-icon-box"></span></button>
                            <button class="btn tip" title="Mark as spam"><span class="icon16 icomoon-icon-blocked"></span></button>
                            <button class="btn tip" title="Delete"><span class="icon16 icomoon-icon-remove-5"></span></button>
                        </div>
                        <div class="btn-group">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                More
											<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Mark as unread</a></li>
                                <li><a href="#">Add star</a></li>
                                <li><a href="#">Filter message</a></li>
                                <li><a href="#">Mute</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <!-- End Email-header -->

                <div class="box plain">

                    <div class="title"></div>

                    <div class="content noPad clearfix">
                        <table id="reqlist" cellpadding="0" cellspacing="0" border="0" class="emailTable display table" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkAll">
                                        <input type="checkbox" id="selectall" value="all" class="nostyle tip" title="Select All" />
                                    </th>
                                    <th><span class="icon16 icomoon-icon-star-3"></span></th>
                                    <th style="text-align: left;">Requisition</th>
                                    <th style="text-align: left;">Subject</th>
                                    <th></th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%--                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" class="nostyle" value="1" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="unread link">Jenna Haiz<span class="label marginL10">jena@haiz.com</span><span class="label label-success marginL10">3</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="unread link">Hello my friend  <span>- Thank you for contacting me so fast, you are ...</span></a>
                                    </td>
                                    <td class="attachment">
                                        <a href="#" rel="popover" data-content="main.jpg - 423 kb </br> css.zip - 890 kb  " data-original-title="2 files" data-placement="bottom">
                                            <span class="icon16 icomoon-icon-flag-4"></span>
                                        </a>
                                    </td>
                                    <td class="date">2.32 pm</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Tod Gream<span class="label marginL10">tod@tod.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Something new  <span>- I find something new for you just click on ...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">3.00 am</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Anthony Danner<span class="label marginL10">anthony@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 28</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star-3"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Steve Mcguinness<span class="label marginL10">steve@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment">
                                        <a href="#" rel="popover" data-content="main.jpg - 3 MB" data-original-title="1 file" data-placement="bottom">
                                            <span class="icon16 icomoon-icon-flag-4"></span>
                                        </a>
                                    </td>
                                    <td class="date">Aug 28</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Ruby Mclemore<span class="label marginL10">rubyMclemore@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 27</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Benjamin Pfeifer<span class="label marginL10">benjamin@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 27</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Scott Stidham<span class="label marginL10">scottStidham@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 25</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Benjamin Larosa<span class="label marginL10">larosaNosa@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 20</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star-3"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Antonio Ferrari<span class="label marginL10">ant_ferrari@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 20</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Steven Neill<span class="label marginL10">Steven1345@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 18</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Yolanda Reeder<span class="label marginL10">reeder998@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 17</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Jose Bui<span class="label marginL10">josebui@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 17</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Jose Marquardt<span class="label marginL10">marquardt@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 10</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Henry Mckenzie<span class="label marginL10">henryMckenize@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 8</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Jonathan Backus<span class="label marginL10">backus@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 8</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Glenn Bauman<span class="label marginL10">bauman@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 3</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Jack Reed<span class="label marginL10">reedjack3@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 2</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star-3"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Sylvia Sasaki<span class="label marginL10">sylviasasaki@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 2</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Walter Rueda<span class="label marginL10">walter13@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 2</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Agnes Heffernan<span class="label marginL10">agnesHeff@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 1</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Flora Zavala<span class="label marginL10">flora_zavala@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 1</td>
                                </tr>
                                <tr>
                                    <td class="check">
                                        <input type="checkbox" id="checkbox" value="1" class="nostyle" /></td>
                                    <td class="star"><span class="icon16 icomoon-icon-star"></span></td>
                                    <td class="from">
                                        <a href="#" class="link">Sharon Drum<span class="label marginL10">sharon_kitty@gmail.com</span>
                                        </a>
                                    </td>
                                    <td class="subject">
                                        <a href="#" class="link">Lorem ipsum dolor  <span>- consectetur adipisicing elit, sed iusmod...</span></a>
                                    </td>
                                    <td class="attachment"></td>
                                    <td class="date">Aug 1</td>
                                </tr>--%>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- End .box -->

                <div class="compose well">
                    <div class="page-header">
                        <h4>Compose Requisition</h4>
                        <div class="actions">
                            <button id="btnsendt" r="0" st="1" class="btn btn-danger marginR10"><strong>SEND</strong></button>
                            <button id="btnsavet" r="0" st="0" class="btn marginR10">Save</button>
                            <button id="btndiscardt" class="btn marginR10">Discard</button>
                        </div>
                    </div>
                    <form class="compose form-horizontal">


                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1" for="to">To:</label>

                                    <div class="span3">
                                        <select id="LocationsID" class="clsfrm" <%--style="width: 93.5%;"--%>></select>
                                    </div>
                                    <label class="form-label span1">Store:</label>
                                    <div class="span7">
                                        <select id="ddlStore" class="clsfrm" style="width: 108.55%;"></select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1" for="subject">Subject:</label>
                                    <div>
                                        <input class="span11 clsfrm" id="subjectR" name="subject" type="text" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1">Item:</label>

                                    <%-- <input class="span10" id="subject" name="subject" type="text" />--%>
                                    <select id="ddlItem" class="span11 clsfrm">
                                    </select>

                                </div>
                            </div>
                        </div>



                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span1">Quality:</label>
                                    <div class="span7">
                                        <input class="clsfrm" id="txtQuality" name="txtQuality" type="text" style="width: 95%;" />
                                    </div>
                                    <label class="span1 form-label">Quantity:</label>
                                    <div class="span2">
                                        <input class="clsfrm Integer" id="txtQuantity" name="txtQuantity" type="text" style="width: 75%; margin-left: 10px;" />
                                    </div>

                                    <label id="lblUnit" class="form-label span1"></label>
                                    <div class="span1" style="width: 7.55%; text-align: right;">
                                        <button id="btnRAdd" forupdate="0" class="btn btn-info">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <table id="tblitsms" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                                        <thead>
                                            <tr>
                                                <th style="width: 30px;">#</th>
                                                <th>Item</th>
                                                <th>Quality</th>
                                                <th style="width: 100px;">Quantity</th>
                                                <th style="width: 50px;">Unit</th>
                                                <th style="width: 60px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%--                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>PC</td>
                                                <td>
                                                    <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                                    <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <td>PC</td>
                                                <td>
                                                    <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                                    <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                                </td>
                                            </tr>--%>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="3" style="text-align: center; font-weight: bold;">Total</td>
                                                <td id="totalitems" style="text-align: center; font-weight: bold;"></td>
                                                <td colspan="2"></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <textarea class="span12 elastic" id="textareaRdescription" rows="8"></textarea>
                                </div>
                            </div>
                        </div>

                    </form>

                    <div style="text-align: right;">
                        <div class="actions">
                            <button id="btnsendf" r="0" st="1" class="btn btn-danger marginR10"><strong>SEND</strong></button>
                            <button id="btnsavef" r="0" st="0" class="btn marginR10">Save</button>
                            <button id="btndiscardf" class="btn marginR10">Discard</button>
                        </div>
                    </div>
                </div>
                <!-- End .compose -->

                <div class="read-email well">

                    <div class="page-header">
                        <div class="actions">
                            <button id="backToInbox" class="btn marginR10 tip" title="Back to inbox"><span class="icon16 icomoon-icon-arrow-left-3"></span></button>
                            <button id="save" class="btn marginR10 tip" title="Reply"><span class="icon16 icomoon-icon-reply"></span></button>
                            <button id="discard" class="right btn btn-danger marginR10 tip" title="Delete"><span class="icon16 icomoon-icon-remove-5 white"></span></button>
                        </div>
                    </div>
                    <form class="readmail form-horizontal">

                        <div class="form-row row-fluid">
                            <div class="span2">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="to">Requisition:</label>
                                    <%--<input class="span10" id="txtReqNo" name="txtReqNo" type="text" value="" readonly="readonly" />--%>
                                </div>
                            </div>
                            <div class="span10" style="margin-left: 0px;">
                                <div class="row-fluid">
                                    <div class="span5">
                                        <input id="txtReqNo" name="txtReqNo" type="text" value="" readonly="readonly" style="width: initial;" />
                                    </div>

                                    <div class="span7" style="margin-left: 16px; text-align: right;">
                                        <strong>Date: </strong>
                                        <input id="reqDated" name="txtReqNo" type="text" value="" readonly="readonly" style="width: 100px; text-align: right;" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="to">Subject:</label>
                                    <input class="span10" id="txtReqSubject" name="txtReqSubject" type="text" value="" readonly="readonly" />
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="subject">Sender:</label>
                                    <div>
                                        <div class="span10" id="dvpersonDet"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <label class="form-label span2" for="subject">Date:</label>
                                    <div style="margin-top: 7px;">
                                        <span id="reqDated"></span>
                                        <%--                                        <span class="span10 help-block">
                                            <dl class="attach">
                                                <dd><a href="#" class="icon12 icomoon-icon-file-pdf">&nbsp;main.pdf</a></dd>
                                                <dd><a href="#" class="icon12 icomoon-icon-file-zip">&nbsp;package.zip</a></dd>
                                                <dd><a href="#" class="icon12 icomoon-icon-file-css">&nbsp;layout.css</a></dd>
                                            </dl>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>--%>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <textarea id="reqDescipt" class="span12 elastic" readonly="readonly" rows="8"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-row row-fluid">
                            <div class="span12">
                                <div class="row-fluid">
                                    <table id="tblReqitsms" class="responsive table table-striped table-bordered table-condensed" style="border-right: 1px solid #c4c4c4;">
                                        <thead>
                                            <tr>
                                                <th style="width: 30px;">#</th>
                                                <th>Item</th>
                                                <th>Quality</th>
                                                <th style="width: 100px;">Quantity</th>
                                                <th style="width: 100px;display:none;">Availability</th>
                                                <th style="width: 50px;">Unit</th>
                                                <th style="width: 60px;display:none;">Issue</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%--                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>PC</td>
                                                <td>
                                                    <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                                    <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <td>PC</td>
                                                <td>
                                                    <a href="#" class="tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>
                                                    <a href="#" class="tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>
                                                </td>
                                            </tr>--%>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="3" style="text-align: center; font-weight: bold;">Total</td>
                                                <td id="totalReqitems" style="text-align: center; font-weight: bold;"></td>
                                                <td id="totalReqAvailable" style="text-align: center; font-weight: bold;display:none;"></td>
                                                <td></td>
                                                <td id="totalReqIssue" style="text-align: center; font-weight: bold;display:none;"></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </form>
                    <div style="text-align: right;">
                        <div class="actions">
                            <button id="btnReqsendf" r="0" st="2" class="btn btn-danger marginR10"><strong>Approve</strong></button>
                            <button id="btnReqsendf2" r="0" st="2" class="btn btn-info marginR10"><strong>Reject</strong></button>
                            
                            <%--<button id="btnReqdiscardf" class="btn btn-info marginR10">Issue Later</button>--%>
                            <button id="btnReqsavef" r="0" st="1" class="btn marginR10">View Later</button>
                        </div>
                    </div>
                </div>
                <!-- End .read-email -->

            </div>
            <!-- End .email-content -->

        </div>
        <!-- End .span2-->

    </div>
    <!-- End .row-fluid -->
    <!--End page -->
    <script type="text/javascript">
        // document ready function
        $(document).ready(function () {

            //26
            function PersonDetails(EmpID) {
                $.ajax({
                    type: 'GET',
                    url: "EmpReg.ashx/?ID=42ǁ" + EmpID,
                    success: function (data) {




                        var txt = '<table class="table">\
           <tbody>\
               <tr class="success">\
                   <td rowspan="3" style="width: 76px; border-left: 1px solid #c4c4c4; border-bottom: 1px solid #c4c4c4;">\
                       <img id="imgEmpPhoto" src="Uploads/EmployeePhoto/0.png" alt="" style="width: 65px;padding: 5px;    border: 1px solid #c4c4c4;    border-radius: 2px;    -webkit-border-radius: 2px;    -moz-border-radius: 2px;" class="marginR10" /></td>\
                   <td style="text-align: left; width: 80px;"><strong>Emp#</strong></td>\
                   <td style="text-align: left;" id="tL1"></td>\
                   <td style="text-align: left; width: 90px;"><strong>Name</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL2"></td>\
               </tr>\
               <tr class="error">\
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>CNIC</strong></td>\
                   <td style="text-align: left;" id="tL3"></td>\
                   <td style="text-align: left;"><strong>Father Name</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL4"></td>\
               </tr>\
               <tr class="info">\
                   <td style="text-align: left;    border-left: 1px solid #c4c4c4;"><strong>Designation</strong></td>\
                   <td style="text-align: left;" id="tL5"></td>\
                   <td style="text-align: left;"><strong>Appointed At</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL6"></td>\
               </tr>\
                <tr class="error">\
                <td style="border-left: 1px solid #c4c4c4;">&nbsp;</td>\
                   <td style="text-align: left;"><strong>Shift</strong></td>\
                   <td style="text-align: left;" id="tL7"></td>\
                   <td style="text-align: left;"><strong>Contact</strong></td>\
                   <td style="text-align: left; border-right: 1px solid #c4c4c4;" id="tL8"></td>\
               </tr>\
           </tbody>\
       </table>';
                        var jd = $.parseJSON(data);
                        $('#dvpersonDet').html(txt);
                        $('#imgEmpPhoto').attr('src', jd[0].PhotoExtension);
                        $('#tL1').html(jd[0].EmpNo);
                        $('#tL2').html(jd[0].Full_Name);
                        $('#tL3').html(jd[0].CNIC);
                        $('#tL4').html(jd[0].FatherName);
                        $('#tL5').html(jd[0].Designations);
                        $('#tL6').html(jd[0].Area);
                        $('#tL7').html(jd[0].Shift);
                        $('#tL8').html(jd[0].ContactNos);
                    }
                });
            }

            //26



            //------------- Email page  -------------//

            var emailTable = $('.emailTable');
            var emailStar = emailTable.find('td.star>span.icon16');

            //setup the star in click
            emailStar.live('click', function () {
                var status = 0;
                if ($(this).hasClass('icomoon-icon-star-3')) {
                    $(this).removeClass('icomoon-icon-star-3').addClass('icomoon-icon-star');
                    //make callback here
                    status = 0
                } else {
                    $(this).removeClass('icomoon-icon-star').addClass('icomoon-icon-star-3');
                    //make callback here
                    status = 1;
                }
                console.log(status);
                var $this = $(this).parent();
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=37ǁ" + $this.attr('rid') + "ǁ" + status,
                    success: function (response) {
                    }
                });
            });

            //auto complete for compose To form field
            //$('#to').typeahead({
            //    source: ['jonh@yahoo.com', 'silva@yahoo.com', 'carlos@gmail.com', 'sugge@gmail.com']
            //})

            //check all checkboxes in email table
            $(".checkAll").live('click', function () {
                var $this = $(this);
                var checkedStatus = $this.find('span').hasClass('checked');
                $(".emailTable tr .check input:checkbox").each(function () {
                    this.checked = checkedStatus;
                    if (checkedStatus == this.checked) {
                        $(this).closest('.checker > span').removeClass('checked');
                    }
                    if (this.checked) {
                        $(this).closest('.checker > span').addClass('checked');
                    }
                });
            });

            //show compose form
            $('.composeBtn>.btn').click(function () {
                $('.email-content>.box.plain').fadeOut(200);
                $('.read-email').fadeOut();
                $('.compose').fadeIn();
                $('.sideBtns').removeClass('active');
            });

            //close compose form on discard click
            $('#btndiscardt, #btndiscardf').click(function () {
                ClearCompose();
                $($('.sideBtns')[3]).addClass('active');
                $('.compose').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);
            });

            //save click event
            $('#btnsavet, #btnsavef, #btnsendt, #btnsendf').live('click', function () {
                var $this = $(this);
                if ($.trim($('#tblitsms tbody').html()) == "") {
                    alertR('Enter some items please...!');
                    return false;
                }
                if ($this.attr('st') == "1" && ($('#ddlStore').val() == null || $('#ddlStore').val() == "")) {
                    alertR('Select Some Store Please..');
                    return false;
                }
                var headd = [];
                header = {};

                header["LocationID"] = $($('.clsfrm')[0]).val();
                header["LocationName"] = $($('.clsfrm')[0]).find("option:selected").text();
                header["StoreID"] = $($('.clsfrm')[1]).val();
                header["StoreName"] = $($('.clsfrm')[1]).find("option:selected").text();
                header["Subject"] = $($('.clsfrm')[2]).val();
                header["Description"] = $('#textareaRdescription').val();
                headd.push(header);
                var hh = JSON.stringify({ Head: header });
                var ii = JSON.stringify({ Items: items });
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "CreateRequisition.aspx/MakeRequisition",
                    data: "{'h':'" + hh + "','i':'" + ii + "','con':'" + $this.attr('st') + "','thisid':'" + $this.attr('r') + "'}",
                    success: function (response) {
                        if ($this.attr('st') == "0") {
                            $('#btnsendt').attr('r', response.d);
                            $('#btnsavet').attr('r', response.d);
                            $('#btnsendf').attr('r', response.d);
                            $('#btnsavef').attr('r', response.d);
                            alertG('Recoard Saved');
                            Loadreqlist();
                        }
                        else {
                            Loadreqlist();
                            $('.compose').fadeOut(200);
                            $('.email-content>.box.plain').fadeIn(300);
                            ClearCompose();
                            $.pnotify({
                                type: 'success',
                                title: 'Done',
                                text: 'Requisition sent successfull',
                                icon: 'picon icon16 iconic-icon-check-alt white',
                                opacity: 0.95,
                                history: false,
                                sticker: false
                            });
                        }
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
                //save callback here
            });
            $('.sideBtns').live('click', function () {
                var $this = $(this);
                $('.sideBtns').removeClass('active');
                $this.addClass('active');
                //ClearCompose();
                $('.compose').fadeOut(200);
                $('.read-email').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);
                Loadreqlist();
            });
            Loadreqlist();
            function Loadreqlist() {
                var searchparam = $('.sideBtns.active').attr('prm');
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=71ǁ" + searchparam,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            var startype = "icon16 icomoon-icon-star";
                            if (itm.bIsImportantForSender == true) {
                                startype = "icon16 icomoon-icon-star-3";
                            }

                            var statusof = "icon16 icomoon-icon-alarm"
                            if (parseInt(itm.Status) == 2) {
                                statusof = "icon16 icomoon-icon-undo-2";
                            }
                            opt += '<tr rid="' + itm.tblInvReqMainID + '">\
                                    <td class="check">\
                                        <input  rid="' + itm.tblInvReqMainID + '" type="checkbox" id="checkbox" class="nostyle" value="1" /></td>\
                                    <td class="star" rid="' + itm.tblInvReqMainID + '"><span class="' + startype + '"></span></td>\
                                    <td class="from">\
                                        <a  rid="' + itm.tblInvReqMainID + '" rno="' + itm.tblInvReqNo + '" sender="' + itm.EnterByEmpID + '" sbjct="' + itm.Subject + '" dated="' + itm.Dated + '" descript="' + itm.Description + '" st="' + itm.Status + '" class="unread link"><span class="label">' + itm.tblInvReqNo + '</span></a>\
                                    </td>\
                                    <td class="subject">\
                                        <a   rid="' + itm.tblInvReqMainID + '" rno="' + itm.tblInvReqNo + '" sender="' + itm.EnterByEmpID + '" sbjct="' + itm.Subject + '" dated="' + itm.Dated + '" descript="' + itm.Description + '" st="' + itm.Status + '"  class="unread link">' + itm.Subject + '  <span>- ' + itm.subDescription + ' ...</span></a>\
                                    </td>\
                                    <td class="attachment">\
                                        <a>\
                                            <span class="'+ statusof + '"></span>\
                                        </a>\
                                    </td>\
                                    <td class="date">' + itm.Dated + '</td>\
                                </tr>';
                        });

                        if ($('#reqlist').hasClass('dataTable')) {
                            $('.emailTable').dataTable().fnDestroy();
                        }

                        $('#reqlist tbody').html(opt);

                        //--------------- Data tables ------------------//

                        if ($('#reqlist').hasClass('emailTable')) {
                            $('.emailTable').dataTable({
                                "bJQueryUI": false,
                                "bAutoWidth": false,
                                "bLengthChange": false,
                                "oLanguage": {
                                    "sSearch": "",
                                    "sInfo": "Got a total of _TOTAL_ emails to show (_START_ to _END_)"
                                },
                                "fnDrawCallback": function () {
                                    $("input[type=checkbox]").uniform();
                                },
                                "aoColumns": [
                                    {
                                        "sWidth": "10px",
                                        "bSortable": false
                                    },
                                    {
                                        "sWidth": "10px",
                                        "bSortable": false
                                    },
                                    {
                                        "bSortable": false
                                    },
                                    {
                                        "bSortable": false
                                    },
                                    {
                                        "sWidth": "20px",
                                        "bSortable": false
                                    },
                                    {
                                        "sWidth": "80px",
                                        "bSortable": false
                                    }
                                ]
                            });
                        }
                    }
                });
            }
            function ClearCompose() {
                header = {};
                items = [];
                $('#btnsendt').attr('r', '0');
                $('#btnsavet').attr('r', '0');
                $('#btnsendf').attr('r', '0');
                $('#btnsavef').attr('r', '0');
                $('#tblitsms tbody').html('');
                $('#subjectR').val('');
                $('#txtQuality').val('');
                $('#txtQuantity').val('');
                $('#totalitems').html('');
                $('#textareaRdescription').val('');
            }
            //on send msg click
            //$('#btnsendt,#btnsendf').click(function () {
            //    $('.compose').fadeOut(200);
            //    $('.email-content>.box.plain').fadeIn(300);
            //    //add some notification
            //    $.pnotify({
            //        type: 'success',
            //        title: 'Done',
            //        text: 'Requisition send successfull',
            //        icon: 'picon icon16 iconic-icon-check-alt white',
            //        opacity: 0.95,
            //        history: false,
            //        sticker: false
            //    });
            //    //calback function here
            //});

            //on send msg click
            $('#backToInbox').click(function () {
                $('.read-email').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);
            });
            $('#btnReqsendf').live('click', function () {

                $this = $(this);
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=73ǁ" + $this.attr('rid') + "ǁ" + $this.attr('st')+ "ǁApproved",
                    success: function (response) {
                        $('.read-email').fadeOut(200);
                        $('.email-content>.box.plain').fadeIn(300);
                        $('#toTopHover').click();
                    }
                });
            });
            $('#btnReqsendf2').live('click', function () {

                $this = $(this);
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=73ǁ" + $this.attr('rid') + "ǁ" + $this.attr('st') + "ǁRejected",
                    success: function (response) {
                        $('.read-email').fadeOut(200);
                        $('.email-content>.box.plain').fadeIn(300);
                        $('#toTopHover').click();
                    }
                });
            });
            $('#btnReqdiscardf').live('click', function () {
                $('.read-email').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);
                $('#toTopHover').click();
            });
            $('#btnReqsavef').live('click', function () {
                $('.read-email').fadeOut(200);
                $('.email-content>.box.plain').fadeIn(300);
                $('#toTopHover').click();
            });
            emailTable.find('td a.link').live('click', function () {
                $('.email-content>.box.plain').fadeOut(200);
                $('.read-email').fadeIn(300);
                $('#txtReqNo').val($(this).attr('rno'));
                $('#txtReqSubject').val($(this).attr('sbjct'));
                $('#reqDated').val($(this).attr('dated'));
                $('#reqDescipt').val($(this).attr('descript'));
                PersonDetails($(this).attr('sender'));
                LoadtblReqitsmsByReqID($(this).attr('rid'), $(this).attr('st'));
                //calback function here
                //$('.email-content>.box.plain').fadeOut(200);
                //$('.read-email').fadeOut();
                //$('.compose').fadeIn();
            });

            function LoadtblReqitsmsByReqID(obj, st) {

                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=72ǁ" + obj,
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '', ttl = 0, ttl1 = 0, ttl2 = 0;
                        $.each(jd, function (i, j) {
                            ttl += parseInt(j.Quantity);
                            ttl1 += parseInt(j.Availability);
                            ttl2 += parseInt(j.QuantityIssued);
                            opt += '<tr iid="' + j.tblInvReqSubID + '">\
                                                <td>'+ (parseInt(i) + 1).toString() + '</td>\
                                                <td>' + j.ItemName + '</td>\
                                                <td>' + j.Quality + '</td>\
                                                <td>' + j.Quantity + '</td>\
                                                <td style="display:none;">' + j.Availability + '</td>\
                                                <td>' + j.Unit + '</td>\
                                                <td style="display:none;">\
                                                   <input class="txtReqItemIssue Integer" ReqSubID="'+ j.tblInvReqSubID + '" requiredQty="' + j.Quantity + '" availableqty="' + j.Availability + '" issued="' + j.QuantityIssued + '" type="text" value="0" style="width: 78%;" /> \
                                                </td>\
                                            </tr>'
                        });
                        $('#tblReqitsms tbody').html(opt);
                        $('#totalReqitems').html(ttl);
                        $('#totalReqAvailable').html(ttl1);
                        $('#totalReqIssue').html(ttl2);

                        $('#btnReqsendf').attr('rid', obj);
                        if (parseInt(st) >= 2) {
                            $('#btnReqsendf').hide();
                            $('#btnReqsendf2').hide();
                            $('#btnReqdiscardf').hide();
                            $('#btnReqsavef').hide();
                            $('.txtReqItemIssue').attr('readonly', 'readonly');
                        }
                        else {
                            $('#btnReqsendf').show();
                            $('#btnReqsendf2').show();
                            $('#btnReqdiscardf').show();
                            $('#btnReqsavef').show();
                            //$('.txtReqItemIssue').attr('readonly', 'readonly');
                        }
                    }
                });


            }

            $('.txtReqItemIssue').live('focusout', function () {
                var $this = $(this);
                if ($this.attr('issued') != $this.val()) {
                    var qt = 0;
                    qt = parseFloat($this.attr('requiredQty')) >= parseFloat($this.attr('availableqty')) ? parseFloat($this.attr('availableqty')) : parseFloat($this.attr('requiredQty'));
                    if (parseFloat($this.val()) > qt) {
                        $this.val(qt);
                        alertR("Cant be more than " + qt);
                    }
                    var ttl2 = 0;
                    $('.txtReqItemIssue').each(function (i, j) {
                        // element == this
                        ttl2 += parseFloat($(this).val());
                    });
                    $('#totalReqIssue').html(ttl2);
                    $.ajax({
                        type: "POST",
                        url: "inv.ashx/?ID=36ǁ" + $this.attr('reqsubid') + "ǁ" + $this.val(),
                        success: function (response) {
                            $this.attr('issued', $this.val());
                        }
                    });
                }
            });
            //Boostrap modal
            $('#myModal').modal({ show: false });

            //add event to modal after closed
            $('#myModal').on('hidden', function () {
                console.log('modal is closed');
            })



            //0000000000000000000000000000000000000000000000000000000000000000000000000
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=17ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.CompanyID + '">' + itm.CompanyName + '</option>';
                        });
                        $('#LocationsID').html(opt);
                        if (opt != "") {
                            ddlStore_Bind();
                        }
                        else {
                            $('#ddlStore').html('');
                            //$('#ddlPortion').html('');
                            //LoadTbl();
                        }
                    }
                });
            });



            $('#LocationsID').live('change', ddlStore_Bind);
            function ddlStore_Bind() {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=28ǁ" + $('#LocationsID').val(),
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.ID + '">' + itm.Name + '</option>';
                        });
                        $('#ddlStore').html(opt);

                    }
                });
            }


            var thisitms;
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "inv.ashx/?ID=30ǁ",
                    success: function (response) {
                        var jd = $.parseJSON(response), opt = '';
                        thisitms = jd;
                        $.each(jd, function (i, itm) {
                            opt += '<option value="' + itm.tblInvItemsID + '">' + itm.fullCodeName + '</option>';
                        });
                        $('#ddlItem').html(opt);
                        if ($('#ddlItem').hasClass('selectized')) {
                            $('#ddlItem')[0].selectize.destroy();
                        }
                        $("#ddlItem").selectize();
                        FindUnit($("#ddlItem").val());
                    }
                });
            });

            $('#ddlItem').live('change', function () {
                FindUnit($(this).val());
            });
            function FindUnit(obj) {

                $.each(thisitms, function (i, itm) {
                    if (itm.tblInvItemsID == obj) {
                        $('#lblUnit').html(itm.Unit);
                        return false;
                    }
                });
            }
            var items = [];
            var header;
            $('#btnRAdd').live('click', function (e) {
                e.preventDefault();
                if ($('#ddlItem').val() == "" || $('#ddlItem').val() == null) {
                    alertR('Select Valid Item');
                    return false;
                }

                if ($($('.clsfrm')[7]).val() == "") {
                    alertR('Select Valid Item Quantity');
                    return false;
                }

                var $tr = $('#tblitsms tbody tr[iid=' + $('#ddlItem').val() + ']');
                var qty = $('#txtQuantity').val();
                if ($tr.length > 0) {
                    qty = parseInt(qty) + parseInt($tr.attr('qty'));
                    items.splice($tr.attr('ar'), 1);
                }

                item = {}
                item["LocationID"] = $($('.clsfrm')[0]).val();
                item["LocationName"] = $($('.clsfrm')[0]).find("option:selected").text();
                item["StoreID"] = $($('.clsfrm')[1]).val();
                item["StoreName"] = $($('.clsfrm')[1]).find("option:selected").text();
                item["Subject"] = $($('.clsfrm')[2]).val();
                item["ItemID"] = $('#ddlItem').val();
                item["ItemName"] = $('#ddlItem option:selected:').text();
                item["Quality"] = $('#txtQuality').val();
                item["Quantity"] = qty;
                item["Unit"] = $('#lblUnit').html();
                items.push(item);
                $('#txtQuality').val('');
                $('#txtQuantity').val('');

                LoadItsms(items);
            });
            $('.clsitemdelete').live('click', function () {
                $this = $(this);
                items.splice($this.attr('ar'), 1);
                LoadItsms(items);
            });

            $('.clsitemedit').live('click', function () {

                $this = $(this).parent().parent();

                if ($('#ddlItem').hasClass('selectized')) {
                    $('#ddlItem')[0].selectize.destroy();
                }
                $('#ddlItem').val($this.attr('iid'));
                $("#ddlItem").selectize();
                $('#txtQuality').val($this.attr('qly'));
                $('#txtQuantity').val($this.attr('qty'));
            });


            function LoadItsms(obj) {
                var opt = "", ttl = 0;
                $.each(obj, function (i, j) {
                    ttl += parseInt(j.Quantity);
                    opt += '<tr iid="' + j.ItemID + '" ar="' + (parseInt(i)).toString() + '" qty="' + j.Quantity + '" qly="' + j.Quality + '">\
                                                <td>'+ (parseInt(i) + 1).toString() + '</td>\
                                                <td>' + j.ItemName + '</td>\
                                                <td>' + j.Quality + '</td>\
                                                <td>' + j.Quantity + '</td>\
                                                <td>' + j.Unit + '</td>\
                                                <td>\
                                                    <a ar="' + (parseInt(i)).toString() + '" class="clsitemedit tip" oldtitle="Edit task" title="" aria-describedby="ui-tooltip-13"><span class="icon12 icomoon-icon-pencil"></span></a>\
                                                    <a ar="' + (parseInt(i)).toString() + '" class="clsitemdelete tip" oldtitle="Remove task" title="" aria-describedby="ui-tooltip-14"><span class="icon12 icomoon-icon-remove"></span></a>\
                                                </td>\
                                            </tr>'
                });
                $('#tblitsms tbody').html(opt);
                $('#totalitems').html(ttl);
            }
            //ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
        });//End document ready functions

        //sparkline in sidebar area
        var positive = [1, 5, 3, 7, 8, 6, 10];
        var negative = [10, 6, 8, 7, 3, 5, 1]
        var negative1 = [7, 6, 8, 7, 6, 5, 4]

        $('#stat1').sparkline(positive, {
            height: 15,
            spotRadius: 0,
            barColor: '#9FC569',
            type: 'bar'
        });
        $('#stat2').sparkline(negative, {
            height: 15,
            spotRadius: 0,
            barColor: '#ED7A53',
            type: 'bar'
        });
        $('#stat3').sparkline(negative1, {
            height: 15,
            spotRadius: 0,
            barColor: '#ED7A53',
            type: 'bar'
        });
        $('#stat4').sparkline(positive, {
            height: 15,
            spotRadius: 0,
            barColor: '#9FC569',
            type: 'bar'
        });
        //sparkline in widget
        $('#stat5').sparkline(positive, {
            height: 15,
            spotRadius: 0,
            barColor: '#9FC569',
            type: 'bar'
        });

        $('#stat6').sparkline(positive, {
            width: 70,//Width of the chart - Defaults to 'auto' - May be any valid css width - 1.5em, 20px, etc (using a number without a unit specifier won't do what you want) - This option does nothing for bar and tristate chars (see barWidth)
            height: 20,//Height of the chart - Defaults to 'auto' (line height of the containing tag)
            lineColor: '#88bbc8',//Used by line and discrete charts to specify the colour of the line drawn as a CSS values string
            fillColor: '#f2f7f9',//Specify the colour used to fill the area under the graph as a CSS value. Set to false to disable fill
            spotColor: '#e72828',//The CSS colour of the final value marker. Set to false or an empty string to hide it
            maxSpotColor: '#005e20',//The CSS colour of the marker displayed for the maximum value. Set to false or an empty string to hide it
            minSpotColor: '#f7941d',//The CSS colour of the marker displayed for the mimum value. Set to false or an empty string to hide it
            spotRadius: 3,//Radius of all spot markers, In pixels (default: 1.5) - Integer
            lineWidth: 2//In pixels (default: 1) - Integer
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>