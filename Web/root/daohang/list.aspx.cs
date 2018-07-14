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
    public partial class list : System.Web.UI.Page
    {
        public string types = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            types = Request.QueryString["types"].GetString();
            if (!IsPostBack)
            {
                bind();
            }
        }

        private void bind()
        {

            var where = "";

            var list = new List<string>() { "types='" + types + "'" };

            #region 设置条件

            var title = txt_title.Text.GetString().FilterSql();
            if (title.Length > 0)
                list.Add("Name like '%" + title + "%'");

            #endregion 设置条件

            where = string.Join(" and ", list);
            using (MAction action = new MAction("TcFenlei"))
            {
                action.Select(where + " order by paixu").Bind(this.rp_list);
            }
            LibCache.remove();
        }
        protected void btn_search_Click(object sender, EventArgs e)
        {
            bind();
        }

        /// <summary>
        /// 单个删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtnDel_Click(object sender, EventArgs e)
        {
            var lbtn = sender as LinkButton;
            if (lbtn != null)
            {
                var id = lbtn.CommandArgument.GetInt();
                using (MAction action = new MAction("TcFenlei"))
                {
                    action.Delete(id);
                }
                this.bind();//重新绑定
            }
        }

        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string strDels = Request.Form["aids"].GetString();
            if (strDels.Length > 0)
            {
                try
                {
                    using (MAction action = new MAction("TcFenlei"))
                    {
                        action.Delete("id in (" + strDels + ")");
                    }
                    ClientScript.RegisterClientScriptBlock(GetType(), "", "alert('删除成功');", true);
                }
                catch
                {
                    ClientScript.RegisterClientScriptBlock(GetType(), "", "alert('删除失败，请稍后尝试');", true);
                }
            }
            this.bind();//重新绑定
        }
    }
}