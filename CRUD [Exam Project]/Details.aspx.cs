using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != "")
        {
            int userID = 0;
            bool isValid = int.TryParse(Request.QueryString["ID"], out userID);

            if (isValid)
            {
                if (!IsPostBack)
                {
                    GetUserTypes();
                    GetUserInfo(userID);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void GetUserInfo(int userId)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT TypeID, FirstName, LastName, Birthday,
                Email, Status FROM Users WHERE UserID = @id";
            cmd.Parameters.AddWithValue("id", userId);
            var dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlTypes.SelectedValue = dr["TypeID"].ToString();
                    ddlStatus.SelectedValue = dr["Status"].ToString();
                    txtFN.Text = dr["FirstName"].ToString();
                    txtLN.Text = dr["LastName"].ToString();
                    DateTime bDay = Convert.ToDateTime(dr["Birthday"].ToString());
                    txtBday.Text = bDay.ToString("yyyy-MM-dd");
                    txtEmail.Text = dr["Email"].ToString();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void GetUserTypes()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TypeID, UserType FROM Types";
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ddlTypes.Items.Add(new ListItem(dr["UserType"].ToString(), dr["TypeID"].ToString()));
            }
        }
    }

    protected void btnUpdate_OnClick(object sender, EventArgs e)
    {
        if (!IsExist())
        {
            using (var con = new SqlConnection(Helper.GetCon()))
            using (var cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"UPDATE Users SET FirstName = @FN, LastName = @LN,
                Birthday = @bday, Email = @email, Status = @status, TypeID = @typeid
                WHERE UserID = @id";
                cmd.Parameters.AddWithValue("@FN", txtFN.Text);
                cmd.Parameters.AddWithValue("@LN", txtLN.Text);
                cmd.Parameters.AddWithValue("@bday", txtBday.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@typeid", ddlTypes.SelectedValue);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["ID"]);
                cmd.ExecuteNonQuery();
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            error.Visible = true;
        }
    }

    private bool IsExist()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT Email FROM Users WHERE Email = @email
                AND UserID != @id";
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["ID"]);
            var dr = cmd.ExecuteReader();
            bool isExist = dr.HasRows;
            return isExist;
        }
    }

    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}