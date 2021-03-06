﻿using System;
using CrystalDecisions.CrystalReports.Engine;

public partial class UserReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetUsers();
    }

    void GetUsers()
    {
        ReportDocument report = new ReportDocument();
        report.Load(Server.MapPath("rptUsers.rpt"));
        report.DataSourceConnections[0].SetConnection(@"VOUS-PC\SQLDEV17", "dbCrud", "sa", "windows7");
        crvUsers.ReportSource = report;
        crvUsers.DataBind();
    }
}