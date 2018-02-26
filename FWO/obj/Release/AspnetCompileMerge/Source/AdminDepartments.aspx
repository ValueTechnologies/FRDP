<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="AdminDepartments.aspx.cs" Inherits="FRDP.AdminDepartments" %>
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
                                        <span>Department Registration</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<br />
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
    <tr>
        <td style="width:100px;">Department</td>
        <td style="text-align:left;">
            <asp:TextBox ID="txtDeptName" runat="server"></asp:TextBox></td>

        </tr><tr>

        <td style="width:100px;">Abbreviation</td>
        <td style="text-align:left;">
            <asp:TextBox ID="txtAbbreviation" runat="server"></asp:TextBox></td>
    </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" CssClass="btn btn-info" runat="server" Text="Save" OnClick="btnSave_Click" /></td>
        </tr>
    </tbody>
</table><br />
                                    <asp:SqlDataSource ID="SDDept" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" DeleteCommand="DELETE FROM [tblDept] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblDept] ([Name], [Abbreviation]) VALUES (@Name, @Abbreviation)" SelectCommand="SELECT [ID], [Name], [Abbreviation] FROM [tblDept] ORDER BY [Name]" UpdateCommand="UPDATE [tblDept] SET [Name] = @Name, [Abbreviation] = @Abbreviation WHERE [ID] = @ID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="txtDeptName" Name="Name" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtAbbreviation" Name="Abbreviation" PropertyName="Text" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Abbreviation" Type="String" />
                                            <asp:Parameter Name="ID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <div style="margin:5px;">
                                    <asp:GridView ID="GridView1"  CssClass="abGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SDDept">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                                            <ItemStyle CssClass="dpt" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Abbreviation" HeaderText="Abbreviation" SortExpression="Abbreviation" />
                                        </Columns>
                                    </asp:GridView></div>

</div>

                            </div>

                        </div>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= btnSave.ClientID %>').live('click', function (e) {
                var val = $('#<%= txtDeptName.ClientID %>').val().toUpperCase();
                var ret = true;
                
                if ($.trim(val) == "") {
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
                    alertR('Department Name Already Exists');
                    e.preventDefault();
                }
                return ret;
            });
        });
    </script>
</asp:Content>
