<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h1>Add Users</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="row">
            <div class="col-lg-12">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div id="error" runat="server" class="alert alert-danger" visible="false">
                            User with the same email address has already been added.
                        </div>                    
                    </ContentTemplate>
                </asp:UpdatePanel>
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
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlTypes" runat="server" class="form-control"/>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3">First Name</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtFN" runat="server" class="form-control" MaxLength="80" />
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
                                <asp:TextBox ID="txtLN" runat="server" class="form-control" MaxLength="80" />
                                <asp:RegularExpressionValidator ID="lnVld" runat="server"
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
                                <asp:TextBox ID="txtEmail" class="form-control" TextMode="Email" runat="server" MaxLength="80" />
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
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3">Something</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtSomething" runat="server" class="form-control" MaxLength="80" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="float-right">
                                <asp:Button ID="btnBack" class="btn btn-default" Text="Back" runat="server"
                                            OnClick="btnBack_OnClick"/>
                                <asp:Button ID="btnInsert" runat="server" class="btn btn-primary" Text="Submit"
                                            OnClick="btnInsert_OnClick" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

