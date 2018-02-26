<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="FRDP.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Button" OnClick="Button1_Click" />


     <asp:DropDownList ID="ddlReq" ClientIDMode="Static" style="width:265px;" runat="server" DataSourceID="SDddlReq" DataTextField="tblInvReqNo" DataValueField="tblInvReqMainID"></asp:DropDownList>
                                             <asp:SqlDataSource ID="SDddlReq" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblInvReqMainID, 'R' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT ('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo FROM tblInvReqMain WHERE (ApprovedRejectStatus = 'Approved') ORDER BY tblInvReqNo"></asp:SqlDataSource>
                 
    
    
                     
</asp:Content>
