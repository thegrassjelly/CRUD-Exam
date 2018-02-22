<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h1>Users List</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-2">
                                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_OnSelectedIndexChanged">
                                            <asp:ListItem Text="Active" Value="Active" />
                                            <asp:ListItem Text="Inactive" Value="Inactive" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-10">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtSearch" runat="server" class="form-control" Placeholder="Keyword..." />
                                            <div class="input-group-append">
                                                <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-primary" OnClick="btnSearch_Click">
                                                    Search
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <table class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Name</th>
                                                    <th>Email Address</th>
                                                    <th>User Type</th>
                                                    <th>Status</th>
                                                    <th>Date Added</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:ListView ID="lvUsers" runat="server"
                                                    OnPagePropertiesChanging="lvUsers_OnPagePropertiesChanging"
                                                    OnDataBound="lvUsers_OnDataBound" DataKeyNames="UserID">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("UserID") %></td>
                                                            <td><%# Eval("LastName") %>, <%# Eval("FirstName") %></td>
                                                            <td><%# Eval("Email") %></td>
                                                            <td><%# Eval("UserType") %></td>
                                                            <td>
                                                                <span class='<%# Eval("Status").ToString() == "Active" ?
                                                                        "label label-danger" : "label label-success"%>'>
                                                                    <%# Eval("Status") %>
                                                                </span>
                                                            </td>
                                                            <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                                            <td>
                                                                <a href='Details.aspx?ID=<%# Eval("UserID") %>'>
                                                                    <i class="fas fa-search"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <EmptyDataTemplate>
                                                        <tr>
                                                            <td colspan="10">
                                                                <h2 class="text-center">No users found.</h2>
                                                            </td>
                                                        </tr>
                                                    </EmptyDataTemplate>
                                                </asp:ListView>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <center>
                                    <asp:DataPager id="dpUsers" runat="server" PagedControlID="lvUsers">
                                        <Fields>
                                            <asp:NumericPagerField Buttontype="Button"
                                                                   NumericButtonCssClass="btn btn-default"
                                                                   CurrentPageLabelCssClass="btn btn-success"
                                                                   NextPreviousButtonCssClass ="btn btn-default" 
                                                                   ButtonCount="10"/>
                                        </Fields>
                                    </asp:DataPager>
                                </center>
                                <div class="form-group">
                                    <div class="float-right">
                                        <asp:Button ID="btnPrint" class="btn btn-success" Text="Print" runat="server"
                                            OnClick="btnPrint_OnClick" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

