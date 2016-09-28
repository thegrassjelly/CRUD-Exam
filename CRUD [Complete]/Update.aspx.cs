using System;
using System.Data;
using System.Data.SqlClient;

public partial class Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int userID = 0;
            bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out userID);

            if (validUser)
            {
                if (!IsPostBack)
                {
                    GetUserInfo(userID);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    private void GetUserInfo(int userId)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT FirstName, LastName, Birthday, Email, UserType, Status
                FROM Users WHERE UserID = @UserID";
            cmd.Parameters.AddWithValue("@UserID", userId);
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtFirstName.Text = dr["FirstName"].ToString();
                        txtLastName.Text = dr["LastName"].ToString();
                        DateTime bday = Convert.ToDateTime(dr["Birthday"]);
                        txtBirthday.Text = bday.ToString("yyyy-MM-dd");
                        txtEmail.Text = dr["Email"].ToString();
                        ddlUserType.SelectedValue = dr["UserType"].ToString();
                        ddlStatus.SelectedValue = dr["Status"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }

    protected void btnUpdate_OnClick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"UPDATE Users SET FirstName = @FirstName, LastName = @LastName, Birthday = @Birthday,
                Email = @Email, UserType = @UserType, Status = @Status WHERE UserID = @UserID";
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"]);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Birthday", txtBirthday.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            cmd.ExecuteNonQuery();
            Response.Redirect("Default.aspx");
        }
    }
}