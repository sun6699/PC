using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tc.Common;

namespace Tc.WebAdmin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.RemoveAll();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = this.txt_name.Text.FilterSql();
            string pwd = DEncrypt.Md5(this.txt_pwd.Text.FilterSql());
            if (name.Length > 0 && pwd.Length > 0)
            {
                var user = new Tc.Model.TcAdmin();
                if (user.Fill("name='" + name + "'"))
                {
                    if (user.Pwd == pwd)
                    {
                        Session[LibAdmin.Session_admin] = user;

                        Response.Redirect("main.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "login", "alert('用户名或密码错误！请重新尝试！')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "login", "alert('用户名或密码错误！请重新尝试！')", true);
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "login", "alert('请输入用户名和密码')", true);
            }
        }
    }
}