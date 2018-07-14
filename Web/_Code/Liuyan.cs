using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tc.UI
{
    public class Liuyan : UIBase
    {
        public string res = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var ac = Request.QueryString["ac"].GetString();
                if (ac == "ac")
                {
                    res = "2";
                    try
                    {
                        var code = Request.Form["vcode"].GetString();
                        if (code == Session["vcode"].GetString())
                        {
                            using (MAction action = new MAction("TcLiuyan"))
                            {
                                action.Set("Xingming", Request.Form["Xingming"].GetString().FilterSql());
                                action.Set("RukuSj", DateTime.Now);
                                action.Set("QQ", Request.Form["QQ"].GetString().FilterSql());
                                action.Set("Neirong", Request.Form["Neirong"].GetString().FilterSql());
                                action.Set("Email", Request.Form["Email"].GetString().FilterSql());
                                action.Set("Dianhua", Request.Form["Dianhua"].GetString().FilterSql());
                                action.Insert();
                                var id = action.Data["id"].GetInt();
                                if (id > 0)
                                {
                                    res = "1";
                                }
                            }
                        }
                    }
                    catch
                    {
                    }
                }
            }
        }
    }
}