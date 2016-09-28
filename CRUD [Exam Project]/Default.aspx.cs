using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUsers(txtSearch.Text);
        }
        this.Form.DefaultButton = this.btnSearch.UniqueID;
    }

    void GetUsers(string keyword)
    {
       
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }
}