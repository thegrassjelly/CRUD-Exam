using System;
using System.Data;
using System.Data.SqlClient;

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
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT UserID, FirstName, Lastname, Email, UserType, Status,
                DateAdded FROM Users
                WHERE (FirstName LIKE '" + keyword + "%' OR " +
                              "LastName LIKE '" + keyword + "%' OR " +
                              "Email LIKE '" + keyword + "%' OR " +
                              "UserType LIKE '" + keyword + "%' OR " +
                              "Status LIKE '" + keyword + "%') AND UserType = @usertype " +
                              "ORDER BY UserID ASC";
            cmd.Parameters.AddWithValue("@usertype", ddlType.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");
            lvUsers.DataSource = ds;
            lvUsers.DataBind();
        }
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void btnPrint_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("UserReports.aspx");
    }
}