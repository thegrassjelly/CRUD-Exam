<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h1>Edit User</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12">
                        <div id="error" runat="server" class="alert alert-danger" visible="false">
                            User with the same email address has already been added.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Main Information</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-form-label col-lg-3">User Type</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="ddlTypes" runat="server" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-lg-3">First Name</label>
                                    <div class="col-lg-6">
                                        <asp:TextBox ID="txtFN" runat="server" class="form-control" />
                                        <asp:RegularExpressionValidator ID="fnVld" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtFN"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid name" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-lg-3">Last Name</label>
                                    <div class="col-lg-6">
                                        <asp:TextBox ID="txtLN" runat="server" class="form-control" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtLN"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid name" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-lg-3">Birthday</label>
                                    <div class="col-lg-6">
                                        <asp:TextBox ID="txtBday" class="form-control" runat="server" TextMode="Date" />
                                        <asp:RangeValidator ID="bdayVld" runat="server"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txtBday"
                                            ErrorMessage="Choose a valid date"
                                            MaximumValue="2020-01-01"
                                            MinimumValue="1900-01-01" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-lg-3">Email Address</label>
                                    <div class="col-lg-6">
                                        <asp:TextBox ID="txtEmail" class="form-control" TextMode="Email" runat="server" />
                                        <asp:RegularExpressionValidator ID="emlVld" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmail"
                                            ErrorMessage="Please enter valid e-mail address"
                                            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-lg-3">Status</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>Inactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Contact Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="float-right">
                                        <asp:Button ID="btnBack" class="btn btn-default" Text="Back" runat="server"
                                            OnClick="btnBack_OnClick" />
                                        <asp:Button ID="btnUpdate" class="btn btn-primary" Text="Update" runat="server"
                                            OnClick="btnUpdate_OnClick" />
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

