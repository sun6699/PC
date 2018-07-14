using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Tc.UI
{
    public class ArtInfo : UIBase
    {
        protected Model.TcArticle art = new Model.TcArticle();
        protected Model.TcFenlei cate = new Model.TcFenlei() { Name = "" };
        public string types = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
            var types = Request.QueryString["types"];
            if (Request.QueryInt("prev") > 0)
            {
                BindPrev(types);
            }
            if (Request.QueryInt("next") > 0)
            {
                BindNext(types);
            }
        }

        public void BindNext(string types)
        {
            var id = Request.QueryInt("id");
            List<Model.TcArticle> lspd = art.Select(1, " types='"+types+"' order by id desc").ToList<Model.TcArticle>();
            if (lspd[0].ID != id)
            {
                List<Model.TcArticle> ls = art.Select(1, " types='" + types + "' and id>" + id + " order by id").ToList<Model.TcArticle>();
                art = ls[0];
            }
        }
        public void BindPrev(string types)
        {
            var id = Request.QueryInt("id");
            List<Model.TcArticle> lspd = art.Select(1, " types='" + types + "' order by id").ToList<Model.TcArticle>();
            if (lspd[0].ID != id)
            {
                List<Model.TcArticle> ls = art.Select(1, " types='" + types + "' and id<" + id + " order by id desc").ToList<Model.TcArticle>();
                art = ls[0];
            }
        }

        public void LoadData()
        {
            var id = Request.QueryInt("id");
            if (id > 0)
            {
                if (art.Fill(id))
                {
                    art.Click = art.Click.GetInt() + 1;
                    art.Update("id=" + id);

                    if (cate.Fill(art.Fenleiid))
                    {
                    }
                    else
                    {
                        cate = new Model.TcFenlei() { Name = "" };
                    }
                }
                else
                {
                    art = new Model.TcArticle();
                }
            }
        }
    }
}