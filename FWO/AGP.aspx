<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="AGP.aspx.cs" Inherits="FRDP.AGP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .style1
        {
            text-align: right;
        }
        .style2
        {
            text-align: left;
        }
            .auto-style1 {
                width: 100%;
            }
    </style>
    &nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
       
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_form">
  <tr>
    <td width="40%" align="right" class="style1">Group Name :&nbsp;</td>
    <td width="60%" class="style2">  <asp:DropDownList ID="DropDownLisGroupName" runat="server" AutoPostBack="True"
        CssClass="dropbox" DataSourceID="SqlDataSourceGroupName" DataTextField="User_Group_Name"
        DataValueField="User_Group_Id" Width="301px"> </asp:DropDownList>
        <button id="btnAddGroup" class="btn btn-info marginB10">Add Group</button>

    </td>
  </tr>
  <tr>
    <td align="right" class="style1">Module Name :&nbsp;</td>
    <td class="style2"> <asp:DropDownList ID="DropDownListModuleName" runat="server" AutoPostBack="True"
            CssClass="dropbox" DataSourceID="SqlDataSourceModuleName" DataTextField="Module_Name"
            DataValueField="Module_ID" Width="301px"> </asp:DropDownList></td>
  </tr>
  <tr>
    <td align="right" class="style1" colspan="2">
        <asp:GridView ID="gvPGselect" runat="server" AutoGenerateColumns="False" CssClass="abGrid" DataKeyNames="Page_ID" DataSourceID="SqlDataSourcePageName" Width="100%">
            <AlternatingRowStyle CssClass="GridAltItem" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:HiddenField ID="HFPID" runat="server" Value='<%# Eval("Page_ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Page" SortExpression="Page_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Page_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Page_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Access Level">
                    <HeaderTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="ac" AutoPostBack="True" OnCheckedChanged="RadioButton1_CheckedChanged" />
                                </td>
                                <td>Read Only</td>
                                <td>
                                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="ac" AutoPostBack="True" OnCheckedChanged="RadioButton2_CheckedChanged" />
                                </td>
                                <td>Read/Write</td>
                                <td>
                                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="ac" AutoPostBack="True" OnCheckedChanged="RadioButton3_CheckedChanged" />
                                </td>
                                <td>Full Control</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="ac" />
                                </td>
                                <td>Read Only</td>
                                <td>
                                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="ac" />
                                </td>
                                <td>Read/Write</td>
                                <td>
                                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="ac" />
                                </td>
                                <td>Full Control</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
      </td>
  </tr>
        <tr>
            <td align="right" class="style1">&nbsp;</td>
            <td class="style2" style="font-weight:normal;">
                <asp:CheckBoxList ID="CheckBoxListPage" runat="server" CssClass="chklist" DataSourceID="SqlDataSourcePageName" DataTextField="Page_Name" DataValueField="Page_ID" RepeatColumns="2" RepeatDirection="Horizontal" style="font-weight:normal;" Visible="False">
                </asp:CheckBoxList>
            </td>
        </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td style="text-align:right;"> <%--<asp:Button ID="ButtonCheckallx" runat="server" CssClass="btn_l" Text="CheckAll" OnClick="ButtonCheckall_Click" />--%>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" OnClick="ButtonCheckall_Click" Visible="False">CheckAll</asp:LinkButton>
             <%-- <asp:Button ID="ButtonUnCheck" runat="server" CssClass="btn_l" Text="UnCheckAll" OnClick="ButtonUnCheck_Click" />--%>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-info" OnClick="ButtonUnCheck_Click" Visible="False">UnCheckAll</asp:LinkButton>
            <%--<asp:Button ID="Button1" runat="server" CssClass="btn_l" Text="Save" OnClick="Button1_Click"></asp:Button></td>--%>
      <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-info" OnClick="Button1_Click">Save</asp:LinkButton>
  </tr>
</table>
            <asp:HiddenField ID="HiddenField_Access" runat="server" />
