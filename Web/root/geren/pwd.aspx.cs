using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tc.WebAdmin.root.config
{
    public partial class pwd : Common.AdminBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            var oldpwd = txt_oldpwd.Text.GetString();
            var newpwd = txt_newpwd.Text.GetString();
            var newpwd2 = txt_newpwd2.Text.GetString();
            Model.TcAdmin admin = Common.LibAdmin.GetCurrentAdmin();
            if (admin != null)
            {
                if (admin.Pwd.GetString() == DEncrypt.Md5(oldpwd))
                {
                    if (newpwd.Equals(newpwd2))
                    {
                        admin.Pwd = DEncrypt.Md5(newpwd);
                        admin.Update("id=" + MyID);
                        alert("保存成功！");
                    }
                    else
                    {
                        alert("确认密码与新密码不匹配，请重新输入");
                    }
                }
                else
                {
                    alert("原密码输入不正确，请重新输入");
                }
            }
        }
    }
}