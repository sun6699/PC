using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Tc.UI
{
    public class ArtList : UIBase
    {
        public string types = "a";
        public Model.TcFenlei cate = new Model.TcFenlei() { Name = "" };
        public DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void aspnetpage_PageChanged(object sender, EventArgs e)
        {
            var aspnetpage = sender as Wuqi.Webdiyer.AspNetPager;
            int cid = Request.QueryString["c"].GetInt();
            var where = "types='" + types + "'";

            #region 设置条件

            if (cid > 0)
            {
                where += " and Fenleiid=" + cid;

                if (cate.Fill(cid))
                {
                }
                else
                {
                    cate = new Model.TcFenlei() { Name = "" };
                }
            }

            #endregion 设置条件

            int currentPage = Request.QueryString["page"].GetInt();
            if (currentPage <= 0)
            {
                currentPage = 1;
            }

            var sumcount = 0;
            dt = new Model.TcArticle().Select(currentPage, aspnetpage.PageSize, where + " order by addtime desc", out sumcount).ToDataTable();
            aspnetpage.RecordCount = sumcount;
        }
    }
}