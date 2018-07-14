using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tc.Common;

namespace Tc.WebAdmin.root.anli
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
            if (id == 0)
            {
                id = -MyID;
            }
            types = Request.QueryString["types"].GetString();
            if (!IsPostBack)
            {
                using (MAction action = new MAction("TcTupian"))
                {
                    action.Delete("fid=-" + MyID);
                }

                ddl_fenleiid.SetDataSource(LibCache.get_fenlei_dt("types='" + types + "'"));
                ddl_fenleiid.Items.Insert(0, LibZidian.get_default_item());

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
                        content = action.Data["content"].GetString();
                        if (action.Data["Tupian"].GetString().Length > 0)
                            tupian = LibFile.get_img(action.Data["Tupian"].GetString(), "", "");

                        bindtp();
                    }
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            using (MAction action = new MAction("TcArticle"))
            {
                action.UI.SetAutoPrefix("txt_", "ddl_");
                var content = Request.Form["Editor1"].GetString().FilterSql();
                action.Set("Content", content);
                action.Set("Jianyao", content.DeleteHMTL().Subs(180));

                action.Set("seotitle", txt_seotitle.Text.Replace("，", ","));
                if (filefm.HasFile)
                {
                    action.Set("Tupian", LibFile.ProcessTupian(filefm));
                }

                if (id > 0)
                {
                    action.Update("id=" + id, true);
                }
                else
                {
                    action.Set("Types", types);
                    action.Set("addtime", DateTime.Now);
                    action.Insert(true);

                    id = action.Data["id"].GetInt();
                }

                using (MProc proc = new MProc("update tctupian set fid=" + id + " where TabName='TcArticle' and Fid=-" + MyID))
                {
                    proc.ExeNonQuery();
                }

                alert("保存成功！", "list.aspx?types=" + types);
            }
        }

        #region 图片操作

        protected void lbtnDel_Click(object sender, EventArgs e)
        {
            var lbtn = sender as LinkButton;
            if (lbtn != null)
            {
                var id = lbtn.CommandArgument.GetInt();
                using (MAction action = new MAction("TcTupian"))
                {
                    action.Delete(id);
                }
                this.LoadData();//重新绑定
            }
        }

        private void bindtp()
        {
            using (MAction action = new MAction("Tctupian"))
            {
                action.Select("TabName='TcArticle' and fid=" + id).Bind(this.rp_tupian);
            }
        }

        protected void btn_re_bind_Click(object sender, EventArgs e)
        {
            bindtp();
        }

        #endregion 图片操作
    }
}