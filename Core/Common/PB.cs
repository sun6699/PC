using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tc.Common
{
    public class PB
    {
        #region 获取网站配置

        public static string Get(string key)
        {
            return Get(key, "web");
        }

        public static string Get(string key, string types)
        {
            var s = "";
            var list = new List<Model.TcConfig>();
            if (HttpContext.Current.Cache["wangzhanpeizhilist"] == null)
            {
                list = new Model.TcConfig().Select().ToList<Model.TcConfig>();
                HttpContext.Current.Cache.Insert("wangzhanpeizhilist", list, null, DateTime.Now.AddHours(1), TimeSpan.Zero);
            }
            else
            {
                list = (List<Model.TcConfig>)HttpContext.Current.Cache["wangzhanpeizhilist"];
            }
            var mlist = list.Where(p => p.Ename == key && p.Types == types);//应该就只有一个值的
            foreach (Model.TcConfig item in mlist)
            {
                s = item.Content;
            }
            return s;
        }

        #endregion 获取网站配置

        #region 获取幻灯片图片

        /// <summary>
        /// 获取幻灯片
        /// </summary>
        /// <param name="types"></param>
        /// <returns></returns>
        public static List<Tc.Model.TcArticle> get_huandong(string types)
        {
            return new Model.TcArticle().Select("types = '" + types + "'").ToList<Model.TcArticle>();
        }

        #endregion 获取幻灯片图片

        #region 获取产品

        /// <summary>
        /// 获取产品
        /// </summary>
        /// <param name="top"></param>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public static List<Tc.Model.TcArticle> get_chanpin(int top, string where, string order)
        {
            if (where.Length > 0)
                where = " and types='c'";
            else
                where = " types='c'";

            if (order.Length > 0)
            {
                order = " order by " + order;
            }

            return new Model.TcArticle().Select(top, where + " " + order).ToList<Model.TcArticle>();
        }

        #endregion 获取产品

        #region 获取文章资讯

        /// <summary>
        /// 获取文章资讯
        /// </summary>
        /// <param name="top"></param>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public static List<Tc.Model.TcArticle> get_article(int top, string where, string order)
        {
            return new Model.TcArticle().Select(top, where + " order by " + order).ToList<Model.TcArticle>();
        }

        #endregion 获取文章资讯

        #region 获取单页内容

        /// <summary>
        /// 获取单页内容，自动删除html代码
        /// </summary>
        /// <param name="ename"></param>
        /// <returns></returns>
        public static string get_danye(string ename)
        {
            return get_danye_withhtml(ename).DeleteHMTL();
        }

        /// <summary>
        /// 获取单页内容
        /// </summary>
        /// <param name="ename"></param>
        /// <returns></returns>
        public static Model.TcArticle get_danye_model(string ename)
        {
            var md = new Model.TcArticle();
            if (md.Fill("url='" + ename + "'"))
            {
                return md;
            }
            else
            {
                return new Model.TcArticle();
            }
        }

        /// <summary>
        /// 获取单页列表
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public static List<Model.TcArticle> get_danye_list(string where)
        {
            return new Model.TcArticle().Select(where).ToList<Model.TcArticle>();
        }

        /// <summary>
        /// 获取单页内容，保留html代码
        /// </summary>
        /// <param name="ename"></param>
        /// <returns></returns>
        public static string get_danye_withhtml(string ename)
        {
            return get_danye_model(ename).Content;
        }

        #endregion 获取单页内容

        #region 获取友情连接

        /// <summary>
        /// 获取友情连接
        /// </summary>
        /// <param name="top"></param>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public static List<Tc.Model.TcArticle> get_links(int top, string where)
        {
            return new Model.TcArticle().Select(top, where).ToList<Model.TcArticle>();
        }

        #endregion 获取友情连接

        #region 获取广告内容

        /// <summary>
        /// 获取广告内容
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string get_ad(string url)
        {
            var md = new Model.TcArticle();
            if (md.Fill("url='" + url + "'"))
            {
                return md.Content;
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 根据标题获取广告名称
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static Model.TcArticle get_ad_md(string url)
        {
            var md = new Model.TcArticle();
            if (md.Fill("url='" + url + "'"))
            {
                return md;
            }
            else
            {
                return new Model.TcArticle();
            }
        }

        #endregion 获取广告内容

        #region 获取上一篇下一篇

        /// <summary>
        /// 获取上一篇
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Model.TcArticle get_prev_article(int id)
        {
            return get_prev_article(id, "a");
        }

        /// <summary>
        /// 获取下一篇
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Model.TcArticle get_next_article(int id)
        {
            return get_next_article(id, "a");
        }

        /// <summary>
        /// 获取上一篇
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Model.TcArticle get_prev_article(int id, string types)
        {
            var list = get_article(1, "types='" + types + "' and id<" + id, "id desc");
            var m = new Model.TcArticle() { ID = 0 };
            if (list.Count > 0)
            {
                m = list[0];
            }
            return m;
        }

        /// <summary>
        /// 获取下一篇
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Model.TcArticle get_next_article(int id, string types)
        {
            var list = get_article(1, "types='" + types + "' and id>" + id, "id");
            var m = new Model.TcArticle() { ID = 0 };
            if (list.Count > 0)
            {
                m = list[0];
            }
            return m;
        }

        /// <summary>
        /// 获取上一篇
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Model.TcArticle get_prev_article(int id, string types, string where)
        {
            if (where.Length > 0)
                where = " and " + where;
            var list = get_article(1, "types='" + types + "' and id<" + id + where, "id desc");
            var m = new Model.TcArticle() { ID = 0 };
            if (list.Count > 0)
            {
                m = list[0];
            }
            return m;
        }

        /// <summary>
        /// 获取下一篇
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Model.TcArticle get_next_article(int id, string types, string where)
        {
            if (where.Length > 0)
                where = " and " + where;
            var list = get_article(1, "types='" + types + "' and id>" + id + where, "id");
            var m = new Model.TcArticle() { ID = 0 };
            if (list.Count > 0)
            {
                m = list[0];
            }
            return m;
        }

        #endregion 获取上一篇下一篇

        #region 获取分类及子分类的where条件

        /// <summary>
        /// 获取分类及子分类的where条件
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        public static string get_fenlei_and_child(int pid)
        {
            var listcid = LibFenlei.GetFenlei("pid=" + pid);
            var where = "";
            var list = new List<string>();
            if (listcid.Count > 0)
            {
                listcid.ForEach(p =>
                {
                    list.Add(p.ID.ToString());
                });
            }
            list.Add(pid.ToString());
            where = " fenleiid in (" + string.Join(",", list.ToArray()) + ") ";
            return where;
        }

        #endregion 获取分类及子分类的where条件

        #region 获取图片集

        public static List<Tc.Model.TcTupian> get_tupianlist(int fid)
        {
            return new Model.TcTupian().Select("Fid=" + fid).ToList<Model.TcTupian>();
        }

        #endregion
    }
}