<br />
   <asp:SqlDataSource ID="SqlDataSourceGroupName" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>"
        SelectCommand="SELECT User_Group_Name, User_Group_Id, Group_Level, StrDescription, MP FROM User_Groups ORDER BY Group_Level" InsertCommand="INSERT INTO User_Groups(User_Group_Name, StrDescription, Group_Level, MP) VALUES (@User_Group_Name, @StrDescription, @Group_Level, @MP)" UpdateCommand="UPDATE User_Groups SET User_Group_Name = @User_Group_Name, Group_Level = @Group_Level, StrDescription = @StrDescription, MP = @MP WHERE (User_Group_Id = @User_Group_Id)">
       <InsertParameters>
           <asp:ControlParameter ControlID="txtGN" Name="User_Group_Name" PropertyName="Text" />
           <asp:ControlParameter ControlID="txtDes" Name="StrDescription" PropertyName="Text" />
           <asp:ControlParameter ControlID="txtGpLevel" Name="Group_Level" PropertyName="Text" />
           <asp:ControlParameter ControlID="txtDBPage" Name="MP" PropertyName="Text" />
       </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Group_Name" />
                <asp:Parameter Name="Group_Level" />
                <asp:Parameter Name="StrDescription" />
                <asp:Parameter Name="User_Group_Id" />
                <asp:Parameter Name="MP" />
       </UpdateParameters>
            </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSourceModuleName" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>"
        SelectCommand="SELECT        Module_Name, Module_Id
