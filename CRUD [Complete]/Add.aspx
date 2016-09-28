<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h1>Add Users</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-3">First Name</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Last Name</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtLastName" runat="server" class="form-control" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Birthday</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtBirthday" runat="server" class="form-control" TextMode="Date" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Email</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">User Type</label>
                <div class="col-lg-6">
                    <asp:DropDownList ID="ddlUserType" runat="server" class="form-control" required>
                        <asp:ListItem>Guest</asp:ListItem>
                        <asp:ListItem>Client</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Status</label>
                <div class="col-lg-6">
                    <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" required>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                 <label class="control-label col-lg-3"></label>
                <div class="col-lg-6">
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_OnClick" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>

