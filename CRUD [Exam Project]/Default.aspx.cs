using System;
using System.Data;
using System.Data.SqlClient;
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
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT Users.UserID, Users.FirstName, Users.LastName,
                Users.Email, Types.UserType, Users.Status, Users.DateAdded
                FROM Users INNER JOIN Types ON Users.TypeID = Types.TypeID
                WHERE (Users.UserID LIKE @keyword OR
                Users.FirstName LIKE @keyword OR
                Users.LastName LIKE @keyword OR
                Users.Email LIKE @keyword OR
                Users.Status LIKE @keyword OR
                Users.DateAdded LIKE @keyword OR
                Types.UserType LIKE @keyword) AND Users.Status = @status
                ORDER BY Users.UserID DESC";
            cmd.Parameters.AddWithValue("@keyword", "%" + keyword.Trim() + "%");
            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Users");
            lvUsers.DataSource = ds;
            lvUsers.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void ddlStatus_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void lvUsers_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpUsers.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetUsers(txtSearch.Text);
    }

    protected void lvUsers_OnDataBound(object sender, EventArgs e)
    {
        dpUsers.Visible = dpUsers.PageSize < dpUsers.TotalRowCount;
    }

    protected void btnPrint_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("UserReports.aspx");
    }
}