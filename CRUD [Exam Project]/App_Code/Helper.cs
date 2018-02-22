using System.Configuration;

public class Helper
{
    public Helper()
    {

    }

    public static string GetCon()
    {
        return ConfigurationManager.ConnectionStrings["CrudCon"].ConnectionString;
    }
}