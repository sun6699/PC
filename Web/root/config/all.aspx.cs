using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tc.Common;

namespace Tc.WebAdmin.root.config
{
    public partial class all : Common.AdminBase
    {
        public string weblogo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            DataTable dt = new Model.TcConfig().Select("types='web'").ToDataTable();
            foreach (DataRow item in dt.Rows)
            {
                var name = item["Ename"].GetString();
                var c = FindControl("txt_" + name) as TextBox;
                if (name == "weblogo")
                {
                    if (item["content"].GetString().Length > 0)
                        weblogo = LibFile.get_img(item["content"].GetString(), "", "");
                }
                if (c != null)
                {
                    c.Text = item["content"].GetString();
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            var list = new Model.TcConfig().Select("types='web'").ToList<Model.TcConfig>();
            foreach (var item in list)
            {
                var name = item.Ename.GetString();
                var c = FindControl("txt_" + name) as TextBox;
                if (c != null)
                {
                    item.Content = c.Text.GetString();
                    item.Update("id=" + item.ID);
                }
                if (filefm.HasFile && name == "weblogo")
                {
                    item.Content = LibFile.ProcessTupian(filefm);
                    item.Update("id=" + item.ID);
                }
            }

            Cache.Remove("wangzhanpeizhilist");

            alert("保存成功！");
        }
    }
}