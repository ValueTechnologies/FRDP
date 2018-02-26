<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="centre.aspx.cs" Inherits="FRDP.centre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <div class="row-fluid">
        <div class="span12">



                   <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span id="boxtitle"></span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
    <div style="text-align:center;margin-bottom:30px;">
<asp:DataList ID="dlButtons" runat="server" DataSourceID="dsButtons" RepeatDirection="Horizontal" Height="16px" RepeatColumns="6" Style="text-align: center" HorizontalAlign="Center">
                <ItemTemplate>
                    <br />
                    <div style="width: 158px; height: 97px" class="Grd" onclick="location.href='<%# Eval("Page_Addr") %>';" title='<%# Eval("Page_Desc") %>'>
                        <img alt="<%# Eval("Page_Name") %>" src="<%# Eval("Page_Pic") %>" width="54" height="54" />
                        <br />
                        <%# Eval("Page_Name") %>
                    </div>

                </ItemTemplate>
            </asp:DataList>

        </div>
                                    <br /><br />
</div>

                            </div>


      <asp:SqlDataSource ID="dsButtons" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_cssMenuSubForCentre" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:CookieParameter CookieName="moduleid" DefaultValue="0" Name="Module_ID" Type="Int32" />
            <asp:CookieParameter CookieName="User_Group_ID" DefaultValue="0" Name="User_Group_Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

            </div></div>
            </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#boxtitle').html($('.heading h3').html());
                });
            </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


</asp:Content>
