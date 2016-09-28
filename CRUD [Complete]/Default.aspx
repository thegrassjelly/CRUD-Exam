<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h1>Users List</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlType" runat="server" class="form-control"
                                        AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                        <asp:ListItem>Guest</asp:ListItem>
                                        <asp:ListItem>Client</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-1 pull-right">
                                <div class="btn-group">
                                    <asp:LinkButton ID="btnPrint" class="btn btn-default" Text="Print" runat="server" 
                                        OnClick="btnPrint_OnClick"/>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearch" runat="server" class="form-control"
                                        placeholder="Keyword..." />
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-default"
                                            OnClick="btnSearch_Click">
                                      <i class="glyphicon glyphicon-search"></i>
                                        </asp:LinkButton>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>User Type</th>
                                        <th>Status</th>
                                        <th>Date Added</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="lvUsers" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("UserID") %> </td>
                                                <td><%# Eval("FirstName") %> </td>
                                                <td><%# Eval("LastName") %> </td>
                                                <td><%# Eval("Email") %> </td>
                                                <td><%# Eval("UserType") %> </td>
                                                <td><%# Eval("Status") %> </td>
                                                <td><%# Eval("DateAdded") %> </td>
                                                <td>
                                                    <a href='Update.aspx?ID=<%# Eval("UserID") %>'>
                                                        <asp:Label runat="server" ToolTip="Show Info"><i class="glyphicon glyphicon-search"></i></asp:Label></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <tr>
                                                <td colspan="10">
                                                    <h2 class="text-center">No records found.</h2>
                                                </td>
                                            </tr>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

