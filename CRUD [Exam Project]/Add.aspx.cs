using System;
using System.Data.SqlClient;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUserTypes();
        }
        this.Form.DefaultButton = this.btnInsert.UniqueID;
    }

    private void GetUserTypes()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TypeID, UserType FROM Types";
            using (var dr = cmd.ExecuteReader())
            {
                ddlTypes.DataSource = dr;
                ddlTypes.DataTextField = "UserType";
                ddlTypes.DataValueField = "TypeID";
                ddlTypes.DataBind();
            }
        }
    }

    protected void btnInsert_OnClick(object sender, EventArgs e)
    {
        if (!IsExist(txtEmail.Text))
        {
            using (var con = new SqlConnection(Helper.GetCon()))
            using (var cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO Users VALUES " +
                                  "(@FirstName, @LastName, @Birthday, @Email, @TypeID, @Status, " +
                                  "@DateAdded)";
                cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLN.Text);
                cmd.Parameters.AddWithValue("@Birthday", txtBday.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                cmd.Parameters.AddWithValue("@TypeID", ddlTypes.SelectedValue);
                cmd.ExecuteNonQuery();

                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            error.Visible = true;
        }
    }

    private bool IsExist(string text)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Email FROM Users WHERE Email = @Email";
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            using (var data = cmd.ExecuteReader())
            {
                bool existing = data.HasRows;
                return existing;
            }
        }
    }

    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}