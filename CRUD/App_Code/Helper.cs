using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

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