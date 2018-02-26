<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="AdminDesignation.aspx.cs" Inherits="FRDP.AdminDesignation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Designation Registration</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
    <tr>
        <td style="width:100px;">Designation</td>
        <td style="text-align:left;">
            <asp:TextBox ID="txtDesignation" runat="server"></asp:TextBox></td>

        </tr><tr>

        <td style="width:100px;">Abbreviation</td>
        <td style="text-align:left;">
            <asp:TextBox ID="txtAbbreviation" runat="server"></asp:TextBox></td>
    </tr>
        <tr>
            <td style="width:100px;">Status</td>
            <td style="text-align:left;">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Active" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" CssClass="btn btn-info" runat="server" Text="Save" OnClick="btnSave_Click" /></td>
        </tr>
    </tbody>
</table><br />
                                   
                                        <asp:SqlDataSource ID="SD" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" DeleteCommand="DELETE FROM [tblDesig] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblDesig] ([NAME], [Abbreviation], [bIsActive]) VALUES (@NAME, @Abbreviation, @bIsActive)" SelectCommand="SELECT [ID], [NAME], [Abbreviation], [bIsActive] FROM [tblDesig] ORDER BY [NAME]" UpdateCommand="UPDATE [tblDesig] SET [NAME] = @NAME, [Abbreviation] = @Abbreviation, [bIsActive] = @bIsActive WHERE [ID] = @ID">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="txtDesignation" Name="NAME" PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="txtAbbreviation" Name="Abbreviation" PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="CheckBox1" Name="bIsActive" PropertyName="Checked" Type="Boolean" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="NAME" Type="String" />
                                                <asp:Parameter Name="Abbreviation" Type="String" />
                                                <asp:Parameter Name="bIsActive" Type="Boolean" />
                                                <asp:Parameter Name="ID" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource> <div style="margin:5px;">
                                        <asp:GridView ID="GridView1" CssClass="abGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SD">
                                            <Columns>
                                                <asp:CommandField ShowEditButton="True" />
                                                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" >
                                                <ItemStyle CssClass="dpt" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Abbreviation" HeaderText="Abbreviation" SortExpression="Abbreviation" />
                                                <asp:CheckBoxField DataField="bIsActive" HeaderText="Active" SortExpression="bIsActive" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
</div>

                            </div>

                        </div>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>

      <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= btnSave.ClientID %>').live('click', function (e) {
                var val = $('#<%= txtDesignation.ClientID %>').val().toUpperCase();
                var ret = true;
                
                if ($.trim(val)=="") {
                    ret = false;
                    alertR('Enter Designation Name..!');
                    e.preventDefault();
                    return ret;
                }


                $('.dpt').each(function (i, j) {
                    // element == this
                    if ($(this).text().toUpperCase() == val) {
                        ret = false;
                    }
                });

                if (!ret) {
                    alertR('Designation Name Already Exists');
                    e.preventDefault();
                }
                return ret;
            });
        });
    </script>

</asp:Content>