FROM            Admin_User_Module
WHERE        (Status = 1)
UNION
SELECT 'Individual Pages', 0
 ORDER BY [Module_Id], [Module_Name]"> </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSourcePageName" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>"
        SelectCommand="SELECT Page_Name, Page_ID FROM Admin_User_Module_Pages WHERE (Module_ID = @Module_ID) AND (Status = 1)">
            <SelectParameters>
              <asp:ControlParameter ControlID="DropDownListModuleName" Name="Module_ID" PropertyName="SelectedValue" />
            </SelectParameters>
      
          <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Dept_Id" PropertyName="SelectedValue" />
          </DeleteParameters>
          <InsertParameters>
            <asp:ControlParameter ControlID="TextBox_Name" Name="Dept_Name" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox_Description" Name="Description" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox_abb" Name="Dept_Abb" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList_Dept_Type" Name="Dept_Type_Id" PropertyName="SelectedValue" />
          </InsertParameters>
              </asp:SqlDataSource><asp:HiddenField ID="HiddenFieldPageID" runat="server" />
          <asp:SqlDataSource ID="SqlDataSourceDeletePage" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
        DeleteCommand="DELETE FROM Admin_Group_Module_Pages WHERE (User_Group_Id = @User_Group_Id) AND (Page_ID = @Page_ID)"
        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>">
            <DeleteParameters>
              <asp:ControlParameter ControlID="HiddenFieldPageID" Name="Page_ID" PropertyName="Value" />
              <asp:ControlParameter ControlID="DropDownLisGroupName" Name="User_Group_Id" PropertyName="SelectedValue" />
            </DeleteParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSourceSave" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>"
        InsertCommand="INSERT INTO Admin_Group_Module_Pages(User_Group_Id, Module_ID, Page_ID, Status, AccessLevel) VALUES (@User_Group_Id, @Module_ID, @Page_ID, 1, @AccessLevel)"
        ProviderName="<%$ ConnectionStrings:VD_DB_ConnectionString.ProviderName %>" SelectCommand="SELECT Admin_User_Module.Module_Name, Admin_User_Module_Pages.Page_Name, Admin_User_Module_Pages.Page_URL, User_Groups.User_Group_Name, Admin_Group_Module_Pages.ID, Admin_Group_Module_Pages.Page_ID, Admin_Group_Module_Pages.Module_ID, Admin_Group_Module_Pages.User_Group_Id, CASE WHEN ISNULL(Admin_Group_Module_Pages.AccessLevel , 1) = 1 THEN 'Read Only' WHEN Admin_Group_Module_Pages.AccessLevel = 2 THEN 'Read/Write' WHEN Admin_Group_Module_Pages.AccessLevel = 3 THEN 'Full Control' END AS AccessLevel FROM Admin_Group_Module_Pages INNER JOIN Admin_User_Module ON Admin_Group_Module_Pages.Module_ID = Admin_User_Module.Module_Id INNER JOIN Admin_User_Module_Pages ON Admin_Group_Module_Pages.Page_ID = Admin_User_Module_Pages.Page_ID INNER JOIN User_Groups ON Admin_Group_Module_Pages.User_Group_Id = User_Groups.User_Group_Id WHERE (Admin_Group_Module_Pages.User_Group_Id = @User_Group_Id) AND (Admin_Group_Module_Pages.Status = 1)" DeleteCommand="update Admin_Group_Module_Pages set status=0 WHERE (ID = @ID)">
            <InsertParameters>
              <asp:ControlParameter ControlID="DropDownListModuleName" Name="Module_ID" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="HiddenFieldPageID" Name="Page_ID" PropertyName="Value" />
              <asp:ControlParameter ControlID="DropDownLisGroupName" Name="User_Group_Id" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="HiddenField_Access" Name="AccessLevel" PropertyName="Value" />
            </InsertParameters>
            <SelectParameters>
              <asp:ControlParameter ControlID="DropDownLisGroupName" Name="User_Group_Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <DeleteParameters>
              <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
            </DeleteParameters>
          </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        Width="100%" CssClass="abGrid" DataKeyNames="ID" 
        DataSourceID="SqlDataSourceSave">
              <Columns>
              <asp:BoundField DataField="Module_Name" HeaderText="Module Name" SortExpression="Module_Name" />
              <asp:BoundField DataField="Page_Name" HeaderText="Page Name" SortExpression="Page_Name" />
              <asp:BoundField DataField="Page_URL" HeaderText="Page URL" SortExpression="Page_URL" />
              <asp:BoundField DataField="AccessLevel" HeaderText="Access Level" SortExpression="User_Group_Name" />
              <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID" Visible="False" />
              <asp:BoundField DataField="Page_ID" HeaderText="Page_ID" SortExpression="Page_ID"
                                Visible="False" />
              <asp:BoundField DataField="Module_ID" HeaderText="Module_ID" SortExpression="Module_ID"
                                Visible="False" />
              <asp:BoundField DataField="User_Group_Id" HeaderText="User_Group_Id" SortExpression="User_Group_Id"
                                Visible="False" />
              <asp:TemplateField>
                <ItemTemplate>
                  <asp:ImageButton ID="ImageButton_Delete" runat="server" CommandName="Delete" ImageUrl="~/images/icon_delete.gif"
                                        OnClientClick="return confirmation(this)" />
                </ItemTemplate>
              </asp:TemplateField>
              </Columns>
              <AlternatingRowStyle CssClass="GridAltItem" />
        </asp:GridView>
            <br />
     
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">

        $(document).ready(function () {
            $('#btnAddGroup').live('click', function (e) {
                e.preventDefault();

                $("#dvAddGroup").dialog("destroy");

                //$(function () {
                    $('#dvAddGroup').dialog({
                        autoOpen: false,
                        modal: true,
                        dialogClass: 'dialog',
                        width: 700,
                        height: 550,
                        hide: {
                            effect: "clip",
                            duration: 500
                        }


                        

                    });
                //});
                    $('#dvAddGroup').dialog('open').parent().appendTo($("#form1"));
                //alert("www");
                //if ($('#form1').find($('#dvAddGroup').dialog()).length) {
                //    alert("1");
                //    $('#form1 #dvAddGroup').dialog('open');
                //}
                //else {
                //    alert("2");
                    
                //    $('#dvAddGroup').dialog('open').parent().appendTo($("#form1"));
                //}
            });

            $('#<%= btnClose.ClientID %>').live('click', function (e) {
                e.preventDefault();
                $('#dvAddGroup').dialog('close');
            });

        });//End of ready function
    </script>

 
    
    <div id="dvAddGroup" title="Add User Group"  style="display:none;">

   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

        <table class="tbl_form">
            <tr>
                <td>
                    Group Name
                </td>
                <td>
                    <asp:TextBox ID="txtGN" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Description
                </td>
                <td>
                    <asp:TextBox ID="txtDes" runat="server"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td>Deshboard</td>
                <td>
                    <asp:TextBox ID="txtDBPage" runat="server" CssClass="Integer"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Priority</td>
                <td>
                    <asp:TextBox ID="txtGpLevel" runat="server" CssClass="Integer"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:LinkButton ID="btnSaveGroup" CssClass="btn btn-info" runat="server" OnClick="btnSaveGroup_Click">Save</asp:LinkButton><asp:LinkButton ID="btnClose" CssClass="btn btn-info" runat="server">Cancel</asp:LinkButton>
                </td>
            </tr>
        </table>
        <div>
            <asp:GridView ID="gvUserGroup" runat="server" CssClass="abGrid" AutoGenerateColumns="False" DataKeyNames="User_Group_Id" DataSourceID="SqlDataSourceGroupName">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="Group_Level" HeaderText="Priority" SortExpression="Group_Level" >
                    <ControlStyle CssClass="Integer" Width="30px" />
                    
                    </asp:BoundField>
                    <asp:BoundField DataField="User_Group_Name" HeaderText="User Group" SortExpression="User_Group_Name" />
                    <asp:BoundField DataField="StrDescription" HeaderText="Description" SortExpression="StrDescription" />
                    <asp:BoundField DataField="MP" HeaderText="Description" SortExpression="MP" />
                </Columns>
            </asp:GridView>
        </div>

 </ContentTemplate>
    </asp:UpdatePanel>

    </div>
               
    
</asp:Content>
