using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tc.WebAdmin.root.zidian
{
    public partial class info : Common.AdminBase
    {
        public string types = "";
        public int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"].GetInt();
            types = Request.QueryString["types"].GetString();
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            if (id > 0)
            {
                using (MAction action = new MAction("TcFenlei"))
                {
                    if (action.Fill(id))
                    {
                        action.UI.SetToAll(this);
                    }
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim().Length > 0)
            {
                using (MAction action = new MAction("TcFenlei"))
                {
                    action.Data.Set("types", types);
                    action.Set("name", txtName.Text.GetString());
                    action.Set("paixu", txtPaixu.Text.GetInt());
                    if (id > 0)
                    {
                        action.Update("id=" + id);
                    }
                    else
                    {
                        action.Insert();
                    }
                    alert("保存成功", "list.aspx?types=" + types);
                }
            }
            else
            {
                alert("请输入名称！");
            }
        }
    }
}