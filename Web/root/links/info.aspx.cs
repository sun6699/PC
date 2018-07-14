using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tc.Web.root.links
{
    public partial class info : Common.AdminBase
    {
        public string types = "";
        public int id = 0;
        public string tupian = "";
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
                using (MAction action = new MAction("TcArticle"))
                {
                    if (action.Fill(id))
                    {
                        action.UI.SetAutoPrefix("txt_", "ddl_");
                        action.UI.SetToAll(this);
                    }
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            var title = txt_title.Text.Trim().FilterSql();
            if (title.Length > 0)
            {
                using (MAction action = new MAction("TcArticle"))
                {
                    action.UI.SetAutoPrefix("txt_", "ddl_");

                    if (id > 0)
                    {
                        action.Update("id=" + id, true);
                    }
                    else
                    {
                        action.Set("Types", types);
                        action.Set("addtime", DateTime.Now);
                        action.Insert(true);
                    }
                    alert("保存成功！", "list.aspx?types=" + types);
                }
            }
            else
            {
                alert("请输入标题！");
            }
        }
    }
}