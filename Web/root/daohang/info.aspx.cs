using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tc.Common;

namespace Tc.Web.root.daohang
{
    public partial class info : Common.AdminBase
    {
        public string types = "";
        public int id = 0;
        public string content = "";

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
                        action.UI.SetAutoPrefix("txt_", "ddl_");
                        action.UI.SetToAll(this);
                        content = action.Data["content"].GetString();
                    }
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (txt_Name.Text.Trim().Length > 0)
            {
                using (MAction action = new MAction("TcFenlei"))
                {
                    action.UI.SetAutoPrefix("txt", "txt_", "ddl_");
                    action.Data.Set("types", types);
                    action.Data.Set("url", txt_Url.Text);

                    if (id > 0)
                    {
                        action.Update("id=" + id, true);
                    }
                    else
                    {
                        action.Insert(true);
                    }
                    LibCache.remove();
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