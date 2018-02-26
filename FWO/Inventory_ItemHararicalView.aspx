<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="Inventory_ItemHararicalView.aspx.cs" Inherits="FRDP.Inventory_ItemHararicalView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="plugins/misc/jquery-treeview-master/jquery.treeview.js"></script>
    <link href="plugins/misc/jquery-treeview-master/jquery.treeview.css" rel="stylesheet" />
    <link href="plugins/misc/jquery-treeview-master/demo/screen.css" rel="stylesheet" />
    <style type="text/css">
        .adder {
            width: 15px;
            margin-left: 15px;
        }

        .editor {
            width: 15px;
            margin-left: 15px;
        }
        /*li:hover {
                background-color:gray;
            }*/
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon8 icomoon-icon-equalizer-2"></span>
                        <span>Inventry Items</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div id="sidetree" style="margin-left: 70px;">
                        <div class="treeheader">&nbsp;</div>
                        <div id="sidetreecontrol"><a href="?#">Collapse All</a> | <a href="?#">Expand All</a></div>
                        <asp:Label ID="lbllist" runat="server" Text=""></asp:Label>

                    </div>
                    <br />
                </div>

            </div>

        </div>
    </div>


        <script type="text/javascript">
            $(document).ready(function () {
                $("#tree").treeview({
                    collapsed: true,
                    animated: "medium",
                    control: "#sidetreecontrol",
                    persist: "location"
                });
            });
    </script>


  
</asp:Content>
